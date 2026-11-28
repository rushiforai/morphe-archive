package app.xposed.extension;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * A bottom sheet in X's theme: a dialog with rounded top corners whose content scrolls, as wide
 * as the screen up to Material's widest sheet, leaving the top of the screen showing.
 */
final class Sheet {
    /** Material's widest bottom sheet, for unfolded and large screens. */
    private static final int MAX_WIDTH_DP = 640;

    final Dialog dialog;
    final LinearLayout content;
    final int widthPx;
    private final Ui ui;

    /** title is what TalkBack announces when the sheet opens. */
    Sheet(Context context, Ui ui, String title) {
        this.ui = ui;
        dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setTitle(title);

        content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(ui.dp(20), ui.dp(8), ui.dp(20), ui.dp(20));
        int maxHeight = ui.dp(context.getResources().getConfiguration().screenHeightDp) * 9 / 10;
        ScrollView scroll = new ScrollView(context) {
            @Override
            protected void onMeasure(int widthSpec, int heightSpec) {
                // Leave the top of the screen showing, as a sheet does, and scroll the rest.
                int limit = maxHeight;
                if (MeasureSpec.getMode(heightSpec) != MeasureSpec.UNSPECIFIED) limit = Math.min(limit, MeasureSpec.getSize(heightSpec));
                super.onMeasure(widthSpec, MeasureSpec.makeMeasureSpec(limit, MeasureSpec.AT_MOST));
            }
        };
        GradientDrawable sheet = new GradientDrawable();
        sheet.setColor(ui.background);
        float r = ui.dp(16);
        sheet.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        scroll.setBackground(sheet);
        scroll.addView(content, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        dialog.setContentView(scroll);
        // Keep the buttons clear of the gesture bar.
        int bottom = ui.dp(20);
        scroll.setOnApplyWindowInsetsListener((v, insets) -> {
            content.setPadding(content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(),
                    bottom + insets.getSystemWindowInsetBottom());
            return insets;
        });

        widthPx = Math.min(ui.dp(context.getResources().getConfiguration().screenWidthDp), ui.dp(MAX_WIDTH_DP));
        Window window = dialog.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        window.setLayout(widthPx, ViewGroup.LayoutParams.WRAP_CONTENT);
        window.setGravity(Gravity.BOTTOM);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0.4f);
    }

    /** The bar at the top that marks the dialog as a sheet. */
    void addGrabber() {
        View grabber = new View(content.getContext());
        GradientDrawable bar = new GradientDrawable();
        bar.setColor(ui.divider);
        bar.setCornerRadius(ui.dp(2));
        grabber.setBackground(bar);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ui.dp(36), ui.dp(4));
        lp.gravity = Gravity.CENTER_HORIZONTAL;
        lp.bottomMargin = ui.dp(16);
        content.addView(grabber, lp);
    }

    /** Buttons side by side across the sheet, or stacked when a label wouldn't fit. */
    LinearLayout buttonRow(TextView... buttons) {
        return ui.buttonRow(widthPx - content.getPaddingLeft() - content.getPaddingRight(), buttons);
    }
}
