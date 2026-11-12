package app.spicetify.extension.spotify.localserver;

import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.os.storage.StorageManager;
import android.provider.OpenableColumns;
import android.system.*;
import android.webkit.MimeTypeMap;
import java.io.*;
import java.util.*;
import java.util.function.BooleanSupplier;

public final class ServerFileProvider extends ContentProvider {
    private static final String SUFFIX = ".spicetify.localserver";
    private static Handler handler;

    @Override public boolean onCreate() {
        if (ServerProcess.isCurrent(getContext())) {
            ServerConfig.loadForServer(getContext());
        } else {
            ServerConfig.initialize(getContext());
            ServerIndex.scanAsync();
        }
        return true;
    }
    static Uri uriFor(RemoteTrack track) {
        return new Uri.Builder().scheme("content").authority(ServerConfig.context().getPackageName() + SUFFIX)
                .appendPath("track").appendPath(track.id).build();
    }
    private RemoteTrack trackOf(Uri uri) { return trackOf(current(), uri); }

    /** The current settings; the track server process first reloads what the main process saved. */
    private ServerConfig.Snapshot current() {
        if (ServerProcess.isCurrent(getContext())) ServerProcess.refresh(getContext());
        return ServerConfig.snapshot();
    }
    private RemoteTrack trackOf(ServerConfig.Snapshot snapshot, Uri uri) {
        if (!"content".equals(uri.getScheme()) || !(getContext().getPackageName() + SUFFIX).equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null || uri.getPathSegments().size() != 2
                || !"track".equals(uri.getPathSegments().get(0))) return null;
        return ServerIndex.byId(snapshot, uri.getPathSegments().get(1));
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        RemoteTrack track = trackOf(uri);
        if (track == null) return null;
        String[] columns = projection == null ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
        MatrixCursor result = new MatrixCursor(columns, 1);
        Object[] row = new Object[columns.length];
        for (int i = 0; i < columns.length; i++) {
            if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) row[i] = track.name;
            else if (OpenableColumns.SIZE.equals(columns[i])) row[i] = track.size;
        }
        result.addRow(row); return result;
    }
    @Override public String getType(Uri uri) {
        RemoteTrack track = trackOf(uri);
        if (track == null) return null;
        int dot = track.name.lastIndexOf('.');
        String mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(track.name.substring(dot + 1).toLowerCase(Locale.ROOT));
        return mime == null ? "application/octet-stream" : mime;
    }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Server tracks are read only.");
        ServerConfig.Snapshot snapshot = current();
        RemoteTrack track = trackOf(snapshot, uri);
        if (track == null || !ServerConfig.isCurrent(snapshot)) throw new FileNotFoundException("Server track is unavailable.");
        try { return openTrack(getContext(), snapshot, track); }
        catch (IOException ex) { throw new FileNotFoundException("Cannot open the server track."); }
    }
    static ParcelFileDescriptor openTrack(Context context, ServerConfig.Snapshot snapshot, RemoteTrack track) throws IOException {
        return openTrack(context, snapshot, track, () -> true, Long.MAX_VALUE);
    }
    static ParcelFileDescriptor openTrack(Context context, ServerConfig.Snapshot snapshot, RemoteTrack track,
            BooleanSupplier allowed, long byteBudget) throws IOException {
        if (Build.VERSION.SDK_INT < 26) throw new IOException("Server files requires Android 8 or later.");
        if (!ServerConfig.isCurrent(snapshot)) throw new IOException("Server access is disabled or changed.");
        synchronized (ServerFileProvider.class) {
            if (handler == null) { HandlerThread thread = new HandlerThread("spicetify-server-read"); thread.start(); handler = new Handler(thread.getLooper()); }
        }
        BooleanSupplier active = () -> ServerConfig.isCurrent(snapshot) && allowed.getAsBoolean();
        ProviderSession session = snapshot.provider() == ServerConfig.Provider.JELLYFIN
                ? new Jellyfin(snapshot.jellyfinConnection(), active)
                : new WebDav(snapshot.connection(), active);
        return ((StorageManager) context.getSystemService(Context.STORAGE_SERVICE)).openProxyFileDescriptor(
                ParcelFileDescriptor.MODE_READ_ONLY, new ProxyFileDescriptorCallback() {
                    private boolean closed;
                    private long remaining = byteBudget;
                    @Override public long onGetSize() { return track.size; }
                    @Override public int onRead(long offset, int size, byte[] data) throws ErrnoException {
                        if (closed) throw new ErrnoException("read", OsConstants.EBADF);
                        try {
                            if (remaining <= 0) throw new IOException("Metadata read budget exceeded.");
                            int read = session.read(track, offset, (int) Math.min(size, remaining), data);
                            remaining -= read;
                            return read;
                        }
                        catch (IOException | RuntimeException ex) { throw new ErrnoException("read", OsConstants.EIO); }
                    }
                    @Override public void onRelease() { closed = true; }
                }, handler);
    }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
