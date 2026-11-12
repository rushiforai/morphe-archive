package app.morphe.extension.chmate;

import android.media.MediaDataSource;
import java.io.*;
import java.net.HttpURLConnection;
import java.util.*;
import java.util.regex.*;

/** Random access for MP4 metadata/frames, with a total transfer budget and deadline. */
final class BoundedVideoDataSource extends MediaDataSource {
    interface Connections { HttpURLConnection open() throws IOException; }
    private static final int BLOCK = 256 * 1024;
    private static final Pattern RANGE = Pattern.compile("bytes (\\d+)-(\\d+)/(\\d+)");
    private final Connections connections;
    private final long budget, deadline;
    private long transferred, length = -1;
    private boolean closed;
    private final LinkedHashMap<Long, byte[]> cache = new LinkedHashMap<Long, byte[]>(8, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<Long, byte[]> entry) { return size() > 4; }
    };
    BoundedVideoDataSource(Connections connections, long budget, long timeoutMs) throws IOException {
        if (budget < 1 || timeoutMs < 1) throw new IllegalArgumentException();
        this.connections = connections; this.budget = budget;
        deadline = System.nanoTime() + timeoutMs * 1000000L;
        block(0);
    }
    private int remainingTimeout() throws IOException {
        long remaining = (deadline - System.nanoTime()) / 1000000L;
        if (closed) throw new IOException("Video thumbnail source closed");
        if (remaining <= 0) throw new VideoThumbnailFailure(VideoThumbnailFailure.TIMEOUT);
        return (int)Math.min(8000L, remaining);
    }
    private byte[] block(long start) throws IOException {
        remainingTimeout();
        byte[] saved = cache.get(start); if (saved != null) return saved;
        long wanted = Math.min(BLOCK, budget - transferred);
        if (length >= 0) wanted = Math.min(wanted, length - start);
        if (wanted <= 0) throw new VideoThumbnailFailure(VideoThumbnailFailure.LIMIT);
        HttpURLConnection connection = connections.open();
        try {
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept-Encoding", "identity");
            connection.setRequestProperty("Range", "bytes=" + start + "-" + (start + wanted - 1));
            connection.setConnectTimeout(remainingTimeout()); connection.setReadTimeout(remainingTimeout());
            int status=connection.getResponseCode();
            if (status != 206) throw status==200?new VideoThumbnailFailure(VideoThumbnailFailure.RANGE):new VideoThumbnailFailure(VideoThumbnailFailure.HTTP,status);
            String encoding = connection.getContentEncoding();
            if (encoding != null && !encoding.equalsIgnoreCase("identity")) throw new VideoThumbnailFailure(VideoThumbnailFailure.RANGE);
            String header = connection.getHeaderField("Content-Range");
            Matcher range = RANGE.matcher(header == null ? "" : header);
            if (!range.matches()) throw new VideoThumbnailFailure(VideoThumbnailFailure.RANGE);
            long first, last, total;
            try { first=Long.parseLong(range.group(1)); last=Long.parseLong(range.group(2)); total=Long.parseLong(range.group(3)); }
            catch (NumberFormatException error) { throw new VideoThumbnailFailure(VideoThumbnailFailure.RANGE); }
            if (first != start || last < first || last-first >= wanted || total <= last || (length >= 0 && total != length))
                throw new VideoThumbnailFailure(VideoThumbnailFailure.RANGE);
            length = total;
            byte[] bytes = new byte[(int)(last-first+1)]; int offset = 0;
            try (InputStream input = connection.getInputStream()) {
                while (offset < bytes.length) {
                    connection.setReadTimeout(remainingTimeout());
                    int n = input.read(bytes, offset, bytes.length-offset);
                    if (n < 0) throw new EOFException("Truncated video range");
                    offset += n; transferred += n;
                }
            }
            cache.put(start, bytes); return bytes;
        } finally { connection.disconnect(); }
    }
    @Override public synchronized int readAt(long position, byte[] buffer, int offset, int size) throws IOException {
        if (position < 0 || offset < 0 || size < 0 || offset > buffer.length-size) throw new IndexOutOfBoundsException();
        remainingTimeout(); if (size == 0) return 0; if (position >= length) return -1;
        int copied = 0;
        while (copied < size && position < length) {
            long start = position / BLOCK * BLOCK;
            byte[] bytes = block(start); int at = (int)(position-start);
            if (at >= bytes.length) throw new IOException("Incomplete video range");
            int n = Math.min(size-copied, bytes.length-at);
            System.arraycopy(bytes, at, buffer, offset+copied, n); copied += n; position += n;
        }
        return copied;
    }
    @Override public synchronized long getSize() throws IOException { remainingTimeout(); return length; }
    @Override public synchronized void close() { closed = true; cache.clear(); }
    synchronized long transferredBytes() { return transferred; }
}
