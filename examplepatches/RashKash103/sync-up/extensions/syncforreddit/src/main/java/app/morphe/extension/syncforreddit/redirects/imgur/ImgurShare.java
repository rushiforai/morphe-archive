package app.morphe.extension.syncforreddit.redirects.imgur;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

/**
 * The address that is handed out when something is shared or copied.
 *
 * <p>What the app fetches and what it gives you to pass on are two different things, and in a
 * region Imgur refuses they want to be different: the Imgur address works here, through a
 * route, and is a notice rather than a picture for whoever it is sent to. Sending the address
 * the route actually used gives them the same picture.
 *
 * <p><b>Only what the route can really answer.</b> DuckDuckGo's proxy serves one picture and
 * nothing else, so with it alone an album is shared as the Imgur address it has always been —
 * handing somebody a DuckDuckGo address for an album would be handing them a broken picture.
 * Each route has its own switch and each is off until it is asked for, since what you send
 * someone else is a decision rather than a default.
 *
 * <p>The proxy has no switch here and cannot have one: a proxy carries the request rather than
 * changing the address, so there is no other address to give out.
 */
public final class ImgurShare {
    private ImgurShare() {}

    /** @return Whether the patch was applied at all. Overridden by the patch. */
    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called wherever the app is about to share or copy a piece of text.
     *
     * @return What to share instead, or what it was handed where there is nothing to change.
     *         Only ever changes a string that is wholly an Imgur address: a comment, a title or
     *         a post's text passes through untouched, whatever it happens to mention.
     */
    public static String insteadOf(String shared) {
        try {
            if (shared == null || !isPatchIncluded() || !RedirectSettings.redirecting()) {
                return shared;
            }
            String instead = ImgurRoutes.handedOut(
                    shared,
                    RedirectSettings.usingDuckDuckGo()
                            && RedirectSettings.sharingThroughDuckDuckGo(),
                    RedirectSettings.usingRimgo() && RedirectSettings.sharingThroughRimgo(),
                    // Whichever instance is already in use, asked for without asking it
                    // anything: this runs on the thread that drew the menu, and a health check
                    // there would be a network call on the main thread, which Android answers
                    // by taking the app down.
                    RedirectSettings.sharingThroughRimgo()
                            ? RimgoInstances.inUseWithoutAsking() : null);
            if (instead == null) {
                return shared;
            }
            Logger.printDebug(() -> "share: handing out " + instead);
            return instead;
        } catch (Exception ex) {
            // Sharing must work whatever this makes of the address.
            Logger.printInfo(() -> "share: could not be rewritten: " + ex);
            return shared;
        }
    }

    /** The same, for the places the app holds its text as a {@link CharSequence}. */
    public static CharSequence insteadOf(CharSequence shared) {
        if (shared == null) {
            return null;
        }
        return insteadOf(shared.toString());
    }

}
