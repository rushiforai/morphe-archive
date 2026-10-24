package app.template.extension.pdb;

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
        if (name != null && id != null && id.length() > 0) {
            LAST_PROFILE_ID = id;
            LAST_PROFILE_NAME = name;
        }
        if (!IDS_EVERYWHERE || name == null || id == null || id.length() == 0) return name;
        if (name.length() == 0) return name;
        // Idempotent: callers may render an already-decorated name (recomposition,
        // cached models), never stack a second chip.
        if (name.endsWith("#" + id)) return name;
        return name + " #" + id;
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
