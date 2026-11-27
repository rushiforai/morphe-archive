/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.Context;

import androidx.annotation.Nullable;

import com.google.common.util.concurrent.ListenableFuture;

import java.util.Map;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Stable entry points called by injected Music code. These hand off to {@link OfflineReplay} and allow stock
 * behavior if a hook fails to verify or link. A failure in the shared replay path disables it for the process;
 * a failure starting an optional local detail load leaves playback hooks in place.
 */
@SuppressWarnings("unused")
public final class OfflineReplayHooks {
    private static volatile boolean broken;

    private OfflineReplayHooks() {}

    /** Enabled by the patch only after every hook of the version is in place. */
    public static boolean supported() {
        return false;
    }

    /** Enabled only on versions where the initial native detail dispatch is bridged. */
    public static boolean localDetailSupported() {
        return false;
    }

    /** Enabled only where both native playlist detail and the native queue shuffle commit hook are bridged. */
    public static boolean localPlaylistShuffleSupported() {
        return false;
    }

    /** Non-consuming identity check by the one-shot native queue apply bridge. */
    public static boolean ownsLocalPlaylistShuffleReply(Object response) {
        try {
            return OfflineReplay.ownsLocalPlaylistShuffleReply(response);
        } catch (Exception | LinkageError failure) {
            Logger.printException(() -> "OfflineReplay: could not verify the shuffled queue ownership", failure);
            return false;
        }
    }

    /** Called after the exact marked reply has actually committed native local shuffle. */
    public static void localPlaylistShuffleApplied(Object queue, Object exactMarkedReply) {
        try {
            OfflineReplay.localPlaylistShuffleApplied(queue, exactMarkedReply);
        } catch (Exception | LinkageError failure) {
            Logger.printException(() -> "OfflineReplay: could not bind the native shuffled queue", failure);
        }
    }

    /** Negative drops a stale edited response; zero is the stock row path; positive merges only metadata. */
    public static int retainQueueRows(Object queue, @Nullable Object continuation, int nativeCursor) {
        if (continuation instanceof OfflineQueueActions.Continuation edited) {
            try {
                return edited.cursor() == nativeCursor && OfflineQueueActions.retains(queue, edited) ? 1 : -1;
            } catch (Exception | LinkageError failure) {
                Logger.printException(() -> "OfflineReplay: could not verify the edited queue continuation", failure);
                return -1;
            }
        }

        try {
            return nativeCursor >= 0 && OfflineReplay.retainLocalPlaylistShuffle(queue, continuation) ? 1 : 0;
        } catch (Exception | LinkageError failure) {
            Logger.printException(() -> "OfflineReplay: could not verify the native queue continuation", failure);
            return 0;
        }
    }

    /** Whether the replay is installed and has not failed in this process. */
    static boolean usable() {
        return supported() && !broken;
    }

    private static void disable(String hook, Throwable failure) {
        boolean first = !broken;
        broken = true;
        if (first) {
            Logger.printException(() -> "OfflineReplay: " + hook + " failed, the replay is off for this process",
                    failure);
        }
    }

    /** Injection point: every command the app dispatches. */
    public static boolean onCommand(Object dispatcher, Object command, Map<?, ?> context) {
        if (!usable()) return false;

        try {
            return OfflineReplay.onCommand(dispatcher, command, context);
        } catch (Throwable failure) {
            disable("command", failure);
            return false;
        }
    }

    /** Claims just the first native playlist detail load. False leaves the app's original invocation untouched. */
    public static boolean openInitialBrowse(Object fragment, Object request) {
        if (!usable()) return false;

        try {
            return OfflineReplay.openInitialBrowse(fragment, request);
        } catch (Throwable failure) {
            Logger.printException(() -> "OfflineReplay: could not start the saved detail load", failure);
            return false;
        }
    }

    /** Canonical ID for an initial playlist request, excluding explicit edit and refresh commands. */
    @Nullable
    public static String initialDetailId(String browseId, @Nullable Map<?, ?> context) {
        return OfflineReplayLogic.initialDetailId(browseId, context);
    }

    /** Injection point: the success of a page the page fragment shows: a page the user opened. */
    public static void onBrowseResponse(String browseId, Object result, boolean captureLegacyDetails) {
        if (!usable()) return;

        try {
            OfflineReplay.onBrowseResponse(browseId, result, captureLegacyDetails);
        } catch (Throwable failure) {
            disable("browse capture", failure);
        }
    }

    /** Injection point: a page failed to load. The recorded page of a downloaded list, or null to let it fail. */
    @Nullable
    public static byte[] answerBrowse(String browseId, Throwable error) {
        if (!usable()) return null;

        try {
            return OfflineReplay.answerBrowse(browseId, error);
        } catch (Throwable failure) {
            disable("browse replay", failure);
            return null;
        }
    }

    /** Injection point: the player's shared progress-bar and MediaSession seek snap, in milliseconds. */
    public static long seekSnap(long snappedMillis) {
        if (!usable()) return snappedMillis;

        try {
            return OfflineReplay.seekSnap(snappedMillis);
        } catch (Throwable failure) {
            disable("seek", failure);
            return snappedMillis;
        }
    }

    /** Entry of the settings row: opens the offline list, or says why it cannot. */
    public static void openList(Context context) {
        try {
            if (usable()) {
                OfflineReplay.openList(context);
                return;
            }
        } catch (Throwable failure) {
            disable("settings list", failure);
        }

        Utils.showToastShort(str("morphe_music_offline_library_not_enabled"));
    }

    /**
     * Injection point: the callback of a request for a page of the Library's Downloads chips. The callback to ask
     * with: the app's own, or one that adds the stream copies to the page.
     */
    public static Object wrapDownloadsPage(Object request, Object options, Object callback) {
        if (!usable()) return callback;

        try {
            return DownloadsPage.wrap(request, options, callback);
        } catch (Throwable failure) {
            disable("downloads page", failure);
            return callback;
        }
    }

    /** Injection point: the flag the offline watch gate read. */
    public static void noteGateFlag(boolean flag) {
        if (!usable()) return;

        try {
            OfflineReplay.noteGateFlag(flag);
        } catch (Throwable failure) {
            disable("gate flag", failure);
        }
    }

    /** Injection point: true when the gate must let the offline watch command of this song through. */
    public static boolean holdsForGate(String videoId) {
        if (!usable()) return false;

        try {
            return OfflineReplay.holdsForGate(videoId);
        } catch (Throwable failure) {
            disable("gate", failure);
            return false;
        }
    }

    /** Injection point: the stored player response of the song, ready for the app's parser, or null. */
    @Nullable
    public static byte[] storedForPlayer(String videoId, boolean offlineRequest) {
        if (!usable()) return null;

        try {
            return OfflineReplay.storedForPlayer(videoId, offlineRequest);
        } catch (Throwable failure) {
            disable("player lookup", failure);
            return null;
        }
    }

    /** Injection point: the response built from the stored bytes, swapped to play the copy, or null. */
    @Nullable
    public static Object finishPlayer(Object response, String videoId) {
        if (!usable()) return null;

        try {
            return OfflineReplay.finishPlayer(response, videoId);
        } catch (Throwable failure) {
            disable("player response", failure);
            return null;
        }
    }

    /** Injection point: the presenter of the "No connection" sheet has shown it through the given controller. */
    public static void noConnectionSheetShown(Object controller) {
        if (!usable()) return;

        try {
            NoConnectionSheet.onSheetShown(controller);
        } catch (Throwable failure) {
            disable("no-connection sheet", failure);
        }
    }

    /** Injection point: the watch-next future of a request; the stock future itself unless the request is ours. */
    public static ListenableFuture<?> wrapNext(Object request, ListenableFuture<?> stock) {
        if (!usable()) return stock;

        try {
            return OfflineReplay.wrapNext(request, stock);
        } catch (Throwable failure) {
            disable("watch-next", failure);
            return stock;
        }
    }

    @Nullable
    public static ListenableFuture<?> localNext(Object request) {
        if (!usable()) return null;

        try {
            return OfflineReplay.localNext(request);
        } catch (Throwable failure) {
            disable("local watch-next", failure);
            return null;
        }
    }

    /** Whether the Android Auto and the Library lists may use the replay. */
    public static boolean enabled() {
        if (!usable()) return false;

        try {
            return OfflineReplay.enabled();
        } catch (Throwable failure) {
            disable("settings", failure);
            return false;
        }
    }
}
