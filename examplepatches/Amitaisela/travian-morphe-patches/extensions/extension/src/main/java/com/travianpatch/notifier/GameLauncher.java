package com.travianpatch.notifier;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;

/**
 * The intent that opens the Travian game, same as tapping its icon (the game's launcher Activity is
 * singleTask, so a running game is brought to the front instead of restarted). Uses the game's
 * Activity by name rather than getLaunchIntentForPackage, because the Travian Tools screen is a second
 * launcher Activity in this package and that call could pick it instead.
 */
final class GameLauncher {

    private static final String GAME_ACTIVITY =
            "com.traviangames.travianlegendsmobile.plugin.TravianLegendsActivity";

    private GameLauncher() {
    }

    /** Null if no launcher Activity other than the Travian Tools screen can be found. */
    static Intent launchIntent(Context ctx) {
        PackageManager pm = ctx.getPackageManager();
        String pkg = ctx.getPackageName();
        Intent explicit = launcher().setComponent(new ComponentName(pkg, GAME_ACTIVITY));
        if (pm.resolveActivity(explicit, 0) != null) {
            return explicit;
        }
        // The game's launcher class was renamed (an app version this patch hasn't seen): take the first
        // launcher entry of this package that isn't the Travian Tools screen.
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(pkg);
        for (ResolveInfo info : pm.queryIntentActivities(query, 0)) {
            if (!HubActivity.class.getName().equals(info.activityInfo.name)) {
                return launcher().setClassName(info.activityInfo.packageName, info.activityInfo.name);
            }
        }
        return null;
    }

    private static Intent launcher() {
        return new Intent(Intent.ACTION_MAIN)
                .addCategory(Intent.CATEGORY_LAUNCHER)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
    }
}
