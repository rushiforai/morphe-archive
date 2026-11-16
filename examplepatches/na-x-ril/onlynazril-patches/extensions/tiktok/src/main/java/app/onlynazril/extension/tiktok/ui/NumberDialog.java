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
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Activities;

/**
 * The dialog behind a one-number row: a single numeric field and Save/Cancel.
 * <p>
 * Built on the screen's own palette rather than a dialog theme, the same as {@link RangeDialog},
 * so the panel color, corner radius and button chrome do not depend on the activity's theme.
 * An empty field means zero, which is how a threshold is turned off.
 */
public final class NumberDialog {
    public interface OnValueChangeListener {
        void onValueChanged(long value);
    }

    private NumberDialog() {}

    public static void show(
            Context context,
            String title,
            String hintText,
            long value,
            OnValueChangeListener save) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        EditText field = field(activity, value);
        dialog.setContentView(panel(activity, dialog, title, hintText, field, save));

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
            EditText field,
            OnValueChangeListener save) {
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

        TextView hint = new TextView(activity);
        hint.setText(hintText);
        hint.setTextSize(Tokens.SUBTITLE_SP);
        hint.setTextColor(Tokens.TEXT_SECONDARY);
        hint.setTypeface(Fonts.face(false));
        hint.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        hintParams.bottomMargin = Tokens.dp(activity, Tokens.SPACE_4);
        hint.setLayoutParams(hintParams);
        column.addView(hint);

        LinearLayout fieldRow = new LinearLayout(activity);
        fieldRow.setOrientation(LinearLayout.HORIZONTAL);
        fieldRow.setGravity(Gravity.CENTER);
        fieldRow.setPadding(0, Tokens.dp(activity, Tokens.SPACE_4), 0, Tokens.dp(activity, Tokens.SPACE_2));
        fieldRow.addView(field);
        column.addView(fieldRow);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(0, Tokens.dp(activity, Tokens.SPACE_8), 0, 0);

        float fullRadius = Tokens.dp(activity, 999);
        int borderWidth = Tokens.dp(activity, 1);

        ActionView cancelButton = new ActionView(
                activity, "Cancel", Color.TRANSPARENT, Tokens.TEXT_DANGER, dialog::dismiss);
        GradientDrawable cancelBg = new GradientDrawable();
        cancelBg.setColor(Color.TRANSPARENT);
        cancelBg.setCornerRadius(fullRadius);
        cancelBg.setStroke(borderWidth, Tokens.BORDER_DANGER);
        GradientDrawable cancelMask = new GradientDrawable();
        cancelMask.setColor(Color.WHITE);
        cancelMask.setCornerRadius(fullRadius);
        cancelButton.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_ERROR), cancelBg, cancelMask));
        actions.addView(cancelButton,
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        ActionView saveButton = new ActionView(
                activity, "Save", Tokens.BG_WHITE, Tokens.TEXT_ON_LIGHT, () -> {
            save.onValueChanged(parse(field));
            dialog.dismiss();
        });
        GradientDrawable saveBg = new GradientDrawable();
        saveBg.setColor(Tokens.BG_WHITE);
        saveBg.setCornerRadius(fullRadius);
        saveButton.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_DARK), saveBg, null));
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        saveParams.leftMargin = Tokens.dp(activity, Tokens.SPACE_2);
        actions.addView(saveButton, saveParams);

        column.addView(actions);
        return column;
    }

    private static EditText field(Context context, long value) {
        return TextField.create(context)
                .hint("seconds")
                .text(value == 0 ? "" : Long.toString(value))
                .inputType(InputType.TYPE_CLASS_NUMBER)
                .widthDp(120)
                .build();
    }

    private static Drawable panelBackground(Context context) {
        GradientDrawable panel = new GradientDrawable();
        panel.setShape(GradientDrawable.RECTANGLE);
        panel.setCornerRadius(Tokens.dp(context, 14));
        panel.setColor(Tokens.PANEL);
        panel.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);
        return panel;
    }

    /** Empty is zero; invalid input is zero too, so nothing half-typed is ever stored. */
    private static long parse(EditText field) {
        String text = field.getText().toString().trim();
        if (text.isEmpty()) return 0L;
        try {
            return Math.max(0L, Long.parseLong(text));
        } catch (NumberFormatException ignored) {
            return 0L;
        }
    }
}
