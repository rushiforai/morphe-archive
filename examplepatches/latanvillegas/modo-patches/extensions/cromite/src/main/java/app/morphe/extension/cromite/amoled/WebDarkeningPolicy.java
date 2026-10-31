package app.morphe.extension.cromite.amoled;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.util.Log;

/**
 * Isolated policy for Cromite's existing native web-darkening decision.
 *
 * No Chromium preference or content setting is written here. The native
 * per-site content-setting 71 check must remain the final authority.
 */
public final class WebDarkeningPolicy {
    private static final String TAG = "CromiteWebPolicy";
    private static final String PREFS = "morphe_cromite_amoled";
    private static final String KEY_OVERRIDE = "web_darkening_manual_override";
    public static final int FOLLOW_THEME = 0;
    public static final int FORCE_ON = 1;
    public static final int FORCE_OFF = 2;

    private WebDarkeningPolicy() {}

    /**
     * Safe integration probe at the existing WebContents decision entrypoint.
     * This must never change Chromium's return value or site-setting 71 JNI
     * check. Log only when explicitly enabled for development.
     */
    public static void observeNativeDecision() {
        Context context = AmoledBrightnessController.browserApplicationContext();
        if (context == null) return;
        SharedPreferences p = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!p.getBoolean("web_darkening_policy_trace_enabled", false)) return;
        boolean request = shouldRequestNativeDarkening(
                context, AmoledBrightnessController.nativeThemeSelection(),
                manualOverride(context));
        Log.i(TAG, "autoRequest=" + request
                + " override=" + manualOverride(context)
                + " (native per-site decision unchanged)");
    }


    /**
     * Invoked before Cromite's original b3f.c0 preference callback.
     * The original callback remains responsible for writing setting 71 via
     * JNI VIOZ and for storing ui_theme_setting.
     *
     * A changed checkbox relative to ThemeSettingsFragment.H0 denotes an
     * explicit user toggle; never replace that choice. A theme selection
     * with unchanged checkbox may apply automatic policy instead.
     */
    public static void onThemePreferenceChanged(Object callback, Object selected) {
        if (!(selected instanceof Integer) || callback == null) return;
        try {
            Class<?> cb = callback.getClass();
            java.lang.reflect.Field fragmentField = cb.getDeclaredField("r");
            java.lang.reflect.Field preferenceField = cb.getDeclaredField("s");
            fragmentField.setAccessible(true);
            preferenceField.setAccessible(true);
            Object fragment = fragmentField.get(callback);
            Object preference = preferenceField.get(callback);
            if (fragment == null || preference == null) return;
            java.lang.reflect.Field previousField = fragment.getClass().getDeclaredField("H0");
            java.lang.reflect.Field checkboxField = preference.getClass().getDeclaredField("m0");
            previousField.setAccessible(true);
            checkboxField.setAccessible(true);
            Object checkbox = checkboxField.get(preference);
            if (!(checkbox instanceof android.widget.CheckBox)) return;
            android.widget.CheckBox control = (android.widget.CheckBox) checkbox;
            boolean previous = previousField.getBoolean(fragment);
            if (control.isChecked() != previous) {
                setManualOverride(control.getContext(),
                        control.isChecked() ? FORCE_ON : FORCE_OFF);
                return;
            }
            int override = manualOverride(control.getContext());
            boolean night = (control.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            boolean desired = resolve(((Integer) selected).intValue(), night, override);
            if (control.isChecked() != desired) control.setChecked(desired);
            // The original callback sees the changed checkbox and persists it
            // through Cromite's existing JNI content-setting 71 implementation.
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Log.w(TAG, "theme synchronization skipped: signature changed", failure);
        }
    }

    /** Explicit manual choice; absent key means follow the effective theme. */
    public static int manualOverride(Context context) {
        if (context == null) return FOLLOW_THEME;
        SharedPreferences p = context.getApplicationContext()
                .getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        int value = p.getInt(KEY_OVERRIDE, FOLLOW_THEME);
        return value >= FOLLOW_THEME && value <= FORCE_OFF ? value : FOLLOW_THEME;
    }

    public static void setManualOverride(Context context, int choice) {
        if (context == null || choice < FOLLOW_THEME || choice > FORCE_OFF) return;
        context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putInt(KEY_OVERRIDE, choice).apply();
    }

    /**
     * Pure decision function, independently testable without Chromium.
     * theme: 0=system, 1=light, 2=dark.
     */
    public static boolean resolve(int theme, boolean systemNight, int override) {
        if (override == FORCE_ON) return true;
        if (override == FORCE_OFF) return false;
        return theme == 2 || (theme != 1 && systemNight);
    }

    /** Uses the already verified native theme reader, never Morphe's UI theme. */
    public static boolean shouldRequestNativeDarkening(
            Context context, int nativeTheme, int override) {
        if (context == null) return false;
        boolean night = (context.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        return resolve(nativeTheme, night, override);
    }
}
