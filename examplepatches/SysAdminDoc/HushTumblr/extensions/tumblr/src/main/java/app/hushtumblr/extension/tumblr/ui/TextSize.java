/*
 * Ported from https://github.com/SysAdminDoc/Hushfacebook at e332bd2b3 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.text.NumberFormat;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/**
 * Text size for Tumblr (#23), from 85% to 130% of what the phone's font size setting gives it.
 *
 * <p>Tumblr sizes its text in sp, which its views read through the resources of the context they
 * were built in, so the phone's own font size setting already reaches posts, notes and menus. Here
 * the scale those resources report is the phone's times the choice, set on each Tumblr activity as
 * it's created and again as it resumes, and on the application's resources once Tumblr starts.
 * A configuration change puts the phone's scale back in the resources, so the next resume and the
 * application's configuration callback set it again. On Android 12 and later a screen that handles
 * its own configuration changes gets its resources rebuilt after the application's callback ran,
 * so each scaled activity has a callback of its own too, taken off when it's destroyed.
 *
 * <p>Since the phone's own large sizes are what Tumblr's layouts were checked against, a choice
 * above 100% never takes the total past 2.0, Android's largest font scale (or past the phone's
 * own, when that is already larger). The switch off, a paused HushTumblr and a build without the
 * patch read as 100%, which touches nothing. Until a choice above or below 100% has been applied
 * in this process, 100% leaves every resource as it is, and after one it puts the phone's scale
 * back. A change to the switch or the size waits for a restart, so every screen draws at one size.
 */
public final class TextSize {
    /** The sizes, as a share of the phone's font size. The settings row offers all but 100%. */
    public enum Scale {
        P85(85),
        P90(90),
        P100(100),
        P110(110),
        P115(115),
        P120(120),
        P130(130);

        public final int percent;
        /** What the setting and a settings file hold for this choice. It never changes once written. */
        public final String fileValue;

        Scale(int percent) {
            this.percent = percent;
            this.fileValue = String.valueOf(percent);
        }

        /** The choice [value] names, or null when it names none this build knows. */
        @Nullable
        public static Scale fromFile(@Nullable Object value) {
            if (!(value instanceof String)) return null;
            for (Scale scale : values()) {
                if (scale.fileValue.equals(value)) return scale;
            }
            return null;
        }

        /** The choice as the phone writes a percentage, such as 85% in English and 85 % in German. */
        public String label() {
            return NumberFormat.getPercentInstance().format(percent / 100.0);
        }
    }

    /** What the report counts each time a screen's text is set to the chosen size. */
    static final String SCALED = "screen text sized";

    /** Android's largest font scale in its settings, the most a choice above 100% reaches. */
    static final float LARGEST_FONT_SCALE = 2.0f;

    /** Within this of the wanted scale, the resources count as already set. */
    private static final float SAME = 0.001f;

    /**
     * Whether this process has scaled any resources. Activities share their resources' state with
     * the application's, so a choice taken back to 100% puts the phone's scale back wherever it
     * differs, but only once something here changed it. Until then 100% touches nothing.
     */
    private static volatile boolean scaledSomething;

    /** The application the configuration callback is registered on, so each application gets one. */
    @Nullable
    private static WeakReference<Application> watched;

    @Nullable
    private static WeakReference<Activity> latest;

    /** The configuration callback on each activity that has one, so its destroy can take it off. */
    private static final Map<Activity, ComponentCallbacks> ownChanges = Collections.synchronizedMap(new WeakHashMap<>());

    private TextSize() {
    }

    /**
     * The font scale a choice makes of the phone's: the product, held at {@link #LARGEST_FONT_SCALE}
     * (or at the phone's own scale when that is larger) for a choice above 100%.
     */
    static float target(float phoneScale, Scale scale) {
        float wanted = phoneScale * scale.percent / 100f;
        if (scale.percent > 100) wanted = Math.min(wanted, Math.max(phoneScale, LARGEST_FONT_SCALE));
        return wanted;
    }

    /**
     * Sets [resources] to the choice. Nothing changes at 100% unless this class scaled them before.
     *
     * @return whether the resources' font scale changed
     */
    static boolean apply(Resources resources, float phoneScale, Scale scale) {
        if (scale == Scale.P100 && !scaledSomething) return false;
        float wanted = target(phoneScale, scale);
        Configuration current = resources.getConfiguration();
        boolean changed = Math.abs(current.fontScale - wanted) > SAME;
        if (changed) {
            Configuration scaled = new Configuration(current);
            scaled.fontScale = wanted;
            resources.updateConfiguration(scaled, resources.getDisplayMetrics());
        }
        if (scale != Scale.P100) scaledSomething = true;
        return changed;
    }

    /** A fresh process, for tests. */
    static void forgetForTests() {
        scaledSomething = false;
        latest = null;
        watched = null;
        ownChanges.clear();
    }

    /** The phone's own font scale: the system resources follow its font size setting. */
    private static float phoneScale() {
        float scale = Resources.getSystem().getConfiguration().fontScale;
        return scale > 0f ? scale : 1f;
    }

    /**
     * The size picked on the Interface page while the switch is on and the patch is in, or 100%:
     * before the settings are ready, with the switch off, while HushTumblr is paused (a paused
     * switch reads its default, off) and in a build without the patch.
     */
    static Scale chosen() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.FONT_SCALE.installed()) return Scale.P100;
        HookStatus.invoked(FamilyNames.TEXT_SIZE);
        if (!Settings.TEXT_SIZE.get()) return Scale.P100;
        Scale scale = Scale.fromFile(TextSettings.TEXT_SIZE_PERCENT.get());
        return scale == null ? Scale.fromFile(TextSettings.TEXT_SIZE_PERCENT.defaultValue) : scale;
    }

    /**
     * From the settings entry's activity callbacks, as a Tumblr activity is created, and again as
     * it resumes. Never throws: a failure leaves Tumblr's text as it was.
     */
    public static void activity(Activity activity) {
        try {
            Scale scale = chosen();
            latest = new WeakReference<>(activity);
            if (apply(activity.getResources(), phoneScale(), scale) && scale != Scale.P100) {
                HookStatus.counted(FamilyNames.TEXT_SIZE, SCALED);
            }
            if (scaledSomething) watch(activity);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.TEXT_SIZE, "screen font scale", failure);
        }
    }

    /**
     * Gives [activity] its own configuration callback, once. Android 12 and later send an activity's
     * own configuration changes to the callbacks registered on it.
     */
    private static void watch(Activity activity) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S || ownChanges.containsKey(activity)) return;
        ComponentCallbacks callbacks = new ActivityChanges(activity);
        activity.registerComponentCallbacks(callbacks);
        ownChanges.put(activity, callbacks);
    }

    /** From the settings entry's callbacks as a Tumblr activity is destroyed: takes its configuration callback off. Never throws. */
    public static void destroyed(Activity activity) {
        try {
            ComponentCallbacks callbacks = ownChanges.remove(activity);
            if (callbacks != null) activity.unregisterComponentCallbacks(callbacks);
            WeakReference<Activity> newest = latest;
            if (newest != null && newest.get() == activity) latest = null;
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.TEXT_SIZE, "screen callback", failure);
        }
    }

    /**
     * From the settings entry as the application is created: scales the application's resources,
     * which contexts that aren't an activity read, and watches for the phone's configuration
     * changing, which puts its font scale back.
     */
    public static synchronized void application(Context context) {
        try {
            if (!(context instanceof Application)) return;
            apply(context.getResources(), phoneScale(), chosen());
            if (watched != null && watched.get() == context) return;
            ((Application) context).registerComponentCallbacks(new Changes((Application) context));
            watched = new WeakReference<>((Application) context);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.TEXT_SIZE, "application font scale", failure);
        }
    }

    /** Sets the scale again after a configuration change, on the application and the newest activity. */
    private static final class Changes implements ComponentCallbacks {
        private final Application application;

        Changes(Application application) {
            this.application = application;
        }

        @Override
        public void onConfigurationChanged(@NonNull Configuration newConfig) {
            try {
                Scale scale = chosen();
                float phone = phoneScale();
                apply(application.getResources(), phone, scale);
                Activity activity = latest == null ? null : latest.get();
                if (activity != null) apply(activity.getResources(), phone, scale);
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.TEXT_SIZE, "configuration change", failure);
            }
        }

        @Override
        public void onLowMemory() {
        }
    }

    /** Sets the scale again after one activity's own configuration change. It holds the activity weakly. */
    private static final class ActivityChanges implements ComponentCallbacks {
        private final WeakReference<Activity> activity;

        ActivityChanges(Activity activity) {
            this.activity = new WeakReference<>(activity);
        }

        @Override
        public void onConfigurationChanged(@NonNull Configuration newConfig) {
            try {
                Activity changed = activity.get();
                if (changed != null) apply(changed.getResources(), phoneScale(), chosen());
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.TEXT_SIZE, "screen configuration change", failure);
            }
        }

        @Override
        public void onLowMemory() {
        }
    }
}
