package app.ra1nify.f4t.extension.keyboard;

import android.content.Context;

import java.lang.reflect.Method;

/**
 * Handles the injected settings entry.
 *
 * A click on the stock settings row opens the F4T page inside the stock COUI preference fragment, so
 * the page uses the official COUI layout, app bar and widgets instead of a hand drawn layout.
 */
public final class SettingsEntry {
    private static final String KEY = "key_f4t_settings";
    private static final String PAGE_MAIN = "main";

    private SettingsEntry() {
    }

    /** Called from the patched PreferenceFragmentCompat.onPreferenceTreeClick(Preference). */
    public static boolean handlePreference(Object preference) {
        try {
            if (preference == null) return false;
            if (!KEY.equals(invoke(preference, "getKey"))) return false;

            Context context = (Context) invoke(preference, "getContext");
            if (context == null) return false;

            PageHost.toggle(context, PAGE_MAIN);
            android.util.Log.i("F4T", "settings entry clicked");
            return true;
        } catch (Throwable ignored) {
            android.util.Log.e("F4T", "settings entry click failed", ignored);
            return false;
        }
    }

    private static Object invoke(Object target, String method) throws Exception {
        Method declared = target.getClass().getMethod(method);
        declared.setAccessible(true);
        return declared.invoke(target);
    }
}
