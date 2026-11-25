package nl.johninnl.myspoti.queue;

import android.media.MediaDescription;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Exports EngineQueue; never derives a playback sequence from the browse catalogue. */
public final class QueueExport {
    private static final String TAG = "MorpheMyspotiQueue";
    private static final int WINDOW = 50;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final OccurrenceIds IDS = new OccurrenceIds();
    private static Object service;
    private static MediaSession session;
    private static PlaybackState originalState;
    private static Bindings bindings;
    private static Map<Long, Row> selectable = Collections.emptyMap();
    private static List<MediaSession.QueueItem> publishedQueue = Collections.emptyList();
    private static long active = -1;
    private static boolean refreshPending;
    private static final Runnable REFRESH = () -> {
        refreshPending = false;
        refresh();
    };

    private QueueExport() {}

    public static void bind(Object owner) {
        try {
            bindings = new Bindings(owner.getClass().getClassLoader());
            Object wrapper = field(owner, "t");
            MediaSession mediaSession = (MediaSession) field(field(wrapper, "l"), "a");
            if (session != mediaSession) {
                IDS.clear();
                selectable = Collections.emptyMap();
                publishedQueue = Collections.emptyList();
            }
            service = owner;
            session = mediaSession;
            originalState = session.getController().getPlaybackState();
            refresh();
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Queue binding unavailable", error);
        }
    }

    public static void unbind(Object owner) {
        if (owner != service) return;
        MAIN.removeCallbacks(REFRESH);
        refreshPending = false;
        clear();
        service = null;
        session = null;
        originalState = null;
        bindings = null;
    }

    /** Runs after Compose MutableState has accepted a local or remote EngineQueue. */
    public static void changed(Object value) {
        if (value == null || !"ra7".equals(value.getClass().getName())) return;
        refreshSoon();
    }

    public static void refreshSoon() {
        MAIN.post(() -> {
            if (session == null || refreshPending) return;
            refreshPending = true;
            MAIN.post(REFRESH);
        });
    }

    /** Preserve every original state field/action, then add the published occurrence. */
    public static void publishState(MediaSession target, PlaybackState state) {
        if (target != session) {
            target.setPlaybackState(state);
            return;
        }
        originalState = state;
        refresh();
    }

    public static void select(Object callback, long queueId) {
        if (session == null || bindings == null) return;
        try {
            // Keep the compat callback's existing attachment check and service identity.
            if (callback.getClass().getMethod("a").invoke(callback) == null) return;
            Object appCallback = field(callback, "a");
            if (!"zv5".equals(appCallback.getClass().getName()) || field(appCallback, "e") != service) return;
            Row published = selectable.get(queueId);
            if (published == null) return;
            // Resolve again against the live queue: a queued host tap may be stale.
            List<Row> rows = snapshot();
            List<Object> keys = new ArrayList<>();
            for (Row row : rows) keys.add(row.key);
            List<Long> ids = IDS.update(keys);
            for (int index = 1; index < rows.size(); index++) {
                if (ids.get(index) == queueId) {
                    Row row = rows.get(index);
                    // Same handler as tapping a row in Myspoti's own queue screen.
                    bindings.select.invoke(bindings.engine.get(null), row.item);
                    return;
                }
            }
            refresh();
        } catch (PendingSnapshot pending) {
            refresh();
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w(TAG, "Queue selection unavailable", error);
        }
    }

    private static void refresh() {
        if (session == null || bindings == null) return;
        try {
            List<Row> rows = snapshot();
            List<Object> keys = new ArrayList<>();
            for (Row row : rows) keys.add(row.key);
            List<Long> ids = IDS.update(keys);
            List<MediaSession.QueueItem> queue = new ArrayList<>();
            Map<Long, Row> targets = new HashMap<>();
            for (int index = 0; index < Math.min(WINDOW, rows.size()); index++) {
                Row row = rows.get(index);
                long id = ids.get(index);
                queue.add(new MediaSession.QueueItem(describe(row.song, row.uri), id));
                if (row.item != null) targets.put(id, row);
            }
            active = queue.isEmpty() ? -1 : ids.get(0);
            selectable = targets;
            publishQueue(queue);
            applyState();
        } catch (PendingSnapshot pending) {
            // Metadata and queue arrive separately. Hide stale rows, retaining IDs
            // until the matching snapshot arrives through the existing update hooks.
            active = -1;
            selectable = Collections.emptyMap();
            publishQueue(Collections.emptyList());
            applyState();
        } catch (ReflectiveOperationException | RuntimeException error) {
            clear();
            Log.w(TAG, "Queue publication unavailable", error);
        }
    }

    private static void clear() {
        active = -1;
        selectable = Collections.emptyMap();
        IDS.clear();
        if (session != null) {
            publishQueue(Collections.emptyList());
            applyState();
        }
    }

    private static void publishQueue(List<MediaSession.QueueItem> queue) {
        boolean same = queue.size() == publishedQueue.size();
        for (int index = 0; same && index < queue.size(); index++) {
            MediaSession.QueueItem left = queue.get(index), right = publishedQueue.get(index);
            MediaDescription a = left.getDescription(), b = right.getDescription();
            same = left.getQueueId() == right.getQueueId() &&
                java.util.Objects.equals(a.getMediaId(), b.getMediaId()) &&
                java.util.Objects.equals(a.getTitle(), b.getTitle()) &&
                java.util.Objects.equals(a.getSubtitle(), b.getSubtitle()) &&
                java.util.Objects.equals(a.getDescription(), b.getDescription()) &&
                java.util.Objects.equals(a.getIconUri(), b.getIconUri()) &&
                a.getExtras().getLong("android.media.metadata.DURATION") == b.getExtras().getLong("android.media.metadata.DURATION");
        }
        if (!same) {
            session.setQueue(queue);
            publishedQueue = queue;
        }
    }

    private static void applyState() {
        if (session == null || originalState == null) return;
        long actions = originalState.getActions();
        if (!selectable.isEmpty()) actions |= PlaybackState.ACTION_SKIP_TO_QUEUE_ITEM;
        session.setPlaybackState(new PlaybackState.Builder(originalState)
            .setActiveQueueItemId(active).setActions(actions).build());
    }

    private static List<Row> snapshot() throws ReflectiveOperationException {
        Object queue = bindings.getValue.invoke(bindings.queue.get(null));
        Object currentSong = field(queue, "a");
        if (currentSong == null) return Collections.emptyList();
        Object metadata = bindings.serviceMetadata.get(null);
        if (metadata == null || "spotify:ad".equals(field(metadata, "a"))) return Collections.emptyList();
        boolean local = (Boolean) bindings.getValue.invoke(bindings.localActive.get(null));
        Object currentKey;
        String currentUri;
        if (local) {
            Object track = bindings.localCurrent.invoke(null);
            if (track == null) return Collections.emptyList();
            currentKey = new Identity(track);
            currentUri = "local:" + field(track, "a");
            if (!bindings.songUri.invoke(currentSong).equals("local:" + field(track, "b"))) throw new PendingSnapshot();
        } else {
            Object remote = bindings.remoteQueue.get(null);
            Object current = remote == null ? null : bindings.remoteCurrent.invoke(remote);
            if (current == null) return Collections.emptyList();
            currentUri = (String) bindings.remoteUri.invoke(current);
            currentKey = remoteKey(currentUri, (String) bindings.remoteUid.invoke(current));
            if (!currentUri.equals(field(metadata, "a"))) throw new PendingSnapshot();
            if (currentUri.startsWith("spotify:track:") &&
                !currentUri.substring(14).equals(bindings.spotifyId.invoke(currentSong))) throw new PendingSnapshot();
            if (currentUri.startsWith("spotify:episode:") &&
                !("episode:" + currentUri.substring(16)).equals(bindings.songUri.invoke(currentSong))) throw new PendingSnapshot();
        }
        List<Row> result = new ArrayList<>();
        result.add(new Row(currentKey, null, currentSong, currentUri));
        // EngineQueue.queued precedes EngineQueue.nextUp, exactly as Next consumes it.
        append(result, (List<?>) field(queue, "b"), local);
        append(result, (List<?>) field(queue, "c"), local);
        return result;
    }

    private static void append(List<Row> result, List<?> entries, boolean local) throws ReflectiveOperationException {
        for (Object entry : entries) {
            String provider = (String) field(entry, "d");
            String uri = (String) field(entry, "b");
            String uid = (String) field(entry, "c");
            Object key;
            if (local) {
                if (!"local".equals(provider)) continue;
                int index = Integer.parseInt(uid);
                List<?> tracks = (List<?>) bindings.localTracks.get(null);
                if (index < 0 || index >= tracks.size()) continue;
                Object track = tracks.get(index);
                if (!uri.equals("local:" + field(track, "a"))) continue;
                key = new Identity(track);
            } else {
                if ("local".equals(provider)) continue;
                key = remoteKey(uri, uid);
            }
            result.add(new Row(key, entry, field(entry, "a"), uri));
        }
    }

    private static Object remoteKey(String uri, String uid) {
        // URI and occurrence UID remain separate; never identify occurrences by title/hash.
        return java.util.Arrays.asList("remote", uri, uid == null ? "" : uid);
    }

    private static MediaDescription describe(Object song, String uri) throws ReflectiveOperationException {
        Bundle extras = new Bundle();
        extras.putLong("android.media.extra.BT_FOLDER_TYPE", 0);
        extras.putLong("android.media.metadata.DURATION", ((Number) bindings.duration.invoke(song)).longValue());
        MediaDescription.Builder description = new MediaDescription.Builder()
            .setMediaId(uri).setTitle(text(bindings.title.invoke(song)))
            .setSubtitle(text(bindings.artist.invoke(song)))
            .setDescription(text(bindings.album.invoke(song))).setExtras(extras);
        String artwork = text(bindings.artwork.invoke(song));
        if (!artwork.isEmpty()) description.setIconUri(Uri.parse(artwork));
        return description.build();
    }

    private static String text(Object value) { return value == null ? "" : value.toString(); }

    private static Object field(Object value, String name) throws ReflectiveOperationException {
        return value.getClass().getField(name).get(value);
    }

    private static final class Identity {
        final Object value;
        Identity(Object value) { this.value = value; }
        @Override public int hashCode() { return System.identityHashCode(value); }
        @Override public boolean equals(Object other) { return other instanceof Identity && ((Identity) other).value == value; }
    }

    private static final class PendingSnapshot extends RuntimeException {}

    private static final class Row {
        final Object key;
        final Object item;
        final Object song;
        final String uri;
        Row(Object key, Object item, Object song, String uri) {
            this.key = key; this.item = item; this.song = song; this.uri = uri;
        }
    }

    private static final class Bindings {
        final Field engine, queue, remoteQueue, localActive, localTracks, serviceMetadata;
        final Method getValue, select, remoteCurrent, remoteUri, remoteUid, localCurrent;
        final Method title, artist, album, artwork, duration, songUri, spotifyId;
        Bindings(ClassLoader loader) throws ReflectiveOperationException {
            Class<?> player = loader.loadClass("ke7"), local = loader.loadClass("dg4");
            engine = player.getField("a"); queue = player.getField("t"); remoteQueue = player.getField("u");
            serviceMetadata = loader.loadClass("app.myspoti.host.android.PlaybackService").getField("J");
            localActive = local.getField("a"); localTracks = local.getField("b");
            getValue = loader.loadClass("er5").getMethod("getValue");
            select = player.getMethod("M0", loader.loadClass("va7"));
            remoteCurrent = loader.loadClass("vb6").getMethod("b");
            remoteUri = loader.loadClass("zf5").getMethod("k");
            remoteUid = loader.loadClass("zf5").getMethod("j");
            localCurrent = local.getMethod("i");
            Class<?> song = loader.loadClass("com.music.spotui.data.entity.SongsModel");
            title = song.getMethod("getTitle"); artist = song.getMethod("getSinger");
            album = song.getMethod("getAlbum"); artwork = song.getMethod("getCoverUri");
            duration = song.getMethod("getDurationMs");
            songUri = song.getMethod("getUrl"); spotifyId = song.getMethod("getSpotifyTrackId");
        }
    }
}
