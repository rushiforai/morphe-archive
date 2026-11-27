package local.privacy;

import android.view.View;

/** Hide an ad-only container even when the app later toggles its visibility. */
public final class AdSpace {
    private AdSpace() { }

    public static void keepGone(View view, int requestedVisibility) {
        view.setVisibility(View.GONE);
    }
}
