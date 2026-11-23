package app.jofslash.extension.booking;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Locale;

/**
 * "Review check": scans the reviews the app has already loaded on the reviews screen
 * (com.booking.ugc.presentation.reviews.activity.marken.PropertyReviewsActivity) for scam / money /
 * booking-integrity keywords and shows a small native banner at the top of that screen. The banner
 * is a plain View put on top of the Compose content (like the Compare prices button on the property
 * page); tapping it opens a dialog listing the flagged reviews.
 *
 * <p>The loaded reviews are captured from the reactor's ReviewsLoaded action, so nothing is fetched
 * from the backend: we only read what the screen already shows.
 */
public final class ReviewCheck {
    static final String TAG = "JoFBookingReviews";
    private static final String BANNER_TAG = "jofslash_review_banner";

    private ReviewCheck() {
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** The latest scan of the loaded reviews, or null until the first list arrives. */
    private static volatile ReviewScanner.Result latest;
    /** The reviews screen on top now. */
    private static WeakReference<Activity> current = new WeakReference<>(null);

    /** Called from the reviews activity's constructor. */
    public static void onReviewsActivity(Activity activity) {
        try {
            // A new reviews screen: forget the previous hotel's scan until its reviews load.
            latest = null;
            listen(activity);
        } catch (Throwable t) {
            Log.w(TAG, "onReviewsActivity", t);
        }
    }

    /**
     * Called from ReviewsReactor$ReviewsLoaded's constructor with the list the screen displays.
     * The reactor replaces the whole list each time (initial load, pagination, filters), so the
     * latest non-empty list is what's on screen.
     */
    public static void onReviewsLoaded(final List<?> reviews) {
        try {
            if (reviews == null || reviews.isEmpty()) return; // Ignore the "clear" that precedes a load.
            final ReviewScanner.Result result = ReviewScanner.scan(reviews);
            latest = result;
            MAIN.post(() -> {
                Activity a = current.get();
                if (a != null && !a.isFinishing()) addOrUpdateBanner(a);
            });
        } catch (Throwable t) {
            Log.w(TAG, "onReviewsLoaded", t);
        }
    }

    private static void listen(final Activity activity) {
        Application.ActivityLifecycleCallbacks callbacks = new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity a, Bundle b) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityResumed(Activity a) {
                if (a == activity) {
                    current = new WeakReference<>(activity);
                    try {
                        addOrUpdateBanner(activity);
                    } catch (Throwable t) {
                        Log.w(TAG, "addBanner", t);
                    }
                }
            }

            @Override
            public void onActivityPaused(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
                if (a == activity && current.get() == activity) {
                    current = new WeakReference<>(null);
                }
            }
        };
        if (Build.VERSION.SDK_INT >= 29) {
            activity.registerActivityLifecycleCallbacks(callbacks);
        } else {
            MAIN.post(() -> {
                Application app = activity.getApplication();
                if (app != null) app.registerActivityLifecycleCallbacks(callbacks);
            });
        }
    }

    private static void addOrUpdateBanner(final Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;
        TextView banner = content.findViewWithTag(BANNER_TAG);
        if (banner == null) {
            banner = buildBanner(activity);
            // At the bottom of the banner column, right above the booking button.
            ReviewsScreen.add(activity, banner, false);
        }
        style(activity, banner, latest);
    }

    private static TextView buildBanner(final Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView banner = new TextView(activity);
        banner.setTag(BANNER_TAG);
        banner.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        banner.setTypeface(Typeface.DEFAULT_BOLD);
        int padH = Math.round(14 * density), padV = Math.round(10 * density);
        banner.setPadding(padH, padV, padH, padV);
        banner.setElevation(6 * density);
        return banner;
    }

    private static void style(final Activity activity, TextView banner, final ReviewScanner.Result result) {
        Panel.Colors colors = Panel.Colors.of(activity);
        float density = activity.getResources().getDisplayMetrics().density;
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(10 * density);

        if (result == null) {
            banner.setText(Strings.REVIEW_CHECKING);
            banner.setTextColor(colors.secondaryText);
            bg.setColor(colors.surface);
            bg.setStroke(Math.round(density), colors.divider);
            banner.setBackground(bg);
            banner.setOnClickListener(null);
            banner.setClickable(false);
            banner.setContentDescription(banner.getText());
            return;
        }

        int flagged = result.flaggedCount();
        if (flagged == 0) {
            banner.setText(result.scanned > 0
                    ? String.format(Locale.getDefault(), Strings.REVIEW_NONE, result.scanned)
                    : Strings.REVIEW_NONE_FEW);
            banner.setTextColor(colors.good);
            bg.setColor(colors.surface);
            bg.setStroke(Math.round(density), colors.good);
            banner.setBackground(bg);
            banner.setOnClickListener(null);
            banner.setClickable(false);
        } else if (result.tier1Count > 0) {
            // A hard scam case: lead with it in stronger, filled-red wording.
            banner.setText(result.tier1Count == 1
                    ? Strings.REVIEW_TIER1_ONE
                    : String.format(Locale.getDefault(), Strings.REVIEW_TIER1_MANY, result.tier1Count));
            boolean dark = colors.background != 0xFFFFFFFF;
            bg.setColor(dark ? 0xFF7A1C1C : 0xFFC30011);
            banner.setTextColor(dark ? 0xFFFFE2E2 : 0xFFFFFFFF);
            banner.setBackground(bg);
            banner.setOnClickListener(v -> openDialog(activity, result));
        } else {
            banner.setText(flagged == 1
                    ? String.format(Locale.getDefault(), Strings.REVIEW_FLAGGED_ONE, result.scanned)
                    : String.format(Locale.getDefault(), Strings.REVIEW_FLAGGED_MANY, flagged, result.scanned));
            banner.setTextColor(colors.bad);
            bg.setColor(colors.surface);
            bg.setStroke(Math.round(2 * density), colors.bad);
            banner.setBackground(bg);
            banner.setOnClickListener(v -> openDialog(activity, result));
        }
        banner.setContentDescription(banner.getText());
    }

    // ---------------------------------------------------------------------------------------
    // The dialog that lists the flagged reviews.

    private static void openDialog(Activity activity, ReviewScanner.Result result) {
        try {
            Panel.Colors colors = Panel.Colors.of(activity);
            float density = activity.getResources().getDisplayMetrics().density;

            Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Light_NoActionBar);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(colors.background);
            root.setOnApplyWindowInsetsListener((v, insets) -> {
                if (Build.VERSION.SDK_INT >= 30) {
                    android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                    v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
                } else {
                    v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                            insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
                }
                return insets;
            });

            // Header: title + close.
            LinearLayout header = new LinearLayout(activity);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);
            header.setPadding(dp(density, 16), dp(density, 8), dp(density, 4), dp(density, 8));
            header.addView(text(activity, Strings.REVIEW_DIALOG_TITLE, 18, colors.text, true),
                    new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            TextView close = text(activity, "✕", 20, colors.text, false);
            close.setGravity(Gravity.CENTER);
            close.setContentDescription(Strings.REVIEW_CLOSE);
            close.setOnClickListener(v -> dialog.dismiss());
            header.addView(close, new LinearLayout.LayoutParams(dp(density, 48), dp(density, 48)));
            root.addView(header);

            ScrollView scroll = new ScrollView(activity);
            LinearLayout body = new LinearLayout(activity);
            body.setOrientation(LinearLayout.VERTICAL);
            body.setPadding(dp(density, 16), 0, dp(density, 16), dp(density, 16));

            TextView subtitle = text(activity, Strings.REVIEW_DIALOG_SUBTITLE, 13, colors.secondaryText, false);
            body.addView(subtitle);

            for (ReviewScanner.Flag flag : result.flags) {
                body.addView(card(activity, colors, density, flag));
            }

            TextView note = text(activity, Strings.REVIEW_DIALOG_NOTE, 12, colors.secondaryText, false);
            LinearLayout.LayoutParams noteLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            noteLp.topMargin = dp(density, 12);
            note.setLayoutParams(noteLp);
            body.addView(note);

            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));

            dialog.setContentView(root);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                window.setBackgroundDrawable(new ColorDrawable(colors.background));
                if (Build.VERSION.SDK_INT >= 30) window.setDecorFitsSystemWindows(false);
                window.setStatusBarColor(Color.TRANSPARENT);
                window.setNavigationBarColor(Color.TRANSPARENT);
            }
            dialog.show();
        } catch (Throwable t) {
            Log.e(TAG, "Couldn't open the review list", t);
        }
    }

    private static View card(Activity activity, Panel.Colors colors, float density, ReviewScanner.Flag flag) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(density, 12), dp(density, 12), dp(density, 12), dp(density, 12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(colors.surface);
        bg.setCornerRadius(8 * density);
        // Tier-1 (hard scam) cards get a red border so they stand out above the milder ones.
        if (flag.tier1) bg.setStroke(Math.round(2 * density), colors.bad);
        box.setBackground(bg);

        box.addView(text(activity, flag.labels, 13, colors.bad, true));
        TextView snippet = text(activity, "“" + flag.snippet + "”", 14, colors.text, false);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sLp.topMargin = dp(density, 6);
        snippet.setLayoutParams(sLp);
        box.addView(snippet);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(density, 12);
        box.setLayoutParams(lp);
        return box;
    }

    private static TextView text(Activity activity, String s, int sp, int color, boolean bold) {
        TextView t = new TextView(activity);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        t.setTextColor(color);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    private static int dp(float density, float v) {
        return Math.round(v * density);
    }
}
