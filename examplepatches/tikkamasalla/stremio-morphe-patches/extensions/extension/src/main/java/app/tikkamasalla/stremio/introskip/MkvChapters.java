package app.tikkamasalla.stremio.introskip;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Reads the chapter list of a Matroska/WebM stream with HTTP range requests (Media3's
 * MatroskaExtractor drops chapters). Head first; Chapters elsewhere are found via SeekHead.
 */
final class MkvChapters {
    static final class Chapter {
        final double start;
        double end;
        final String name;

        Chapter(double start, double end, String name) {
            this.start = start;
            this.end = end;
            this.name = name;
        }
    }

    interface Log {
        void log(String message);
    }

    private static final int ID_EBML = 0x1A45DFA3, ID_SEGMENT = 0x18538067, ID_SEEKHEAD = 0x114D9B74,
            ID_SEEK = 0x4DBB, ID_SEEKID = 0x53AB, ID_SEEKPOS = 0x53AC, ID_INFO = 0x1549A966,
            ID_SCALE = 0x2AD7B1, ID_DURATION = 0x4489, ID_CHAPTERS = 0x1043A770, ID_CLUSTER = 0x1F43B675,
            ID_EDITION = 0x45B9, ID_ED_HIDDEN = 0x45BD, ID_ED_DEFAULT = 0x45DB, ID_ATOM = 0xB6,
            ID_TSTART = 0x91, ID_TEND = 0x92, ID_HIDDEN = 0x98, ID_ENABLED = 0x4598, ID_SEGUID = 0x6E67,
            ID_DISPLAY = 0x80, ID_STRING = 0x85;
    private static final int HEAD = 256 * 1024;

    private final String url;
    private final Log log;
    private String resolved;
    private long segData = -1;
    private double scale = 1e6;
    private double duration = -1;
    final List<Chapter> chapters = new ArrayList<>();
    int requests;

    private MkvChapters(String url, Log log) {
        this.url = url;
        this.log = log;
    }

    /** Never throws; an empty list means no usable chapters. */
    static List<Chapter> read(String url, Log log) {
        MkvChapters reader = new MkvChapters(url, log);
        try {
            reader.run();
        } catch (Throwable error) {
            log.log("Chapters: error " + error);
            reader.chapters.clear();
        }
        return reader.chapters;
    }

    private void run() throws Exception {
        byte[] head = fetch(0, HEAD);
        if (head.length < 64 || readId(head, 0) != ID_EBML) {
            log.log("Chapters: not a Matroska file");
            return;
        }
        int p = 0;
        long ebmlSize = readSize(head, p + idLen(head[p]));
        p = p + idLen(head[p]) + sizeLen(head[p + idLen(head[p])]) + (int) ebmlSize;
        if (readId(head, p) != ID_SEGMENT) {
            log.log("Chapters: no Segment");
            return;
        }
        p += idLen(head[p]);
        p += sizeLen(head[p]);
        segData = p;
        List<long[]> seeks = new ArrayList<>();
        long chaptersAt = -1;
        int inHeadBody = -1;
        int inHeadSize = 0;
        // Walk the top-level children that are in the head buffer.
        while (p + 12 < head.length) {
            int id = readId(head, p);
            int il = idLen(head[p]);
            if (il == 0) break;
            int sl = sizeLen(head[p + il]);
            if (sl == 0) break;
            long size = readSize(head, p + il);
            int body = p + il + sl;
            if (id == ID_CLUSTER || size < 0) break;
            if (body + size <= head.length) {
                if (id == ID_SEEKHEAD) parseSeekHead(head, body, (int) size, seeks);
                else if (id == ID_INFO) parseInfo(head, body, (int) size);
                else if (id == ID_CHAPTERS) {
                    // Parse after the walk: an Info element after Chapters still gives the duration.
                    inHeadBody = body;
                    inHeadSize = (int) size;
                }
            } else if (id == ID_CHAPTERS) {
                chaptersAt = p - segData;
                break;
            }
            p = (int) Math.min(Integer.MAX_VALUE, body + size);
        }
        if (inHeadBody >= 0) {
            parseChapters(head, inHeadBody, inHeadSize);
            return;
        }
        // Not in the head: follow SeekHead (including a second SeekHead, often at the end).
        for (int round = 0; round < 3 && chaptersAt < 0; round++) {
            long nextSeekHead = -1;
            for (long[] seek : seeks) {
                if (seek[0] == ID_CHAPTERS) chaptersAt = seek[1];
                else if (seek[0] == ID_INFO && duration < 0 && segData + seek[1] >= head.length) {
                    byte[] info = element(seek[1], ID_INFO, 4096);
                    if (info != null) parseInfo(info, 0, info.length);
                } else if (seek[0] == ID_SEEKHEAD && segData + seek[1] >= head.length) nextSeekHead = seek[1];
            }
            if (chaptersAt >= 0 || nextSeekHead < 0) break;
            byte[] more = element(nextSeekHead, ID_SEEKHEAD, 65536);
            seeks.clear();
            if (more != null) parseSeekHead(more, 0, more.length, seeks);
        }
        if (chaptersAt < 0) {
            log.log("Chapters: none in file (" + requests + " request(s))");
            return;
        }
        byte[] body = element(chaptersAt, ID_CHAPTERS, 4 * 1024 * 1024);
        if (body != null) parseChapters(body, 0, body.length);
    }

    /** Fetches one element's body by its segment-relative position, checking its ID. */
    private byte[] element(long relative, int expectedId, int maxSize) throws Exception {
        long at = segData + relative;
        byte[] header = fetch(at, 65536);
        if (header.length < 4 || readId(header, 0) != expectedId) return null;
        int il = idLen(header[0]);
        int sl = sizeLen(header[il]);
        long size = readSize(header, il);
        if (size < 0 || size > maxSize) return null;
        if (il + sl + size <= header.length) {
            return java.util.Arrays.copyOfRange(header, il + sl, il + sl + (int) size);
        }
        byte[] body = fetch(at + il + sl, (int) size);
        return body.length == size ? body : null;
    }

    private void parseSeekHead(byte[] b, int from, int len, List<long[]> out) {
        for (int p = from; p < from + len; ) {
            int id = readId(b, p), il = idLen(b[p]), sl = sizeLen(b[p + il]);
            long size = readSize(b, p + il);
            int body = p + il + sl;
            if (il == 0 || sl == 0 || size < 0 || size > from + len - body) return;
            if (id == ID_SEEK) {
                long seekId = -1, pos = -1;
                for (int q = body; q < body + size; ) {
                    int cid = readId(b, q), cil = idLen(b[q]), csl = sizeLen(b[q + cil]);
                    long cs = readSize(b, q + cil);
                    if (cil == 0 || csl == 0 || cs < 0 || cs > body + size - q - cil - csl) break;
                    if (cid == ID_SEEKID) seekId = readUInt(b, q + cil + csl, (int) cs);
                    if (cid == ID_SEEKPOS) pos = readUInt(b, q + cil + csl, (int) cs);
                    q += cil + csl + (int) cs;
                }
                if (seekId >= 0 && pos >= 0) out.add(new long[]{seekId, pos});
            }
            p = body + (int) size;
        }
    }

    private void parseInfo(byte[] b, int from, int len) {
        double rawDuration = -1;
        for (int p = from; p < from + len; ) {
            int id = readId(b, p), il = idLen(b[p]), sl = sizeLen(b[p + il]);
            long size = readSize(b, p + il);
            if (il == 0 || sl == 0 || size < 0) return;
            int body = p + il + sl;
            if (size > from + len - body) return;
            if (id == ID_SCALE) scale = readUInt(b, body, (int) size);
            if (id == ID_DURATION) {
                rawDuration = size == 4 ? Float.intBitsToFloat((int) readUInt(b, body, 4))
                        : Double.longBitsToDouble(readUInt(b, body, 8));
            }
            p = body + (int) size;
        }
        if (rawDuration > 0) duration = rawDuration * scale / 1e9;
    }

    private void parseChapters(byte[] b, int from, int len) {
        List<Chapter> best = null;
        for (int p = from; p < from + len; ) {
            int id = readId(b, p), il = idLen(b[p]), sl = sizeLen(b[p + il]);
            long size = readSize(b, p + il);
            if (il == 0 || sl == 0 || size < 0) break;
            int body = p + il + sl;
            if (size > from + len - body) break;
            if (id == ID_EDITION) {
                List<Chapter> list = new ArrayList<>();
                boolean[] flags = new boolean[2]; // hidden, default
                parseEdition(b, body, (int) size, list, flags);
                // Default edition wins; otherwise the first visible one.
                if (!flags[0] && !list.isEmpty() && (best == null || flags[1])) {
                    best = list;
                    if (flags[1]) break;
                }
            }
            p = body + (int) size;
        }
        if (best == null) {
            log.log("Chapters: empty element");
            return;
        }
        Collections.sort(best, new Comparator<Chapter>() {
            @Override
            public int compare(Chapter a, Chapter c) {
                return Double.compare(a.start, c.start);
            }
        });
        for (int i = 0; i < best.size(); i++) {
            Chapter chapter = best.get(i);
            if (chapter.end <= chapter.start) {
                chapter.end = i + 1 < best.size() ? best.get(i + 1).start : duration;
            }
        }
        chapters.addAll(best);
    }

    private void parseEdition(byte[] b, int from, int len, List<Chapter> out, boolean[] flags) {
        for (int p = from; p < from + len; ) {
            int id = readId(b, p), il = idLen(b[p]), sl = sizeLen(b[p + il]);
            long size = readSize(b, p + il);
            if (il == 0 || sl == 0 || size < 0) return;
            int body = p + il + sl;
            if (size > from + len - body) return;
            if (id == ID_ED_HIDDEN) flags[0] = readUInt(b, body, (int) size) != 0;
            if (id == ID_ED_DEFAULT) flags[1] = readUInt(b, body, (int) size) != 0;
            if (id == ID_ATOM) parseAtom(b, body, (int) size, out);
            p = body + (int) size;
        }
    }

    private void parseAtom(byte[] b, int from, int len, List<Chapter> out) {
        double start = -1, end = -1;
        boolean hidden = false, enabled = true, external = false;
        String name = "";
        for (int p = from; p < from + len; ) {
            int id = readId(b, p), il = idLen(b[p]), sl = sizeLen(b[p + il]);
            long size = readSize(b, p + il);
            if (il == 0 || sl == 0 || size < 0) break;
            int body = p + il + sl;
            if (size > from + len - body) break;
            if (id == ID_TSTART) start = readUInt(b, body, (int) size) / 1e9;
            else if (id == ID_TEND) end = readUInt(b, body, (int) size) / 1e9;
            else if (id == ID_HIDDEN) hidden = readUInt(b, body, (int) size) != 0;
            else if (id == ID_ENABLED) enabled = readUInt(b, body, (int) size) != 0;
            else if (id == ID_SEGUID) external = size > 0;
            else if (id == ID_DISPLAY && name.length() == 0) {
                for (int q = body; q < body + size; ) {
                    int cid = readId(b, q), cil = idLen(b[q]), csl = sizeLen(b[q + cil]);
                    long cs = readSize(b, q + cil);
                    if (cil == 0 || csl == 0 || cs < 0 || cs > body + size - q - cil - csl) break;
                    if (cid == ID_STRING) {
                        name = new String(b, q + cil + csl, (int) cs, java.nio.charset.StandardCharsets.UTF_8)
                                .replace("\u0000", "").trim();
                    }
                    q += cil + csl + (int) cs;
                }
            }
            p = body + (int) size;
        }
        // Atoms pointing into another file (ordered chapters) are not on this file's timeline.
        if (start >= 0 && !hidden && enabled && !external) out.add(new Chapter(start, end, name));
    }

    // ----------------------------------------------------------------- EBML

    private static int idLen(byte first) {
        int v = first & 0xFF;
        if (v >= 0x80) return 1;
        if (v >= 0x40) return 2;
        if (v >= 0x20) return 3;
        if (v >= 0x10) return 4;
        return 0;
    }

    private static int sizeLen(byte first) {
        int v = first & 0xFF;
        for (int i = 0; i < 8; i++) {
            if ((v & (0x80 >> i)) != 0) return i + 1;
        }
        return 0;
    }

    private static int readId(byte[] b, int p) {
        if (p >= b.length) return -1;
        int len = idLen(b[p]);
        if (len == 0 || p + len > b.length) return -1;
        int id = 0;
        for (int i = 0; i < len; i++) id = (id << 8) | (b[p + i] & 0xFF);
        return id;
    }

    /** -1 = unknown size (all ones) or truncated. */
    private static long readSize(byte[] b, int p) {
        if (p >= b.length) return -1;
        int len = sizeLen(b[p]);
        if (len == 0 || p + len > b.length) return -1;
        long value = (b[p] & 0xFF) & (0xFF >> len);
        boolean allOnes = value == (0xFF >> len);
        for (int i = 1; i < len; i++) {
            value = (value << 8) | (b[p + i] & 0xFF);
            if ((b[p + i] & 0xFF) != 0xFF) allOnes = false;
        }
        return allOnes ? -1 : value;
    }

    private static long readUInt(byte[] b, int p, int len) {
        long value = 0;
        for (int i = 0; i < len && p + i < b.length; i++) value = (value << 8) | (b[p + i] & 0xFF);
        return value;
    }

    // ----------------------------------------------------------------- HTTP

    /** Debrid redirectors (TorBox requestdl) answer 500 now and then: retry up to 4 times. */
    private byte[] fetch(long from, int length) throws Exception {
        for (int attempt = 1; ; attempt++) {
            try {
                return fetchOnce(from, length);
            } catch (Exception error) {
                if (attempt >= 4) throw error;
                log.log("Chapters: try " + attempt + " failed (" + error.getMessage() + "), retrying");
                if (!(error instanceof java.io.IOException)) resolved = null;
                Thread.sleep(700L * attempt);
            }
        }
    }

    private byte[] fetchOnce(long from, int length) throws Exception {
        String target = resolved != null ? resolved : url;
        for (int hop = 0; hop < 6; hop++) {
            requests++;
            HttpURLConnection connection = (HttpURLConnection) new URL(target).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(6000);
            connection.setReadTimeout(8000);
            connection.setRequestProperty("Range", "bytes=" + from + "-" + (from + length - 1));
            connection.setRequestProperty("User-Agent", "Stremio");
            int code = connection.getResponseCode();
            if (code >= 300 && code < 400) {
                String location = connection.getHeaderField("Location");
                connection.disconnect();
                if (location == null) throw new IllegalStateException("redirect without Location");
                target = new URL(new URL(target), location).toString();
                continue;
            }
            if (code != 206 && !(code == 200 && from == 0)) {
                connection.disconnect();
                throw new IllegalStateException("HTTP " + code + " (range " + from + ")");
            }
            resolved = target;
            try {
                InputStream input = connection.getInputStream();
                ByteArrayOutputStream out = new ByteArrayOutputStream(Math.min(length, HEAD));
                byte[] buffer = new byte[16384];
                int n;
                while (out.size() < length && (n = input.read(buffer, 0, Math.min(buffer.length, length - out.size()))) > 0) {
                    out.write(buffer, 0, n);
                }
                // A 200 means the server ignored Range: abort instead of draining the file.
                if (code == 200) connection.disconnect();
                input.close();
                return out.toByteArray();
            } finally {
                connection.disconnect();
            }
        }
        throw new IllegalStateException("too many redirects");
    }

    /** PC check: java MkvChapters <url>. */
    public static void main(String[] args) {
        long t = System.currentTimeMillis();
        final MkvChapters reader = new MkvChapters(args[0], new Log() {
            @Override
            public void log(String message) {
                System.out.println(message);
            }
        });
        try {
            reader.run();
        } catch (Throwable e) {
            System.out.println("ERR " + e);
        }
        System.out.println("requests=" + reader.requests + " ms=" + (System.currentTimeMillis() - t)
                + " duration=" + reader.duration);
        for (Chapter c : reader.chapters) {
            System.out.println(String.format(java.util.Locale.US, "%9.3f %9.3f  %s", c.start, c.end, c.name));
        }
    }
}
