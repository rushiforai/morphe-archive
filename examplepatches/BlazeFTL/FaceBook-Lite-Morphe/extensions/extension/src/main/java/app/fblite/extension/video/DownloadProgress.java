package app.fblite.extension.video;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.lang.ref.WeakReference;

/**
 * Progress of a download, in two places: a card at the top of the screen (under the status bar) with the name
 * and a bar, and a notification with a progress bar when the app may post notifications. One download at a time.
 */
final class DownloadProgress {
    private static final String CHANNEL = "morphe_download";
    private static final int NOTIFICATION_ID = 0x4d6f;
    private static final int MAX = 1000;

    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static Card card;
    private static Context appContext;
    private static String title = "";
    private static long lastNotify;

    private DownloadProgress() {
    }

    /** Starts showing a download. Call on any thread. */
    static void begin(final Activity activity, final String name, final String stage) {
        appContext = activity.getApplicationContext();
        title = name;
        VideoFeatures.MAIN.post(() -> {
            try {
                remove();
                Card c = new Card(activity, name);
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
                int margin = dp(activity, 10);
                int top = 0;
                if (Build.VERSION.SDK_INT >= 23 && activity.getWindow().getDecorView().getRootWindowInsets() != null) {
                    top = activity.getWindow().getDecorView().getRootWindowInsets().getSystemWindowInsetTop();
                }
                params.setMargins(margin, top + dp(activity, 4), margin, 0);
                ((ViewGroup) activity.getWindow().getDecorView()).addView(c, params);
                c.setAlpha(0f);
                c.setTranslationY(-dp(activity, 20));
                c.animate().alpha(1f).translationY(0f).setDuration(200).start();
                card = c;
                owner = new WeakReference<>(activity);
                c.set(0, stage);
            } catch (Throwable t) {
                VideoFeatures.log("Progress card failed", t);
            }
        });
        notifyProgress(stage, 0, false, false);
    }

    /** Fraction 0..1 and a short stage text. Call on any thread. */
    static void update(final float fraction, final String stage) {
        final int value = Math.max(0, Math.min(MAX, Math.round(fraction * MAX)));
        VideoFeatures.MAIN.post(() -> {
            if (card != null) card.set(value, stage);
        });
        long now = android.os.SystemClock.uptimeMillis();
        if (now - lastNotify > 700) {
            lastNotify = now;
            notifyProgress(stage, value, false, false);
        }
    }

    /** Finished: shows the result for a moment, then removes the card. */
    static void done(final String text) {
        VideoFeatures.MAIN.post(() -> {
            if (card != null) {
                card.set(MAX, text);
                final Card c = card;
                c.postDelayed(() -> {
                    if (card == c) remove();
                }, 900);
            }
        });
        notifyProgress(text, MAX, true, false);
    }

    static void fail(final String text) {
        VideoFeatures.MAIN.post(() -> {
            if (card != null) {
                card.set(0, text);
                final Card c = card;
                c.postDelayed(() -> {
                    if (card == c) remove();
                }, 1800);
            }
        });
        notifyProgress(text, 0, true, true);
    }

    private static void remove() {
        final Card c = card;
        card = null;
        if (c == null) return;
        c.animate().cancel();
        c.animate().alpha(0f).translationY(-dp(c.getContext(), 12)).setDuration(160).withEndAction(() -> {
            ViewGroup parent = (ViewGroup) c.getParent();
            if (parent != null) parent.removeView(c);
        }).start();
    }

    // ------------------------------------------------------------------------------------ notification

    private static void notifyProgress(String text, int value, boolean finished, boolean failed) {
        Context context = appContext;
        if (context == null || Build.VERSION.SDK_INT < 26) return;
        try {
            if (Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                    != PackageManager.PERMISSION_GRANTED) {
                return;
            }
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager.getNotificationChannel(CHANNEL) == null) {
                manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Downloads", NotificationManager.IMPORTANCE_LOW));
            }
            Notification.Builder builder = new Notification.Builder(context, CHANNEL)
                    .setContentTitle(title)
                    .setContentText(text)
                    .setSmallIcon(finished && !failed ? android.R.drawable.stat_sys_download_done : android.R.drawable.stat_sys_download)
                    .setOnlyAlertOnce(true)
                    .setOngoing(!finished)
                    .setAutoCancel(finished);
            if (!finished) builder.setProgress(MAX, value, false);
            manager.notify(NOTIFICATION_ID, builder.build());
        } catch (Throwable ignored) {
            // Notifications are a bonus.
        }
    }

    // ------------------------------------------------------------------------------------ the card

    private static final class Card extends LinearLayout {
        private final TextView stageText;
        private final ProgressBar bar;

        Card(Context context, String name) {
            super(context);
            setOrientation(VERTICAL);
            GradientDrawable shape = new GradientDrawable();
            shape.setColor(0xF2FFFFFF);
            shape.setCornerRadius(dp(context, 12));
            shape.setStroke(dp(context, 1), 0x14000000);
            setBackground(shape);
            setElevation(dp(context, 6));
            int pad = dp(context, 10);
            setPadding(pad, dp(context, 6), pad, dp(context, 8));
            setMinimumWidth(dp(context, 150));
            // A tap dismisses it at once.
            setOnClickListener(v -> {
                if (card == this) remove();
            });

            TextView nameText = new TextView(context);
            nameText.setText(name);
            nameText.setTextColor(0xFF1C1E21);
            nameText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            nameText.setMaxWidth(Math.round(context.getResources().getDisplayMetrics().widthPixels * 0.7f));
            nameText.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
            nameText.setSingleLine(true);
            nameText.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
            addView(nameText);

            stageText = new TextView(context);
            stageText.setTextColor(0xFF65676B);
            stageText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f);
            stageText.setSingleLine(true);
            addView(stageText);

            bar = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
            bar.setMax(MAX);
            bar.setProgressTintList(ColorStateList.valueOf(0xFF1877F2));
            bar.setProgressBackgroundTintList(ColorStateList.valueOf(Color.argb(30, 0, 0, 0)));
            LinearLayout.LayoutParams barParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 3));
            barParams.topMargin = dp(context, 5);
            addView(bar, barParams);
        }

        void set(int value, String stage) {
            bar.setProgress(value);
            stageText.setText(stage);
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
