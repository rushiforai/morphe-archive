package app.spicetify.extension.spotify.localserver;

import android.media.MediaMetadataRetriever;
import android.os.ParcelFileDescriptor;
import java.util.*;
import java.util.concurrent.*;

public final class ServerIndex {
    private static volatile Index index = new Index(null, Collections.emptyList());
    private static final class Index {
        final ServerConfig.Snapshot snapshot;
        final List<RemoteTrack> tracks;
        final Map<String, RemoteTrack> byId;
        final MusicCatalog catalog;
        Index(ServerConfig.Snapshot snapshot, List<RemoteTrack> tracks) {
            this.snapshot = snapshot;
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
            Map<String, RemoteTrack> ids = new HashMap<>();
            for (RemoteTrack track : tracks) ids.put(track.id, track);
            byId = Collections.unmodifiableMap(ids);
            catalog = MusicCatalog.from(tracks);
        }
    }
    private static volatile String status = "Not scanned";
    private static final ThreadPoolExecutor worker = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS,
            new ArrayBlockingQueue<>(1), runnable -> { Thread t = new Thread(runnable, "spicetify-server-scan"); t.setDaemon(true); return t; },
            new ThreadPoolExecutor.DiscardOldestPolicy());
    private static Future<?> pending;
    private static volatile long generation;
    private ServerIndex() {}

    public static String status() { return ServerConfig.snapshot().enabled ? status : "Disabled"; }
    public static List<RemoteTrack> tracks() { return tracks(ServerConfig.snapshot()); }
    public static MusicCatalog catalog() {
        ServerConfig.Snapshot current = ServerConfig.snapshot();
        Index saved = index;
        return saved.snapshot == current && ServerConfig.isCurrent(current) ? saved.catalog : MusicCatalog.empty();
    }
    public static boolean isCurrent(MusicCatalog catalog) {
        Index saved = index;
        return saved.catalog == catalog && saved.snapshot != null && ServerConfig.isCurrent(saved.snapshot);
    }
    static List<RemoteTrack> tracks(ServerConfig.Snapshot snapshot) {
        Index saved = index;
        return saved.snapshot == snapshot && ServerConfig.isCurrent(snapshot) ? saved.tracks : Collections.emptyList();
    }
    static RemoteTrack byId(ServerConfig.Snapshot snapshot, String id) {
        Index saved = index;
        return saved.snapshot == snapshot && ServerConfig.isCurrent(snapshot) ? saved.byId.get(id) : null;
    }
    private static long savedModified;

    /** Publishes the scan saved by Spotify's main process when it is newer than the one loaded, for the track server process. */
    static synchronized void loadSaved(ServerConfig.Snapshot snapshot) {
        android.content.Context context = ServerConfig.context();
        if (context == null || !snapshot.enabled) return;
        java.io.File file = IndexCache.file(context);
        long modified = file.lastModified();
        if (index.snapshot == snapshot && modified == savedModified) return;
        List<RemoteTrack> saved = IndexCache.read(file, IndexCache.key(snapshot));
        savedModified = modified;
        index = new Index(snapshot, saved);
    }

    /**
     * Waits off the main thread until the saved or scanned index for {@code snapshot} is published,
     * for callers that start before it is, such as Spotify loading artwork at launch.
     */
    static void awaitIndex(ServerConfig.Snapshot snapshot, long timeoutMillis) {
        if (android.os.Looper.myLooper() == android.os.Looper.getMainLooper()) return;
        long deadline = System.currentTimeMillis() + timeoutMillis;
        while (index.snapshot != snapshot && ServerConfig.isCurrent(snapshot) && System.currentTimeMillis() < deadline) {
            try {
                Thread.sleep(100);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                return;
            }
        }
    }

    static void invalidate() {
        index = new Index(null, Collections.emptyList()); status = "Not scanned";
        android.content.Context context = ServerConfig.context();
        synchronized (worker) {
            generation++; if (pending != null) pending.cancel(true); worker.getQueue().clear();
            if (context != null) IndexCache.delete(context);
            else android.util.Log.w("SpicetifyServerIndex", "No context to delete the saved server index");
        }
        LocalServerHook.requestRescan();
        LibraryRows.changed();
    }

    public static void scanAsync() {
        if (android.os.Build.VERSION.SDK_INT < 26) return;
        ServerConfig.Snapshot snapshot = ServerConfig.snapshot();
        if (!snapshot.enabled || snapshot.provider() == ServerConfig.Provider.NONE) return;
        synchronized (worker) {
            if (pending != null) pending.cancel(true);
            worker.getQueue().clear();
            if (!ServerConfig.isCurrent(snapshot)) return;
            long scanId = ++generation;
            status = "Scanning…";
            pending = worker.submit(() -> { restore(snapshot, scanId); scan(snapshot, scanId); });
        }
    }

    /** Publishes the saved index for this server while a fresh scan runs. */
    private static void restore(ServerConfig.Snapshot snapshot, long scanId) {
        android.content.Context context = ServerConfig.context();
        if (context == null || index.snapshot == snapshot) return;
        List<RemoteTrack> saved = IndexCache.read(IndexCache.file(context), IndexCache.key(snapshot));
        if (saved.isEmpty() || generation != scanId) return;
        Index restored = new Index(snapshot, saved);
        ServerConfig.publish(snapshot, () -> {
            if (generation == scanId && index.snapshot != snapshot) {
                index = restored;
                LocalServerHook.requestRescan();
                LibraryRows.changed();
            }
        });
    }

    private static void publishStatus(ServerConfig.Snapshot snapshot, long scanId, String message) {
        ServerConfig.publish(snapshot, () -> { if (generation == scanId) status = message; });
    }

    private static void scan(ServerConfig.Snapshot snapshot, long scanId) {
        try {
            List<RemoteTrack> completed;
            int skipped = 0;
            if (snapshot.provider() == ServerConfig.Provider.JELLYFIN) {
                Jellyfin jellyfin = new Jellyfin(snapshot.jellyfinConnection(),
                        () -> generation == scanId && ServerConfig.isCurrent(snapshot),
                        (processed, total) -> publishStatus(snapshot, scanId, "Scanning Jellyfin: " + processed + " / " + total));
                completed = jellyfin.scan();
                skipped = jellyfin.skippedTracks();
            } else {
                WebDav dav = new WebDav(snapshot.connection(), () -> generation == scanId && ServerConfig.isCurrent(snapshot));
                List<RemoteTrack> found = dav.scan();
                completed = new ArrayList<>(found.size());
                long deadline = System.nanoTime() + 120_000_000_000L;
                for (RemoteTrack track : found) {
                    if (generation != scanId || !ServerConfig.isCurrent(snapshot) || Thread.currentThread().isInterrupted()) return;
                    if (System.nanoTime() > deadline) throw new java.io.IOException("Metadata scanning exceeded two minutes. Choose a smaller folder.");
                    publishStatus(snapshot, scanId, "Reading tags: " + (completed.size() + 1) + " / " + found.size());
                    completed.add(readTags(snapshot, track));
                }
            }
            if (Thread.currentThread().isInterrupted()) return;
            int skippedTracks = skipped;
            Index completedIndex = new Index(snapshot, completed);
            save(snapshot, scanId, completed);
            ServerConfig.publish(snapshot, () -> {
                if (generation == scanId) {
                    index = completedIndex;
                    status = "Tracks ready: " + completed.size()
                            + " · Albums: " + completedIndex.catalog.albumCount()
                            + " · Artists: " + completedIndex.catalog.artistCount()
                            + (skippedTracks == 0 ? "" : " (" + skippedTracks + " skipped)");
                    LocalServerHook.requestRescan();
                    LibraryRows.changed();
                }
            });
        } catch (JellyfinClient.AuthenticationException ex) {
            ServerConfig.publish(snapshot, () -> {
                if (generation != scanId) return;
                index = new Index(null, Collections.emptyList());
                status = "Jellyfin sign-in expired or access was denied. Sign in again.";
                LocalServerHook.requestRescan();
                LibraryRows.changed();
            });
        } catch (Exception ex) {
            String saved = index.snapshot == snapshot ? " Showing the last completed scan." : "";
            publishStatus(snapshot, scanId, (snapshot.provider() == ServerConfig.Provider.JELLYFIN
                    ? "Jellyfin scan failed. Check the server and try again."
                    : "Scan failed. Check the HTTPS WebDAV folder, credentials, and byte-range support.") + saved);
        }
    }

    /** Saves a completed scan unless the server was changed or forgotten while it was written. */
    private static void save(ServerConfig.Snapshot snapshot, long scanId, List<RemoteTrack> completed) {
        android.content.Context context = ServerConfig.context();
        String key = IndexCache.key(snapshot);
        if (context == null || key == null) return;
        java.io.File file = IndexCache.file(context);
        java.io.File written = IndexCache.write(file, key, completed);
        if (written == null) return;
        synchronized (worker) {
            if (generation == scanId) IndexCache.commit(written, file);
            else if (!written.delete()) android.util.Log.w("SpicetifyServerIndex", "Could not delete " + written);
        }
    }

    private static RemoteTrack readTags(ServerConfig.Snapshot snapshot, RemoteTrack track) throws Exception {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        long deadline = System.nanoTime() + 15_000_000_000L;
        try (ParcelFileDescriptor file = ServerFileProvider.openTrack(ServerConfig.context(), snapshot, track,
                () -> System.nanoTime() < deadline, 8L * 1024 * 1024)) {
            retriever.setDataSource(file.getFileDescriptor());
            String duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
            int seconds = duration == null ? 0 : (int) Math.min(Integer.MAX_VALUE, Long.parseLong(duration) / 1000L);
            return track.withMetadata(snapshot.connection(), retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE),
                    retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM),
                    retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST),
                    retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST),
                    tagNumber(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER)),
                    tagNumber(retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER)), seconds);
        } finally { retriever.release(); }
    }

    private static int tagNumber(String value) {
        if (value == null) return 0;
        String first = value.split("/", 2)[0].trim();
        try { return Math.max(0, Math.min(10000, Integer.parseInt(first))); }
        catch (NumberFormatException invalid) { return 0; }
    }
}
