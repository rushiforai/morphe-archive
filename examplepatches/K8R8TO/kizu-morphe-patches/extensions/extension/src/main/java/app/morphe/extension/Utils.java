package app.morphe.extension;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.util.WeakHashMap;

import app.morphe.extension.twitch.emotes.EmoteSupport;
import app.morphe.extension.channelpoints.ChannelPoints;
import app.morphe.extension.twitch.emotes.EmotePickerBridge;
import io.github.bakwudo.uyu.extension.settings.Settings;
import io.github.bakwudo.uyu.extension.danmaku.LandscapeChatPatch;

public final class Utils {
    private static final String TAG = "kizu";
    private static final long CLAIM_POLL_INTERVAL_MS = 3_000L;
    private static final int STATUS_DURATION_MS = 2_000;
    private static final WeakHashMap<Activity, TextView> STATUS_MESSAGES = new WeakHashMap<>();

    @SuppressLint("StaticFieldLeak")
    private static volatile Context context;
    private static volatile Activity currentActivity;
    private static volatile Application registeredApplication;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, Long> CLAIM_LAST_CLICK = new WeakHashMap<>();
    private static volatile boolean claimWatcherStarted;

    private static final Runnable CLAIM_WATCHER = new Runnable() {
        @Override public void run() {
            try {
                if (Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) {
                    Activity activity = currentActivity;
                    if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                        scanForClaimButton(activity.getWindow().getDecorView());
                    }
                } else {
                    synchronized (CLAIM_LAST_CLICK) {
                        CLAIM_LAST_CLICK.clear();
                    }
                }
            } catch (Throwable ignored) {
            }

            MAIN.postDelayed(this, CLAIM_POLL_INTERVAL_MS);
        }
    };

    private static final Application.ActivityLifecycleCallbacks ACTIVITY_CALLBACKS =
            new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, Bundle state) {}

                @Override public void onActivityStarted(Activity activity) {
                    currentActivity = activity;
                    try { DefaultFollowing.onActivityStarted(activity); } catch (Throwable ignored) {}
                    try { LandscapeChatPatch.onActivityStarted(activity); } catch (Throwable ignored) {}
                    try { EmotePickerBridge.ensureComposerButton(); } catch (Throwable ignored) {}
                }

                @Override public void onActivityResumed(Activity activity) {
                    currentActivity = activity;
                    try { DefaultFollowing.onActivityStarted(activity); } catch (Throwable ignored) {}
                    try { LandscapeChatPatch.onActivityStarted(activity); } catch (Throwable ignored) {}
                    try { EmotePickerBridge.ensureComposerButton(); } catch (Throwable ignored) {}
                }

                @Override public void onActivityPaused(Activity activity) {}

                @Override public void onActivityStopped(Activity activity) {}

                @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}

                @Override public void onActivityDestroyed(Activity activity) {
                    synchronized (STATUS_MESSAGES) { STATUS_MESSAGES.remove(activity); }
                    if (currentActivity == activity) currentActivity = null;
                }
            };

    private Utils() {}

    public static void setContext(Context appContext) {
        context = appContext;
        io.github.bakwudo.uyu.extension.Utils.setContext(appContext);
        EmoteSupport.init(appContext);

        // Channel Points uses the isolated GraphQL claimant. Do not start the old UI scanner:
        // it is intentionally retired because UI/model lifecycle hooks caused regressions.
        ChannelPoints.start(appContext);

        try {
            Context applicationContext = appContext == null ? null : appContext.getApplicationContext();
            if (applicationContext instanceof Application) {
                Application application = (Application) applicationContext;
                if (registeredApplication != application) {
                    if (registeredApplication != null) {
                        registeredApplication.unregisterActivityLifecycleCallbacks(ACTIVITY_CALLBACKS);
                    }
                    registeredApplication = application;
                    application.registerActivityLifecycleCallbacks(ACTIVITY_CALLBACKS);
                }
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Scans only the currently visible Twitch Activity and presses Twitch's own visible
     * channel-points claim control. This does not modify CommunityPointsModel or call a
     * separate claim API, so the Twitch chat/model lifecycle stays untouched.
     */
    private static void scanForClaimButton(View root) {
        if (root == null || root.getVisibility() != View.VISIBLE || !root.isShown()) return;

        if (isClaimControl(root)) {
            boolean eligible = root.isEnabled() && root.isClickable();
            if (eligible) {
                long now = SystemClock.elapsedRealtime();
                boolean shouldClick;
                synchronized (CLAIM_LAST_CLICK) {
                    Long previous = CLAIM_LAST_CLICK.get(root);
                    shouldClick = previous == null || now - previous >= CLAIM_POLL_INTERVAL_MS;
                    if (shouldClick) {
                        CLAIM_LAST_CLICK.put(root, now);
                    }
                }

                if (shouldClick) {
                    try {
                        if (root.performClick()) {
                            Log.d(TAG, "auto-claimed visible channel-points bonus");
                            showClaimStatus("Channel Points +50 claimed");
                            dismissClaimControl(root);
                            scheduleClaimUiRefresh(root);
                        } else {
                            synchronized (CLAIM_LAST_CLICK) {
                                CLAIM_LAST_CLICK.remove(root);
                            }
                            showClaimStatus("Channel Points +50 claim failed");
                        }
                    } catch (Throwable ignored) {
                    }
                }
            } else {
                synchronized (CLAIM_LAST_CLICK) {
                    CLAIM_LAST_CLICK.remove(root);
                }
            }
        }

        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                scanForClaimButton(group.getChildAt(i));
            }
        }
    }

    /**
     * Re-requests a normal Android redraw/layout after Twitch processes the claim.
     * This is deliberately view-only: it does not hide/remove the control or touch Twitch
     * models, so a failed claim cannot leave the UI in a fabricated state.
     */
    private static void scheduleClaimUiRefresh(final View claimedView) {
        Runnable refresh = new Runnable() {
            @Override public void run() {
                refreshClaimUi(claimedView);
            }
        };
        claimedView.postDelayed(refresh, 350L);
        claimedView.postDelayed(refresh, 900L);
    }

    private static void refreshClaimUi(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;

        View current = view;
        while (current != null) {
            try {
                current.refreshDrawableState();
                current.invalidate();
                current.requestLayout();
            } catch (Throwable ignored) {
            }

            if (!(current.getParent() instanceof View)) break;
            current = (View) current.getParent();
        }
    }

    private static void dismissClaimControl(View claimedView) {
        if (claimedView == null) return;
        try {
            View target = findNearestClickableAncestor(claimedView);
            claimedView.setVisibility(View.GONE);
            if (target != null && target != claimedView) target.setVisibility(View.GONE);
            View current = target == null ? claimedView : target;
            while (current.getParent() instanceof View) {
                current = (View) current.getParent();
                current.invalidate();
                current.requestLayout();
            }
        } catch (Throwable ignored) {
        }
    }

    private static View findNearestClickableAncestor(View view) {
        View current = view;
        for (int i = 0; i < 6 && current != null; i++) {
            if (current.isClickable() && current.isEnabled()) return current;
            if (!(current.getParent() instanceof View)) break;
            current = (View) current.getParent();
        }
        return null;
    }

    public static void showClaimStatus(final String message) {
        final Activity activity = currentActivity;
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        MAIN.post(new Runnable() {
            @Override public void run() {
                try {
                    View decorView = activity.getWindow().getDecorView();
                    if (!(decorView instanceof FrameLayout)) return;
                    FrameLayout decor = (FrameLayout) decorView;
                    TextView old;
                    synchronized (STATUS_MESSAGES) { old = STATUS_MESSAGES.get(activity); }
                    if (old != null) try { decor.removeView(old); } catch (Throwable ignored) {}

                    TextView status = new TextView(activity);
                    status.setText(message);
                    status.setTextColor(Color.WHITE);
                    status.setTextSize(14f);
                    status.setGravity(Gravity.CENTER);
                    status.setPadding(dp(activity, 14), dp(activity, 8), dp(activity, 14), dp(activity, 8));
                    GradientDrawable bg = new GradientDrawable();
                    bg.setColor(0xEE222222);
                    bg.setCornerRadius(dp(activity, 10));
                    status.setBackground(bg);
                    status.setElevation(dp(activity, 8));

                    FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT);
                    lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
                    lp.bottomMargin = dp(activity, 72);
                    lp.leftMargin = dp(activity, 16);
                    lp.rightMargin = dp(activity, 16);
                    decor.addView(status, lp);
                    synchronized (STATUS_MESSAGES) { STATUS_MESSAGES.put(activity, status); }

                    MAIN.postDelayed(new Runnable() {
                        @Override public void run() {
                            try {
                                synchronized (STATUS_MESSAGES) {
                                    if (STATUS_MESSAGES.get(activity) == status) STATUS_MESSAGES.remove(activity);
                                }
                                decor.removeView(status);
                            } catch (Throwable ignored) {}
                        }
                    }, STATUS_DURATION_MS);
                } catch (Throwable ignored) {}
            }
        });
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static boolean isClaimControl(View view) {
        CharSequence text = null;
        CharSequence description = view.getContentDescription();

        if (view instanceof android.widget.TextView) {
            text = ((android.widget.TextView) view).getText();
        }

        String value = ((text == null ? "" : text.toString()) + " " +
                (description == null ? "" : description.toString()))
                .toLowerCase(java.util.Locale.ROOT);

        return value.contains("claim") &&
                (value.contains("bonus") || value.contains("channel point"));
    }

    public static Context getContext() {
        return context;
    }

    /** Returns the currently active Twitch Activity, even when the extension only has an application context. */
    public static Activity getCurrentActivity() {
        Activity activity = currentActivity;
        if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) return activity;
        return findActivity(context);
    }

    @SuppressLint("DiscouragedApi")
    public static int getResourceId(Context context, String name, String type) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    public static Activity findActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity activity) return activity;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    public static void logInfo(String message) {
        Log.i(TAG, message);
    }

    public static void logError(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }
}
