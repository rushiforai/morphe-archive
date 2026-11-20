package app.template.extension.scores365;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;

/**
 * The "Patch settings" row of 365Scores' Settings page. The page's list builder adds one more row
 * (an item with this class's {@link #TITLE} and {@link #ITEM_ID} as its id, which no stock row
 * uses), and the page's row click handler hands a row's id to {@link #handles(Context, int)} first:
 * for this row it opens the Patch settings screen and the stock handler is skipped. Any error
 * leaves the stock behaviour. There is no row on a Root Mount install: it keeps the stock manifest,
 * so the Patch settings screen is not registered there (the patch still adds the row; the click
 * then does nothing).
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    private static final String TAG = "Morphe-365Settings";

    /** Row title. */
    public static final String TITLE = "Patch settings";

    /** The row's id: far above every stock row id (the SettingsItemType values are small). */
    public static final int ITEM_ID = 0x5EE7;

    private static final String ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity";

    private SettingsEntry() {
    }

    /** Patched in at the start of the row click handler; true when the click was ours (skip the stock code). */
    public static boolean handles(Context context, int itemId) {
        try {
            if (itemId != ITEM_ID) return false;
            if (context == null) return true;
            if (!isActivityRegistered(context)) {
                Log.w(TAG, "Patch settings not opened: the screen is not in the manifest (Root Mount install?)");
                return true;
            }
            Intent intent = new Intent().setComponent(new ComponentName(context.getPackageName(), ACTIVITY));
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return true;
        } catch (Throwable failure) {
            Log.e(TAG, "Cannot open Patch settings: " + failure.getClass().getName());
            return itemId == ITEM_ID;
        }
    }

    private static boolean isActivityRegistered(Context context) {
        try {
            context.getPackageManager().getActivityInfo(new ComponentName(context.getPackageName(), ACTIVITY), 0);
            return true;
        } catch (PackageManager.NameNotFoundException missing) {
            return false;
        }
    }
}
