package app.kyurem39.extension;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;

import java.util.Locale;

/**
 * Applies the language selected in the Morphe settings to an activity.
 *
 * <p>{@code applyOverrideConfiguration} is used instead of replacing the base context, because the
 * override keeps the theme the activity was created with. Should it be refused (it can only be
 * called before the activity touches its resources), the resources are updated in place instead,
 * which still localizes everything that is read after this point.
 *
 * <p>This class is called from injected {@code onCreate} methods, so it is written in Java to stay
 * independent of the app's shrunk Kotlin runtime.
 */
public final class MorpheLocale {
    private MorpheLocale() {}

    public static void overrideConfiguration(Activity activity) {
        MorpheHook.track(activity);

        Context baseContext = activity.getBaseContext();
        if (baseContext == null) return;

        Resources base = baseContext.getResources();
        Configuration configuration = new Configuration(base.getConfiguration());

        // The Vietnamese resources are compiled into the APK, so a system set to Vietnamese would
        // select them even with the feature turned off. The locale is therefore always overridden:
        // Vietnamese when the feature is on, the app's original English when it is off. Recreating
        // an activity also reuses the resources of its previous instance, so the override has to be
        // applied on every creation, not only when the feature is enabled.
        configuration.setLocale(
            MorphePrefs.isVietnameseEnabled(activity)
                ? MorphePrefs.VIETNAMESE
                : Locale.ENGLISH
        );

        try {
            activity.applyOverrideConfiguration(configuration);
            return;
        } catch (RuntimeException refused) {
            // The activity already touched its resources; fall back to updating them in place.
        }

        try {
            activity.getResources().updateConfiguration(
                configuration, activity.getResources().getDisplayMetrics()
            );
        } catch (RuntimeException ignored) {
            // Nothing else can be done before the activity is created.
        }
    }
}
