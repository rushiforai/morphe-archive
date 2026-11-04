package app.wordfeudwordfinder.extension.hooks;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.IdentityHashMap;
import java.util.Map;

/**
 * Collects response body chunks per request object, for every Wordfeud API response (games can arrive from more
 * endpoints than games/detail and move, e.g. when Wordfeud reloads the open game); each body is capped at
 * {@link #MAX_BODY}. Bodies are handed on once and never kept or logged.
 */
public final class ResponseAssembler {
    static final int MAX_BODY = 8 * 1024 * 1024;
    private static final String PREFIX = "https://api.wordfeud.com/wf/";

    public static final class Completed {
        public final String url;
        public final String body;

        Completed(String url, String body) {
            this.url = url;
            this.body = body;
        }
    }

    private static final class Entry {
        final String url;
        final ByteArrayOutputStream out = new ByteArrayOutputStream();

        Entry(String url) {
            this.url = url;
        }
    }

    private final Map<Object, Entry> entries = new IdentityHashMap<>();

    public static boolean isRelevant(String url) {
        return url != null && url.startsWith(PREFIX);
    }

    public synchronized void started(Object request, String url) {
        if (request == null) return;
        if (isRelevant(url)) entries.put(request, new Entry(url));
        else entries.remove(request);
    }

    public synchronized void read(Object request, ByteBuffer buf) {
        if (request == null || buf == null) return;
        Entry e = entries.get(request);
        if (e == null) return;
        ByteBuffer d = buf.duplicate();
        int n = d.position();
        if (n <= 0) return;
        if ((long) e.out.size() + n > MAX_BODY) {
            entries.remove(request);
            return;
        }
        byte[] tmp = new byte[n];
        d.position(0);
        d.get(tmp, 0, n);
        e.out.write(tmp, 0, n);
    }

    public synchronized Completed succeeded(Object request) {
        Entry e = entries.remove(request);
        if (e == null) return null;
        return new Completed(e.url, new String(e.out.toByteArray(), StandardCharsets.UTF_8));
    }

    public synchronized void dropped(Object request) {
        entries.remove(request);
    }
}
