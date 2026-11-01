package app.fakh.extension.kompas;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Hides the ad slots. Every Ad Manager banner sits in a wrapper the app builds around it (the "Iklan" label above,
 * the "Gabung Kompas.com+" note below), and that wrapper is the only child of a list row or a slot in a screen. Both
 * are collapsed once the banner is attached, instead of leaving a grey block or an empty gap.
 */
@SuppressWarnings("unused")
public final class HideAds {
    private static final String RECYCLER_VIEW = "androidx.recyclerview.widget.RecyclerView";

    private HideAds() {
    }

    /** Called from every AdManagerAdView constructor: hides the banner and, once attached, its wrapper and slot. */
    public static void hideBanner(View adView) {
        adView.setVisibility(View.GONE);
        whenAttached(adView, new Runnable() {
            @Override
            public void run() {
                ViewParent parent = adView.getParent();
                if (!(parent instanceof View)) return;
                View view = (View) parent;
                collapse(view);
                // Walk up while the ancestor holds nothing but the ad, stopping at a list or a scroll view.
                while (view.getParent() instanceof ViewGroup) {
                    ViewGroup ancestor = (ViewGroup) view.getParent();
                    if (ancestor.getChildCount() != 1 || isContainer(ancestor)) break;
                    collapse(ancestor);
                    view = ancestor;
                }
            }
        });
    }

    /** Called from an ad row's bind instead of requesting the ad: collapses the list row that holds [view]. */
    public static void hideRow(View view) {
        whenAttached(view, new Runnable() {
            @Override
            public void run() {
                View row = view;
                while (row.getParent() instanceof View && !isRecyclerView(row.getParent().getClass())) {
                    row = (View) row.getParent();
                }
                if (row.getParent() != null) collapse(row);
            }
        });
    }

    /**
     * Runs [action] each time [view] is attached, and once more after the current frame: a row's bind sets its
     * margins right after adding the banner, so a collapse done during the add would be undone.
     */
    private static void whenAttached(View view, Runnable action) {
        view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                action.run();
                v.post(action);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
            }
        });
        if (view.isAttachedToWindow()) {
            action.run();
            view.post(action);
        }
    }

    /** Whether [group] is a list or a scroll view, which holds more than the ad even when it has one child. */
    private static boolean isContainer(ViewGroup group) {
        return group.getId() == android.R.id.content
                || isRecyclerView(group.getClass())
                || group.getClass().getName().endsWith("ScrollView");
    }

    /** Whether [type] is RecyclerView or a subclass of it; the app keeps the class name. */
    private static boolean isRecyclerView(Class<?> type) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            if (RECYCLER_VIEW.equals(c.getName())) return true;
        }
        return false;
    }

    /** Gives [view] no size and no margins; a RecyclerView row keeps its space when only made GONE. */
    private static void collapse(View view) {
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params == null) return;
        boolean margins = params instanceof ViewGroup.MarginLayoutParams;
        ViewGroup.MarginLayoutParams marginParams = margins ? (ViewGroup.MarginLayoutParams) params : null;
        if (params.height == 0 && (!margins || marginParams.topMargin == 0 && marginParams.bottomMargin == 0)) return;
        params.height = 0;
        if (margins) marginParams.setMargins(0, 0, 0, 0);
        view.setLayoutParams(params);
    }
}
