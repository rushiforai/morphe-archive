package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Activities;

/**
 * The editor behind one feature-flag row: the key, the app's own value, and the input that
 * fits the flag's type.
 * <p>
 * A boolean is a switch, a whole number is a number-only field, a decimal is a number field with
 * the decimal key, and a text flag is a plain field. The value is checked against the type before
 * it is saved; an empty number or text field clears the override, while a boolean clears through
 * Reset, because a switch has no empty state.
 */
public final class FlagDialog {
    public interface OnValueListener {
        /** The new override text, or null when the override is cleared. */
        void onValue(String value);
    }

    private FlagDialog() {}

    public static void show(
            Context context,
            String key,
            String type,
            String appValue,
            String override,
            OnValueListener save) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        Input input = input(activity, type, appValue, override);
        TextView status = note(activity, Tokens.TEXT_SECONDARY);
        status.setText("Default: " + appValue);

        // The panel scrolls and may grow with its content; the window is measured first so a
        // short dialog stays short and a long one uses the height it needs, up to most of screen.
        ScrollView scroller = new ScrollView(activity);
        scroller.setFillViewport(false);
        scroller.setOverScrollMode(View.OVER_SCROLL_IF_CONTENT_SCROLLS);
        scroller.addView(panel(activity, dialog, key, type, input, status, override != null, save));
        dialog.setContentView(scroller);

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.dimAmount = 0.6f;
            window.setAttributes(attributes);

            android.util.DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
            // The width every other dialog uses, plus 40dp: a key and its value need a little more
            // room than a prompt, and no more than that.
            int base = Math.min(Tokens.dp(activity, 320), (int) (metrics.widthPixels * 0.86f));
            int width = Math.min(
                    base + Tokens.dp(activity, 40),
                    metrics.widthPixels - Tokens.dp(activity, 24));
            int maxHeight = (int) (metrics.heightPixels * 0.86f);
            int exactWidth = View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY);
            int atMostHeight = View.MeasureSpec.makeMeasureSpec(maxHeight, View.MeasureSpec.AT_MOST);
            scroller.measure(exactWidth, atMostHeight);
            int height = Math.min(scroller.getMeasuredHeight(), maxHeight);
            window.setLayout(width, height);
        }
        dialog.show();
    }

    /** The type's name as the row and the hint show it. */
    public static String typeName(String type) {
        if (type == null) return "flag";
        switch (type) {
            case "b":
                return "boolean";
            case "i":
            case "j":
                return "whole number";
            case "f":
            case "d":
                return "decimal";
            case "s":
                return "text";
            case "o":
                return "object";
            default:
                return "flag";
        }
    }

    /** Whether the text can stand as this type's override; null or blank clears it instead. */
    public static boolean isValid(String type, String text) {
        String value = text == null ? "" : text.trim();
        if (value.isEmpty()) return true;
        switch (type == null ? "" : type) {
            case "b":
                String lower = value.toLowerCase();
                return lower.equals("true") || lower.equals("false")
                        || lower.equals("1") || lower.equals("0")
                        || lower.equals("on") || lower.equals("off")
                        || lower.equals("yes") || lower.equals("no");
            case "i":
                try {
                    Integer.parseInt(value);
                    return true;
                } catch (NumberFormatException ignored) {
                    return false;
                }
            case "j":
                try {
                    Long.parseLong(value);
                    return true;
                } catch (NumberFormatException ignored) {
                    return false;
                }
            case "f":
                try {
                    Float.parseFloat(value);
                    return true;
                } catch (NumberFormatException ignored) {
                    return false;
                }
            case "d":
                try {
                    Double.parseDouble(value);
                    return true;
                } catch (NumberFormatException ignored) {
                    return false;
                }
            default:
                return true;
        }
    }

    /** The control that edits one value, and the value it reads back. */
    private static final class Input {
        final View view;
        private final EditText field;
        private final ToggleView toggle;

        private Input(View view, EditText field, ToggleView toggle) {
            this.view = view;
            this.field = field;
            this.toggle = toggle;
        }

        String value() {
            if (toggle != null) return toggle.isChecked() ? "true" : "false";
            return field.getText().toString().trim();
        }
    }

    private static Input input(Activity activity, String type, String appValue, String override) {
        if ("b".equals(type)) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            TextView label = note(activity, Tokens.TEXT_PRIMARY);
            label.setText("Override value");
            row.addView(label, new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            ToggleView toggle = new ToggleView(activity);
            toggle.setChecked(booleanValue(override != null ? override : appValue));
            row.addView(toggle, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            return new Input(row, null, toggle);
        }
        EditText field = TextField.create(activity)
                .hint(hint(type))
                .text(override == null ? "" : override)
                .inputType(inputType(type))
                .build();
        return new Input(field, field, null);
    }

    private static String hint(String type) {
        switch (type == null ? "" : type) {
            case "i":
            case "j":
                return "Whole number, empty keeps TikTok's";
            case "f":
            case "d":
                return "Decimal, empty keeps TikTok's";
            default:
                return "Empty keeps TikTok's value";
        }
    }

    private static int inputType(String type) {
        switch (type == null ? "" : type) {
            case "i":
            case "j":
                return InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED;
            case "f":
            case "d":
                return InputType.TYPE_CLASS_NUMBER
                        | InputType.TYPE_NUMBER_FLAG_SIGNED
                        | InputType.TYPE_NUMBER_FLAG_DECIMAL;
            default:
                return InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
        }
    }

    private static boolean booleanValue(String value) {
        if (value == null) return false;
        String text = value.trim().toLowerCase();
        return text.equals("true") || text.equals("1")
                || text.equals("on") || text.equals("yes");
    }

    private static LinearLayout panel(
            Activity activity,
            Dialog dialog,
            String key,
            String type,
            Input input,
            TextView status,
            boolean overridden,
            OnValueListener save) {
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.RECTANGLE);
        background.setCornerRadius(Tokens.dp(activity, 14));
        background.setColor(Tokens.PANEL);
        background.setStroke(Tokens.dp(activity, 1), Tokens.HAIRLINE);
        column.setBackground(background);
        column.setPadding(
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4),
                Tokens.dp(activity, Tokens.SPACE_4));

        TextView heading = new TextView(activity);
        heading.setText(key);
        heading.setTextSize(Tokens.PANEL_TITLE_SP);
        heading.setTypeface(Fonts.face(true));
        heading.setTextColor(Tokens.TEXT_PRIMARY);
        heading.setGravity(Gravity.CENTER);
        // The key is what the row is, so the dialog shows all of it instead of cutting it in the
        // middle; a long one wraps onto the next lines.
        heading.setSingleLine(false);
        heading.setEllipsize(null);
        heading.setPadding(
                Tokens.dp(activity, Tokens.SPACE_2),
                0,
                Tokens.dp(activity, Tokens.SPACE_2),
                0);
        column.addView(heading);

        TextView kind = note(activity, Tokens.TEXT_SECONDARY);
        kind.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams kindParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        kindParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        kind.setLayoutParams(kindParams);
        kind.setText(typeName(type));
        column.addView(kind);

        LinearLayout fieldBlock = new LinearLayout(activity);
        fieldBlock.setOrientation(LinearLayout.VERTICAL);
        fieldBlock.setPadding(
                0,
                Tokens.dp(activity, Tokens.SPACE_4),
                0,
                Tokens.dp(activity, Tokens.SPACE_2));
        fieldBlock.addView(input.view);
        LinearLayout.LayoutParams statusParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        statusParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        fieldBlock.addView(status, statusParams);
        column.addView(fieldBlock);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(0, Tokens.dp(activity, Tokens.SPACE_8), 0, 0);

        float radius = Tokens.dp(activity, 999);
        ActionView cancel = new ActionView(
                activity, "Cancel", Color.TRANSPARENT, Tokens.TEXT_DANGER, dialog::dismiss);
        GradientDrawable cancelBackground = new GradientDrawable();
        cancelBackground.setColor(Color.TRANSPARENT);
        cancelBackground.setCornerRadius(radius);
        cancelBackground.setStroke(Tokens.dp(activity, 1), Tokens.BORDER_DANGER);
        cancel.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_ERROR), cancelBackground, null));
        actions.addView(cancel,
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        if (overridden) {
            ActionView reset = new ActionView(activity, "Reset", Color.TRANSPARENT,
                    Tokens.TEXT_SECONDARY, () -> {
                save.onValue(null);
                dialog.dismiss();
            });
            GradientDrawable resetBackground = new GradientDrawable();
            resetBackground.setColor(Color.TRANSPARENT);
            resetBackground.setCornerRadius(radius);
            resetBackground.setStroke(Tokens.dp(activity, 1), Tokens.HAIRLINE);
            reset.setBackground(new RippleDrawable(
                    ColorStateList.valueOf(Tokens.RIPPLE_DARK), resetBackground, null));
            LinearLayout.LayoutParams resetParams = new LinearLayout.LayoutParams(
                    0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
            resetParams.leftMargin = Tokens.dp(activity, Tokens.SPACE_2);
            actions.addView(reset, resetParams);
        }

        ActionView saveButton = new ActionView(
                activity, "Save", Tokens.BG_WHITE, Tokens.TEXT_ON_LIGHT, () -> {
            String text = input.value();
            if (!isValid(type, text)) {
                status.setTextColor(Tokens.TEXT_DANGER);
                status.setText("Not a " + typeName(type) + ".");
                return;
            }
            save.onValue(text.isEmpty() ? null : text);
            dialog.dismiss();
        });
        GradientDrawable saveBackground = new GradientDrawable();
        saveBackground.setColor(Tokens.BG_WHITE);
        saveBackground.setCornerRadius(radius);
        saveButton.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Tokens.RIPPLE_DARK), saveBackground, null));
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        saveParams.leftMargin = Tokens.dp(activity, Tokens.SPACE_2);
        actions.addView(saveButton, saveParams);

        column.addView(actions);
        return column;
    }

    private static TextView note(Context context, int color) {
        TextView view = new TextView(context);
        view.setTextSize(Tokens.SUBTITLE_SP);
        view.setTextColor(color);
        view.setTypeface(Fonts.face(false));
        return view;
    }
}
