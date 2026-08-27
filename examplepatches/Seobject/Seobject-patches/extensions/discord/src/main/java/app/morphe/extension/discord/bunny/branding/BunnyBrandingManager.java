package app.morphe.extension.discord.bunny.branding;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.util.Log;

import app.morphe.extension.discord.bunny.launcher.BunnyShortcutPublisher;
import app.morphe.extension.discord.bunny.launcher.BunnyShortcutActivity;

import org.json.JSONObject;

/**
 * Native launcher-branding transaction for Bunny.
 *
 * This class intentionally owns no Bunny UI strings or settings persistence.
 * It changes only Android launcher components that are explicitly installed by
 * Bunny's manifest patch.
 *
 * Bunny's product identity inside the client is never derived from the active
 * launcher alias.
 */
public final class BunnyBrandingManager {
    private static final String TAG = "BunnyBranding";

    public static final String ICON_BUNNY = "bunny";
    public static final String ICON_BUNNY_MANAGER = "bunny_manager";
    public static final String ICON_VENDETTA = "vendetta";
    public static final String ICON_VENDETTA_MANAGER = "vendetta_manager";

    public static final String ICON_DISCORD = "discord";
    public static final String ICON_BRAND_INVERTED = "brand_inverted";
    public static final String ICON_MATTE_DARK = "matte_dark";
    public static final String ICON_MATTE_LIGHT = "matte_light";
    public static final String ICON_BRAND_DARK = "brand_dark";
    public static final String ICON_PASTEL = "pastel";
    public static final String ICON_PIRATE = "pirate";
    public static final String ICON_CAMO = "camo";
    public static final String ICON_SUNSET = "sunset";
    public static final String ICON_GALAXY = "galaxy";
    public static final String ICON_Y2K = "y2k";
    public static final String ICON_CHERRY_BLOSSOM = "cherry_blossom";
    public static final String ICON_BEANIE = "beanie";
    public static final String ICON_GAMING = "gaming";
    public static final String ICON_CIRCUIT = "circuit";
    public static final String ICON_HOLO_WAVES = "holo_waves";
    public static final String ICON_BLUSH = "blush";
    public static final String ICON_ANGRY = "angry";
    public static final String ICON_MANGA = "manga";
    public static final String ICON_CONTROLLER = "controller";
    public static final String ICON_MUSHROOM = "mushroom";
    public static final String ICON_BLURPLE_TWILIGHT = "blurple_twilight";
    public static final String ICON_IN_RAINBOWS = "in_rainbows";
    public static final String ICON_MIDNIGHT_PRISM = "midnight_prism";
    public static final String ICON_COLOR_WAVE = "color_wave";

    public static final String NAME_DISCORD = "discord";
    public static final String NAME_BUNNY = "bunny";
    public static final String NAME_VENDETTA = "vendetta";

    /*
     * Keep this prefix package-relative. The Android package identity is a
     * separate concern and must never be encoded into branding state.
     */
    private static final String ALIAS_PREFIX = ".bunny_branding_";

    private static final String PENDING_PREFS =
            "bunny.branding.pending";

    private static final String PENDING_ICON =
            "icon";

    private static final String PENDING_NAME =
            "name";

    private static final Object LIFECYCLE_LOCK =
            new Object();

    private static boolean lifecycleRegistered;
    private static int startedActivities;

    private static final String[] ICON_MODES = {
            ICON_DISCORD,
            ICON_BUNNY,
            ICON_BUNNY_MANAGER,
            ICON_VENDETTA,
            ICON_VENDETTA_MANAGER,
            ICON_BRAND_INVERTED,
            ICON_MATTE_DARK,
            ICON_MATTE_LIGHT,
            ICON_BRAND_DARK,
            ICON_PASTEL,
            ICON_PIRATE,
            ICON_CAMO,
            ICON_SUNSET,
            ICON_GALAXY,
            ICON_Y2K,
            ICON_CHERRY_BLOSSOM,
            ICON_BEANIE,
            ICON_GAMING,
            ICON_CIRCUIT,
            ICON_HOLO_WAVES,
            ICON_BLUSH,
            ICON_ANGRY,
            ICON_MANGA,
            ICON_CONTROLLER,
            ICON_MUSHROOM,
            ICON_BLURPLE_TWILIGHT,
            ICON_IN_RAINBOWS,
            ICON_MIDNIGHT_PRISM,
            ICON_COLOR_WAVE
    };

    private static final String[] NAME_MODES = {
            NAME_DISCORD,
            NAME_BUNNY,
            NAME_VENDETTA
    };

    private BunnyBrandingManager() {}

    /**
     * Returns the branding represented by the package's currently resolved
     * launcher component.
     *
     * Before Bunny's branding aliases are installed this safely reports an
     * unmanaged launcher instead of guessing.
     */
    public static String status(Activity activity) {
        if (activity == null) {
            return error("No active Discord window");
        }

        return statusActive(activity);
    }
    public static String apply(
            Activity activity,
            String requestedIconMode,
            String requestedAppNameMode
    ) {
        if (activity != null) {
            /*
             * Clear any pending value left by an older deferred-branding
             * build. The restart-required flow owns no lifecycle watcher.
             */
            pendingPrefs(activity)
                    .edit()
                    .clear()
                    .apply();
        }

        String result =
                applyNow(
                        activity,
                        requestedIconMode,
                        requestedAppNameMode
                );

        try {
            JSONObject parsed =
                    new JSONObject(result);

            if (
                    !"success".equals(
                            parsed.optString("status")
                    )
            ) {
                return result;
            }

            if (
                    !BunnyShortcutActivity
                            .restartAtFreshBootstrap(activity)
            ) {
                return error(
                        "Branding changed, but Bunny could not restart"
                );
            }

            return result;
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Could not complete branding restart",
                    failure
            );

            return error(
                    failure.getMessage()
            );
        }
    }
    private static String statusActive(Activity activity) {
        if (activity == null) {
            return error("No active Discord window");
        }

        try {
            PackageManager packageManager = activity.getPackageManager();
            ComponentName active = getActiveLauncherComponent(
                    activity,
                    packageManager
            );
            Selection selection = parseSelection(
                    activity.getPackageName(),
                    active
            );

            JSONObject result = new JSONObject()
                    .put("status", "success")
                    .put("managed", selection != null)
                    .put(
                            "component",
                            active == null
                                    ? JSONObject.NULL
                                    : active.getClassName()
                    );

            if (selection != null) {
                result.put("iconMode", selection.iconMode);
                result.put("appNameMode", selection.appNameMode);
            } else {
                result.put("iconMode", JSONObject.NULL);
                result.put("appNameMode", JSONObject.NULL);
            }

            return result.toString();
        } catch (Throwable failure) {
            Log.e(TAG, "Could not inspect launcher branding", failure);
            return error(failure.getMessage());
        }
    }

    /**
     * Switches to an already-installed Bunny branding alias.
     *
     * Transaction ordering is intentional:
     *
     * 1. Validate that the requested alias actually exists.
     * 2. Enable the requested alias.
     * 3. Verify that it is enabled.
     * 4. Disable stale Bunny branding aliases.
     * 5. Verify that the requested alias is still enabled.
     * 6. Republish Bunny's launcher quick actions against the now-active
     *    launcher component.
     *
     * A failure while disabling stale aliases can therefore cause duplicate
     * launcher entries, but must not leave the package with no enabled Bunny
     * launcher entry.
     */
    private static String applyNow(
            Activity activity,
            String requestedIconMode,
            String requestedAppNameMode
    ) {
        if (activity == null) {
            return error("No active Discord window");
        }

        String iconMode = normalizeIconMode(requestedIconMode);
        if (iconMode == null) {
            return error("Unsupported app icon mode");
        }

        String appNameMode = normalizeAppNameMode(requestedAppNameMode);
        if (appNameMode == null) {
            return error("Unsupported app name mode");
        }

        PackageManager packageManager = activity.getPackageManager();

        try {
            ComponentName requested = component(
                    activity.getPackageName(),
                    iconMode,
                    appNameMode
            );

            if (!componentExists(packageManager, requested)) {
                return error(
                        "Requested Bunny branding alias is not installed: "
                                + requested.getClassName()
                );
            }

            int disabledAliases = 0;

            if (
                    android.os.Build.VERSION.SDK_INT
                            >= android.os.Build.VERSION_CODES.TIRAMISU
            ) {
                /*
                 * Android 13+ can commit all launcher-alias state changes as
                 * one PackageManager transaction. This avoids temporarily
                 * changing the resolved launcher component in separate calls
                 * while the current Activity is running.
                 */
                java.util.ArrayList<PackageManager.ComponentEnabledSetting>
                        changes =
                        new java.util.ArrayList<>();

                changes.add(
                        new PackageManager.ComponentEnabledSetting(
                                requested,
                                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                                PackageManager.DONT_KILL_APP
                        )
                );

                for (String candidateIcon : ICON_MODES) {
                    for (String candidateName : NAME_MODES) {
                        ComponentName candidate = component(
                                activity.getPackageName(),
                                candidateIcon,
                                candidateName
                        );

                        if (candidate.equals(requested)) {
                            continue;
                        }

                        if (!componentExists(packageManager, candidate)) {
                            continue;
                        }

                        if (!isEffectivelyEnabled(packageManager, candidate)) {
                            continue;
                        }

                        changes.add(
                                new PackageManager.ComponentEnabledSetting(
                                        candidate,
                                        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                                        PackageManager.DONT_KILL_APP
                                )
                        );

                        disabledAliases++;
                    }
                }

                packageManager.setComponentEnabledSettings(
                        changes
                );
            }
            else {
                /*
                 * Pre-Android-13 fallback:
                 * enable the replacement first so Bunny can never lose its
                 * final launcher entry, then disable stale aliases.
                 */
                packageManager.setComponentEnabledSetting(
                        requested,
                        PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                        PackageManager.DONT_KILL_APP
                );

                if (!isEffectivelyEnabled(packageManager, requested)) {
                    return error(
                            "Android did not enable the requested Bunny launcher"
                    );
                }

                for (String candidateIcon : ICON_MODES) {
                    for (String candidateName : NAME_MODES) {
                        ComponentName candidate = component(
                                activity.getPackageName(),
                                candidateIcon,
                                candidateName
                        );

                        if (candidate.equals(requested)) {
                            continue;
                        }

                        if (!componentExists(packageManager, candidate)) {
                            continue;
                        }

                        if (!isEffectivelyEnabled(packageManager, candidate)) {
                            continue;
                        }

                        packageManager.setComponentEnabledSetting(
                                candidate,
                                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                                PackageManager.DONT_KILL_APP
                        );

                        disabledAliases++;
                    }
                }
            }
            if (!isEffectivelyEnabled(packageManager, requested)) {
                return error(
                        "Requested Bunny launcher became disabled during switch"
                );
            }

            /*
             * BunnyShortcutPublisher resolves getLaunchIntentForPackage()
             * dynamically, so it will bind Safe Mode, Recovery Settings, and
             * Settings to the newly active launcher component.
             */
            BunnyShortcutPublisher.publish(activity);

            ComponentName resolved = getActiveLauncherComponent(
                    activity,
                    packageManager
            );
            Selection resolvedSelection = parseSelection(
                    activity.getPackageName(),
                    resolved
            );

            JSONObject result = new JSONObject()
                    .put("status", "success")
                    .put("iconMode", iconMode)
                    .put("appNameMode", appNameMode)
                    .put("disabledAliases", disabledAliases)
                    .put(
                            "component",
                            requested.getClassName()
                    );

            /*
             * Some launchers/package-manager implementations may take a short
             * time to change the package's resolved launcher intent. This is
             * diagnostic only; we do not add arbitrary sleeps or retries.
             */
            if (resolvedSelection != null) {
                result.put(
                        "resolvedIconMode",
                        resolvedSelection.iconMode
                );
                result.put(
                        "resolvedAppNameMode",
                        resolvedSelection.appNameMode
                );
            }


            return result.toString();
        } catch (Throwable failure) {
            /*
             * Because the requested alias is enabled before stale aliases are
             * disabled, this error path is fail-safe with respect to launcher
             * availability.
             */
            Log.e(TAG, "Could not switch Bunny launcher branding", failure);
            return error(failure.getMessage());
        }
    }

    private static SharedPreferences pendingPrefs(
            Activity activity
    ) {
        return activity
                .getApplicationContext()
                .getSharedPreferences(
                        PENDING_PREFS,
                        0
                );
    }

    private static PendingSelection readPending(
            Activity activity
    ) {
        SharedPreferences prefs =
                pendingPrefs(activity);

        String iconMode =
                normalizeIconMode(
                        prefs.getString(
                                PENDING_ICON,
                                null
                        )
                );

        String appNameMode =
                normalizeAppNameMode(
                        prefs.getString(
                                PENDING_NAME,
                                null
                        )
                );

        if (
                iconMode == null ||
                appNameMode == null
        ) {
            return null;
        }

        return new PendingSelection(
                iconMode,
                appNameMode
        );
    }

    private static void clearPendingIfUnchanged(
            Activity activity,
            PendingSelection applied
    ) {
        SharedPreferences prefs =
                pendingPrefs(activity);

        if (
                !applied.iconMode.equals(
                        prefs.getString(
                                PENDING_ICON,
                                null
                        )
                ) ||
                !applied.appNameMode.equals(
                        prefs.getString(
                                PENDING_NAME,
                                null
                        )
                )
        ) {
            return;
        }

        prefs.edit()
                .remove(PENDING_ICON)
                .remove(PENDING_NAME)
                .commit();
    }

    private static void applyPending(
            Activity activity
    ) {
        PendingSelection pending =
                readPending(activity);

        if (pending == null) {
            return;
        }

        try {
            JSONObject result =
                    new JSONObject(
                            applyNow(
                                    activity,
                                    pending.iconMode,
                                    pending.appNameMode
                            )
                    );

            if (
                    "success".equals(
                            result.optString("status")
                    )
            ) {
                clearPendingIfUnchanged(
                        activity,
                        pending
                );
            } else {
                Log.e(
                        TAG,
                        "Pending launcher branding failed: "
                                + result.optString(
                                        "message"
                                )
                );
            }
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Could not apply pending Bunny branding",
                    failure
            );
        }
    }

    private static void ensureLifecycleWatcher(
            Activity activity
    ) {
        synchronized (LIFECYCLE_LOCK) {
            if (lifecycleRegistered) {
                return;
            }

            /*
             * This watcher is registered from an already-started Bunny
             * Activity, so count that current Activity once.
             */
            startedActivities = 1;

            Application application =
                    activity.getApplication();

            application.registerActivityLifecycleCallbacks(
                    new Application.ActivityLifecycleCallbacks() {
                        @Override
                        public void onActivityCreated(
                                Activity current,
                                Bundle state
                        ) {}

                        @Override
                        public void onActivityStarted(
                                Activity current
                        ) {
                            synchronized (LIFECYCLE_LOCK) {
                                startedActivities++;
                            }
                        }

                        @Override
                        public void onActivityResumed(
                                Activity current
                        ) {}

                        @Override
                        public void onActivityPaused(
                                Activity current
                        ) {}

                        @Override
                        public void onActivityStopped(
                                Activity current
                        ) {
                            boolean backgrounded;

                            synchronized (LIFECYCLE_LOCK) {
                                if (startedActivities > 0) {
                                    startedActivities--;
                                }

                                backgrounded =
                                        startedActivities == 0 &&
                                        !current.isChangingConfigurations();
                            }

                            if (backgrounded) {
                                applyPending(current);
                            }
                        }

                        @Override
                        public void onActivitySaveInstanceState(
                                Activity current,
                                Bundle state
                        ) {}

                        @Override
                        public void onActivityDestroyed(
                                Activity current
                        ) {}
                    }
            );

            lifecycleRegistered = true;
        }
    }

    private static final class PendingSelection {
        final String iconMode;
        final String appNameMode;

        PendingSelection(
                String iconMode,
                String appNameMode
        ) {
            this.iconMode =
                    iconMode;

            this.appNameMode =
                    appNameMode;
        }
    }
    private static ComponentName getActiveLauncherComponent(
            Activity activity,
            PackageManager packageManager
    ) {
        Intent launcherIntent = packageManager.getLaunchIntentForPackage(
                activity.getPackageName()
        );

        return launcherIntent == null
                ? null
                : launcherIntent.getComponent();
    }

    private static ComponentName component(
            String packageName,
            String iconMode,
            String appNameMode
    ) {
        return new ComponentName(
                packageName,
                packageName
                        + ALIAS_PREFIX
                        + iconMode
                        + "__"
                        + appNameMode
        );
    }

    private static boolean componentExists(
            PackageManager packageManager,
            ComponentName component
    ) {
        try {
            packageManager.getActivityInfo(
                    component,
                    PackageManager.MATCH_DISABLED_COMPONENTS
            );
            return true;
        } catch (PackageManager.NameNotFoundException ignored) {
            return false;
        }
    }

    private static boolean isEffectivelyEnabled(
            PackageManager packageManager,
            ComponentName component
    ) {
        int override = packageManager.getComponentEnabledSetting(component);

        if (override == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) {
            return true;
        }

        if (
                override == PackageManager.COMPONENT_ENABLED_STATE_DISABLED
                        || override
                        == PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER
                        || override
                        == PackageManager.COMPONENT_ENABLED_STATE_DISABLED_UNTIL_USED
        ) {
            return false;
        }

        try {
            ActivityInfo info = packageManager.getActivityInfo(
                    component,
                    PackageManager.MATCH_DISABLED_COMPONENTS
            );
            return info.enabled;
        } catch (PackageManager.NameNotFoundException ignored) {
            return false;
        }
    }

    private static Selection parseSelection(
            String packageName,
            ComponentName component
    ) {
        if (component == null) {
            return null;
        }

        for (String iconMode : ICON_MODES) {
            for (String appNameMode : NAME_MODES) {
                ComponentName candidate = component(
                        packageName,
                        iconMode,
                        appNameMode
                );

                if (candidate.equals(component)) {
                    return new Selection(iconMode, appNameMode);
                }
            }
        }

        return null;
    }

    private static String normalizeIconMode(String value) {
        if (value == null) {
            return null;
        }

        String normalized = value.trim();

        for (String candidate : ICON_MODES) {
            if (candidate.equals(normalized)) {
                return candidate;
            }
        }

        return null;
    }

    private static String normalizeAppNameMode(String value) {
        if (value == null) {
            return null;
        }

        String normalized = value.trim();

        for (String candidate : NAME_MODES) {
            if (candidate.equals(normalized)) {
                return candidate;
            }
        }

        return null;
    }

    private static String error(String message) {
        try {
            return new JSONObject()
                    .put("status", "error")
                    .put(
                            "message",
                            message == null
                                    ? "Custom Branding operation failed"
                                    : message
                    )
                    .toString();
        } catch (Throwable ignored) {
            return "{\"status\":\"error\"}";
        }
    }

    private static final class Selection {
        final String iconMode;
        final String appNameMode;

        Selection(
                String iconMode,
                String appNameMode
        ) {
            this.iconMode = iconMode;
            this.appNameMode = appNameMode;
        }
    }
}