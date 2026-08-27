package app.morphe.extension.discord.bunny.launcher;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * Publishes Bunny's exact three launcher quick actions while coexisting
 * with Discord's communication shortcuts used by Android Direct Share.
 *
 * Bunny never republishes Discord-owned ShortcutInfo objects. Android's
 * ShortcutManager documentation warns that re-publishing ShortcutInfo
 * objects returned by the system can lose shortcut information such as
 * icons.
 *
 * Instead, Bunny reserves capacity for its own three mutable dynamic
 * shortcuts. If the target launcher Activity is already at capacity,
 * only the lowest-priority excess Discord dynamic shortcuts for that
 * same Activity are removed. Discord remains responsible for publishing
 * and updating its own communication shortcuts.
 */
public final class BunnyShortcutPublisher {
    private static final String TAG = "BunnyShortcuts";

    private static final String URI_SAFE_MODE =
            "bunny-morphe://shortcut/safe-mode";

    private static final String URI_RECOVERY_SETTINGS =
            "bunny-morphe://shortcut/recovery-settings";

    private static final String URI_SETTINGS =
            "bunny-morphe://shortcut/settings";

    private static final int BUNNY_SHORTCUT_COUNT = 3;

    private BunnyShortcutPublisher() {}

    public static void publish(Activity activity) {
        if (activity == null || Build.VERSION.SDK_INT < 25) {
            return;
        }

        try {
            ShortcutManager manager =
                    activity.getSystemService(ShortcutManager.class);

            if (manager == null) {
                return;
            }

            PackageManager packageManager =
                    activity.getPackageManager();

            Intent launcherIntent =
                    packageManager.getLaunchIntentForPackage(
                            activity.getPackageName()
                    );

            ComponentName launcherComponent =
                    launcherIntent != null
                            ? launcherIntent.getComponent()
                            : null;

            if (launcherComponent == null) {
                throw new IllegalStateException(
                        "Discord launcher component is unavailable"
                );
            }

            int maxPerActivity =
                    manager.getMaxShortcutCountPerActivity();

            int manifestCount =
                    countManifestShortcuts(
                            manager,
                            launcherComponent
                    );

            int dynamicCapacity =
                    maxPerActivity - manifestCount;

            if (dynamicCapacity < BUNNY_SHORTCUT_COUNT) {
                throw new IllegalStateException(
                        "Shortcut capacity "
                                + maxPerActivity
                                + " with "
                                + manifestCount
                                + " manifest shortcuts cannot fit Bunny's "
                                + BUNNY_SHORTCUT_COUNT
                                + " launcher shortcuts"
                );
            }

            int iconResource =
                    resolveLauncherIcon(
                            activity,
                            launcherComponent
                    );

            List<ShortcutInfo> bunnyShortcuts =
                    Arrays.asList(
                            create(
                                    activity,
                                    launcherComponent,
                                    BunnyShortcutContract.ID_SAFE_MODE,
                                    "Safe Mode",
                                    URI_SAFE_MODE,
                                    0,
                                    iconResource
                            ),
                            create(
                                    activity,
                                    launcherComponent,
                                    BunnyShortcutContract.ID_RECOVERY_SETTINGS,
                                    "Recovery Settings",
                                    URI_RECOVERY_SETTINGS,
                                    1,
                                    iconResource
                            ),
                            create(
                                    activity,
                                    launcherComponent,
                                    BunnyShortcutContract.ID_SETTINGS,
                                    "Settings",
                                    URI_SETTINGS,
                                    2,
                                    iconResource
                            )
                    );

            List<ShortcutInfo> sameActivityStock =
                    new ArrayList<>();

            for (ShortcutInfo shortcut : manager.getDynamicShortcuts()) {
                if (shortcut == null || isBunnyShortcut(shortcut.getId())) {
                    continue;
                }

                ComponentName owner =
                        shortcut.getActivity();

                /*
                 * Android assigns a dynamic shortcut with no explicit
                 * target Activity to the package's default launcher
                 * Activity when it is published.
                 */
                if (owner == null || launcherComponent.equals(owner)) {
                    sameActivityStock.add(shortcut);
                }
            }

            int stockCapacity =
                    dynamicCapacity - BUNNY_SHORTCUT_COUNT;

            sameActivityStock.sort(
                    Comparator.comparingInt(
                            ShortcutInfo::getRank
                    )
            );

            List<String> removeIds =
                    new ArrayList<>();

            for (
                    int index = stockCapacity;
                    index < sameActivityStock.size();
                    index++
            ) {
                removeIds.add(
                        sameActivityStock.get(index).getId()
                );
            }

            if (!removeIds.isEmpty()) {
                manager.removeDynamicShortcuts(removeIds);
            }

            /*
             * addDynamicShortcuts updates mutable shortcuts with matching
             * IDs and otherwise adds them. Crucially, it does not replace
             * Discord's entire dynamic-shortcut set.
             */
            boolean published =
                    manager.addDynamicShortcuts(bunnyShortcuts);

            if (!published) {
                Log.w(
                        TAG,
                        "ShortcutManager rejected Bunny shortcut update"
                );

                return;
            }

        } catch (Throwable failure) {
            Log.w(
                    TAG,
                    "Could not publish Bunny launcher shortcuts",
                    failure
            );
        }
    }

    private static int countManifestShortcuts(
            ShortcutManager manager,
            ComponentName launcherComponent
    ) {
        int count = 0;

        for (ShortcutInfo shortcut : manager.getManifestShortcuts()) {
            if (shortcut == null) {
                continue;
            }

            ComponentName owner =
                    shortcut.getActivity();

            if (owner == null || launcherComponent.equals(owner)) {
                count++;
            }
        }

        return count;
    }

    private static boolean isBunnyShortcut(String id) {
        return BunnyShortcutContract.ID_SAFE_MODE.equals(id)
                || BunnyShortcutContract.ID_RECOVERY_SETTINGS.equals(id)
                || BunnyShortcutContract.ID_SETTINGS.equals(id);
    }

    private static ShortcutInfo create(
            Activity activity,
            ComponentName launcherComponent,
            String id,
            String label,
            String uri,
            int rank,
            int iconResource
    ) {
        Intent intent =
                new Intent(Intent.ACTION_VIEW)
                        .setData(Uri.parse(uri))
                        .setComponent(launcherComponent)
                        .addFlags(
                                Intent.FLAG_ACTIVITY_NEW_TASK
                                        | Intent.FLAG_ACTIVITY_CLEAR_TOP
                                        | Intent.FLAG_ACTIVITY_SINGLE_TOP
                        );

        return new ShortcutInfo.Builder(activity, id)
                .setActivity(launcherComponent)
                .setShortLabel(label)
                .setLongLabel(label)
                .setIcon(
                        Icon.createWithResource(
                                activity,
                                iconResource
                        )
                )
                .setIntent(intent)
                .setRank(rank)
                .build();
    }

    private static int resolveLauncherIcon(
            Activity activity,
            ComponentName launcherComponent
    ) throws PackageManager.NameNotFoundException {
        ActivityInfo launcher =
                activity.getPackageManager()
                        .getActivityInfo(
                                launcherComponent,
                                0
                        );

        int launcherIcon =
                launcher.getIconResource();

        if (launcherIcon != 0) {
            return launcherIcon;
        }

        int applicationIcon =
                activity.getApplicationInfo().icon;

        if (applicationIcon == 0) {
            throw new IllegalStateException(
                    "Discord launcher icon is unavailable"
            );
        }

        return applicationIcon;
    }
}