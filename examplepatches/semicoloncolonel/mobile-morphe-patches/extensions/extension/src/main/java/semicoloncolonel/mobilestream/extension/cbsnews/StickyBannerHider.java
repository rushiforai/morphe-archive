package semicoloncolonel.mobilestream.extension.cbsnews;

import android.view.View;
import android.view.ViewParent;

/**
 * Hides CBS News's sticky banner and the space around it. The banner view
 * sits in a fixed-height box inside sticky_banner_layout, which also holds a
 * divider line, so hiding the banner alone leaves an empty band above the
 * bottom navigation. The whole layout is hidden instead.
 */
@SuppressWarnings("unused")
public final class StickyBannerHider {
    private StickyBannerHider() {
    }

    /** Injection point: StickyBannerAds.startAdRequest, with its banner view. */
    public static void hide(View banner) {
        if (banner == null) return;
        banner.setVisibility(View.GONE);
        int layoutId = banner.getResources().getIdentifier(
                "sticky_banner_layout", "id", banner.getContext().getPackageName());
        View view = banner;
        ViewParent parent = banner.getParent();
        // Climb to the banner's layout; if it is not found, hide the nearest box.
        while (parent instanceof View) {
            view = (View) parent;
            if (layoutId != 0 && view.getId() == layoutId) {
                view.setVisibility(View.GONE);
                return;
            }
            parent = view.getParent();
        }
        if (banner.getParent() instanceof View) ((View) banner.getParent()).setVisibility(View.GONE);
    }
}
