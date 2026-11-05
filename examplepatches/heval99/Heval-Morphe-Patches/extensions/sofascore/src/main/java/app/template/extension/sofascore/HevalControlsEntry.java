package app.template.extension.sofascore;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The "Patch settings" row on Sofascore's Settings screen (SettingsFragment). It goes right after
 * "Preferences" in the first card. The stock rows are ProfileClickableRowView, a LinearLayout that
 * inflates its own icon, label and info views; the new row is a second instance of the same class
 * built in code, so it keeps the stock padding, ripple and chevron, with the label and a gear icon
 * set through the child views' resource entry names. If that fails, a plain row styled after the
 * stock label is added instead. Any other error leaves the screen as it is. No row on a Root Mount
 * install: it keeps the stock manifest, so the screen is not registered there.
 */
@SuppressWarnings("unused")
public final class HevalControlsEntry {
    private static final String TAG = "Morphe-Sofascore";

    /** Marks the added row, so a second call on the same view tree adds nothing. */
    static final String ROW_TAG = "heval_controls_row";

    private static final String LABEL = "Patch settings";

    private static final String ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity";

    /** Whether the manifest declares {@link #ACTIVITY}; null until the first check. */
    private static volatile Boolean activityRegistered;

    /**
     * Patched in at the start of SettingsFragment's onViewCreated implementation, with the
     * fragment's root view: adds the "Patch settings" row after "Preferences" (or "Notifications").
     */
    public static void addRow(View root) {
        try {
            if (root == null) return;
            if (!isActivityRegistered(root.getContext())) {
                Log.w(TAG, "Patch settings row not added: the screen is not in the manifest (Root Mount install?)");
                return;
            }
            Resources resources = root.getResources();
            View anchor = findByEntryName(root, "button_preferences", resources);
            if (anchor == null) anchor = findByEntryName(root, "button_notifications", resources);
            if (anchor == null) {
                Log.w(TAG, "Patch settings row not added: no Preferences or Notifications row");
                return;
            }
            ViewParent parent = anchor.getParent();
            if (!(parent instanceof LinearLayout) || ((LinearLayout) parent).getOrientation() != LinearLayout.VERTICAL) {
                Log.w(TAG, "Patch settings row not added: the settings rows are not in a vertical LinearLayout");
                return;
            }
            LinearLayout list = (LinearLayout) parent;
            if (list.findViewWithTag(ROW_TAG) != null) return;

            View row = cloneRow(anchor, resources);
            if (row == null) row = plainRow(anchor, resources);
            if (row == null) {
                Log.w(TAG, "Patch settings row not added: the stock row has no label");
                return;
            }
            row.setTag(ROW_TAG);
            row.setOnClickListener(new OpenControls());
            list.addView(row, list.indexOfChild(anchor) + 1);
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings row not added: " + failure.getClass().getName());
        }
    }

    /** A new row of the stock row's own class (its (Context, AttributeSet) constructor), or null. */
    private static View cloneRow(View stock, Resources resources) {
        try {
            Context context = stock.getContext();
            View row = (View) stock.getClass()
                    .getConstructor(Context.class, AttributeSet.class)
                    .newInstance(context, null);
            View label = findByEntryName(row, "label", resources);
            if (!(label instanceof TextView)) return null;
            ((TextView) label).setText(LABEL);

            View icon = findByEntryName(row, "icon", resources);
            View stockIcon = findByEntryName(stock, "icon", resources);
            if (icon instanceof ImageView) {
                Drawable gear = context.getDrawable(android.R.drawable.ic_menu_manage);
                if (gear != null) {
                    ImageView image = (ImageView) icon;
                    image.setImageDrawable(gear.mutate());
                    if (stockIcon instanceof ImageView) {
                        image.setImageTintList(((ImageView) stockIcon).getImageTintList());
                    }
                    image.setVisibility(View.VISIBLE);
                }
            }
            row.setLayoutParams(copyParams(stock.getLayoutParams()));
            return row;
        } catch (Throwable failure) {
            Log.w(TAG, "Patch settings row: cloning the stock row failed: " + failure.getClass().getName());
            return null;
        }
    }

    /** A plain text row styled after the stock row's label, or null when there is no label. */
    private static View plainRow(View stock, Resources resources) {
        View found = findByEntryName(stock, "label", resources);
        if (!(found instanceof TextView)) return null;
        TextView label = (TextView) found;
        Context context = stock.getContext();
        TextView row = new TextView(context);
        row.setText(LABEL);
        row.setTextSize(TypedValue.COMPLEX_UNIT_PX, label.getTextSize());
        row.setTextColor(label.getTextColors());
        row.setTypeface(label.getTypeface());
        row.setGravity(label.getGravity());
        row.setPaddingRelative(stock.getPaddingStart(), stock.getPaddingTop(), stock.getPaddingEnd(), stock.getPaddingBottom());
        row.setLayoutParams(copyParams(stock.getLayoutParams()));
        row.setBackground(themeDrawable(context, android.R.attr.selectableItemBackground));
        return row;
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

    private static LinearLayout.LayoutParams copyParams(ViewGroup.LayoutParams params) {
        if (params instanceof LinearLayout.LayoutParams) return new LinearLayout.LayoutParams((LinearLayout.LayoutParams) params);
        if (params instanceof ViewGroup.MarginLayoutParams) return new LinearLayout.LayoutParams((ViewGroup.MarginLayoutParams) params);
        if (params != null) return new LinearLayout.LayoutParams(params);
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static Drawable themeDrawable(Context context, int attribute) {
        TypedArray values = context.obtainStyledAttributes(new int[] { attribute });
        try {
            return values.getDrawable(0);
        } finally {
            values.recycle();
        }
    }

    /** The first view in the tree of {@code view} whose id has the resource entry name {@code name}. */
    private static View findByEntryName(View view, String name, Resources resources) {
        int id = view.getId();
        // Only resource ids (with a package byte); View.generateViewId ids have no entry name.
        if (id != View.NO_ID && (id >>> 24) != 0) {
            try {
                if (name.equals(resources.getResourceEntryName(id))) return view;
            } catch (Resources.NotFoundException ignored) {
                // Not a resource id of this app.
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findByEntryName(group.getChildAt(i), name, resources);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** Starts the (non-exported) Patch settings screen on top of the current Sofascore activity. */
    static void open(Context context) {
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

    /** The fragment's context is a Hilt ContextWrapper around the activity. */
    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    static final class OpenControls implements View.OnClickListener {
        @Override
        public void onClick(View view) {
            if (view != null) open(view.getContext());
        }
    }

    private HevalControlsEntry() { }
}
