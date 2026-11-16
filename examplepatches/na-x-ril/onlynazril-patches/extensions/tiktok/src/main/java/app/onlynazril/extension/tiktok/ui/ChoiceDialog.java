package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Activities;

/**
 * The dialog behind a choice row: one button per option, the current one marked, and Cancel.
 * <p>
 * Built on the screen's own palette for the same reason as the range and restart dialogs: a
 * theme brings its own corner radius, panel color and button chrome, and the app's theme decides
 * all three.
 */
public final class ChoiceDialog {
    public interface OnChoiceListener {
        void onChoice(int index);
    }

    private ChoiceDialog() {}

    public static void show(
            Context context,
            String title,
            String hintText,
            String[] labels,
            int selected,
            OnChoiceListener save) {
        show(context, title, hintText, labels, null, selected, save);
    }

    /** `details`, when present, is one example line per label; it is never saved. */
    public static void show(
            Context context,
            String title,
            String hintText,
            String[] labels,
            String[] details,
            int selected,
            OnChoiceListener save) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(
                panel(activity, dialog, title, hintText, labels, details, selected, save));

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.dimAmount = 0.6f;
            window.setAttributes(attributes);
            int width = Math.min(
                    Tokens.dp(activity, 320),
                    (int) (activity.getResources().getDisplayMetrics().widthPixels * 0.86f));
            window.setLayout(width, WindowManager.LayoutParams.WRAP_CONTENT);
        }
        dialog.show();
    }

    private static View panel(
            Activity activity,
            Dialog dialog,
            String title,
            String hintText,
            String[] labels,
            String[] details,
            int selected,
            OnChoiceListener save) {
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackground(panelBackground(activity));
        column.setPadding(
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4));

        TextView heading = new TextView(activity);
        heading.setText(title);
        heading.setTextSize(Tokens.PANEL_TITLE_SP);
        heading.setTypeface(Fonts.face(true));
        heading.setTextColor(Tokens.TEXT_PRIMARY);
        heading.setGravity(Gravity.CENTER);
        column.addView(heading);

        if (hintText != null && !hintText.isEmpty()) {
            TextView hint = new TextView(activity);
            hint.setText(hintText);
            hint.setTextSize(Tokens.SUBTITLE_SP);
            hint.setTextColor(Tokens.TEXT_SECONDARY);
            hint.setTypeface(Fonts.face(false));
            hint.setGravity(Gravity.CENTER);
            LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            hintParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
            hintParams.bottomMargin = Tokens.dp(activity, Tokens.SPACE_6);
            hint.setLayoutParams(hintParams);
            column.addView(hint);
        }

        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            LinearLayout option = new LinearLayout(activity);
            option.setOrientation(LinearLayout.HORIZONTAL);
            option.setGravity(Gravity.CENTER_VERTICAL);
            option.setPadding(
                    Tokens.dp(activity, Tokens.SPACE_4),
                    Tokens.dp(activity, Tokens.SPACE_2),
                    Tokens.dp(activity, Tokens.SPACE_4),
                    Tokens.dp(activity, Tokens.SPACE_2));
            option.setBackground(optionBackground(activity, i == selected));
            option.setClickable(true);
            option.setFocusable(true);
            option.setContentDescription(labels[i]);
            option.setOnClickListener(view -> {
                save.onChoice(index);
                dialog.dismiss();
            });

            View mark;
            if (i == selected) {
                mark = new CheckView(activity);
            } else {
                mark = new View(activity);
                mark.setVisibility(View.INVISIBLE);
            }
            LinearLayout.LayoutParams markParams = new LinearLayout.LayoutParams(
                    Tokens.dp(activity, CheckView.SIZE_DP), Tokens.dp(activity, CheckView.SIZE_DP));
            markParams.rightMargin = Tokens.dp(activity, Tokens.SPACE_2);
            option.addView(mark, markParams);

            TextView label = new TextView(activity);
            label.setText(labels[i]);
            label.setTextSize(Tokens.ACTION_SP);
            label.setTextColor(i == selected ? Tokens.ACCENT : Tokens.TEXT_PRIMARY);
            label.setTypeface(Fonts.face(false));

            String detail = details != null && i < details.length ? details[i] : null;
            if (detail == null || detail.isEmpty()) {
                option.addView(label, new LinearLayout.LayoutParams(
                        0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            } else {
                LinearLayout textColumn = new LinearLayout(activity);
                textColumn.setOrientation(LinearLayout.VERTICAL);
                textColumn.addView(label, new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT));
                TextView example = new TextView(activity);
                example.setText(detail);
                example.setTextSize(Tokens.SUBTITLE_SP);
                example.setTextColor(Tokens.TEXT_SECONDARY);
                example.setTypeface(Fonts.face(false));
                textColumn.addView(example, new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT));
                option.addView(textColumn, new LinearLayout.LayoutParams(
                        0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            }

            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT);
            params.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
            column.addView(option, params);
        }

        float fullRadius = Tokens.dp(activity, 999);
        ActionView cancel = new ActionView(
                activity, "Cancel", Color.TRANSPARENT, Tokens.TEXT_DANGER, dialog::dismiss);
        GradientDrawable cancelBg = new GradientDrawable();
        cancelBg.setColor(Color.TRANSPARENT);
        cancelBg.setCornerRadius(fullRadius);
        cancelBg.setStroke(Tokens.dp(activity, 1), Tokens.BORDER_DANGER);
        GradientDrawable cancelMask = new GradientDrawable();
        cancelMask.setColor(Color.WHITE);
        cancelMask.setCornerRadius(fullRadius);
        cancel.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_ERROR), cancelBg, cancelMask));
        LinearLayout.LayoutParams cancelParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        cancelParams.topMargin = Tokens.dp(activity, Tokens.SPACE_12);
        column.addView(cancel, cancelParams);

        return column;
    }

    /**
     * The selected row is filled and outlined in white, so the current choice reads at a glance
     * and not only from the mark. Both colors are translucent, which keeps them out of the AMOLED
     * pass's opaque dark constants.
     */
    private static Drawable optionBackground(Context context, boolean selected) {
        int radius = Tokens.dp(context, 1000);
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setCornerRadius(radius);
        shape.setColor(selected ? Tokens.CHOICE_SELECTED : Tokens.SURFACE);
        shape.setStroke(
                Tokens.dp(context, 1),
                selected ? Tokens.CHOICE_SELECTED_BORDER : Tokens.HAIRLINE);
        GradientDrawable mask = new GradientDrawable();
        mask.setShape(GradientDrawable.RECTANGLE);
        mask.setCornerRadius(radius);
        mask.setColor(Color.WHITE);
        return new RippleDrawable(ColorStateList.valueOf(Tokens.SURFACE_PRESSED), shape, mask);
    }

    private static Drawable panelBackground(Context context) {
        GradientDrawable panel = new GradientDrawable();
        panel.setShape(GradientDrawable.RECTANGLE);
        panel.setCornerRadius(Tokens.dp(context, 14));
        panel.setColor(Tokens.PANEL);
        panel.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);
        return panel;
    }
}
