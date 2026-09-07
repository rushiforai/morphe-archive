package app.aimal.extension.viki;

import android.app.Activity;
import android.view.View;

import app.aimal.extension.streaming.Logger;

/**
 * Gives the video the whole screen on tablets and unfolded foldables.
 *
 * Viki's player screen is one ConstraintLayout holding a horizontal chain: the
 * player at weight 0.65 and a fragment container called {@code rightPanel} at
 * weight 0.35. The app makes that panel visible whenever the smallest screen
 * dimension is over 600dp and the player is not already in full-screen mode -
 * which is exactly what an unfolded foldable reports - so opening the fold
 * turns a full-width player into a two-thirds one with a comments panel beside
 * it.
 *
 * Setting the panel to GONE is enough to get the space back: ConstraintLayout
 * drops GONE views from a chain, so the player's 0.65 weight becomes the whole
 * width, and the player container already measures itself to the full height
 * whenever the app thinks it is on a tablet.
 *
 * The floating timed-comment overlay is hidden at the same time. The app gates
 * it on a preference, but that gate does not survive a fold/unfold, so it can
 * reappear over the video after the layout is rebuilt.
 *
 * Both views are found by resource *name*, never by a hardcoded id. Numeric ids
 * are reassigned on almost every build; the names are stable, and a name that
 * no longer resolves just makes this a no-op.
 */
public final class SidePanel {
    /** The fragment container beside the player, at chain weight 0.35. */
    private static final String PANEL_ID_NAME = "rightPanel";

    /** The floating one-line timed comment drawn over the video. */
    private static final String TIMED_COMMENT_ID_NAME = "groupTimedComment";

    private SidePanel() {
    }

    /**
     * Called at the end of the activity's own panel-visibility pass, so this
     * always runs after the app has decided what to show - including on the
     * configuration change a fold or unfold triggers.
     *
     * Must not throw: it runs inside the activity's layout update.
     */
    public static void hide(Activity activity) {
        if (activity == null) return;

        hideById(activity, PANEL_ID_NAME);
        hideById(activity, TIMED_COMMENT_ID_NAME);
    }

    private static void hideById(Activity activity, String name) {
        try {
            int id = activity.getResources()
                    .getIdentifier(name, "id", activity.getPackageName());

            if (id == 0) {
                Logger.d("No id named " + name + " in this build");
                return;
            }

            View view = activity.findViewById(id);
            if (view == null || view.getVisibility() == View.GONE) return;

            view.setVisibility(View.GONE);
            Logger.i("Hid " + name + "; the player now has the full width");
        } catch (Throwable t) {
            Logger.e("Could not hide " + name, t);
        }
    }
}
