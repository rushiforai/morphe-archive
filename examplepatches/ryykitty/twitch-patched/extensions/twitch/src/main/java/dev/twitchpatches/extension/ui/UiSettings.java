package dev.twitchpatches.extension.ui;

import android.app.Application;
import android.content.SharedPreferences;
import dev.twitchpatches.extension.settings.PatchSettings;
import dev.twitchpatches.extension.settings.SettingGroup;
import dev.twitchpatches.extension.settings.SettingEntry;
import dev.twitchpatches.extension.settings.SettingSection;
import dev.twitchpatches.extension.shared.ReactNativeRuntime;
import java.util.List;
import org.json.JSONObject;

public final class UiSettings implements SettingGroup {
    public static final String KEY = "ui_settings";
    private static volatile UiSettings instance;
    private final UiFeatureRegistry features;
    private final List<SettingEntry> categories;

    private UiSettings(Application application) {
        SharedPreferences preferences = application.getSharedPreferences("twitch_patches_ui", 0);
        for (String part : new String[] {"gift", "subscribe"}) {
            String key = "vertical_header_hide_" + part;
            if (!preferences.contains(key) && preferences.getBoolean("vertical_support_hide_" + part, false))
                preferences.edit().putBoolean(key, true).apply();
        }
        migrateActionRows(preferences);
        features = new UiFeatureRegistry(new UiFeatureRegistry.Preferences() {
            @Override public boolean read(String key) { return preferences.getBoolean(key, false); }
            @Override public void write(String key, boolean enabled) {
                preferences.edit().putBoolean(key, enabled).apply();
            }
        });
        categories = UiOptions.create(features, hasLeaderboardButton());
        features.observe(() -> { ReactNativeRuntime.refresh(); UiComposeBridge.update(); });
    }

    private static void migrateActionRows(SharedPreferences preferences) {
        SharedPreferences.Editor editor = null;
        for (String layout : new String[] {"classic", "vertical"}) {
            String key = layout + "_support_hide_row";
            if (!preferences.contains(key)) continue;
            if (editor == null) editor = preferences.edit();
            if (preferences.getBoolean(key, false)) {
                for (String part : new String[] {"subscribe", "gift", "bits"})
                    editor.putBoolean(layout + "_support_hide_" + part, true);
                if (layout.equals("classic")) editor.putBoolean("hide_channel_extensions", true);
            }
            editor.remove(key);
        }
        if (editor != null) editor.apply();
    }

    public static synchronized void initialize(Application application) {
        if (instance != null) return;
        instance = new UiSettings(application);
        UiComposeBridge.update();
        UiFullscreenPolicy.initialize(application);
        ReactNativeRuntime.select(7);
        PatchSettings.register(instance);
    }

    public static boolean enabled(String key) {
        UiSettings settings = instance;
        return settings != null && settings.features.enabled(key);
    }

    public static boolean hasLeaderboardButton() { return false; }

    public static int filterWindowInsetTypes(android.view.View view, int types) {
        return UiFullscreenPolicy.filterInsets(view, types);
    }

    public static void nativePlayerLayout(android.view.View root, boolean portrait, Enum<?> mode) {
        UiFullscreenPolicy.nativeLayout(root, !portrait && mode != null &&
                !mode.name().startsWith("MINIMIZED") && !mode.name().equals("PICTURE_IN_PICTURE"));
    }

    public static void modernPlayerLayout(android.app.Activity activity, boolean fullscreen) {
        UiFullscreenPolicy.modernLayout(activity, fullscreen);
    }

    public static void hostSystemBars(android.app.Activity activity, boolean hidden) {
        UiFullscreenPolicy.hostBars(activity, hidden);
    }

    public static void setSystemUiVisibility(android.view.View view, int flags) {
        view.setSystemUiVisibility(UiFullscreenPolicy.legacyRequest(view, flags));
    }

    public static void showSystemBars(android.view.WindowInsetsController controller, int types) {
        int filtered = UiFullscreenPolicy.showRequest(controller, types);
        if (filtered != 0) controller.show(filtered);
    }

    public static AutoCloseable observe(Runnable listener) { return requireInstance().features.observe(listener); }

    public static String snapshot() {
        UiSettings settings = instance;
        return settings == null ? "{}" : new JSONObject(settings.features.snapshot()).toString();
    }

    public static boolean openLink(String url) {
        if (instance == null || !"twitch-patches://settings/ui".equals(url)) return false;
        open();
        return true;
    }

    public static void open() { if (instance != null) PatchSettings.openGroup(KEY); }

    private static UiSettings requireInstance() {
        UiSettings settings = instance;
        if (settings == null) throw new IllegalStateException("UI settings must initialize before registering options.");
        return settings;
    }

    @Override public String key() { return KEY; }
    @Override public String title() { return "UI settings"; }
    @Override public String summary() { return "Player controls, channel actions and display options."; }
    @Override public String emptyMessage() { return "No UI options are available in this build."; }
    @Override public SettingSection section() { return SettingSection.INTERFACE; }
    @Override public List<SettingEntry> children() { return categories; }
}
