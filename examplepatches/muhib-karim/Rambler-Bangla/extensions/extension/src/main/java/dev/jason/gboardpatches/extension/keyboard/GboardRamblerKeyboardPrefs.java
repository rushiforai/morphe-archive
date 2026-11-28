package dev.jason.gboardpatches.extension.keyboard;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.util.Log;

import java.lang.reflect.Field;

/**
 * Direct-Boot-safe bridge to Rambler Bangla's shared keyboard/clipboard/launcher preferences
 * ({@code rambler_enhancements_prefs}) and Gboard's launcher activity component state.
 */
public final class GboardRamblerKeyboardPrefs {
    private static final String TAG = "GboardPatches";
    public static final String PREF_FILE = "rambler_enhancements_prefs";
    public static final String PREF_KEY_AMOLED_DARK_KEYBOARD = "pref_rambler_amoled_dark_keyboard";
    public static final String PREF_KEY_CLIPBOARD_DRAG_REORDER = "pref_rambler_clipboard_drag_reorder";
    public static final String PREF_KEY_HIDE_LAUNCHER_ICON = "pref_rambler_hide_launcher_icon";
    public static final String PREF_KEY_AT_MENTIONS_ENABLED = "pref_rambler_at_mentions_enabled";
    public static final String PREF_PREFIX_HIDDEN_FLAG = "pref_rambler_hidden_flag_";
    public static final String FLAG_QUICK_PASTE_DIRECT_CHIP =
            "enable_system_clipboard_direct_paste_for_quick_paste";
    public static final String FLAG_NATIVE_EMAIL_COMPLETION =
            "enable_email_provider_completion";
    public static final String LAUNCHER_ACTIVITY_CLASS =
            "com.google.android.libraries.inputmethod.launcher.LauncherActivity";

    public static final boolean DEFAULT_AMOLED_DARK_KEYBOARD = false;
    public static final boolean DEFAULT_CLIPBOARD_DRAG_REORDER = true;
    public static final boolean DEFAULT_HIDE_LAUNCHER_ICON = false;
    public static final boolean DEFAULT_AT_MENTIONS_ENABLED = true;

    private static final String DYNAMIC_CONFIG_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerDynamicConfig";
    private static final String AT_MENTION_STORE_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerAtMentionStore";
    private static final String HIDDEN_FLAG_RUNTIME_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerHiddenFlagOverrideRuntime";
    private static final String FLAG_RUNTIME_CLASS =
            "dev.abotmaker.ramblerenhancements.RamblerFlagRuntime";

    private GboardRamblerKeyboardPrefs() {
    }

    public static SharedPreferences preferencesOrNull(Context context) {
        if (context == null) {
            return null;
        }
        Context app = context.getApplicationContext();
        Context base = app != null ? app : context;
        try {
            return base.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
        } catch (IllegalStateException directBootLocked) {
            try {
                return base.createDeviceProtectedStorageContext()
                        .getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
            } catch (Throwable ignored) {
                return null;
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed to open Rambler keyboard preferences", throwable);
            return null;
        }
    }

    public static boolean isAmoledFeatureAvailable() {
        return readDynamicConfigFlag("FEATURE_AMOLED_DARK_KEYBOARD", true);
    }

    public static boolean isClipboardReorderAvailable() {
        return readDynamicConfigFlag("FEATURE_CLIPBOARD_REORDER", true);
    }

    public static boolean isAtMentionFeatureAvailable() {
        return readDynamicConfigFlag("FEATURE_AT_MENTION_SUGGESTIONS", true);
    }

    public static boolean isHiddenFlagsAvailable() {
        return readDynamicConfigFlag("FEATURE_HIDDEN_FLAGS", true)
                || readDynamicConfigFlag("FEATURE_RAMBLER_EXTRAS", true);
    }

    public static boolean readAmoledDarkKeyboardEnabled(Context context) {
        return readBoolean(context, PREF_KEY_AMOLED_DARK_KEYBOARD, DEFAULT_AMOLED_DARK_KEYBOARD);
    }

    public static boolean writeAmoledDarkKeyboardEnabled(Context context, boolean enabled) {
        return writeBoolean(context, PREF_KEY_AMOLED_DARK_KEYBOARD, enabled);
    }

    public static boolean readClipboardDragReorderEnabled(Context context) {
        return readBoolean(context, PREF_KEY_CLIPBOARD_DRAG_REORDER, DEFAULT_CLIPBOARD_DRAG_REORDER);
    }

    public static boolean writeClipboardDragReorderEnabled(Context context, boolean enabled) {
        return writeBoolean(context, PREF_KEY_CLIPBOARD_DRAG_REORDER, enabled);
    }

    public static boolean readAtMentionsEnabled(Context context) {
        return readBoolean(context, PREF_KEY_AT_MENTIONS_ENABLED, DEFAULT_AT_MENTIONS_ENABLED);
    }

    public static boolean writeAtMentionsEnabled(Context context, boolean enabled) {
        boolean saved = writeBoolean(context, PREF_KEY_AT_MENTIONS_ENABLED, enabled);
        refreshRamblerLiveFlagsSafely();
        return saved;
    }

    public static int readAtMentionCount(Context context) {
        java.util.List<?> entries = readAtMentionEntriesSafely(context);
        return entries == null ? 0 : entries.size();
    }

    public static String readAtMentionPreview(Context context, int maxItems) {
        java.util.List<?> entries = readAtMentionEntriesSafely(context);
        if (entries == null || entries.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        int limit = Math.min(entries.size(), Math.max(1, maxItems));
        for (int i = 0; i < limit; i++) {
            Object entry = entries.get(i);
            if (entry == null) {
                continue;
            }
            try {
                Field tokenField = entry.getClass().getField("token");
                Object token = tokenField.get(entry);
                if (token != null) {
                    if (sb.length() > 0) {
                        sb.append(", ");
                    }
                    sb.append(token.toString());
                }
            } catch (Throwable ignored) {
            }
        }
        if (entries.size() > limit) {
            sb.append(", …");
        }
        return sb.toString();
    }

    public static int addAtMentionTokens(Context context, String rawText) {
        if (context == null || rawText == null || rawText.trim().isEmpty()) {
            return 0;
        }
        try {
            Class<?> storeClass = Class.forName(AT_MENTION_STORE_CLASS);
            java.lang.reflect.Method method = storeClass.getMethod(
                    "recordTokensFromText", Context.class, CharSequence.class);
            Object result = method.invoke(null, context, rawText);
            return result instanceof Integer ? (Integer) result : 0;
        } catch (Throwable err) {
            logWarningSafely("Failed to add @mention tokens", err);
            return 0;
        }
    }

    public static void clearAtMentions(Context context) {
        if (context == null) {
            return;
        }
        try {
            Class<?> storeClass = Class.forName(AT_MENTION_STORE_CLASS);
            java.lang.reflect.Method method = storeClass.getMethod("clearAll", Context.class);
            method.invoke(null, context);
        } catch (Throwable err) {
            logWarningSafely("Failed to clear @mentions", err);
        }
    }

    public static boolean readHiddenFlagOverride(Context context, String flagName, boolean fallback) {
        return readBoolean(context, PREF_PREFIX_HIDDEN_FLAG + flagName, fallback);
    }

    public static boolean writeHiddenFlagOverride(Context context, String flagName, boolean enabled) {
        boolean saved = writeBoolean(context, PREF_PREFIX_HIDDEN_FLAG + flagName, enabled);
        try {
            Class<?> runtimeClass = Class.forName(HIDDEN_FLAG_RUNTIME_CLASS);
            java.lang.reflect.Method method = runtimeClass.getMethod(
                    "setEnabled", Context.class, String.class, boolean.class);
            method.invoke(null, context, flagName, enabled);
        } catch (Throwable ignored) {
        }
        refreshRamblerLiveFlagsSafely();
        return saved;
    }

    private static java.util.List<?> readAtMentionEntriesSafely(Context context) {
        if (context == null) {
            return java.util.Collections.emptyList();
        }
        try {
            Class<?> storeClass = Class.forName(AT_MENTION_STORE_CLASS);
            java.lang.reflect.Method method = storeClass.getMethod("readEntries", Context.class);
            Object result = method.invoke(null, context);
            return result instanceof java.util.List<?> ? (java.util.List<?>) result : java.util.Collections.emptyList();
        } catch (Throwable ignored) {
            return java.util.Collections.emptyList();
        }
    }

    private static void refreshRamblerLiveFlagsSafely() {
        try {
            Class<?> runtimeClass = Class.forName(FLAG_RUNTIME_CLASS);
            java.lang.reflect.Method method = runtimeClass.getMethod("refreshLiveFlags");
            method.invoke(null);
        } catch (Throwable ignored) {
        }
    }

    public static boolean readHideLauncherIcon(Context context) {
        if (context != null) {
            try {
                PackageManager pm = context.getPackageManager();
                if (pm != null) {
                    ComponentName cn = new ComponentName(
                            context.getPackageName(), LAUNCHER_ACTIVITY_CLASS);
                    int state = pm.getComponentEnabledSetting(cn);
                    if (state == PackageManager.COMPONENT_ENABLED_STATE_DISABLED) {
                        return true;
                    }
                    if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) {
                        return false;
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return readBoolean(context, PREF_KEY_HIDE_LAUNCHER_ICON, DEFAULT_HIDE_LAUNCHER_ICON);
    }

    public static boolean setLauncherIconHidden(Context context, boolean hide) {
        boolean saved = writeBoolean(context, PREF_KEY_HIDE_LAUNCHER_ICON, hide);
        if (context == null) {
            return saved;
        }
        try {
            PackageManager pm = context.getPackageManager();
            if (pm != null) {
                ComponentName cn = new ComponentName(
                        context.getPackageName(), LAUNCHER_ACTIVITY_CLASS);
                int newState = hide
                        ? PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
                pm.setComponentEnabledSetting(cn, newState, PackageManager.DONT_KILL_APP);
                return true;
            }
        } catch (Throwable err) {
            logWarningSafely("Failed to update launcher icon visibility", err);
            return false;
        }
        return saved;
    }

    private static boolean readDynamicConfigFlag(String fieldName, boolean fallbackWhenAbsent) {
        try {
            Class<?> configClass = Class.forName(DYNAMIC_CONFIG_CLASS);
            Field field = configClass.getField(fieldName);
            return field.getBoolean(null);
        } catch (ClassNotFoundException absent) {
            return fallbackWhenAbsent;
        } catch (Throwable ignored) {
            return fallbackWhenAbsent;
        }
    }

    private static boolean readBoolean(Context context, String key, boolean fallback) {
        SharedPreferences prefs = preferencesOrNull(context);
        if (prefs == null) {
            return fallback;
        }
        try {
            return prefs.contains(key) ? prefs.getBoolean(key, fallback) : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static boolean writeBoolean(Context context, String key, boolean value) {
        try {
            SharedPreferences prefs = preferencesOrNull(context);
            return prefs != null && prefs.edit().putBoolean(key, value).commit();
        } catch (Throwable err) {
            logWarningSafely("Failed to persist setting " + key, err);
            return false;
        }
    }

    private static void logWarningSafely(String message, Throwable err) {
        try {
            Log.w(TAG, message, err);
        } catch (Throwable ignored) {
        }
    }
}
