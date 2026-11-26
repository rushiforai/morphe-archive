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
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;

/**
 * Compact native action sheet shown when long-pressing a shareable timed lyric line
 * so the user can choose between opening the full-song lyrics editor or native sharing.
 */
final class LyricsEditSheet {
    private final Dialog dialog;
    private final Context context;
    private final LinearLayout root;
    private final int primary;
    private final int accent;
    private final int divider;
    private final Typeface regular;
    private final Typeface semibold;

    private LyricsEditSheet(Activity activity) {
        int theme = LrclibStrings.id(activity, "style", "AppTheme.DialogFlowDialog");
        dialog = theme == 0 ? new Dialog(activity) : new Dialog(activity, theme);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setCanceledOnTouchOutside(true);
        context = dialog.getContext();

        boolean dark = (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        primary = color("label_color", dark ? 0xFFFFFFFF : 0xFF000000);
        accent = color("color_primary", dark ? 0xFF0A84FF : 0xFF007AFF);
        divider = color("separator_color", dark ? 0xFF38383A : 0xFFC6C6C8);
        regular = font("regular", Typeface.DEFAULT);
        semibold = font("semibold", Typeface.DEFAULT_BOLD);

        root = new LinearLayout(context);
        root.setOrientation(LinearLayout.VERTICAL);
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
    }

    static void showActions(Activity activity, Runnable openEditor, Runnable share) {
        LyricsEditSheet sheet = new LyricsEditSheet(activity);
        sheet.addChoice(LrclibStrings.text(activity, "open_lyrics_editor"), sheet.primary, openEditor);
        sheet.addDivider(sheet.root);
        sheet.addChoice(LrclibStrings.text(activity, "share_lyrics"), sheet.primary, share);
        sheet.addDivider(sheet.root);
        sheet.addChoice(activity.getString(android.R.string.cancel), sheet.accent, () -> {});
        sheet.show();
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

    private void addDivider(LinearLayout parent) {
        View line = new View(context);
        line.setBackgroundColor(divider);
        parent.addView(line, new LinearLayout.LayoutParams(-1, 1));
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
