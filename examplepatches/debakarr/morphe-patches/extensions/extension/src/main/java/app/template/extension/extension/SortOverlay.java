package app.template.extension.extension;

import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.util.Map;

/**
 * Two floating buttons ("Sort: Most rated", "Hide ads") drawn over the app's
 * current screen, like the ones the Amazon patch adds to the web page.
 *
 * <p>They only show while a product listing has recently loaded, so product
 * pages, the cart, etc. stay clean. Flipping a toggle changes how every page
 * that loads afterwards is rewritten (see {@link SortState}); results already
 * on screen keep their order.
 */
final class SortOverlay {

    private SortOverlay() {}

    private static final String TAG_VIEW = "morphe-sort-overlay";
    private static final int GREEN = 0xFF067D62;
    private static final int DARK = 0xFF232F3E;

    private static boolean sInstalled;
    private static Handler sMain;

    /** The current Application via the hidden ActivityThread accessor; null if unavailable. */
    static Application app() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Registers the lifecycle hook once; safe to call from any thread. */
    static synchronized void install() {
        if (sInstalled) return;
        Application application = app();
        if (application == null) return;
        sInstalled = true;
        sMain = new Handler(Looper.getMainLooper());
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityResumed(Activity activity) { attach(activity); }
            @Override public void onActivityCreated(Activity a, Bundle b) {}
            @Override public void onActivityStarted(Activity a) {}
            @Override public void onActivityPaused(Activity a) {}
            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            @Override public void onActivityDestroyed(Activity a) {}
        });
        // The listing that triggered us is already on screen: attach to it too.
        sMain.post(new Runnable() {
            @Override public void run() { attachToResumed(); }
        });
    }

    private static void attachToResumed() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            Object thread = at.getMethod("currentActivityThread").invoke(null);
            Field f = at.getDeclaredField("mActivities");
            f.setAccessible(true);
            Map<?, ?> records = (Map<?, ?>) f.get(thread);
            for (Object rec : records.values()) {
                Field paused = rec.getClass().getDeclaredField("paused");
                Field activity = rec.getClass().getDeclaredField("activity");
                paused.setAccessible(true);
                activity.setAccessible(true);
                if (!paused.getBoolean(rec)) attach((Activity) activity.get(rec));
            }
        } catch (Throwable t) {
            SortByRatingsHelper.log("overlay: could not find resumed activity: " + t);
        }
    }

    private static void attach(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof ViewGroup)) return;
        ViewGroup root = (ViewGroup) content;
        if (root.findViewWithTag(TAG_VIEW) != null) return;

        final LinearLayout box = new LinearLayout(activity);
        box.setTag(TAG_VIEW);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.END);

        final TextView sort = button(activity);
        final TextView ads = button(activity);
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gap.topMargin = dp(activity, 8);
        box.addView(ads);
        box.addView(sort, gap);

        final Runnable refresh = new Runnable() {
            @Override public void run() {
                if (!box.isAttachedToWindow()) return;
                boolean show = SortState.listingRecent();
                box.setVisibility(show ? View.VISIBLE : View.GONE);
                paint(sort, SortState.sortOn(), "Sort: Most rated", "Most rated ✓");
                paint(ads, SortState.hideAds(), "Hide ads", "Ads hidden ✓");
                box.postDelayed(this, 1500);
            }
        };

        sort.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                boolean on = !SortState.sortOn();
                SortState.setSort(on);
                toast(activity, on ? "Most rated: new results will load sorted"
                                   : "Most rated: off");
                refresh.run();
            }
        });
        ads.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                boolean on = !SortState.hideAds();
                SortState.setAds(on);
                toast(activity, on ? "Ads: new results will load without ads"
                                   : "Ads: shown again");
                refresh.run();
            }
        });

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.END | Gravity.BOTTOM);
        lp.rightMargin = dp(activity, 12);
        lp.bottomMargin = dp(activity, 96);
        root.addView(box, lp);
        box.setElevation(dp(activity, 8));
        box.post(refresh);
    }

    private static TextView button(Activity activity) {
        TextView t = new TextView(activity);
        t.setTextColor(Color.WHITE);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        t.setTypeface(t.getTypeface(), android.graphics.Typeface.BOLD);
        int h = dp(activity, 14), v = dp(activity, 10);
        t.setPadding(h, v, h, v);
        t.setClickable(true);
        return t;
    }

    private static void paint(TextView t, boolean on, String off, String onLabel) {
        t.setText(on ? onLabel : off);
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(1000f);
        bg.setColor(on ? GREEN : DARK);
        t.setBackground(bg);
    }

    private static void toast(Activity activity, String msg) {
        try {
            Toast.makeText(activity, msg, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // cosmetic
        }
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
            activity.getResources().getDisplayMetrics()));
    }
}
