package app.morphe.extension.syncforreddit.ui.swipe;

import android.app.Activity;
import android.os.Build;

import app.morphe.extension.shared.Logger;

/**
 * Keeping the screen behind a post drawn while the post is being dragged off it.
 *
 * <p>Dragging a post sideways is meant to carry the feed in behind it. For that to happen the
 * activity has to tell the system it is translucent, so that the one underneath goes on being
 * drawn instead of being stopped. Sync asks for that by reaching for
 * {@code Activity.convertToTranslucent} through reflection, which is not part of the SDK; as the
 * platform tightened up on non-SDK interfaces the call stopped landing, and with nothing drawn
 * underneath the uncovered half of the screen is simply black. The app did not change — the
 * ground under it did.
 *
 * <p>There is a supported way to ask the same thing now: {@code Activity.setTranslucent}, public
 * since API 30, which the framework answers by doing exactly what the hidden call did. That is
 * used where it exists. Below it, nothing is claimed and Sync's own reflection runs as it always
 * did, which is where it still worked.
 *
 * @noinspection unused
 */
public final class SwipeBack {
    private SwipeBack() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called where Sync would reach for the hidden call to become translucent, which is the
     * moment a drag begins.
     *
     * @return Whether this has been dealt with and Sync's own attempt should not run.
     */
    public static boolean showWhatIsBehind(Activity activity) {
        return ask(activity, true);
    }

    /**
     * The same, where Sync turns the activity back into an ordinary opaque one: when the drag is
     * let go of without finishing, and when the activity goes.
     *
     * @return Whether this has been dealt with and Sync's own attempt should not run.
     */
    public static boolean stopShowingIt(Activity activity) {
        return ask(activity, false);
    }

    private static boolean ask(Activity activity, boolean translucent) {
        try {
            if (!isPatchIncluded() || activity == null
                    || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
                // Nothing claimed: Sync asks the way it always did.
                return false;
            }

            boolean answered = activity.setTranslucent(translucent);
            Logger.printInfo(() -> "swipe: setTranslucent(" + translucent + ") answered "
                    + answered);
            // Claimed whatever it answered. Turning translucency off answers false by design,
            // and asking twice over through the hidden call would only fail again.
            return true;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "swipe: could not set translucency: " + ex);
            return false;
        }
    }
}
