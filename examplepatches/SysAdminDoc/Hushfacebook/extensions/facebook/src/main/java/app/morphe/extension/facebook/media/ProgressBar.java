/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Keeps the progress bar of a video on screen. Two players hide theirs a few seconds in.
 *
 * <p>The Reels viewer's bar on 581 is the unified video scrubber (VDDScrubberPlugin). It has an
 * active look and a passive one, a thin line, and the patch asks {@link #keepsReelBar} first in the
 * passive one: a yes runs the active look instead, then {@link #hideTimeLabel} hides the elapsed
 * and total time the active look shows, so it appears only while you drag, as stock. Older builds' viewer used a bottom bar
 * (FbShortsViewerBottomSeekBarPlugin), which has two sizes. Facebook
 * makes it full size, with the thumb showing and the bar taking drags, when it shows a reel's
 * controls or while you scrub, and shrinks it to a line 2 dp high with the thumb hidden and drags
 * turned off when the controls go away or the reel plays on. The patch asks {@link #keepsReelBar}
 * first in the method that shrinks it, and a yes makes it full size instead, so the bar can be
 * read and dragged at any time. The time labels stay Facebook's: they show while you scrub.
 *
 * <p>A full-screen video's controls (the plugins built on the controls class
 * FeedFullscreenVideoControlsPlugin extends) set a timer to fade out each time they show or you
 * touch them. The patch asks {@link #keepsControls} first in the method that sets that timer, and
 * a yes sets none, so the controls and their progress bar stay until you tap the video, which
 * hides them as before. The newer Litho player hides its controls from its video controls
 * extension, 3 seconds after they show or are touched, and the player that Enter fullscreen
 * landscape mode opens runs on the Reels controls component, whose controller posts a runnable that
 * hides them about 3 seconds after a tap. The patch asks {@link #keepsControls} first in that
 * extension's timer and in that runnable, and a yes hides nothing. A tap still hides them.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, both answer no and
 * Facebook carries on with its own code.
 */
public final class ProgressBar {
    /** Counted under the patch's name each time the reel's bar is kept full size. */
    static final String REEL_BAR_KEPT = "Reel progress bar kept";
    /** Counted each time a full-screen video's fade timer isn't set. */
    static final String CONTROLS_KEPT = "Video controls kept";

    /** Counted each time the time label is hidden after the active look. */
    static final String TIME_LABEL_HIDDEN = "Reel time label hidden";

    private static final String FAMILY = FamilyNames.PROGRESS_BAR;

    private ProgressBar() {
    }

    /**
     * The hook, first thing in the Reels viewer's method that shrinks its progress bar. True makes
     * the bar full size instead; false lets Facebook shrink it.
     */
    public static boolean keepsReelBar() {
        return keeps("reel progress bar", REEL_BAR_KEPT);
    }

    /**
     * The hook, first thing in the methods that set a full-screen video's fade timer, in the older
     * player and the newer one, and in the landscape player's hide runnable. True sets no timer or
     * runs no hide, so the controls stay; false lets Facebook's code run.
     */
    public static boolean keepsControls() {
        return keeps("video controls", CONTROLS_KEPT);
    }

    /**
     * The hook, right after the active look runs in place of the passive one. The active look shows
     * the scrubber's time label and only a drag updates it, so this hides it the way the passive
     * look does (invisible, not gone, which keeps the layout). A drag shows it again.
     */
    public static void hideTimeLabel(ViewGroup label) {
        try {
            if (label != null && label.getVisibility() != View.INVISIBLE) {
                label.setVisibility(View.INVISIBLE);
                HookStatus.counted(FAMILY, TIME_LABEL_HIDDEN);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel time label", failure);
        }
    }

    private static boolean keeps(String hook, String counted) {
        try {
            HookStatus.invoked(FAMILY);
            if (!Utils.settingsReady() || !Settings.KEEP_PROGRESS_BAR.get()) return false;
            HookStatus.bound(FAMILY, hook);
            HookStatus.counted(FAMILY, counted);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, hook, failure);
            return false;
        }
    }
}
