/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Inserts the saved rows into the selected MediaSession's committed native queue, never a phone dispatcher. */
public final class AndroidAutoQueue {
    public interface Session {
        Owner rvxAutoQueueOwner();
    }

    public interface Owner {
        Executor rvxAutoExecutor();
        Object rvxAutoStorage();
        Object rvxAutoModel();
        List<?> rvxAutoItems();
        int rvxAutoCurrent();
        String rvxAutoVideoId(Object item);
        long rvxAutoItemId(Object item);
        Future<?> rvxAutoResolve(byte[] command, List<String> songs);
        List<?> rvxAutoResolved(Object response);
        void rvxAutoInsert(Object response);
        void rvxAutoObserve(Observer observer);
        void rvxAutoStopObserving(Observer observer);
    }

    private static final class Selection {
        final long request;
        final int index;
        Owner owner;
        boolean decided;
        Object initialModel;
        long initialItem = Long.MIN_VALUE;
        Object readyModel;
        long readyItem;
        String song;
        List<String> following;
        boolean requested;
        Future<?> lookup;
        Object response;
        Observer observer;

        Selection(int index, long request) {
            this.index = index;
            this.request = request;
        }
    }

    /** Implements the version's native current-item listener through a patch-time bridge. */
    public static final class Observer {
        final Selection selection;
        final Owner owner;
        final Object storage;
        volatile boolean active = true;
        boolean registered;

        Observer(Selection selection, Owner owner, Object storage) {
            this.selection = selection;
            this.owner = owner;
            this.storage = storage;
        }

        public void onChanged(Object item, Object reason) {
            if (!active || pending != selection) return;
            // Native callbacks may own the model monitor. Always leave it before taking the store monitor.
            CallbackDispatch.MAIN.post(() -> owner.rvxAutoExecutor().execute(() -> observed(this, item)));
        }
    }

    private static final class CallbackDispatch {
        static final Handler MAIN = new Handler(Looper.getMainLooper());
    }

    private static volatile Selection pending;
    private static final String REQUEST = "morphe_auto_queue_request";

    private AndroidAutoQueue() {}

    /** Patched only after every native owner/readiness bridge has been installed. */
    public static boolean supported() {
        return false;
    }

    public static void cancel() {
        Selection previous;
        synchronized (AndroidAutoQueue.class) {
            previous = pending;
            pending = null;
        }
        retire(previous);
    }

    private static void retire(Selection selection) {
        if (selection == null) return;
        Observer observer;
        Future<?> lookup;
        synchronized (AndroidAutoQueue.class) {
            observer = selection.observer;
            if (observer == null || !observer.active) return;
            observer.active = false;
            lookup = selection.lookup;
            selection.lookup = null;
        }
        if (lookup != null) lookup.cancel(false);
        CallbackDispatch.MAIN.post(() -> observer.owner.rvxAutoExecutor().execute(() -> {
            synchronized (observer.storage) {
                if (observer.registered) {
                    observer.owner.rvxAutoStopObserving(observer);
                    observer.registered = false;
                }
            }
        }));
    }

    /** Called before the unhooked native callback: its session-controller entry supplies the actual owner. */
    public static Bundle prepare(String source, int index, Bundle extras, long request) {
        Selection selection = supported() && OfflineReplay.SONGS.equals(source) ? new Selection(index, request) : null;
        Selection previous;
        synchronized (AndroidAutoQueue.class) {
            previous = pending;
            pending = selection;
        }
        retire(previous);
        Logger.printDebug(() -> "Android Auto queue: prepare request=" + request + " source=" + source
                + " index=" + index + " enabled=" + supported());
        if (selection == null) return extras;
        Bundle correlated = extras == null ? new Bundle() : new Bundle(extras);
        correlated.putLong(REQUEST, request);
        return correlated;
    }

    public static void onSession(Session session, Object caller, Object command, Bundle extras) {
        Selection selection;
        synchronized (AndroidAutoQueue.class) {
            selection = pending;
            if (!matches(selection, extras) || selection.owner != null) return;
        }
        Owner owner = session.rvxAutoQueueOwner();
        Object storage = owner.rvxAutoStorage();
        Observer observer;
        synchronized (storage) {
            synchronized (AndroidAutoQueue.class) {
                if (pending != selection || selection.owner != null) return;
                observer = new Observer(selection, owner, storage);
                selection.owner = owner;
                selection.observer = observer;
            }
            if (observer.active) {
                observer.registered = true;
                owner.rvxAutoObserve(observer);
            }
            synchronized (AndroidAutoQueue.class) {
                if (pending != selection) return;
                selection.initialModel = owner.rvxAutoModel();
                List<?> items = owner.rvxAutoItems();
                int current = owner.rvxAutoCurrent();
                if (current >= 0 && current < items.size()) {
                    selection.initialItem = owner.rvxAutoItemId(items.get(current));
                }
            }
        }
        if (observer.active) Utils.runOnBackgroundThread(() -> prepareRows(selection));
    }

    private static boolean matches(Selection selection, Bundle extras) {
        return selection != null && extras != null
                && selection.request == extras.getLong(REQUEST, Long.MIN_VALUE);
    }

    /** Captured at the native asynchronous decision entry, before its registers are reused. */
    public static Object onDecision(Session session, Object command, Bundle extras) {
        Selection selection;
        synchronized (AndroidAutoQueue.class) {
            selection = pending;
            if (!matches(selection, extras) || selection.owner == null) return null;
        }
        Owner owner = session.rvxAutoQueueOwner();
        synchronized (AndroidAutoQueue.class) {
            if (pending != selection || selection.owner != owner) return null;
            selection.decided = true;
            return selection;
        }
    }

    /** Stock explicitly accepted its existing descriptor/queue, without scheduling a replacement. */
    public static void onReuse(Object request) {
        if (!(request instanceof Selection selection)) return;
        Owner owner = selection.owner;
        synchronized (owner.rvxAutoStorage()) {
            synchronized (AndroidAutoQueue.class) {
                if (pending != selection) return;
                List<?> items = owner.rvxAutoItems();
                int current = owner.rvxAutoCurrent();
                if (current < 0 || current >= items.size()) return;
                selection.readyModel = owner.rvxAutoModel();
                selection.readyItem = owner.rvxAutoItemId(items.get(current));
            }
        }
        owner.rvxAutoExecutor().execute(() -> advance(selection));
    }

    private static void prepareRows(Selection selection) {
        try {
            List<OfflineWatchNext.Item> saved = OfflineReplay.queueOf(OfflineReplay.SONGS);
            if (selection.index < 0 || selection.index >= saved.size()) {
                throw new IllegalStateException("The selected saved row is no longer available");
            }
            List<String> following = saved.size() == 1 ? List.of() : new ArrayList<>(saved.size() - 1);
            for (int offset = 1; offset < saved.size(); offset++) {
                following.add(saved.get((selection.index + offset) % saved.size()).videoId());
            }
            synchronized (AndroidAutoQueue.class) {
                if (pending != selection) return;
                selection.song = saved.get(selection.index).videoId();
                selection.following = following;
            }
            selection.owner.rvxAutoExecutor().execute(() -> advance(selection));
        } catch (Exception ex) {
            failed(selection, ex);
        }
    }

    /** One native batch request preserves the queue context and response anchors for the whole saved ordering. */
    private static void advance(Selection selection) {
        Owner owner = selection.owner;
        Future<?> lookup;
        try {
            synchronized (owner.rvxAutoStorage()) {
                synchronized (AndroidAutoQueue.class) {
                    if (pending != selection || selection.following == null || selection.readyModel == null
                            || selection.lookup != null) return;
                    if (selection.following.isEmpty() || selection.response != null) {
                        lookup = null;
                    } else {
                        if (selection.requested || !matchesCurrent(selection)) return;
                        selection.requested = true;
                        lookup = owner.rvxAutoResolve(OnlineQueueCommand.playNext(selection.following.get(0)),
                                selection.following);
                        if (pending == selection) selection.lookup = lookup;
                    }
                }
            }
        } catch (Exception ex) {
            failed(selection, ex);
            return;
        }
        if (pending != selection) {
            if (lookup != null) lookup.cancel(false);
            return;
        }
        if (lookup == null) {
            commit(selection);
        } else {
            Utils.runOnBackgroundThread(() -> resolved(selection, lookup));
        }
    }

    private static void resolved(Selection selection, Future<?> lookup) {
        try {
            Object response = lookup.get();
            List<?> items = selection.owner.rvxAutoResolved(response);
            if (items.size() != selection.following.size()) {
                throw new IllegalStateException("Native batch did not return all requested saved rows");
            }
            for (int index = 0; index < items.size(); index++) {
                if (!selection.following.get(index).equals(selection.owner.rvxAutoVideoId(items.get(index)))) {
                    throw new IllegalStateException("Native batch returned an unexpected saved-row order");
                }
            }
            synchronized (AndroidAutoQueue.class) {
                if (pending != selection || selection.lookup != lookup) return;
                selection.response = response;
                selection.lookup = null;
            }
            selection.owner.rvxAutoExecutor().execute(() -> advance(selection));
        } catch (Exception ex) {
            failed(selection, ex);
        }
    }

    private static void failed(Selection selection, Exception failure) {
        if (failure instanceof InterruptedException) Thread.currentThread().interrupt();
        synchronized (AndroidAutoQueue.class) {
            if (pending != selection) return;
            pending = null;
        }
        retire(selection);
        Logger.printException(() -> "Android Auto: could not queue saved rows", failure);
    }

    /** Caller holds the captured store and coordinator monitors. */
    private static boolean matchesCurrent(Selection selection) {
        Owner owner = selection.owner;
        List<?> items = owner.rvxAutoItems();
        int current = owner.rvxAutoCurrent();
        return current >= 0 && current < items.size()
                && canCommit(pending, selection, selection.readyModel, owner.rvxAutoModel(),
                selection.song, owner.rvxAutoVideoId(items.get(current)), selection.readyItem,
                owner.rvxAutoItemId(items.get(current)));
    }

    private static void observed(Observer observer, Object eventItem) {
        Selection selection = observer.selection;
        Owner owner = observer.owner;
        synchronized (observer.storage) {
            synchronized (AndroidAutoQueue.class) {
                if (!observer.active || pending != selection || selection.observer != observer
                        || !selection.decided || owner.rvxAutoStorage() != observer.storage) return;
                Object model = owner.rvxAutoModel();
                List<?> items = owner.rvxAutoItems();
                int current = owner.rvxAutoCurrent();
                Object item = current >= 0 && current < items.size() ? items.get(current) : null;
                if (item == null) {
                    selection.readyModel = null;
                    return;
                }
                if (eventItem != item && (eventItem == null
                        || owner.rvxAutoItemId(eventItem) != owner.rvxAutoItemId(item))) return;
                selection.readyModel = null;
                if (!newQueue(selection.initialModel, selection.initialItem, model,
                        owner.rvxAutoItemId(item))) return;
                selection.readyModel = model;
                selection.readyItem = owner.rvxAutoItemId(item);
            }
        }
        advance(selection);
    }

    private static void commit(Selection selection) {
        Owner owner = selection.owner;
        try {
            synchronized (owner.rvxAutoStorage()) {
                synchronized (AndroidAutoQueue.class) {
                    if (pending != selection || selection.following == null || selection.readyModel == null
                            || (!selection.following.isEmpty() && selection.response == null)
                            || selection.lookup != null) {
                        return;
                    }
                    List<?> items = owner.rvxAutoItems();
                    int current = owner.rvxAutoCurrent();
                    if (current < 0 || current >= items.size()
                            || !canCommit(pending, selection, selection.readyModel, owner.rvxAutoModel(),
                            selection.song, owner.rvxAutoVideoId(items.get(current)), selection.readyItem,
                            owner.rvxAutoItemId(items.get(current)))) {
                        return;
                    }
                    pending = null;
                    if (selection.response != null) owner.rvxAutoInsert(selection.response);
                    Logger.printDebug(() -> "Android Auto: committed "
                            + (owner.rvxAutoItems().size() - items.size()) + " of " + selection.following.size()
                            + " saved rows after " + selection.song);
                }
            }
        } finally {
            if (pending != selection) retire(selection);
        }
    }

    static boolean newQueue(Object initialModel, long initialItem, Object model, long item) {
        return initialModel != model || initialItem != item;
    }

    static boolean canCommit(Object current, Object selection, Object readyModel, Object model,
                             String expected, String playing, long readyItem, long currentItem) {
        return selection != null && current == selection && readyModel != null && readyModel == model
                && readyItem == currentItem && expected != null && expected.equals(playing);
    }
}
