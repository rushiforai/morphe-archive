package semicoloncolonel.mobilestream.extension.cnbc;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * CNBC "Skip ads": takes the place of Google's BaseAdView.loadAd. The banner
 * is not requested, and the ad view is hidden with every container around
 * it that holds nothing else, up to its row in the list, so no empty space
 * is left. {@link #collapseWhenAttached} does the same for the feed's ad rows
 * (SectionAd) as soon as each one is created.
 */
@SuppressWarnings("unused")
public final class AdHider {
    private AdHider() {
    }

    /** Hides an ad row now, and folds away its empty containers once it is in the feed. */
    public static void collapseWhenAttached(View adRow) {
        collapse(adRow);
        adRow.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
                hide(view);
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
            }
        });
    }

    public static void hide(View adView) {
        collapse(adView);
        ViewParent parent = adView.getParent();
        while (parent instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) parent;
            // Stop at a list: the row itself was collapsed on the step before.
            if (isList(group) || hasVisibleChild(group)) return;
            collapse(group);
            parent = group.getParent();
        }
    }

    private static boolean isList(ViewGroup group) {
        for (Class<?> c = group.getClass(); c != null; c = c.getSuperclass()) {
            String name = c.getName();
            if (name.endsWith(".RecyclerView") || name.equals("android.widget.AbsListView")
                    || name.endsWith(".ViewPager") || name.endsWith(".ViewPager2")) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasVisibleChild(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            if (group.getChildAt(i).getVisibility() != View.GONE) return true;
        }
        return false;
    }

    private static void collapse(View view) {
        view.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) {
            params.height = 0;
            if (params instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) params).setMargins(0, 0, 0, 0);
            }
            view.setLayoutParams(params);
        }
    }
}
