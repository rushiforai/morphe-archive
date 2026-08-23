package app.noam.extension.spotify.localserver;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.ParcelFileDescriptor;
import android.os.ProxyFileDescriptorCallback;
import android.os.storage.StorageManager;
import android.provider.OpenableColumns;
import android.system.ErrnoException;
import android.system.OsConstants;
import android.webkit.MimeTypeMap;

import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.Locale;

import app.noam.extension.spotify.Utils;

/**
 * Serves the remote tracks to Spotify as {@code content://} URIs.
 *
 * Spotify stores a local track's location as a plain URI string and opens it through the content
 * resolver, so a provider inside the app is enough to make server files behave like device files —
 * no shared storage, no permissions, and no copy of the library on the phone.
 */
public final class ServerFileProvider extends ContentProvider {

    private static final String AUTHORITY_SUFFIX = ".morphe.localserver";
    private static final String PATH = "track";

    private HandlerThread handlerThread;
    private Handler handler;

    @Override
    public boolean onCreate() {
        // Providers are created before the application object, so this is the earliest and most
        // reliable place to capture the context for the rest of the extension.
        Utils.setContext(getContext());
        rescanInBackground();
        return true;
    }

    /**
     * Refreshes the index once per app start, so tracks added to the server folder appear without
     * anyone having to open the settings and scan by hand.
     *
     * Deliberately tied to process start rather than a watcher or a timer: no background service, no
     * wake locks, and nothing that can race Spotify's own file scanner while the app is running.
     */
    private void rescanInBackground() {
        if (!ServerConfig.isEnabled() || !ServerConfig.isConfigured()) return;

        new Thread(() -> {
            try {
                int found = ServerIndex.refresh(null).size();
                Utils.log("Rescanned the server folder on startup: " + found + " tracks");

                // Ask Spotify to read local files again, now that the index has changed.
                LocalServerHook.requestRescan();
            } catch (Exception ex) {
                // A server that is unreachable at startup must not stop the app; the previous index
                // stays in place and the settings screen can always scan again.
                Utils.log("Startup rescan failed: " + ex);
            }
        }, "morphe-startup-scan").start();
    }

    public static String authority(Context context) {
        return context.getPackageName() + AUTHORITY_SUFFIX;
    }

    public static Uri uriFor(RemoteTrack track) {
        Context context = Utils.getContext();
        return new Uri.Builder()
                .scheme("content")
                .authority(authority(context))
                .appendPath(PATH)
                .appendPath(track.id())
                .appendPath(track.name)
                .build();
    }

    private static RemoteTrack trackOf(Uri uri) {
        java.util.List<String> segments = uri.getPathSegments();
        if (segments.size() < 2 || !PATH.equals(segments.get(0))) return null;
        return ServerIndex.byId(segments.get(1));
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        RemoteTrack track = trackOf(uri);
        if (track == null) return null;

        String[] columns = projection != null ? projection
                : new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE};
        MatrixCursor cursor = new MatrixCursor(columns, 1);

        Object[] row = new Object[columns.length];
        for (int i = 0; i < columns.length; i++) {
            if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) {
                row[i] = track.name;
            } else if (OpenableColumns.SIZE.equals(columns[i])) {
                row[i] = track.size;
            } else if ("_data".equals(columns[i])) {
                row[i] = null;
            }
        }
        cursor.addRow(row);
        return cursor;
    }

    @Override
    public String getType(Uri uri) {
        RemoteTrack track = trackOf(uri);
        if (track == null) return null;

        String extension = "";
        int dot = track.name.lastIndexOf('.');
        if (dot >= 0) extension = track.name.substring(dot + 1).toLowerCase(Locale.US);

        String mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
        return mime != null ? mime : "audio/*";
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws java.io.FileNotFoundException {
        RemoteTrack track = trackOf(uri);
        if (track == null) throw new java.io.FileNotFoundException("Unknown track: " + uri);

        try {
            File cached = cacheFile(track);
            if (cached.exists() && cached.length() > 0) {
                return ParcelFileDescriptor.open(cached, ParcelFileDescriptor.MODE_READ_ONLY);
            }

            if (ServerConfig.isStreaming() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                return openStreaming(track);
            }

            download(track, cached);
            return ParcelFileDescriptor.open(cached, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (Exception ex) {
            Utils.logError("Could not open " + track.name, ex);
            throw new java.io.FileNotFoundException("Could not open " + track.name + ": " + ex);
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private ParcelFileDescriptor openStreaming(RemoteTrack track) throws IOException {
        Context context = getContext();
        StorageManager storageManager = (StorageManager) context.getSystemService(Context.STORAGE_SERVICE);

        synchronized (this) {
            if (handler == null) {
                handlerThread = new HandlerThread("morphe-local-server");
                handlerThread.start();
                handler = new Handler(handlerThread.getLooper());
            }
        }

        return storageManager.openProxyFileDescriptor(
                ParcelFileDescriptor.MODE_READ_ONLY, new RangeReader(track), handler);
    }

    /** Reads a remote file on demand, reusing the open connection while reads run forward. */
    @RequiresApi(Build.VERSION_CODES.O)
    private static final class RangeReader extends ProxyFileDescriptorCallback {

        private final RemoteTrack track;
        private final WebDav webDav = WebDav.fromConfig();

        private HttpURLConnection connection;
        private InputStream stream;
        private long streamPosition = -1;

        RangeReader(RemoteTrack track) {
            this.track = track;
        }

        @Override
        public long onGetSize() {
            return track.size;
        }

        @Override
        public int onRead(long offset, int size, byte[] data) throws ErrnoException {
            try {
                if (stream == null || offset != streamPosition) reopen(offset);

                int read = 0;
                while (read < size) {
                    int count = stream.read(data, read, size - read);
                    if (count < 0) break;
                    read += count;
                }
                streamPosition = offset + read;
                return read;
            } catch (Exception ex) {
                Utils.logError("Streaming " + track.name + " failed", ex);
                close();
                throw new ErrnoException("onRead", OsConstants.EIO);
            }
        }

        private void reopen(long offset) throws IOException {
            close();
            connection = webDav.openRange(track.url, offset, -1);
            stream = connection.getInputStream();
            streamPosition = offset;
        }

        @Override
        public void onRelease() {
            close();
        }

        private void close() {
            try {
                if (stream != null) stream.close();
            } catch (Exception ignored) {
                // The stream is being discarded either way.
            }
            if (connection != null) connection.disconnect();
            stream = null;
            connection = null;
            streamPosition = -1;
        }
    }

    private void download(RemoteTrack track, File destination) throws IOException {
        File parent = destination.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IOException("Could not create the cache directory");
        }

        File partial = new File(destination.getPath() + ".part");
        HttpURLConnection connection = WebDav.fromConfig().openRange(track.url, 0, -1);
        try (InputStream in = connection.getInputStream(); FileOutputStream out = new FileOutputStream(partial)) {
            byte[] buffer = new byte[64 * 1024];
            int count;
            while ((count = in.read(buffer)) > 0) out.write(buffer, 0, count);
        } finally {
            connection.disconnect();
        }

        if (!partial.renameTo(destination)) {
            throw new IOException("Could not store " + track.name);
        }
    }

    private File cacheFile(RemoteTrack track) {
        return new File(cacheDirectory(getContext()), track.id() + suffix(track.name));
    }

    private static String suffix(String name) {
        int dot = name.lastIndexOf('.');
        return dot >= 0 ? name.substring(dot) : "";
    }

    public static File cacheDirectory(Context context) {
        return new File(context.getCacheDir(), "morphe-local-server");
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }
}
