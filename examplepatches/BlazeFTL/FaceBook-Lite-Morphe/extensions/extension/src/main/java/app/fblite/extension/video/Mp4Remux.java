package app.fblite.extension.video;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Joins a video-only and an audio-only MP4 into one MP4 without decoding, for codecs MediaMuxer cannot write
 * (AV1, VP9, xHE-AAC). It reads the samples of each input, plain or fragmented (what Facebook's DASH tracks are),
 * and writes one ordinary MP4: ftyp, mdat with the samples interleaved by the second, moov with full sample
 * tables at the end. The sample descriptions (stsd) are copied as they are, so any codec passes through.
 * Plain Java, no Android classes.
 */
final class Mp4Remux {
    private static final int MAX_BOX = 64 * 1024 * 1024;

    private Mp4Remux() {
    }

    static void join(File videoFile, File audioFile, File out) throws IOException {
        Track video = null;
        Track audio = null;
        try {
            video = read(videoFile, "vide");
            if (audioFile != null) audio = read(audioFile, "soun");
            write(out, video, audio);
        } finally {
            if (video != null) video.close();
            if (audio != null) audio.close();
        }
    }

    /**
     * The MPEG-4 audio object type of the first sound track (2 AAC-LC, 5 HE-AAC, 42 xHE-AAC), or -1. Read from
     * the AudioSpecificConfig inside the track's esds box.
     */
    static int audioObjectType(File file) {
        Track t = null;
        try {
            t = read(file, "soun");
            byte[] s = t.stsd;
            int i = -1;
            for (int k = 0; k + 4 < s.length; k++) {
                if (s[k] == 'e' && s[k + 1] == 's' && s[k + 2] == 'd' && s[k + 3] == 's') {
                    i = k;
                    break;
                }
            }
            if (i < 0) return -1;
            int p = i + 8; // after the box type and the version and flags
            // ES descriptor (0x03), then the decoder config (0x04), then the specific info (0x05).
            while (p < s.length - 2) {
                int tag = s[p++] & 0xFF;
                int len = 0;
                for (int n = 0; n < 4 && p < s.length; n++) {
                    int b = s[p++] & 0xFF;
                    len = (len << 7) | (b & 0x7F);
                    if ((b & 0x80) == 0) break;
                }
                if (tag == 0x03) {
                    int flags = s[p + 2] & 0xFF;
                    p += 3;
                    if ((flags & 0x80) != 0) p += 2;
                    if ((flags & 0x40) != 0) p += 1 + (s[p] & 0xFF);
                    if ((flags & 0x20) != 0) p += 2;
                } else if (tag == 0x04) {
                    p += 13;
                } else if (tag == 0x05) {
                    int first = s[p] & 0xFF;
                    int type = first >> 3;
                    if (type == 31) type = 32 + (((first & 7) << 3) | ((s[p + 1] & 0xFF) >> 5));
                    return type;
                } else {
                    p += len;
                }
            }
            return -1;
        } catch (Throwable e) {
            return -1;
        } finally {
            if (t != null) t.close();
        }
    }

    // ------------------------------------------------------------------------------------ model

    private static final class Track {
        RandomAccessFile file;
        String handler;
        int trackId = 1;
        long movieTimescale = 1000;
        long mediaTimescale = 1000;
        int language = 0x55C4;
        byte[] stsd;
        byte[] matrix;
        long width;
        long height;
        /** Edit list as {segment duration in movie timescale, media time, media rate} or null. */
        long[][] edits;
        long defaultDuration;
        long defaultSize;
        long defaultFlags;
        Longs offset = new Longs();
        Longs size = new Longs();
        Longs duration = new Longs();
        Longs cts = new Longs();
        Longs sync = new Longs();
        long[] dts;

        int count() {
            return offset.n;
        }

        long mediaDuration() {
            long sum = 0;
            for (int i = 0; i < duration.n; i++) sum += duration.a[i];
            return sum;
        }

        void close() {
            try {
                if (file != null) file.close();
            } catch (IOException ignored) {
            }
        }

        String sampleEntry() {
            if (stsd == null || stsd.length < 20) return "";
            return new String(stsd, 16, 4, java.nio.charset.StandardCharsets.ISO_8859_1);
        }
    }

    private static final class Longs {
        long[] a = new long[1024];
        int n;

        void add(long v) {
            if (n == a.length) a = Arrays.copyOf(a, n * 2);
            a[n++] = v;
        }
    }

    // ------------------------------------------------------------------------------------ reading

    private static Track read(File f, String wantedHandler) throws IOException {
        Track t = new Track();
        t.file = new RandomAccessFile(f, "r");
        long length = t.file.length();
        boolean seenMoov = false;
        long pos = 0;
        while (pos + 8 <= length) {
            t.file.seek(pos);
            long size = t.file.readInt() & 0xFFFFFFFFL;
            int type = t.file.readInt();
            long header = 8;
            if (size == 1) {
                size = t.file.readLong();
                header = 16;
            } else if (size == 0) {
                size = length - pos;
            }
            if (size < header || pos + size > length) break;
            if (type == fourcc("moov")) {
                byte[] moov = readBytes(t.file, pos + header, size - header);
                parseMoov(moov, t, wantedHandler);
                seenMoov = true;
            } else if (type == fourcc("moof")) {
                if (!seenMoov || t.handler == null) throw new IOException("moof before moov");
                byte[] moof = readBytes(t.file, pos + header, size - header);
                parseMoof(moof, pos, t);
            }
            pos += size;
        }
        if (t.handler == null || t.stsd == null) throw new IOException("No " + wantedHandler + " track in " + f.getName());
        if (t.count() == 0) throw new IOException("No samples in " + f.getName());
        t.dts = new long[t.count()];
        long time = 0;
        for (int i = 0; i < t.count(); i++) {
            t.dts[i] = time;
            time += t.duration.a[i];
        }
        return t;
    }

    private static byte[] readBytes(RandomAccessFile f, long at, long size) throws IOException {
        if (size > MAX_BOX) throw new IOException("Box too large");
        byte[] b = new byte[(int) size];
        f.seek(at);
        f.readFully(b);
        return b;
    }

    private interface Visitor {
        void box(int type, int start, int end) throws IOException;
    }

    private static void children(byte[] b, int start, int end, Visitor v) throws IOException {
        int p = start;
        while (p + 8 <= end) {
            long size = u32(b, p);
            int type = (int) u32(b, p + 4);
            int header = 8;
            if (size == 1) {
                size = u64(b, p + 8);
                header = 16;
            } else if (size == 0) {
                size = end - p;
            }
            if (size < header || p + size > end) break;
            v.box(type, p + header, (int) (p + size));
            p += (int) size;
        }
    }

    private static void parseMoov(byte[] b, Track t, String wanted) throws IOException {
        long[] movie = {1000};
        List<int[]> traks = new ArrayList<>();
        children(b, 0, b.length, (type, start, end) -> {
            if (type == fourcc("mvhd")) {
                movie[0] = u32(b, start + (b[start] == 1 ? 20 : 12));
            } else if (type == fourcc("trak")) {
                traks.add(new int[] {start, end});
            }
        });
        for (int[] trak : traks) {
            Track candidate = new Track();
            parseTrak(b, trak[0], trak[1], candidate);
            if (wanted.equals(candidate.handler) && t.handler == null) {
                t.handler = candidate.handler;
                t.trackId = candidate.trackId;
                t.mediaTimescale = candidate.mediaTimescale;
                t.language = candidate.language;
                t.stsd = candidate.stsd;
                t.matrix = candidate.matrix;
                t.width = candidate.width;
                t.height = candidate.height;
                t.edits = candidate.edits;
                t.offset = candidate.offset;
                t.size = candidate.size;
                t.duration = candidate.duration;
                t.cts = candidate.cts;
                t.sync = candidate.sync;
            }
        }
        t.movieTimescale = movie[0] > 0 ? movie[0] : 1000;
        // trex of the chosen track
        children(b, 0, b.length, (type, start, end) -> {
            if (type == fourcc("mvex")) {
                children(b, start, end, (t2, s2, e2) -> {
                    if (t2 == fourcc("trex") && (int) u32(b, s2 + 4) == t.trackId) {
                        t.defaultDuration = u32(b, s2 + 12);
                        t.defaultSize = u32(b, s2 + 16);
                        t.defaultFlags = u32(b, s2 + 20);
                    }
                });
            }
        });
    }

    private static void parseTrak(byte[] b, int start, int end, Track t) throws IOException {
        final long[][] tables = new long[8][];
        children(b, start, end, (type, s, e) -> {
            if (type == fourcc("tkhd")) {
                boolean v1 = b[s] == 1;
                t.trackId = (int) u32(b, s + (v1 ? 20 : 12));
                t.width = u32(b, e - 8);
                t.height = u32(b, e - 4);
                t.matrix = Arrays.copyOfRange(b, e - 44, e - 8);
            } else if (type == fourcc("edts")) {
                children(b, s, e, (t2, s2, e2) -> {
                    if (t2 == fourcc("elst")) {
                        boolean v1 = b[s2] == 1;
                        int entries = (int) u32(b, s2 + 4);
                        long[][] list = new long[entries][3];
                        int p = s2 + 8;
                        for (int i = 0; i < entries; i++) {
                            if (v1) {
                                list[i][0] = u64(b, p);
                                list[i][1] = u64(b, p + 8);
                                p += 16;
                            } else {
                                list[i][0] = u32(b, p);
                                list[i][1] = (int) u32(b, p + 4);
                                p += 8;
                            }
                            list[i][2] = u32(b, p);
                            p += 4;
                        }
                        t.edits = list;
                    }
                });
            } else if (type == fourcc("mdia")) {
                children(b, s, e, (t2, s2, e2) -> {
                    if (t2 == fourcc("mdhd")) {
                        boolean v1 = b[s2] == 1;
                        t.mediaTimescale = u32(b, s2 + (v1 ? 20 : 12));
                        t.language = (int) u16(b, s2 + (v1 ? 32 : 20));
                    } else if (t2 == fourcc("hdlr")) {
                        t.handler = new String(b, s2 + 8, 4, java.nio.charset.StandardCharsets.ISO_8859_1);
                    } else if (t2 == fourcc("minf")) {
                        children(b, s2, e2, (t3, s3, e3) -> {
                            if (t3 == fourcc("stbl")) parseStbl(b, s3, e3, t);
                        });
                    }
                });
            }
        });
    }

    private static void parseStbl(byte[] b, int start, int end, Track t) throws IOException {
        int[] stts = null;
        int[] ctts = null;
        int[] stss = null;
        int[] stsz = null;
        int[] stsc = null;
        int[] stco = null;
        int[] co64 = null;
        for (int p = start; p + 8 <= end; ) {
            long size = u32(b, p);
            if (size < 8 || p + size > end) break;
            int type = (int) u32(b, p + 4);
            int[] range = {p + 8, (int) (p + size)};
            if (type == fourcc("stsd")) t.stsd = Arrays.copyOfRange(b, p, (int) (p + size));
            else if (type == fourcc("stts")) stts = range;
            else if (type == fourcc("ctts")) ctts = range;
            else if (type == fourcc("stss")) stss = range;
            else if (type == fourcc("stsz")) stsz = range;
            else if (type == fourcc("stsc")) stsc = range;
            else if (type == fourcc("stco")) stco = range;
            else if (type == fourcc("co64")) co64 = range;
            else if (type == fourcc("stz2")) throw new IOException("stz2 is not supported");
            p += (int) size;
        }
        if (stsz == null) return;
        long fixed = u32(b, stsz[0] + 4);
        int count = (int) u32(b, stsz[0] + 8);
        if (count == 0) return;
        long[] sizes = new long[count];
        for (int i = 0; i < count; i++) sizes[i] = fixed != 0 ? fixed : u32(b, stsz[0] + 12 + 4 * i);

        int chunks = stco != null ? (int) u32(b, stco[0] + 4) : co64 != null ? (int) u32(b, co64[0] + 4) : 0;
        if (chunks == 0 || stsc == null) throw new IOException("No chunk table");
        int runs = (int) u32(b, stsc[0] + 4);
        int sample = 0;
        for (int r = 0; r < runs; r++) {
            int first = (int) u32(b, stsc[0] + 8 + 12 * r);
            int per = (int) u32(b, stsc[0] + 12 + 12 * r);
            int next = r + 1 < runs ? (int) u32(b, stsc[0] + 8 + 12 * (r + 1)) : chunks + 1;
            for (int chunk = first; chunk < next && sample < count; chunk++) {
                long at = stco != null ? u32(b, stco[0] + 8 + 4 * (chunk - 1)) : u64(b, co64[0] + 8 + 8 * (chunk - 1));
                for (int k = 0; k < per && sample < count; k++) {
                    t.offset.add(at);
                    t.size.add(sizes[sample]);
                    at += sizes[sample];
                    sample++;
                }
            }
        }
        if (sample != count) throw new IOException("Chunk table does not cover all samples");

        int entries = stts == null ? 0 : (int) u32(b, stts[0] + 4);
        for (int i = 0; i < entries; i++) {
            long n = u32(b, stts[0] + 8 + 8 * i);
            long d = u32(b, stts[0] + 12 + 8 * i);
            for (long k = 0; k < n; k++) t.duration.add(d);
        }
        if (t.duration.n != count) throw new IOException("Time table does not match samples");

        if (ctts != null) {
            int n = (int) u32(b, ctts[0] + 4);
            for (int i = 0; i < n; i++) {
                long c = u32(b, ctts[0] + 8 + 8 * i);
                long o = (int) u32(b, ctts[0] + 12 + 8 * i);
                for (long k = 0; k < c; k++) t.cts.add(o);
            }
        }
        while (t.cts.n < count) t.cts.add(0);

        boolean[] key = new boolean[count];
        if (stss == null) {
            Arrays.fill(key, true);
        } else {
            int n = (int) u32(b, stss[0] + 4);
            for (int i = 0; i < n; i++) {
                long s = u32(b, stss[0] + 8 + 4 * i);
                if (s >= 1 && s <= count) key[(int) s - 1] = true;
            }
        }
        for (boolean k : key) t.sync.add(k ? 1 : 0);
    }

    private static void parseMoof(byte[] b, long moofStart, Track t) throws IOException {
        children(b, 0, b.length, (type, start, end) -> {
            if (type != fourcc("traf")) return;
            long[] state = new long[8]; // 0 base, 1 defDur, 2 defSize, 3 defFlags, 4 position, 5 id
            state[1] = t.defaultDuration;
            state[2] = t.defaultSize;
            state[3] = t.defaultFlags;
            state[0] = moofStart;
            final boolean[] mine = {true};
            children(b, start, end, (t2, s2, e2) -> {
                if (t2 == fourcc("tfhd")) {
                    long flags = u32(b, s2) & 0xFFFFFF;
                    mine[0] = (int) u32(b, s2 + 4) == t.trackId;
                    int p = s2 + 8;
                    if ((flags & 0x1) != 0) {
                        state[0] = u64(b, p);
                        p += 8;
                    }
                    if ((flags & 0x2) != 0) p += 4;
                    if ((flags & 0x8) != 0) {
                        state[1] = u32(b, p);
                        p += 4;
                    }
                    if ((flags & 0x10) != 0) {
                        state[2] = u32(b, p);
                        p += 4;
                    }
                    if ((flags & 0x20) != 0) state[3] = u32(b, p);
                    state[4] = state[0];
                } else if (t2 == fourcc("trun") && mine[0]) {
                    long flags = u32(b, s2) & 0xFFFFFF;
                    int count = (int) u32(b, s2 + 4);
                    int p = s2 + 8;
                    if ((flags & 0x1) != 0) {
                        state[4] = state[0] + (int) u32(b, p);
                        p += 4;
                    }
                    long firstFlags = -1;
                    if ((flags & 0x4) != 0) {
                        firstFlags = u32(b, p);
                        p += 4;
                    }
                    for (int i = 0; i < count; i++) {
                        long d = state[1];
                        long sz = state[2];
                        long fl = state[3];
                        long off = 0;
                        if ((flags & 0x100) != 0) {
                            d = u32(b, p);
                            p += 4;
                        }
                        if ((flags & 0x200) != 0) {
                            sz = u32(b, p);
                            p += 4;
                        }
                        if ((flags & 0x400) != 0) {
                            fl = u32(b, p);
                            p += 4;
                        } else if (i == 0 && firstFlags >= 0) {
                            fl = firstFlags;
                        }
                        if ((flags & 0x800) != 0) {
                            off = (int) u32(b, p);
                            p += 4;
                        }
                        t.offset.add(state[4]);
                        t.size.add(sz);
                        t.duration.add(d);
                        t.cts.add(off);
                        t.sync.add((fl & 0x10000) == 0 ? 1 : 0);
                        state[4] += sz;
                    }
                }
            });
        });
    }

    // ------------------------------------------------------------------------------------ writing

    private static void write(File out, Track video, Track audio) throws IOException {
        if (out.exists() && !out.delete()) throw new IOException("Cannot replace " + out);
        try (RandomAccessFile raf = new RandomAccessFile(out, "rw")) {
            raf.write(ftyp(video, audio));
            long mdatStart = raf.getFilePointer();
            raf.writeInt(1);
            raf.writeInt(fourcc("mdat"));
            raf.writeLong(0);

            Longs[] chunkOffset = {new Longs(), new Longs()};
            Longs[] chunkSamples = {new Longs(), new Longs()};
            Track[] tracks = {video, audio};
            int[] next = {0, 0};
            byte[] buffer = new byte[256 * 1024];
            for (int second = 1; ; second++) {
                boolean any = false;
                for (int k = 0; k < 2; k++) {
                    Track t = tracks[k];
                    if (t == null) continue;
                    int first = next[k];
                    long at = raf.getFilePointer();
                    while (next[k] < t.count() && (double) t.dts[next[k]] / t.mediaTimescale < second) {
                        int i = next[k];
                        int size = (int) t.size.a[i];
                        if (size > buffer.length) buffer = new byte[size];
                        t.file.seek(t.offset.a[i]);
                        t.file.readFully(buffer, 0, size);
                        raf.write(buffer, 0, size);
                        next[k]++;
                    }
                    int n = next[k] - first;
                    if (n > 0) {
                        chunkOffset[k].add(at);
                        chunkSamples[k].add(n);
                        any = true;
                    }
                }
                boolean done = (video == null || next[0] >= video.count()) && (audio == null || next[1] >= audio.count());
                if (done) break;
                if (!any && second > 100000) throw new IOException("Interleave did not advance");
            }
            long mdatEnd = raf.getFilePointer();
            if (mdatEnd > 0x7FFFFFF0L) throw new IOException("Output too large");
            raf.seek(mdatStart + 8);
            raf.writeLong(mdatEnd - mdatStart);
            raf.seek(mdatEnd);
            raf.write(moov(video, audio, chunkOffset, chunkSamples));
        }
    }

    private static byte[] ftyp(Track video, Track audio) {
        List<String> brands = new ArrayList<>(Arrays.asList("isom", "iso2", "mp41"));
        String entry = video.sampleEntry();
        if (!entry.isEmpty() && !brands.contains(entry)) brands.add(entry);
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        putFourcc(body, "isom");
        putInt(body, 0x200);
        for (String brand : brands) putFourcc(body, brand);
        return box("ftyp", body.toByteArray());
    }

    private static byte[] moov(Track video, Track audio, Longs[] chunkOffset, Longs[] chunkSamples) {
        long movieScale = video.movieTimescale;
        long movieDuration = 0;
        ByteArrayOutputStream traks = new ByteArrayOutputStream();
        Track[] tracks = {video, audio};
        int id = 1;
        for (int k = 0; k < 2; k++) {
            Track t = tracks[k];
            if (t == null) continue;
            long trackDuration = t.edits != null ? editDuration(t, movieScale) : t.mediaDuration() * movieScale / t.mediaTimescale;
            movieDuration = Math.max(movieDuration, trackDuration);
            writeBytes(traks, trak(t, id++, movieScale, trackDuration, chunkOffset[k], chunkSamples[k], k == 0));
        }
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        ByteArrayOutputStream mvhd = new ByteArrayOutputStream();
        putInt(mvhd, 0);
        putInt(mvhd, 0);
        putInt(mvhd, 0);
        putInt(mvhd, (int) movieScale);
        putInt(mvhd, (int) movieDuration);
        putInt(mvhd, 0x00010000);
        putShort(mvhd, 0x0100);
        putShort(mvhd, 0);
        putInt(mvhd, 0);
        putInt(mvhd, 0);
        writeBytes(mvhd, identityMatrix());
        for (int i = 0; i < 6; i++) putInt(mvhd, 0);
        putInt(mvhd, id);
        writeBytes(body, box("mvhd", mvhd.toByteArray()));
        writeBytes(body, traks.toByteArray());
        return box("moov", body.toByteArray());
    }

    private static long editDuration(Track t, long movieScale) {
        long sum = 0;
        for (long[] e : t.edits) sum += e[0] * movieScale / t.movieTimescale;
        return sum;
    }

    private static byte[] trak(Track t, int id, long movieScale, long trackDuration, Longs offsets, Longs perChunk, boolean isVideo) {
        ByteArrayOutputStream tkhd = new ByteArrayOutputStream();
        putInt(tkhd, 3);
        putInt(tkhd, 0);
        putInt(tkhd, 0);
        putInt(tkhd, id);
        putInt(tkhd, 0);
        putInt(tkhd, (int) trackDuration);
        putInt(tkhd, 0);
        putInt(tkhd, 0);
        putShort(tkhd, 0);
        putShort(tkhd, 0);
        putShort(tkhd, isVideo ? 0 : 0x0100);
        putShort(tkhd, 0);
        writeBytes(tkhd, t.matrix != null && t.matrix.length == 36 ? t.matrix : identityMatrix());
        putInt(tkhd, (int) t.width);
        putInt(tkhd, (int) t.height);

        ByteArrayOutputStream trak = new ByteArrayOutputStream();
        writeBytes(trak, box("tkhd", tkhd.toByteArray()));
        if (t.edits != null) {
            ByteArrayOutputStream elst = new ByteArrayOutputStream();
            putInt(elst, 0);
            putInt(elst, t.edits.length);
            for (long[] e : t.edits) {
                putInt(elst, (int) (e[0] * movieScale / t.movieTimescale));
                putInt(elst, (int) e[1]);
                putInt(elst, (int) e[2]);
            }
            writeBytes(trak, box("edts", box("elst", elst.toByteArray())));
        }

        ByteArrayOutputStream mdhd = new ByteArrayOutputStream();
        putInt(mdhd, 0);
        putInt(mdhd, 0);
        putInt(mdhd, 0);
        putInt(mdhd, (int) t.mediaTimescale);
        putInt(mdhd, (int) t.mediaDuration());
        putShort(mdhd, t.language);
        putShort(mdhd, 0);

        ByteArrayOutputStream hdlr = new ByteArrayOutputStream();
        putInt(hdlr, 0);
        putInt(hdlr, 0);
        putFourcc(hdlr, isVideo ? "vide" : "soun");
        for (int i = 0; i < 3; i++) putInt(hdlr, 0);
        writeBytes(hdlr, ((isVideo ? "VideoHandler" : "SoundHandler") + "\0").getBytes(java.nio.charset.StandardCharsets.ISO_8859_1));

        ByteArrayOutputStream media = new ByteArrayOutputStream();
        writeBytes(media, box("mdhd", mdhd.toByteArray()));
        writeBytes(media, box("hdlr", hdlr.toByteArray()));
        ByteArrayOutputStream minf = new ByteArrayOutputStream();
        if (isVideo) {
            ByteArrayOutputStream vmhd = new ByteArrayOutputStream();
            putInt(vmhd, 1);
            putInt(vmhd, 0);
            putInt(vmhd, 0);
            writeBytes(minf, box("vmhd", vmhd.toByteArray()));
        } else {
            ByteArrayOutputStream smhd = new ByteArrayOutputStream();
            putInt(smhd, 0);
            putInt(smhd, 0);
            writeBytes(minf, box("smhd", smhd.toByteArray()));
        }
        ByteArrayOutputStream dref = new ByteArrayOutputStream();
        putInt(dref, 0);
        putInt(dref, 1);
        ByteArrayOutputStream url = new ByteArrayOutputStream();
        putInt(url, 1);
        writeBytes(dref, box("url ", url.toByteArray()));
        writeBytes(minf, box("dinf", box("dref", dref.toByteArray())));
        writeBytes(minf, stbl(t, offsets, perChunk, isVideo));
        writeBytes(media, box("minf", minf.toByteArray()));
        writeBytes(trak, box("mdia", media.toByteArray()));
        return box("trak", trak.toByteArray());
    }

    private static byte[] stbl(Track t, Longs offsets, Longs perChunk, boolean isVideo) {
        int count = t.count();
        ByteArrayOutputStream stbl = new ByteArrayOutputStream();
        writeBytes(stbl, t.stsd);

        ByteArrayOutputStream stts = new ByteArrayOutputStream();
        List<long[]> runs = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            long d = t.duration.a[i];
            if (!runs.isEmpty() && runs.get(runs.size() - 1)[1] == d) runs.get(runs.size() - 1)[0]++;
            else runs.add(new long[] {1, d});
        }
        putInt(stts, 0);
        putInt(stts, runs.size());
        for (long[] r : runs) {
            putInt(stts, (int) r[0]);
            putInt(stts, (int) r[1]);
        }
        writeBytes(stbl, box("stts", stts.toByteArray()));

        boolean hasCts = false;
        boolean negative = false;
        for (int i = 0; i < count; i++) {
            if (t.cts.a[i] != 0) hasCts = true;
            if (t.cts.a[i] < 0) negative = true;
        }
        if (hasCts) {
            ByteArrayOutputStream ctts = new ByteArrayOutputStream();
            List<long[]> cr = new ArrayList<>();
            for (int i = 0; i < count; i++) {
                long o = t.cts.a[i];
                if (!cr.isEmpty() && cr.get(cr.size() - 1)[1] == o) cr.get(cr.size() - 1)[0]++;
                else cr.add(new long[] {1, o});
            }
            putInt(ctts, negative ? 0x01000000 : 0);
            putInt(ctts, cr.size());
            for (long[] r : cr) {
                putInt(ctts, (int) r[0]);
                putInt(ctts, (int) r[1]);
            }
            writeBytes(stbl, box("ctts", ctts.toByteArray()));
        }

        if (isVideo) {
            int syncCount = 0;
            for (int i = 0; i < count; i++) if (t.sync.a[i] != 0) syncCount++;
            if (syncCount < count) {
                ByteArrayOutputStream stss = new ByteArrayOutputStream();
                putInt(stss, 0);
                putInt(stss, syncCount);
                for (int i = 0; i < count; i++) if (t.sync.a[i] != 0) putInt(stss, i + 1);
                writeBytes(stbl, box("stss", stss.toByteArray()));
            }
        }

        ByteArrayOutputStream stsc = new ByteArrayOutputStream();
        List<long[]> sc = new ArrayList<>();
        for (int c = 0; c < perChunk.n; c++) {
            long n = perChunk.a[c];
            if (sc.isEmpty() || sc.get(sc.size() - 1)[1] != n) sc.add(new long[] {c + 1, n});
        }
        putInt(stsc, 0);
        putInt(stsc, sc.size());
        for (long[] r : sc) {
            putInt(stsc, (int) r[0]);
            putInt(stsc, (int) r[1]);
            putInt(stsc, 1);
        }
        writeBytes(stbl, box("stsc", stsc.toByteArray()));

        ByteArrayOutputStream stsz = new ByteArrayOutputStream();
        putInt(stsz, 0);
        putInt(stsz, 0);
        putInt(stsz, count);
        for (int i = 0; i < count; i++) putInt(stsz, (int) t.size.a[i]);
        writeBytes(stbl, box("stsz", stsz.toByteArray()));

        boolean big = false;
        for (int c = 0; c < offsets.n; c++) if (offsets.a[c] > 0xFFFFFFFFL) big = true;
        ByteArrayOutputStream stco = new ByteArrayOutputStream();
        putInt(stco, 0);
        putInt(stco, offsets.n);
        for (int c = 0; c < offsets.n; c++) {
            if (big) putLong(stco, offsets.a[c]);
            else putInt(stco, (int) offsets.a[c]);
        }
        writeBytes(stbl, box(big ? "co64" : "stco", stco.toByteArray()));
        return box("stbl", stbl.toByteArray());
    }

    // ------------------------------------------------------------------------------------ bytes

    private static byte[] identityMatrix() {
        ByteArrayOutputStream m = new ByteArrayOutputStream();
        putInt(m, 0x00010000);
        putInt(m, 0);
        putInt(m, 0);
        putInt(m, 0);
        putInt(m, 0x00010000);
        putInt(m, 0);
        putInt(m, 0);
        putInt(m, 0);
        putInt(m, 0x40000000);
        return m.toByteArray();
    }

    private static byte[] box(String type, byte[] payload) {
        ByteArrayOutputStream b = new ByteArrayOutputStream(payload.length + 8);
        putInt(b, payload.length + 8);
        putFourcc(b, type);
        writeBytes(b, payload);
        return b.toByteArray();
    }

    private static void writeBytes(ByteArrayOutputStream o, byte[] v) {
        o.write(v, 0, v.length);
    }

    private static void putInt(ByteArrayOutputStream o, int v) {
        o.write(v >>> 24);
        o.write(v >>> 16);
        o.write(v >>> 8);
        o.write(v);
    }

    private static void putLong(ByteArrayOutputStream o, long v) {
        putInt(o, (int) (v >>> 32));
        putInt(o, (int) v);
    }

    private static void putShort(ByteArrayOutputStream o, int v) {
        o.write(v >>> 8);
        o.write(v);
    }

    private static void putFourcc(ByteArrayOutputStream o, String s) {
        for (int i = 0; i < 4; i++) o.write(s.charAt(i));
    }

    private static int fourcc(String s) {
        return (s.charAt(0) << 24) | (s.charAt(1) << 16) | (s.charAt(2) << 8) | s.charAt(3);
    }

    private static long u16(byte[] b, int p) {
        return ((b[p] & 0xFF) << 8) | (b[p + 1] & 0xFF);
    }

    private static long u32(byte[] b, int p) {
        return ((long) (b[p] & 0xFF) << 24) | ((b[p + 1] & 0xFF) << 16) | ((b[p + 2] & 0xFF) << 8) | (b[p + 3] & 0xFF);
    }

    private static long u64(byte[] b, int p) {
        return (u32(b, p) << 32) | u32(b, p + 4);
    }
}
