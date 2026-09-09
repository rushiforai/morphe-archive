package app.vantage.extension.claude;

import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.TextView;

/**
 * Pins a small pill with the clone's number to the top-right corner of every
 * activity window, above all app content. It is not clickable or focusable, so
 * touches fall through to whatever is underneath, and it is ignored by
 * accessibility services.
 */
public final class CloneBadge implements Application.ActivityLifecycleCallbacks {
    private static final String TAG = "Vantage/CloneBadge";
    private static final Object VIEW_TAG = new Object();
    private static boolean installed;

    private CloneBadge() {}

    /** Called from Application.onCreate by the patch. */
    public static void init(Application app) {
        if (installed) return;
        installed = true;
        if (BuildValues.badgeLabel().isEmpty()) return;
        app.registerActivityLifecycleCallbacks(new CloneBadge());
    }

    @Override public void onActivityResumed(Activity a) { attach(a); }
    @Override public void onActivityCreated(Activity a, Bundle b) {}
    @Override public void onActivityStarted(Activity a) {}
    @Override public void onActivityPaused(Activity a) {}
    @Override public void onActivityStopped(Activity a) {}
    @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
    @Override public void onActivityDestroyed(Activity a) {}

    private static void attach(Activity a) {
        try {
            View decorView = a.getWindow().getDecorView();
            if (!(decorView instanceof ViewGroup)) return;
            ViewGroup decor = (ViewGroup) decorView;
            if (decor.findViewWithTag(VIEW_TAG) != null) return;

            TextView pill = new TextView(a);
            pill.setTag(VIEW_TAG);
            pill.setText(BuildValues.badgeLabel());
            pill.setTextColor(Color.WHITE);
            pill.setTypeface(Typeface.DEFAULT_BOLD);
            pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            pill.setGravity(Gravity.CENTER);
            pill.setIncludeFontPadding(false);
            int padH = dp(a, 8), padV = dp(a, 3);
            pill.setPadding(padH, padV, padH, padV);
            pill.setMinWidth(dp(a, 22));
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.RECTANGLE);
            bg.setCornerRadius(dp(a, 999));
            bg.setColor(0xD9202020);
            pill.setBackground(bg);
            pill.setAlpha(0.85f);
            pill.setElevation(dp(a, 64));
            pill.setClickable(false);
            pill.setFocusable(false);
            pill.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);

            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.END);
            lp.setMargins(0, dp(a, 6), dp(a, 10), 0);
            decor.addView(pill, lp);
            applyInsets(decor, pill);
            // Re-apply when the window is (re)laid out, e.g. rotation or the
            // status bar changing height. Cheap: only touches the margin.
            decor.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> applyInsets(decor, pill));
        } catch (Throwable t) {
            Log.w(TAG, "badge attach failed: " + t);
        }
    }

    private static void applyInsets(ViewGroup decor, TextView pill) {
        WindowInsets wi = decor.getRootWindowInsets();
        int top = wi == null ? 0 : wi.getInsets(WindowInsets.Type.statusBars()).top;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) pill.getLayoutParams();
        int want = top + dp(pill.getContext(), 6);
        if (lp.topMargin != want) {
            lp.topMargin = want;
            pill.setLayoutParams(lp);
        }
    }

    private static int dp(android.content.Context c, int v) {
        return Math.round(v * c.getResources().getDisplayMetrics().density);
    }
}
