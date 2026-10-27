package app.template.extension.pdb;

import app.template.extension.BuildConfig;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Framework-only helpers behind the "Morphe \u2014 Pdb Extras" tools screen.
 *
 * <p>No AndroidX type is referenced on purpose. Pdb's own Tweaks host fragment
 * implements neither {@code OnPreferenceStartScreenCallback} nor
 * {@code OnPreferenceStartFragmentCallback}, so nested {@code PreferenceScreen}s and
 * {@code android:fragment} rows are inert there (verified on device). The tools entry
 * therefore opens {@link PdbExtrasActivity}, a plain {@link android.app.Activity}.
 *
 * <p>{@code SwitchPreference} rows are unaffected by that limitation: their toggle
 * happens in {@code Preference.onClick()}, before the host is ever consulted.
 */
public final class PdbTools {

    private PdbTools() {}

    /* ── plumbing ── */

    public static SharedPreferences prefs(Context ctx) {
        return PdbSettings.prefs(ctx);
    }

    public static void toast(Context ctx, String message) {
        try {
            Toast.makeText(ctx.getApplicationContext(), message, Toast.LENGTH_LONG).show();
        } catch (Throwable ignored) {
        }
    }

    /**
     * Hard-restarts the Pdb app: relaunches the launcher intent fresh, then kills
     * this process. Used by switches that cannot apply live (decoration flags
     * re-read at view bind time, auth/session behaviour, app-icon swaps).
     */
    public static void restartApp(Activity activity) {
        try {
            android.content.Intent i = activity.getPackageManager()
                .getLaunchIntentForPackage(activity.getPackageName());
            if (i != null) {
                i.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                    | android.content.Intent.FLAG_ACTIVITY_CLEAR_TASK);
                activity.startActivity(i);
            }
        } catch (Throwable ignored) {
        }
        android.os.Process.killProcess(android.os.Process.myPid());
    }

    /**
     * Asks before restarting: "takes effect after restarting the app — restart
     * now?". [Restart now] relaunches Pdb; [Later] keeps the value pending.
     */
    public static void restartDialog(Activity activity) {
        try {
            new android.app.AlertDialog.Builder(activity)
                .setTitle("Morphe Extras")
                .setMessage("This change takes effect after restarting the app.\n\n"
                    + "Tap Restart now to apply it immediately.")
                .setPositiveButton("Restart now", (d, w) -> restartApp(activity))
                .setNegativeButton("Later", null)
                .show();
        } catch (Throwable t) {
            toast(activity, "Takes effect after restarting the app");
        }
    }

    /**
     * Opens (or falls back to) a 1:1 chat with a profile id — the "chat with a
     * past soul" action. Resolution order:
     * <ol>
     *     <li>the app's local IM database ({@code channel_members} ⋈
     *     {@code channels}) maps the user to an existing channel, opened
     *     through the app's own deep link {@code pdb://chat/{type}_{id}};</li>
     *     <li>no channel yet &rarr; the profile deep link {@code pdb://u/{id}}
     *     (the user taps Chat there; creating a channel needs a server call we
     *     deliberately do not fake from injected code).</li>
     * </ol>
     */
    public static void openChat(Activity activity, String userId) {
        try {
            if (userId == null || userId.trim().isEmpty()) {
                toast(activity, "No profile id");
                return;
            }
            String[] ch = PdbDatabase.channelForUser(activity, userId.trim());
            // The app's router (u8c.R) reads the FIRST PATH SEGMENT, so the
            // link needs a host: pdb://pdb.app/chat/{type}:{id}. Host-less
            // forms (pdb://chat/...) put the route in the URI authority and
            // fall through to the router's blank fallback — the "dead button".
            // Verified on device: pdb://pdb.app/u/{id} opens the profile.
            String link = (ch != null)
                ? "pdb://pdb.app/chat/" + ch[0] + ":" + ch[1]
                : "pdb://pdb.app/u/" + userId.trim();
            PdbNav.openLink(activity, link);
        } catch (Throwable t) {
            toast(activity, "Chat failed: " + t);
        }
    }

    public static void copyToClipboard(Context ctx, String text) {
        try {
            ClipboardManager cm = (ClipboardManager) ctx.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) cm.setPrimaryClip(ClipData.newPlainText("pdb-extras", text));
        } catch (Throwable ignored) {
        }
    }

    public static String readClipboard(Context ctx) {
        try {
            ClipboardManager cm = (ClipboardManager) ctx.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm == null || cm.getPrimaryClip() == null || cm.getPrimaryClip().getItemCount() == 0) {
                return null;
            }
            CharSequence cs = cm.getPrimaryClip().getItemAt(0).coerceToText(ctx);
            return cs == null ? null : cs.toString();
        } catch (Throwable ignored) {
            return null;
        }
    }

    /* ── status ── */

    /** Short header shown at the top of the tools screen. */
    public static String summary(Context ctx) {
        SharedPreferences sp = prefs(ctx);
        return "Pro unlocked \u00b7 Ads off \u00b7 Morphe " + (PdbSettings.getBool(sp, PdbSettings.GLOBAL_PAUSE, false) ? "paused" : "active");
    }

    private static String onOff(boolean value) {
        return value ? "ON" : "OFF";
    }

    /** Full {@code key = value} report for every switch, Morphe and Pdb alike. */
    public static String diagnostics(Context ctx) {
        SharedPreferences sp = prefs(ctx);
        StringBuilder sb = new StringBuilder("Morphe \u2014 Pdb Extras\n");
        for (String key : PdbSettings.ALL_KEYS) {
            sb.append("  ").append(key).append(" = ").append(value(sp, key)).append('\n');
        }
        sb.append("Pdb preferences\n");
        for (String key : PdbSettings.PDB_KEY_ORDER) {
            sb.append("  ").append(key).append(" = ").append(value(sp, key)).append('\n');
        }
        sb.append("MMKV stores (files/mmkv)\n");
        for (String id : PdbMmkv.ids()) {
            sb.append("  ").append(id).append(": ")
                .append(PdbMmkv.keys(id).size()).append(" key(s)\n");
        }
        for (String key : identityKeys()) {
            sb.append("  ").append(key).append(" = ").append(PdbMmkv.getString(key)).append('\n');
        }
        return sb.toString();
    }

    private static String value(SharedPreferences sp, String key) {
        Object v = sp.getAll().get(key);
        return v == null ? "(unset)" : String.valueOf(v);
    }

    /* ── settings actions ── */

    /** Every Morphe row, with its real type, as pretty JSON. */
    public static String exportJson(Context ctx) {
        try {
            SharedPreferences sp = prefs(ctx);
            JSONObject out = new JSONObject();
            for (String key : PdbSettings.ALL_KEYS) {
                Object v = sp.getAll().get(key);
                if (v != null) out.put(key, v);
            }
            return out.toString(2);
        } catch (Throwable t) {
            return "{}";
        }
    }

    /** @return how many values were restored. */
    public static int importJson(Context ctx, String json) {
        int restored = 0;
        try {
            JSONObject in = new JSONObject(json);
            SharedPreferences.Editor e = prefs(ctx).edit();
            for (Iterator<String> keys = in.keys(); keys.hasNext(); ) {
                String key = keys.next();
                if (!isMorpheKey(key)) continue;
                Object v = in.get(key);
                if (v instanceof Boolean) {
                    e.putBoolean(key, (Boolean) v);
                } else if (v instanceof Integer) {
                    e.putInt(key, (Integer) v);
                } else {
                    e.putString(key, String.valueOf(v));
                }
                restored++;
            }
            e.apply();
        } catch (Throwable ignored) {
        }
        return restored;
    }

    /** Preset: maximum privacy, paying nothing for it. Premium/ads stay patched on. */
    public static void applyPrivacyPreset(Context ctx) {
        prefs(ctx).edit()
            .putBoolean(PdbSettings.PRIVACY_RECEIPTS, true)
            .putBoolean(PdbSettings.PRIVACY_SEE_MORE, true)
            .putBoolean(PdbSettings.SHOW_FULL_ERROR, false)
            .putBoolean(PdbSettings.IM_CONNECT_TOAST, false)
            .apply();
    }

    /** Drop every Morphe key, so the next launch rewrites the packaged defaults. */
    public static void reset(Context ctx) {
        SharedPreferences.Editor e = prefs(ctx).edit();
        for (String key : PdbSettings.ALL_KEYS) e.remove(key);
        e.apply();
    }

    private static boolean isMorpheKey(String key) {
        for (String known : PdbSettings.ALL_KEYS) {
            if (known.equals(key)) return true;
        }
        return false;
    }

    /* ── quick pref writer ── */

    /**
     * Writes an arbitrary preference that Pdb reads. Same idea as the app's own hidden
     * {@code quick_tweak} row, but with type detection: {@code true}/{@code false} are
     * stored as booleans and integers as ints, because writing a boolean back as a
     * string makes the app throw {@code ClassCastException} when it reads it.
     *
     * @return a human-readable outcome.
     */
    public static String setPref(Context ctx, String rawKey, String rawValue) {
        String key = rawKey == null ? "" : rawKey.trim();
        if (key.isEmpty()) return "Set pref: a key is required.";
        String value = rawValue == null ? "" : rawValue;

        SharedPreferences.Editor e = prefs(ctx).edit();
        String type;
        if ("true".equalsIgnoreCase(value) || "false".equalsIgnoreCase(value)) {
            boolean b = Boolean.parseBoolean(value.toLowerCase(java.util.Locale.US));
            e.putBoolean(key, b);
            type = "boolean";
        } else if (isInt(value)) {
            e.putInt(key, Integer.parseInt(value));
            type = "int";
        } else {
            e.putString(key, value);
            type = "string";
        }
        e.apply();
        return "Set " + key + " = " + value + "  [" + type + "]\nRelaunch Pdb to apply.";
    }

    public static String deletePref(Context ctx, String rawKey) {
        String key = rawKey == null ? "" : rawKey.trim();
        if (key.isEmpty()) return "Delete key: a key is required.";
        prefs(ctx).edit().remove(key).apply();
        return "Removed " + key + ".";
    }

    /** Every key currently in {@code <package>_preferences}, sorted. */
    public static String prefsDump(Context ctx) {
        StringBuilder sb = new StringBuilder("Preferences of " + ctx.getPackageName() + "\n");
        try {
            Map<String, ?> all = prefs(ctx).getAll();
            List<String> keys = new java.util.ArrayList<>(all.keySet());
            java.util.Collections.sort(keys);
            for (String key : keys) {
                sb.append("  ").append(key).append(" = ").append(all.get(key)).append('\n');
            }
            sb.append(keys.size()).append(" key(s)\n");
        } catch (Throwable t) {
            sb.append("dump failed: ").append(t).append('\n');
        }
        return PdbDatabase.truncate(sb.toString());
    }

    private static boolean isInt(String value) {
        if (value == null || value.isEmpty()) return false;
        int i = 0;
        if (value.charAt(0) == '-') {
            if (value.length() == 1) return false;
            i = 1;
        }
        for (; i < value.length(); i++) {
            if (!Character.isDigit(value.charAt(i))) return false;
        }
        try {
            Integer.parseInt(value);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /* ── local data ── */

    public static String dbStats(Context ctx) {
        return PdbDatabase.stats(ctx);
    }

    public static String chatExport(Context ctx, String query, int limit) {
        return PdbDatabase.chats(ctx, query, limit);
    }

    public static String visitorLog(Context ctx, int limit) {
        return PdbDatabase.visitorLog(ctx, limit);
    }

    /* ── identity / transport (MMKV) ── */

    public static List<String> identityKeys() {
        List<String> keys = new java.util.ArrayList<>();
        keys.add(PdbMmkv.KEY_DEVICE_ID);
        keys.add(PdbMmkv.KEY_IM_SOCKET);
        keys.addAll(PdbMmkv.fakeLogoutKeys());
        return keys;
    }

    public static String deviceId() {
        String id = PdbMmkv.getString(PdbMmkv.KEY_DEVICE_ID);
        return id == null ? "(unset)" : id;
    }

    public static String imSocket() {
        String url = PdbMmkv.getString(PdbMmkv.KEY_IM_SOCKET);
        return url == null ? "(unset)" : url;
    }

    public static String setDeviceId(String value) {
        if (!PdbMmkv.available()) return "MMKV unavailable — open Pdb once, then retry.";
        String id = value == null ? "" : value.trim();
        if (id.isEmpty()) {
            PdbMmkv.remove(PdbMmkv.KEY_DEVICE_ID);
            return "Cleared XDeviceId; Pdb generates a fresh one on next launch.";
        }
        return PdbMmkv.putString(PdbMmkv.KEY_DEVICE_ID, id)
            ? "XDeviceId = " + id + "\nRestart Pdb to use it."
            : "Writing XDeviceId failed.";
    }

    public static String randomizeDeviceId() {
        return setDeviceId(PdbMmkv.newDeviceId());
    }

    public static String setImSocket(String value) {
        if (!PdbMmkv.available()) return "MMKV unavailable — open Pdb once, then retry.";
        String url = value == null ? "" : value.trim();
        if (url.isEmpty()) {
            PdbMmkv.remove(PdbMmkv.KEY_IM_SOCKET);
            return "Cleared the IM socket override; Pdb falls back to its own servers.";
        }
        return PdbMmkv.putString(PdbMmkv.KEY_IM_SOCKET, url)
            ? "chatCentrifugoWsUrl = " + url + "\nRestart Pdb to reconnect through it."
            : "Writing chatCentrifugoWsUrl failed.";
    }

    /** @return the {@code isFakeLogout<account>} keys and their values. */
    public static String fakeLogoutState() {
        List<String> keys = PdbMmkv.fakeLogoutKeys();
        if (keys.isEmpty()) return "(no isFakeLogout key)";
        StringBuilder sb = new StringBuilder();
        for (String key : keys) {
            sb.append(key).append(" = ").append(PdbMmkv.getBool(key, false)).append('\n');
        }
        return sb.toString().trim();
    }

    /**
     * Sets or clears the app's own {@code isFakeLogout<account>} flag. When set, Pdb
     * treats the next sign-out as a "fake" one and keeps the remembered Google auth,
     * which is what makes switching accounts and coming back cheap.
     */
    public static String setFakeLogout(boolean value) {
        if (!PdbMmkv.available()) return "MMKV unavailable — open Pdb once, then retry.";
        List<String> keys = PdbMmkv.fakeLogoutKeys();
        if (keys.isEmpty()) {
            // The app suffixes the flag with the account id, which it only writes after
            // a sign-out attempt; recreate the flag for every known account id instead.
            String id = PdbMmkv.getString(PdbMmkv.KEY_DEVICE_ID);
            if (id == null) return "No isFakeLogout key exists yet — sign out once, then retry.";
            keys = new java.util.ArrayList<>();
            keys.add(PdbMmkv.KEY_FAKE_LOGOUT_PREFIX + id);
        }
        for (String key : keys) PdbMmkv.putBool(key, value);
        return "isFakeLogout = " + value + " for " + keys.size() + " key(s)";
    }

    public static String mmkvDump(Context ctx) {
        return PdbMmkv.dumpAll(ctx);
    }
}
