/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.content.Context;
import android.view.View;

import androidx.annotation.Nullable;

import com.google.common.util.concurrent.ListenableFuture;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import app.morphe.extension.music.patches.downloads.NativeDownloads.Command;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Plays a downloaded song with no network through the app's own offline command, player and watch-next paths,
 * only while the setting is on and a stored response is available. Online requests stay stock except for the
 * seek snap of a current StreamSwap local source, which needs the same target preservation as offline replay.
 */
@SuppressWarnings("unused")
public final class OfflineReplay {
    /**
     * The id of the list of the songs no downloaded list holds (No Playlist), next to the ids of the downloaded
     * playlists and albums.
     */
    public static final String SONGS = "songs";

    /** The online queueing of No Playlist: how long it waits for the tapped song, and the pauses between steps. */
    private static final long QUEUE_WAIT_MS = 20_000;
    private static final long QUEUE_POLL_MS = 250;
    private static final long QUEUE_SETTLE_MS = 600;
    private static final long QUEUE_STEP_MS = 350;
    private static final AtomicInteger queueGeneration = new AtomicInteger();

    /** Added by the Downloads patch to the class that dispatches a command, so a command can be run again. */
    public interface Dispatcher {
        void rvxDispatch(Object command, Map<?, ?> context);
    }

    /** Added by the Downloads patch to the watch-next request. */
    public interface NextRequest {
        /** The watch command the request was made for. */
        Object rvxCommand();

        /** The stock response object of the watch-next response {@code bytes}. */
        Object rvxNextResponse(byte[] bytes);
    }

    /** What the last dispatched command left behind: the way to run a command of our own. */
    private record Captured(WeakReference<Dispatcher> dispatcher, Command template,
                            WeakReference<Map<?, ?>> context) {}

    private static final String HOOK_GATE = "gate";
    private static final String HOOK_PLAYER = "player";
    private static final String HOOK_NEXT = "next";
    private static final String HOOK_COMMAND = "command";
    private static final String HOOK_SEEK = "seek";
    private static final String HOOK_BROWSE_CAPTURE = "browse-capture";
    private static final String HOOK_BROWSE_REPLAY = "browse-replay";
    private static final String REASON_SETTING_OFF = "setting off";
    private static final String REASON_NO_ID = "no browse id";
    private static final String REASON_NOT_A_LIST = "not a downloaded list";
    private static final String REASON_OFFLINE = "offline";
    /** The reasons that are the normal case of nearly every page: never said. */
    private static final Set<String> QUIET_CAPTURE_SKIPS =
            Set.of(REASON_SETTING_OFF, REASON_NO_ID, REASON_NOT_A_LIST, REASON_OFFLINE);
    private static final String HOOK_GATE_FLAG = "gate-flag";

    private static final ConcurrentMap<String, Long> skipLoggedAt = new ConcurrentHashMap<>();
    private static final Set<String> aliveHooks = ConcurrentHashMap.newKeySet();
    private static volatile Captured captured;
    private static volatile boolean lastGateFlag;

    private OfflineReplay() {}

    static boolean enabled() {
        return OfflineReplayHooks.usable();
    }

    static String playlistId(String sourceId) {
        return OfflineReplayLogic.playlistId(sourceId);
    }

    @Nullable
    static String sourceOf(@Nullable String playlistId) {
        return OfflineReplayLogic.sourceOf(playlistId);
    }

    /** Whether the song, or the music video of a song, has stored data. In memory, so the main thread may ask. */
    static boolean holds(String videoId) {
        return OfflineCopyStore.has(videoId) || VideoCopyStore.has(videoId);
    }

    /**
     * The stored player response of the song, or of the music video that has a video copy; null when neither is
     * stored. A video copy answers in the shape of the response the app gets online ({@link VideoCopyAnswer}): the
     * app's player selection reads more of a response than the streaming data, and the response saved with the copy
     * (another client's) gave it no video track offline. The base is the app's online response of this video when
     * one was kept ({@link VideoCopyStore#keepLive}), else the app-generic part of the last online response of any
     * copy ({@link LiveTemplate}), else the saved response alone. The thumbnails are the song's, which the Song
     * display can show with no network ({@link VideoCopyAnswer#withSongArtwork}).
     */
    @Nullable
    private static byte[] storedResponseOf(String videoId) throws IOException {
        OfflineCopyFiles.Stored stored = OfflineCopyStore.find(videoId);
        if (stored != null) return stored.response();

        byte[] saved = VideoCopyStore.response(videoId);
        if (saved == null) return null;

        byte[] live = VideoCopyStore.live(videoId);
        byte[] template = live == null ? LiveTemplate.get() : null;
        VideoCopyAnswer.Answer answer = VideoCopyAnswer.of(saved, live, template);
        byte[] artwork = withSongArtwork(videoId, answer.bytes());
        Logger.printDebug(() -> "OfflineReplay: video copy v=" + videoId + " base=" + answer.base() + " saved="
                + saved.length + "B live=" + sizeOf(live) + " template=" + sizeOf(template) + " songArtwork="
                + (artwork != answer.bytes()));
        return artwork;
    }

    /** The answer with the thumbnails of the song the video copy belongs to, or as it is when the song has none. */
    private static byte[] withSongArtwork(String videoId, byte[] answer) throws IOException {
        String songId = VideoCopyStore.pairs().get(videoId);
        OfflineCopyFiles.Stored song = songId == null ? null : OfflineCopyStore.find(songId);
        return song == null ? answer : VideoCopyAnswer.withSongArtwork(answer, song.response());
    }

    private static String sizeOf(@Nullable byte[] bytes) {
        return bytes == null ? "none" : bytes.length + "B";
    }

    // region queue and commands

    /**
     * The tracks of a list that can play with no network, in the order the list shows them. Off the main thread.
     * The songs list holds the loose songs, sorted by title.
     */
    static List<OfflineWatchNext.Item> queueOf(String sourceId) {
        if (SONGS.equals(sourceId)) {
            Set<String> loose = CopyOwnership.looseSongs(RawAudioStore.copyIds(), OfflineCopyStore.allTrackLists());
            return OfflineReplayLogic.itemsOfSongs(OfflineCopyStore.copiesWithData(), loose);
        }
        return OfflineReplayLogic.itemsOfTracks(OfflineCopyStore.tracksOf(sourceId));
    }

    /** Auto retains song IDs; online player responses keep radio/lyrics while StreamSwap serves local media. */
    @Nullable
    static byte[] autoCommand(String sourceId, int index, boolean online) {
        List<OfflineWatchNext.Item> items = queueOf(sourceId);
        if (index < 0 || index >= items.size()) return null;

        String songId = items.get(index).videoId();
        return online ? onlineCommand(sourceId, songId, songId)
                : OfflineWatchCommand.build(songId, playlistId(sourceId), index);
    }

    /**
     * Starts track {@code index} of the list's queue. Offline the command is the offline watch command; online it
     * is the normal watch command, so the online response still owns radio, lyrics and the rest, and only the audio
     * comes from the copy. On the main thread.
     *
     * @return false when no command was seen yet to run one with: nothing was started.
     */
    static boolean play(String sourceId, int index) {
        if (!canDispatch()) return false;

        // A tap is a fresh selection that starts in the Song display, offline or online: the video copy plays with its
        // video surface off, and the app's own Song/Video switch flips it in place.
        logDecision(HOOK_COMMAND, "audio mode: " + AudioFirst.startAudioMode());

        // A new tap ends the queueing of an earlier one.
        int generation = queueGeneration.incrementAndGet();
        Utils.runOnBackgroundThread(() -> {
            try {
                byte[] command = playCommand(sourceId, index);
                if (command == null) {
                    Logger.printWarn(() -> "OfflineReplay: no track " + index + " in " + sourceId);
                    return;
                }
                if (generation != queueGeneration.get()) return;
                dispatchCommand(command, null, generation, true);
                if (SONGS.equals(sourceId) && Utils.isInternetReachable()) queueTheList(index, generation);
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: could not start " + sourceId + " at " + index, ex);
            }
        });
        return true;
    }

    /**
     * Online, puts the songs of No Playlist after the tapped one in the order the list shows them, in front of the
     * radio the app builds for it: once the tapped song plays, the app's own Play next runs for each following song.
     * A newer tap ends this one. Off the main thread.
     */
    private static void queueTheList(int index, int generation) throws InterruptedException {
        if (generation != queueGeneration.get()) return;
        List<OfflineWatchNext.Item> items = queueOf(SONGS);
        if (index < 0 || index >= items.size()) return;

        List<String> ids = new ArrayList<>();
        for (OfflineWatchNext.Item item : items) ids.add(item.videoId());
        String tapped = ids.get(index);
        String video = OfflineReplayLogic.videoOf(tapped, videoCopies());

        if (!waitForPlaying(generation, tapped, video)) {
            if (generation == queueGeneration.get()) {
                Logger.printWarn(() -> "OfflineReplay: " + tapped + " did not start, the list is not queued");
            }
            return;
        }
        // The queue of the new song is built a moment after it starts.
        Thread.sleep(QUEUE_SETTLE_MS);

        List<String> order = OnlineQueueCommand.commandOrder(OnlineQueueCommand.following(ids, index));
        Logger.printDebug(() -> "OfflineReplay: queueing " + order.size() + " songs after " + tapped);
        for (String id : order) {
            if (generation != queueGeneration.get()) return;

            dispatchCommand(OnlineQueueCommand.playNext(id), null, generation, true);
            Thread.sleep(QUEUE_STEP_MS);
        }
    }

    static void cancelQueuedSongs() {
        queueGeneration.incrementAndGet();
    }

    private static boolean waitForPlaying(int generation, String song, @Nullable String video)
            throws InterruptedException {
        long deadline = System.currentTimeMillis() + QUEUE_WAIT_MS;
        while (generation == queueGeneration.get() && System.currentTimeMillis() < deadline) {
            String playing = VideoInformation.getVideoId();
            if (song.equals(playing) || (video != null && video.equals(playing))) return true;

            Thread.sleep(QUEUE_POLL_MS);
        }
        return false;
    }

    /**
     * Starts a song of a list that has no stored data, as a normal online song of that list. On the main thread.
     *
     * @return false when no command was seen yet to run one with: nothing was started.
     */
    static boolean playOnline(String sourceId, String videoId) {
        if (!canDispatch()) return false;

        Utils.runOnBackgroundThread(() -> {
            try {
                dispatchCommand(onlineCommand(sourceId, videoId, videoId));
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: could not start online " + videoId + " of " + sourceId, ex);
            }
        });
        return true;
    }

    @Nullable
    private static byte[] playCommand(String sourceId, int index) {
        // Online the app's own watch of the song runs: the offline watch command of a list is declined by the app
        // while a network exists and ends in its Re-download question. The songs list has no playlist, so the
        // song's own radio is the online queue; offline the list plays in its shown order.
        if (!Utils.isInternetReachable()) return startCommand(sourceId, index);

        List<OfflineWatchNext.Item> items = queueOf(sourceId);
        if (index < 0 || index >= items.size()) return null;

        String songId = items.get(index).videoId();
        String videoId = OfflineReplayLogic.videoOf(songId, videoCopies());
        return onlineCommand(sourceId, songId, videoId == null ? songId : videoId);
    }

    /**
     * The offline command a tap in a list starts: a song that has a video copy starts as its music video, which the
     * copy answers in either display of the app's own Song/Video switch; the rest start as the song. Unlike
     * {@link #autoCommand}, which keeps song IDs for Android Auto. Off the main thread.
     */
    @Nullable
    private static byte[] startCommand(String sourceId, int index) {
        List<OfflineWatchNext.Item> items = queueOf(sourceId);
        if (index < 0 || index >= items.size()) return null;

        String songId = items.get(index).videoId();
        Map<String, String> videos = videoCopies();
        String videoId = OfflineReplayLogic.videoOf(songId, videos);
        return OfflineWatchCommand.build(videoId == null ? songId : videoId, playlistId(sourceId), index,
                OfflineReplayLogic.startTypeOf(songId, videos));
    }

    /**
     * The ordinary online watch command of a song tapped in a list: the playlist's id and the song's place in it
     * for a playlist or album, the song alone for a song of no list, where the app builds the song's own radio.
     */
    private static byte[] onlineCommand(String sourceId, String songId, String videoId) {
        return OnlineWatchCommand.build(videoId, OfflineReplayLogic.onlinePlaylistId(sourceId, SONGS),
                indexInSource(sourceId, songId));
    }

    /** The place of the song in the whole downloaded list: the online playlist counts the tracks that are not here. */
    private static int indexInSource(String sourceId, String videoId) {
        for (OfflineSourceStore.Source source : OfflineCopyStore.sources()) {
            if (source.id().equals(sourceId)) return Math.max(0, source.videoIds().indexOf(videoId));
        }
        return 0;
    }

    /** Opens a whole, unfiltered stock MenuRenderer through the app's regular menu endpoint. */
    public static boolean openSongMenu(byte[] menu, View anchor) {
        byte[] container = new ProtoWriter().message(66_439_850, menu).toByteArray();
        byte[] endpoint = new ProtoWriter().message(1, container).toByteArray();
        return dispatchCommand(new ProtoWriter().message(98_150_882, endpoint).toByteArray(), anchor);
    }

    /** Positionless get_queue input. Menu consumers must isolate its response from queue updates and commands. */
    public static byte[] songMenuRequest(String songId) {
        byte[] target = new ProtoWriter().string(1, songId).toByteArray();
        byte[] request = new ProtoWriter().message(1, target).toByteArray();
        return new ProtoWriter().message(163_162_354, request).toByteArray();
    }

    static boolean canDispatch() {
        Captured seen = captured;
        return seen != null && seen.dispatcher().get() != null;
    }

    /**
     * Runs the command through the dispatcher the app's own taps use, on the main thread.
     *
     * @return false when no command was seen yet to run one with: nothing was dispatched.
     */
    static boolean dispatchCommand(byte[] commandBytes) {
        return dispatchCommand(commandBytes, null);
    }

    private static boolean dispatchCommand(byte[] commandBytes, @Nullable View sender) {
        return dispatchCommand(commandBytes, sender, 0, false);
    }

    private static boolean dispatchCommand(byte[] commandBytes, @Nullable View sender, int generation,
                                           boolean ordered) {
        Captured seen = captured;
        Dispatcher dispatcher = seen == null ? null : seen.dispatcher().get();
        if (dispatcher == null) return false;

        Utils.runOnMainThreadNowOrLater(() -> {
            if (ordered && generation != queueGeneration.get()) return;
            try {
                dispatcher.rvxDispatch(seen.template().rvxWithBytes(commandBytes), contextOf(seen, sender));
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: could not dispatch the command", ex);
            }
        });
        return true;
    }

    /** A copy of the context the last command had, or an empty one when it is gone or cannot be copied. */
    private static Map<?, ?> contextOf(Captured seen, @Nullable View sender) {
        Map<?, ?> context = seen.context().get();
        if (context == null && sender == null) return Collections.emptyMap();

        try {
            Map<Object, Object> copied = context == null ? new HashMap<>() : new HashMap<>(context);
            if (sender != null) {
                copied.put("com.google.android.libraries.youtube.rendering.elements.sender_view", sender);
            }
            return copied;
        } catch (Exception ex) {
            Logger.printDebug(() -> "OfflineReplay: the command's context cannot be copied, using none", ex);
            return Collections.emptyMap();
        }
    }

    /**
     * Injection point: every command the app dispatches, on the main thread. Remembers how to dispatch a command
     * while the setting is on, and decides the tap of a row of the Downloads page now, with the network of this
     * moment: the rows carry the app's own commands (a page's browse, a song's watch), which the app runs as they
     * are while online. Offline, one that cannot work is taken and the downloaded copy plays instead.
     *
     * @return true when the command is taken: the app must not run it.
     */
    static boolean onCommand(Object dispatcher, Object command, Map<?, ?> context) {
        try {
            noteAlive(HOOK_COMMAND);
            if (!(dispatcher instanceof Dispatcher stockDispatcher) || !(command instanceof Command message)) {
                return false;
            }

            if (!enabled()) return false;

            captured = new Captured(new WeakReference<>(stockDispatcher), message, new WeakReference<>(context));
            OfflineCopyStore.warmUp();
            OfflineBackfill.kick();

            byte[] bytes = message.toByteArray();
            String browseId = OfflineReplayLogic.browseIdOf(bytes);
            if (browseId != null) logDecision(HOOK_COMMAND, "browse=" + browseId);

            return takeOffline(bytes, browseId);
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: could not read the command", ex);
            return false;
        }
    }

    private static boolean takeOffline(byte[] command, @Nullable String browseId) {
        OfflineReplayLogic.WatchTarget watch = browseId == null ? OfflineReplayLogic.songTargetOf(
                OfflineReplayLogic.onlineWatchOf(command), VideoCopyStore.pairsIfLoaded()) : null;
        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        if (registry != null) watch = OfflineReplayLogic.canonicalTargetOf(watch, registry::canonicalId);
        if (browseId == null && watch == null) return false;

        Map<String, List<String>> tracks = OfflineCopyStore.tracksBySource();
        OfflineReplayLogic.Decision decision = OfflineReplayLogic.routeOf(Utils.isInternetReachable(), browseId, watch,
                SONGS, tracks::containsKey, OfflineBrowsePages::has, OfflineCopyStore::has,
                target -> OfflineReplayLogic.sourceOfPlaylist(target.playlistId(), target.videoId(), tracks),
                videoId -> OfflineReplayLogic.sourceHolding(videoId, tracks));
        switch (decision.route()) {
            case OPEN_SONGS -> {
                logDecision(HOOK_COMMAND, "browse of the songs list opens it");
                NoPlaylistDialog.show();
                return true;
            }
            case PLAY_SOURCE -> {
                logDecision(HOOK_COMMAND, "offline browse or watch of " + decision.sourceId() + " plays the list");
                return play(decision.sourceId(), 0);
            }
            case PLAY_TRACK -> {
                logDecision(HOOK_COMMAND, "offline watch of " + decision.videoId() + " in " + decision.sourceId()
                        + " plays the copy");
                return playTrack(decision.sourceId(), decision.videoId());
            }
            default -> {
                return false;
            }
        }
    }

    /** Starts a song with stored data as a track of the list's offline queue, with no network. Main thread. */
    private static boolean playTrack(String sourceId, String videoId) {
        if (!canDispatch()) return false;

        logDecision(HOOK_COMMAND, "audio mode: " + AudioFirst.startAudioMode());
        Utils.runOnBackgroundThread(() -> {
            try {
                List<OfflineWatchNext.Item> items = queueOf(sourceId);
                int index = OfflineReplayLogic.currentIndex(items,
                        OfflineReplayLogic.songOf(videoId, videoCopies()), -1);
                byte[] command = index < 0 ? null : startCommand(sourceId, index);
                if (command == null) {
                    Logger.printWarn(() -> "OfflineReplay: no stored song " + videoId + " in " + sourceId);
                    return;
                }
                dispatchCommand(command);
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: could not start " + videoId + " of " + sourceId, ex);
            }
        });
        return true;
    }

    /**
     * Injection point: the success of a page the app's page fragment shows (a playlist, an album), on the main
     * thread, with the response model it renders. Records the page of a downloaded list the user opened while online,
     * to open it again with no network. The serialization and the write run on a worker thread: the response is
     * immutable. A recorded page is logged; of the pages that are not recorded only the odd reason is, once a minute.
     */
    static void onBrowseResponse(String browseId, Object result) {
        noteAlive(HOOK_BROWSE_CAPTURE);
        String skipped = captureSkipReason(browseId, result);
        if (skipped != null) {
            if (!QUIET_CAPTURE_SKIPS.contains(skipped)) logSkip(HOOK_BROWSE_CAPTURE, skipped);
            return;
        }

        OfflineBrowsePages.Bytes holder = (OfflineBrowsePages.Bytes) result;
        String pageId = OfflineReplayLogic.sourceOfBrowseId(browseId);
        Utils.runOnBackgroundThread(() -> {
            try {
                byte[] response = holder.rvxBrowseBytes();
                if (OfflineBrowsePagesLogic.isContinuation(response)) {
                    logDecision(HOOK_BROWSE_CAPTURE, "skipped: " + browseId + " is a continuation");
                    return;
                }

                String list = OfflineBrowsePagesLogic.ownerOf(browseId, response,
                        OfflineCopyStore.tracksBySource().keySet());
                if (list == null) {
                    logSkip(HOOK_BROWSE_CAPTURE, "no downloaded list owns " + browseId);
                    return;
                }

                int updates = OfflineBrowsePagesLogic.frameworkUpdatesSize(response);
                int written = OfflineBrowsePages.write(pageId, list, response);
                logDecision(HOOK_BROWSE_CAPTURE, "recorded " + browseId + " list=" + list + " bytes="
                        + response.length + " frameworkUpdates=" + updates + " gzip=" + written + " fields="
                        + OfflineBrowsePagesLogic.fieldSizes(response));
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: could not record the page of " + browseId, ex);
            }
        });
    }

    private static boolean hasAlbumPlaylist() {
        for (String id : OfflineCopyStore.tracksBySource().keySet()) {
            if (id.startsWith("OLAK5uy_")) return true;
        }
        return false;
    }

    /** Why the page the success callback saw is not recorded, or null when it is. */
    @Nullable
    private static String captureSkipReason(@Nullable String browseId, Object result) {
        if (!enabled()) return REASON_SETTING_OFF;

        if (browseId == null || browseId.isEmpty()) return REASON_NO_ID;

        if (!OfflineBrowsePagesLogic.recordable(browseId, OfflineCopyStore::hasSource,
                OfflineReplay::hasAlbumPlaylist)) {
            return REASON_NOT_A_LIST;
        }

        if (!Utils.isInternetReachable()) return REASON_OFFLINE;

        if (!(result instanceof OfflineBrowsePages.Bytes)) return "no bytes bridge on the result";

        return null;
    }

    /**
     * Injection point: the page fragment's load of a page failed. The recorded page of a downloaded list answers it
     * while there is no network; every other failure, an online one included, stays the app's.
     *
     * @return the recorded browse response, or null.
     */
    @Nullable
    static byte[] answerBrowse(String browseId, Throwable failure) {
        noteAlive(HOOK_BROWSE_REPLAY);
        boolean online = Utils.isInternetReachable();
        String sourceId = browseId == null ? null : OfflineReplayLogic.sourceOfBrowseId(browseId);
        boolean stored = sourceId != null && OfflineBrowsePages.has(sourceId);
        logDecision(HOOK_BROWSE_REPLAY, "asked id=" + browseId + " online=" + online + " stored=" + stored
                + " failure=" + failure);
        if (!enabled() || sourceId == null || online || !stored) return null;

        byte[] response = OfflineBrowsePages.read(sourceId);
        logDecision(HOOK_BROWSE_REPLAY, "replay " + browseId + " bytes=" + (response == null ? -1 : response.length)
                + " thread=" + (Utils.isCurrentlyOnMainThread() ? "main" : "worker"));
        return response;
    }

    /**
     * Opens the Downloads page from the settings page with the app's own browse command, and closes the settings so
     * that the page is the one on screen. Says why it cannot while the replay is off or no command has run yet.
     */
    static void openList(Context context) {
        Activity activity = context instanceof Activity own ? own : Utils.getActivity();
        if (activity == null || !enabled()) {
            Utils.showToastShort(str("morphe_music_offline_library_not_enabled"));
            return;
        }

        if (!dispatchCommand(OfflineLibraryLogic.browseCommand(OfflineLibraryLogic.DOWNLOADS_BROWSE_ID))) {
            Utils.showToastShort(str("morphe_music_offline_library_not_ready"));
            return;
        }

        activity.finish();
    }

    // endregion

    // region hooks

    /** Injection point: the flag the gate read, to tell in the log which of its two paths a version takes. */
    static void noteGateFlag(boolean flag) {
        noteAlive(HOOK_GATE_FLAG);
        lastGateFlag = flag;
    }

    /**
     * Injection point: the gate that drops a watch command while the app believes it is offline. True only when
     * there is no network and the song has stored data: the command then goes on to the stock playback.
     */
    static boolean holdsForGate(String videoId) {
        try {
            noteAlive(HOOK_GATE);
            boolean ours = videoId != null && holds(videoId);
            boolean enabled = enabled();
            boolean offline = enabled && !Utils.isInternetReachable();
            String reason = OfflineReplayLogic.skipReason(enabled, offline, ours, true);
            if (reason != null) {
                logDecision(HOOK_GATE, "declined:" + reason + " v=" + videoId + " ours=" + ours);
                return false;
            }

            Logger.printWarn(() -> "OfflineReplay: gate bypass v=" + videoId + " holds=true flag=" + lastGateFlag
                    + " network=offline");
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: gate check failed", ex);
            return false;
        }
    }

    /**
     * Injection point: the player request failed in the stock offline lookup. The stored response of the song ready
     * for the app's parser, or null to let the stock failure stand. Off the main thread.
     */
    @Nullable
    static byte[] storedForPlayer(String videoId, boolean offlineRequest) {
        try {
            noteAlive(HOOK_PLAYER);
            logDecision(HOOK_PLAYER, "lookup entered v=" + videoId + " offlineRequest=" + offlineRequest);

            byte[] stored = null;
            if (enabled() && offlineRequest && videoId != null) stored = storedResponseOf(videoId);

            String reason = OfflineReplayLogic.skipReason(enabled(), offlineRequest, stored != null, true);
            if (reason != null) {
                logDecision(HOOK_PLAYER, "lookup declined:" + reason + " v=" + videoId);
                return null;
            }

            byte[] prepared = OfflineReplayResponse.prepare(stored);
            Logger.printWarn(() -> "OfflineReplay: player v=" + videoId + " stock failed, answering from the copy"
                    + " stored=" + prepared.length + "B " + OfflineResponseTrim.gateFacts(prepared));
            logDecision(HOOK_PLAYER, "lookup answered v=" + videoId);
            return prepared;
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: no stored response for v=" + videoId, ex);
            return null;
        }
    }

    /**
     * Injection point: the response built from the stored bytes. The same audio swap an online response gets turns
     * it into one that plays the copy.
     *
     * @return the response to answer with, or null when the swap declined and the stock failure must stand.
     */
    @Nullable
    static Object finishPlayer(Object response, String videoId) {
        try {
            Object swapped = StreamSwap.swapStored(response);
            boolean swap = swapped != response;
            Logger.printWarn(() -> "OfflineReplay: player v=" + videoId + " swap=" + (swap ? "SWAP" : "DECLINED")
                    + " " + describe(swapped));
            if (swap) NoConnectionSheet.onCopyReplayed(videoId);
            return swap ? swapped : null;
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: could not finish the response of v=" + videoId, ex);
            return null;
        }
    }

    private static String describe(Object response) {
        boolean marker = response instanceof StreamSwap.Response adapter
                && OfflineReplayLogic.hasOfflineMarker(adapter.rvxBytes());
        return "flagR=" + marker;
    }

    /**
     * Injection point: the watch-next future of a request. While online, with the setting off, and for any request
     * that is not an offline watch of ours the stock future is returned as it is. For ours, a stock failure is
     * answered with the queue of the list.
     */
    static ListenableFuture<?> wrapNext(Object request, ListenableFuture<?> stock) {
        try {
            noteAlive(HOOK_NEXT);
            OfflineReplayLogic.WatchTarget target = watchTargetOf(request);
            boolean ours = target != null
                    && (sourceOf(target.playlistId()) != null || holds(target.videoId()));
            String reason = OfflineReplayLogic.skipReason(enabled(), target != null, ours, true);
            if (reason != null) {
                logSkip(HOOK_NEXT, reason);
                return stock;
            }

            return answerNextFailure((NextRequest) request, target, stock);
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: could not wrap the watch-next request", ex);
            return stock;
        }
    }

    @Nullable
    private static OfflineReplayLogic.WatchTarget watchTargetOf(Object request) {
        if (!(request instanceof NextRequest next) || !(next.rvxCommand() instanceof Command command)) return null;

        return OfflineReplayLogic.offlineWatchOf(command.toByteArray());
    }

    private static ListenableFuture<?> answerNextFailure(NextRequest request, OfflineReplayLogic.WatchTarget target,
                                                         ListenableFuture<?> stock) {
        ReplayFuture result = new ReplayFuture();
        stock.addListener(() -> {
            try {
                result.set(stock.get());
            } catch (Exception failure) {
                if (!result.isCancelled()) {
                    Utils.runOnBackgroundThread(() -> answerFromStore(request, target, failure, result));
                }
            }
        }, Runnable::run);
        result.addListener(() -> {
            if (result.isCancelled()) stock.cancel(false);
        }, Runnable::run);
        return result;
    }

    private static void answerFromStore(NextRequest request, OfflineReplayLogic.WatchTarget target,
                                        Exception failure, ReplayFuture result) {
        try {
            byte[] bytes = nextBytes(target.playlistId(), target.videoId(), target.index(), true);
            if (bytes == null) {
                result.setException(failure);
                return;
            }

            result.set(request.rvxNextResponse(bytes));
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: next v=" + target.videoId() + " could not be answered", ex);
            result.setException(failure);
        }
    }

    /**
     * The watch-next response of the queue the request belongs to, or null to let the stock failure stand. A request
     * that names no list of ours but a song with stored data gets that song as a queue of one. Off the main thread.
     */
    @Nullable
    public static byte[] nextBytes(String playlistId, String videoId, int index, boolean offlineRequest) {
        boolean ours = sourceOf(playlistId) != null || holds(videoId);
        String reason = OfflineReplayLogic.skipReason(enabled(), offlineRequest, ours, true);
        if (reason != null) {
            logSkip(HOOK_NEXT, reason);
            return null;
        }

        // The queue holds songs: a request for the music video of a song is a request for that song's item.
        Map<String, String> videos = videoCopies();
        String songId = OfflineReplayLogic.songOf(videoId, videos);
        String sourceId = sourceOf(playlistId);
        List<OfflineWatchNext.Item> items = sourceId == null ? List.of() : queueOf(sourceId);
        int current = OfflineReplayLogic.currentIndex(items, songId, index);
        if (current < 0) {
            OfflineCopyFiles.Stored stored = OfflineCopyStore.find(songId);
            if (stored == null) {
                logSkip(HOOK_NEXT, OfflineReplayLogic.REASON_NOT_OURS);
                return null;
            }

            items = List.of(OfflineReplayLogic.itemOf(stored.metadata()));
            current = 0;
        }
        String queueId = playlistId == null || playlistId.isEmpty() ? playlistId(SONGS) : playlistId;
        // A request for the music video of a song shows the music video of every song that has a copy, as the queue of
        // an online album does; the video copy answers it in either display of the app's own Song/Video switch.
        if (OfflineReplayLogic.showsVideos(videoId, videos)) items = OfflineReplayLogic.showingVideos(items, videos);

        byte[] response = OfflineWatchNext.build(queueId, items, current);
        int queued = items.size();
        long shown = items.stream().filter(item -> item.musicVideoType() == CommandRewrite.TYPE_OMV).count();
        List<String> queueIds = items.stream().map(OfflineWatchNext.Item::videoId).collect(Collectors.toList());
        Logger.printWarn(() -> "OfflineReplay: next v=" + videoId + " playlist=" + queueId + " items=" + queued
                + " current=" + queueIds.indexOf(songId) + " ids=" + queueIds
                + " videos=" + shown + " bytes=" + response.length);
        return response;
    }

    /**
     * The committed video copies, music video id to song id; none when they cannot be read, so that a queue is
     * always answered, as plain items. Off the main thread.
     */
    private static Map<String, String> videoCopies() {
        try {
            return VideoCopyStore.pairs();
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: the video copies cannot be read, the queue has none", ex);
            return Map.of();
        }
    }

    // endregion

    /** A skipped hook is the normal case while online: each reason is said once a minute, and only for debugging. */
    private static void logSkip(String hook, String reason) {
        long now = System.currentTimeMillis();
        if (OfflineReplayLogic.shouldLogSkip(skipLoggedAt, hook + ":" + reason, now)) {
            Logger.printDebug(() -> "OfflineReplay: " + hook + " skipped reason=" + reason);
        }
    }

    /**
     * What the seek snap answers to keep the dragged position. The player compares the snap with the target: a
     * negative snap cancels the seek, one below the target moves it there, one at or above it seeks to the target.
     */
    private static final long KEEP_TARGET = Long.MAX_VALUE;

    /**
     * Injection point shared by progress-bar drags and MediaSession seeks. A current StreamSwap local source has
     * no stream-cache span even while online: audio answers 0 (restart), video -1 (cancel). An answer above any
     * target preserves the requested position in either pill without disabling online features.
     */
    static long seekSnap(long snappedMillis) {
        try {
            noteAlive(HOOK_SEEK);
            boolean online = Utils.isInternetReachable();
            String videoId = VideoInformation.getVideoId();
            boolean localPlayback = StreamSwap.playsLocal(videoId);
            boolean drop = OfflineReplayLogic.dropsSeekSnap(enabled(), online, localPlayback, snappedMillis);
            logDecision(HOOK_SEEK, "snap=" + snappedMillis + " online=" + online + " v=" + videoId
                    + " local=" + localPlayback + (drop ? " dropped, seeking to the requested position" : " kept"));
            return drop ? KEEP_TARGET : snappedMillis;
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineReplay: seek snap", ex);
            return snappedMillis;
        }
    }

    /** A decision of a hook that only runs for an offline request or a stock failure: every one is said. */
    private static void logDecision(String hook, String decision) {
        Logger.printDebug(() -> "OfflineReplay: " + hook + " " + decision);
    }

    /** Says once per process that a hook was reached: proof, online or offline, that its injection is alive. */
    private static void noteAlive(String hook) {
        if (!aliveHooks.add(hook)) return;

        Logger.printDebug(() -> "OfflineReplay: hook alive hook=" + hook + " enabled=" + enabled()
                + " network=" + (Utils.isInternetReachable() ? "online" : "offline"));
    }
}
