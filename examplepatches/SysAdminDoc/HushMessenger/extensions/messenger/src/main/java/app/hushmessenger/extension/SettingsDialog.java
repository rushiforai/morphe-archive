package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.os.Build;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/** Full-window settings sheet. Short windows scroll the heading and actions with the content. */
final class SettingsDialog extends LinearLayout {
    final Dialog dialog;
    final LinearLayout body, actions;
    final ScrollView scroll;
    private final SettingsUi ui;
    private final LinearLayout header, scrolled;
    private boolean compact;

    SettingsDialog(Activity owner, SettingsUi ui, SettingsText text, String title, String hint) {
        super(owner);
        this.ui = ui;
        dialog = new Dialog(owner);
        setTag("settings_dialog");
        setOrientation(VERTICAL);
        setBackgroundColor(ui.dialog);
        setPadding(ui.dp(20), ui.dp(20), ui.dp(20), ui.dp(16));
        setLayoutDirection(text.layoutDirection());
        if (text.layoutDirection() == LAYOUT_DIRECTION_RTL) setTextDirection(TEXT_DIRECTION_RTL);
        setAccessibilityPaneTitle(title);
        header = ui.column();
        // HushGram's dialog title: 20 sp medium in the gradient, wrapping onto as many lines as it needs.
        TextView heading = ui.title(title, 20);
        heading.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
        heading.setTag("dialog_title");
        heading.setAccessibilityHeading(true);
        header.addView(heading);
        TextView hintLine = ui.text(hint, 14, ui.muted, false);
        hintLine.setTag("dialog_hint");
        ui.add(header, hintLine, 8);
        header.setPadding(0, 0, 0, ui.dp(16));
        body = ui.column();
        body.setPadding(0, 0, 0, ui.dp(12));
        actions = ui.row();
        actions.setTag("dialog_actions");
        actions.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        actions.setBackground(ui.topEdge(ui.dialog));
        actions.setPadding(0, ui.dp(16), 0, 0);
        if (ui.largeText) actions.setOrientation(VERTICAL);
        scrolled = ui.column();
        scrolled.addView(body);
        scroll = new ScrollView(owner);
        scroll.setTag("dialog_scroll");
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        scroll.addView(scrolled);
        addView(header, new LayoutParams(-1, -2));
        addView(scroll, new LayoutParams(-1, 0, 1));
        addView(actions, new LayoutParams(-1, -2));
        setOnApplyWindowInsetsListener((view, insets) -> {
            int left = insets.getSystemWindowInsetLeft(), top = insets.getSystemWindowInsetTop();
            int right = insets.getSystemWindowInsetRight(), bottom = insets.getSystemWindowInsetBottom();
            DisplayCutout cutout = insets.getDisplayCutout();
            if (cutout != null) {
                left = Math.max(left, cutout.getSafeInsetLeft());
                top = Math.max(top, cutout.getSafeInsetTop());
                right = Math.max(right, cutout.getSafeInsetRight());
                bottom = Math.max(bottom, cutout.getSafeInsetBottom());
            }
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets safe = insets.getInsets(WindowInsets.Type.systemBars() |
                    WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
                left = Math.max(left, safe.left);
                top = Math.max(top, safe.top);
                right = Math.max(right, safe.right);
                bottom = Math.max(bottom, safe.bottom);
            }
            setPadding(ui.dp(20) + left, ui.dp(20) + top, ui.dp(20) + right, ui.dp(16) + bottom);
            return Build.VERSION.SDK_INT >= 30 ? WindowInsets.CONSUMED : insets.consumeSystemWindowInsets().consumeDisplayCutout();
        });
        dialog.setContentView(this);
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(ui.dialog));
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            dialog.getWindow().setStatusBarColor(ui.dialog);
            dialog.getWindow().setNavigationBarColor(ui.dialog);
            dialog.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
                (ui.light ? View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0));
            if (Build.VERSION.SDK_INT >= 30) dialog.getWindow().setDecorFitsSystemWindows(false);
        }
    }

    /** Adds button as it comes: ui.button is HushGram's secondary action and ui.primaryButton its primary one. */
    void action(Button button) {
        LayoutParams params = new LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1);
        if (actions.getChildCount() > 0) {
            if (ui.largeText) params.topMargin = ui.dp(8);
            else params.setMarginStart(ui.dp(12));
        }
        actions.addView(button, params);
    }

    void show() {
        dialog.show();
        if (dialog.getWindow() != null) {
            dialog.getWindow().setLayout(-1, -1);
            // show() can reset the window's mode, and a panning window leaves Save behind the keyboard.
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        requestApplyInsets();
    }

    @Override protected void onMeasure(int widthSpec, int heightSpec) {
        int width = Math.max(0, MeasureSpec.getSize(widthSpec) - getPaddingLeft() - getPaddingRight());
        int available = Math.max(0, MeasureSpec.getSize(heightSpec) - getPaddingTop() - getPaddingBottom());
        int exact = MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY);
        int natural = MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED);
        header.measure(exact, natural);
        actions.measure(exact, natural);
        boolean shortWindow = header.getMeasuredHeight() + actions.getMeasuredHeight() + ui.dp(96) > available;
        if (shortWindow != compact) {
            compact = shortWindow;
            detach(header);
            detach(actions);
            if (compact) {
                scrolled.addView(header, 0, new LayoutParams(-1, -2));
                scrolled.addView(actions, new LayoutParams(-1, -2));
            } else {
                addView(header, 0, new LayoutParams(-1, -2));
                addView(actions, new LayoutParams(-1, -2));
            }
        }
        super.onMeasure(widthSpec, heightSpec);
    }

    private static void detach(View view) {
        if (view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
    }
}
