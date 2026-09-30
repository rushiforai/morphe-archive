package app.matthew.chrome.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.util.WeakHashMap;

/** The same preferences back the settings page, theme picker and runtime hooks. */
public final class PatchSettings {
    public static final String BUTTON = "incognito_button", BLACK = "black_mode",
            BOTTOM = "true_bottom", TAB_PICKER = "tab_picker", REMEMBER_MODE = "remember_last_mode";
    private static final String LAST_MODE = "last_mode_incognito";
    private static SharedPreferences preferences;
    private static int appearanceGeneration;
    private static final WeakHashMap<Activity, Integer> generations = new WeakHashMap<>();
    private PatchSettings() {}

    public static void initialize(Application app) {
        if (!app.getPackageName().equals(Application.getProcessName()) || preferences != null) return;
        preferences = app.getSharedPreferences("chrome_patch", Context.MODE_PRIVATE);
        // Preserve an explicit opt-out when replacing the old always-private option.
        if (!preferences.contains(REMEMBER_MODE) && preferences.contains("incognito_default")) {
            preferences.edit().putBoolean(REMEMBER_MODE,
                    preferences.getBoolean("incognito_default", true)).remove("incognito_default").apply();
        }
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity a, Bundle state) {
                generations.put(a, appearanceGeneration);
                BlackTheme.watch(a);
                SearchLayout.watch(a);
            }
            @Override public void onActivityResumed(Activity a) {
                TabPicker.resume(a);
                Integer generation = generations.get(a);
                if (generation != null && generation != appearanceGeneration && !a.isFinishing()) {
                    generations.put(a, appearanceGeneration);
                    a.recreate();
                }
            }
            @Override public void onActivityDestroyed(Activity a) { generations.remove(a); TabPicker.destroy(a); }
            @Override public void onActivityStarted(Activity a) {}
            @Override public void onActivityPaused(Activity a) { ModeRouting.remember(a); TabPicker.pause(a); }
            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle out) {}
        });
    }

    public static boolean enabled(String key) {
        boolean defaultValue = !BLACK.equals(key) && !TAB_PICKER.equals(key);
        return preferences == null ? defaultValue : preferences.getBoolean(key, defaultValue);
    }
    public static boolean trueBottom() { return enabled(BOTTOM); }
    public static Boolean lastMode() {
        return preferences != null && preferences.contains(LAST_MODE)
                ? preferences.getBoolean(LAST_MODE, false) : null;
    }
    public static void rememberMode(boolean incognito) {
        if (preferences != null && !Boolean.valueOf(incognito).equals(lastMode())) {
            preferences.edit().putBoolean(LAST_MODE, incognito).apply();
        }
    }
    public static void set(String key, boolean enabled) {
        if (preferences == null || enabled(key) == enabled) return;
        preferences.edit().putBoolean(key, enabled).apply();
        if (BLACK.equals(key)) {
            appearanceGeneration++;
            if (enabled) NativeBridge.writeChromeInt(2, "ui_theme_setting");
        }
        if (BOTTOM.equals(key)) {
            appearanceGeneration++;
            if (enabled) NativeBridge.setBottomPosition();
        }
    }
    public static void nativePosition(int position) {
        // Selecting Top in Chrome's own settings must remain an effective choice.
        if (position == 0 || position == 1) set(BOTTOM, false);
    }
    public static boolean keepNativeNtpOrFocus(boolean original) { return original && !trueBottom(); }
}
