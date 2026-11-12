package app.tvpatches.extension.youtubetv;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * A dialog drawn like YouTube TV's own confirmation panel: a dark rounded panel on the right side
 * of the screen, title and message at the top, and full-width pill buttons at the bottom (white
 * when focused). Works with a remote (D-pad up/down, OK, Back).
 */
final class TvDialog {
    interface OnButton {
        void onClick(int index);
    }

    private static final int PANEL = 0xFF212121;
    private static final int TEXT = 0xFFF1F1F1;
    private static final int TEXT_SECONDARY = 0xFFAAAAAA;
    private static final int BUTTON = 0x1AFFFFFF;
    private static final int BUTTON_FOCUSED = 0xFFF1F1F1;
    private static final int BUTTON_TEXT_FOCUSED = 0xFF0F0F0F;

    final Dialog dialog;
    final TextView title;
    final TextView message;
    private final float u;

    private TvDialog(Activity activity, String titleText, String messageText, View extra,
                     String[] buttons, boolean cancelable, OnButton onButton) {
        // Sizes are taken from the 1280x720 layout of YouTube TV and scaled to the screen.
        int screenWidth = Math.max(activity.getResources().getDisplayMetrics().widthPixels,
                activity.getResources().getDisplayMetrics().heightPixels);
        u = screenWidth / 1280f;

        dialog = new Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar_Fullscreen);
        dialog.setCancelable(cancelable);

        FrameLayout root = new FrameLayout(activity);
        root.setBackgroundColor(0x99000000);

        LinearLayout panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(PANEL);
        bg.setCornerRadius(px(24));
        panel.setBackground(bg);
        panel.setPadding(px(24), px(24), px(24), px(24));
        FrameLayout.LayoutParams panelParams =
                new FrameLayout.LayoutParams(px(456), ViewGroup.LayoutParams.MATCH_PARENT, Gravity.END);
        panelParams.setMargins(px(24), px(24), px(24), px(24));
        root.addView(panel, panelParams);

        title = text(activity, titleText, 22, TEXT, Typeface.create("sans-serif-medium", Typeface.NORMAL));
        panel.addView(title);

        message = text(activity, messageText, 18, TEXT_SECONDARY, Typeface.create("sans-serif", Typeface.NORMAL));
        message.setLineSpacing(px(4), 1f);
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        messageParams.topMargin = px(20);
        panel.addView(message, messageParams);

        if (extra != null) {
            LinearLayout.LayoutParams extraParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            extraParams.topMargin = px(28);
            panel.addView(extra, extraParams);
        }

        // Pushes the buttons to the bottom of the panel.
        panel.addView(new View(activity), new LinearLayout.LayoutParams(0, 0, 1f));

        TextView first = null;
        for (int i = 0; i < buttons.length; i++) {
            final int index = i;
            TextView button = button(activity, buttons[i]);
            button.setOnClickListener(v -> {
                dialog.dismiss();
                if (onButton != null) onButton.onClick(index);
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, px(64));
            if (i > 0) params.topMargin = px(16);
            panel.addView(button, params);
            if (first == null) first = button;
        }

        dialog.setContentView(root);
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
        }
        if (cancelable && onButton != null) {
            // Back = the last button ("Ahora no", "Cerrar").
            dialog.setOnCancelListener(d -> onButton.onClick(buttons.length - 1));
        }
        dialog.setOnKeyListener((d, keyCode, event) ->
                !cancelable && keyCode == KeyEvent.KEYCODE_BACK);
        if (first != null) {
            final TextView focus = first;
            dialog.setOnShowListener(d -> focus.requestFocus());
        }
    }

    static TvDialog show(Activity activity, String title, String message, View extra,
                         String[] buttons, boolean cancelable, OnButton onButton) {
        TvDialog d = new TvDialog(activity, title, message, extra, buttons, cancelable, onButton);
        d.dialog.show();
        return d;
    }

    void dismiss() {
        try {
            dialog.dismiss();
        } catch (Exception ignored) {
        }
    }

    int px(float value) {
        return Math.round(value * u);
    }

    private TextView text(Activity activity, String value, float size, int color, Typeface face) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_PX, px(size));
        view.setTypeface(face);
        return view;
    }

    private TextView button(Activity activity, String label) {
        TextView view = text(activity, label, 18, TEXT, Typeface.create("sans-serif-medium", Typeface.NORMAL));
        view.setGravity(Gravity.CENTER);
        view.setFocusable(true);
        view.setFocusableInTouchMode(true);
        view.setClickable(true);

        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused}, pill(BUTTON_FOCUSED));
        states.addState(new int[]{}, pill(BUTTON));
        view.setBackground(states);
        view.setOnFocusChangeListener((v, focused) ->
                ((TextView) v).setTextColor(focused ? BUTTON_TEXT_FOCUSED : TEXT));
        return view;
    }

    private GradientDrawable pill(int color) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(px(32));
        return d;
    }
}
