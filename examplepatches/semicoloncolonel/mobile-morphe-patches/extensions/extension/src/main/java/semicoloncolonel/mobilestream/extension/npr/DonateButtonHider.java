package semicoloncolonel.mobilestream.extension.npr;

import android.view.View;

/** NPR — "Hide donate buttons". Hides the station page's Donate button. */
@SuppressWarnings("unused")
public final class DonateButtonHider {
    private DonateButtonHider() {
    }

    public static void hide(View button) {
        if (button != null) button.setVisibility(View.GONE);
    }
}
