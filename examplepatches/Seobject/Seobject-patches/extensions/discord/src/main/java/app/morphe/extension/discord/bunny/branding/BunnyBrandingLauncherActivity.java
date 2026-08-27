package app.morphe.extension.discord.bunny.branding;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

/**
 * Stable launcher indirection for Bunny's runtime branding aliases.
 *
 * Branding aliases target this Activity rather than Discord's live launcher
 * Activity. This makes launcher-component enable/disable transactions
 * independent from the Activity currently hosting the Discord UI.
 *
 * The real target is discovered semantically by the resource patch and stored
 * as manifest metadata, so no Discord class name or version is hardcoded here.
 */
public final class BunnyBrandingLauncherActivity extends Activity {
    private static final String TAG =
            "BunnyBrandingLauncher";

    private static final String TARGET_METADATA =
            "app.morphe.extension.discord.bunny.branding.ORIGINAL_LAUNCHER_TARGET";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        try {
            Intent incoming =
                    getIntent();

            Intent forward =
                    incoming == null
                            ? new Intent(Intent.ACTION_MAIN)
                            : new Intent(incoming);

            forward.setComponent(
                    resolveOriginalLauncher()
            );

            /*
             * A copied launcher intent can carry an alias/selector from the
             * original resolution. The explicit real target above is the only
             * component that should be resolved after this point.
             */
            forward.setSelector(null);

            /*
             * The branding alias lives in a no-affinity temporary task.
             * Start Discord's actual launcher in its normal app task so the
             * branding alias is never the base component of that task.
             */
            forward.addFlags(
                    Intent.FLAG_ACTIVITY_NEW_TASK
            );

            startActivity(forward);
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "Could not forward Bunny launcher intent",
                    failure
            );
        } finally {
            /*
             * This is only the temporary alias task. Discord itself has
             * already been forwarded into its normal task affinity.
             */
            finishAndRemoveTask();
        }
    }

    private ComponentName resolveOriginalLauncher()
            throws PackageManager.NameNotFoundException {
        PackageManager packageManager =
                getPackageManager();

        ComponentName trampoline =
                new ComponentName(
                        this,
                        BunnyBrandingLauncherActivity.class
                );

        ActivityInfo activityInfo =
                packageManager.getActivityInfo(
                        trampoline,
                        PackageManager.GET_META_DATA
                );

        if (activityInfo.metaData == null) {
            throw new IllegalStateException(
                    "Bunny launcher target metadata is missing"
            );
        }

        String className =
                activityInfo.metaData.getString(
                        TARGET_METADATA
                );

        if (
                className == null ||
                className.trim().isEmpty()
        ) {
            throw new IllegalStateException(
                    "Bunny launcher target metadata is empty"
            );
        }

        className =
                className.trim();

        if (className.startsWith(".")) {
            className =
                    getPackageName() +
                    className;
        } else if (className.indexOf('.') < 0) {
            className =
                    getPackageName() +
                    "." +
                    className;
        }

        ComponentName target =
                new ComponentName(
                        getPackageName(),
                        className
                );

        if (target.equals(trampoline)) {
            throw new IllegalStateException(
                    "Bunny launcher target resolves to the trampoline"
            );
        }

        return target;
    }
}