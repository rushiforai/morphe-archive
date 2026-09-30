package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
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
 * The dialog behind a Min/Max row: two numeric fields and Save/Cancel.
 *
 * Built on the screen's own palette rather than a dialog theme, the same as the restart prompt — a
 * theme brings its own corner radius, panel colour and button chrome, and the app's theme decides
 * all three.
 *
 * An empty field means "no bound on this side", so a maximum is only typed when one is wanted; the
 * whole range is spelled out as both fields empty. The values are normalised on Save — a minimum
 * above the maximum swaps them — and the dialog closes, so nothing half-typed is ever stored.
 */
public final class RangeDialog {
    public interface OnRangeChangeListener {
        void onRangeChanged(long min, long max);
    }

    private static final long NO_MIN = 0L;
    private static final long NO_MAX = Long.MAX_VALUE;

    private RangeDialog() {}

    public static void show(
            Context context, String title, long min, long max, OnRangeChangeListener save) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        EditText minField = field(activity, "min", text(min, NO_MIN));
        EditText maxField = field(activity, "max", text(max, NO_MAX));
        dialog.setContentView(panel(activity, dialog, title, minField, maxField, save));

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
            EditText minField,
            EditText maxField,
            OnRangeChangeListener save) {
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
        heading.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        heading.setTextColor(Tokens.TEXT_PRIMARY);
        heading.setGravity(Gravity.CENTER);
        column.addView(heading);

        TextView hint = new TextView(activity);
        hint.setText("Leave a field empty for no bound on that side.");
        hint.setTextSize(Tokens.SUBTITLE_SP);
        hint.setTextColor(Tokens.TEXT_SECONDARY);
        hint.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        hint.setLayoutParams(hintParams);
        column.addView(hint);

        LinearLayout pair = new LinearLayout(activity);
        pair.setOrientation(LinearLayout.HORIZONTAL);
        pair.setGravity(Gravity.CENTER);
        pair.setPadding(0, Tokens.dp(activity, Tokens.SPACE_4), 0, Tokens.dp(activity, Tokens.SPACE_2));
        pair.addView(minField);
        pair.addView(dash(activity));
        pair.addView(maxField);
        column.addView(pair);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(0, Tokens.dp(activity, Tokens.SPACE_2), 0, 0);

        actions.addView(new ActionView(
                activity, "Cancel", Tokens.PANEL, Tokens.TEXT_SECONDARY, dialog::dismiss),
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        ActionView saveButton = new ActionView(activity, "Save", Tokens.PANEL, Tokens.ACCENT, () -> {
            long min = parse(minField, NO_MIN);
            long max = parse(maxField, NO_MAX);
            if (min > max) {
                long swap = min;
                min = max;
                max = swap;
            }
            save.onRangeChanged(min, max);
            dialog.dismiss();
        });
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        saveParams.leftMargin = Tokens.dp(activity, Tokens.SPACE_2);
        actions.addView(saveButton, saveParams);

        column.addView(actions);
        return column;
    }

    private static EditText field(Context context, String hint, String value) {
        EditText field = new EditText(context);
        field.setHint(hint);
        field.setText(value);
        field.setTextSize(Tokens.ACTION_SP);
        field.setTextColor(Tokens.TEXT_PRIMARY);
        field.setHintTextColor(Tokens.TEXT_DISABLED);
        field.setGravity(Gravity.CENTER);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_NUMBER);
        field.setImeOptions(EditorInfo.IME_ACTION_DONE);
        field.setPadding(
                Tokens.dp(context, Tokens.SPACE_2), 0,
                Tokens.dp(context, Tokens.SPACE_2), 0);
        field.setBackground(ActionView.outline(context, Tokens.PANEL));
        field.setLayoutParams(new LinearLayout.LayoutParams(
                Tokens.dp(context, 96), Tokens.dp(context, 44)));
        return field;
    }

    private static TextView dash(Context context) {
        TextView view = new TextView(context);
        view.setText("\u2013");
        view.setTextSize(Tokens.ACTION_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setPadding(
                Tokens.dp(context, Tokens.SPACE_2), 0,
                Tokens.dp(context, Tokens.SPACE_2), 0);
        return view;
    }

    private static Drawable panelBackground(Context context) {
        GradientDrawable panel = new GradientDrawable();
        panel.setShape(GradientDrawable.RECTANGLE);
        panel.setCornerRadius(Tokens.dp(context, 14));
        panel.setColor(Tokens.PANEL);
        panel.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);
        return panel;
    }

    /** The field's value, or `fallback` for empty/invalid input; never below zero. */
    private static long parse(EditText field, long fallback) {
        String text = field.getText().toString().trim();
        if (text.isEmpty()) return fallback;
        try {
            long value = Long.parseLong(text);
            return value < 0 ? 0L : value;
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }

    /** What a value looks like in its field: a bound at the extreme is shown as empty. */
    private static String text(long value, long unset) {
        return value == unset ? "" : Long.toString(value);
    }
}
