package app.jofslash.extension.booking;

import android.content.Intent;

import java.util.Iterator;
import java.util.List;

/**
 * Used by the Disable start-up promotions patch. On the first start (and, for some US users, on
 * later starts) the app puts its full-screen sign-in page between the splash screen and the home
 * screen. The start-up task returns the screens to open as a list of intents; this takes the
 * sign-in page out of that list, so the app goes straight on to the home screen. Sign in from
 * the app itself (My account, booking, saving) is a different intent and isn't touched.
 */
@SuppressWarnings("unused")
public final class StartupSignIn {
    /** Set by IdentityGuestApp.getStartIntent to the lower-case name of the LoginSource. */
    private static final String ORIGIN_EXTRA = "auth.flow.origin";
    /** LoginSource.ON_BOARDING, the source the start-up task uses and nothing else does. */
    private static final String ON_BOARDING = "on_boarding";

    private StartupSignIn() {
    }

    /** Removes the start-up sign-in page from the screens the app opens after the splash screen. */
    public static void removeSignIn(List<Intent> intents) {
        if (intents == null) return;
        try {
            Iterator<Intent> it = intents.iterator();
            while (it.hasNext()) {
                Intent intent = it.next();
                if (intent != null && ON_BOARDING.equals(intent.getStringExtra(ORIGIN_EXTRA))) {
                    it.remove();
                }
            }
        } catch (RuntimeException ignored) {
            // Leave the list as it is; the sign-in page shows as before.
        }
    }
}
