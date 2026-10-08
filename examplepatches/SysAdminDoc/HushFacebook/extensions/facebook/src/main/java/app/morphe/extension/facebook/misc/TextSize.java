/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

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

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Text size for Facebook, from 85% to 130% of what the phone's font size setting gives it.
 *
 * <p>Facebook sizes its text in sp. Its native views get that through the resources of the
 * context they were built in, and its Litho text reads {@code Configuration.fontScale} and
 * {@code DisplayMetrics.scaledDensity} from the same place (both are read in dozens of
 * components in 577, 580 and 581, so the phone's own font size setting already reaches the feed,
 * comments and Menu). Here the scale those resources report is the phone's times the choice, set
 * on each Facebook activity as it's created and again as it resumes, and on the application's
 * resources once Facebook starts. A configuration change puts the phone's scale back in the
 * resources, so the next resume and the application's configuration callback set it again. On
 * Android 12 and later a screen that handles its own configuration changes gets its resources
 * rebuilt after the application's callback ran, so each scaled activity has a callback of its own
 * too, taken off when it's destroyed.
 *
 * <p>Since the phone's own large sizes are what Facebook's layouts were checked against, a choice
 * above 100% never takes the total past 2.0, Android's largest font scale (or past the phone's
 * own, when that is already larger). 100% touches nothing, and so does a paused Facebook, since a
 * paused setting reads its default. Until a choice above or below 100% has been applied in this
 * process, 100% leaves every resource as it is, and after one it puts the phone's scale back.
 */
public final class TextSize {
    /** The sizes the list offers, as a share of the phone's font size. */
    public enum Scale {
        P85(85, "85"),
        P90(90, "90"),
        P100(100, "100"),
        P110(110, "110"),
        P115(115, "115"),
        P120(120, "120"),
        P130(130, "130");

        public final int percent;

        /** What a settings file holds for this choice. It never changes once written. */
        public final String fileValue;

        Scale(int percent, String fileValue) {
            this.percent = percent;
            this.fileValue = fileValue;
        }

        /** The choice a settings file names, or null when it names none this build knows. */
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

    /** The choice in force, which is 100% until the settings are ready and while Hushfacebook is paused. */
    private static Scale chosen() {
        return Utils.settingsReady() ? Settings.TEXT_SIZE.get() : Scale.P100;
    }

    /**
     * From the settings entry's callbacks, as a Facebook activity is created, and again as it
     * resumes. Never throws: a failure leaves Facebook's text as it was.
     */
    public static void activity(Activity activity) {
        try {
            Scale scale = chosen();
            latest = new WeakReference<>(activity);
            apply(activity.getResources(), phoneScale(), scale);
            if (scaledSomething) watch(activity);
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Text size: could not set the activity's font scale", failure);
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

    /** From the settings entry's callbacks as a Facebook activity is destroyed: takes its configuration callback off. Never throws. */
    public static void destroyed(Activity activity) {
        try {
            ComponentCallbacks callbacks = ownChanges.remove(activity);
            if (callbacks != null) activity.unregisterComponentCallbacks(callbacks);
            WeakReference<Activity> newest = latest;
            if (newest != null && newest.get() == activity) latest = null;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Text size: could not take a screen's configuration callback off", failure);
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
            Logger.printException(() -> "Text size: could not set the application's font scale", failure);
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
                Logger.printException(() -> "Text size: could not set the font scale after a configuration change", failure);
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
                Logger.printException(() -> "Text size: could not set a screen's font scale after its configuration change", failure);
            }
        }

        @Override
        public void onLowMemory() {
        }
    }
}
