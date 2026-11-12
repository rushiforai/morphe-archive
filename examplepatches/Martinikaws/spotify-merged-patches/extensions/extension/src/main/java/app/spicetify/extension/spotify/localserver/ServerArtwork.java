package app.spicetify.extension.spotify.localserver;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.util.LruCache;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

/** Artwork for catalog items, scaled by the server to {@code size} pixels; URLs are empty when there is none. */
public final class ServerArtwork {
    private static final String TAG = "SpicetifyArtwork";
    private static final int PLAYER_SIZE = 640;
    private static final int MAX_BYTES = 8 * 1024 * 1024;
    private static final byte[] NONE = new byte[0];
    private static final LruCache<String, byte[]> images = new LruCache<String, byte[]>(16 * 1024 * 1024) {
        @Override protected int sizeOf(String key, byte[] value) { return Math.max(1, value.length); }
    };

    private ServerArtwork() {}

    public static String album(MusicCatalog.Album album, int size) {
        return album == null ? "" : LibraryRows.image(ServerConfig.snapshot().jellyfinConnection(), album.id, album.imageTag, size);
    }

    public static String artist(MusicCatalog.Artist artist, int size) {
        return artist == null ? "" : LibraryRows.image(ServerConfig.snapshot().jellyfinConnection(), artist.id, "", size);
    }

    /**
     * Runs where Spotify reads the picture embedded in a local file, for example for Now Playing. Returns the
     * album image of a Jellyfin track (empty when it has none, so the audio file is never downloaded for it),
     * or null for every other file so Spotify reads the picture itself.
     */
    public static byte[] bytes(String uri) {
        try {
            Context context = ServerConfig.context();
            Uri parsed = uri == null || context == null ? null : Uri.parse(uri);
            if (parsed == null || !"content".equals(parsed.getScheme())
                    || !(context.getPackageName() + ".spicetify.localserver").equals(parsed.getAuthority())) return null;
            List<String> path = parsed.getPathSegments();
            if (path.size() != 2 || !"track".equals(path.get(0))) return null;
            ServerConfig.Snapshot snapshot = ServerConfig.snapshot();
            if (!snapshot.enabled) return null;
            ServerIndex.awaitIndex(snapshot, 15_000);
            RemoteTrack track = ServerIndex.byId(snapshot, path.get(1));
            if (track == null || track.providerIdentity == null) return null;
            String url = album(ServerIndex.catalog().albumOf(track.id), PLAYER_SIZE);
            if (url.isEmpty()) return NONE;
            byte[] cached = images.get(url);
            if (cached != null) return cached;
            byte[] image = fetch(url);
            if (image.length > 0) images.put(url, image);
            return image;
        } catch (RuntimeException error) {
            Log.w(TAG, "Could not read artwork for " + uri, error);
            return null;
        }
    }

    private static byte[] fetch(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(15_000);
            if (connection.getResponseCode() != 200) return NONE;
            try (InputStream in = connection.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) {
                    out.write(buffer, 0, read);
                    if (out.size() > MAX_BYTES) throw new IOException("Artwork is larger than " + MAX_BYTES + " bytes");
                }
                return out.toByteArray();
            }
        } catch (IOException | RuntimeException error) {
            Log.w(TAG, "Could not download " + url, error);
            return NONE;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
