package app.jofslash.extension.booking;

import android.app.Activity;

/** Used by the Compare prices patch. */
@SuppressWarnings("unused")
public final class ComparePrices {
    private ComparePrices() {
    }

    /** Called from the property page's constructor. */
    public static void onPropertyPage(Activity activity) {
        PropertyPageButton.attach(activity, true, false, false);
    }
}
