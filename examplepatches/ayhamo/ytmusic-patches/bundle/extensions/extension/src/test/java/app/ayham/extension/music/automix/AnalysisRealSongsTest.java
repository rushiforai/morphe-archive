package app.ayham.extension.music.automix;

import static org.junit.Assert.assertTrue;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import org.junit.Assume;
import org.junit.Test;

/**
 * Layer 1 and 2 of spec/automix/analysis-cases.md on real songs (local only): the phone's analyser on the
 * extension's decoded songs, its results written for the extension's {@code --compare pc phone}.
 *
 * <p>Each AUTOMIX_SONGS/&lt;videoId&gt;.wav (44100 Hz stereo float32, decoded by the extension) goes the
 * way a decoded song goes on the phone: Analyzer.Fold makes the 16-bit mono (L and R averaged, frame
 * pairs averaged to 22050 Hz), the opening (150 s) and the end (120 s) are kept as 16-bit stereo, and
 * Analyzer.analyzeDecoded runs on them. Written to AUTOMIX_SONGS/phone/&lt;videoId&gt;.json as
 * {side: "phone", videoId, ...the analysis}. Needs the natives as AnalysisCasesRealTest does.
 */
public class AnalysisRealSongsTest {
    /** A WAV's samples, interleaved, as floats (32-bit float or 16-bit PCM). */
    static final class Wav {
        int rate, channels;
        float[] x;
    }

    static Wav read(File f) throws IOException {
        byte[] all = Files.readAllBytes(f.toPath());
        ByteBuffer b = ByteBuffer.wrap(all).order(ByteOrder.LITTLE_ENDIAN);
        if (b.getInt(0) != 0x46464952 || b.getInt(8) != 0x45564157) throw new IOException(f + ": not a WAV");
        Wav w = new Wav();
        int fmt = 0, bits = 0, pos = 12;
        while (pos + 8 <= all.length) {
            int id = b.getInt(pos), size = b.getInt(pos + 4), body = pos + 8;
            if (id == 0x20746d66) { // "fmt "
                fmt = b.getShort(body) & 0xffff;
                w.channels = b.getShort(body + 2);
                w.rate = b.getInt(body + 4);
                bits = b.getShort(body + 14);
                if (fmt == 0xfffe) fmt = b.getShort(body + 24) & 0xffff; // extensible: the sub-format
            } else if (id == 0x61746164) { // "data"
                int n = Math.min(size, all.length - body) / (bits / 8);
                w.x = new float[n];
                for (int i = 0; i < n; i++)
                    w.x[i] = fmt == 3 ? b.getFloat(body + 4 * i) : b.getShort(body + 2 * i) / 32768f;
                return w;
            }
            pos = body + size + (size & 1);
        }
        throw new IOException(f + ": no data");
    }

    /** Frames [from, to) as 16-bit stereo in Analyzer's Pcm file. */
    private static Analyzer.Pcm pcm(Wav w, long from, long to, File f) throws IOException {
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(f), 1 << 16))) {
            Analyzer.Pcm.writeHeader(out, w.rate, from);
            for (long k = from; k < to; k++) {
                float a = w.x[(int) (k * w.channels)], b = w.channels > 1 ? w.x[(int) (k * w.channels + 1)] : a;
                out.writeShort(Short.reverseBytes(Analyzer.clip(a)));
                out.writeShort(Short.reverseBytes(Analyzer.clip(b)));
            }
        }
        return Analyzer.Pcm.open(f);
    }

    @Test
    public void realSongsOnThePhonesAnalyser() throws Exception {
        String dir = System.getenv("AUTOMIX_SONGS");
        Assume.assumeTrue("AUTOMIX_SONGS not set: the real songs are analysed only on request", dir != null);
        AnalysisCasesRealTest.setUp();
        File songs = new File(dir), out = new File(songs, "phone");
        File[] wavs = songs.listFiles((d, n) -> n.endsWith(".wav"));
        assertTrue("no .wav in " + songs, wavs != null && wavs.length > 0);
        assertTrue("can't make " + out, out.isDirectory() || out.mkdirs());
        java.util.Arrays.sort(wavs);
        for (File f : wavs) {
            String id = f.getName().substring(0, f.getName().length() - 4);
            long t0 = System.nanoTime();
            Analysis a = analyse(id, read(f));
            Map<String, Object> j = new LinkedHashMap<>();
            j.put("side", "phone");
            j.put("videoId", id);
            j.putAll(a.toJson());
            Files.write(new File(out, id + ".json").toPath(), Json.write(j).getBytes(StandardCharsets.UTF_8));
            System.out.println(String.format(Locale.US, "%s: %.1f s, grid %.2f BPM (conf %.2f) from %.3f s, end grid %s, key %s (%.2f), %d vocal windows, %d ms",
                    id, a.durationSec, a.bpm, a.gridConfidence, a.firstDownbeatSec,
                    a.tailGrid == null ? "none" : String.format(Locale.US, "%.2f BPM", a.tailGrid.bpm),
                    a.keyName, a.keyConfidence, a.vocals.size(), (System.nanoTime() - t0) / 1000000));
        }
    }

    /**
     * A decoded song the way the phone's decode leaves it: Analyzer.Fold makes the 16-bit mono over
     * every frame, the opening (HEAD_SEC) and the end (TAIL_SEC) are kept as 16-bit stereo, and
     * Analyzer.analyzeDecoded runs on them. w's samples are dropped on the way.
     */
    static Analysis analyse(String id, Wav w) throws Exception {
        long frames = w.x.length / w.channels;
        Analyzer.Fold fold = new Analyzer.Fold(w.rate);
        for (long k = 0; k < frames; k++) {
            float a = w.x[(int) (k * w.channels)], b = w.channels > 1 ? w.x[(int) (k * w.channels + 1)] : a;
            fold.push(a, b);
        }
        Analyzer.Decoded d = new Analyzer.Decoded();
        d.rate = w.rate;
        d.monoRate = fold.monoRate;
        d.frames = frames;
        d.mono = fold.mono;
        d.monoLength = fold.length;
        File head = File.createTempFile(id, ".head"), tail = File.createTempFile(id, ".tail");
        try {
            Analyzer.Pcm hp = pcm(w, 0, Math.min(frames, Math.round(Analyzer.HEAD_SEC * w.rate)), head);
            Analyzer.Pcm tp = pcm(w, Math.max(0, frames - Math.round(Analyzer.TAIL_SEC * w.rate)), frames, tail);
            w.x = null;
            return Analyzer.analyzeDecoded(null, id, d, hp, tp, 0, 0);
        } finally {
            //noinspection ResultOfMethodCallIgnored
            head.delete();
            //noinspection ResultOfMethodCallIgnored
            tail.delete();
        }
    }
}
