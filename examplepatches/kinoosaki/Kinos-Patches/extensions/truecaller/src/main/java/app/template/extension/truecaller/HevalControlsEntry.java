package app.template.extension.truecaller;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The "Patch settings" row on Truecaller's main Settings screen (CategoriesFragment). It goes right
 * after "Help" (the last row), with a divider like the stock rows, and is styled after Help: same
 * text size, colours, font, padding, height and icon size. A tap opens the Patch settings screen.
 * Stock rows are found by their resource entry names, which survive R8 and a package rename. Any
 * error leaves the screen as it is. No row on a Root Mount install: it keeps the stock manifest, so
 * the screen is not registered there (the features still run with their saved or default state).
 */
@SuppressWarnings("unused")
public final class HevalControlsEntry {
    private static final String TAG = "Morphe-Truecaller";

    /** Marks the added row, so a second call on the same view tree adds nothing. */
    static final String ROW_TAG = "heval_controls_row";

    private static final String LABEL = "Patch settings";

    private static final String ACTIVITY = "app.template.extension.hevalcontrols.ui.HevalControlsActivity";

    /** Whether the manifest declares {@link #ACTIVITY}; null until the first check. */
    private static volatile Boolean activityRegistered;

    /**
     * Patched in right after CategoriesFragment.onViewCreated calls super.onViewCreated, with the
     * fragment's root view: adds a divider and the "Patch settings" row after "Help" (or "About").
     */
    public static void addRow(View root) {
        try {
            if (root == null) return;
            if (!isActivityRegistered(root.getContext())) {
                Log.w(TAG, "Patch settings row not added: the screen is not in the manifest (Root Mount install?)");
                return;
            }
            Resources resources = root.getResources();
            View anchor = findByEntryName(root, "item_help", resources);
            if (anchor == null) anchor = findByEntryName(root, "item_about", resources);
            if (!(anchor instanceof TextView)) {
                Log.w(TAG, "Patch settings row not added: no Help or About row");
                return;
            }
            ViewParent parent = anchor.getParent();
            if (!(parent instanceof LinearLayout) || ((LinearLayout) parent).getOrientation() != LinearLayout.VERTICAL) {
                Log.w(TAG, "Patch settings row not added: the settings rows are not in a vertical LinearLayout");
                return;
            }
            LinearLayout list = (LinearLayout) parent;
            if (list.findViewWithTag(ROW_TAG) != null) return;

            TextView stock = (TextView) anchor;
            Context context = stock.getContext();
            int index = list.indexOfChild(stock);

            // The stock rows are separated by a plain View (layout_divider) right before each row.
            View stockDivider = index > 0 ? list.getChildAt(index - 1) : null;
            View divider = null;
            if (stockDivider != null && !(stockDivider instanceof ViewGroup) && !(stockDivider instanceof TextView)) {
                divider = new View(context);
                divider.setLayoutParams(copyParams(stockDivider.getLayoutParams()));
                Drawable line = stockDivider.getBackground();
                if (line != null && line.getConstantState() != null) {
                    divider.setBackground(line.getConstantState().newDrawable(resources).mutate());
                }
            }

            TextView row = new TextView(context);
            row.setTag(ROW_TAG);
            row.setText(LABEL);
            row.setTextSize(TypedValue.COMPLEX_UNIT_PX, stock.getTextSize());
            row.setTextColor(stock.getTextColors());
            row.setTypeface(stock.getTypeface());
            row.setLetterSpacing(stock.getLetterSpacing());
            row.setGravity(stock.getGravity());
            row.setPaddingRelative(stock.getPaddingStart(), stock.getPaddingTop(), stock.getPaddingEnd(), stock.getPaddingBottom());
            row.setMinHeight(stock.getMinHeight());
            row.setCompoundDrawablePadding(stock.getCompoundDrawablePadding());
            row.setLayoutParams(copyParams(stock.getLayoutParams()));
            row.setBackground(themeDrawable(context, android.R.attr.selectableItemBackground));
            setIcon(row, stock, context);
            row.setOnClickListener(new OpenControls());

            int at = index + 1;
            if (divider != null) list.addView(divider, at++);
            list.addView(row, at);
        } catch (Throwable failure) {
            Log.e(TAG, "Patch settings row not added: " + failure.getClass().getName());
        }
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

    /** A gear icon at the size of the stock row's start icon, tinted like it. */
    private static void setIcon(TextView row, TextView stock, Context context) {
        Drawable icon = context.getDrawable(android.R.drawable.ic_menu_manage);
        if (icon == null) return;
        icon = icon.mutate();
        Drawable stockIcon = stock.getCompoundDrawablesRelative()[0];
        int width = 0;
        int height = 0;
        if (stockIcon != null) {
            width = stockIcon.getBounds().width();
            height = stockIcon.getBounds().height();
            if (width <= 0 || height <= 0) {
                width = stockIcon.getIntrinsicWidth();
                height = stockIcon.getIntrinsicHeight();
            }
        }
        if (width <= 0 || height <= 0) {
            width = icon.getIntrinsicWidth();
            height = icon.getIntrinsicHeight();
        }
        icon.setBounds(0, 0, width, height);
        ColorStateList tint = stock.getCompoundDrawableTintList();
        if (tint != null) {
            row.setCompoundDrawableTintList(tint);
        } else {
            icon.setTintList(stock.getTextColors());
        }
        row.setCompoundDrawablesRelative(icon, null, null, null);
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

    /** Starts the (non-exported) Patch settings screen on top of the current Truecaller activity. */
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
