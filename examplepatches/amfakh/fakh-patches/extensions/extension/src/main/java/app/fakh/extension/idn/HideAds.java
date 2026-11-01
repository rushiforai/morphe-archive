package app.fakh.extension.idn;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

/**
 * Stands in for every Ad Manager banner load. Every banner sits alone in a FrameLayout made for it (a list row or a
 * slot in a screen), so that frame is collapsed as soon as the banner is attached, instead of leaving an empty gap.
 */
@SuppressWarnings("unused")
public final class HideAds {
    private HideAds() {
    }

    /** Called instead of AdManagerAdView's load: hides the banner and, once attached, the frame that holds it. */
    public static void hide(View adView) {
        adView.setVisibility(View.GONE);
        adView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                collapseParent(v);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
            }
        });
        if (adView.isAttachedToWindow()) collapseParent(adView);
    }

    /** Gives the banner's parent no size and no margins; a RecyclerView row keeps its space when only made GONE. */
    private static void collapseParent(View adView) {
        ViewParent parent = adView.getParent();
        if (!(parent instanceof View)) return;
        View frame = (View) parent;
        frame.setVisibility(View.GONE);
        ViewGroup.LayoutParams params = frame.getLayoutParams();
        if (params == null) return;
        params.height = 0;
        if (params instanceof ViewGroup.MarginLayoutParams) {
            ((ViewGroup.MarginLayoutParams) params).setMargins(0, 0, 0, 0);
        }
        frame.setLayoutParams(params);
    }
}
