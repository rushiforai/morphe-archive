package app.template.extension.samsungkeyboard.controls;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

/**
 * The "Patch settings" entry of Samsung Keyboard's settings pages: an overflow menu item added to
 * HoneyBoardSettingsFragment's options menu. Both hooks sit at the start of the fragment's
 * onCreateOptionsMenu and onOptionsItemSelected and pass the fragment's Context. No item on a Root
 * Mount install: it keeps the stock manifest, so the screen is not registered there. Any error
 * leaves the menu as it is.
 */
@SuppressWarnings("unused")
public final class HevalControlsEntry {
    private static final String TAG = "Morphe-SamsungKeyboard";

    private static final String LABEL = "Patch settings";

    private static final String ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity";

    /** Menu item id: not a resource id, so it cannot clash with the stock items. */
    private static final int ITEM_ID = 0x5EE70001;

    /** Sorts after the stock items. */
    private static final int ITEM_ORDER = 1000;

    /** Whether the manifest declares {@link #ACTIVITY}; null until the first check. */
    private static volatile Boolean activityRegistered;

    /** Patched in at the start of onCreateOptionsMenu with the fragment's context. */
    public static void addItem(Context context, Menu menu) {
        try {
            if (context == null || menu == null) return;
            if (!isActivityRegistered(context)) {
                Log.w(TAG, "Patch settings item not added: the screen is not in the manifest (Root Mount install?)");
                return;
            }
            if (menu.findItem(ITEM_ID) != null) return;
            menu.add(Menu.NONE, ITEM_ID, ITEM_ORDER, LABEL).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings item not added: " + failure.getClass().getName());
        }
    }

    /** Patched in at the start of onOptionsItemSelected: true when the item was ours and is handled. */
    public static boolean handles(Context context, MenuItem item) {
        try {
            if (context == null || item == null || item.getItemId() != ITEM_ID) return false;
            open(context);
            return true;
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings item not handled: " + failure.getClass().getName());
            return false;
        }
    }

    private static boolean isActivityRegistered(Context context) {
        Boolean known = activityRegistered;
        if (known != null) return known;
        boolean registered;
        try {
            context.getPackageManager().getActivityInfo(new ComponentName(context.getPackageName(), ACTIVITY), 0);
            registered = true;
        } catch (PackageManager.NameNotFoundException missing) {
            registered = false;
        }
        activityRegistered = registered;
        return registered;
    }

    /** Starts the (non-exported) Patch settings screen on top of the current settings activity. */
    private static void open(Context context) {
        try {
            Activity activity = activityOf(context);
            Intent intent = new Intent().setClassName(context.getPackageName(), ACTIVITY);
            if (activity != null) {
                activity.startActivity(intent);
            } else {
                context.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            }
        } catch (Throwable failure) {
            Log.e(TAG, "Cannot open Patch settings: " + failure.getClass().getName());
            try {
                Toast.makeText(context, "Patch settings could not be opened", Toast.LENGTH_SHORT).show();
            } catch (Throwable ignored) {
                // The notice is optional.
            }
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private HevalControlsEntry() { }
}
