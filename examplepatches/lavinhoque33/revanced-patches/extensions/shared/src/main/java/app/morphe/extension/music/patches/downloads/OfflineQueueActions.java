/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import com.google.common.util.concurrent.ListenableFuture;
import com.google.protobuf.MessageLite;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.music.patches.downloads.NativeDownloads.Command;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Substitutes only the metadata future of a populated local queue's native enqueue. */
@SuppressWarnings("unused")
public final class OfflineQueueActions {
    public interface Carrier {
        @Nullable Object rvxQueueTicket();
        void rvxQueueTicket(Object value);
    }

    /** Reads the stock live local queue; implementations do not cache a model across replacements. */
    public interface Owner {
        @Nullable Object rvxOfflineQueue();
    }

    public interface Queue {
        int rvxOfflineCursor();
        int rvxOfflineSize();
        Object rvxOfflineItem(int index);
        String rvxOfflineVideoId(Object occurrence);
    }

    public interface TapSource {
        @Nullable Object rvxBoundQueueRow();
        Object rvxBoundQueueNavigator();
    }

    public interface Row {
        @Nullable Object rvxOfflineInsertion();
        void rvxOfflineInsertion(Object queue);
    }

    public interface Lookup {
        Object rvxRestoreSong(byte[] renderer);
        Object rvxOfflineResult(List<?> rows);
        ListenableFuture<?> rvxStockQueueLookup(Object command, Executor executor);
    }

    private record PlayerCommand(int connectivity) {}

    private record Ticket(Owner owner, Queue queue, OfflineQueueCommand command, @Nullable Object tag,
                          int connectivity) {}

    record Insertion(WeakReference<Queue> queue, WeakReference<Owner> owner, int connectivity,
                     @Nullable WeakReference<Object> playerOccurrence) {}

    /** Selected occurrence and an ordered snapshot of actual native rows, never a second mutable queue. */
    record Selection(Queue queue, Object occurrence, int index, int connectivity) {}

    record Continuation(Selection selected, List<?> rows, int cursor, Object playbackSelection, Object request,
                        int connectivity) {}

    private static final String TAG = "com.google.android.libraries.youtube.innertube.endpoint.tag";
    private static final int MENU_WRAPPER = 20;
    private static final int MENU_RENDERER = 66_439_850;
    private static final AtomicInteger connectivity = new AtomicInteger();

    private OfflineQueueActions() {}

    /** The patch flips this only after the resolver, factory and replay commit ABI have all been installed. */
    public static boolean supported() {
        return false;
    }

    /** The player passes its own native storage and exact current occurrence, even before any navigation. */
    static boolean available(Object nativeStorage, String videoId, Object occurrence) {
        return offline() && mayHold(videoId) && nativeStorage instanceof Owner owner
                && owner.rvxOfflineQueue() instanceof Queue queue
                && currentOccurrence(queue, occurrence) && videoId.equals(queue.rvxOfflineVideoId(occurrence));
    }

    /** Recognize synthesized commands before dispatch; only the actual queue resolver admits them. */
    static boolean markPlayerCommand(Object command) {
        if (!(command instanceof Carrier carrier) || !offline()) return false;
        carrier.rvxQueueTicket(new PlayerCommand(connectivity.get()));
        return true;
    }

    @Nullable
    private static PlayerCommand playerCommand(Object command) {
        return command instanceof Carrier carrier && carrier.rvxQueueTicket() instanceof PlayerCommand player
                ? player : null;
    }

    private static boolean offline() {
        return supported() && OfflineReplay.enabled() && LocalDownloadManager.downloadMode().streamCopy()
                && !Utils.isInternetReachable();
    }

    private static boolean mayHold(String videoId) {
        if (!RawAudioFiles.validId(videoId)) return false;
        if (OfflineReplay.holds(videoId)) return true;

        var markers = DownloadedMarkers.loadedRegistry();
        if (markers != null && OfflineReplay.holds(markers.canonicalId(videoId))) return true;
        return OfflineReplayLogic.videoOf(videoId, VideoCopyStore.pairsIfLoaded()) != null;
    }

    private static boolean populated(Queue queue) {
        synchronized (queue) {
            int cursor = queue.rvxOfflineCursor();
            return cursor >= 0 && cursor < queue.rvxOfflineSize();
        }
    }

    private static boolean currentOccurrence(Queue queue, @Nullable Object occurrence) {
        if (occurrence == null) return false;
        synchronized (queue) {
            int cursor = queue.rvxOfflineCursor();
            return cursor >= 0 && cursor < queue.rvxOfflineSize() && queue.rvxOfflineItem(cursor) == occurrence;
        }
    }

    static void reconnected() {
        connectivity.incrementAndGet();
    }

    /** The marked player command must not enter the empty-queue or other nonlocal stock arms. */
    @Nullable
    public static Object checkPlayerCommand(Object manager, Object original, @Nullable Map<?, ?> context) {
        PlayerCommand player = playerCommand(original);
        if (player == null) return original;
        Object occurrence = context == null ? null : context.get(TAG);
        return player.connectivity() == connectivity.get() && offline() && manager instanceof Owner owner
                && owner.rvxOfflineQueue() instanceof Queue queue && currentOccurrence(queue, occurrence)
                ? original : null;
    }

    /** The non-Cast arm owns local insertion; a marked command can never move a Cast queue. */
    @Nullable
    public static Object castCommand(Object original) {
        return playerCommand(original) == null ? original : null;
    }

    /** Called only inside the resolver's non-Cast, nonempty branch; its native fast path is still next. */
    @Nullable
    public static Object prepare(Object manager, Object original, @Nullable Map<?, ?> context) {
        PlayerCommand player = playerCommand(original);
        if (!(manager instanceof Owner owner) || !(original instanceof Command command) || !offline()) {
            return player == null ? original : null;
        }
        Object tag = context == null ? null : context.get(TAG);

        try {
            byte[] bytes = command.toByteArray();
            OfflineQueueCommand target = OfflineQueueCommand.parse(bytes);
            if (target == null) return player == null ? original : null;
            if (target.playerOnly() != (player != null)) return target.playerOnly() ? null : original;

            // The exact populated non-Cast resolver arm owns this manager, independently of navigation.
            if (!mayHold(target.videoId()) || !(owner.rvxOfflineQueue() instanceof Queue queue)
                    || !populated(queue)) return player == null ? original : null;
            int generation = connectivity.get();
            if (player != null && (player.connectivity() != generation || !currentOccurrence(queue, tag)
                    || !target.videoId().equals(queue.rvxOfflineVideoId(tag)))) {
                return null;
            }

            // A dedicated Root carries this invocation's ticket. The original can be shared by menus and threads.
            Object copy = command.rvxWithBytes(bytes);
            if (copy != original && copy instanceof Carrier carrier) {
                carrier.rvxQueueTicket(new Ticket(owner, queue, target, tag, generation));
                return copy;
            }
        } catch (Exception | LinkageError failure) {
            Logger.printDebug(() -> "OfflineQueueActions: could not scope enqueue (" +
                    failure.getClass().getSimpleName() + ")");
        }
        return player == null ? original : null;
    }

    /** Jam may wrap the stock enqueue; a ticket can only come from the resolver's local branch. */
    public static boolean localTicket(Object manager, Object command) {
        return playerCommand(command) != null || (command instanceof Carrier carrier
                && carrier.rvxQueueTicket() instanceof Ticket ticket && ticket.owner() == manager
                && (ticket.command().playerOnly() || offline()));
    }

    /** Replaces the sole lookup call inside stock enqueue; callback and insertion still belong to Music. */
    public static ListenableFuture<?> lookup(Object manager, Lookup client, Object command, Executor executor) {
        if (playerCommand(command) != null) {
            // The click was admitted, but stock took an arm other than the populated local queue.
            ReplayFuture declined = new ReplayFuture();
            declined.cancel(false);
            return declined;
        }
        if (!(command instanceof Carrier carrier) || !(carrier.rvxQueueTicket() instanceof Ticket ticket)
                || ticket.owner() != manager) {
            return client.rvxStockQueueLookup(command, executor);
        }

        ReplayFuture reply = new ReplayFuture();
        Utils.runOnBackgroundThread(() -> {
            if (reply.isDone()) return;
            try {
                if (!stillOwns(ticket)) {
                    reply.cancel(false);
                    return;
                }
                OfflineWatchNext.Item stored = currentOffline(ticket) ? storedRow(ticket.command().videoId()) : null;
                if (stored == null || !currentOffline(ticket)) {
                    finishDeclined(ticket, reply, client, command, executor);
                    return;
                }
                byte[] watch = watchFor(ticket.command(), stored);
                byte[] menu = capturedMenu(ticket.tag(), ticket.command().videoId(), stored.videoId());
                Object item = client.rvxRestoreSong(OfflineWatchNext.queueRow(stored, watch, menu));
                if (!(item instanceof Row row)) throw new IOException("native row has no occurrence marker");
                Object result = client.rvxOfflineResult(List.of(item));
                if (!stillOwns(ticket)) {
                    reply.cancel(false);
                } else if (!currentOffline(ticket)) {
                    finishDeclined(ticket, reply, client, command, executor);
                } else {
                    WeakReference<Object> occurrence = ticket.command().playerOnly()
                            ? new WeakReference<>(ticket.tag()) : null;
                    row.rvxOfflineInsertion(new Insertion(
                            new WeakReference<>(ticket.queue()), new WeakReference<>(ticket.owner()),
                            ticket.connectivity(), occurrence));
                    reply.set(result);
                }
            } catch (Exception | LinkageError failure) {
                reply.setException(failure);
                Logger.printDebug(() -> "OfflineQueueActions: local native reply failed (" +
                        failure.getClass().getSimpleName() + ")");
            }
        });
        return reply;
    }

    private static boolean stillOwns(Ticket ticket) {
        Queue queue = ticket.queue();
        return ticket.owner().rvxOfflineQueue() == queue && (ticket.command().playerOnly()
                ? currentOccurrence(queue, ticket.tag()) : populated(queue));
    }

    private static boolean currentOffline(Ticket ticket) {
        return connectivity.get() == ticket.connectivity() && offline();
    }

    /** The native completion executor may run after the target queue has already been replaced. */
    public static boolean allowsReply(Object manager, @Nullable List<?> items) {
        if (items == null || items.size() != 1 || !(items.get(0) instanceof Row row)
                || !(row.rvxOfflineInsertion() instanceof Insertion insertion)) return true;

        Queue live = insertion.queue().get();
        if (live == null || !offline() || insertion.connectivity() != connectivity.get()
                || !(manager instanceof Owner owner) || owner.rvxOfflineQueue() != live) return false;

        WeakReference<Object> occurrence = insertion.playerOccurrence();
        boolean allowed = occurrence == null ? populated(live) : currentOccurrence(live, occurrence.get());
        if (allowed) Logger.printDebug(() -> "OfflineQueueActions: typed reply admitted to native insertion");
        return allowed;
    }

    private static void finishDeclined(Ticket ticket, ReplayFuture reply, Lookup client, Object command,
                                       Executor executor) {
        if (ticket.command().playerOnly() || (ticket.connectivity() != connectivity.get() && offline())) {
            reply.cancel(false);
        } else {
            forwardStock(reply, client.rvxStockQueueLookup(command, executor));
        }
    }

    private static void forwardStock(ReplayFuture reply, ListenableFuture<?> stock) {
        stock.addListener(() -> {
            if (reply.isDone()) return;
            try {
                reply.set(stock.get());
            } catch (CancellationException cancelled) {
                reply.cancel(false);
            } catch (ExecutionException failed) {
                reply.setException(failed.getCause());
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                reply.setException(interrupted);
            }
        }, Runnable::run);
    }

    @Nullable
    private static OfflineWatchNext.Item storedRow(String original) throws IOException {
        OfflineWatchNext.Item exact = videoRow(original, null);
        if (exact != null) return exact;

        exact = audioRow(original);
        if (exact != null) return exact;

        // No arbitrary metadata fallback: only a committed song/video pair or stored audio alias can change ID.
        Map<String, String> pairs = VideoCopyStore.pairs();
        String song = pairs.get(original);
        if (song == null) song = RawAudioStore.aliases().get(original);
        if (song == null) song = original;
        if (!original.equals(song)) {
            OfflineWatchNext.Item alias = audioRow(song);
            if (alias != null) return alias;
        }
        String video = OfflineReplayLogic.videoOf(song, pairs);
        return video == null || original.equals(video) ? null : videoRow(video, song);
    }

    @Nullable
    private static OfflineWatchNext.Item audioRow(String id) throws IOException {
        OfflineCopyFiles.Stored saved = OfflineCopyStore.find(id);
        if (saved == null || !id.equals(saved.metadata().videoId())) return null;
        RawAudioFiles.Entry raw = RawAudioStore.find(id);
        if (raw == null || raw.tiedToNativeTrack()) return null;

        PlayerResponse player = PlayerResponse.parseFrom(saved.response());
        return StreamSwapLogic.savedAudio(id, raw, player, player) == null ? null
                : localArtwork(saved.metadata(), id, CommandRewrite.TYPE_ATV);
    }

    @Nullable
    private static OfflineWatchNext.Item videoRow(String id, @Nullable String expectedSong) throws IOException {
        VideoCopyFiles.Entry copy = VideoCopyStore.find(id);
        if (copy == null || !id.equals(copy.videoId())
                || (expectedSong != null && !expectedSong.equals(copy.songId()))) return null;
        byte[] response = VideoCopyStore.response(id);
        if (response == null) return null;

        PlayerResponse player = PlayerResponse.parseFrom(response);
        var details = player.getVideoDetails();
        if (!id.equals(details.getVideoId())
                || VideoCopyLogic.stored(player, copy.video().itag(), copy.audio().itag()) == null) return null;
        OfflineCopyMetadata metadata = OfflineCopyStore.metadataOf(copy.songId());
        return metadata != null && copy.songId().equals(metadata.videoId())
                ? localArtwork(metadata, id, CommandRewrite.TYPE_OMV)
                : new OfflineWatchNext.Item(id, details.getTitle(), details.getOwnerChannelName(), "",
                        copy.durationMs(), OfflineCopyStore.coverUrl(id, null), CommandRewrite.TYPE_OMV);
    }

    private static OfflineWatchNext.Item localArtwork(OfflineCopyMetadata copy, String id, int type) {
        return new OfflineWatchNext.Item(id, copy.title(), copy.artist(), copy.album(), copy.durationMs(),
                OfflineCopyStore.coverUrl(copy.videoId(), null), type);
    }

    private static byte[] watchFor(OfflineQueueCommand original, OfflineWatchNext.Item stored) {
        String id = stored.videoId();
        if (id.equals(original.videoId()) && original.watch() != null) return original.watch();

        byte[] music = new ProtoWriter().int32(CommandRewrite.MUSIC_VIDEO_TYPE_FIELD, stored.musicVideoType())
                .toByteArray();
        byte[] config = new ProtoWriter().message(CommandRewrite.MUSIC_CONFIG_FIELD, music).toByteArray();
        byte[] watch = new ProtoWriter().string(CommandRewrite.VIDEO_ID_FIELD, id)
                .message(CommandRewrite.SUPPORTED_CONFIG_FIELD, config).toByteArray();
        return new ProtoWriter().message(CommandRewrite.WATCH_ENDPOINT_FIELD, watch).toByteArray();
    }

    @Nullable
    private static byte[] capturedMenu(@Nullable Object tag, String original, String playable) {
        Object renderer = tag instanceof PlayerFallback.QueueRow row ? row.rvxQueueRenderer() : tag;
        if (!original.equals(playable) || !(renderer instanceof MessageLite proto)) return null;
        try {
            byte[] bytes = proto.toByteArray();
            byte[] id = NativeDownloads.fieldBytes(bytes, OfflineWatchNext.TRACK_VIDEO_ID_FIELD);
            byte[] watch = NativeDownloads.fieldBytes(bytes, OfflineWatchNext.TRACK_ENDPOINT_FIELD);
            if (id == null || watch == null || !original.equals(new String(id, StandardCharsets.UTF_8))) {
                return null;
            }
            var target = OfflineReplayLogic.onlineWatchOf(watch);
            if (target == null) target = OfflineReplayLogic.offlineWatchOf(watch);
            if (target == null || !original.equals(target.videoId())) return null;

            byte[] wrapper = NativeDownloads.fieldBytes(bytes, MENU_WRAPPER);
            return wrapper == null ? null : NativeDownloads.fieldBytes(wrapper, MENU_RENDERER);
        } catch (IOException malformed) {
            return null;
        }
    }

    /** Before the stock wrapper can mistake an edited row's Watch for an external playlist launch. */
    public static boolean onQueueRowClick(Object source) {
        if (!(source instanceof TapSource presenter) || !offline()) return false;
        Object row = presenter.rvxBoundQueueRow();
        if (row == null) return false;

        Object owner = presenter.rvxBoundQueueNavigator();
        Selection selected = select(owner, row, -1);
        return selected != null && PlayerFallback.playEditedQueueRow(owner, selected);
    }

    @Nullable
    static Selection select(Object owner, Object row, int index) {
        if (!offline() || !(owner instanceof Owner access) || !(access.rvxOfflineQueue() instanceof Queue queue)) {
            return null;
        }
        synchronized (queue) {
            int cursor = nativeOccurrenceIndex(queue, row, index);
            if (cursor < 0) return null;
            int size = queue.rvxOfflineSize();
            for (int i = 0; i < size; i++) {
                if (queue.rvxOfflineItem(i) instanceof Row inserted
                        && inserted.rvxOfflineInsertion() instanceof Insertion edit && edit.queue().get() == queue) {
                    return new Selection(queue, row, cursor, connectivity.get());
                }
            }
        }
        return null;
    }

    /** Caller holds the native monitor. An unindexed presenter may find only its own bound occurrence. */
    static int nativeOccurrenceIndex(Queue queue, Object occurrence, int index) {
        if (occurrence == null) return -1;
        int count = queue.rvxOfflineSize();
        if (index >= 0) return index < count && queue.rvxOfflineItem(index) == occurrence ? index : -1;
        for (int i = 0; i < count; i++) {
            if (queue.rvxOfflineItem(i) == occurrence) return i;
        }
        return -1;
    }

    /** Runs inside the native lane monitor; the model still owns cursor writes and notifications. */
    public static int nativeCommitIndex(Object model, List<?> lane, Object occurrence) {
        Selection selected = PlayerFallback.queueSelectionAtCommit(model, occurrence);
        if (selected == null || !offline()) return lane.indexOf(occurrence);
        return nativeCommitIndex(model, lane, occurrence, selected, connectivity.get());
    }

    static int nativeCommitIndex(Object model, List<?> lane, Object occurrence,
                                 @Nullable Selection selected, int epoch) {
        if (selected == null || selected.queue() != model || selected.occurrence() != occurrence
                || selected.connectivity() != epoch
                || nativeOccurrenceIndex(selected.queue(), occurrence, selected.index()) < 0) {
            return lane.indexOf(occurrence);
        }
        // The native factory assigns unique identities even when two Watch descriptors compare equal.
        for (int i = 0, size = lane.size(); i < size; i++) {
            if (lane.get(i) == occurrence) return i;
        }
        // This occurrence is still live, but in another lane. Let the native commit try that lane.
        return -1;
    }

    /** Only the native current-row publisher treats a live offline insertion as a distinct occurrence. */
    public static boolean samePublishedOccurrence(Object model, @Nullable Object previous, @Nullable Object current) {
        boolean distinguish = distinctEditedOccurrences(model, previous, current, connectivity.get()) && offline();
        return samePublishedOccurrence(previous, current, distinguish);
    }

    static boolean samePublishedOccurrence(@Nullable Object previous, @Nullable Object current, boolean distinguish) {
        return previous == current || !distinguish && previous != null && previous.equals(current);
    }

    static boolean distinctEditedOccurrences(Object model, @Nullable Object previous, @Nullable Object current,
                                              int epoch) {
        return previous != null && current != null && previous != current
                && (liveInsertion(model, previous, epoch) || liveInsertion(model, current, epoch));
    }

    private static boolean liveInsertion(Object model, Object occurrence, int epoch) {
        if (!(occurrence instanceof Row row) || !(row.rvxOfflineInsertion() instanceof Insertion insertion)
                || insertion.queue().get() != model || insertion.connectivity() != epoch) return false;
        Owner owner = insertion.owner().get();
        return owner != null && owner.rvxOfflineQueue() == model;
    }

    static boolean ownsSelectedOccurrence(Object owner, Selection selected) {
        return offline() && ownsLiveOccurrence(owner, selected);
    }

    static boolean ownsLiveOccurrence(Object owner, Selection selected) {
        Queue queue = selected.queue();
        if (!(owner instanceof Owner access) || selected.connectivity() != connectivity.get()
                || access.rvxOfflineQueue() != queue) return false;
        synchronized (queue) {
            return nativeOccurrenceIndex(queue, selected.occurrence(), selected.index()) >= 0;
        }
    }

    @Nullable
    static Continuation continuation(Selection selected, Object playbackSelection, Object request) {
        if (!offline() || selected.connectivity() != connectivity.get()) return null;
        Queue queue = selected.queue();
        synchronized (queue) {
            int cursor = selected.index();
            int count = queue.rvxOfflineSize();
            if (cursor < 0 || cursor >= count || queue.rvxOfflineItem(cursor) != selected.occurrence()) return null;
            List<Object> rows = new ArrayList<>(count);
            for (int index = 0; index < count; index++) rows.add(queue.rvxOfflineItem(index));
            return new Continuation(selected, rows, cursor, playbackSelection, request, selected.connectivity());
        }
    }

    /** Called under the native model's monitor by the R9 metadata-only splice. */
    static boolean retains(Object queue, Continuation reply) {
        Queue live = reply.selected().queue();
        if (live != queue || live != PlayerFallback.localQueue() || !offline()
                || reply.connectivity() != connectivity.get()
                || !PlayerFallback.ownsQueueContinuation(reply.playbackSelection(), reply.request())) return false;
        boolean same = sameRows(live, reply.rows(), reply.cursor());
        if (same) Logger.printDebug(() -> "OfflineQueueActions: retained edited native queue on selection");
        return same;
    }

    static boolean sameRows(Queue live, List<?> expected, int cursor) {
        if (cursor < 0 || cursor >= expected.size()
                || live.rvxOfflineCursor() != cursor || live.rvxOfflineSize() != expected.size()) return false;
        for (int index = 0; index < expected.size(); index++) {
            if (live.rvxOfflineItem(index) != expected.get(index)) return false;
        }
        return true;
    }
}
