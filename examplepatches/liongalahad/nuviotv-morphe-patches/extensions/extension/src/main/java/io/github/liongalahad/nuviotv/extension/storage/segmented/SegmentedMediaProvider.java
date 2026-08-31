package io.github.liongalahad.nuviotv.extension.storage.segmented;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.ParcelFileDescriptor;
import android.os.ProxyFileDescriptorCallback;
import android.os.SystemClock;
import android.os.storage.StorageManager;
import android.system.ErrnoException;
import android.system.OsConstants;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;

/** Read-only seekable virtual file that concatenates generic segmented-media parts. */
public final class SegmentedMediaProvider extends ContentProvider {
    @Override public boolean onCreate() { return true; }

    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Segmented media is read-only");
        Context context = getContext();
        if (context == null) throw new FileNotFoundException("Application context is unavailable");
        Uri manifestUri = SegmentedMedia.manifestUri(uri);
        String bundleId = SegmentedMedia.bundleId(uri);
        try {
            SegmentedMedia.Manifest manifest = SegmentedMedia.read(context, manifestUri);
            if (!manifest.bundleId.equals(bundleId) || !SegmentedMedia.isReadable(context, manifest)) {
                throw new FileNotFoundException("Segmented media is incomplete");
            }
            StorageManager manager = context.getSystemService(StorageManager.class);
            if (manager == null) throw new FileNotFoundException("Storage manager is unavailable");
            HandlerThread thread = new HandlerThread("MorpheSegmentedMedia");
            thread.start();
            try {
                Callback callback = new Callback(context, manifest, thread);
                SegmentedPlaybackDiagnostics.descriptorOpened(manifest);
                return manager.openProxyFileDescriptor(ParcelFileDescriptor.MODE_READ_ONLY,
                        callback, new Handler(thread.getLooper()));
            } catch (IOException error) {
                thread.quitSafely();
                throw error;
            }
        } catch (FileNotFoundException error) {
            throw error;
        } catch (Exception error) {
            FileNotFoundException failure = new FileNotFoundException(
                    "Unable to open segmented media: " + error.getMessage());
            failure.initCause(error);
            throw failure;
        }
    }

    @Override public String getType(Uri uri) {
        Context context = getContext();
        if (context == null) return "application/octet-stream";
        try {
            return SegmentedMedia.read(context, SegmentedMedia.manifestUri(uri)).mimeType;
        } catch (IOException error) {
            return "application/octet-stream";
        }
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection,
                                  String[] selectionArgs, String sortOrder) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection,
                                String[] selectionArgs) { return 0; }

    static final class Callback extends ProxyFileDescriptorCallback {
        private final Context context;
        private final SegmentedMedia.Manifest manifest;
        private final HandlerThread thread;
        private final long[] starts;
        private final List<Handle> handles;
        private long previousReadFinishedNs;
        private long previousReadEndOffset = -1L;
        private int previousLastSegment = -1;

        Callback(Context context, SegmentedMedia.Manifest manifest, HandlerThread thread)
                throws IOException {
            this.context = context;
            this.manifest = manifest;
            this.thread = thread;
            this.starts = new long[manifest.segments.size()];
            this.handles = new ArrayList<>();
            long start = 0L;
            for (int index = 0; index < manifest.segments.size(); index++) {
                starts[index] = start;
                start += manifest.segments.get(index).length;
                handles.add(null);
            }
            try {
                // Open every physical part before handing the descriptor to Media3. Boundary
                // reads then involve only channel reads, never a storage-provider open call.
                for (int index = 0; index < handles.size(); index++) handle(index);
            } catch (IOException | RuntimeException error) {
                for (Handle handle : handles) if (handle != null) handle.close();
                if (error instanceof IOException) throw (IOException) error;
                throw new IOException("Unable to prepare media segments", error);
            }
        }

        @Override public long onGetSize() { return manifest.totalLength; }

        @Override public synchronized int onRead(long offset, int size, byte[] data)
                throws ErrnoException {
            long startedNs = SystemClock.elapsedRealtimeNanos();
            if (offset < 0L || size < 0) throw new ErrnoException("onRead", OsConstants.EINVAL);
            if (offset >= manifest.totalLength || size == 0) return 0;
            int requested = (int) Math.min((long) size, manifest.totalLength - offset);
            int copied = 0;
            int firstSegment = -1;
            int lastSegment = -1;
            try {
                while (copied < requested) {
                    long logicalOffset = offset + copied;
                    int segmentIndex = segmentIndex(logicalOffset);
                    if (firstSegment < 0) firstSegment = segmentIndex;
                    lastSegment = segmentIndex;
                    SegmentedMedia.Segment segment = manifest.segments.get(segmentIndex);
                    long localOffset = logicalOffset - starts[segmentIndex];
                    int count = (int) Math.min((long) requested - copied,
                            segment.length - localOffset);
                    Handle handle = handle(segmentIndex);
                    handle.channel.position(localOffset);
                    ByteBuffer destination = ByteBuffer.wrap(data, copied, count);
                    int read = 0;
                    while (read < count) {
                        int next = handle.channel.read(destination);
                        if (next < 0) throw new IOException("Media segment ended early");
                        if (next == 0) throw new IOException("Media segment returned no data");
                        read += next;
                    }
                    copied += count;
                }
                long finishedNs = SystemClock.elapsedRealtimeNanos();
                boolean sequentialBoundary = previousReadEndOffset == offset &&
                        previousLastSegment >= 0 && firstSegment != previousLastSegment;
                long gapUs = previousReadFinishedNs <= 0L ? -1L :
                        Math.max(0L, (startedNs - previousReadFinishedNs) / 1_000L);
                SegmentedPlaybackDiagnostics.readCompleted(manifest.bundleId, offset, copied,
                        firstSegment, lastSegment, sequentialBoundary,
                        Math.max(0L, (finishedNs - startedNs) / 1_000L), gapUs);
                previousReadFinishedNs = finishedNs;
                previousReadEndOffset = offset + copied;
                previousLastSegment = lastSegment;
                return copied;
            } catch (IOException | RuntimeException error) {
                throw new ErrnoException("onRead", OsConstants.EIO, error);
            }
        }

        private int segmentIndex(long offset) throws IOException {
            for (int index = starts.length - 1; index >= 0; index--) {
                if (offset >= starts[index]) return index;
            }
            throw new IOException("Invalid segmented media offset");
        }

        private Handle handle(int index) throws IOException {
            Handle existing = handles.get(index);
            if (existing != null) return existing;
            ParcelFileDescriptor descriptor = context.getContentResolver().openFileDescriptor(
                    manifest.segments.get(index).uri, "r");
            if (descriptor == null) throw new IOException("Media segment could not be opened");
            Handle created = new Handle(descriptor);
            handles.set(index, created);
            return created;
        }

        synchronized int openedHandleCount() {
            int count = 0;
            for (Handle handle : handles) if (handle != null) count++;
            return count;
        }

        @Override public synchronized void onRelease() {
            for (Handle handle : handles) if (handle != null) handle.close();
            thread.quitSafely();
        }
    }

    private static final class Handle {
        final ParcelFileDescriptor descriptor;
        final FileInputStream input;
        final FileChannel channel;

        Handle(ParcelFileDescriptor descriptor) {
            this.descriptor = descriptor;
            this.input = new FileInputStream(descriptor.getFileDescriptor());
            this.channel = input.getChannel();
        }

        void close() {
            try { input.close(); } catch (IOException ignored) { }
            try { descriptor.close(); } catch (IOException ignored) { }
        }
    }
}
