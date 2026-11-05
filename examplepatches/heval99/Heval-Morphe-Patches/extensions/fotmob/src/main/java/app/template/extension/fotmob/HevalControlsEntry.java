package app.template.extension.fotmob;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The "Patch settings" row on FotMob's Settings screen (SettingsActivity, layout
 * activity_settings). It goes right after the Support row in the "Others" section. The stock rows
 * are includes of settings_line_left_icon (icon, title, subtitle); the new row inflates that same
 * layout, so it keeps the stock padding, background and text styles, with a gear icon. Any error
 * leaves the screen as it is. No row on a Root Mount install: it keeps the stock manifest, so the
 * Patch settings screen is not registered there.
 */
@SuppressWarnings("unused")
public final class HevalControlsEntry {
    private static final String TAG = "Morphe-FotMob";

    /** Marks the added row, so a second call on the same activity adds nothing. */
    static final String ROW_TAG = "heval_controls_row";

    private static final String LABEL = "Patch settings";
    private static final String SUMMARY = "Turn patched features on or off";

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
            String pkg = activity.getPackageName();
            View anchor = byName(activity, resources, pkg, "layout_support");
            if (anchor == null) anchor = byName(activity, resources, pkg, "layout_privacy_policy");
            if (anchor == null) {
                Log.w(TAG, "Patch settings row not added: no Support or Privacy policy row");
                return;
            }
            ViewParent parent = anchor.getParent();
            if (!(parent instanceof LinearLayout) || ((LinearLayout) parent).getOrientation() != LinearLayout.VERTICAL) {
                Log.w(TAG, "Patch settings row not added: the settings rows are not in a vertical LinearLayout");
                return;
            }
            LinearLayout list = (LinearLayout) parent;
            if (list.findViewWithTag(ROW_TAG) != null) return;

            int layout = resources.getIdentifier("settings_line_left_icon", "layout", pkg);
            if (layout == 0) {
                Log.w(TAG, "Patch settings row not added: no settings_line_left_icon layout");
                return;
            }
            View row = LayoutInflater.from(activity).inflate(layout, list, false);
            View title = row.findViewById(resources.getIdentifier("textView_title", "id", pkg));
            if (!(title instanceof TextView)) {
                Log.w(TAG, "Patch settings row not added: the row layout has no title");
                return;
            }
            ((TextView) title).setText(LABEL);
            View subtitle = row.findViewById(resources.getIdentifier("textView_subtitle", "id", pkg));
            if (subtitle instanceof TextView) {
                ((TextView) subtitle).setText(SUMMARY);
                subtitle.setVisibility(View.VISIBLE);
            }
            View icon = row.findViewById(resources.getIdentifier("imageView_icon", "id", pkg));
            if (icon instanceof ImageView) {
                Drawable gear = activity.getDrawable(android.R.drawable.ic_menu_manage);
                if (gear != null) ((ImageView) icon).setImageDrawable(gear.mutate());
            }
            // The stock rows get their margins from the include; copy the anchor's.
            ViewGroup.LayoutParams params = anchor.getLayoutParams();
            if (params instanceof LinearLayout.LayoutParams) {
                row.setLayoutParams(new LinearLayout.LayoutParams((LinearLayout.LayoutParams) params));
            }
            row.setTag(ROW_TAG);
            row.setOnClickListener(new OpenControls());
            list.addView(row, list.indexOfChild(anchor) + 1);
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings row not added: " + failure.getClass().getName());
        }
    }

    private static View byName(Activity activity, Resources resources, String pkg, String name) {
        int id = resources.getIdentifier(name, "id", pkg);
        return id == 0 ? null : activity.findViewById(id);
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

    /** Starts the (non-exported) Patch settings screen on top of FotMob's Settings screen. */
    static void open(Context context) {
        try {
            Intent intent = new Intent().setClassName(context.getPackageName(), ACTIVITY);
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable failure) {
            Log.e(TAG, "Cannot open Patch settings: " + failure.getClass().getName());
            try {
                Toast.makeText(context, "Patch settings could not be opened", Toast.LENGTH_SHORT).show();
            } catch (Throwable ignored) {
                // The notice is optional.
            }
        }
    }

    static final class OpenControls implements View.OnClickListener {
        @Override
        public void onClick(View view) {
            if (view != null) open(view.getContext());
        }
    }
}
