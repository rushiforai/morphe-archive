package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.Locale;

import app.onlynazril.extension.tiktok.AppLocale;
import app.onlynazril.extension.tiktok.StampText;
import app.onlynazril.extension.tiktok.internal.Activities;
import app.onlynazril.extension.tiktok.settings.PostDateFormat;

/**
 * The dialog behind the Custom pattern row: one text field, a live sample, and Save.
 * <p>
 * A pattern is accepted only when it formats a real date: the text is parsed through the same
 * {@link PostDateFormat#isValidPattern} the writers trust, so nothing is stored that would make a
 * render fall back or throw. The sample under the field is the same {@link StampText#date} call the
 * feed and comments use, so what the dialog shows is what the app will write.
 * <p>
 * Built on the screen's own palette, like the range and choice dialogs, rather than on a dialog
 * theme whose corner radius and chrome belong to the app.
 */
public final class PatternDialog {
    public interface OnPatternListener {
        void onPatternChanged(String pattern);
    }

    private static final long SAMPLE_AGE_MILLIS = 400L * 24L * 60L * 60L * 1000L;

    private PatternDialog() {}

    public static void show(
            Context context,
            String title,
            String hintText,
            String current,
            OnPatternListener save) {
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing()) return;
        Locale locale = AppLocale.of(activity);

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        EditText field = field(activity, current);
        TextView status = secondary(activity);
        status.setSingleLine(true);
        status.setEllipsize(TextUtils.TruncateAt.END);
        status.setGravity(Gravity.CENTER);

        Runnable update = () -> refresh(field, status, locale);
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                update.run();
            }
        });
        update.run();

        dialog.setContentView(
                panel(activity, dialog, title, hintText, field, status, locale, save));
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
            TextView status,
            Locale locale,
            OnPatternListener save) {
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

        TextView hint = secondary(activity);
        hint.setText(hintText);
        hint.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        hintParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        hintParams.bottomMargin = Tokens.dp(activity, Tokens.SPACE_4);
        hint.setLayoutParams(hintParams);
        column.addView(hint);

        LinearLayout fieldBlock = new LinearLayout(activity);
        fieldBlock.setOrientation(LinearLayout.VERTICAL);
        fieldBlock.setPadding(
                0,
                Tokens.dp(activity, Tokens.SPACE_4),
                0,
                Tokens.dp(activity, Tokens.SPACE_2)
        );
        fieldBlock.addView(field);

        LinearLayout.LayoutParams statusParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        statusParams.topMargin = Tokens.dp(activity, Tokens.SPACE_2);
        fieldBlock.addView(status, statusParams);
        column.addView(fieldBlock);

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
            String pattern = field.getText().toString().trim();
            if (!PostDateFormat.isValidPattern(pattern, locale)) {
                // The status line is already in its error state; saving stays open on purpose.
                refresh(field, status, locale);
                return;
            }
            save.onPatternChanged(pattern);
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

    /**
     * One line, always present: the sample when the pattern works, a sentence naming the problem
     * when it does not. Keeping both states in the same single-line view is what stops the panel
     * from growing or shrinking as the field is edited.
     */
    private static void refresh(EditText field, TextView status, Locale locale) {
        String pattern = field.getText().toString().trim();
        if (pattern.isEmpty()) {
            message(status, "A pattern is required.", Tokens.TEXT_DANGER);
            return;
        }
        if (!PostDateFormat.isValidPattern(pattern, locale)) {
            message(status, "Not a date pattern.", Tokens.TEXT_DANGER);
            return;
        }
        long millis = System.currentTimeMillis() - SAMPLE_AGE_MILLIS;
        message(
                status,
                "Sample: " + StampText.date(millis, locale, pattern, false),
                Tokens.TEXT_SECONDARY);
    }

    private static void message(TextView status, String text, int color) {
        status.setTextColor(color);
        status.setText(text);
    }

    private static EditText field(Context context, String value) {
        return TextField.create(context)
                .hint("d MMM yyyy")
                .text(value)
                .build();
    }

    private static TextView secondary(Context context) {
        TextView view = new TextView(context);
        view.setTextSize(Tokens.SUBTITLE_SP);
        view.setTextColor(Tokens.TEXT_SECONDARY);
        view.setTypeface(Fonts.face(false));
        return view;
    }

    private static GradientDrawable panelBackground(Context context) {
        GradientDrawable panel = new GradientDrawable();
        panel.setShape(GradientDrawable.RECTANGLE);
        panel.setCornerRadius(Tokens.dp(context, 14));
        panel.setColor(Tokens.PANEL);
        panel.setStroke(Tokens.dp(context, 1), Tokens.HAIRLINE);
        return panel;
    }
}
