package app.fblite.extension.video;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** A bottom sheet listing the download qualities, in light or dark to match the system. */
final class QualitySheet {
    interface Listener {
        void onPick(int index);
    }

    private QualitySheet() {
    }

    static void show(Activity activity, String title, String subtitle, String[] labels, String[] details, final Listener listener) {
        boolean night = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        int surface = night ? 0xFF242526 : 0xFFFFFFFF;
        int primary = night ? 0xFFE4E6EB : 0xFF1C1E21;
        int secondary = night ? 0xFFB0B3B8 : 0xFF65676B;
        int pressed = night ? 0x24FFFFFF : 0x14000000;
        int accent = 0xFF1877F2;

        final Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final LinearLayout sheet = new LinearLayout(activity);
        sheet.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setColor(surface);
        float radius = dp(activity, 22);
        background.setCornerRadii(new float[] {radius, radius, radius, radius, 0, 0, 0, 0});
        sheet.setBackground(background);
        final int basePad = dp(activity, 16);
        sheet.setPadding(basePad, dp(activity, 10), basePad, basePad);

        View handle = new View(activity);
        GradientDrawable handleShape = new GradientDrawable();
        handleShape.setColor(night ? 0x44FFFFFF : 0x22000000);
        handleShape.setCornerRadius(dp(activity, 2));
        handle.setBackground(handleShape);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(dp(activity, 36), dp(activity, 4));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        sheet.addView(handle, handleParams);

        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextColor(primary);
        heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        heading.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        boolean hasSubtitle = subtitle != null && !subtitle.isEmpty();
        heading.setPadding(dp(activity, 6), dp(activity, 14), dp(activity, 6), hasSubtitle ? dp(activity, 2) : dp(activity, 8));
        sheet.addView(heading);
        if (hasSubtitle) {
            TextView who = new TextView(activity);
            who.setText(subtitle);
            who.setTextColor(secondary);
            who.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            who.setSingleLine(true);
            who.setEllipsize(android.text.TextUtils.TruncateAt.END);
            who.setPadding(dp(activity, 6), 0, dp(activity, 6), dp(activity, 8));
            sheet.addView(who);
        }

        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(activity, 14), dp(activity, 14), dp(activity, 14), dp(activity, 14));
            row.setBackground(pressedBackground(activity, pressed));
            row.setClickable(true);
            row.setOnClickListener(v -> {
                dialog.dismiss();
                listener.onPick(index);
            });

            TextView label = new TextView(activity);
            label.setText(labels[i]);
            label.setTextColor(i == 0 ? accent : primary);
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            label.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
            row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView detail = new TextView(activity);
            detail.setText(details[i]);
            detail.setTextColor(secondary);
            detail.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            row.addView(detail);

            list.addView(row, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        ScrollView scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(list);
        int maxHeight = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.55f);
        sheet.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                labels.length > 6 ? maxHeight : ViewGroup.LayoutParams.WRAP_CONTENT));

        // The window may draw under the navigation bar: keep the last row above it.
        sheet.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(basePad, dp(activity, 10), basePad, basePad + insets.getSystemWindowInsetBottom());
            return insets;
        });

        dialog.setContentView(sheet);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
            window.setGravity(Gravity.BOTTOM);
            window.setDimAmount(0.45f);
        }
        dialog.setCanceledOnTouchOutside(true);
        sheet.setTranslationY(dp(activity, 320));
        sheet.setAlpha(0f);
        dialog.show();
        sheet.animate().translationY(0f).alpha(1f).setDuration(220).setInterpolator(new DecelerateInterpolator()).start();
    }

    private static StateListDrawable pressedBackground(Context context, int pressedColor) {
        GradientDrawable pressed = new GradientDrawable();
        pressed.setColor(pressedColor);
        pressed.setCornerRadius(dp(context, 12));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[] {android.R.attr.state_pressed}, pressed);
        states.addState(new int[] {}, new ColorDrawable(Color.TRANSPARENT));
        return states;
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
