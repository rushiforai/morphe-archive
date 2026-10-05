package dev.twitchpatches.extension.settings;

import android.app.Activity;
import android.app.Application;
import android.app.FragmentManager;
import android.os.Bundle;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("deprecation") // Platform DialogFragment avoids depending on Twitch's obfuscated AndroidX ABI.
public final class PatchSettings implements Application.ActivityLifecycleCallbacks {
    private static PatchSettings instance;
    private final Application application;
    private final SettingRegistry options = new SettingRegistry();
    private WeakReference<Activity> foreground = new WeakReference<>(null);

    private PatchSettings(Application application) {
        this.application = application;
        application.registerActivityLifecycleCallbacks(this);
    }

    public static synchronized void initialize(Application application) {
        if (instance == null) instance = new PatchSettings(application);
    }

    public static synchronized void register(ToggleSetting option) {
        if (instance == null) throw new IllegalStateException("Patch settings must initialize before a feature.");
        instance.options.register(option);
    }

    static synchronized List<ToggleSetting> options() {
        return instance == null ? new ArrayList<>() : instance.options.snapshot();
    }

    public static int settingsIcon() {
        PatchSettings settings = instance;
        if (settings == null) return android.R.drawable.ic_menu_preferences;
        int icon = settings.application.getResources().getIdentifier("ic_settings", "drawable",
                settings.application.getPackageName());
        return icon != 0 ? icon : android.R.drawable.ic_menu_preferences;
    }

    public static void open() {
        PatchSettings settings = instance;
        Activity activity = settings == null ? null : settings.foreground.get();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        FragmentManager manager = activity.getFragmentManager();
        if (manager.isStateSaved() || manager.findFragmentByTag(PatchSettingsPage.TAG) != null) return;
        new PatchSettingsPage().show(manager, PatchSettingsPage.TAG);
    }

    @Override public void onActivityResumed(Activity activity) { foreground = new WeakReference<>(activity); }
    @Override public void onActivityPaused(Activity activity) {
        if (foreground.get() == activity) foreground.clear();
    }
    @Override public void onActivityDestroyed(Activity activity) {
        if (foreground.get() == activity) foreground.clear();
    }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
