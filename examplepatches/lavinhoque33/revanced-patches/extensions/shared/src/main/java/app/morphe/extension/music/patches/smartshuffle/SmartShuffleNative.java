/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import com.google.protobuf.CodedOutputStream;

import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.BiConsumer;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;

import app.morphe.extension.music.patches.jam.YouTubeMusicBridge.QueueAccess;
import app.morphe.extension.music.patches.jam.YouTubeMusicBridge.MetadataAccess;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Smart-owned resolution. Native descriptors, queue filtering and mutation notifications remain native. */
@SuppressWarnings("unused")
public final class SmartShuffleNative {
    public record Item(long occurrenceId, String videoId) implements SmartShufflePolicy.Occurrence {}
    public record Snapshot(long generation, int currentIndex, Item[] items, boolean local, String playlistId) {}

    public interface Occurrence {
        long smartOccurrenceId();
    }

    public interface Access extends QueueAccess {
        Future<?> smartResolve(byte[] command, List<String> videoIds);
        void smartInsert(Object response, int index);
        String smartPlaylistId(Object item);
        Object smartStorage();
    }

    public interface CommandAccess {
        void smartDispatch(byte[] command);
    }

    /** The current MusicActivity's native provider, not the last resolver seen on another command. */
    public interface ActivityAccess extends CommandAccess {
        Object smartCurrentDispatcher();
    }

    private static volatile WeakReference<Access> owner = new WeakReference<>(null);
    private static volatile WeakReference<CommandAccess> dispatcher = new WeakReference<>(null);
    private static final AtomicLong cancellations = new AtomicLong();
    private static final Set<Future<?>> pending = new HashSet<>();
    private static final Object stateLock = new Object();
    private static final Generation state = new Generation();

    private SmartShuffleNative() {}

    public static boolean supported() {
        return false;
    }

    public static void capture(Access access) {
        if (owner.get() == access) return;
        cancelPending();
        Logger.printDebug(() -> "Smart Shuffle native owner changed; queue generation reset");
        owner = new WeakReference<>(access);
        synchronized (stateLock) {
            state.reset();
        }
        changed();
    }

    public static void captureDispatcher(CommandAccess access) {
        dispatcher = new WeakReference<>(access);
    }

    /** Installed only at committed native replaceQueueContents/model replacement operations. */
    public static void replaced(Object storage) {
        Access access = owner.get();
        if (access == null || access.smartStorage() != storage) return;
        cancelPending();
        Logger.printDebug(() -> "Smart Shuffle native replacement committed; queue generation reset");
        synchronized (stateLock) {
            state.reset();
        }
        changed();
    }

    /** Called from native storage/display notifications, never an activation boundary. */
    public static void changed() {
        SmartShuffleManager.onQueueChanged();
    }

    public static long occurrenceId(Object nativeItem) {
        return nativeItem instanceof Occurrence ? ((Occurrence) nativeItem).smartOccurrenceId() : Long.MIN_VALUE;
    }

    public static void snapshot(Consumer<Snapshot> callback) {
        Access access = owner.get();
        if (access == null) {
            callback.accept(new Snapshot(-1, -1, new Item[0], false, ""));
            return;
        }
        WeakReference<Access> reference = new WeakReference<>(access);
        access.patch_jamExecutor().execute(() -> {
            Access current = reference.get();
            Snapshot snapshot = null;
            try {
                if (current != null && owner.get() == current) snapshot = read(current);
            } catch (Exception exception) {
                Logger.printException(() -> "Smart Shuffle queue snapshot failed", exception);
            }
            callback.accept(snapshot != null ? snapshot : new Snapshot(-1, -1, new Item[0], false, ""));
        });
    }

    private static Snapshot read(Access access) {
        Object[] nativeItems = access.patch_jamItems();
        Item[] items = new Item[nativeItems.length];
        for (int index = 0; index < items.length; index++) {
            items[index] = new Item(occurrenceId(nativeItems[index]), access.patch_jamVideoId(nativeItems[index]));
        }
        int current = access.patch_jamCurrent();
        String playlist = "";
        for (Object nativeItem : nativeItems) {
            String source = access.smartPlaylistId(nativeItem);
            if (source != null && !source.isEmpty()) {
                playlist = source;
                break;
            }
        }
        synchronized (stateLock) {
            return new Snapshot(state.update(items, playlist), current, items, access.patch_jamLocal(), playlist);
        }
    }


    public static void insert(long generation, long anchorOccurrenceId, List<String> videoIds,
                              BiConsumer<Item[], Throwable> callback) {
        Access access = owner.get();
        if (access == null || videoIds.isEmpty()) {
            Logger.printDebug(() -> "Smart Shuffle native resolve unavailable generation=" + generation
                    + " anchor=" + anchorOccurrenceId + " hasOwner=" + (access != null)
                    + " requestedCount=" + videoIds.size());
            callback.accept(new Item[0], new IllegalStateException("Native queue is unavailable or input is empty"));
            return;
        }
        List<String> requested = List.copyOf(videoIds);
        long cancellation = cancellations.get();
        WeakReference<Access> reference = new WeakReference<>(access);
        access.patch_jamExecutor().execute(() -> {
            Access current = reference.get();
            if (current == null || owner.get() != current) {
                Logger.printDebug(() -> "Smart Shuffle native resolve owner stale generation=" + generation
                        + " cancellation=" + cancellation + " anchor=" + anchorOccurrenceId);
                callback.accept(new Item[0], new CancellationException("Native owner changed"));
                return;
            }
            Future<?> future;
            try {
                int index = requireAnchor(read(current), generation, anchorOccurrenceId, cancellation);
                Logger.printDebug(() -> "Smart Shuffle native resolve requested generation=" + generation
                        + " cancellation=" + cancellation + " anchor=" + anchorOccurrenceId
                        + " targetIndex=" + (index + 1) + " videos=" + requested);
                future = current.smartResolve(playNext(requested.get(0)), requested);
                synchronized (pending) {
                    if (cancellations.get() != cancellation) {
                        future.cancel(false);
                        throw new CancellationException("Smart Shuffle was cancelled");
                    }
                    pending.add(future);
                }
            } catch (Exception exception) {
                debugFailure("resolve request", generation, anchorOccurrenceId, cancellation, exception);
                callback.accept(new Item[0], exception);
                return;
            }
            // Future.get runs only on the extension worker, never the UI/native queue executor.
            Utils.runOnBackgroundThread(() -> resolve(reference, future, generation, anchorOccurrenceId,
                    cancellation, callback));
        });
    }

    private static void resolve(WeakReference<Access> reference, Future<?> future, long generation, long anchor,
                                long cancellation, BiConsumer<Item[], Throwable> callback) {
        Object response = null;
        Throwable failure = null;
        try {
            response = future.get();
        } catch (Exception exception) {
            failure = exception;
        } finally {
            synchronized (pending) {
                pending.remove(future);
            }
        }
        Access access = reference.get();
        if (access == null) return;
        Object resolved = response;
        Throwable error = failure;
        Logger.printDebug(() -> "Smart Shuffle native resolve completed generation=" + generation
                + " cancellation=" + cancellation + " anchor=" + anchor
                + " responsePresent=" + (resolved != null) + " failed=" + (error != null));
        access.patch_jamExecutor().execute(() -> {
            Access current = reference.get();
            if (current == null) return;
            Item[] committed = new Item[0];
            Throwable resultError = error;
            try {
                if (resultError != null) throw new IllegalStateException("Native resolution failed", resultError);
                if (owner.get() != current) throw new CancellationException("Native owner changed");
                Snapshot before = read(current);
                int index = requireAnchor(before, generation, anchor, cancellation);
                Logger.printDebug(() -> "Smart Shuffle native commit generation=" + generation
                        + " cancellation=" + cancellation + " anchor=" + anchor + " targetIndex=" + (index + 1));
                debugResponse(current, resolved);
                current.smartInsert(resolved, index + 1);
                Snapshot after = read(current);
                committed = insertedItems(before.items(), after.items());
                debugCommitted(current, after, committed, generation, cancellation);
            } catch (Exception exception) {
                resultError = exception;
                debugFailure("commit", generation, anchor, cancellation, exception);
            }
            callback.accept(committed, resultError);
            changed();
        });
    }

    /** The response is passed unchanged to native code; only safe, own-item projections are logged. */
    private static void debugResponse(Access access, Object response) {
        Logger.printDebug(() -> {
            try {
                return "Smart Shuffle native metadata provenance=music/get_queue response items="
                        + describeNativeItems(access, access.patch_jamMenuItems(response));
            } catch (RuntimeException exception) {
                return "Smart Shuffle native response metadata unavailable=" + exception.getClass().getSimpleName();
            }
        });
    }

    private static void debugCommitted(Access access, Snapshot snapshot, Item[] inserted,
                                       long generation, long cancellation) {
        Logger.printDebug(() -> {
            StringBuilder message = new StringBuilder("Smart Shuffle native committed generation=")
                    .append(generation).append(" cancellation=").append(cancellation)
                    .append(" currentIndex=").append(snapshot.currentIndex());
            Object[] nativeItems;
            try {
                nativeItems = access.patch_jamItems();
            } catch (RuntimeException exception) {
                return message.append(" metadataUnavailable=").append(exception.getClass().getSimpleName()).toString();
            }
            for (Item item : inserted) {
                int index = indexOf(snapshot.items(), item.occurrenceId());
                message.append(" index=").append(index).append(" upcomingOrdinal=")
                        .append(snapshot.currentIndex() < 0 ? -1 : index - snapshot.currentIndex())
                        .append(" occurrence=").append(item.occurrenceId()).append(" video=").append(item.videoId());
                if (index >= 0 && index < nativeItems.length) {
                    message.append(" ownMetadata=").append(describeNativeItem(access, nativeItems[index]));
                }
            }
            return message.toString();
        });
    }

    private static String describeNativeItems(Access access, Object[] items) {
        StringBuilder message = new StringBuilder();
        for (Object item : items) message.append('[').append(describeNativeItem(access, item)).append(']');
        return message.toString();
    }

    private static String describeNativeItem(Access access, Object item) {
        if (item == null) return "null";
        try {
            String title = "unavailable";
            String artist = "unavailable";
            if (item instanceof MetadataAccess metadata) {
                title = metadata.patch_jamTitle();
                artist = metadata.patch_jamArtist();
            }
            // Never log raw renderers/descriptors: they can contain private request/tracking tokens.
            return "nativeObject=" + System.identityHashCode(item) + " occurrence=" + occurrenceId(item)
                    + " video=" + access.patch_jamVideoId(item) + " title=" + title + " artist=" + artist
                    + " album=not-exposed";
        } catch (RuntimeException exception) {
            return "nativeObject=" + System.identityHashCode(item)
                    + " metadataUnavailable=" + exception.getClass().getSimpleName();
        }
    }

    private static void debugFailure(String phase, long generation, long anchor, long cancellation, Throwable failure) {
        Logger.printDebug(() -> "Smart Shuffle native " + phase + " rejected generation=" + generation
                + " cancellation=" + cancellation + " activeCancellation=" + cancellations.get()
                + " anchor=" + anchor + " failure=" + failure.getClass().getSimpleName());
    }

    static Item[] insertedItems(Item[] before, Item[] after) {
        Set<Long> prior = new HashSet<>();
        for (Item item : before) prior.add(item.occurrenceId());
        List<Item> inserted = new ArrayList<>();
        for (Item item : after) {
            if (!prior.contains(item.occurrenceId())) inserted.add(item);
        }
        return inserted.toArray(new Item[0]);
    }

    private static int requireAnchor(Snapshot snapshot, long generation, long anchor, long cancellation) {
        if (snapshot.generation() != generation || cancellations.get() != cancellation || !snapshot.local()) {
            Logger.printDebug(() -> "Smart Shuffle native stale anchor=" + anchor
                    + " generation=" + generation + " activeGeneration=" + snapshot.generation()
                    + " cancellation=" + cancellation + " activeCancellation=" + cancellations.get()
                    + " local=" + snapshot.local());
            throw new CancellationException("Smart Shuffle queue changed");
        }
        int index = indexOf(snapshot.items(), anchor);
        if (index < snapshot.currentIndex() || index < 0) {
            Logger.printDebug(() -> "Smart Shuffle native stale anchor=" + anchor
                    + " generation=" + generation + " anchorIndex=" + index
                    + " currentIndex=" + snapshot.currentIndex());
            throw new CancellationException("Smart Shuffle anchor is no longer ahead of playback");
        }
        return index;
    }

    public static void remove(long generation, long occurrenceId, boolean preserveCurrent, Consumer<Boolean> removed) {
        Access access = owner.get();
        if (access == null) {
            removed.accept(false);
            return;
        }
        WeakReference<Access> reference = new WeakReference<>(access);
        access.patch_jamExecutor().execute(() -> {
            Access current = reference.get();
            boolean didRemove = false;
            try {
                if (current == null || owner.get() != current) return;
                Snapshot snapshot = read(current);
                int index = removalIndex(snapshot, generation, occurrenceId, preserveCurrent);
                if (index < 0) {
                    Logger.printDebug(() -> "Smart Shuffle native removal skipped occurrence=" + occurrenceId
                            + " generation=" + generation + " activeGeneration=" + snapshot.generation()
                            + " currentIndex=" + snapshot.currentIndex() + " preserveCurrent=" + preserveCurrent);
                    return;
                }
                Logger.printDebug(() -> "Smart Shuffle native removal occurrence=" + occurrenceId
                        + " video=" + snapshot.items()[index].videoId() + " generation=" + generation
                        + " targetIndex=" + index + " preserveCurrent=" + preserveCurrent);
                current.patch_jamRemove(index);
                didRemove = indexOf(read(current).items(), occurrenceId) < 0;
                changed();
            } catch (Exception exception) {
                Logger.printException(() -> "Smart Shuffle occurrence removal failed", exception);
            } finally {
                removed.accept(didRemove);
            }
        });
    }

    static int indexOf(Item[] items, long occurrenceId) {
        for (int index = 0; index < items.length; index++) {
            if (items[index].occurrenceId() == occurrenceId) return index;
        }
        return -1;
    }

    static int removalIndex(Snapshot snapshot, long generation, long occurrenceId, boolean preserveCurrent) {
        if (snapshot.generation() != generation) return -1;
        int index = indexOf(snapshot.items(), occurrenceId);
        return preserveCurrent && index == snapshot.currentIndex() ? -1 : index;
    }

    public static void cancelPending() {
        long cancellation = cancellations.incrementAndGet();
        synchronized (pending) {
            int count = pending.size();
            Logger.printDebug(() -> "Smart Shuffle native cancel cancellation=" + cancellation + " pending=" + count);
            for (Future<?> future : pending) future.cancel(false);
            pending.clear();
        }
    }

    /** Retains r3's posted dispatch, but resolves its receiver from the current Activity at execution time. */
    public static void dispatch(byte[] command, BooleanSupplier activeWindow, Consumer<Exception> failed) {
        byte[] bytes = command.clone();
        CommandAccess queued = dispatcher.get();
        SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=queued weak-null=" + (queued == null)
                + " weak=" + identity(queued) + " thread=" + Thread.currentThread().getName());
        Utils.runOnMainThread(() -> dispatchOnMainThread(bytes, activeWindow, failed));
    }

    static void dispatchOnMainThread(byte[] bytes, BooleanSupplier activeWindow, Consumer<Exception> failed) {
        SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=run thread="
                + Thread.currentThread().getName());
        try {
            if (!activeWindow.getAsBoolean()) {
                SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=cancelled");
                return;
            }
            Object activity = Utils.getActivity();
            ActivityAccess host = activity instanceof ActivityAccess access ? access : null;
            Object current = host == null ? null : host.smartCurrentDispatcher();
            CommandAccess weak = dispatcher.get();
            CommandAccess selected = current instanceof CommandAccess access ? access : host;
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch weak-null=" + (weak == null)
                    + " weak=" + identity(weak) + " activity=" + identity(activity)
                    + " activity-dispatcher=" + identity(current) + " weak-current=" + (weak == current)
                    + " selected=" + identity(selected) + " reacquired=" + (weak != selected)
                    + " thread=" + Thread.currentThread().getName());
            if (current == null || selected == null) {
                throw new IllegalStateException("Current Activity command dispatcher is unavailable");
            }
            if (weak != selected) captureDispatcher(selected);
            selected.smartDispatch(bytes);
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=returned");
        } catch (Exception exception) {
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=threw exception="
                    + exception.getClass().getName() + " thread=" + Thread.currentThread().getName());
            failed.accept(exception);
        } catch (Error error) {
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch stage=threw error="
                    + error.getClass().getName());
            throw error;
        }
    }

    private static String identity(Object value) {
        return value == null ? "null" : value.getClass().getName() + "@" + System.identityHashCode(value);
    }

    private static byte[] playNext(String videoId) throws java.io.IOException {
        ByteArrayOutputStream target = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(target);
        output.writeString(1, videoId);
        output.flush();
        ByteArrayOutputStream endpoint = new ByteArrayOutputStream();
        output = CodedOutputStream.newInstance(endpoint);
        output.writeByteArray(1, target.toByteArray());
        output.writeInt32(2, 1);
        output.flush();
        ByteArrayOutputStream command = new ByteArrayOutputStream();
        output = CodedOutputStream.newInstance(command);
        output.writeByteArray(163_162_354, endpoint.toByteArray());
        output.flush();
        return command.toByteArray();
    }

    /** Only native occurrence continuity survives moves, additions and audio/video counterpart updates. */
    static final class Generation {
        private long generation;
        private final Set<Long> previous = new HashSet<>();
        private String playlist = "";

        void reset() {
            generation++;
            previous.clear();
            playlist = "";
        }

        long update(Item[] items, String source) {
            boolean overlap = false;
            for (Item item : items) {
                if (previous.contains(item.occurrenceId())) {
                    overlap = true;
                    break;
                }
            }
            if ((!overlap && (!previous.isEmpty() || items.length != 0))
                    || !playlist.equals(source) && !playlist.isEmpty() && !source.isEmpty()) {
                generation++;
            }
            previous.clear();
            for (Item item : items) previous.add(item.occurrenceId());
            playlist = source;
            return generation;
        }
    }
}
