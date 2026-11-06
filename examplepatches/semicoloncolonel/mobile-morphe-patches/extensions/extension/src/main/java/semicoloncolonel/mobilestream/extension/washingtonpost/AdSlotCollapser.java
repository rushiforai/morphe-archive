package semicoloncolonel.mobilestream.extension.washingtonpost;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Collapses The Washington Post's ad slots.
 *
 * Every ad slot is an ad_layout: a grey LinearLayout with an "Advertisement"
 * label above a BannerAdView. With the ad request skipped, the slot would
 * stay on screen, empty but labeled. When a BannerAdView is attached, its slot
 * (the parent that holds the label) is hidden and given no height, so a list
 * leaves no gap where it was. The ad view itself is hidden too.
 */
@SuppressWarnings("unused")
public final class AdSlotCollapser {
    private AdSlotCollapser() {
    }

    /** Injection point: the end of each BannerAdView constructor. */
    public static void track(View adView) {
        if (adView == null) return;
        collapse(adView);
        adView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
                collapse(view);
                ViewParent parent = view.getParent();
                // Only the ad's own slot: a small container around the label and the ad.
                if (parent instanceof ViewGroup && ((ViewGroup) parent).getChildCount() <= 3) {
                    collapse((View) parent);
                }
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
            }
        });
    }

    private static void collapse(View view) {
        try {
            view.setVisibility(View.GONE);
            ViewGroup.LayoutParams params = view.getLayoutParams();
            if (params != null) {
                params.height = 0;
                if (params instanceof ViewGroup.MarginLayoutParams) {
                    ((ViewGroup.MarginLayoutParams) params).setMargins(0, 0, 0, 0);
                }
                view.setLayoutParams(params);
            }
        } catch (Throwable ignored) {
        }
    }
}
