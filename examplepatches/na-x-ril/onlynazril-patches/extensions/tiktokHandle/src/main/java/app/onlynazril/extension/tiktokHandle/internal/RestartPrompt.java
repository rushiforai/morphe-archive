package app.onlynazril.extension.tiktokHandle.internal;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.onlynazril.extension.tiktokHandle.ui.ActionView;
import app.onlynazril.extension.tiktokHandle.ui.Tokens;

/**
 * Asks for one restart after the app is patched.
 *
 * A freshly patched install can render a name from values the app cached before this extension was
 * there — a name can come out with the handle twice until the process starts again. The extension
 * cannot clear that cache, so it asks instead, once per install: the app's own `lastUpdateTime` is
 * remembered, and a newer one means the APK changed since the last time it asked.
 *
 * Shown from the first feed header, which is the earliest point where an Activity is in hand and
 * the patch has no separate hook of its own for.
 */
public final class RestartPrompt {
    private static final String TAG = "tiktokHandle";
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_INSTALL = "restart_prompt_install";

    /** One prompt per process: the pref decides across restarts. */
    private static boolean handled;

    private RestartPrompt() {}

    /** Called where a view is in hand; does nothing when this install has already been asked. */
    public static void maybeShow(View view) {
        try {
            if (view == null || handled) return;
            Context context = view.getContext();
            if (context == null) return;

            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long installed = installedAt(context);
            if (installed <= 0 || prefs.getLong(KEY_INSTALL, 0) >= installed) {
                handled = true;
                return;
            }

            Activity activity = activityOf(context);
            if (activity == null || activity.isFinishing()) return;

            handled = true;
            prefs.edit().putLong(KEY_INSTALL, installed).apply();
            Debug.print("restart prompt: asked, install=" + installed);
            activity.runOnUiThread(() -> show(activity));
        } catch (Throwable t) {
            Log.w(TAG, "restart prompt failed", t);
        }
    }

    /** Restarts now, from any context that leads to an Activity. */
    public static void restartNow(Context context) {
        try {
            Activity activity = activityOf(context);
            if (activity == null) return;
            restart(activity);
        } catch (Throwable t) {
            Log.w(TAG, "restart failed", t);
        }
    }

    /**
     * The panel is built here rather than taken from a dialog theme: a theme brings its own corner
     * radius, its own panel colour and its own button chrome, and the app's preferred theme decides
     * all three. This one is the screen's own palette — a `PANEL` background, a small radius, a
     * hairline — with the same rounded controls the screen uses, so the prompt and the screen read as
     * one thing rather than two.
     */
    private static void show(Activity activity) {
        try {
            Dialog dialog = new Dialog(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dialog.setContentView(panel(activity, dialog));

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
        } catch (Throwable t) {
            Log.w(TAG, "restart prompt failed", t);
        }
    }

    private static View panel(Activity activity, Dialog dialog) {
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
        // reads as one centred block while the actions keep the bottom-right corner.
        TextView title = new TextView(context);
        title.setText("Restart TikTok once");
        title.setTextSize(Tokens.PANEL_TITLE_SP);
        title.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        title.setTextColor(Tokens.TEXT_PRIMARY);
        title.setGravity(Gravity.CENTER);
        title.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        column.addView(title);

        TextView message = new TextView(context);
        message.setText("Restart to finish setting up.");
        message.setTextSize(Tokens.SUBTITLE_SP);
        message.setTextColor(Tokens.TEXT_SECONDARY);
        message.setGravity(Gravity.CENTER);
        message.setLineSpacing(Tokens.dp(context, Tokens.SPACE_1), 1f);

        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        messageParams.topMargin = Tokens.dp(context, Tokens.SPACE_2);
        messageParams.bottomMargin = Tokens.dp(context, Tokens.SPACE_2);
        message.setLayoutParams(messageParams);
        column.addView(message);

        // Right-aligned, the same as the screen's own control, and on the panel's own fill. Only the
        // gap above the row is tight: the title and the message keep the panel's full padding.
        LinearLayout actions = new LinearLayout(context);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setLayoutParams(new LinearLayout.LayoutParams(
              LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        actions.setPadding(0, Tokens.dp(context, Tokens.SPACE_2), 0, 0);

        // LayoutParams untuk membagi 50% (weight = 1f, width = 0)
        LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(
              0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);

        // Tombol kiri (Later)
        ActionView later = new ActionView(
                context, "Later", Tokens.PANEL, Tokens.TEXT_SECONDARY, dialog::dismiss);
        actions.addView(later, actionParams);

        // Tombol kanan (Restart now) dengan margin kiri sebagai pemisah
        ActionView restart = new ActionView(
                context, "Restart now", Tokens.PANEL, Tokens.ACCENT, () -> restart(activity));
        LinearLayout.LayoutParams restartParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        restartParams.leftMargin = Tokens.dp(context, Tokens.SPACE_2);
        actions.addView(restart, restartParams);

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

    /**
     * Restarts the app rather than only closing it: the launcher activity is put in a fresh task and
     * this process is ended, so the app comes back on its own with the state a fresh install left
     * behind cleared.
     *
     * The exit follows the launch request immediately, with nothing in between. That ordering is the
     * whole trick: the request is already with the system when the process goes, so the activity is
     * brought up by a new process instead of this one. Waiting even a moment lets the activity start
     * here, and then ending the process takes the app down with it — the app opens and dies, which is
     * what a delay produced. `makeRestartActivityTask` is what clears the back stack this process
     * was holding.
     */
    private static void restart(Activity activity) {
        Intent launch = activity.getPackageManager()
                .getLaunchIntentForPackage(activity.getPackageName());
        if (launch == null || launch.getComponent() == null) {
            Debug.print("restart: the launcher activity could not be resolved");
            close(activity);
            return;
        }
        try {
            activity.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
            Debug.print("restart: a fresh task was started, ending this process now");
            activity.finish();
        } catch (Throwable t) {
            Debug.print("restart: the fresh task did not start (" + t + ")");
            close(activity);
            return;
        }
        Runtime.getRuntime().exit(0);
    }

    /** The fallback: close what is open and end the process, without bringing anything back. */
    private static void close(Activity activity) {
        try {
            activity.finishAffinity();
        } catch (Throwable ignored) {
        }
        Debug.print("restart: ending this process");
        Runtime.getRuntime().exit(0);
    }

    private static long installedAt(Context context) {
        try {
            return context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0)
                    .lastUpdateTime;
        } catch (Throwable t) {
            return 0;
        }
    }

    /** The Activity behind a view's context, if the chain leads to one. */
    private static Activity activityOf(Context context) {
        Context current = context;
        for (int i = 0; i < 10 && current instanceof ContextWrapper; i++) {
            if (current instanceof Activity) return (Activity) current;
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == null || base == current) break;
            current = base;
        }
        return current instanceof Activity ? (Activity) current : null;
    }
}
