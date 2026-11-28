package app.ayham.extension.music.automix;

import android.content.Context;
import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.SystemClock;
import android.util.Log;

import com.music.bitchord.playback.smart.MelSpectrogram;
import com.music.bitchord.playback.smart.TrackFeatures;

import app.ayham.extension.music.features.AudioStream;

import org.json.JSONObject;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Song analysis, the extension's host page on the phone: each song is downloaded (Morphe's stream
 * resolver), decoded once, and analysed as BitChord web does (Beat This! on its first and last
 * 59 s, the vocal mask on its opening and end, energy, intro/outro, content end, key from BitChord's
 * native analyser). The analysis is saved (files/automix/analysis); the decoded opening and end are
 * kept as 16-bit PCM (cache/automix/pcm, the last few songs) for the mix decks.
 */
final class Analyzer {
    private static final String TAG = Automix.TAG;

    static final double BEAT_WINDOW_SEC = 59;
    static final double VOCAL_WINDOW_SEC = (958 * 1024) / 44100.0;
    /** The decoded opening and end kept for the decks. */
    static final double HEAD_SEC = 150, TAIL_SEC = 120;
    /** Longer songs (DJ sets, albums in one) are not analysed: a plain crossfade (versions.md, 8 minutes). */
    static final double MAX_SONG_SEC = 480;

    /** A song over MAX_SONG_SEC: not analysed, never retried, and not a failure (status "tooLong"). */
    static final class TooLong extends IOException {
        TooLong(String message) {
            super(message);
        }
    }
    static final double RETRY_FAILED_MS = 60000;
    static final int KEEP_PCM = 4;

    private static final Map<String, Analysis> results = new LinkedHashMap<String, Analysis>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Analysis> e) {
            return size() > 12;
        }
    };
    private static final Map<String, String> status = new HashMap<>();
    private static final Map<String, Long> failedAt = new HashMap<>();
    /** Why a song's analysis failed, for the overview's progress row (editor.md §11 rule 3). */
    private static final Map<String, String> failedWhy = new HashMap<>();
    private static final Deque<String> queue = new ArrayDeque<>();
    private static Thread worker;
    private static Context ctx;

    private Analyzer() {
    }

    static File analysisDir(Context c) {
        return new File(c.getFilesDir(), "automix/analysis");
    }

    static File pcmDir(Context c) {
        return new File(c.getCacheDir(), "automix/pcm");
    }

    /** Asks for a song's analysis (urgent: ahead of the others). */
    static synchronized void request(Context c, String id, boolean urgent) {
        if (id == null || id.isEmpty()) return;
        ctx = c.getApplicationContext();
        String s = status.get(id);
        if ("ready".equals(s) && pcmReady(id)) return;
        if ("tooLong".equals(s)) return;
        if ("failed".equals(s)) {
            Long at = failedAt.get(id);
            if (at != null && SystemClock.elapsedRealtime() - at < RETRY_FAILED_MS) return;
        }
        if ("analyzing".equals(s)) return;
        if (queue.contains(id)) {
            if (!urgent) return;
            queue.remove(id);
        }
        if (urgent) queue.addFirst(id);
        else queue.addLast(id);
        status.put(id, "pending");
        if (worker == null) {
            worker = new Thread(Analyzer::work, "Automix-analysis");
            worker.setPriority(Thread.MIN_PRIORITY + 1);
            worker.start();
        }
        Analyzer.class.notifyAll();
    }

    /** The analysis, if done (from memory, or the saved one). */
    static synchronized Analysis get(Context c, String id) {
        if (id == null) return null;
        Analysis a = results.get(id);
        if (a != null) return a;
        // no file, or an old one: not read again for a while (the overview asks 20 times a second)
        Long miss = missed.get(id);
        long now = SystemClock.elapsedRealtime();
        if (miss != null && now - miss < MISS_RETRY_MS) return null;
        a = load(c, id);
        if (a != null) {
            missed.remove(id);
            results.put(id, a);
            if (!status.containsKey(id)) status.put(id, "ready");
        } else {
            missed.put(id, now);
        }
        return a;
    }

    /** Songs whose saved analysis was missing or old when last read, and when. */
    private static final Map<String, Long> missed = new HashMap<>();
    private static final long MISS_RETRY_MS = 5000;

    static synchronized String statusOf(String id) {
        return status.get(id);
    }

    /** Where a song's analysis is: {stage, done 0..1} (the overview's progress), or null when it isn't running. */
    static synchronized Object[] progress(String id) {
        String s = status.get(id);
        if ("pending".equals(s)) return new Object[]{"waiting its turn", 0f};
        if (!"analyzing".equals(s)) return null;
        Object[] st = stages.get(id);
        return st != null ? st : new Object[]{"starting", 0f};
    }

    private static final Map<String, Object[]> stages = new HashMap<>();

    /** A song's analysis that won't come: {"failed", reason} or {"tooLong"}, else null. */
    static synchronized String[] outcome(String id) {
        String s = status.get(id);
        if ("tooLong".equals(s)) return new String[]{"tooLong"};
        if ("failed".equals(s)) {
            String why = failedWhy.get(id);
            return new String[]{"failed", why != null ? why : "no reason given"};
        }
        return null;
    }

    private static String reasonOf(Throwable t) {
        String m = t.getMessage();
        return m != null && !m.trim().isEmpty() ? m.trim() : t.getClass().getSimpleName();
    }

    /** An analysis given up between stages: its song is neither playing nor next, and another waits. */
    private static final class Superseded extends RuntimeException {
        Superseded() {
            super(null, null, false, false);
        }
    }

    private static void stage(String id, String name, float done) {
        synchronized (Analyzer.class) {
            stages.put(id, new Object[]{name, done});
            if (queue.isEmpty()) return;
        }
        if (!id.equals(Automix.currentId()) && !id.equals(Automix.nextIdNow())) throw new Superseded();
    }

    static synchronized boolean busy(String id) {
        String s = status.get(id);
        return "pending".equals(s) || "analyzing".equals(s);
    }

    private static Analysis load(Context c, String id) {
        File f = new File(analysisDir(c), id + ".json");
        if (!f.exists()) return null;
        try {
            byte[] b = new byte[(int) f.length()];
            try (DataInputStream in = new DataInputStream(new FileInputStream(f))) {
                in.readFully(b);
            }
            @SuppressWarnings("unchecked") Map<String, Object> m = (Map<String, Object>) Json.parse(new String(b, StandardCharsets.UTF_8));
            Analysis a = Analysis.fromJson(m);
            return Analysis.VERSION.equals(a.analysisVersion) ? a : null;
        } catch (Throwable t) {
            Log.w(TAG, "saved analysis of " + id + " unreadable", t);
            return null;
        }
    }

    private static void save(Context c, Analysis a) {
        File dir = analysisDir(c);
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        File f = new File(dir, a.fileKey + ".json"), tmp = new File(dir, a.fileKey + ".json.part");
        try (OutputStream out = new FileOutputStream(tmp)) {
            out.write(Json.write(a.toJson()).getBytes(StandardCharsets.UTF_8));
        } catch (IOException e) {
            Log.w(TAG, "analysis not saved", e);
            return;
        }
        //noinspection ResultOfMethodCallIgnored
        tmp.renameTo(f);
    }

    /** Saved analyses: count and bytes. */
    static long[] saved(Context c) {
        File[] files = analysisDir(c).listFiles();
        long n = 0, bytes = 0;
        if (files != null) for (File f : files) if (f.getName().endsWith(".json")) { n++; bytes += f.length(); }
        return new long[]{n, bytes};
    }

    /** The settings' "Clear": every saved analysis and decoded song. */
    static synchronized void clear(Context c) {
        for (File dir : new File[]{analysisDir(c), pcmDir(c)}) {
            File[] files = dir.listFiles();
            if (files != null) for (File f : files) //noinspection ResultOfMethodCallIgnored
                f.delete();
        }
        results.clear();
        // the queued and running analyses go on (their songs are playing or next): only their status stays
        for (java.util.Iterator<String> it = status.values().iterator(); it.hasNext(); ) {
            String s = it.next();
            if (!"pending".equals(s) && !"analyzing".equals(s)) it.remove();
        }
        failedAt.clear();
        failedWhy.clear();
        missed.clear();
        SungLyrics.clear(c);
    }

    private static void work() {
        while (true) {
            String id;
            synchronized (Analyzer.class) {
                while (queue.isEmpty()) {
                    try {
                        Analyzer.class.wait();
                    } catch (InterruptedException e) {
                        return;
                    }
                }
                id = queue.pollFirst();
                // switched off since it was asked for: dropped (asked again when it plays with Automix on)
                if (!Automix.enabled()) {
                    status.remove(id);
                    continue;
                }
                status.put(id, "analyzing");
                stages.remove(id);
            }
            long t0 = SystemClock.elapsedRealtime();
            try {
                Analysis a = get(ctx, id);
                if (a != null && pcmReady(id)) {
                    synchronized (Analyzer.class) {
                        status.put(id, "ready");
                    }
                    continue;
                }
                Analysis fresh = analyze(ctx, id, a);
                synchronized (Analyzer.class) {
                    if (fresh == null) {
                        status.put(id, "failed");
                        failedWhy.put(id, "no analysis came back");
                        failedAt.put(id, SystemClock.elapsedRealtime());
                    } else {
                        failedWhy.remove(id);
                        results.put(id, fresh);
                        status.put(id, "ready");
                    }
                }
                Log.i(TAG, "analysis of " + id + (fresh == null ? " failed" : " ready") + " in " + (SystemClock.elapsedRealtime() - t0) + " ms");
            } catch (Superseded s) {
                // asked for again when it plays or comes next
                synchronized (Analyzer.class) {
                    status.remove(id);
                }
                Log.i(TAG, "analysis of " + id + " dropped after " + (SystemClock.elapsedRealtime() - t0) + " ms: no longer playing or next");
            } catch (TooLong t) {
                Log.i(TAG, "analysis of " + id + " skipped: " + t.getMessage());
                synchronized (Analyzer.class) {
                    status.put(id, "tooLong");
                    failedWhy.remove(id);
                }
            } catch (Throwable t) {
                Log.e(TAG, "analysis of " + id + " failed", t);
                synchronized (Analyzer.class) {
                    status.put(id, "failed");
                    failedWhy.put(id, reasonOf(t));
                    failedAt.put(id, SystemClock.elapsedRealtime());
                }
            }
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Download and decode

    private static File download(Context c, String videoId) throws Exception {
        // shared with the addons' fit: one download per song
        return StreamDeck.youtubeCopy(c, videoId);
    }

    /** One decode of a song: its mono (for the analysis) and its stereo opening and end (for the decks). */
    static final class Decoded {
        int rate, monoRate;
        long frames;
        short[] mono;
        int monoLength;
        Pcm head, tail;

        double duration() {
            return frames / (double) rate;
        }
    }

    private static Decoded decode(File file, File headFile, File tailFile) throws Exception {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        MediaFormat format = null;
        try {
            extractor.setDataSource(file.getPath());
            int track = -1;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat f = extractor.getTrackFormat(i);
                if (f.getString(MediaFormat.KEY_MIME).startsWith("audio/")) {
                    track = i;
                    format = f;
                    break;
                }
            }
            if (track < 0) throw new IOException("no audio track");
            extractor.selectTrack(track);
            double knownDur = format.containsKey(MediaFormat.KEY_DURATION) ? format.getLong(MediaFormat.KEY_DURATION) / 1e6 : -1;
            if (knownDur > MAX_SONG_SEC) throw new TooLong(String.format(Locale.US, "%.0f s long, not analysed", knownDur));
            codec = MediaCodec.createDecoderByType(format.getString(MediaFormat.KEY_MIME));
            codec.configure(format, null, null, 0);
            codec.start();
        } catch (Throwable t) {
            // a song that can't be decoded (or is too long) gives its extractor and decoder back:
            // decoders are few, and a leaked one fails the next songs' analyses
            if (codec != null) codec.release();
            extractor.release();
            throw t;
        }
        int channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
        int rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE);
        boolean floatPcm = false;
        Decoded d = new Decoded();
        Fold fold = null;
        long frame = 0;
        long headFrames = 0;
        DataOutputStream headOut = null;
        short[] ring = null;
        int ringFrames = 0;
        boolean configured = false;
        MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
        boolean inputDone = false, whole = false;
        long lastOut = SystemClock.elapsedRealtime();
        try {
            while (true) {
                if (!inputDone) {
                    int in = codec.dequeueInputBuffer(10_000);
                    if (in >= 0) {
                        ByteBuffer buf = codec.getInputBuffer(in);
                        int n = extractor.readSampleData(buf, 0);
                        if (n < 0) {
                            codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            codec.queueInputBuffer(in, 0, n, extractor.getSampleTime(), 0);
                            extractor.advance();
                        }
                    }
                }
                int outIndex = codec.dequeueOutputBuffer(info, 10_000);
                if (outIndex == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat of = codec.getOutputFormat();
                    channels = of.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    int newRate = of.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    // the opening's header, the end's ring and the mono fold are all at the first rate
                    // (not an IOException: another download would decode the same way)
                    if (configured && newRate != rate) throw new IllegalStateException("the sample rate changed mid-song (" + rate + " to " + newRate + " Hz)");
                    rate = newRate;
                    floatPcm = of.containsKey(MediaFormat.KEY_PCM_ENCODING)
                            && of.getInteger(MediaFormat.KEY_PCM_ENCODING) == AudioFormat.ENCODING_PCM_FLOAT;
                } else if (outIndex < 0) {
                    // a decoder that never answers would hold the analysis thread for good
                    if (SystemClock.elapsedRealtime() - lastOut > 30_000) throw new IOException("the decoder stalled");
                } else {
                    lastOut = SystemClock.elapsedRealtime();
                    if (!configured) {
                        if (channels <= 0 || rate <= 0) throw new IllegalStateException("the decoder gave no channels or sample rate");
                        configured = true;
                        fold = new Fold(rate);
                        headFrames = Math.round(HEAD_SEC * rate);
                        ringFrames = (int) Math.round(TAIL_SEC * rate);
                        ring = new short[ringFrames * 2];
                        headOut = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(headFile), 1 << 16));
                        Pcm.writeHeader(headOut, rate, 0);
                    }
                    ByteBuffer buf = codec.getOutputBuffer(outIndex).order(ByteOrder.nativeOrder());
                    buf.position(info.offset).limit(info.offset + info.size);
                    int frames = info.size / (channels * (floatPcm ? 4 : 2));
                    for (int f = 0; f < frames; f++, frame++) {
                        float a = floatPcm ? buf.getFloat() : buf.getShort() / 32768f;
                        float b = channels > 1 ? (floatPcm ? buf.getFloat() : buf.getShort() / 32768f) : a;
                        for (int ch = 2; ch < channels; ch++) {
                            if (floatPcm) buf.getFloat();
                            else buf.getShort();
                        }
                        short sa = clip(a), sb = clip(b);
                        if (frame < headFrames) {
                            headOut.writeShort(Short.reverseBytes(sa));
                            headOut.writeShort(Short.reverseBytes(sb));
                        }
                        int r = (int) (frame % ringFrames) * 2;
                        ring[r] = sa;
                        ring[r + 1] = sb;
                        fold.push(a, b);
                    }
                    codec.releaseOutputBuffer(outIndex, false);
                    if (frame > MAX_SONG_SEC * rate) throw new TooLong("over " + MAX_SONG_SEC + " s, not analysed");
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                        whole = true;
                        break;
                    }
                }
            }
        } finally {
            try {
                codec.stop();
            } catch (Throwable ignored) {
            }
            codec.release();
            extractor.release();
            if (headOut != null) headOut.close();
            // a decode cut off leaves no short opening that an older end file would pass as ready
            if (!whole && headFile.exists() && !headFile.delete()) Log.w(TAG, "could not delete " + headFile.getName());
        }
        if (!configured || frame == 0) throw new IOException("nothing decoded");
        d.rate = rate;
        d.monoRate = fold.monoRate;
        d.frames = frame;
        d.mono = fold.mono;
        d.monoLength = fold.length;
        // the end: the ring's last TAIL_SEC (or the whole song when shorter), in order
        int n = (int) Math.min(frame, ringFrames);
        long first = frame - n;
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(tailFile), 1 << 16))) {
            Pcm.writeHeader(out, rate, first);
            for (long k = first; k < frame; k++) {
                int r = (int) (k % ringFrames) * 2;
                out.writeShort(Short.reverseBytes(ring[r]));
                out.writeShort(Short.reverseBytes(ring[r + 1]));
            }
        }
        return d;
    }

    /**
     * The decode's mono for the analysis: L and R averaged, then at 44.1 kHz and up every two frames
     * averaged into one (22.05 / 24 kHz), as 16-bit.
     */
    static final class Fold {
        final int step, monoRate;
        short[] mono = new short[1 << 20];
        int length;
        private float acc;
        private int accN;

        Fold(int rate) {
            step = rate >= 44100 ? 2 : 1;
            monoRate = rate / step;
        }

        void push(float a, float b) {
            acc += (a + b) * 0.5f;
            if (++accN == step) {
                if (length == mono.length) mono = Arrays.copyOf(mono, length * 2);
                mono[length++] = clip(acc / step);
                acc = 0;
                accN = 0;
            }
        }
    }

    static short clip(float x) {
        int v = Math.round(x * 32767f);
        return (short) Math.max(-32768, Math.min(32767, v));
    }

    // ---------------------------------------------------------------------------------------------
    // The decoded opening / end on disk

    /** A stretch of a song as 16-bit stereo on disk: header (magic, rate, first frame), then samples. */
    static final class Pcm {
        static final int MAGIC = 0x414d5850; // "AMXP"
        final File file;
        int rate;
        long firstFrame, frames;

        Pcm(File file) {
            this.file = file;
        }

        static void writeHeader(DataOutputStream out, int rate, long firstFrame) throws IOException {
            out.writeInt(MAGIC);
            out.writeInt(rate);
            out.writeLong(firstFrame);
        }

        static Pcm open(File f) {
            if (!f.exists() || f.length() < 16) return null;
            try (DataInputStream in = new DataInputStream(new FileInputStream(f))) {
                if (in.readInt() != MAGIC) return null;
                Pcm p = new Pcm(f);
                p.rate = in.readInt();
                p.firstFrame = in.readLong();
                p.frames = (f.length() - 16) / 4;
                return p;
            } catch (IOException e) {
                return null;
            }
        }

        double start() {
            return firstFrame / (double) rate;
        }

        double end() {
            return (firstFrame + frames) / (double) rate;
        }

        /** The opening's part, then the end's, when this reads both (joined); else null. */
        private Pcm first, then;

        /**
         * A song's opening and its end read as one, when the end starts inside or right at the
         * opening's end (a song up to HEAD_SEC + TAIL_SEC long); null otherwise. A placed window
         * may sit anywhere in a song (editor.md §6), not only where Automix puts it.
         */
        static Pcm joined(Pcm head, Pcm tail) {
            if (head == null || tail == null || head.rate != tail.rate || tail.firstFrame < head.firstFrame
                    || tail.firstFrame > head.firstFrame + head.frames) return null;
            Pcm j = new Pcm(head.file);
            j.rate = head.rate;
            j.firstFrame = head.firstFrame;
            j.frames = Math.max(head.firstFrame + head.frames, tail.firstFrame + tail.frames) - head.firstFrame;
            j.first = head;
            j.then = tail;
            return j;
        }

        /**
         * The part that covers song seconds [from, to): the two joined, else the first of [prefer, other]
         * that holds it, else prefer (whose start or end then says why the mix can't be built).
         */
        static Pcm covering(Pcm prefer, Pcm other, Pcm head, Pcm tail, double from, double to) {
            Pcm j = joined(head, tail);
            if (j != null) return j;
            for (Pcm p : new Pcm[]{prefer, other}) {
                if (p != null && p.start() <= from + 0.01 && p.end() >= to - 0.01) return p;
            }
            return prefer;
        }

        /** Song seconds [from, to) as planar float stereo at the PCM's rate (clipped to what is stored). */
        float[][] read(double from, double to) throws IOException {
            long a = Math.max(firstFrame, (long) Math.floor(from * rate));
            long b = Math.min(firstFrame + frames, (long) Math.ceil(to * rate));
            return frames(a, b);
        }

        /** Frames [a, b) (inside what is stored), split at the end's first frame when joined. */
        private float[][] frames(long a, long b) throws IOException {
            if (first != null) {
                long cut = then.firstFrame;
                float[][] x = first.frames(Math.min(a, cut), Math.min(b, cut));
                float[][] y = then.frames(Math.max(a, cut), Math.max(b, cut));
                int nx = x[0].length, ny = y[0].length;
                float[] l = java.util.Arrays.copyOf(x[0], nx + ny), r = java.util.Arrays.copyOf(x[1], nx + ny);
                System.arraycopy(y[0], 0, l, nx, ny);
                System.arraycopy(y[1], 0, r, nx, ny);
                return new float[][]{l, r};
            }
            a = Math.max(firstFrame, a);
            b = Math.min(firstFrame + frames, b);
            int n = (int) Math.max(0, b - a);
            float[] l = new float[n], r = new float[n];
            if (n == 0) return new float[][]{l, r};
            byte[] raw = new byte[n * 4];
            try (RandomAccessFile f = new RandomAccessFile(file, "r")) {
                f.seek(16 + (a - firstFrame) * 4);
                f.readFully(raw);
            }
            ByteBuffer bb = ByteBuffer.wrap(raw).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i < n; i++) {
                l[i] = bb.getShort() / 32768f;
                r[i] = bb.getShort() / 32768f;
            }
            return new float[][]{l, r};
        }

        double fromSec(long a) {
            return Math.max(firstFrame, a) / (double) rate;
        }
    }

    static File headFile(Context c, String id) {
        return new File(pcmDir(c), id + ".head");
    }

    static File tailFile(Context c, String id) {
        return new File(pcmDir(c), id + ".tail");
    }

    static boolean pcmReady(String id) {
        Context c = ctx;
        return c != null && Pcm.open(headFile(c, id)) != null && Pcm.open(tailFile(c, id)) != null;
    }

    static Pcm head(Context c, String id) {
        return Pcm.open(headFile(c, id));
    }

    static Pcm tail(Context c, String id) {
        return Pcm.open(tailFile(c, id));
    }

    /** Keeps the decoded songs of the last few analyses (and those [keep]). */
    private static void trimPcm(Context c, String keep) {
        File[] files = pcmDir(c).listFiles();
        if (files == null) return;
        Map<String, Long> newest = new HashMap<>();
        for (File f : files) {
            String n = f.getName();
            // a decode cut off (the app killed) left its parts: no analysis runs now, so they are stale
            if (n.endsWith(".head.part") || n.endsWith(".tail.part")) {
                //noinspection ResultOfMethodCallIgnored
                f.delete();
                continue;
            }
            if (n.endsWith(".part")) continue; // an addon's opening or end being written
            int dot = n.lastIndexOf('.');
            if (dot <= 0) continue;
            String id = n.substring(0, dot);
            newest.put(id, Math.max(newest.getOrDefault(id, 0L), f.lastModified()));
        }
        java.util.List<Map.Entry<String, Long>> l = new java.util.ArrayList<>(newest.entrySet());
        l.sort((x, y) -> Long.compare(y.getValue(), x.getValue()));
        for (int i = KEEP_PCM; i < l.size(); i++) {
            String id = l.get(i).getKey();
            if (id.equals(keep)) continue;
            //noinspection ResultOfMethodCallIgnored
            headFile(c, id).delete();
            //noinspection ResultOfMethodCallIgnored
            tailFile(c, id).delete();
        }
    }

    // ---------------------------------------------------------------------------------------------
    // The analysis (BitChord analyzer.ts analyzeOne + analysis.worker.ts, the extension's host.js)

    /** [known]: a saved analysis whose decoded audio is gone: only the decode is redone. */
    private static Analysis analyze(Context c, String id, Analysis known) throws Exception {
        Models.loadNative();
        long t0 = SystemClock.elapsedRealtime();
        // the player's length when it has this song: a long one isn't even downloaded
        if (id.equals(Automix.currentId())) {
            long ms = Automix.durationMs();
            if (ms > MAX_SONG_SEC * 1000) throw new TooLong(String.format(Locale.US, "%.0f s long, not analysed", ms / 1000.0));
        }
        stage(id, "downloading", 0f);
        File file = download(c, id);
        long tDl = SystemClock.elapsedRealtime() - t0;
        //noinspection ResultOfMethodCallIgnored
        pcmDir(c).mkdirs();
        File headTmp = new File(pcmDir(c), id + ".head.part"), tailTmp = new File(pcmDir(c), id + ".tail.part");
        Decoded d;
        boolean decoded = false;
        try {
            // (inside the try: a dropped analysis leaves no download behind)
            stage(id, "decoding", 0.02f);
            d = decode(file, headTmp, tailTmp);
            decoded = true;
        } catch (TooLong e) {
            throw e; // the length won't change with another download
        } catch (IOException e) {
            // "Failed to instantiate extractor" now and then: once more from a fresh download
            Log.w(TAG, "decode of " + id + " failed (" + e.getMessage() + "), downloading again");
            //noinspection ResultOfMethodCallIgnored
            file.delete();
            file = download(c, id);
            d = decode(file, headTmp, tailTmp);
            decoded = true;
        } finally {
            // kept for the stream deck ("Smooth hand-over") and the addons' fit, else deleted; a failed
            // decode leaves a kept copy to the fit (it reads it on its own, and fails on its own)
            if (decoded || StreamDeck.keeps()) StreamDeck.keep(c, id, file);
            else //noinspection ResultOfMethodCallIgnored
                file.delete();
        }
        // a part not put in place would leave no opening or end (or an older song's) for the decks
        if (!headTmp.renameTo(headFile(c, id)) || !tailTmp.renameTo(tailFile(c, id)))
            throw new IOException("the decoded audio could not be kept");
        trimPcm(c, id);
        long tDec = SystemClock.elapsedRealtime() - t0 - tDl;
        if (known != null) {
            d.mono = null;
            Log.i(TAG, String.format(Locale.US, "%s: decoded audio restored (download %d ms, decode %d ms)", id, tDl, tDec));
            return known;
        }

        Analysis a = analyzeDecoded(c, id, d, head(c, id), tail(c, id), tDl, tDec);
        save(c, a);
        return a;
    }

    /**
     * The analysis of a decoded song (everything after the download and decode): the beats, the key,
     * energy and structure, the evidence, the vocal windows from its stereo opening and end.
     */
    static Analysis analyzeDecoded(Context c, String id, Decoded d, Pcm headPcm, Pcm tailPcm, long tDl, long tDec) throws Exception {
        double dur = d.duration();
        Analysis a = new Analysis();
        a.fileKey = id;
        a.durationSec = dur;
        BeatGrid.Samples mono = BeatGrid.of(d.mono, d.monoLength);
        a.contentEndSec = BeatGrid.contentEnd(mono, d.monoRate);

        // Beat This! over the opening and the end (59 s each)
        long tb = SystemClock.elapsedRealtime();
        stage(id, "finding the beats", 0.22f);
        a.headBeats = Models.beats(c, monoSpan(d, 0, BEAT_WINDOW_SEC), d.monoRate, 0);
        stage(id, "finding the beats", 0.52f);
        if (dur > BEAT_WINDOW_SEC) {
            double from = dur - BEAT_WINDOW_SEC;
            a.tailBeats = Models.beats(c, monoSpan(d, from, dur), d.monoRate, from);
        } else {
            a.tailBeats = a.headBeats;
        }
        tb = SystemClock.elapsedRealtime() - tb;

        // BitChord's native analyser: the key (and the grid when Beat This! finds none)
        long tn = SystemClock.elapsedRealtime();
        double ar = TrackFeatures.nativeSampleRate();
        stage(id, "finding the key", 0.82f);
        JSONObject nat = new JSONObject(TrackFeatures.nativeAnalyze(resampleMono(d, ar), ar, dur));
        tn = SystemClock.elapsedRealtime() - tn;
        // the key the PC's way (analysis-cases.md "The key": Essentia's KeyExtractor on the whole song
        // at 44.1 kHz); the native one only if that fails, with no confidence so the clash rule ignores it
        String nativeKey = nat.optString("key", null);
        EssentiaKey.Key found = null;
        try {
            float[] m44 = resampleMono(d, EssentiaKey.SR);
            found = EssentiaKey.of(m44, m44.length);
        } catch (Throwable t) {
            Log.w(TAG, id + ": key failed", t);
        }
        if (found != null && BeatGrid.camelot(found.name, a)) {
            a.keyName = found.name;
            a.keyConfidence = Math.max(0, found.strength);
        } else if (BeatGrid.camelot(nativeKey, a)) {
            a.keyName = nativeKey;
            a.keyConfidence = 0;
        }
        Log.i(TAG, String.format(Locale.US, "%s: key %s (strength %.2f); native analyser said %s (gap %.3f)", id,
                a.keyName, a.keyConfidence, nativeKey, nat.optDouble("keyConfidence", 0)));
        Analysis.LocalGrid nativeGrid = null;
        double nb = nat.optDouble("bpm", 0), ni = nat.optDouble("beatInterval", 0), nf = nat.optDouble("firstBeat", Double.NaN);
        if (nb > 0 && ni > 0 && !Double.isNaN(nf)) {
            nativeGrid = new Analysis.LocalGrid();
            nativeGrid.beatIntervalSec = BeatGrid.normalizeInterval(ni);
            nativeGrid.bpm = 60 / nativeGrid.beatIntervalSec;
            nativeGrid.firstDownbeatSec = nf;
            nativeGrid.gridConfidence = Math.max(0, Math.min(1, (nat.optDouble("beatConfidence", 0) - 0.35) / 0.6));
        }
        Analysis.LocalGrid head = a.headBeats != null ? BeatGrid.localGrid(a.headBeats) : nativeGrid;
        if (head != null) {
            a.bpm = head.bpm;
            a.beatIntervalSec = head.beatIntervalSec;
            a.firstDownbeatSec = head.firstDownbeatSec;
            a.gridConfidence = head.gridConfidence;
        }
        a.tailGrid = a.tailBeats != null ? BeatGrid.localGrid(a.tailBeats) : nativeGrid;

        // energy and structure (energy.ts)
        double beat = a.beatIntervalSec > 0 ? a.beatIntervalSec : a.tailGrid != null ? a.tailGrid.beatIntervalSec : 0;
        double windowSec = beat > 0 ? beat * 16 : 4;
        a.energyCurve = BeatGrid.energyCurve(mono, d.monoRate, windowSec);
        double[] io = BeatGrid.introOutro(a.energyCurve, windowSec, dur);
        a.introEndSec = io[0];
        a.outroStartSec = io[1];
        double sum = 0;
        for (double e : a.energyCurve) sum += e;
        a.energy = sum / Math.max(1, a.energyCurve.length);
        // Automix v2's evidence (host.js lowEnd): sub-bass, bass curve, pitch profiles, loudness
        stage(id, "measuring the low end and keys", 0.84f);
        long te = SystemClock.elapsedRealtime();
        Evidence.measure(monoSpan(d, 0, dur), d.monoRate, a);
        Log.i(TAG, String.format(Locale.US, "%s: sub-bass %.2f, chroma %s, %d loudness steps in %d ms", id, a.subBassRatio,
                a.chroma != null ? "yes" : "no", a.loudnessCurve != null ? a.loudnessCurve.values.length : 0, SystemClock.elapsedRealtime() - te));
        d.mono = null;

        // the vocal mask over the opening (two windows) and the end (up to three)
        stage(id, "finding the vocals", 0.85f);
        long tv = SystemClock.elapsedRealtime();
        double W = VOCAL_WINDOW_SEC;
        // gone when the settings' Clear ran meanwhile: failed, and asked again (not saved without its vocals)
        if (headPcm == null || tailPcm == null) throw new IOException("the decoded audio is gone");
        java.util.List<Double> starts = new java.util.ArrayList<>();
        for (double s : new double[]{0, W}) if (s + W <= dur) starts.add(s);
        for (int k = 1; k <= 3; k++) if (dur - k * W >= 2 * W) starts.add(dur - k * W);
        for (double s : starts) {
            Pcm p = s + W <= headPcm.end() ? headPcm : tailPcm;
            if (s < p.start() - 1e-6 || s + W > p.end() + 1e-6) continue;
            float[][] lr = p.read(s, s + W);
            int n = (int) Math.floor(W * p.rate);
            if (lr[0].length > n) lr = new float[][]{Arrays.copyOf(lr[0], n), Arrays.copyOf(lr[1], n)};
            Analysis.VocalWindow w = Models.vocals(c, lr[0], lr[1], p.rate, s);
            if (w != null) a.vocals.add(w);
        }
        tv = SystemClock.elapsedRealtime() - tv;
        Analysis.barPhase(a);
        Log.i(TAG, String.format(Locale.US, "%s: %.1f s, %d Hz | grid %.2f BPM (conf %.2f) from %.2f s, end grid %s | key %s (%.2f) | "
                        + "intro ends %.1f, music ends %.2f | %d vocal windows | download %d ms, decode %d ms, beats %d ms, native %d ms, vocals %d ms",
                id, dur, d.rate, a.bpm, a.gridConfidence, a.firstDownbeatSec,
                a.tailGrid == null ? "none" : String.format(Locale.US, "%.2f BPM (conf %.2f)", a.tailGrid.bpm, a.tailGrid.gridConfidence),
                a.keyName, a.keyConfidence, a.introEndSec, a.contentEndSec, a.vocals.size(), tDl, tDec, tb, tn, tv));
        return a;
    }

    private static float[] monoSpan(Decoded d, double from, double to) {
        int a = (int) Math.max(0, Math.round(from * d.monoRate));
        int b = (int) Math.min(d.monoLength, Math.round(to * d.monoRate));
        float[] out = new float[Math.max(0, b - a)];
        for (int i = 0; i < out.length; i++) out[i] = d.mono[a + i] / 32768f;
        return out;
    }

    /** The whole mono at [rate], resampled 30 s at a time with a second of context either side. */
    private static float[] resampleMono(Decoded d, double rate) {
        double chunk = 30, ctxSec = 1, dur = d.monoLength / (double) d.monoRate;
        int total = (int) Math.floor(dur * rate);
        float[] out = new float[total];
        for (double s = 0; s < dur; s += chunk) {
            double a = Math.max(0, s - ctxSec), b = Math.min(dur, s + chunk + ctxSec);
            float[] r = MelSpectrogram.nativeResample(monoSpan(d, a, b), d.monoRate, rate);
            int skip = (int) Math.round((s - a) * rate);
            int dst = (int) Math.round(s * rate);
            int n = Math.min(total - dst, (int) Math.round(Math.min(chunk, dur - s) * rate));
            n = Math.min(n, r.length - skip);
            if (n > 0) System.arraycopy(r, skip, out, dst, n);
        }
        return out;
    }
}
