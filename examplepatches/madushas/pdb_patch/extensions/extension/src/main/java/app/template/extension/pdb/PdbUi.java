package app.template.extension.pdb;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.GradientDrawable;
import android.text.InputType;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Builds Pdb-native widgets by reflecting into the app's own (kept) view classes —
 * {@code pdb.app.base.wigets.ActionCell} and {@code pdb.app.base.wigets.PBDTextView} —
 * so the extension's screens and injected rows are visually indistinguishable from
 * the app itself (same fonts, colors, dividers, switch styling, dark-mode support).
 *
 * <p>Every helper degrades to a plain framework widget when the app class or
 * resource is missing, so nothing here can crash the host.
 */
public final class PdbUi {

    private static final String ACTION_CELL = "pdb.app.base.wigets.ActionCell";
    private static final String PBD_TEXT_VIEW = "pdb.app.base.wigets.PBDTextView";

    /**
     * "IDs everywhere" — when true, the bytecode patch reroutes the profile model's
     * {@code name()} getter through {@link #decorateName(String, String)}, which
     * appends {@code " #id"} so every surface that renders a profile name (Soul
     * cards, chat headers, lists, the own drawer) shows the numeric profile id.
     *
     * <p>Written by {@link PdbStartup} at app start from the
     * {@code morphe_ids_everywhere} switch; read from patched bytecode, so it must
     * be {@code public} and {@code volatile}.
     */
    public static volatile boolean IDS_EVERYWHERE = false;

    /**
     * The last profile the app rendered, remembered by {@link #decorateName} so the
     * floating power button can offer "copy the profile you were just looking at"
     * without any extra hooks. Read/written from the main thread only.
     */
    public static volatile String LAST_PROFILE_ID = null;
    public static volatile String LAST_PROFILE_NAME = null;

    private PdbUi() {}

    /* ── patched-bytecode helpers ── */

    /**
     * Appends the profile id to a display name ("Camette" → "Camette #1234567").
     * Called from patched bytecode on every profile-name read, so it must be cheap
     * and must never throw (all failure modes return the input unchanged).
     */
    public static String decorateName(String name, String id) {
        return decorateName(name, id, null);
    }

    /**
     * Decorates a profile name with the numeric id and (when readable) status
     * badges next to the username, as compact glyphs:
     * U+2713 verified (manual/auto/face), U+2605 pro (real proStatus, not the
     * mock), U+25C6 moderator. The badge source is the profile object itself;
     * everything is reflective and try/caught per field, so an obfuscation
     * change degrades to the plain id decoration instead of breaking the app.
     */
    public static String decorateName(String name, String id, Object profile) {
        if (name != null && id != null && id.length() > 0) {
            LAST_PROFILE_ID = id;
            LAST_PROFILE_NAME = name;
            recordSoul("seen", id, name);
        }
        if (!IDS_EVERYWHERE || name == null || id == null || id.length() == 0) return name;
        if (name.length() == 0) return name;
        // Idempotent: callers may render an already-decorated name (recomposition,
        // cached models), never stack a second chip.
        if (name.endsWith("#" + id)) return name;
        return name + badges(profile) + " #" + id;
    }

    /** Reflective badge suffix; "" when nothing is readable. */
    private static String badges(Object profile) {
        if (profile == null) return "";
        StringBuilder sb = new StringBuilder();
        try {
            if (boolField(profile, "manualVerified") || boolField(profile, "autoVerified")
                || boolField(profile, "faceVerified")) {
                sb.append(" \u2713");
            }
        } catch (Throwable ignored) {
        }
        try {
            Object ps = field(profile, "proStatus");
            if (ps != null) {
                Object v = ps.getClass().getMethod("getIsPro").invoke(ps);
                if (Boolean.TRUE.equals(v)) sb.append(" \u2605");
            }
        } catch (Throwable ignored) {
        }
        try {
            if (boolField(profile, "_isMod") || boolField(profile, "isMod")) {
                sb.append(" \u25C6");
            }
        } catch (Throwable ignored) {
        }
        return sb.toString();
    }

    private static Object field(Object obj, String name) throws Exception {
        Class<?> c = obj.getClass();
        while (c != null) {
            try {
                java.lang.reflect.Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(obj);
            } catch (NoSuchFieldException ignored) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static boolean boolField(Object obj, String name) {
        try {
            Object v = field(obj, name);
            return Boolean.TRUE.equals(v);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /* ── soul history ──
     *
     * Every profile the app renders (soul cards, lists, chat headers) crosses
     * decorateName, so decorations double as a local history of who you saw.
     * Likes are marked by the SoulLikeHook patch (fires when the app queues
     * its vote for a card). Everything persists in the app's own MMKV store
     * under "morphe_soul_history" as a JSON array, newest first, capped at
     * HISTORY_MAX — fully local, invisible to the server, and unaffected by
     * the server's short feed window (the "20 soul limit").
     */

    private static final int HISTORY_MAX = 200;
    private static final String HISTORY_KEY = "morphe_soul_history";

    /** A history row: action, id, name, epoch-ms. action: seen | like. */
    public static final class SoulRow {
        public final String action, id, name;
        public final long ts;

        SoulRow(String action, String id, String name, long ts) {
            this.action = action; this.id = id; this.name = name; this.ts = ts;
        }
    }

    /** Records one history row; called from decorateName and the like hook. */
    public static void recordSoul(String action, String id, String name) {
        try {
            if (id == null || id.trim().isEmpty()) return;
            if (name == null || name.isEmpty()) name = "";
            id = id.trim();
            boolean like = "like".equals(action);
            long now = System.currentTimeMillis();
            if (!like && lastSeenId != null && lastSeenId.equals(id)
                && now - lastSeenTs < 30000) {
                lastSeenTs = now; // scroll churn — refresh the window only
                return;
            }
            lastSeenId = id;
            lastSeenTs = now;

            org.json.JSONArray arr = readHistory();
            org.json.JSONArray next = new org.json.JSONArray();
            int replaced = -1;
            for (int i = 0; i < arr.length() && replaced < 0; i++) {
                org.json.JSONObject o = arr.optJSONObject(i);
                if (o != null && id.equals(o.optString("id"))) replaced = i;
            }
            for (int i = 0; i < arr.length() && next.length() < HISTORY_MAX; i++) {
                if (i == replaced) continue;
                next.put(arr.get(i));
            }
            org.json.JSONObject row = new org.json.JSONObject()
                .put("a", like ? "like" : "seen").put("id", id)
                .put("n", name).put("t", now);
            if (replaced >= 0) {
                org.json.JSONObject old = arr.optJSONObject(replaced);
                if (old != null && "like".equals(old.optString("a")) && !like) {
                    row.put("a", "like"); // a like never decays back to seen
                }
            }
            next.put(row);
            PdbMmkv.putString(HISTORY_KEY, next.toString());
        } catch (Throwable ignored) {
        }
    }

    private static String lastSeenId;
    private static long lastSeenTs;

    /** Called by the SoulLikeHook patch at the app's like path (card object). */
    public static void recordSoulLike(Object card) {
        try {
            if (card == null) return;
            String id = null, name = null;
            for (java.lang.reflect.Field f : card.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object v;
                try { v = f.get(card); } catch (Throwable ignored) { continue; }
                if (v == null || v.getClass().isPrimitive()
                    || v instanceof String || v instanceof Number) continue;
                String vid = null, vname = null;
                try { vid = (String) v.getClass().getMethod("getId").invoke(v); }
                catch (Throwable ignored) { continue; }
                try {
                    vname = (String) v.getClass().getMethod("name").invoke(v);
                } catch (Throwable ignored) {
                    try { vname = (String) v.getClass().getMethod("getUsername").invoke(v); }
                    catch (Throwable ignored2) { }
                }
                if (vid != null && vname != null) { id = vid; name = vname; break; }
                if (id == null) { id = vid; }
            }
            if (id != null) recordSoul("like", id, name);
        } catch (Throwable ignored) {
        }
    }

    private static org.json.JSONArray readHistory() {
        try {
            String raw = PdbMmkv.getString(HISTORY_KEY);
            if (raw != null && raw.length() > 1) return new org.json.JSONArray(raw);
        } catch (Throwable ignored) {
        }
        return new org.json.JSONArray();
    }

    /** History rows, newest first. */
    public static java.util.List<SoulRow> soulHistory() {
        java.util.List<SoulRow> out = new java.util.ArrayList<>();
        org.json.JSONArray arr = readHistory();
        for (int i = 0; i < arr.length(); i++) {
            org.json.JSONObject o = arr.optJSONObject(i);
            if (o == null) continue;
            out.add(new SoulRow(o.optString("a", "seen"),
                o.optString("id"), o.optString("n"), o.optLong("t")));
        }
        return out;
    }

    /** "Soul history" dialog: recent profiles, tap to open, long-press to copy. */
    public static void showSoulHistory(final Activity activity) {
        try {
            java.util.List<SoulRow> rows = soulHistory();
            if (rows.isEmpty()) {
                PdbTools.toast(activity, "No soul history yet — swipe the Soul feed");
                return;
            }
            LinearLayout box = new LinearLayout(activity);
            box.setOrientation(LinearLayout.VERTICAL);
            int pad = PdbUi.dp(activity, 4);
            int shown = 0;
            for (final SoulRow r : rows) {
                if (shown++ >= 60) break;
                TextView tv = new TextView(activity);
                String when = android.text.format.DateUtils.getRelativeTimeSpanString(
                    r.ts).toString();
                tv.setText((r.action.equals("like") ? "\uD83E\uDDE1 " : "") + r.name
                    + "  #" + r.id + "\n" + when);
                tv.setTextSize(14);
                tv.setPadding(pad + PdbUi.dp(activity, 8), pad, pad, pad);
                tv.setOnClickListener(v -> PdbNav.openLink(activity, "pdb://pdb.app/u/" + r.id));
                tv.setOnLongClickListener(v -> {
                    PdbTools.copyToClipboard(activity, r.id);
                    PdbTools.toast(activity, "Copied " + r.id);
                    return true;
                });
                box.addView(tv);
            }
            android.widget.ScrollView sv = new android.widget.ScrollView(activity);
            sv.addView(box);
            new android.app.AlertDialog.Builder(activity)
                .setTitle("Soul history (local, newest first)")
                .setView(sv)
                .setPositiveButton("Close", null)
                .show();
        } catch (Throwable t) {
            PdbTools.toast(activity, "Soul history: " + t);
        }
    }

    /* ── resource lookups ── */

    public static int id(Context ctx, String name) {
        return ctx.getResources().getIdentifier(name, "id", ctx.getPackageName());
    }

    public static int dp(Context ctx, float value) {
        return Math.round(value * ctx.getResources().getDisplayMetrics().density);
    }

    /** Resource color by name, or {@code fallback} when missing. */
    public static int color(Context ctx, String name, int fallback) {
        int id = ctx.getResources().getIdentifier(name, "color", ctx.getPackageName());
        if (id == 0) return fallback;
        try {
            return ctx.getResources().getColor(id);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    /* ── Pdb's own widgets ── */

    /**
     * A native {@code ActionCell} settings row — the exact widget Pdb's Settings
     * screen uses (its {@code app:ac_text} / arrow / divider styling included).
     */
    public static View actionCell(Context ctx, String text, View.OnClickListener onClick) {
        try {
            Class<?> cls = Class.forName(ACTION_CELL);
            View view = (View) cls.getConstructor(Context.class).newInstance(ctx);
            try {
                cls.getMethod("setActionText", CharSequence.class).invoke(view, text);
            } catch (Throwable ignoredText) {
                // Very old builds: fall back to the two-arg setter l(String, boolean).
                try {
                    cls.getMethod("l", String.class, boolean.class).invoke(view, text, false);
                } catch (Throwable ignoredMore) {
                    if (view instanceof TextView) ((TextView) view).setText(text);
                }
            }
            view.setOnClickListener(wrap(onClick));
            return view;
        } catch (Throwable failed) {
            return plainRow(ctx, text, onClick);
        }
    }

    /** {@code PBDTextView} — the app's typeface/theme-aware text view. */
    public static TextView text(Context ctx, String value, float sp, String colorName, int fallbackColor) {
        try {
            Class<?> cls = Class.forName(PBD_TEXT_VIEW);
            TextView tv = (TextView) cls.getConstructor(Context.class).newInstance(ctx);
            tv.setText(value);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
            tv.setTextColor(color(ctx, colorName, fallbackColor));
            return tv;
        } catch (Throwable failed) {
            TextView tv = new TextView(ctx);
            tv.setText(value);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
            tv.setTextColor(color(ctx, colorName, fallbackColor));
            return tv;
        }
    }

    /** Gray section header, matching the Settings screen's 14sp {@code gray_04} labels. */
    public static TextView sectionLabel(Context ctx, String value) {
        TextView tv = text(ctx, value, 14, "gray_04", 0xFF8E8E93);
        tv.setPadding(0, dp(ctx, 22), 0, dp(ctx, 6));
        return tv;
    }

    /** Rounded card container ({@code content_bg_r8}), matching the Settings cards. */
    public static LinearLayout card(Context ctx) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.VERTICAL);
        try {
            int bg = ctx.getResources().getIdentifier("content_bg_r8", "drawable", ctx.getPackageName());
            if (bg != 0) {
                card.setBackgroundResource(bg);
            } else {
                GradientDrawable rounded = new GradientDrawable();
                rounded.setColor(color(ctx, "content_bg", 0xFFF2F2F7));
                rounded.setCornerRadius(dp(ctx, 8));
                card.setBackground(rounded);
            }
        } catch (Throwable ignored) {
            GradientDrawable rounded = new GradientDrawable();
            rounded.setColor(0xFFF2F2F7);
            rounded.setCornerRadius(dp(ctx, 8));
            card.setBackground(rounded);
        }
        return card;
    }

    /** A text button styled like Pdb's accent links. */
    public static TextView linkButton(Context ctx, String value, View.OnClickListener onClick) {
        TextView tv = text(ctx, value, 15, "main", 0xFF6C5CE7);
        tv.setPadding(dp(ctx, 16), dp(ctx, 12), dp(ctx, 16), dp(ctx, 12));
        tv.setOnClickListener(wrap(onClick));
        return tv;
    }

    /** Card margins helper: wrap a card for a vertical LinearLayout parent. */
    public static LinearLayout.LayoutParams cardParams(Context ctx) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins(dp(ctx, 12), dp(ctx, 8), dp(ctx, 12), 0);
        return lp;
    }

    /* ── fallbacks ── */

    private static View plainRow(Context ctx, String text, View.OnClickListener onClick) {
        TextView row = new TextView(ctx);
        row.setText(text);
        row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        row.setTextColor(color(ctx, "gray_01", 0xFF1C1C1E));
        int pad = dp(ctx, 14);
        row.setPadding(pad, pad, pad, pad);
        row.setOnClickListener(wrap(onClick));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(color(ctx, "content_bg", 0xFFF2F2F7));
        row.setBackground(bg);
        return row;
    }

    private static View.OnClickListener wrap(final View.OnClickListener onClick) {
        return new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    onClick.onClick(v);
                } catch (Throwable ignored) {
                }
            }
        };
    }

    /** Shorthand for reading a value out of {@link Resources} without crashing. */
    public static String string(Context ctx, String name, String fallback) {
        int id = ctx.getResources().getIdentifier(name, "string", ctx.getPackageName());
        if (id == 0) return fallback;
        try {
            return ctx.getString(id);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    /* ── input helpers ── */

    /** Single-line text input styled like the app's fields. */
    public static EditText field(Context ctx, String hint) {
        EditText edit = new EditText(ctx);
        edit.setHint(hint);
        edit.setSingleLine(true);
        edit.setInputType(InputType.TYPE_CLASS_TEXT);
        edit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        edit.setTextColor(color(ctx, "gray_01", 0xFF1C1C1E));
        int padH = dp(ctx, 14);
        edit.setPadding(padH, dp(ctx, 10), padH, dp(ctx, 10));
        return edit;
    }

    /** Vertical gap view. */
    public static View spacer(Context ctx, int heightDp) {
        View gap = new View(ctx);
        gap.setLayoutParams(new ViewGroup.LayoutParams(1, dp(ctx, heightDp)));
        return gap;
    }

    private static void setPadding(TextView tv, int pad) {
        tv.setPadding(pad, pad, pad, pad);
    }
}
