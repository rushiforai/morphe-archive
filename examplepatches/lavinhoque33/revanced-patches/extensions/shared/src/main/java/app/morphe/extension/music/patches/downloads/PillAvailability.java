/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Supplier;

import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;

/**
 * Keeps the Song/Video pill available for a video that has a video copy.
 *
 * <p>The app decides whether the pill is lit from the state of the player and of the queue item. While online the
 * decision is lit for a video the stream swap plays from a copy. Offline the stored answer reached the player but the
 * pill stayed dim, and a press showed "Video not available" instead of changing the display. The copy is the video:
 * whatever the app's gate says, the pill is lit for it and a press toggles the display as it does online. Four
 * places, all asked the same question, "does the video being played have a committed copy":
 * <ul>
 *   <li>the methods that compute the pill's state ({@link #onPillState}): a dim pill is lit before the app compares
 *   its state with the one shown, so the app does not stop before it sets the look;
 *   <li>the method that sets the pill's look ({@link #onPillLook}): a dim look becomes a lit one;
 *   <li>the click listener ({@link #lightForClick}): a press on a dim pill lights it before the app's own check;
 *   <li>the toggle's gate ({@link #onToggleGate}): a closed gate opens, so the press changes the display mode.
 * </ul>
 * Every entry is logged when its answer changes, so a device log says which of the app's checks was false.
 */
@SuppressWarnings("unused")
public final class PillAvailability {
    /** The toggle's view, by the two methods the patch adds to it. */
    public interface Gate {
        /** Lights the pill, as the app's own look method does: the click listener lets a press through. */
        void rvxBright();

        /** Whether the app has the pill lit now. */
        boolean rvxShown();
    }

    private static final Map<String, String> lastLogOfKind = new ConcurrentHashMap<>();

    private PillAvailability() {}

    /**
     * Injection point: the start of each method that computes the state of the pill, which runs when the playback,
     * the queue item or the session changes. The app's state method returns without setting the look when the state
     * it computed is the one the pill already shows (a dim pill stays dim and its look method is not reached), so a
     * pill that is dim for a video with a copy is lit here, before the app compares: its computed state then
     * differs from the lit one, the app sets the look, and the look hook keeps it lit.
     */
    public static void onPillState(@Nullable Object view) {
        try {
            String copy = copyVideo();
            if (copy == null || !(view instanceof Gate gate)) return;

            boolean shown = gate.rvxShown();
            if (!shown) gate.rvxBright();
            logChange("state", () -> "PillAvailability: state computed v=" + VideoInformation.getVideoId()
                    + " response=" + VideoInformation.getPlayerResponseVideoId() + " copy=" + copy
                    + " shownBefore=" + shown);
        } catch (Exception ex) {
            Logger.printException(() -> "PillAvailability: pill state failure", ex);
        }
    }

    /**
     * Injection point: the start of the method that sets the pill's look.
     *
     * @param requested The look the app asks for, true when lit.
     * @return The look to apply: lit when the app asks for it, or when the video has a copy.
     */
    public static boolean onPillLook(@Nullable Object view, boolean requested) {
        try {
            String copy = copyVideo();
            boolean look = PillAvailabilityLogic.opens(requested, copy != null);
            logChange("look", () -> "PillAvailability: look requested=" + requested + " applied=" + look + " copy="
                    + (copy == null ? "none" : copy) + (look && !requested ? " (forced)" : ""));
            return look;
        } catch (Exception ex) {
            Logger.printException(() -> "PillAvailability: pill look failure", ex);
            return requested;
        }
    }

    /**
     * Called by the click hook of {@link QueueItems} before the app's own check: a dim pill of a video with a copy is
     * lit, so the app's listener goes on to its toggle.
     *
     * @return True if the pill was dim and has been lit.
     */
    static boolean lightForClick(@Nullable Object view) {
        try {
            if (!(view instanceof Gate gate)) return false;

            boolean shown = gate.rvxShown();
            String copy = copyVideo();
            logChange("click", () -> "PillAvailability: click shown=" + shown + " copy="
                    + (copy == null ? "none" : copy));
            if (shown || copy == null) return false;

            gate.rvxBright();
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "PillAvailability: pill click failure", ex);
            return false;
        }
    }

    /**
     * Injection point: the return of the toggle's gate, the check the toggle's press makes before it changes the
     * display mode.
     *
     * @param open The app's answer.
     * @return True when the app's answer is true, or when the video has a copy.
     */
    public static boolean onToggleGate(boolean open) {
        try {
            String copy = copyVideo();
            boolean result = PillAvailabilityLogic.opens(open, copy != null);
            logChange("gate", () -> "PillAvailability: toggle gate app=" + open + " applied=" + result + " copy="
                    + (copy == null ? "none" : copy) + (result && !open ? " (forced)" : ""));
            return result;
        } catch (Exception ex) {
            Logger.printException(() -> "PillAvailability: toggle gate failure", ex);
            return open;
        }
    }

    /** The id of the video being played, or of the last player response, that has a committed copy; else null. */
    @Nullable
    private static String copyVideo() {
        if (!StreamSwap.supported()) return null;

        return PillAvailabilityLogic.videoWithCopy(VideoInformation.getVideoId(),
                VideoInformation.getPlayerResponseVideoId(), VideoCopyStore::hasNow);
    }

    /** Logs a line unless the previous one of its kind said the same: states change rarely, calls come in bursts. */
    private static void logChange(String kind, Supplier<String> line) {
        String text = line.get();
        if (text.equals(lastLogOfKind.put(kind, text))) return;

        Logger.printDebug(() -> text);
    }
}
