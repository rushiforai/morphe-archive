package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.AudioDecoder;
import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;
import app.tikkamasalla.stremio.oneahead.demux.RangeSource;
import app.tikkamasalla.stremio.oneahead.demux.TrackInfo;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;

/**
 * The real fetcher and demuxer over a virtual Matroska file generated on demand, with a tone decoder:
 * nothing is stored, so a 106 Mbit/s file costs no disk and the heap measured is the fetcher's own.
 * Usage: OneAheadFetchTest [mbit, default 4]. Run it under a small -Xmx to find the floor.
 */
public final class OneAheadFetchTest {
    static final double FILE_SEC = 3600, META_GUESS_SEC = 1200;

    /** Clusters of 1.024 s, each 32 pairs of a 32 ms audio frame and a video frame. */
    static final class VirtualMkv implements RangeSource {
        static final int AUDIO_PAYLOAD = 500, CLUSTER_HEAD = 4 + 8 + 2 + 4, BLOCK_HEAD = 1 + 8 + 4, PAIRS = 32;
        final byte[] head;
        final int videoPayload, pair;
        final long clusterBytes, clusters, total;
        final ByteBudget budget;
        long fetched; int requests;

        VirtualMkv(double mbit, ByteBudget budget) {
            this.budget = budget;
            videoPayload = Math.max(16, (int) (mbit * 1e6 / 8 * 0.032) - AUDIO_PAYLOAD);
            pair = BLOCK_HEAD + AUDIO_PAYLOAD + BLOCK_HEAD + videoPayload;
            clusterBytes = CLUSTER_HEAD + (long) PAIRS * pair;
            clusters = (long) Math.ceil(FILE_SEC / 1.024);
            byte[] info = cat(el(0x2AD7B1, uint(1_000_000, 3)), el(0x4489, dbl(FILE_SEC * 1000)));
            byte[] audio = cat(el(0xD7, uint(1, 1)), el(0x83, uint(2, 1)), el(0x86, "A_AC3".getBytes()),
                    el(0x23E383, uint(32_000_000, 4)), el(0xE1, cat(el(0xB5, flt(48000f)), el(0x9F, uint(2, 1)))));
            byte[] video = cat(el(0xD7, uint(2, 1)), el(0x83, uint(1, 1)), el(0x86, "V_MPEG4/ISO/AVC".getBytes()));
            byte[] tracks = cat(el(0xAE, audio), el(0xAE, video));
            byte[] ebml = el(0x1A45DFA3, el(0x4282, "matroska".getBytes()));
            byte[] body = cat(el(0x1549A966, info), el(0x1654AE6B, tracks));
            byte[] seg = cat(idBytes(0x18538067), size8(body.length + clusters * clusterBytes));
            head = cat(ebml, seg, body);
            total = head.length + clusters * clusterBytes;
        }

        static byte[] cat(byte[]... parts) {
            ByteArrayOutputStream o = new ByteArrayOutputStream();
            for (byte[] p : parts) o.write(p, 0, p.length);
            return o.toByteArray();
        }
        static byte[] idBytes(int id) {
            int n = id > 0xFFFFFF ? 4 : id > 0xFFFF ? 3 : id > 0xFF ? 2 : 1;
            byte[] b = new byte[n];
            for (int i = 0; i < n; i++) b[i] = (byte) (id >>> (8 * (n - 1 - i)));
            return b;
        }
        static byte[] size8(long v) {
            byte[] b = new byte[8];
            b[0] = 1;
            for (int i = 1; i < 8; i++) b[i] = (byte) (v >>> (8 * (7 - i)));
            return b;
        }
        static byte[] uint(long v, int n) {
            byte[] b = new byte[n];
            for (int i = 0; i < n; i++) b[i] = (byte) (v >>> (8 * (n - 1 - i)));
            return b;
        }
        static byte[] dbl(double d) { return ByteBuffer.allocate(8).putDouble(d).array(); }
        static byte[] flt(float f) { return ByteBuffer.allocate(4).putFloat(f).array(); }
        static byte[] el(int id, byte[] body) { return cat(idBytes(id), size8(body.length), body); }

        private void block(byte[] dst, int dstOff, int from, int len, int track, int payload, int relMs) {
            byte[] h = new byte[BLOCK_HEAD];
            h[0] = (byte) 0xA3;
            System.arraycopy(size8(4 + payload), 0, h, 1, 8);
            h[9] = (byte) (0x80 | track);
            h[10] = (byte) (relMs >>> 8);
            h[11] = (byte) relMs;
            h[12] = (byte) 0x80;
            for (int i = from; i < from + len && i < BLOCK_HEAD; i++) dst[dstOff + i - from] = h[i];
        }

        @Override
        public int read(long pos, byte[] dst, int off, int len) throws DemuxException {
            requests++;
            budget.check(len);
            if (pos >= total) return 0;
            int want = (int) Math.min(len, total - pos);
            Arrays.fill(dst, off, off + want, (byte) 0);
            int done = 0;
            while (done < want) {
                long at = pos + done;
                if (at < head.length) {
                    int n = Math.min(want - done, head.length - (int) at);
                    System.arraycopy(head, (int) at, dst, off + done, n);
                    done += n;
                    continue;
                }
                long rel = at - head.length;
                long c = rel / clusterBytes;
                long inC = rel % clusterBytes;
                if (inC < CLUSTER_HEAD) {
                    byte[] h = cat(idBytes(0x1F43B675), size8(clusterBytes - 12), new byte[]{(byte) 0xE7, (byte) 0x84}, uint(c * 1024, 4));
                    // 4 id + 8 size + 2 element head + 4 value = CLUSTER_HEAD
                    int n = (int) Math.min(want - done, CLUSTER_HEAD - inC);
                    System.arraycopy(h, (int) inC, dst, off + done, n);
                    done += n;
                    continue;
                }
                long inPairs = inC - CLUSTER_HEAD;
                int p = (int) (inPairs / pair), inPair = (int) (inPairs % pair);
                int relMs = p * 32;
                int aEnd = BLOCK_HEAD + AUDIO_PAYLOAD;
                int n;
                if (inPair < BLOCK_HEAD) {
                    n = Math.min(want - done, BLOCK_HEAD - inPair);
                    block(dst, off + done, inPair, n, 1, AUDIO_PAYLOAD, relMs);
                } else if (inPair < aEnd) {
                    n = Math.min(want - done, aEnd - inPair);
                } else if (inPair < aEnd + BLOCK_HEAD) {
                    n = Math.min(want - done, aEnd + BLOCK_HEAD - inPair);
                    block(dst, off + done, inPair - aEnd, n, 2, videoPayload, relMs);
                } else {
                    n = Math.min(want - done, pair - inPair);
                }
                done += n;
            }
            fetched += done;
            budget.add(done);
            return done;
        }
        @Override public long length() { return total; }
        @Override public long bytesFetched() { return fetched; }
        @Override public int requests() { return requests; }
    }

    static final class ToneFactory implements AudioDecoder.Factory {
        @Override public boolean canDecode(String mime) { return true; }
        @Override public boolean isSoftware(String mime) { return true; }
        @Override public AudioDecoder create(TrackInfo track, AudioDecoder.Output output) {
            return new AudioDecoder() {
                final ByteBuffer buf = ByteBuffer.allocate(1536 * 4).order(ByteOrder.nativeOrder());
                @Override public void queue(byte[] data, int off, int len, long ptsUs) throws DemuxException {
                    buf.clear();
                    for (int i = 0; i < 1536; i++) {
                        short v = (short) (8000 * Math.sin(2 * Math.PI * 440 * (ptsUs / 1e6 + i / 48000.0)));
                        buf.putShort(v); buf.putShort(v);
                    }
                    buf.flip();
                    output.onDecoded(buf, PCM_16BIT, 2, 48000, ptsUs);
                }
                @Override public void flush() { }
                @Override public void drainToEnd() { }
                @Override public void release() { }
            };
        }
    }

    public static void main(String[] a) throws Exception {
        double mbit = a.length > 0 ? Double.parseDouble(a[0]) : 4;
        final long[] peak = {0};
        final boolean[] stop = {false};
        Thread sampler = new Thread(() -> {
            Runtime r = Runtime.getRuntime();
            while (!stop[0]) {
                peak[0] = Math.max(peak[0], r.totalMemory() - r.freeMemory());
                try { Thread.sleep(5); } catch (InterruptedException e) { return; }
            }
        });
        sampler.setDaemon(true);
        sampler.start();
        ByteBudget budget = new ByteBudget(OneAheadPlanner.FILE_CAP);
        VirtualMkv file = new VirtualMkv(mbit, budget);
        DemuxFeatureFetcher fetcher = new DemuxFeatureFetcher((ref, b, g) -> file, new ToneFactory(), msg -> { });
        OneAheadPlanner.FileRef ref = new OneAheadPlanner.FileRef("ep", "ep", 1, file.total, 7, META_GUESS_SEC,
                OneAheadPlanner.Container.MKV, false, false, null, -1);
        long t0 = System.currentTimeMillis();
        EpisodeFeatures e;
        try {
            e = fetcher.fetch(OneAheadPlanner.filePlan(ref, OneAheadPlanner.Mode.FULL,
                    OneAheadPlanner.slices(META_GUESS_SEC, OneAheadPlanner.Mode.FULL)), budget, PlaybackGuard.NONE);
        } catch (OutOfMemoryError oom) {
            System.out.println("OOM at -Xmx " + Runtime.getRuntime().maxMemory() / 1048576);
            System.exit(3);
            return;
        }
        stop[0] = true;
        boolean durationOk = Math.abs(e.duration - FILE_SEC) < 1.0;
        boolean tailOk = Math.abs(e.tail.offset - (FILE_SEC - OneAheadPlanner.TAIL_SEC)) < 1.0;
        System.out.printf("mbit=%.1f file=%.1fGB fetched=%.2fGB requests=%d heapMax=%dMB peakUsed=%dMB secs=%d duration=%.1f audioEnd=%.1f tailOffset=%.1f%n",
                mbit, file.total / 1e9, file.fetched / 1e9, file.requests, Runtime.getRuntime().maxMemory() / 1048576,
                peak[0] / 1048576, (System.currentTimeMillis() - t0) / 1000, e.duration, e.audioEnd, e.tail.offset);
        System.out.println(durationOk && tailOk ? "F1 real duration OK" : "F1 FAIL duration " + e.duration + " tail " + e.tail.offset);
        System.exit(durationOk && tailOk ? 0 : 1);
    }
}
