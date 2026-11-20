package app.template.extension.flashscore;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * The "Patch settings" row on Flashscore's Settings screen. The row itself is added to
 * activity_settings by the "Patch settings" layout patch (an include of the stock arrow_row
 * layout with the id heval_controls_row), so this class only fills in the title, the gear icon and
 * the click. Any error leaves the screen as it is.
 */
@SuppressWarnings("unused")
public final class HevalControlsEntry {
    private static final String TAG = "Morphe-Flashscore";

    private static final String LABEL = "Patch settings";

    private static final String ROW_ID = "heval_controls_row";

    private static final String ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity";

    /** Whether the manifest declares {@link #ACTIVITY}; null until the first check. */
    private static volatile Boolean activityRegistered;

    private HevalControlsEntry() {
    }

    /** Patched in right after SettingsActivity.onCreate's setContentView. */
    public static void addRow(Activity activity) {
        try {
            if (activity == null) return;
            if (!isActivityRegistered(activity)) {
                Log.w(TAG, "Patch settings row not added: the screen is not in the manifest (Root Mount install?)");
                return;
            }
            Resources resources = activity.getResources();
            int id = resources.getIdentifier(ROW_ID, "id", activity.getPackageName());
            if (id == 0) {
                Log.w(TAG, "Patch settings row not added: the layout patch did not run");
                return;
            }
            View row = activity.findViewById(id);
            if (row == null) {
                Log.w(TAG, "Patch settings row not added: the row is not in the layout");
                return;
            }
            TextView title = firstTextView(row);
            if (title == null) {
                Log.w(TAG, "Patch settings row not added: the row layout has no title");
                return;
            }
            title.setText(LABEL);
            ImageView icon = firstImageView(row);
            if (icon != null) {
                Drawable gear = activity.getDrawable(android.R.drawable.ic_menu_manage);
                if (gear != null) {
                    icon.setImageDrawable(gear.mutate());
                    icon.setVisibility(View.VISIBLE);
                }
            }
            row.setClickable(true);
            row.setOnClickListener(new OpenControls());
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings row not added: " + failure.getClass().getName());
        }
    }

    private static TextView firstTextView(View root) {
        if (root instanceof TextView) return (TextView) root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = firstTextView(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    private static ImageView firstImageView(View root) {
        if (root instanceof ImageView) return (ImageView) root;
        if (!(root instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            ImageView found = firstImageView(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    /** Whether this install's manifest has the Patch settings screen (not the case on Root Mount). */
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

    static final class OpenControls implements View.OnClickListener {
        @Override
        public void onClick(View view) {
            if (view == null) return;
            try {
                Context context = view.getContext();
                Intent intent = new Intent().setClassName(context.getPackageName(), ACTIVITY);
                if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            } catch (Throwable failure) {
                Log.e(TAG, "Cannot open Patch settings: " + failure.getClass().getName());
            }
        }
    }
}
