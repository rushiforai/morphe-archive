package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Gboard's own "Standard voice typing" toggles, read and written from the patch settings.
 *
 * They are preference keys of Gboard's default SharedPreferences (ahws uses
 * PreferenceManager.getDefaultSharedPreferences), not flags. The stock page that shows them now
 * sits under the Parakeet entry while Parakeet replaces that engine, so the rows are removed at
 * runtime and the same switches are offered under Patches -> AI & Voice instead.
 */
public final class GboardVoiceTypingExtras {
    public static final String ADVANCED_FEATURES = "enable_enhanced_voice_typing";
    public static final String AUTO_PUNCTUATION =
            "enable_enhanced_voice_typing_auto_punctuation";
    public static final String LANGUAGE_SWITCHING =
            "enable_enhanced_voice_typing_automatic_language_switching";

    private static final String TAG = "GboardPatches";
    private static final String TRADITIONAL_FRAGMENT =
            "com.google.android.apps.inputmethod.latin.preference.TraditionalVoiceSettingsFragment";

    // R8 renames androidx.preference members in Gboard. 18.8.0.1022711984-beta (arm64 and
    // armeabi-v7a): PreferenceFragmentCompat (egl) findPreference = gX(CharSequence),
    // getPreferenceScreen = n(), PreferenceGroup.removePreference = ao(Preference).
    private static final String[] FIND_PREFERENCE = {"findPreference", "gX"};
    private static final String[] GET_PREFERENCE_SCREEN = {"getPreferenceScreen", "n"};
    private static final String[] REMOVE_PREFERENCE = {"removePreference", "ao"};

    private GboardVoiceTypingExtras() {
    }

    public static SharedPreferences preferences(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    public static boolean read(Context context, String key, boolean fallback) {
        try {
            return preferences(context).getBoolean(key, fallback);
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static boolean write(Context context, String key, boolean value) {
        try {
            return preferences(context).edit().putBoolean(key, value).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Called from every preference fragment's onResume; removes the stock rows once. */
    public static void hideStockRows(Object fragment) {
        if (fragment == null || !TRADITIONAL_FRAGMENT.equals(fragment.getClass().getName())) {
            return;
        }
        for (String key : new String[] {ADVANCED_FEATURES, AUTO_PUNCTUATION, LANGUAGE_SWITCHING}) {
            try {
                Object preference = invokeFirst(fragment, FIND_PREFERENCE, CharSequence.class, key);
                if (preference == null) {
                    continue;
                }
                Object screen = invokeFirst(fragment, GET_PREFERENCE_SCREEN, null, null);
                if (screen == null) {
                    continue;
                }
                Method remove = null;
                for (String name : REMOVE_PREFERENCE) {
                    remove = findMethod(screen.getClass(), name, 1);
                    if (remove != null) {
                        break;
                    }
                }
                if (remove != null) {
                    remove.invoke(screen, preference);
                }
            } catch (Throwable failure) {
                Log.w(TAG, "could not hide stock voice row " + key, failure);
            }
        }
    }

    private static Object invokeFirst(Object target, String[] names, Class<?> type, Object value)
            throws Exception {
        NoSuchMethodException missing = null;
        for (String name : names) {
            try {
                return type == null ? invoke(target, name) : invoke(target, name, type, value);
            } catch (NoSuchMethodException failure) {
                missing = failure;
            }
        }
        throw missing;
    }

    private static Object invoke(Object target, String name, Class<?>... types) throws Exception {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return types.length == 0 ? method.invoke(target) : method.invoke(target, types);
    }

    private static Object invoke(Object target, String name, Class<?> type, Object value)
            throws Exception {
        Method method = target.getClass().getMethod(name, type);
        method.setAccessible(true);
        return method.invoke(target, value);
    }

    private static Method findMethod(Class<?> type, String name, int parameters) {
        for (Method method : type.getMethods()) {
            if (method.getName().equals(name) && method.getParameterCount() == parameters) {
                method.setAccessible(true);
                return method;
            }
        }
        return null;
    }
}
