/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Supplier;

import app.morphe.extension.music.patches.CrossfadeManager;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Keeps the next songs of a downloaded album on their local copies without taking the video away.
 *
 * <p>The queue of an album holds items with only the music video's renderer, so in the audio mode Next requested the
 * video's id, which has no stream copy. An item here keeps both renderers, the music video the server listed and a
 * copy of it rebuilt around the song's id, and shows the one the mode asks for: the song in an audio mode, the video
 * otherwise. Every mode change goes through {@link #onMode}, so the Song/Video pill flips every item, as the app does
 * for the queue items that carry both renderers.
 *
 * <p>The app enables the pill for an item with a counterpart, or when the player response has video, which a song's
 * does not, so the pill can look dimmed for a tracked song. {@link #onPillClick} takes the click itself, whatever the
 * pill's gate says.
 */
@SuppressWarnings("unused")
public final class QueueItems {
    /** A queue item that holds one panel renderer, by the two methods the patch adds to its class. */
    public interface Item {
        /** The renderer the item shows now. */
        Object rvxRenderer();

        /** Shows another renderer, as the item's own replacing method does. */
        void rvxReplace(Object renderer);
    }

    /** The toggle's owner, by the one method the patch adds to it: navigates to an item's own watch endpoint. */
    public interface PillOwner {
        void rvxNavigate(Object item);
    }

    /** The toggle's view, by the two methods the patch adds to it. */
    public interface PillView {
        /** The toggle's owner. */
        Object rvxOwner();

        /** The queue's current item, asked the way the view asks it when it binds. Null when there is none. */
        @Nullable
        Object rvxCurrentItem();
    }

    /** A panel renderer, rebuilt from bytes by the one method the patch adds to its class. */
    public interface Renderer {
        Object rvxWithBytes(byte[] bytes);
    }

    /** The two renderers of one item, by identity of the item. */
    private static final class Tracked extends WeakReference<Object> {
        final Object video;
        final Object song;
        final String videoId;
        final String songId;
        final String playlistId;
        final int playlistIndex;

        Tracked(Object item, Object video, Object song, String videoId, String songId, String playlistId,
                int playlistIndex) {
            super(item);
            this.video = video;
            this.song = song;
            this.videoId = videoId;
            this.songId = songId;
            this.playlistId = playlistId;
            this.playlistIndex = playlistIndex;
        }
    }

    private static final List<Tracked> tracked = new ArrayList<>();
    private static final QueueLogBudget log = new QueueLogBudget();
    private static final QueueLogBudget pillClickLog = new QueueLogBudget();
    /** The ids of the row the user chose, until the queue it starts is built; null when none is awaited. */
    @Nullable
    private static List<String> expectedStart;
    private static long expectedStartAt;

    private QueueItems() {}

    /**
     * Injection point: a queue item was built, or was given another renderer. Items that name a downloaded song are
     * tracked and show the song in an audio mode; the rest are not touched.
     */
    public static void onQueueItem(@Nullable Object item) {
        try {
            if (!AudioFirst.supported() || !(item instanceof Item queueItem)) return;
            if (!tracksItems()) {
                releaseTrackedItems();
                return;
            }

            Object shown = queueItem.rvxRenderer();
            Tracked known;
            synchronized (tracked) {
                known = find(item);
                // A renderer this class put there is not a new one.
                if (known != null && (shown == known.song || shown == known.video)) return;
            }
            if (known != null && keepsSong(known, shown)) return;

            if (known != null) {
                synchronized (tracked) {
                    tracked.remove(known);
                }
            }
            Tracked created = track(item, shown);
            if (created == null) return;

            String mode = AudioFirst.liveMode();
            if (AudioFirstLogic.showsSong(true, mode, true)) show(queueItem, created, mode);
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: queue item failure", ex);
        }
    }

    /**
     * The app copies the renderer an item shows (to set its click tracking) and gives the copy back to the item. For
     * an item that shows its song that is a copy of the song, which names the downloaded song itself and so is no
     * row to track anew: the tracked item keeps its video and takes the copy as its song.
     *
     * @return True when {@code shown} is such a copy and the entry was updated.
     */
    private static boolean keepsSong(Tracked known, Object shown) {
        if (!(shown instanceof MessageLite message)) return false;

        TapCommand copy = TapCommand.parse(message.toByteArray());
        if (!AudioFirstLogic.RENDERS_SONG.equals(AudioFirstLogic.renderedAs(copy.videoId, known.songId,
                known.videoId))) {
            return false;
        }

        Object item = known.get();
        if (item == null) return false;

        synchronized (tracked) {
            int position = tracked.indexOf(known);
            if (position < 0) return false;

            tracked.set(position, new Tracked(item, known.video, shown, known.videoId, known.songId, known.playlistId,
                    known.playlistIndex));
        }
        Logger.printDebug(() -> "AudioFirst: queue item kept song=" + known.songId + " (the app copied its renderer)");
        return true;
    }

    /**
     * Injection point: the start of the click listener of the pill, before its own gate. When the item being played
     * is tracked, the click is this class's: the mode goes to the other kind (the items show its renderer) and the
     * toggle's owner navigates to the item's own watch endpoint, which the app plays in that mode. Any other click is
     * the app's.
     *
     * @param view The toggle's view, which the patch gave the {@link PillView} methods.
     * @return True if the click was taken, so the app's must not run.
     */
    public static boolean onPillClick(@Nullable Object view) {
        CrossfadeManager.ModeSwitch modeSwitch = null;
        String finishReason = "audio-first-pill-failed";
        try {
            // A dim pill of a video with a copy is lit first, so the app's check that follows lets the press through.
            boolean lit = PillAvailability.lightForClick(view);
            if (!(view instanceof PillView pill) || !AudioFirst.supported()) return false;
            if (!tracksItems()) {
                releaseTrackedItems();
                return false;
            }

            Object current = pill.rvxCurrentItem();
            Tracked entry;
            Tracked playing;
            synchronized (tracked) {
                entry = current == null ? null : find(current);
                // The queue's current item can be missing while a queue is rebuilt: the song being played is the
                // fallback.
                playing = entry != null ? null : findPlaying(VideoInformation.getVideoId(),
                        VideoInformation.getPlayerResponseVideoId());
                if (entry == null) entry = playing;
            }
            String via = AudioFirstLogic.lookupSource(entry != null && playing == null, playing != null);
            Object item = entry == null ? null : entry.get();
            Object owner = pill.rvxOwner();
            String was = AudioFirst.liveMode();
            if (item == null || !(owner instanceof PillOwner)) {
                logClick(entry, via, current, was, lit ? "stock:copy-lit" : "stock");
                return false;
            }

            synchronized (tracked) {
                pillPressedAt = SystemClock.elapsedRealtime();
                pending = null;
                pillStart = null;
            }
            AudioFirst.leaveTapsAlone();
            String sourceId = AudioFirstLogic.isAudioMode(was) ? entry.songId : entry.videoId;
            String targetId = AudioFirstLogic.isAudioMode(was) ? entry.videoId : entry.songId;
            modeSwitch = CrossfadeManager.beginModeSwitch(sourceId, targetId);

            String now = AudioFirst.togglePillMode();
            if (now == null) {
                finishReason = "audio-first-pill-no-mode";
                logClick(entry, via, current, was, "stock:no-mode-holder");
                return false;
            }

            logClick(entry, via, current, was, "takeover mode=" + was + "->" + now);
            expectStart(entry.songId, entry.videoId);
            navigateKeepingPosition((PillOwner) owner, item, entry);
            finishReason = "audio-first-pill-dispatch-finished";
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: pill click failure", ex);
            return false;
        } finally {
            CrossfadeManager.endModeSwitch(modeSwitch, finishReason);
        }
    }

    /**
     * Navigates to the other item of the switch, which starts where the player is now: the click notes the position
     * for the item's videos, and the start descriptor the navigation builds asks for it ({@link #startPosition}). A
     * position that cannot be used starts the item at its beginning, as the app does.
     */
    private static void navigateKeepingPosition(PillOwner owner, Object item, Tracked entry) {
        PillPosition.Start start = PillPosition.choose(VideoInformation.getVideoTime(),
                VideoInformation.getVideoLength());
        Logger.printDebug(() -> "AudioFirst: pill start " + start.reason());
        synchronized (tracked) {
            pillStart = start.continues() ? new PillStart(entry.videoId, entry.songId, start.millis(),
                    SystemClock.elapsedRealtime()) : null;
        }
        owner.rvxNavigate(item);
    }

    /**
     * Injection point: the start of the build of a playback start descriptor, which holds the command it starts and
     * the position to start at (-1 when it has none). The descriptor of the pill's navigation, which names a video of
     * the clicked item, starts at the position noted by the click.
     *
     * @param command  The command the descriptor starts.
     * @param position The descriptor's start position in milliseconds, -1 when it has none.
     * @return The start position the descriptor is to have.
     */
    public static long startPosition(@Nullable Object command, long position) {
        try {
            PillStart noted;
            synchronized (tracked) {
                noted = pillStart;
            }
            if (noted == null || position >= 0) return position;

            if (SystemClock.elapsedRealtime() - noted.madeAt > PILL_START_TTL_MILLIS) return position;

            String videoId = command instanceof MessageLite message ? TapCommand.parse(message.toByteArray()).videoId
                    : null;
            if (videoId == null || !noted.names(videoId)) {
                Logger.printDebug(() -> "AudioFirst: pill start not for descriptor of " + videoId);
                return position;
            }

            Logger.printDebug(() -> "AudioFirst: pill start set to " + noted.millis + "ms for " + videoId);
            return noted.millis;
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: pill start failure", ex);
            return position;
        }
    }

    private static void logClick(@Nullable Tracked entry, String via, @Nullable Object current, String mode,
                                 String outcome) {
        if (!pillClickLog.allow(SystemClock.elapsedRealtime())) return;

        int items;
        synchronized (tracked) {
            items = tracked.size();
        }
        Logger.printDebug(() -> "AudioFirst: pill click item=" + (entry == null ? null : entry.videoId)
                + " via=" + via + " class=" + simpleName(current) + " tracked=" + (entry != null)
                + " known=" + items + " mode=" + mode + " outcome=" + outcome);
    }

    private static String simpleName(@Nullable Object object) {
        return object == null ? "null" : object.getClass().getSimpleName();
    }

    /** The pill's owner of the newest player view, which can navigate to an item. */
    @Nullable
    private static WeakReference<PillOwner> pillOwner;
    /** The queue whose start was looked at last (by identity), and the corrective start made last. */
    @Nullable
    private static WeakReference<List<?>> lastQueue;
    @Nullable
    private static String correctedVideoId;
    private static long correctedAt;
    private static long pillPressedAt;
    /** The position the pill's click noted for the navigation it makes, until it is too old to be that one's. */
    @Nullable
    private static PillStart pillStart;
    private static final long PILL_START_TTL_MILLIS = 5_000;

    private record PillStart(String videoId, String songId, long millis, long madeAt) {
        boolean names(String id) {
            return id.equals(videoId) || id.equals(songId);
        }
    }
    /** A corrective start that waits for the pill's owner to be built; its request is only so old. */
    @Nullable
    private static Pending pending;

    /** A corrective start to make as soon as the owner can navigate. */
    private record Pending(WeakReference<Object> item, String videoId, String songId, long onlineAt, long madeAt) {}

    /** Injection point: the pill's owner was built, so there is something to navigate with. */
    public static void onPillOwner(@Nullable Object owner) {
        try {
            if (!(owner instanceof PillOwner navigator)) return;

            Pending waiting;
            synchronized (tracked) {
                pillOwner = new WeakReference<>(navigator);
                waiting = pending;
            }
            Logger.printDebug(() -> "AudioFirst: pill owner captured, waiting corrective=" + (waiting != null));
            if (waiting != null) Utils.runOnMainThread(() -> navigateCorrectively(waiting));
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: pill owner failure", ex);
        }
    }

    /**
     * The queue the app has just built starts on the music video of its first song, because the player request of
     * the album's play button was answered online before the queue (and the copies) were looked at: restarts it on the
     * song's own watch endpoint, as the pill's press does, so the copy plays. See
     * {@link AudioFirstLogic#correctiveDecline}.
     *
     * @param tapStart The queue is the one a tapped row asked for, which has its own path.
     */
    private static void startCorrectively(List<?> items, int position, boolean tapStart) {
        Object current = position >= 0 && position < items.size() ? items.get(position) : null;
        StreamSwap.OnlineDecision online = StreamSwap.lastOnline();
        long now = SystemClock.elapsedRealtime();
        String decline;
        Tracked entry;
        synchronized (tracked) {
            entry = current == null ? null : find(current);
            List<?> handled = lastQueue == null ? null : lastQueue.get();
            boolean queueHandled = handled == items;
            if (entry != null) lastQueue = new WeakReference<>(items);

            decline = AudioFirstLogic.correctiveDecline(new AudioFirstLogic.QueueStart(entry != null, tracksItems(),
                    AudioFirst.liveMode(), online == null ? null : online.videoId(),
                    online == null ? Long.MAX_VALUE : now - online.at(), entry == null ? null : entry.videoId,
                    entry == null ? null : entry.playlistId, entry == null ? -1 : entry.playlistIndex, position,
                    queueHandled, tapStart, AudioFirst.tapsLeftAlone(),
                    pillPressedAt == 0 ? Long.MAX_VALUE : now - pillPressedAt,
                    correctedAt == 0 ? Long.MAX_VALUE : now - correctedAt, correctedVideoId));
            if (decline == null) {
                correctedVideoId = entry.videoId;
                correctedAt = now;
                pending = new Pending(new WeakReference<>(current), entry.videoId, entry.songId, online.at(), now);
            }
        }
        if (decline != null) {
            if (!AudioFirstLogic.isQuietDecline(decline)) {
                Logger.printDebug(() -> "AudioFirst: queue started on video " + entry.videoId + " (corrective declined:"
                        + decline + ")");
            }
            return;
        }

        // After the builder returns: the queue is not the app's yet inside it.
        Pending corrective;
        synchronized (tracked) {
            corrective = pending;
        }
        Utils.runOnMainThread(() -> navigateCorrectively(corrective));
        // When no owner has been built by then, the start is given up and says so.
        Utils.runOnMainThreadDelayed(() -> navigateCorrectively(corrective),
                AudioFirstLogic.CORRECTIVE_ONLINE_MILLIS + 500);
    }

    /** Sets the audio mode and navigates to the item's own watch endpoint, once the owner exists. */
    private static void navigateCorrectively(Pending corrective) {
        CrossfadeManager.ModeSwitch modeSwitch = null;
        String finishReason = "audio-first-corrective-failed";
        try {
            PillOwner owner;
            synchronized (tracked) {
                if (pending != corrective) return;

                owner = pillOwner == null ? null : pillOwner.get();
                long waited = SystemClock.elapsedRealtime() - corrective.onlineAt();
                if (owner == null && waited > AudioFirstLogic.CORRECTIVE_ONLINE_MILLIS) {
                    pending = null;
                    Logger.printDebug(() -> "AudioFirst: queue started on video " + corrective.videoId()
                            + " (corrective declined:no-navigator)");
                    return;
                }
                if (owner == null) return;

                pending = null;
            }
            Object item = corrective.item().get();
            if (item == null) return;

            AudioFirst.leaveTapsAlone();
            modeSwitch = CrossfadeManager.beginModeSwitch(corrective.videoId(), corrective.songId());
            String mode = AudioFirst.startAudioMode();
            expectStart(corrective.songId(), corrective.videoId());
            Logger.printDebug(() -> "AudioFirst: queue started on video " + corrective.videoId() + " -> song "
                    + corrective.songId() + " (corrective, " + (SystemClock.elapsedRealtime() - corrective.onlineAt())
                    + " ms after ONLINE, " + mode + ")");
            owner.rvxNavigate(item);
            finishReason = "audio-first-corrective-dispatch-finished";
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: corrective start failure", ex);
        } finally {
            CrossfadeManager.endModeSwitch(modeSwitch, finishReason);
        }
    }

    /** The newest tracked item whose song or video is one of the ids being played. */
    @Nullable
    private static Tracked findPlaying(String... ids) {
        synchronized (tracked) {
            for (int i = tracked.size() - 1; i >= 0; i--) {
                Tracked entry = tracked.get(i);
                if (entry.get() == null) continue;

                for (String id : ids) {
                    if (id != null && !id.isEmpty() && (id.equals(entry.songId) || id.equals(entry.videoId))) {
                        return entry;
                    }
                }
            }
        }
        return null;
    }

    /**
     * The row the user chose starts a new queue, whose items are not built yet: it starts at the item known by one of
     * these ids, see {@link #startIndex}.
     */
    static void expectStart(String... ids) {
        synchronized (tracked) {
            expectedStart = List.of(ids);
            expectedStartAt = SystemClock.elapsedRealtime();
        }
    }

    /**
     * Injection point: the app has built the items of a queue from a server response, and the position it starts at.
     * The response to a song's id marks no item as selected, so the app starts at the first item; the chosen row is
     * the one the user tapped or pressed the pill on.
     *
     * @return The position the queue starts at.
     */
    public static int startIndex(@Nullable List<?> items, int index) {
        try {
            if (items == null || !AudioFirst.supported()) return index;
            if (!tracksItems()) {
                releaseTrackedItems();
                return index;
            }

            ChosenStart chosen = awaitsStart() ? chosenStart(items, index) : new ChosenStart(index, false);
            startCorrectively(items, chosen.position(), chosen.listsRow());
            return chosen.position();
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: queue start failure", ex);
            return index;
        }
    }

    /** Whether the row a user chose awaits its queue, which has not expired. */
    private static boolean awaitsStart() {
        synchronized (tracked) {
            if (expectedStart == null) return false;

            if (SystemClock.elapsedRealtime() - expectedStartAt > AudioFirstLogic.ARM_TTL_MILLIS) {
                expectedStart = null;
                return false;
            }
            return true;
        }
    }

    /**
     * @param position The position the queue starts at.
     * @param listsRow The queue lists the row the user chose, so it is the queue that row asked for.
     */
    private record ChosenStart(int position, boolean listsRow) {}

    /** The position of the row the user chose in the queue just built, see {@link AudioFirstLogic#queueStart}. */
    private static ChosenStart chosenStart(List<?> items, int index) {
        List<String> wanted;
        List<List<String>> itemIds = new ArrayList<>(items.size());
        synchronized (tracked) {
            wanted = expectedStart;
            if (wanted == null) return new ChosenStart(index, false);

            for (Object item : items) {
                Tracked entry = item == null ? null : find(item);
                itemIds.add(entry == null ? List.of() : List.of(entry.videoId, entry.songId));
            }
        }

        int start = AudioFirstLogic.queueStart(index, itemIds, wanted);
        boolean listsRow = AudioFirstLogic.listsRow(itemIds, wanted);
        // The expectation ends with the first queue of tracked items: it is either the awaited one or another that
        // the tap did not ask for (a play button pressed meanwhile), which must not be taken for it.
        if (listsRow || itemIds.stream().anyMatch(ids -> !ids.isEmpty())) {
            synchronized (tracked) {
                expectedStart = null;
            }
            Logger.printDebug(() -> "AudioFirst: queue start " + index + " -> " + start + " of " + items.size()
                    + " items, wanted=" + wanted + (listsRow ? "" : " (not listed)"));
        }
        return new ChosenStart(start, listsRow);
    }

    /**
     * The feature went off while items were tracked (the setting is read where it is used, there is no listener): the
     * items are given back as the app built them, at the next place the extension is asked something.
     */
    private static void releaseTrackedItems() {
        synchronized (tracked) {
            if (tracked.isEmpty()) return;
        }
        onMode(AudioFirst.liveMode());
    }

    /** Called when the app sets its mode: every tracked item shows the renderer the new mode asks for. */
    static void onMode(String mode) {
        try {
            boolean enabled = tracksItems();
            List<Object> items = new ArrayList<>();
            List<Tracked> entries = new ArrayList<>();
            synchronized (tracked) {
                for (Iterator<Tracked> it = tracked.iterator(); it.hasNext(); ) {
                    Tracked entry = it.next();
                    Object item = entry.get();
                    if (item == null) {
                        it.remove();
                    } else {
                        items.add(item);
                        entries.add(entry);
                    }
                }
                // Switched off: the items are given back as the app built them and are not tracked any longer.
                if (!enabled) tracked.clear();
            }
            for (int i = 0; i < items.size(); i++) {
                Item queueItem = (Item) items.get(i);
                Tracked entry = entries.get(i);
                Object wanted = AudioFirstLogic.showsSong(enabled, mode, true) ? entry.song : entry.video;
                if (queueItem.rvxRenderer() == wanted) continue;

                queueItem.rvxReplace(wanted);
                if (enabled) logView(entry, mode, wanted == entry.song ? "song" : "original");
            }
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: queue item mode failure", ex);
        }
    }

    /** Whether new items are tracked and shown as songs: the setting is on and the stream copies are in effect. */
    private static boolean tracksItems() {
        return AudioFirstLogic.tracksItems(Settings.START_DOWNLOADED_IN_AUDIO.get(), StreamSwap.supported());
    }

    @Nullable
    private static Tracked track(Object item, Object shown) {
        if (!(shown instanceof MessageLite message) || !(shown instanceof Renderer rebuildable)) return null;

        DownloadedMarkers.warmUp();
        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        // Without a single stream copy no item is one to track: nothing of the renderer is read for it.
        if (registry == null || !registry.hasTracks()) return null;

        byte[] bytes = message.toByteArray();
        TapCommand row = TapCommand.parse(bytes);
        if (!row.isWatch() || row.videoId == null || row.videoId.isEmpty()) return null;

        // A row whose music video has a video copy is not retargeted: the copy answers it, and the app's own pill
        // switches Song and Video on the one stream.
        if (AudioFirstLogic.keepsVideoItem(row.videoId, VideoCopyStore::has)) {
            logDecision(row, () -> "kept:video-copy", null);
            return null;
        }

        AudioFirstLogic.Arm arm = AudioFirstLogic.chooseArmLazily(true, List.of(row.videoId),
                () -> registry.sourceTracks(registry.findSource(bytes)), row.index, row.hasParams,
                registry::isDownloaded);
        if (arm == null) {
            logDecision(row, () -> "declined:no-copy", null);
            return null;
        }
        if (!AudioFirstLogic.namesTheRow(arm.rule(), arm.videoId(), row.videoId, registry::isDownloaded)) {
            logDecision(row, () -> "declined:not-the-row(" + arm.rule() + ")", null);
            return null;
        }

        CommandRewrite.RendererResult result = CommandRewrite.retargetRenderer(bytes, row.videoId, arm.videoId(),
                true);
        if (result == null || !result.complete()) {
            logDecision(row, () -> "declined:unreadable(" + (result == null ? "malformed" : result.describe()) + ")",
                    null);
            return null;
        }

        Object song = rebuildable.rvxWithBytes(result.renderer());
        if (song == null) return null;

        Tracked created = new Tracked(item, shown, song, row.videoId, arm.videoId(), row.playlistId, row.index);
        synchronized (tracked) {
            tracked.add(created);
        }
        logDecision(row, () -> "tracked(" + arm.rule() + "," + result.describe() + ")", arm.videoId());
        return created;
    }

    private static void show(Item item, Tracked entry, String mode) {
        item.rvxReplace(entry.song);
        logView(entry, mode, "song");
    }

    @Nullable
    private static Tracked find(Object item) {
        for (Iterator<Tracked> it = tracked.iterator(); it.hasNext(); ) {
            Tracked entry = it.next();
            Object known = entry.get();
            if (known == null) {
                it.remove();
            } else if (known == item) {
                return entry;
            }
        }
        return null;
    }

    private static void logDecision(TapCommand row, Supplier<String> outcome, @Nullable String songId) {
        if (!log.allow(SystemClock.elapsedRealtime())) return;

        Logger.printDebug(() -> "AudioFirst: queue item view video=" + row.videoId + " -> song=" + songId
                + " mode=" + AudioFirst.liveMode() + " playlist=" + row.playlistId + " index=" + row.index
                + " outcome=" + outcome.get());
    }

    private static void logView(Tracked entry, String mode, String outcome) {
        if (!log.allow(SystemClock.elapsedRealtime())) return;

        Logger.printDebug(() -> "AudioFirst: queue item view video=" + entry.videoId + " -> song=" + entry.songId
                + " mode=" + mode + " outcome=" + outcome);
    }
}
