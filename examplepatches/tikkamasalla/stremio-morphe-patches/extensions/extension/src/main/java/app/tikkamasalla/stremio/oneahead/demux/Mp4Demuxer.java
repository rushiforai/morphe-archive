package app.tikkamasalla.stremio.oneahead.demux;

import java.util.ArrayList;
import java.util.List;

/**
 * MP4 over byte ranges. moov is found wherever it is and walked as a stream, so the video track's
 * size and offset tables are skipped. Audio chunks are fetched with small gaps coalesced; the
 * video in larger gaps is never downloaded.
 */
final class Mp4Demuxer implements Demuxer {
    private static final int META_CHUNK = 256 * 1024, MAX_BATCH = 4 * 1024 * 1024;
    /**
     * Largest gap read through rather than skipped. Measured on a 26 Mbit/s MP4 for 600 s of audio:
     * 16 KB read 85 MB in 12,671 requests, 64 KB 155 MB in 10,921, 256 KB 1,448 MB in 1,931. Bytes are
     * not the limit and each request costs 0.16-0.25 s, so requests are what to save.
     */
    int coalesceGap = 256 * 1024;
    /** Requests the last dry run would make. */
    long plannedRequests;
    private static final long MAX_TABLE = 32L * 1024 * 1024;

    private static int fourcc(String s) {
        return (s.charAt(0) << 24) | (s.charAt(1) << 16) | (s.charAt(2) << 8) | s.charAt(3);
    }

    private static final int MOOV = fourcc("moov"), TRAK = fourcc("trak"), MDIA = fourcc("mdia"), MINF = fourcc("minf"),
            STBL = fourcc("stbl"), EDTS = fourcc("edts"), ELST = fourcc("elst"), MVHD = fourcc("mvhd"), MVEX = fourcc("mvex"),
            MDHD = fourcc("mdhd"), HDLR = fourcc("hdlr"), STSD = fourcc("stsd"), STTS = fourcc("stts"), STSC = fourcc("stsc"),
            STSZ = fourcc("stsz"), STCO = fourcc("stco"), CO64 = fourcc("co64"), STSS = fourcc("stss"), CTTS = fourcc("ctts"),
            SOUN = fourcc("soun"), VIDE = fourcc("vide");

    private static final class Trak {
        final TrackInfo info = new TrackInfo();
        int handler;
        long timescale = 1, mediaTime, emptyEditUs;
        int[] sttsCount, sttsDelta, stscFirst, stscCount, sizes, stss, cttsCount, cttsOffset;
        int fixedSize;
        long[] chunks;
    }

    private final RangeInput in;
    private final DemuxLog log;
    private final List<Trak> traks = new ArrayList<>();
    private final List<TrackInfo> audioInfos = new ArrayList<>();
    private final KeyframeLog keyframes = new KeyframeLog();
    private long movieTimescale = 1, movieDuration;
    private Trak current;
    private Trak chosen;
    private byte[] batch = new byte[0];

    Mp4Demuxer(RangeSource source, DemuxLog log) {
        this.in = new RangeInput(source, META_CHUNK);
        this.log = log;
    }

    @Override
    public List<TrackInfo> tracks() {
        return audioInfos;
    }

    @Override
    public KeyframeLog keyframes() {
        return keyframes;
    }

    @Override
    public double durationSec() {
        return movieDuration > 0 ? (double) movieDuration / movieTimescale : -1;
    }

    @Override
    public void select(TrackInfo track) {
        for (Trak t : traks) {
            if (t.info == track) chosen = t;
        }
        traks.clear(); // The other tracks' tables are no longer needed.
        if (chosen != null) traks.add(chosen);
    }

    // ------------------------------------------------------------------ moov

    @Override
    public void open() throws DemuxException {
        long at = 0;
        boolean moov = false;
        for (int i = 0; i < 64 && !moov; i++) {
            in.seek(at);
            if (!in.ensure(8)) break;
            long size = Ebml.uint(in.buf(), in.off(), 4);
            int type = (int) Ebml.uint(in.buf(), in.off() + 4, 4);
            int header = 8;
            if (size == 1) {
                if (!in.ensure(16)) break;
                size = Ebml.uint(in.buf(), in.off() + 8, 8);
                header = 16;
            } else if (size == 0) {
                size = in.source.length() - at;
            }
            if (size < header) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad box size");
            if (i == 0 && type != fourcc("ftyp") && type != MOOV && type != fourcc("mdat") && type != fourcc("free") && type != fourcc("skip")) {
                throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "not MP4");
            }
            if (type == MOOV) {
                in.seek(at + header);
                walk(at + size);
                moov = true;
            }
            at += size;
        }
        if (!moov) throw new DemuxException(DemuxException.Kind.MALFORMED, "no moov");
        for (Trak t : traks) {
            if (t.handler == SOUN) audioInfos.add(t.info);
        }
        for (Trak t : traks) {
            if (t.handler == VIDE && t.stss != null) {
                indexKeyframes(t);
                break;
            }
        }
    }

    private void walk(long end) throws DemuxException {
        while (in.pos() + 8 <= end) {
            long at = in.pos();
            if (!in.ensure(8)) throw new DemuxException(DemuxException.Kind.MALFORMED, "moov cut");
            long size = Ebml.uint(in.buf(), in.off(), 4);
            int type = (int) Ebml.uint(in.buf(), in.off() + 4, 4);
            int header = 8;
            if (size == 1) {
                if (!in.ensure(16)) throw new DemuxException(DemuxException.Kind.MALFORMED, "moov cut");
                size = Ebml.uint(in.buf(), in.off() + 8, 8);
                header = 16;
            } else if (size == 0) {
                size = end - at;
            }
            if (size < header || at + size > end) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad box");
            long bodyEnd = at + size;
            in.seek(at + header);
            if (type == TRAK) {
                current = new Trak();
                current.info.number = traks.size() + 1;
                traks.add(current);
                walk(bodyEnd);
            } else if (type == MDIA || type == MINF || type == STBL || type == EDTS) {
                walk(bodyEnd);
            } else if (type == MVEX) {
                throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "fragmented MP4");
            } else if (type == MVHD || (current != null && wants(type))) {
                long bodySize = bodyEnd - in.pos();
                if (bodySize > MAX_TABLE) throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "table too large");
                byte[] body = in.readBytes((int) bodySize);
                if (body == null) throw new DemuxException(DemuxException.Kind.MALFORMED, "moov cut");
                parse(type, body);
            }
            in.seek(bodyEnd);
        }
    }

    /** Video tables other than timing are never read; a handler not yet seen keeps everything. */
    private boolean wants(int type) {
        boolean video = current.handler == VIDE, other = current.handler != 0 && current.handler != VIDE && current.handler != SOUN;
        if (type == ELST || type == MDHD || type == HDLR) return true;
        if (other) return false;
        if (type == STTS) return true;
        if (type == STSS || type == CTTS) return video;
        return !video && (type == STSD || type == STSC || type == STSZ || type == STCO || type == CO64);
    }

    private void parse(int type, byte[] b) throws DemuxException {
        try {
            if (type == MVHD) {
                boolean v1 = b[0] == 1;
                movieTimescale = Math.max(1, Ebml.uint(b, v1 ? 20 : 12, 4));
                movieDuration = v1 ? Ebml.uint(b, 24, 8) : Ebml.uint(b, 16, 4);
            } else if (type == MDHD) {
                boolean v1 = b[0] == 1;
                current.timescale = Math.max(1, Ebml.uint(b, v1 ? 20 : 12, 4));
                int lang = (int) Ebml.uint(b, v1 ? 32 : 20, 2);
                current.info.language = lang == 0 || lang == 0x7FFF ? "" : new String(new char[]{
                        (char) (0x60 + ((lang >> 10) & 31)), (char) (0x60 + ((lang >> 5) & 31)), (char) (0x60 + (lang & 31))});
            } else if (type == HDLR) {
                current.handler = (int) Ebml.uint(b, 8, 4);
            } else if (type == ELST) {
                parseEdits(b);
            } else if (type == STSD) {
                Mp4AudioEntry.parse(b, current.info);
            } else if (type == STTS) {
                int n = count(b, 4, 8);
                current.sttsCount = new int[n];
                current.sttsDelta = new int[n];
                pairs(b, n, current.sttsCount, current.sttsDelta);
            } else if (type == CTTS) {
                int n = count(b, 4, 8);
                current.cttsCount = new int[n];
                current.cttsOffset = new int[n];
                pairs(b, n, current.cttsCount, current.cttsOffset);
            } else if (type == STSC) {
                int n = count(b, 4, 12);
                current.stscFirst = new int[n];
                current.stscCount = new int[n];
                for (int i = 0; i < n; i++) {
                    current.stscFirst[i] = (int) Ebml.uint(b, 8 + 12 * i, 4);
                    current.stscCount[i] = (int) Ebml.uint(b, 12 + 12 * i, 4);
                    if (current.stscFirst[i] < 1 || current.stscCount[i] < 0)
                        throw new DemuxException(DemuxException.Kind.MALFORMED, "bad stsc");
                }
            } else if (type == STSZ) {
                current.fixedSize = (int) Ebml.uint(b, 4, 4);
                if (current.fixedSize < 0) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad stsz");
                if (current.fixedSize == 0) {
                    int n = count(b, 8, 4);
                    current.sizes = new int[n];
                    for (int i = 0; i < n; i++) {
                        current.sizes[i] = (int) Ebml.uint(b, 12 + 4 * i, 4);
                        if (current.sizes[i] < 0) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad stsz");
                    }
                }
            } else if (type == STCO || type == CO64) {
                int width = type == STCO ? 4 : 8;
                int n = count(b, 4, width);
                current.chunks = new long[n];
                for (int i = 0; i < n; i++) current.chunks[i] = Ebml.uint(b, 8 + width * i, width);
            } else if (type == STSS) {
                int n = count(b, 4, 4);
                current.stss = new int[n];
                for (int i = 0; i < n; i++) {
                    current.stss[i] = (int) Ebml.uint(b, 8 + 4 * i, 4);
                    if (current.stss[i] < 1) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad stss");
                }
            }
        } catch (ArrayIndexOutOfBoundsException | NegativeArraySizeException short_box) {
            throw new DemuxException(DemuxException.Kind.MALFORMED, "short box");
        }
    }

    /** The count field, checked against what the box can hold. */
    private static int count(byte[] b, int at, int entrySize) throws DemuxException {
        long n = Ebml.uint(b, at, 4);
        if (n * entrySize > b.length - at - 4) throw new DemuxException(DemuxException.Kind.MALFORMED, "table overruns box");
        return (int) n;
    }

    private static void pairs(byte[] b, int n, int[] counts, int[] values) {
        for (int i = 0; i < n; i++) {
            counts[i] = (int) Ebml.uint(b, 8 + 8 * i, 4);
            values[i] = (int) Ebml.uint(b, 12 + 8 * i, 4);
        }
    }

    /** Leading empty edits delay the track; the first real edit says which media time plays first. */
    private void parseEdits(byte[] b) {
        boolean v1 = b[0] == 1;
        int width = v1 ? 8 : 4, entry = v1 ? 20 : 12;
        long n = Ebml.uint(b, 4, 4);
        long empty = 0;
        for (int i = 0; i < n && 8 + entry * (i + 1) <= b.length; i++) {
            long duration = Ebml.uint(b, 8 + entry * i, width);
            long media = Ebml.uint(b, 8 + entry * i + width, width);
            boolean isEmpty = v1 ? media == -1L : media == 0xFFFFFFFFL;
            if (isEmpty) {
                empty += duration;
            } else {
                current.mediaTime = media;
                break;
            }
        }
        current.emptyEditUs = empty * 1_000_000L / Math.max(1, movieTimescale);
    }

    private long ptsUs(Trak t, long mediaTicks) {
        return Math.floorDiv((mediaTicks - t.mediaTime) * 1_000_000L, t.timescale) + t.emptyEditUs;
    }

    private void indexKeyframes(Trak t) {
        if (t.sttsCount == null) return;
        int run = 0, left = t.sttsCount.length > 0 ? t.sttsCount[0] : 0, cttsRun = 0;
        long sample = 1, ticks = 0, cttsEnd = t.cttsCount != null && t.cttsCount.length > 0 ? t.cttsCount[0] : 0;
        for (int key : t.stss) {
            while (sample < key && run < t.sttsCount.length) {
                long step = Math.min(left, key - sample);
                ticks += step * t.sttsDelta[run];
                sample += step;
                left -= step;
                if (left == 0 && ++run < t.sttsCount.length) left = t.sttsCount[run];
            }
            long offset = 0;
            if (t.cttsCount != null && t.cttsCount.length > 0) {
                while (cttsRun + 1 < t.cttsCount.length && key > cttsEnd) cttsEnd += t.cttsCount[++cttsRun];
                offset = t.cttsOffset[cttsRun];
            }
            keyframes.add(ptsUs(t, ticks + offset), false);
        }
    }

    // ------------------------------------------------------------------ reading

    /** Calls back each coalesced byte span of the window; a dry run totals them without fetching. */
    private long plan(long fromUs, long endUs, FrameSink sink, ReadStats st) throws DemuxException {
        Trak t = chosen;
        if (t == null || t.chunks == null || t.chunks.length == 0
                || t.stscFirst == null || t.stscFirst.length == 0
                || t.sttsCount == null || t.sttsCount.length == 0
                || (t.fixedSize == 0 && t.sizes == null)) {
            throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "track has no sample tables");
        }
        // Sample range and the media time of its first sample.
        long first = -1, last = -1, sample = 0, ticks = 0, firstTicks = 0;
        boolean windowStops = false;
        for (int r = 0; r < t.sttsCount.length; r++) {
            long count = t.sttsCount[r] & 0xFFFFFFFFL, delta = t.sttsDelta[r] & 0xFFFFFFFFL;
            if (delta == 0) delta = 1;
            long runEnd = ticks + count * delta;
            if (first < 0 && ptsUs(t, runEnd) > fromUs) {
                long skip = Math.max(0, Math.min(count - 1, ((fromUs - t.emptyEditUs) * t.timescale / 1_000_000L + t.mediaTime - ticks) / delta));
                first = sample + skip;
                firstTicks = ticks + skip * delta;
            }
            if (first >= 0) {
                if (ptsUs(t, runEnd) > endUs) {
                    last = sample + Math.max(0, Math.min(count - 1, ((endUs - t.emptyEditUs) * t.timescale / 1_000_000L + t.mediaTime - ticks) / delta));
                    windowStops = true;
                    break;
                }
                last = sample + count - 1;
            }
            sample += count;
            ticks = runEnd;
        }
        if (first < 0) return 0;
        if (ptsUs(t, firstTicks) > endUs) return 0; // the window lies wholly in an edit gap
        if (sink == null) st = new ReadStats();
        else st.endOfStream = !windowStops;

        // The chunk holding the first sample.
        int c = 0, run = 0;
        long chunkFirst = 0;
        for (; c < t.chunks.length; c++) {
            while (run + 1 < t.stscFirst.length && c + 1 >= t.stscFirst[run + 1]) run++;
            if (chunkFirst + t.stscCount[run] > first) break;
            chunkFirst += t.stscCount[run];
        }
        SampleTimes times = new SampleTimes(t, first, firstTicks);
        long total = 0, s = chunkFirst;
        if (sink == null) plannedRequests = 0;
        while (c < t.chunks.length && s <= last) {
            long start = t.chunks[c], stop = start;
            int d = c, batchRun = run;
            long batchSamples = s;
            // Grow the batch while the next audio chunk is close behind.
            while (d < t.chunks.length && batchSamples <= last) {
                while (batchRun + 1 < t.stscFirst.length && d + 1 >= t.stscFirst[batchRun + 1]) batchRun++;
                if (t.chunks[d] < 0) throw new DemuxException(DemuxException.Kind.MALFORMED, "bad chunk offset");
                long gap = t.chunks[d] - stop;
                if (d > c && (gap < 0 || gap > coalesceGap)) break;
                long bytes = bytesOf(t, batchSamples, t.stscCount[batchRun]);
                if (bytes < 0 || bytes > MAX_BATCH) {
                    throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "chunk too large: " + bytes);
                }
                if (d > c && t.chunks[d] + bytes - start > MAX_BATCH) break;
                stop = t.chunks[d] + bytes;
                batchSamples += t.stscCount[batchRun];
                d++;
            }
            total += stop - start;
            if (sink == null) plannedRequests++;
            if (sink != null) {
                st.spanBytes += stop - start;
                if (!deliver(t, c, d, s, start, stop, first, last, times, sink, st)) return total;
            }
            c = d;
            run = batchRun;
            s = batchSamples;
        }
        return total;
    }

    private static long bytesOf(Trak t, long sample, int count) {
        if (t.fixedSize != 0) return (long) t.fixedSize * count;
        long sum = 0;
        for (long i = sample; i < sample + count && i < t.sizes.length; i++) sum += t.sizes[(int) i];
        return sum;
    }

    /** Fetches [start, stop) and hands out the wanted samples of chunks c..d. False when the file stops short. */
    private boolean deliver(Trak t, int c, int d, long s, long start, long stop, long first, long last,
                            SampleTimes times, FrameSink sink, ReadStats st) throws DemuxException {
        int length = (int) (stop - start);
        if (batch.length < length) batch = new byte[length];
        int got = 0;
        while (got < length) {
            int n = in.source.read(start + got, batch, got, length - got);
            if (n <= 0) break;
            got += n;
        }
        int run = 0;
        long used = 0;
        for (int i = c; i < d; i++) {
            while (run + 1 < t.stscFirst.length && i + 1 >= t.stscFirst[run + 1]) run++;
            long at = t.chunks[i] - start;
            for (int k = 0; k < t.stscCount[run]; k++, s++) {
                int size = t.fixedSize != 0 ? t.fixedSize : s < t.sizes.length ? t.sizes[(int) s] : 0;
                if (s >= first && s <= last) {
                    if (at + size > got) {
                        st.truncated = true;
                        st.endOfStream = true;
                        return false;
                    }
                    long pts = times.next();
                    st.frames++;
                    if (st.firstPtsUs == Long.MIN_VALUE) st.firstPtsUs = pts;
                    st.lastPtsUs = pts;
                    st.audioBytes += size;
                    used += size;
                    sink.onFrame(batch, (int) at, size, pts);
                }
                at += size;
            }
        }
        st.otherBytes += got - used;
        return true;
    }

    /** Forward-only walk of the time table. */
    private final class SampleTimes {
        private final Trak t;
        private int run;
        private long left, ticks;

        SampleTimes(Trak t, long first, long firstTicks) {
            this.t = t;
            ticks = firstTicks;
            long sample = 0;
            for (run = 0; run < t.sttsCount.length; run++) {
                long count = t.sttsCount[run] & 0xFFFFFFFFL;
                if (first < sample + count) {
                    left = sample + count - first;
                    return;
                }
                sample += count;
            }
        }

        long next() {
            long pts = ptsUs(t, ticks);
            if (run < t.sttsCount.length) {
                long delta = t.sttsDelta[run] & 0xFFFFFFFFL;
                ticks += delta == 0 ? 1 : delta;
                if (--left <= 0) {
                    while (++run < t.sttsCount.length && (t.sttsCount[run] & 0xFFFFFFFFL) == 0) {
                        // Skip zero-count runs.
                    }
                    if (run < t.sttsCount.length) left = t.sttsCount[run] & 0xFFFFFFFFL;
                }
            }
            return pts;
        }
    }

    @Override
    public long estimateBytes(long fromUs, long endUs) {
        try {
            return plan(fromUs, endUs, null, null);
        } catch (DemuxException error) {
            return -1;
        }
    }

    @Override
    public ReadStats read(long fromUs, long endUs, FrameSink sink) throws DemuxException {
        ReadStats st = new ReadStats();
        plan(fromUs, endUs, sink, st);
        return st;
    }
}
