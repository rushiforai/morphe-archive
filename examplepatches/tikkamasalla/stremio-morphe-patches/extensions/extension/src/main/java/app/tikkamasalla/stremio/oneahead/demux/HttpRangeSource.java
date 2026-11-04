package app.tikkamasalla.stremio.oneahead.demux;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/**
 * Paced byte-range reads for one thread. Follows redirects by hand so the resolved link is
 * reused, leaves 206 sockets to keep-alive (no disconnect), and aborts instead of draining when a
 * server ignores Range. Every failure path sleeps first and every retry count is capped, so no
 * error can turn into a tight request loop against the debrid CDN.
 */
public final class HttpRangeSource implements RangeSource {
    /** Supplies a new link when the current one is dead; null when none can be had. */
    public interface LinkRefresher {
        String freshUrl() throws DemuxException;
    }

    private static final int MAX_HOPS = 6, MAX_REFRESHES = 2, MAX_LIMITED = 3, MAX_ERRORS = 3, MAX_DROPS = 5;
    private static final int IO_STEP = 64 * 1024;
    private static final long MAX_RETRY_AFTER_MS = 5 * 60 * 1000L;

    private final PlaybackGuard guard;
    private final ByteBudget budget;
    private final LinkRefresher refresher;
    private final long paceBytesPerSec;
    private final String userAgent;
    private String url;
    private String resolved;
    private long length = -1;
    private String etag;
    private boolean rangesIgnored;
    private long fetched;
    private int requests, refreshes, limited, errors, drops;
    private long paceStartNs, pacedBytes;
    private long notBeforeMs;

    public long connectTimeoutMs = 8000, readTimeoutMs = 15000;
    /** Base of the backoffs, shortened only by tests. */
    public long backoffUnitMs = 1000;

    public HttpRangeSource(String url, PlaybackGuard guard, ByteBudget budget, long paceBytesPerSec,
                           LinkRefresher refresher, String userAgent) {
        this.url = url;
        this.guard = guard;
        this.budget = budget;
        this.paceBytesPerSec = paceBytesPerSec;
        this.refresher = refresher;
        this.userAgent = userAgent;
    }

    @Override
    public long length() {
        return length;
    }

    @Override
    public long bytesFetched() {
        return fetched;
    }

    @Override
    public int requests() {
        return requests;
    }

    @Override
    public int read(long pos, byte[] dst, int off, int len) throws DemuxException {
        if (length >= 0 && pos >= length) return 0;
        if (length >= 0) len = (int) Math.min(len, length - pos);
        if (rangesIgnored && pos > 0) throw new DemuxException(DemuxException.Kind.NO_RANGE_SUPPORT, "server sent 200");
        while (true) {
            await();
            budget.check(len);
            long waitMs = notBeforeMs - System.currentTimeMillis();
            if (waitMs > 0) sleep(waitMs);
            try {
                int got = fetch(pos, dst, off, len);
                errors = 0;
                limited = 0;
                return got;
            } catch (IOException error) {
                if (++errors > MAX_ERRORS) {
                    throw new DemuxException(DemuxException.Kind.IO, error.getClass().getSimpleName());
                }
                sleep(backoffUnitMs * 2 * pow3(errors - 1));
            }
        }
    }

    private int fetch(long pos, byte[] dst, int off, int len) throws IOException, DemuxException {
        String target = resolved != null ? resolved : url;
        for (int hop = 0; hop < MAX_HOPS; hop++) {
            requests++;
            HttpURLConnection c = (HttpURLConnection) new URL(target).openConnection();
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout((int) connectTimeoutMs);
            c.setReadTimeout((int) readTimeoutMs);
            c.setRequestProperty("Range", "bytes=" + pos + "-" + (pos + len - 1));
            // Android's stack would otherwise ask for gzip, which breaks byte positions.
            c.setRequestProperty("Accept-Encoding", "identity");
            if (userAgent != null) c.setRequestProperty("User-Agent", userAgent);
            int code = c.getResponseCode();
            if (code >= 300 && code < 400) {
                String location = c.getHeaderField("Location");
                discardAndClose(c);
                if (location == null) throw new DemuxException(DemuxException.Kind.IO, "redirect without target");
                target = new URL(new URL(target), location).toString();
                continue;
            }
            if (code == 206 || (code == 200 && pos == 0)) {
                checkIdentity(c, code, pos);
                resolved = target;
                return readBody(c, code, dst, off, len);
            }
            if (code == 200) {
                c.disconnect();
                rangesIgnored = true;
                throw new DemuxException(DemuxException.Kind.NO_RANGE_SUPPORT, "server sent 200");
            }
            if (code == 416) {
                long total = totalOf(c.getHeaderField("Content-Range"));
                discardAndClose(c);
                if (total >= 0) length = total;
                return 0;
            }
            String retryAfter = c.getHeaderField("Retry-After");
            discardAndClose(c);
            handleRefusal(code, retryAfter);
            target = resolved != null ? resolved : url;
            hop = -1; // A refusal that was handled starts a new request, not another hop.
        }
        throw new DemuxException(DemuxException.Kind.IO, "too many redirects");
    }

    private void handleRefusal(int code, String retryAfter) throws DemuxException {
        if (code == 401 || code == 403 || code == 404 || code == 410 || code == 451) {
            if (resolved != null && !resolved.equals(url)) {
                resolved = null; // The CDN link died: ask the original link again.
            } else if (refresher != null && refreshes < MAX_REFRESHES) {
                String fresh = refresher.freshUrl();
                if (fresh == null) throw new DemuxException(DemuxException.Kind.LINK_EXPIRED, "HTTP " + code);
                url = fresh;
                resolved = null;
            } else {
                throw new DemuxException(DemuxException.Kind.LINK_EXPIRED, "HTTP " + code);
            }
            if (++refreshes > MAX_REFRESHES) throw new DemuxException(DemuxException.Kind.LINK_EXPIRED, "HTTP " + code);
            sleep(backoffUnitMs);
            return;
        }
        if (code == 429 || code == 503 || code == 509) {
            if (++limited > MAX_LIMITED) throw new DemuxException(DemuxException.Kind.RATE_LIMITED, "HTTP " + code);
            long waitMs = Math.max(parseRetryAfterMs(retryAfter), backoffUnitMs * 5 * pow3(limited - 1));
            if (waitMs > MAX_RETRY_AFTER_MS) throw new DemuxException(DemuxException.Kind.RATE_LIMITED, "wait too long");
            notBeforeMs = System.currentTimeMillis() + waitMs;
            sleep(waitMs);
            return;
        }
        // Debrid redirectors answer 500 now and then: back off, then give up.
        if (++errors > MAX_ERRORS) throw new DemuxException(DemuxException.Kind.IO, "HTTP " + code);
        sleep(backoffUnitMs * 2 * pow3(errors - 1));
    }

    /** The response's Content-Length, or -1 when absent or malformed. */
    private static long contentLength(HttpURLConnection c) {
        try {
            String v = c.getHeaderField("Content-Length");
            if (v == null) return -1;
            return Long.parseLong(v.trim());
        } catch (RuntimeException malformed) {
            return -1;
        }
    }

    private void checkIdentity(HttpURLConnection c, int code, long pos) throws DemuxException {
        long total;
        if (code == 206) {
            String range = c.getHeaderField("Content-Range");
            total = totalOf(range);
            if (startOf(range) != pos) {
                c.disconnect();
                throw new DemuxException(DemuxException.Kind.FILE_CHANGED, "range starts elsewhere");
            }
        } else {
            total = contentLength(c);
            rangesIgnored = true;
        }
        String tag = c.getHeaderField("ETag");
        if ((length >= 0 && total >= 0 && total != length) || (etag != null && tag != null && !etag.equals(tag))) {
            c.disconnect();
            throw new DemuxException(DemuxException.Kind.FILE_CHANGED, "size or tag differs");
        }
        if (total >= 0) length = total;
        if (tag != null) etag = tag;
    }

    /** Body bytes count as they arrive. A dropped connection returns what it delivered. */
    private int readBody(HttpURLConnection c, int code, byte[] dst, int off, int len) throws IOException, DemuxException {
        int got = 0;
        boolean clean = false;
        InputStream in = c.getInputStream();
        try {
            while (got < len) {
                await();
                int n = in.read(dst, off + got, Math.min(IO_STEP, len - got));
                if (n <= 0) break;
                got += n;
                fetched += n;
                budget.add(n);
                pace(n);
            }
            // A short 206 means the socket ended early; 200 and an over-long 206 cannot be drained.
            clean = got == len && code == 206 && contentLength(c) == len;
        } catch (IOException error) {
            if (got == 0) throw error;
        } finally {
            if (clean) {
                try {
                    in.close();
                } catch (IOException ignored) {
                    // Only loses the keep-alive socket.
                }
            } else {
                c.disconnect();
            }
        }
        if (got < len && !(length >= 0 && contentLength(c) == got)) {
            if (++drops > MAX_DROPS) throw new DemuxException(DemuxException.Kind.IO, "connection keeps dropping");
            sleep(backoffUnitMs * drops);
            if (got == 0) throw new IOException("empty body");
        } else {
            drops = 0;
        }
        return got;
    }

    private void pace(int n) throws DemuxException {
        if (paceBytesPerSec <= 0) return;
        long now = System.nanoTime();
        if (now - paceStartNs > 2_000_000_000L + pacedBytes * 1_000_000_000L / paceBytesPerSec) {
            paceStartNs = now; // Idle for a while: no credit for the pause.
            pacedBytes = 0;
        }
        pacedBytes += n;
        long aheadNs = pacedBytes * 1_000_000_000L / paceBytesPerSec - (now - paceStartNs);
        if (aheadNs > 5_000_000L) sleep(aheadNs / 1_000_000L);
    }

    private void await() throws DemuxException {
        while (true) {
            if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
            if (!guard.shouldPause()) return;
            nap(250);
        }
    }

    /** Sleeps in steps so a cancel is seen quickly. */
    private void sleep(long ms) throws DemuxException {
        long end = System.currentTimeMillis() + ms;
        while (true) {
            if (guard.isCancelled()) throw new DemuxException(DemuxException.Kind.CANCELLED, "cancelled");
            long left = end - System.currentTimeMillis();
            if (left <= 0) return;
            nap(Math.min(left, 250));
        }
    }

    private static void nap(long ms) throws DemuxException {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            throw new DemuxException(DemuxException.Kind.CANCELLED, "interrupted");
        }
    }

    private static void discardAndClose(HttpURLConnection c) {
        try {
            InputStream body = c.getErrorStream();
            if (body != null) body.close();
        } catch (IOException ignored) {
            // Nothing to do: the socket is simply not reused.
        }
        c.disconnect();
    }

    private static long pow3(int n) {
        long v = 1;
        for (int i = 0; i < n; i++) v *= 3;
        return v;
    }

    /** "bytes 0-99/1000" gives 0; -1 when absent or malformed. */
    static long startOf(String contentRange) {
        if (contentRange == null) return -1;
        try {
            String s = contentRange.trim().toLowerCase(Locale.ROOT);
            if (!s.startsWith("bytes")) return -1;
            s = s.substring(5).trim();
            return Long.parseLong(s.substring(0, s.indexOf('-')).trim());
        } catch (RuntimeException malformed) {
            return -1;
        }
    }

    /** "bytes 0-99/1000" or "bytes * /1000" gives 1000; -1 when absent or "*". */
    static long totalOf(String contentRange) {
        if (contentRange == null) return -1;
        try {
            return Long.parseLong(contentRange.substring(contentRange.indexOf('/') + 1).trim());
        } catch (RuntimeException malformed) {
            return -1;
        }
    }

    static long parseRetryAfterMs(String value) {
        if (value == null) return 0;
        try {
            return Long.parseLong(value.trim()) * 1000L;
        } catch (NumberFormatException httpDate) {
            return 60_000L; // A date form: do not parse it, just wait a long moment.
        }
    }
}
