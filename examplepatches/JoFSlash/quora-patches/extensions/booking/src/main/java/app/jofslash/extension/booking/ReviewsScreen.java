package app.jofslash.extension.booking;

import android.app.Activity;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

/**
 * The column of small banners the patches put on the reviews screen (Review check, Recent
 * rating), on top of its Compose content, just above the sticky "See your options" button. They
 * sit at the bottom so they never cover the reviews heading; the list can be scrolled past them.
 */
final class ReviewsScreen {
    private ReviewsScreen() {
    }

    private static final String STACK_TAG = "jofslash_reviews_stack";
    /** Height of the reviews screen's sticky bottom button plus a small gap. */
    private static final int CTA_DP = 64;

    /** The column, added to the screen the first time; null before the screen has its content. */
    static LinearLayout stack(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return null;
        FrameLayout frame = (FrameLayout) content;
        LinearLayout stack = frame.findViewWithTag(STACK_TAG);
        if (stack != null) return stack;

        final float density = activity.getResources().getDisplayMetrics().density;
        stack = new LinearLayout(activity);
        stack.setTag(STACK_TAG);
        stack.setOrientation(LinearLayout.VERTICAL);
        // The banners' shadows reach outside them.
        stack.setClipChildren(false);
        stack.setClipToPadding(false);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        lp.leftMargin = Math.round(8 * density);
        lp.rightMargin = Math.round(8 * density);
        lp.bottomMargin = Math.round(CTA_DP * density); // Until insets arrive.
        stack.setOnApplyWindowInsetsListener((v, insets) -> {
            int bottom = Build.VERSION.SDK_INT >= 30
                    ? insets.getInsets(WindowInsets.Type.systemBars()).bottom
                    : insets.getSystemWindowInsetBottom();
            FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) v.getLayoutParams();
            int want = bottom + Math.round(CTA_DP * density);
            if (p.bottomMargin != want) {
                p.bottomMargin = want;
                v.setLayoutParams(p);
            }
            return insets;
        });
        frame.addView(stack, lp);
        stack.requestApplyInsets();
        return stack;
    }

    /** Adds [banner] to the column: on top when [top], else at the bottom. */
    static void add(Activity activity, View banner, boolean top) {
        LinearLayout stack = stack(activity);
        if (stack == null) return;
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = Math.round(6 * density);
        if (top) {
            stack.addView(banner, 0, lp);
        } else {
            stack.addView(banner, lp);
        }
    }
}
