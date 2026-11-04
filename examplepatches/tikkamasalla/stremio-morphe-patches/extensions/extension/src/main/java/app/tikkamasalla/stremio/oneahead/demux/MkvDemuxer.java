package app.tikkamasalla.stremio.oneahead.demux;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Matroska over byte ranges. Index from Cues, or a search over Cluster timestamps when there are
 * none. Reads clusters in a flat walk, so known-size and unknown-size clusters are the same case,
 * keeps only the chosen track's frames and skips everything else without holding it.
 */
final class MkvDemuxer implements Demuxer {
    private static final int ID_EBML = 0x1A45DFA3, ID_SEGMENT = 0x18538067, ID_SEEKHEAD = 0x114D9B74,
            ID_SEEK = 0x4DBB, ID_SEEKID = 0x53AB, ID_SEEKPOS = 0x53AC, ID_INFO = 0x1549A966,
            ID_SCALE = 0x2AD7B1, ID_DURATION = 0x4489, ID_TRACKS = 0x1654AE6B, ID_CUES = 0x1C53BB6B,
            ID_CLUSTER = 0x1F43B675, ID_CHAPTERS = 0x1043A770, ID_TAGS = 0x1254C367, ID_ATTACH = 0x1941A469,
            ID_TIMECODE = 0xE7, ID_SIMPLE = 0xA3, ID_GROUP = 0xA0, ID_BLOCK = 0xA1, ID_REFBLOCK = 0xFB,
            ID_VOID = 0xEC, ID_CRC = 0xBF, ID_PREVSIZE = 0xAB, ID_POSITION = 0xA7, ID_SILENT = 0x5854,
            ID_BLOCKDUR = 0x9B, ID_DISCARD = 0x75A2, ID_ADDITIONS = 0x75A1;
    private static final int META_CHUNK = 256 * 1024, PROBE_CHUNK = 128 * 1024;
    /**
     * Bytes per request while walking clusters. Smaller skips more video and makes more requests. A window
     * is mostly read through anyway (measured: 83.5% of the span at 1 MiB on a 4K remux, 96% on a WEB-DL), and
     * 0.16-0.25 s per request capped 1 MiB requests at 3.4-4 MB/s. The buffer is this size whatever the file.
     */
    int streamChunk = 4 * 1024 * 1024;
    /** Audio may sit in the cluster before the one its time points at. */
    private static final long SKEW_US = 1_000_000;
    private static final long PROBE_SCAN_LIMIT = 64L * 1024 * 1024, MAX_ELEMENT = 32L * 1024 * 1024, MAX_BLOCK = 8L * 1024 * 1024;
    /** Search stops once it is this close before the target. */
    private static final long SEARCH_TOLERANCE_US = 30_000_000, SEARCH_TOLERANCE_NO_CHAIN_US = 8_000_000;
    /** Header reads spent walking cluster sizes towards a window start. */
    private static final int CHAIN_STEPS = 48, CHAIN_CHUNK = 4 * 1024;

    private final RangeInput in;
    private final DemuxLog log;
    private final List<TrackInfo> tracks = new ArrayList<>();
    private final KeyframeLog keyframes = new KeyframeLog();
    private final TreeMap<Long, Long> index = new TreeMap<>(); // first time in a cluster (ticks) to byte position
    private final List<long[]> seeks = new ArrayList<>();
    private long segData, segEnd = -1, firstCluster = -1;
    private long scaleNs = 1_000_000;
    private double durationTicks = -1;
    private int videoTrack = -1;
    private boolean hasCues, unknownSizeSeen;
    private TrackInfo audio;
    /** Test hook: behave as if the file had no Cues. */
    static boolean ignoreCues;

    MkvDemuxer(RangeSource source, DemuxLog log) {
        this.in = new RangeInput(source, META_CHUNK);
        this.log = log;
    }

    @Override
    public List<TrackInfo> tracks() {
        return tracks;
    }

    @Override
    public void select(TrackInfo track) {
        audio = track;
    }

    @Override
    public KeyframeLog keyframes() {
        return keyframes;
    }

    @Override
    public double durationSec() {
        return durationTicks < 0 ? -1 : durationTicks * scaleNs / 1e9;
    }

    private long toUs(long ticks) {
        return ticks * scaleNs / 1000;
    }

    private long toTicks(long us) {
        return Math.max(0, us) * 1000 / scaleNs;
    }

    // ------------------------------------------------------------------ head

    /** An element header read at the cursor: id, size (-1 unknown) and the cursor left on the body. */
    private int headerId;
    private long headerSize;

    private boolean readHeader() throws DemuxException {
        if (!in.ensure(1)) return false;
        int il = Ebml.idLen(in.buf()[in.off()]);
        if (il == 0 || !in.ensure(il + 1)) return false;
        int sl = Ebml.sizeLen(in.buf()[in.off() + il]);
        if (sl == 0 || !in.ensure(il + sl)) return false;
        headerId = Ebml.id(in.buf(), in.off(), il);
        headerSize = Ebml.vint(in.buf(), in.off() + il, sl);
        in.skip(il + sl);
        return true;
    }

    private byte[] readBody(long size) throws DemuxException {
        if (size > MAX_ELEMENT) throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "metadata too large: " + size);
        return in.readBytes((int) size);
    }

    @Override
    public void open() throws DemuxException {
        in.seek(0);
        if (!readHeader() || headerId != ID_EBML || headerSize < 0) {
            throw new DemuxException(DemuxException.Kind.UNSUPPORTED, "not Matroska");
        }
        in.skip(headerSize);
        if (!readHeader() || headerId != ID_SEGMENT) throw new DemuxException(DemuxException.Kind.MALFORMED, "no Segment");
        segData = in.pos();
        if (headerSize >= 0) segEnd = segData + headerSize;

        boolean haveInfo = false, haveTracks = false;
        byte[] cues = null; // Parsed last: it needs the timestamp scale and the video track.
        for (int i = 0; i < 128; i++) {
            long at = in.pos();
            if (!readHeader()) break;
            if (headerId == ID_CLUSTER) {
                firstCluster = at;
                break;
            }
            if (headerSize < 0) break;
            if (headerId == ID_SEEKHEAD) {
                visitedSeekHeads.add(at);
                parseSeekHead(readBody(headerSize));
            } else if (headerId == ID_INFO) haveInfo = parseInfo(readBody(headerSize));
            else if (headerId == ID_TRACKS) haveTracks = parseTracks(readBody(headerSize));
            else if (headerId == ID_CUES) cues = readBody(headerSize);
            else in.skip(headerSize);
        }
        // The first SeekHead may point to the rest, including a second SeekHead near the end.
        for (int s = 0; s < seeks.size() && s < 64; s++) {
            int id = (int) seeks.get(s)[0];
            long at = segData + seeks.get(s)[1];
            boolean wanted = (id == ID_SEEKHEAD && !visitedSeekHeads.contains(at))
                    || (id == ID_INFO && !haveInfo) || (id == ID_TRACKS && !haveTracks) || (id == ID_CUES && cues == null);
            if (!wanted || at < segData || (in.source.length() >= 0 && at >= in.source.length())) continue;
            in.seek(at);
            if (!readHeader() || headerId != id || headerSize < 0 || headerSize > MAX_ELEMENT) continue;
            byte[] body = readBody(headerSize);
            if (id == ID_SEEKHEAD) {
                visitedSeekHeads.add(at);
                parseSeekHead(body);
            } else if (id == ID_INFO) haveInfo = parseInfo(body);
            else if (id == ID_TRACKS) haveTracks = parseTracks(body);
            else cues = body;
        }
        if (!haveTracks) throw new DemuxException(DemuxException.Kind.MALFORMED, "no Tracks");
        parseCues(cues);
        if (firstCluster < 0) {
            long[] hit = findCluster(segData, in.source.length() < 0 ? PROBE_SCAN_LIMIT : in.source.length() - segData);
            if (hit == null) throw new DemuxException(DemuxException.Kind.MALFORMED, "no Cluster");
            firstCluster = hit[0];
        }
        if (durationTicks < 0) findEndFromTail();
    }

    private final List<Long> visitedSeekHeads = new ArrayList<>();

    private void parseSeekHead(byte[] b) {
        if (b == null) return;
        for (Ebml e = new Ebml(b, 0, b.length); e.next(); ) {
            if (e.id != ID_SEEK) continue;
            long id = -1, pos = -1;
            for (Ebml c = e.children(); c.next(); ) {
                if (c.id == ID_SEEKID && c.size <= 4) id = c.uint();
                else if (c.id == ID_SEEKPOS && c.size <= 8) pos = c.uint();
            }
            if (id >= 0 && pos >= 0) seeks.add(new long[]{id, pos});
        }
    }

    private boolean parseInfo(byte[] b) {
        if (b == null) return false;
        for (Ebml e = new Ebml(b, 0, b.length); e.next(); ) {
            if (e.id == ID_SCALE && e.size <= 8) scaleNs = Math.max(1, Math.min(1_000_000_000L, e.uint()));
            else if (e.id == ID_DURATION) durationTicks = e.floating();
        }
        return true;
    }

    private boolean parseTracks(byte[] b) {
        if (b == null) return false;
        for (Ebml e = new Ebml(b, 0, b.length); e.next(); ) {
            if (e.id != 0xAE) continue;
            TrackInfo t = new TrackInfo();
            t.language = "eng"; // The specification's default when the element is absent.
            int type = -1;
            String ietf = null;
            for (Ebml c = e.children(); c.next(); ) {
                switch (c.id) {
                    case 0xD7: t.number = (int) c.uint(); break;
                    case 0x83: type = (int) c.uint(); break;
                    case 0x86: t.codecId = c.string(); break;
                    case 0x63A2: t.codecPrivate = java.util.Arrays.copyOfRange(c.b, c.body, c.body + (int) c.size); break;
                    case 0x23E383: t.defaultDurationNs = c.uint(); break;
                    case 0x22B59C: t.language = c.string(); break;
                    case 0x22B59D: ietf = c.string(); break;
                    case 0x536E: t.name = c.string(); break;
                    case 0x88: t.isDefault = c.uint() != 0; break;
                    case 0x55AF: t.commentary = c.uint() != 0; break;
                    case 0x55AC: t.visualImpaired = c.uint() != 0; break;
                    case 0x56AA: t.codecDelayNs = c.uint(); break;
                    case 0x56BB: t.seekPreRollNs = c.uint(); break;
                    case 0xE1:
                        double rate = -1, output = -1;
                        for (Ebml a = c.children(); a.next(); ) {
                            if (a.id == 0xB5) rate = a.floating();
                            else if (a.id == 0x78B5) output = a.floating();
                            else if (a.id == 0x9F) t.channels = (int) a.uint();
                        }
                        double shown = output > 0 ? output : rate;
                        t.sampleRate = shown > 0 ? (int) Math.round(shown) : 8000;
                        break;
                    case 0x6D80: parseEncodings(c, t); break;
                    default: break;
                }
            }
            if (ietf != null && !ietf.isEmpty()) t.language = ietf;
            t.mime = TrackInfo.mimeOfMatroska(t.codecId);
            if (type == 1 && videoTrack < 0) videoTrack = t.number;
            else if (type == 2) tracks.add(t);
        }
        return true;
    }

    private static void parseEncodings(Ebml encodings, TrackInfo t) {
        for (Ebml e = encodings.children(); e.next(); ) {
            if (e.id != 0x6240) continue;
            long scope = 1, kind = 0, algo = 0;
            byte[] settings = null;
            boolean encrypted = false;
            for (Ebml c = e.children(); c.next(); ) {
                if (c.id == 0x5032) scope = c.uint();
                else if (c.id == 0x5033) kind = c.uint();
                else if (c.id == 0x5035) encrypted = true;
                else if (c.id == 0x5034) {
                    for (Ebml z = c.children(); z.next(); ) {
                        if (z.id == 0x4254) algo = z.uint();
                        else if (z.id == 0x4255) settings = java.util.Arrays.copyOfRange(z.b, z.body, z.body + (int) z.size);
                    }
                }
            }
            if (encrypted || kind != 0 || algo != 3 || (scope & 1) == 0) t.unreadable = true;
            else t.stripPrefix = settings;
        }
    }

    private void parseCues(byte[] b) {
        if (b == null || ignoreCues) return;
        long lastCluster = -1;
        for (Ebml e = new Ebml(b, 0, b.length); e.next(); ) {
            if (e.id != 0xBB) continue;
            long time = -1, position = -1;
            boolean video = false;
            for (Ebml c = e.children(); c.next(); ) {
                if (c.id == 0xB3) time = c.uint();
                else if (c.id == 0xB7) {
                    for (Ebml p = c.children(); p.next(); ) {
                        if (p.id == 0xF7) video |= p.uint() == videoTrack;
                        else if (p.id == 0xF1 && position < 0) position = p.uint();
                    }
                }
            }
            if (time < 0 || position < 0) continue;
            long at = segData + position;
            if (at < segData || (in.source.length() >= 0 && at >= in.source.length())) continue; // Truncated file: index runs past it.
            if (video) keyframes.add(toUs(time), false);
            if (at != lastCluster && !index.containsKey(time)) index.put(time, at);
            lastCluster = at;
        }
        hasCues = !index.isEmpty();
    }

    // ------------------------------------------------------------------ finding clusters without Cues

    /** Finds the first real Cluster at or after from, scanning at most limit bytes. {position, ticks} or null. */
    private long[] findCluster(long from, long limit) throws DemuxException {
        in.setChunk(PROBE_CHUNK);
        in.setSoftEnd(-1);
        in.seek(from);
        long end = from + limit;
        scan:
        while (in.pos() < end) {
            if (!in.ensure(32) && in.buffered() < 8) return null;
            byte[] b = in.buf();
            int o = in.off(), n = (int) Math.min(in.buffered(), end - in.pos());
            for (int i = 0; i + 8 <= n; i++) {
                if (b[o + i] != 0x1F || b[o + i + 1] != 0x43 || (b[o + i + 2] & 0xFF) != 0xB6 || (b[o + i + 3] & 0xFF) != 0x75) continue;
                long at = in.pos() + i;
                in.seek(at);
                long[] hit = checkCluster(at);
                if (hit != null) return hit;
                in.seek(at + 1); // Video data can look like the ID: go on behind it.
                continue scan;
            }
            in.skip(Math.max(1, n - 7));
        }
        return null;
    }

    /** With the cursor on a Cluster ID: {position, ticks} if the children look right, else null. */
    private long[] checkCluster(long at) throws DemuxException {
        if (!in.ensure(64) && in.buffered() < 16) return null;
        byte[] b = in.buf();
        int o = in.off(), n = in.buffered();
        int sl = Ebml.sizeLen(b[o + 4]);
        if (sl == 0 || 4 + sl >= n) return null;
        long size = Ebml.vint(b, o + 4, sl);
        long limit = Math.max(segEnd, in.source.length());
        if (size >= 0 && limit >= 0 && at + size > limit) return null;
        Ebml e = new Ebml(b, o + 4 + sl, o + n);
        for (int i = 0; i < 3 && e.next(); i++) {
            if (e.id == ID_TIMECODE && e.size >= 1 && e.size <= 8) {
                unknownSizeSeen |= size < 0;
                long ticks = e.uint();
                return durationTicks > 0 && ticks > durationTicks * 1.05 + toTicks(60_000_000) ? null : new long[]{at, ticks};
            }
            if (e.id != ID_CRC && e.id != ID_VOID) return null;
        }
        return null;
    }

    private void findEndFromTail() throws DemuxException {
        long total = in.source.length();
        if (total < 0) return;
        for (long span = 4L * 1024 * 1024; span <= PROBE_SCAN_LIMIT; span *= 4) {
            long from = Math.max(firstCluster, total - span);
            long[] last = null, hit;
            long at = from;
            while ((hit = findCluster(at, total - at)) != null) {
                last = hit;
                at = hit[0] + 4;
            }
            if (last != null) {
                ReadStats scratch = new ReadStats();
                walk(last[0], Long.MIN_VALUE, Long.MAX_VALUE, null, scratch);
                durationTicks = Math.max(last[1], lastTick);
                log.log("duration from tail: " + durationSec());
                return;
            }
            if (from == firstCluster) return;
        }
    }

    /** A cluster position at or before target, narrowed by interpolation over cluster timestamps. */
    private long searchCluster(long targetTicks) throws DemuxException {
        long total = in.source.length();
        if (total < 0 || durationTicks <= 0) return firstCluster;
        long loPos = firstCluster, loTick = 0, hiPos = total, hiTick = (long) durationTicks;
        Map.Entry<Long, Long> known = index.floorEntry(targetTicks);
        if (known != null) {
            loTick = known.getKey();
            loPos = known.getValue();
        }
        known = index.higherEntry(targetTicks);
        if (known != null) {
            hiTick = known.getKey();
            hiPos = known.getValue();
        }
        long spent = 0;
        for (int step = 0; step < 16 && spent < PROBE_SCAN_LIMIT; step++) {
            long tolerance = toTicks(unknownSizeSeen ? SEARCH_TOLERANCE_NO_CHAIN_US : SEARCH_TOLERANCE_US);
            if (targetTicks - loTick <= tolerance) break;
            long width = hiPos - loPos;
            if (width <= PROBE_CHUNK) break;
            double f = hiTick > loTick ? (double) (targetTicks - loTick) / (hiTick - loTick) : 0.5;
            long guess = loPos + (long) (width * Math.max(0.0625, Math.min(0.9375, f)));
            long before = in.source.bytesFetched();
            long[] hit = findCluster(guess, Math.min(hiPos - guess, PROBE_SCAN_LIMIT));
            spent += in.source.bytesFetched() - before;
            if (hit == null) {
                hiPos = guess; // Nothing between the guess and the upper bound: a long cluster.
                continue;
            }
            index.put(hit[1], hit[0]);
            if (hit[1] <= targetTicks) {
                loPos = hit[0];
                loTick = hit[1];
            } else {
                hiPos = hit[0];
                hiTick = hit[1];
            }
        }
        log.log("cluster search: landed " + toUs(targetTicks - loTick) / 1000 + " ms before target, "
                + spent + " bytes");
        return loPos;
    }

    // ------------------------------------------------------------------ reading

    @Override
    public long estimateBytes(long fromUs, long endUs) {
        long total = in.source.length();
        if (hasCues) {
            Map.Entry<Long, Long> first = index.floorEntry(toTicks(fromUs - SKEW_US));
            Map.Entry<Long, Long> last = index.higherEntry(toTicks(endUs + SKEW_US));
            long a = first != null ? first.getValue() : firstCluster;
            long b = last != null ? last.getValue() : total;
            return b >= 0 ? Math.max(0, b - a) : -1;
        }
        double seconds = durationSec();
        if (total < 0 || seconds <= 0) return -1;
        return (long) ((total - firstCluster) * Math.min(1.0, (endUs - fromUs) / 1e6 / seconds));
    }

    @Override
    public ReadStats read(long fromUs, long endUs, FrameSink sink) throws DemuxException {
        ReadStats stats = new ReadStats();
        long startTicks = toTicks(fromUs - SKEW_US);
        long at = firstCluster;
        if (hasCues) {
            Map.Entry<Long, Long> e = index.floorEntry(startTicks);
            if (e != null) at = e.getValue();
        } else if (toUs(startTicks) > SEARCH_TOLERANCE_US) {
            at = searchCluster(startTicks);
        }
        in.setSoftEnd(-1);
        in.setChunk(CHAIN_CHUNK);
        in.seek(at);
        if (hasCues && !startsWithCluster()) {
            log.log("Cues point at no Cluster: dropping them");
            hasCues = false;
            index.clear();
            at = searchCluster(startTicks);
            in.setChunk(CHAIN_CHUNK);
        }
        at = chainForward(at, startTicks);
        Map.Entry<Long, Long> after = hasCues ? index.higherEntry(toTicks(endUs + 2 * SKEW_US)) : null;
        in.setChunk(streamChunk);
        in.setSoftEnd(after != null ? after.getValue() : -1);
        walk(at, fromUs, endUs, sink, stats);
        return stats;
    }

    private boolean startsWithCluster() throws DemuxException {
        return in.ensure(4) && Ebml.id(in.buf(), in.off(), 4) == ID_CLUSTER;
    }

    /**
     * Clusters that end before the window need not be downloaded: a known size says where the next
     * one starts, and its header says whether it is still early. Stops at the first cluster whose
     * successor starts after the target, at an unknown size, or at anything unexpected.
     */
    private long chainForward(long at, long targetTicks) throws DemuxException {
        for (int step = 0; step < CHAIN_STEPS; step++) {
            in.seek(at);
            if (!readHeader() || headerId != ID_CLUSTER || headerSize < 0) return at;
            long next = in.pos() + headerSize;
            if (in.source.length() >= 0 && next >= in.source.length()) return at;
            in.seek(next);
            long[] hit;
            if (!in.ensure(16) || (hit = checkCluster(next)) == null || hit[1] > targetTicks) return at;
            at = next;
        }
        return at;
    }

    private long lastTick = -1;
    // State of one walk; fields because the block handler needs them.
    private long walkClusterTicks;
    private long walkPendingKeyUs;
    private boolean walkDone;

    /** The flat walk from a position until the window is past or the file ends. */
    private void walk(long start, long fromUs, long endUs, FrameSink sink, ReadStats st) throws DemuxException {
        in.setChunk(streamChunk);
        in.seek(start);
        long total = in.source.length();
        long groupEnd = -1, clusterAt = -1;
        walkClusterTicks = -1;
        walkPendingKeyUs = -1;
        walkDone = false;
        while (!walkDone) {
            if (groupEnd >= 0 && in.pos() >= groupEnd) {
                if (walkPendingKeyUs >= 0) keyframes.add(walkPendingKeyUs, true);
                walkPendingKeyUs = -1;
                groupEnd = -1;
            }
            if (segEnd >= 0 && in.pos() >= segEnd) {
                st.endOfStream = true;
                break;
            }
            long elementAt = in.pos();
            if (!readHeader()) {
                if (in.buffered() == 0 && (in.source.length() < 0 || elementAt >= in.source.length())) {
                    st.endOfStream = true;
                    st.truncated |= segEnd > elementAt;
                    break;
                }
                if (!resync(elementAt, st)) break;
                continue;
            }
            long size = headerSize;
            switch (headerId) {
                case ID_CLUSTER:
                    clusterAt = elementAt;
                    walkClusterTicks = -1;
                    st.clusters++;
                    break;
                case ID_GROUP:
                    if (size < 0) {
                        if (!resync(elementAt, st)) walkDone = true;
                        break;
                    }
                    groupEnd = in.pos() + size;
                    st.blockGroups++;
                    break;
                case ID_TIMECODE:
                    if (size < 1 || size > 8 || !in.ensure((int) size)) {
                        if (!resync(elementAt, st)) walkDone = true;
                        break;
                    }
                    walkClusterTicks = Ebml.uint(in.buf(), in.off(), (int) size);
                    in.skip(size);
                    if (walkClusterTicks < 0) {
                        if (!resync(elementAt, st)) walkDone = true;
                        break;
                    }
                    if (!hasCues && clusterAt >= 0 && index.size() < 16384) index.put(walkClusterTicks, clusterAt);
                    if (endUs != Long.MAX_VALUE && toUs(walkClusterTicks) > endUs + 5 * SKEW_US) walkDone = true;
                    break;
                case ID_SIMPLE:
                case ID_BLOCK:
                    if (size < 4 || walkClusterTicks < 0) {
                        if (!resync(elementAt, st)) walkDone = true;
                        break;
                    }
                    block(size, headerId == ID_SIMPLE, fromUs, endUs, sink, st);
                    break;
                case ID_REFBLOCK:
                    walkPendingKeyUs = -1;
                    in.skip(size);
                    break;
                case ID_VOID:
                case ID_CRC:
                case ID_PREVSIZE:
                case ID_POSITION:
                case ID_SILENT:
                case ID_BLOCKDUR:
                case ID_DISCARD:
                case ID_ADDITIONS:
                case 0xA4: // CodecState
                case 0xA2: // BlockVirtual
                case 0xFA: // ReferencePriority
                case 0xFD: // ReferenceVirtual
                case 0x8E: // Slices
                case 0xAF: // EncryptedBlock
                case ID_SEEKHEAD:
                case ID_INFO:
                case ID_TRACKS:
                case ID_CUES:
                case ID_CHAPTERS:
                case ID_TAGS:
                case ID_ATTACH:
                    if (size < 0) {
                        if (!resync(elementAt, st)) walkDone = true;
                        break;
                    }
                    in.skip(size);
                    break;
                default:
                    if (!resync(elementAt, st)) walkDone = true;
                    break;
            }
            total = in.source.length();
            if (total >= 0 && in.pos() > total) {
                // The last element runs past the file: the file was cut.
                st.endOfStream = true;
                st.truncated = true;
                break;
            }
        }
        st.spanBytes += Math.max(0, (total >= 0 ? Math.min(in.pos(), total) : in.pos()) - start);
    }

    /** Damage: looks for the next Cluster. False when none is near. */
    private boolean resync(long from, ReadStats st) throws DemuxException {
        st.resyncs++;
        long[] hit = findCluster(from + 1, PROBE_SCAN_LIMIT);
        in.setChunk(streamChunk);
        if (hit == null) {
            st.truncated = true;
            st.endOfStream = in.source.length() >= 0 && from + PROBE_SCAN_LIMIT >= in.source.length();
            return false;
        }
        log.log("resync from " + from + " to " + hit[0]);
        in.seek(hit[0]);
        return true;
    }

    private void block(long size, boolean simple, long fromUs, long endUs, FrameSink sink, ReadStats st) throws DemuxException {
        st.blocks++;
        if (!in.ensure((int) Math.min(size, 12))) {
            st.truncated = true;
            st.endOfStream = true;
            walkDone = true;
            return;
        }
        byte[] b = in.buf();
        int o = in.off();
        int tl = Ebml.sizeLen(b[o]);
        if (tl == 0 || tl + 3 > size) {
            in.skip(size);
            return;
        }
        long track = Ebml.vint(b, o, tl);
        int relative = (short) (((b[o + tl] & 0xFF) << 8) | (b[o + tl + 1] & 0xFF));
        int flags = b[o + tl + 2] & 0xFF;
        long ticks = walkClusterTicks + relative;
        lastTick = Math.max(lastTick, ticks);
        if (audio == null || track != audio.number) {
            if (track == videoTrack) {
                if (!simple) walkPendingKeyUs = toUs(ticks);
                else if ((flags & 0x80) != 0) keyframes.add(toUs(ticks), true);
            }
            st.otherBytes += size;
            in.skip(size);
            return;
        }
        long ptsUs = toUs(ticks) - audio.codecDelayNs / 1000;
        st.maxAudioSkewUs = Math.max(st.maxAudioSkewUs, Math.abs(toUs(relative)));
        if (fromUs != Long.MIN_VALUE && ptsUs > endUs) {
            walkDone = true;
            return;
        }
        if (fromUs != Long.MIN_VALUE && ptsUs + SKEW_US < fromUs) {
            st.otherBytes += size;
            in.skip(size);
            return;
        }
        if (size > MAX_BLOCK) {
            st.resyncs++;
            in.skip(size);
            return;
        }
        if (!in.ensure((int) size)) {
            st.truncated = true;
            st.endOfStream = true;
            walkDone = true;
            return;
        }
        st.audioBytes += size;
        if (sink != null) unlace(in.buf(), in.off() + tl + 3, in.off() + (int) size, flags, ptsUs, fromUs, endUs, sink, st);
        in.skip(size);
    }

    private byte[] prefixed = new byte[0];

    private void unlace(byte[] b, int p, int end, int flags, long ptsUs, long fromUs, long endUs,
                        FrameSink sink, ReadStats st) throws DemuxException {
        int lacing = (flags & 0x06) >> 1;
        st.laceKinds[lacing]++;
        int[] sizes;
        if (lacing == 0) {
            sizes = new int[]{end - p};
        } else {
            st.lacedBlocks++;
            if (p >= end) return;
            int n = (b[p++] & 0xFF) + 1;
            sizes = new int[n];
            long known = 0;
            if (lacing == 1) { // Xiph
                for (int i = 0; i < n - 1; i++) {
                    int v;
                    do {
                        if (p >= end) return;
                        v = b[p++] & 0xFF;
                        sizes[i] += v;
                    } while (v == 255);
                    known += sizes[i];
                }
            } else if (lacing == 3) { // EBML
                for (int i = 0; i < n - 1; i++) {
                    if (p >= end) return;
                    int len = Ebml.sizeLen(b[p]);
                    if (len == 0 || p + len > end) return;
                    long raw = Ebml.rawVint(b, p, len);
                    p += len;
                    long value = i == 0 ? raw : sizes[i - 1] + raw - ((1L << (7 * len - 1)) - 1);
                    if (value < 0 || value > end - p) return;
                    sizes[i] = (int) value;
                    known += value;
                }
            } else { // Fixed
                int each = (end - p) / n;
                for (int i = 0; i < n - 1; i++) sizes[i] = each;
                known = (long) each * (n - 1);
            }
            if (known > end - p) return;
            sizes[n - 1] = (int) (end - p - known);
        }
        long stepNs = audio.defaultDurationNs > 0 ? audio.defaultDurationNs : audio.codecFrameNs();
        byte[] prefix = audio.stripPrefix;
        for (int i = 0; i < sizes.length; i++) {
            int len = sizes[i];
            long pts = ptsUs + i * stepNs / 1000;
            if (len > 0 && (fromUs == Long.MIN_VALUE || (pts >= fromUs && pts <= endUs))) {
                st.frames++;
                if (st.firstPtsUs == Long.MIN_VALUE) st.firstPtsUs = pts;
                st.lastPtsUs = pts;
                if (prefix == null) {
                    sink.onFrame(b, p, len, pts);
                } else {
                    if (prefixed.length < prefix.length + len) prefixed = new byte[prefix.length + len];
                    System.arraycopy(prefix, 0, prefixed, 0, prefix.length);
                    System.arraycopy(b, p, prefixed, prefix.length, len);
                    sink.onFrame(prefixed, 0, prefix.length + len, pts);
                }
            }
            p += len;
        }
    }
}
