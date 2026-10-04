package app.onlynazril.extension.tiktok.ui;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.onlynazril.extension.tiktok.internal.Activities;

/**
 * The one prompt the extension shows: a title, a message, and a confirm/dismiss pair.
 *
 * Built from the screen's own palette instead of a dialog theme, because a theme brings its own
 * corner radius, panel colour and button chrome, and the app decides all three. The shape, the
 * palette and the control style therefore live here once, and every caller supplies only its copy
 * and what confirming does.
 *
 * One at a time: a second request while a prompt is on screen is dropped rather than stacked, which
 * matters for the change prompt, where a run of switches can be flipped in a row.
 */
public final class Prompt {
    private static final String TAG = "tiktokHandle";
    private static final String CONFIRM = "Restart now";
    private static final String DISMISS = "Later";

    private static volatile boolean showing;

    private Prompt() {}

    /** Shows the prompt, or drops the request when one is already up. Nothing else is required. */
    public static void show(
            Context context,
            String title,
            String message,
            Runnable onConfirm) {
        try {
            if (showing) return;
            Activity activity = Activities.of(context);
            if (activity == null || activity.isFinishing()) return;
            activity.runOnUiThread(
                    () -> display(activity, title, message, CONFIRM, DISMISS, onConfirm));
        } catch (Throwable t) {
            Log.w(TAG, "prompt failed", t);
        }
    }

    private static void display(
            Activity activity,
            String title,
            String message,
            String confirmLabel,
            String dismissLabel,
            Runnable onConfirm) {
        try {
            Dialog dialog = new Dialog(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(panel(activity, dialog, title, message, confirmLabel, dismissLabel,
                    onConfirm));
            dialog.setOnDismissListener(dismissed -> showing = false);

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
            showing = true;
            dialog.show();
        } catch (Throwable t) {
            Log.w(TAG, "prompt failed", t);
        }
    }

    private static LinearLayout panel(
            Activity activity,
            Dialog dialog,
            String title,
            String message,
            String confirmLabel,
            String dismissLabel,
            Runnable onConfirm) {
        Context context = activity;
        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setBackground(panelBackground(context));
        column.setPadding(
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4),
                Tokens.dp(context, Tokens.SPACE_4));

        // Title and message run the panel's full width and centre their text in it, so the content
        // reads as one centred block while the actions keep the bottom-right corner. Either may be
        // left out: a prompt that says everything in one line passes only a title.
        if (title != null && !title.isEmpty()) {
            TextView heading = new TextView(context);
            heading.setText(title);
            heading.setTextSize(Tokens.PANEL_TITLE_SP);
            heading.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
            heading.setTextColor(Tokens.TEXT_PRIMARY);
            heading.setGravity(Gravity.CENTER);
            heading.setLayoutParams(new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
            column.addView(heading);
        }

        if (message != null && !message.isEmpty()) {
            TextView body = new TextView(context);
            body.setText(message);
            body.setTextSize(Tokens.SUBTITLE_SP);
            body.setTextColor(Tokens.TEXT_SECONDARY);
            body.setGravity(Gravity.CENTER);
            body.setLineSpacing(Tokens.dp(context, Tokens.SPACE_1), 1f);
            LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            bodyParams.topMargin = Tokens.dp(context, Tokens.SPACE_2);
            bodyParams.bottomMargin = Tokens.dp(context, Tokens.SPACE_2);
            body.setLayoutParams(bodyParams);
            column.addView(body);
        }

        // Two equal actions at the bottom. Only the gap above them is tight: the title and the
        // message keep the panel's full padding.
        LinearLayout actions = new LinearLayout(context);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        actions.setPadding(0, Tokens.dp(context, Tokens.SPACE_2), 0, 0);

        actions.addView(
                new ActionView(context, dismissLabel, Tokens.PANEL, Tokens.TEXT_SECONDARY,
                        dialog::dismiss),
                new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        ActionView confirm = new ActionView(context, confirmLabel, Tokens.PANEL, Tokens.ACCENT, () -> {
            dialog.dismiss();
            onConfirm.run();
        });
        LinearLayout.LayoutParams confirmParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        confirmParams.leftMargin = Tokens.dp(context, Tokens.SPACE_2);
        actions.addView(confirm, confirmParams);

        column.addView(actions);
        return column;
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
