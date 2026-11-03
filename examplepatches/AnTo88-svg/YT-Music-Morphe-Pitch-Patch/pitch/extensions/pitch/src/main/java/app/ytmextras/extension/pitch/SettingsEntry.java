package app.ytmextras.extension.pitch;

import android.app.Activity;
import android.app.Application;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.util.Log;

/**
 * Adds the setting to the Morphe settings if the app has them.
 * This patch cannot depend on the Morphe settings patch, because it must also work on its own.
 */
@SuppressWarnings("deprecation")
final class SettingsEntry {

    private static final String TAG = "YtmExtrasPitch";
    private static final String KEY = "ytmextras_pitch";
    private static final String ACTION = "app.ytmextras.action.PITCH_SETTINGS";
    private static final String MORPHE_SETTINGS_ACTIVITY =
            "com.google.android.gms.common.api.GoogleApiActivity";

    private static boolean registered;

    private SettingsEntry() {
    }

    static void register(Application application) {
        if (registered) {
            return;
        }
        registered = true;

        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                if (MORPHE_SETTINGS_ACTIVITY.equals(activity.getClass().getName())) {
                    activity.getWindow().getDecorView().post(() -> addPreference(activity));
                }
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /**
     * Uses the layout of the other items, and the icon that this patch adds to the app.
     */
    private static void setAppearance(Activity activity, Preference preference) {
        final String packageName = activity.getPackageName();
        final int layout = activity.getResources()
                .getIdentifier("morphe_preference_with_icon", "layout", packageName);
        final int icon = activity.getResources()
                .getIdentifier("ytmextras_pitch_icon", "drawable", packageName);

        if (layout != 0) {
            preference.setLayoutResource(layout);
        }
        if (icon != 0) {
            preference.setIcon(icon);
        }
    }

    private static void addPreference(Activity activity) {
        try {
            for (Fragment fragment : activity.getFragmentManager().getFragments()) {
                if (!(fragment instanceof PreferenceFragment)) {
                    continue;
                }

                PreferenceScreen screen = ((PreferenceFragment) fragment).getPreferenceScreen();
                if (screen == null || screen.findPreference(KEY) != null) {
                    continue;
                }

                Preference preference = new Preference(activity);
                preference.setKey(KEY);
                preference.setTitle(PitchSettingsActivity.title());
                setAppearance(activity, preference);
                preference.setIntent(new Intent(ACTION).setPackage(activity.getPackageName()));
                screen.addPreference(preference);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not add the preference", ex);
        }
    }
}
