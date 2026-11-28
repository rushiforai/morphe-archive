package dev.jason.gboardpatches.extension.swiftkey;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;
import java.util.Map;

import dev.jason.gboardpatches.extension.clipboard.GboardClipboardSettings;
import dev.jason.gboardpatches.extension.keyboard.GboardRamblerKeyboardPrefs;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;
import dev.jason.gboardpatches.extension.shiftdelete.GboardShiftDeleteSettings;
import dev.jason.gboardpatches.extension.swipedismiss.GboardSwipeDismissSettings;

/**
 * Direct-Boot-safe settings store and reversible 1-tap preset controller for SwiftKey Mode.
 */
public final class GboardSwiftKeySettings {
    public static final String PREF_KEY_ENABLED = "pref_rambler_swiftkey_mode_enabled";
    public static final String PREF_KEY_SHIFT_CASE_ENABLED = "pref_rambler_swiftkey_shift_case_enabled";
    public static final String PREF_KEY_SHIFT_TRIGGER = "pref_rambler_swiftkey_shift_trigger";
    public static final String PREF_KEY_PUNCT_TRIM_ENABLED = "pref_rambler_swiftkey_punct_trim_enabled";
    public static final String PREF_KEY_SHORTCUTS_ENABLED = "pref_rambler_swiftkey_shortcuts_enabled";
    public static final String PREF_KEY_PRESET_APPLIED = "pref_rambler_swiftkey_preset_applied";
    public static final String PREF_KEY_PRESET_BACKUP = "pref_rambler_swiftkey_preset_backup_v1";

    public static final String TRIGGER_DOUBLE_TAP = "double_tap";
    public static final String TRIGGER_SINGLE_TAP = "single_tap";

    public static final boolean DEFAULT_ENABLED = false;
    public static final boolean DEFAULT_SHIFT_CASE_ENABLED = true;
    public static final String DEFAULT_SHIFT_TRIGGER = TRIGGER_DOUBLE_TAP;
    public static final boolean DEFAULT_PUNCT_TRIM_ENABLED = true;
    public static final boolean DEFAULT_SHORTCUTS_ENABLED = true;
    public static final boolean DEFAULT_PRESET_APPLIED = false;

    // Gboard native preference keys toggled by the reversible 1-tap SwiftKey Preset.
    static final String[] NATIVE_BOOL_KEYS = {
            "enable_number_row",
            "enable_secondary_symbols",
            "enable_autospace_after_punctuation",
            "enable_double_space_period",
            "pref_key_latin_enable_ac_revert"
    };
    static final String NATIVE_LONG_PRESS_KEY = "key_long_press_delay";
    static final int SWIFTKEY_LONG_PRESS_MS = 200;

    private static final String SHORTCUTS_STORE_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerSwiftKeyShortcutsStore";
    private static final String RAMBLER_SETTINGS_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerEnhancementsSettings";

    private GboardSwiftKeySettings() {
    }

    public static boolean readEnabled(Context context) {
        return readBool(context, PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        return writeBool(context, PREF_KEY_ENABLED, enabled);
    }

    public static boolean readShiftCaseEnabled(Context context) {
        return readBool(context, PREF_KEY_SHIFT_CASE_ENABLED, DEFAULT_SHIFT_CASE_ENABLED);
    }

    public static boolean writeShiftCaseEnabled(Context context, boolean enabled) {
        return writeBool(context, PREF_KEY_SHIFT_CASE_ENABLED, enabled);
    }

    public static String readShiftTrigger(Context context) {
        SharedPreferences prefs = GboardRamblerKeyboardPrefs.preferencesOrNull(context);
        if (prefs == null) {
            return DEFAULT_SHIFT_TRIGGER;
        }
        try {
            String raw = prefs.getString(PREF_KEY_SHIFT_TRIGGER, DEFAULT_SHIFT_TRIGGER);
            return TRIGGER_SINGLE_TAP.equals(raw) ? TRIGGER_SINGLE_TAP : TRIGGER_DOUBLE_TAP;
        } catch (Throwable ignored) {
            return DEFAULT_SHIFT_TRIGGER;
        }
    }

    public static boolean writeShiftTrigger(Context context, String trigger) {
        SharedPreferences prefs = GboardRamblerKeyboardPrefs.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        String sanitized = TRIGGER_SINGLE_TAP.equals(trigger)
                ? TRIGGER_SINGLE_TAP : TRIGGER_DOUBLE_TAP;
        try {
            return prefs.edit().putString(PREF_KEY_SHIFT_TRIGGER, sanitized).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean readPunctTrimEnabled(Context context) {
        return readBool(context, PREF_KEY_PUNCT_TRIM_ENABLED, DEFAULT_PUNCT_TRIM_ENABLED);
    }

    public static boolean writePunctTrimEnabled(Context context, boolean enabled) {
        return writeBool(context, PREF_KEY_PUNCT_TRIM_ENABLED, enabled);
    }

    public static boolean readShortcutsEnabled(Context context) {
        return readBool(context, PREF_KEY_SHORTCUTS_ENABLED, DEFAULT_SHORTCUTS_ENABLED);
    }

    public static boolean writeShortcutsEnabled(Context context, boolean enabled) {
        return writeBool(context, PREF_KEY_SHORTCUTS_ENABLED, enabled);
    }

    public static boolean readPresetApplied(Context context) {
        return readBool(context, PREF_KEY_PRESET_APPLIED, DEFAULT_PRESET_APPLIED);
    }

    /**
     * Applies or reverts the 1-tap SwiftKey Keyboard Preset. When turning ON, snapshots every
     * touched Gboard native &amp; patch preference so turning OFF restores prior values cleanly.
     */
    public static boolean setPresetApplied(Context context, boolean apply) {
        if (context == null) {
            return false;
        }
        SharedPreferences swiftPrefs = GboardRamblerKeyboardPrefs.preferencesOrNull(context);
        if (swiftPrefs == null) {
            return false;
        }
        SharedPreferences nativePrefs = openGboardDefaultPrefs(context);
        SharedPreferences patchPrefs = GboardPatchesSettings.preferencesOrNull(context);

        if (apply) {
            // Only capture backup if not already applied (prevents overwriting original backup).
            if (!swiftPrefs.getBoolean(PREF_KEY_PRESET_APPLIED, false)) {
                String backup = snapshotPresetBackup(nativePrefs, patchPrefs);
                swiftPrefs.edit().putString(PREF_KEY_PRESET_BACKUP, backup).commit();
            }
            applyPresetValues(context, nativePrefs, patchPrefs);
            return swiftPrefs.edit().putBoolean(PREF_KEY_PRESET_APPLIED, true).commit();
        } else {
            String backup = swiftPrefs.getString(PREF_KEY_PRESET_BACKUP, "");
            restorePresetBackup(context, nativePrefs, patchPrefs, backup);
            return swiftPrefs.edit()
                    .putBoolean(PREF_KEY_PRESET_APPLIED, false)
                    .remove(PREF_KEY_PRESET_BACKUP)
                    .commit();
        }
    }

    static String snapshotPresetBackup(
            SharedPreferences nativePrefs, SharedPreferences patchPrefs) {
        StringBuilder sb = new StringBuilder();
        if (nativePrefs != null) {
            Map<String, ?> all = nativePrefs.getAll();
            for (String key : NATIVE_BOOL_KEYS) {
                appendBackupEntry(sb, "N", key, all.get(key));
            }
            appendBackupEntry(sb, "N", NATIVE_LONG_PRESS_KEY, all.get(NATIVE_LONG_PRESS_KEY));
        }
        if (patchPrefs != null) {
            Map<String, ?> all = patchPrefs.getAll();
            appendBackupEntry(sb, "P", GboardSwipeDismissSettings.PREF_KEY_ENABLED,
                    all.get(GboardSwipeDismissSettings.PREF_KEY_ENABLED));
            appendBackupEntry(sb, "P", GboardShiftDeleteSettings.ENABLED,
                    all.get(GboardShiftDeleteSettings.ENABLED));
            appendBackupEntry(sb, "P", GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED,
                    all.get(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED));
        }
        return sb.toString();
    }

    private static void appendBackupEntry(StringBuilder sb, String scope, String key, Object val) {
        if (val == null) {
            sb.append(scope).append('\t').append(key).append("\tU\t\n");
        } else if (val instanceof Boolean) {
            sb.append(scope).append('\t').append(key).append("\tB\t").append(val).append('\n');
        } else if (val instanceof Integer) {
            sb.append(scope).append('\t').append(key).append("\tI\t").append(val).append('\n');
        } else if (val instanceof String) {
            sb.append(scope).append('\t').append(key).append("\tS\t").append(val).append('\n');
        }
    }

    private static void applyPresetValues(
            Context context, SharedPreferences nativePrefs, SharedPreferences patchPrefs) {
        if (nativePrefs != null) {
            SharedPreferences.Editor ed = nativePrefs.edit();
            for (String key : NATIVE_BOOL_KEYS) {
                ed.putBoolean(key, true);
                writeGboardLiveBoolSafely(context, key, true);
            }
            Object existingDelay = nativePrefs.getAll().get(NATIVE_LONG_PRESS_KEY);
            if (existingDelay instanceof String) {
                ed.putString(NATIVE_LONG_PRESS_KEY, Integer.toString(SWIFTKEY_LONG_PRESS_MS));
            } else {
                ed.putInt(NATIVE_LONG_PRESS_KEY, SWIFTKEY_LONG_PRESS_MS);
            }
            ed.commit();
        }
        if (patchPrefs != null) {
            patchPrefs.edit()
                    .putBoolean(GboardSwipeDismissSettings.PREF_KEY_ENABLED, true)
                    .putBoolean(GboardShiftDeleteSettings.ENABLED, true)
                    .putBoolean(GboardClipboardSettings.PREF_KEY_CLIPBOARD_ENABLED, true)
                    .commit();
        }
    }

    static void restorePresetBackup(
            Context context,
            SharedPreferences nativePrefs,
            SharedPreferences patchPrefs,
            String backup) {
        if (backup == null || backup.trim().isEmpty()) {
            return;
        }
        SharedPreferences.Editor nativeEd = nativePrefs == null ? null : nativePrefs.edit();
        SharedPreferences.Editor patchEd = patchPrefs == null ? null : patchPrefs.edit();
        for (String line : backup.split("\n")) {
            if (line == null || line.isEmpty()) {
                continue;
            }
            String[] parts = line.split("\t", 4);
            if (parts.length < 3) {
                continue;
            }
            String scope = parts[0];
            String key = parts[1];
            String type = parts[2];
            String val = parts.length >= 4 ? parts[3] : "";
            SharedPreferences.Editor target = "N".equals(scope) ? nativeEd
                    : ("P".equals(scope) ? patchEd : null);
            if (target == null) {
                continue;
            }
            if ("U".equals(type)) {
                target.remove(key);
            } else if ("B".equals(type)) {
                boolean b = Boolean.parseBoolean(val);
                target.putBoolean(key, b);
                if ("N".equals(scope)) {
                    writeGboardLiveBoolSafely(context, key, b);
                }
            } else if ("I".equals(type)) {
                try {
                    target.putInt(key, Integer.parseInt(val));
                } catch (NumberFormatException ignored) {
                }
            } else if ("S".equals(type)) {
                target.putString(key, val);
            }
        }
        if (nativeEd != null) {
            nativeEd.commit();
        }
        if (patchEd != null) {
            patchEd.commit();
        }
    }

    public static int readShortcutsCount(Context context) {
        if (context == null) {
            return 0;
        }
        try {
            Class<?> cls = Class.forName(SHORTCUTS_STORE_CLASS);
            Method m = cls.getMethod("countShortcuts", Context.class);
            Object r = m.invoke(null, context);
            return r instanceof Integer ? (Integer) r : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    public static String readShortcutsPreview(Context context, int maxItems) {
        if (context == null) {
            return "";
        }
        try {
            Class<?> cls = Class.forName(SHORTCUTS_STORE_CLASS);
            Method m = cls.getMethod("readShortcuts", Context.class);
            Object r = m.invoke(null, context);
            if (!(r instanceof java.util.List<?> list) || list.isEmpty()) {
                return "";
            }
            StringBuilder sb = new StringBuilder();
            int limit = Math.min(list.size(), Math.max(1, maxItems));
            for (int i = 0; i < limit; i++) {
                Object sc = list.get(i);
                if (sc == null) {
                    continue;
                }
                Object trig = sc.getClass().getField("trigger").get(sc);
                Object exp = sc.getClass().getField("expansion").get(sc);
                if (trig != null && exp != null) {
                    if (sb.length() > 0) {
                        sb.append(", ");
                    }
                    String expStr = exp.toString();
                    if (expStr.length() > 24) {
                        expStr = expStr.substring(0, 23) + "…";
                    }
                    sb.append(trig).append(" → ").append(expStr);
                }
            }
            if (list.size() > limit) {
                sb.append(", …");
            }
            return sb.toString();
        } catch (Throwable ignored) {
            return "";
        }
    }

    public static int addShortcutsFromInput(Context context, String raw) {
        if (context == null || raw == null || raw.trim().isEmpty()) {
            return 0;
        }
        try {
            Class<?> cls = Class.forName(SHORTCUTS_STORE_CLASS);
            Method m = cls.getMethod("addFromFormattedInput", Context.class, String.class);
            Object r = m.invoke(null, context, raw);
            return r instanceof Integer ? (Integer) r : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    public static void clearShortcuts(Context context) {
        if (context == null) {
            return;
        }
        try {
            Class<?> cls = Class.forName(SHORTCUTS_STORE_CLASS);
            Method m = cls.getMethod("clearAll", Context.class);
            m.invoke(null, context);
        } catch (Throwable ignored) {
        }
    }

    private static SharedPreferences openGboardDefaultPrefs(Context context) {
        try {
            Class<?> cls = Class.forName(RAMBLER_SETTINGS_CLASS);
            Method m = cls.getDeclaredMethod("defaultPreferencesOrNull", Context.class);
            m.setAccessible(true);
            Object prefs = m.invoke(null, context);
            return prefs instanceof SharedPreferences ? (SharedPreferences) prefs : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void writeGboardLiveBoolSafely(Context context, String key, boolean value) {
        try {
            Class<?> cls = Class.forName(RAMBLER_SETTINGS_CLASS);
            Method m = cls.getDeclaredMethod("writeGboardBoolean", Context.class, String.class, boolean.class);
            m.setAccessible(true);
            m.invoke(null, context, key, Boolean.valueOf(value));
        } catch (Throwable ignored) {
            // Default SharedPreferences write already succeeded.
        }
    }

    private static boolean readBool(Context context, String key, boolean fallback) {
        SharedPreferences prefs = GboardRamblerKeyboardPrefs.preferencesOrNull(context);
        if (prefs == null) {
            return fallback;
        }
        try {
            return prefs.getBoolean(key, fallback);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static boolean writeBool(Context context, String key, boolean value) {
        SharedPreferences prefs = GboardRamblerKeyboardPrefs.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        try {
            return prefs.edit().putBoolean(key, value).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }
}
