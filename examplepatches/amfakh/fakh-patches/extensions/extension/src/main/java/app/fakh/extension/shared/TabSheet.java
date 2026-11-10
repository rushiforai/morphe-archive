package app.fakh.extension.shared;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

/**
 * The bottom sheet that lists the tabs of a navigation bar with a check each, so the user can hide the ones they do
 * not use. Home is passed as a row that is checked and disabled, since the app always starts on it.
 */
public final class TabSheet {
    private final Activity activity;
    private final ViewGroup root;
    private final FrameLayout scrim;
    private final Runnable onClose;
    private OnBackInvokedCallback back;
    private boolean closing;

    private TabSheet(Activity activity, ViewGroup root, FrameLayout scrim, Runnable onClose) {
        this.activity = activity;
        this.root = root;
        this.scrim = scrim;
        this.onClose = onClose;
    }

    /** What the sheet reports when the user checks or unchecks a row. */
    public interface OnToggle {
        /** Called with the new state. */
        void toggled(boolean checked);
    }

    /**
     * Opens a sheet over the activity. Tapping the dimmed area or going back closes it.
     *
     * @param activity      the activity to show it in
     * @param root          the layer the sheet is added to, which fills the screen
     * @param title         the heading of the sheet
     * @param hint          a line under the heading, or null
     * @param surface       the color of the sheet
     * @param text          the color of the heading
     * @param secondary     the color of the hint and the handle
     * @param rows          the rows, usually built with {@link #checkRow}
     * @param onClose       runs after the sheet is gone, or null
     * @return the sheet, or null when one is already open in {@code root}
     */
    public static TabSheet show(Activity activity, ViewGroup root, String title, String hint, int surface, int text,
            int secondary, View rows, Runnable onClose) {
        if (root.findViewWithTag(TabSheet.class.getName()) != null) return null;
        float density = activity.getResources().getDisplayMetrics().density;
        FrameLayout scrim = new FrameLayout(activity);
        scrim.setTag(TabSheet.class.getName());
        scrim.setBackgroundColor(0x66000000);
        scrim.setClickable(true);
        // Above anything the screen keeps on top, such as a restart banner.
        scrim.setElevation(24 * density);
        TabSheet sheet = new TabSheet(activity, root, scrim, onClose);
        scrim.setOnClickListener(v -> sheet.close());

        LinearLayout panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setClickable(true);
        panel.setPadding(0, Math.round(12 * density), 0, Math.round(16 * density));
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(surface);
        float radius = 28 * density;
        shape.setCornerRadii(new float[] {radius, radius, radius, radius, 0, 0, 0, 0});
        panel.setBackground(shape);

        View handle = new View(activity);
        GradientDrawable handleShape = new GradientDrawable();
        handleShape.setColor((secondary & 0x00FFFFFF) | 0x66000000);
        handleShape.setCornerRadius(2 * density);
        handle.setBackground(handleShape);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(Math.round(32 * density), Math.round(4 * density));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        handleParams.bottomMargin = Math.round(16 * density);
        panel.addView(handle, handleParams);

        int side = Math.round(24 * density);
        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextColor(text);
        heading.setTextSize(20);
        heading.setPadding(side, 0, side, 0);
        panel.addView(heading);
        if (hint != null) {
            TextView line = new TextView(activity);
            line.setText(hint);
            line.setTextColor(secondary);
            line.setTextSize(14);
            line.setPadding(side, Math.round(4 * density), side, 0);
            panel.addView(line);
        }

        // A long list scrolls inside the sheet instead of growing past the screen.
        int maxHeight = activity.getResources().getDisplayMetrics().heightPixels * 6 / 10;
        ScrollView scroll = new ScrollView(activity) {
            @Override
            protected void onMeasure(int widthSpec, int heightSpec) {
                super.onMeasure(widthSpec, View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST));
            }
        };
        scroll.setPadding(0, Math.round(8 * density), 0, 0);
        scroll.addView(rows);
        panel.addView(scroll);

        scrim.addView(panel, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        root.addView(scrim, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        sheet.listenForBack();
        scrim.setAlpha(0f);
        scrim.animate().alpha(1f).setDuration(180).start();
        panel.setTranslationY(480 * density);
        panel.animate().translationY(0f).setDuration(240).setInterpolator(new DecelerateInterpolator()).start();
        return sheet;
    }

    /**
     * One row of the sheet: a label and a check. A disabled row is dimmed and ignores taps, which is how Home shows.
     *
     * @param context  the activity
     * @param label    the name of the tab
     * @param checked  whether the tab is shown
     * @param enabled  false for Home
     * @param text     the color of the label
     * @param accent   the color of the check
     * @param onToggle called with the new state when the user taps an enabled row, or null
     * @return the row
     */
    public static View checkRow(Context context, String label, boolean checked, boolean enabled, int text, int accent,
            OnToggle onToggle) {
        float density = context.getResources().getDisplayMetrics().density;
        LinearLayout line = new LinearLayout(context);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        int vertical = Math.round(14 * density);
        int side = Math.round(24 * density);
        line.setPadding(side, vertical, side, vertical);
        TextView name = new TextView(context);
        name.setText(label);
        name.setTextColor(text);
        name.setTextSize(16);
        line.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        TextView check = new TextView(context);
        check.setText("✓");
        check.setTextColor(accent);
        check.setTextSize(20);
        check.setVisibility(checked ? View.VISIBLE : View.INVISIBLE);
        line.addView(check);
        if (!enabled) {
            line.setAlpha(0.38f);
            return line;
        }
        boolean[] on = {checked};
        line.setOnClickListener(v -> {
            on[0] = !on[0];
            check.setVisibility(on[0] ? View.VISIBLE : View.INVISIBLE);
            if (onToggle != null) onToggle.toggled(on[0]);
        });
        return line;
    }

    /** Closes the sheet with the same slide it opened with, then runs the close callback. */
    public void close() {
        if (closing || scrim.getParent() == null) return;
        closing = true;
        if (back != null) activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(back);
        back = null;
        View panel = scrim.getChildAt(0);
        scrim.animate().alpha(0f).setDuration(160).start();
        panel.animate().translationY(panel.getHeight()).setDuration(200).withEndAction(() -> {
            root.removeView(scrim);
            if (onClose != null) onClose.run();
        }).start();
    }

    /** Back closes the sheet: through the platform dispatcher on Android 13+, and as a key on the sheet before that. */
    private void listenForBack() {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU) {
            back = this::close;
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_OVERLAY, back);
        }
        scrim.setFocusableInTouchMode(true);
        scrim.setOnKeyListener((view, keyCode, event) -> {
            if (keyCode != KeyEvent.KEYCODE_BACK) return false;
            if (event.getAction() == KeyEvent.ACTION_UP) close();
            return true;
        });
        scrim.requestFocus();
    }
}
