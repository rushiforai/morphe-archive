package nl.johninnl.medium.reader;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import java.io.*;
import java.net.URI;
import java.util.concurrent.*;

/** Non-exported bridge to the native image loader. Pipe I/O and HTTPS run off the UI thread. */
public final class ReaderImageProvider extends ContentProvider {
    private static final ExecutorService IO = new ThreadPoolExecutor(2, 2, 30, TimeUnit.SECONDS,
        new ArrayBlockingQueue<>(32), runnable -> { Thread thread = new Thread(runnable, "medium-reader-images"); thread.setDaemon(true); return thread; });
    @Override public boolean onCreate() { return true; }
    @Override public String getType(Uri uri) { return "image/*"; }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException { return openFile(uri, mode, null); }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode, CancellationSignal signal) throws FileNotFoundException {
        String id = uri.getLastPathSegment();
        URI source = ReaderImages.source(id);
        ImageCache cache = ReaderImages.cache();
        if (!"r".equals(mode) || source == null || cache == null || !"com.medium.reader.native-reader.images".equals(uri.getAuthority()) ||
            uri.getPathSegments().size() != 1 || uri.getQuery() != null) throw new FileNotFoundException("Unknown reader image");
        Cancellation cancellation = new Cancellation();
        if (signal != null) signal.setOnCancelListener(cancellation::cancel);
        ParcelFileDescriptor[] pipe;
        try { pipe = ParcelFileDescriptor.createReliablePipe(); }
        catch (IOException failure) { throw missing(failure); }
        try {
            IO.execute(() -> {
                try {
                    File file = cache.get(id, source, cancellation);
                    try (InputStream input = new FileInputStream(file); OutputStream output = new ParcelFileDescriptor.AutoCloseOutputStream(pipe[1])) {
                        byte[] buffer = new byte[8192]; int count;
                        while ((count = input.read(buffer)) != -1) { cancellation.check(); output.write(buffer, 0, count); }
                    }
                } catch (IOException | ArticleException failure) {
                    try { pipe[1].closeWithError("Reader image unavailable"); } catch (IOException ignored) { }
                } finally { if (signal != null) signal.setOnCancelListener(null); }
            });
            return pipe[0];
        } catch (RejectedExecutionException busy) {
            try { pipe[0].close(); pipe[1].close(); } catch (IOException ignored) { }
            throw missing(busy);
        }
    }
    private static FileNotFoundException missing(Exception failure) {
        FileNotFoundException missing = new FileNotFoundException("Reader image unavailable"); missing.initCause(failure); return missing;
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] arguments, String sort) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] arguments) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] arguments) { throw new UnsupportedOperationException(); }
}
