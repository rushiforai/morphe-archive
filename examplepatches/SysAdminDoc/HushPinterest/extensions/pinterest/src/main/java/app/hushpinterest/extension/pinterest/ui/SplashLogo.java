/*
 * Original HushPinterest implementation, 2026, after HushGram's launch screen.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.settings.SettingsStatus;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.Setting;

/**
 * Helper for the "Custom splash logo" patch (#41): the logo picked when patching on the screen
 * Android shows while Pinterest starts, on Android 13 and newer.
 *
 * <p>Android draws that screen itself, in its own process, from the launch theme of the activity being
 * started, before any of Pinterest's code runs, and takes it down when Pinterest draws its first frame.
 * Pinterest's launcher wears {@code Theme.Pinterest.SplashScreen.Launch}. The patch adds a theme of its
 * own, {@link #THEME}, which is that theme with the picked logo as the icon. Android 13 lets an app
 * name the theme its starts use from then on, and keeps that answer itself, so nothing here runs,
 * waits or draws while Pinterest starts. Android simply draws a different picture in the time it
 * already takes.
 *
 * <p>This tells Android which theme to use when the answer changes, on a background thread: once an
 * activity has resumed or is pausing, and as soon as the switch, Pause or safe mode changes, so the
 * restart row's start already shows it. The answer is what the next start will do: the switch as
 * saved, unless that start or this one runs paused (the Pause switch, safe mode or the marker file). What Android
 * was last told is kept in {@link #STORE}, so a start with nothing to change asks Android for nothing.
 * With the switch on, each process tells Android once anyway, in case it lost the answer. Android
 * ignores the call for an activity that's already gone, so an answer counts as given only when the
 * activity outlived the call. A build without the theme, Android 12 and older, or anything thrown
 * leaves Pinterest's own screen.
 */
public final class SplashLogo {
    /** The theme the patch adds next to Pinterest's launch theme. */
    static final String THEME = "HushPinterestSplashLogo";

    /** Where what Android was last told is kept, and the key it's under: true for the picked logo. */
    static final String STORE = "hushpinterest_splash_logo";
    static final String APPLIED = "applied";

    /** What's counted each time Android is told which launch screen to show. */
    static final String SET = "picked logo handed to Android";
    static final String CLEARED = "Pinterest's logo handed back";

    /** Android's side, which a test replaces. */
    interface Splash {
        /** The number of {@link #THEME} in [activity]'s app, or 0 when this build has none. */
        int theme(Activity activity);

        /** Has Android show [theme] from the next start on; 0 gives Pinterest's own back. */
        void use(Activity activity, int theme);
    }

    static Splash splash = new AndroidSplash();

    private static final Object LOCK = new Object();
    private static volatile boolean registered;
    /** What Android was last told, as kept in {@link #STORE}: null before it's read, or when it never was. */
    @Nullable private static Boolean applied;
    private static boolean appliedRead;
    /** Whether this process has told Android anything yet. */
    private static boolean toldThisProcess;
    /** The activity resumed last, which a change of the switch tells Android through. */
    private static volatile WeakReference<Activity> current = new WeakReference<>(null);

    /** Kept here, since the store holds its listeners weakly. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGES = (store, key) -> {
        if (key == null || key.equals(Settings.CUSTOM_SPLASH_LOGO.key)
                || key.equals(BaseSettings.PAUSED.key) || key.equals(BaseSettings.SAFE_MODE.key)) {
            Activity activity = current.get();
            if (activity != null) followLater(activity);
        }
    };

    private SplashLogo() {
    }

    /**
     * Called as the application starts. Does nothing in a build that doesn't carry the patch or on
     * Android 12 and older, and watches every activity and the switch otherwise.
     */
    public static void install(Context context) {
        try {
            if (registered || !(context instanceof Application) || !SettingsStatus.customSplashLogo()) return;
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
            registered = true;
            ((Application) context).registerActivityLifecycleCallbacks(new Watcher());
            Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(CHANGES);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_SPLASH_LOGO, "start", failure);
        }
    }

    /** Has {@link #follow} run for [activity] on a background thread, so no frame waits on Android. */
    static void followLater(Activity activity) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return;
        WeakReference<Activity> held = new WeakReference<>(activity);
        Utils.runOnBackgroundThread(() -> {
            Activity still = held.get();
            if (still != null && !still.isDestroyed()) follow(still);
        });
    }

    /**
     * Tells Android which launch screen the next start shows, when that has changed. Answers whether
     * Android was told anything. Never throws.
     */
    static boolean follow(Activity activity) {
        try {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU || !Utils.settingsReady()) return false;
            HookStatus.invoked(FamilyNames.CUSTOM_SPLASH_LOGO);
            boolean wanted = wanted(activity);
            synchronized (LOCK) {
                SharedPreferences store = activity.getSharedPreferences(STORE, Context.MODE_PRIVATE);
                if (!appliedRead) {
                    applied = store.contains(APPLIED) ? store.getBoolean(APPLIED, false) : null;
                    appliedRead = true;
                }
                int theme = 0;
                if (wanted) {
                    theme = splash.theme(activity);
                    if (theme == 0) {
                        HookStatus.missingMember(FamilyNames.CUSTOM_SPLASH_LOGO, "style", "resources", THEME);
                        wanted = false;
                    }
                }
                // The picked logo is handed over once in every process, in case Android lost it.
                // Pinterest's own is handed back only when Android may still hold the picked one.
                boolean unchanged = applied != null && applied == wanted && (!wanted || toldThisProcess);
                if (unchanged || activity.isDestroyed()) return false;
                splash.use(activity, theme);
                // Android drops the call without a word once the activity is gone, and marks it
                // destroyed before it lets go of it, so the answer is kept only when the activity
                // was still there after the call. Otherwise the next resume tells Android again.
                if (activity.isDestroyed()) return false;
                applied = wanted;
                toldThisProcess = true;
                store.edit().putBoolean(APPLIED, wanted).apply();
                HookStatus.counted(FamilyNames.CUSTOM_SPLASH_LOGO, wanted ? SET : CLEARED);
                return true;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CUSTOM_SPLASH_LOGO, "launch theme", failure);
            return false;
        }
    }

    /**
     * Whether the next start shows the picked logo: the switch as saved, unless that start runs
     * paused by the Pause switch, safe mode or the marker file. It's the next start's answer, not
     * this one's, because that's the start Android draws the screen for. A paused process hands
     * Android nothing of HushPinterest's either, so after Pause is turned off the first start that
     * runs unpaused tells Android, and the logo shows from the start after it. Until the settings
     * can be read it's Pinterest's screen, like every other hook.
     */
    static boolean wanted(Context context) {
        return Utils.settingsReady() && Settings.CUSTOM_SPLASH_LOGO.savedValue() && !HushPinterestPause.isPaused()
                && !HushPinterestPause.pausesNextStart(context);
    }

    /** Forgets what this process knows, as a new process would. */
    static void forgetForTests() {
        synchronized (LOCK) {
            applied = null;
            appliedRead = false;
            toldThisProcess = false;
        }
        current = new WeakReference<>(null);
    }

    /** The listener for the switch, which a test calls as the store would. */
    static SharedPreferences.OnSharedPreferenceChangeListener changesForTests() {
        return CHANGES;
    }

    static final class Watcher implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityResumed(@NonNull Activity activity) {
            current = new WeakReference<>(activity);
            followLater(activity);
        }

        /** Leaving Pinterest, or the settings screen, right after a change: the next start already shows it. */
        @Override public void onActivityPaused(@NonNull Activity activity) {
            if (!activity.isFinishing()) followLater(activity);
        }

        @Override public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle state) { }
        @Override public void onActivityStarted(@NonNull Activity activity) { }
        @Override public void onActivityStopped(@NonNull Activity activity) { }
        @Override public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle state) { }
        @Override public void onActivityDestroyed(@NonNull Activity activity) { }
    }

    /**
     * Android 13's splash screen theme. The theme is found by name in the app's own resource package,
     * which is still Pinterest's when Change package name renamed the app.
     */
    static final class AndroidSplash implements Splash {
        @Override public int theme(Activity activity) {
            Resources resources = activity.getResources();
            int theme = resources.getIdentifier(THEME, "style", activity.getPackageName());
            int own = activity.getApplicationInfo().theme;
            if (theme == 0 && own != 0) {
                theme = resources.getIdentifier(THEME, "style", resources.getResourcePackageName(own));
            }
            return theme;
        }

        @Override public void use(Activity activity, int theme) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                activity.getSplashScreen().setSplashScreenTheme(theme);
            }
        }
    }
}
