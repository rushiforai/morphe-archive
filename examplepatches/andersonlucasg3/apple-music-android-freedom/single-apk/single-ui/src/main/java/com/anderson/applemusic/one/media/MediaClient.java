package com.anderson.applemusic.one.media;

import android.content.ComponentName;
import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaDescription;
import android.media.MediaMetadata;
import android.media.browse.MediaBrowser;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Framework-only {@link MediaBrowser} / {@link MediaController} client for the engine's
 * {@code MediaPlaybackService}, ported from {@code core/MediaBrowserClient.kt}.
 *
 * <p>Lives inside the engine APK, so the browse tree is reached through the same package
 * (and UID) as {@code com.apple.android.music}. The engine publishes its Android Auto tree
 * under {@code __AUTO_ROOT__}; {@code getRoot()} only holds {@code ROOT_MEDIA_ITEM}.
 */
@SuppressWarnings("deprecation")
public final class MediaClient {

    public static final String PACKAGE = "com.apple.android.music";
    public static final String AUTO_ROOT = "__AUTO_ROOT__";
    public static final String ACCOUNT_ACTIVITY = PACKAGE + ".common.MainActivity";

    /**
     * The service the engine actually exposes ({@code .player.}), verified by the probe
     * logcat and by {@code core/MediaBrowserClient.kt} — not the literal
     * {@code .MediaPlaybackService} shorthand.
     */
    public static final ComponentName SERVICE =
            new ComponentName(PACKAGE, PACKAGE + ".player.MediaPlaybackService");

    private static final String TAG = "AppleMusicOne";

    /** One entry of the browse tree. */
    public static final class Item {
        public final String id;
        public final String title;
        public final String subtitle;
        public final String artworkUri;
        public final boolean browsable;
        public final boolean playable;

        public Item(String id, String title, String subtitle, String artworkUri,
                boolean browsable, boolean playable) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artworkUri = artworkUri;
            this.browsable = browsable;
            this.playable = playable;
        }
    }

    /** One entry of {@link MediaController#getQueue()}. */
    public static final class QueueEntry {
        public final long queueId;
        public final String title;
        public final String subtitle;
        public final String mediaId;

        public QueueEntry(long queueId, String title, String subtitle, String mediaId) {
            this.queueId = queueId;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.mediaId = mediaId == null ? "" : mediaId;
        }
    }

    /** One session custom action ({@code PlaybackState.getCustomActions()}). */
    public static final class Action {
        public final String action;
        public final String title;

        public Action(String action, String title) {
            this.action = action == null ? "" : action;
            this.title = title == null ? "" : title;
        }
    }

    /** Immutable-ish view of what the session currently exposes. */
    public static final class Snapshot {
        public boolean hasSession;
        public boolean playing;
        public long positionMs;
        public long durationMs;
        public String title = "";
        public String artist = "";
        public String album = "";
        public String mediaId = "";
        public Bitmap artwork;
        public List<Action> actions = Collections.emptyList();
        /** {@code MediaController.getQueue()}: the engine's play order (empty when none). */
        public List<QueueEntry> queue = Collections.emptyList();
        /** {@code PlaybackState.getActiveQueueItemId()}, or -1 when the session has no queue. */
        public long activeQueueId = -1L;

        public int activeQueueIndex() {
            for (int i = 0; i < queue.size(); i++) {
                if (queue.get(i).queueId == activeQueueId) return i;
            }
            return -1;
        }

        public Action findActionEndingWith(String suffix) {
            for (Action action : actions) {
                if (action.action.endsWith(suffix)) return action;
            }
            return null;
        }

        public boolean hasAction(String actionId) {
            for (Action action : actions) {
                if (action.action.equals(actionId)) return true;
            }
            return false;
        }
    }

    public interface Listener {
        void onConnected();

        void onDisconnected(String message);

        void onChildren(String parentId, List<Item> children);

        void onChildrenFailed(String parentId);

        void onPlayback(Snapshot snapshot);
    }

    private final Context context;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<String, List<Item>> cache = new HashMap<String, List<Item>>();
    private final Map<String, MediaBrowser.SubscriptionCallback> callbacks =
            new HashMap<String, MediaBrowser.SubscriptionCallback>();

    private MediaBrowser browser;
    private MediaController controller;
    private MediaController.Callback controllerCallback;
    private Listener listener;

    private PlaybackState lastState;
    private MediaMetadata lastMetadata;
    private int lastQueueSize = -1;

    /** "Play this collection, then jump to track N" request waiting for the new queue. */
    private int pendingSkipIndex = -1;
    private int pendingSkipAttempts;
    private String pendingSkipFallbackId;

    public MediaClient(Context context) {
        this.context = context.getApplicationContext();
    }

    public void setListener(Listener listener) {
        this.listener = listener;
    }

    // --- connection --------------------------------------------------------------

    public void connect() {
        if (browser != null) return;
        try {
            MediaBrowser created = new MediaBrowser(context, SERVICE, connectionCallback, null);
            browser = created;
            created.connect();
        } catch (Throwable t) {
            Log.e(TAG, "cannot create the MediaBrowser", t);
            notifyDisconnected("Apple Music não acessível");
        }
    }

    public void disconnect() {
        if (controllerCallback != null && controller != null) {
            try {
                controller.unregisterCallback(controllerCallback);
            } catch (Throwable ignored) {
                // The session may already be gone.
            }
        }
        controllerCallback = null;
        controller = null;
        callbacks.clear();
        cache.clear();
        lastState = null;
        lastMetadata = null;
        lastQueueSize = -1;
        pendingSkipIndex = -1;
        main.removeCallbacks(skipWhenReady);
        if (browser != null) {
            try {
                browser.disconnect();
            } catch (Throwable ignored) {
                // Nothing to do; the binder is gone.
            }
            browser = null;
        }
    }

    private final MediaBrowser.ConnectionCallback connectionCallback =
            new MediaBrowser.ConnectionCallback() {
                @Override
                public void onConnected() {
                    Log.i(TAG, "MediaBrowser connected, root=" + browser.getRoot());
                    attachController();
                    if (listener != null) listener.onConnected();
                    emitPlayback();
                }

                @Override
                public void onConnectionFailed() {
                    Log.e(TAG, "MediaBrowser connection failed");
                    notifyDisconnected("Não foi possível conectar ao Apple Music");
                }

                @Override
                public void onConnectionSuspended() {
                    Log.w(TAG, "MediaBrowser connection suspended");
                    notifyDisconnected("Conexão com o Apple Music suspensa");
                }
            };

    private void attachController() {
        MediaSession.Token token;
        try {
            token = browser.getSessionToken();
        } catch (Throwable t) {
            Log.e(TAG, "session token unavailable", t);
            token = null;
        }
        if (token == null) {
            notifyDisconnected("Sessão de mídia do Apple Music indisponível");
            return;
        }
        final MediaController created = new MediaController(context, token);
        final MediaController.Callback callback = new MediaController.Callback() {
            @Override
            public void onPlaybackStateChanged(PlaybackState state) {
                lastState = state;
                emitPlayback();
            }

            @Override
            public void onMetadataChanged(MediaMetadata metadata) {
                lastMetadata = metadata;
                emitPlayback();
            }

            @Override
            public void onSessionDestroyed() {
                notifyDisconnected("Sessão de reprodução encerrada");
            }
        };
        created.registerCallback(callback, main);
        controller = created;
        controllerCallback = callback;
        lastState = created.getPlaybackState();
        lastMetadata = created.getMetadata();
    }

    private void notifyDisconnected(final String message) {
        main.post(new Runnable() {
            @Override
            public void run() {
                if (listener != null) listener.onDisconnected(message);
            }
        });
    }

    // --- browse ------------------------------------------------------------------

    /**
     * Subscribes to a browse node. Cached children are delivered again immediately.
     * Safe to call from a background thread: MediaBrowser posts the binder call to its
     * own handler and the callback reaches the main looper.
     */
    public synchronized void subscribe(final String parentId) {
        final List<Item> cached = cache.get(parentId);
        if (cached != null) {
            notifyChildren(parentId, cached);
            return;
        }
        final MediaBrowser current = browser;
        if (current == null) return;
        if (callbacks.containsKey(parentId)) return;

        MediaBrowser.SubscriptionCallback callback = new MediaBrowser.SubscriptionCallback() {
            @Override
            public void onChildrenLoaded(String id, List<MediaBrowser.MediaItem> children) {
                deliver(id, children);
            }

            // Media3 delivers through the Bundle overload; the 2-arg one is not called.
            @Override
            public void onChildrenLoaded(String id, List<MediaBrowser.MediaItem> children,
                                         Bundle options) {
                deliver(id, children);
            }

            @Override
            public void onError(String id) {
                Log.w(TAG, "subscribe failed for " + id);
                notifyChildrenFailed(id);
            }

            @Override
            public void onError(String id, Bundle options) {
                Log.w(TAG, "subscribe failed for " + id + " (with options)");
                notifyChildrenFailed(id);
            }
        };
        callbacks.put(parentId, callback);
        try {
            current.subscribe(parentId, new Bundle(), callback);
        } catch (Throwable t) {
            Log.e(TAG, "subscribe threw for " + parentId, t);
            callbacks.remove(parentId);
            notifyChildrenFailed(parentId);
        }
    }

    private synchronized void deliver(String parentId, List<MediaBrowser.MediaItem> children) {
        final List<Item> items = new ArrayList<Item>(children.size());
        for (MediaBrowser.MediaItem child : children) {
            items.add(toItem(child));
        }
        cache.put(parentId, Collections.unmodifiableList(items));
        Log.i(TAG, "children parent=" + parentId + " count=" + items.size()
                + " art=" + countArt(items));
        notifyChildren(parentId, items);
    }

    private static int countArt(List<Item> items) {
        int count = 0;
        for (Item item : items) if (item.artworkUri != null) count++;
        return count;
    }

    private void notifyChildren(final String parentId, final List<Item> items) {
        main.post(new Runnable() {
            @Override
            public void run() {
                if (listener != null) listener.onChildren(parentId, items);
            }
        });
    }

    private void notifyChildrenFailed(final String parentId) {
        main.post(new Runnable() {
            @Override
            public void run() {
                if (listener != null) listener.onChildrenFailed(parentId);
            }
        });
    }

    private static Item toItem(MediaBrowser.MediaItem item) {
        MediaDescription description = item.getDescription();
        String title = null;
        String subtitle = null;
        String artwork = null;
        if (description != null) {
            if (description.getTitle() != null) title = description.getTitle().toString();
            if (description.getSubtitle() != null) subtitle = description.getSubtitle().toString();
            if (description.getIconUri() != null) artwork = description.getIconUri().toString();
        }
        return new Item(item.getMediaId(), title, subtitle, artwork,
                item.isBrowsable(), item.isPlayable());
    }

    // --- transport ---------------------------------------------------------------

    public void play(String mediaId) {
        MediaController current = controller;
        if (current == null) {
            Log.e(TAG, "playFromMediaId without a controller: " + mediaId);
            return;
        }
        Log.i(TAG, "playFromMediaId " + mediaId);
        try {
            current.getTransportControls().playFromMediaId(mediaId, null);
        } catch (Throwable t) {
            Log.e(TAG, "playFromMediaId failed", t);
        }
    }

    /**
     * Plays a collection (album/playlist id) and then jumps to its 0-based track
     * {@code index}. The engine builds the queue only after {@code playFromMediaId}, so the
     * jump waits for the new queue and gives up on {@code fallbackId} (the tapped track)
     * if the session never exposes it.
     */
    public void playCollectionFrom(String collectionId, int index, String fallbackId) {
        pendingSkipFallbackId = fallbackId;
        pendingSkipAttempts = 0;
        main.removeCallbacks(skipWhenReady);
        if (index <= 0) {
            pendingSkipIndex = -1;
            play(collectionId);
            return;
        }
        pendingSkipIndex = index;
        play(collectionId);
        main.postDelayed(skipWhenReady, 900L);
    }

    private final Runnable skipWhenReady = new Runnable() {
        @Override
        public void run() {
            if (pendingSkipIndex < 0) return;
            MediaController current = controller;
            List<MediaSession.QueueItem> queue = current == null ? null : current.getQueue();
            PlaybackState state = current == null ? null : current.getPlaybackState();
            // Only jump once the fresh queue is at its first item: a previous album's queue
            // can still be visible for a moment after playFromMediaId.
            boolean fresh = state != null && queue != null && !queue.isEmpty()
                    && state.getActiveQueueItemId() == queue.get(0).getQueueId();
            if (queue == null || queue.size() <= pendingSkipIndex || !fresh) {
                if (++pendingSkipAttempts < 12) {
                    main.postDelayed(this, 700L);
                    return;
                }
                Log.w(TAG, "no queue to skip into: want index " + pendingSkipIndex
                        + " queue=" + (queue == null ? 0 : queue.size()));
                pendingSkipIndex = -1;
                if (pendingSkipFallbackId != null) play(pendingSkipFallbackId);
                return;
            }
            long queueId = queue.get(pendingSkipIndex).getQueueId();
            MediaDescription description = queue.get(pendingSkipIndex).getDescription();
            Log.i(TAG, "skip into queue index=" + pendingSkipIndex + " queueId=" + queueId
                    + " track=" + (description == null ? "" : description.getTitle()));
            pendingSkipIndex = -1;
            skipToQueueItem(queueId);
        }
    };

    /** Jumps within the session queue. Media3 maps the id against QueueItem.getQueueId(). */
    public void skipToQueueItem(long queueId) {
        MediaController current = controller;
        if (current == null) {
            Log.e(TAG, "skipToQueueItem without a controller: " + queueId);
            return;
        }
        Log.i(TAG, "skipToQueueItem " + queueId);
        try {
            current.getTransportControls().skipToQueueItem(queueId);
        } catch (Throwable t) {
            Log.e(TAG, "skipToQueueItem failed", t);
        }
    }

    public void togglePlayPause() {
        MediaController current = controller;
        if (current == null) return;
        PlaybackState state = current.getPlaybackState();
        if (state != null && state.getState() == PlaybackState.STATE_PLAYING) {
            current.getTransportControls().pause();
        } else {
            current.getTransportControls().play();
        }
    }

    public void skipNext() {
        MediaController current = controller;
        if (current != null) current.getTransportControls().skipToNext();
    }

    public void skipPrevious() {
        MediaController current = controller;
        if (current != null) current.getTransportControls().skipToPrevious();
    }

    public void seekTo(long positionMs) {
        MediaController current = controller;
        if (current != null) current.getTransportControls().seekTo(positionMs);
    }

    public void sendCustomAction(String actionId) {
        MediaController current = controller;
        if (current == null) {
            Log.e(TAG, "sendCustomAction without a controller: " + actionId);
            return;
        }
        Log.i(TAG, "sendCustomAction " + actionId);
        try {
            current.getTransportControls().sendCustomAction(actionId, null);
        } catch (Throwable t) {
            Log.e(TAG, "sendCustomAction failed: " + actionId, t);
        }
    }

    /** Re-reads the session position only; metadata is read from the callbacks. */
    public void refreshPlayback() {
        MediaController current = controller;
        if (current == null) return;
        PlaybackState state = current.getPlaybackState();
        if (state != null) lastState = state;
        emitPlayback();
    }

    private void emitPlayback() {
        final Snapshot snapshot = new Snapshot();
        PlaybackState state = lastState;
        MediaMetadata metadata = lastMetadata;
        snapshot.hasSession = state != null || metadata != null;
        snapshot.playing = state != null && (
                state.getState() == PlaybackState.STATE_PLAYING
                        || state.getState() == PlaybackState.STATE_BUFFERING
                        || state.getState() == PlaybackState.STATE_CONNECTING);

        long position = state != null ? state.getPosition() : 0L;
        if (state != null && state.getState() == PlaybackState.STATE_PLAYING) {
            long elapsed = SystemClock.elapsedRealtime() - state.getLastPositionUpdateTime();
            if (elapsed > 0L) position += (long) (elapsed * state.getPlaybackSpeed());
        }
        snapshot.positionMs = Math.max(0L, position);
        snapshot.durationMs = metadata != null
                ? metadata.getLong(MediaMetadata.METADATA_KEY_DURATION) : 0L;
        if (metadata != null) {
            snapshot.title = safe(metadata.getString(MediaMetadata.METADATA_KEY_TITLE));
            snapshot.artist = safe(metadata.getString(MediaMetadata.METADATA_KEY_ARTIST));
            snapshot.album = safe(metadata.getString(MediaMetadata.METADATA_KEY_ALBUM));
            snapshot.mediaId = safe(metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID));
            snapshot.artwork = metadata.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
            if (snapshot.artwork == null) {
                snapshot.artwork = metadata.getBitmap(MediaMetadata.METADATA_KEY_ART);
            }
        }
        snapshot.activeQueueId = state != null ? state.getActiveQueueItemId() : -1L;
        snapshot.queue = readQueue(snapshot.activeQueueId);
        List<Action> actions = new ArrayList<Action>();
        if (state != null) {
            List<PlaybackState.CustomAction> custom = state.getCustomActions();
            if (custom != null) {
                for (PlaybackState.CustomAction action : custom) {
                    actions.add(new Action(action.getAction(),
                            action.getName() != null ? action.getName().toString() : ""));
                }
            }
        }
        snapshot.actions = Collections.unmodifiableList(actions);

        main.post(new Runnable() {
            @Override
            public void run() {
                if (listener != null) listener.onPlayback(snapshot);
            }
        });
    }

    private List<QueueEntry> readQueue(long activeQueueId) {
        MediaController current = controller;
        if (current == null) return Collections.emptyList();
        List<MediaSession.QueueItem> queue;
        try {
            queue = current.getQueue();
        } catch (Throwable t) {
            Log.w(TAG, "getQueue failed", t);
            return Collections.emptyList();
        }
        if (queue == null || queue.isEmpty()) {
            if (lastQueueSize != 0) {
                lastQueueSize = 0;
                Log.i(TAG, "queue size=0");
            }
            return Collections.emptyList();
        }
        List<QueueEntry> entries = new ArrayList<QueueEntry>(queue.size());
        for (MediaSession.QueueItem item : queue) {
            MediaDescription description = item.getDescription();
            String title = null;
            String subtitle = null;
            String mediaId = null;
            if (description != null) {
                if (description.getTitle() != null) title = description.getTitle().toString();
                if (description.getSubtitle() != null) {
                    subtitle = description.getSubtitle().toString();
                }
                mediaId = description.getMediaId();
            }
            entries.add(new QueueEntry(item.getQueueId(), title, subtitle, mediaId));
        }
        if (queue.size() != lastQueueSize) {
            lastQueueSize = queue.size();
            Log.i(TAG, "queue size=" + queue.size() + " active=" + activeQueueId);
            for (int i = 0; i < Math.min(3, entries.size()); i++) {
                QueueEntry entry = entries.get(i);
                Log.i(TAG, "queue[" + i + "] id=" + entry.queueId + " media=" + entry.mediaId
                        + " title=" + entry.title);
            }
        }
        return Collections.unmodifiableList(entries);
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }
}
