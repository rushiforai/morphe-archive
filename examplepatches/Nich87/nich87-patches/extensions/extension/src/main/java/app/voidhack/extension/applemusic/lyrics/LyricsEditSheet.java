package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.util.function.BiPredicate;
import java.util.function.BooleanSupplier;

final class LyricsEditSheet {
    private final Activity activity;
    private final Dialog dialog;
    private final Context context;
    private final LinearLayout root;
    private final int primary;
    private final int secondary;
    private final int accent;
    private final int divider;
    private final Typeface regular;
    private final Typeface semibold;

    private LyricsEditSheet(Activity activity) {
        this.activity = activity;
        int theme = LrclibStrings.id(activity, "style", "AppTheme.DialogFlowDialog");
        dialog = theme == 0 ? new Dialog(activity) : new Dialog(activity, theme);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(true);
        context = dialog.getContext();

        boolean dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        primary = color("label_color", dark ? 0xFFFFFFFF : 0xFF000000);
        secondary = color("secondary_label_color", dark ? 0xFFAEAEB2 : 0xFF636366);
        accent = color("color_primary", dark ? 0xFF0A84FF : 0xFF007AFF);
        divider = color("separator_color", dark ? 0xFF38383A : 0xFFC6C6C8);
        regular = font("regular", Typeface.DEFAULT);
        semibold = font("semibold", Typeface.DEFAULT_BOLD);

        root = column();
        root.setFocusableInTouchMode(true);
        root.setForceDarkAllowed(false);
        dialog.setContentView(root);

        Window window = dialog.getWindow();
        if (window == null) return;
        int rounded = LrclibStrings.id(context, "drawable", "rounded_top_background_system_dialog");
        if (rounded != 0) {
            window.setBackgroundDrawableResource(rounded);
        } else {
            GradientDrawable background = new GradientDrawable();
            background.setColor(color("background_color_layer1", dark ? 0xFF1C1C1E : 0xFFFFFFFF));
            float radius = dp(20);
            background.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
            window.setBackgroundDrawable(background);
        }
        int animations = LrclibStrings.id(context, "style", "AppTheme.DialogFlowDialog.WindowAnimations");
        if (animations != 0) window.setWindowAnimations(animations);
        window.setGravity(Gravity.BOTTOM);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.setDimAmount(0.4f);
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
    }

    static void showActions(Activity activity, Runnable edit, Runnable share) {
        LyricsEditSheet sheet = new LyricsEditSheet(activity);
        sheet.addChoice(LrclibStrings.text(activity, "edit_lyric_line"), sheet.primary, edit);
        sheet.addDivider(sheet.root);
        sheet.addChoice(LrclibStrings.text(activity, "share_lyrics"), sheet.primary, share);
        sheet.addDivider(sheet.root);
        sheet.addChoice(activity.getString(android.R.string.cancel), sheet.accent, () -> {});
        sheet.show();
    }

    static void showEditor(Activity activity, String lyric, String reading,
            BiPredicate<String, String> save, BooleanSupplier restore, Runnable afterSave) {
        showEditor(activity, lyric, reading, null, null, save, restore, afterSave);
    }

    static void showEditor(Activity activity, String lyric, String reading,
            String originalLyric, String originalReading,
            BiPredicate<String, String> save, BooleanSupplier restore, Runnable afterSave) {
        LyricsEditSheet sheet = new LyricsEditSheet(activity);
        Button cancel = sheet.action(activity.getString(android.R.string.cancel), sheet.accent, false);
        Button saveButton = sheet.action(LrclibStrings.text(activity, "save"), sheet.accent, true);
        sheet.addToolbar(cancel, saveButton);

        ScrollView scroll = new ScrollView(sheet.context);
        scroll.setFillViewport(false);
        scroll.setVerticalScrollBarEnabled(false);
        LinearLayout fields = sheet.column();
        fields.setPadding(sheet.dp(20), sheet.dp(14), sheet.dp(20), sheet.dp(16));
        scroll.addView(fields, new ScrollView.LayoutParams(-1, -2));
        sheet.root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1f));

        EditText lyricField = sheet.addField(fields, "edit_lyric_text", lyric, 20, EditorInfo.IME_ACTION_NEXT);
        sheet.addDivider(fields);
        EditText readingField = sheet.addField(fields, "edit_lyric_reading", reading, 17, EditorInfo.IME_ACTION_DONE);
        lyricField.setNextFocusForwardId(readingField.getId());

        cancel.setOnClickListener(view -> sheet.dialog.dismiss());
        saveButton.setOnClickListener(view -> {
            String text = lyricField.getText().toString().trim();
            if (text.isEmpty()) {
                lyricField.setError(LrclibStrings.text(activity, "empty_lyric_line"));
                lyricField.requestFocus();
                return;
            }
            sheet.finishSave(save.test(text, readingField.getText().toString().trim()), afterSave);
        });
        if (restore != null) {
            sheet.addDivider(fields);
            boolean showOrigLyric = originalLyric != null && !originalLyric.isEmpty() && !originalLyric.equals(lyric);
            boolean showOrigReading = originalReading != null && !originalReading.isEmpty()
                    && !originalReading.equals(reading);
            if (showOrigLyric) {
                TextView origTv = sheet.label(
                        LrclibStrings.text(activity, "edit_original_line", originalLyric),
                        13, sheet.secondary, sheet.regular);
                origTv.setPadding(0, sheet.dp(10), 0, showOrigReading ? sheet.dp(2) : sheet.dp(4));
                fields.addView(origTv, new LinearLayout.LayoutParams(-1, -2));
            }
            if (showOrigReading) {
                TextView origReadTv = sheet.label(
                        LrclibStrings.text(activity, "edit_original_reading", originalReading),
                        12, sheet.secondary, sheet.regular);
                origReadTv.setPadding(0, showOrigLyric ? sheet.dp(2) : sheet.dp(10), 0, sheet.dp(4));
                fields.addView(origReadTv, new LinearLayout.LayoutParams(-1, -2));
            }
            Button reset = sheet.action(LrclibStrings.text(activity, "reset_lyric_line"), sheet.accent, false);
            reset.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            reset.setPadding(0, 0, 0, 0);
            reset.setOnClickListener(view -> sheet.finishSave(restore.getAsBoolean(), afterSave));
            fields.addView(reset, new LinearLayout.LayoutParams(-1, -2));
        }
        sheet.show();
    }

    private void addToolbar(Button cancel, Button save) {
        LinearLayout toolbar = new LinearLayout(context);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(4), dp(2), dp(4), dp(2));

        TextView title = label(LrclibStrings.text(activity, "edit_lyric_line"), 17, primary, semibold);
        title.setGravity(Gravity.CENTER);
        title.setAccessibilityHeading(true);
        int side = Math.max(dp(72), (int) Math.ceil(Math.max(
                cancel.getPaint().measureText(cancel.getText().toString()),
                save.getPaint().measureText(save.getText().toString()))) + dp(20));
        toolbar.addView(cancel, new LinearLayout.LayoutParams(side, -2));
        toolbar.addView(title, new LinearLayout.LayoutParams(0, -2, 1f));
        toolbar.addView(save, new LinearLayout.LayoutParams(side, -2));
        root.addView(toolbar, new LinearLayout.LayoutParams(-1, -2));
        addDivider(root);
    }

    private EditText addField(LinearLayout fields, String key, String value, int size, int imeAction) {
        EditText field = new EditText(context);
        field.setId(View.generateViewId());
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        field.setImeOptions(imeAction | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        field.setSingleLine(false);
        field.setHorizontallyScrolling(false);
        field.setMaxLines(5);
        field.setMinHeight(dp(48));
        field.setTextSize(size);
        field.setTypeface(size == 20 ? semibold : regular);
        field.setTextColor(primary);
        field.setHighlightColor((accent & 0x00FFFFFF) | 0x42000000);
        field.setBackground(null);
        field.setPadding(0, dp(4), 0, dp(10));
        field.setText(value);

        TextView label = label(LrclibStrings.text(activity, key), 15, secondary, regular);
        label.setPadding(0, dp(9), 0, 0);
        label.setLabelFor(field.getId());
        fields.addView(label, new LinearLayout.LayoutParams(-1, -2));
        fields.addView(field, new LinearLayout.LayoutParams(-1, -2));
        return field;
    }

    private void addChoice(String label, int color, Runnable action) {
        Button row = action(label, color, false);
        row.setOnClickListener(view -> {
            dialog.dismiss();
            action.run();
        });
        root.addView(row, new LinearLayout.LayoutParams(-1, -2));
    }

    private Button action(String label, int color, boolean bold) {
        Button button = new Button(context, null, android.R.attr.borderlessButtonStyle);
        button.setAllCaps(false);
        button.setText(label);
        button.setTextColor(color);
        button.setTextSize(17);
        button.setTypeface(bold ? semibold : regular);
        button.setMinWidth(0);
        button.setMinHeight(dp(48));
        button.setGravity(Gravity.CENTER);
        button.setPadding(dp(8), dp(8), dp(8), dp(8));
        button.setBackground(new RippleDrawable(
                ColorStateList.valueOf((primary & 0x00FFFFFF) | 0x18000000),
                null, new ColorDrawable(0xFFFFFFFF)));
        return button;
    }

    private TextView label(String value, int size, int color, Typeface font) {
        TextView label = new TextView(context);
        label.setText(value);
        label.setTextSize(size);
        label.setTextColor(color);
        label.setTypeface(font);
        return label;
    }

    private LinearLayout column() {
        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        return layout;
    }

    private void addDivider(LinearLayout parent) {
        View line = new View(context);
        line.setBackgroundColor(divider);
        parent.addView(line, new LinearLayout.LayoutParams(-1, 1));
    }

    private void finishSave(boolean success, Runnable afterSave) {
        if (!success) return;
        dialog.dismiss();
        afterSave.run();
    }

    private void show() {
        root.requestFocus();
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) window.setLayout(-1, -2);
    }

    private int color(String name, int fallback) {
        int res = LrclibStrings.id(context, "color", name);
        return res == 0 ? fallback : context.getColor(res);
    }

    private Typeface font(String name, Typeface fallback) {
        int res = LrclibStrings.id(context, "font", name);
        if (res == 0) return fallback;
        try {
            return context.getResources().getFont(res);
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    private int dp(int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
