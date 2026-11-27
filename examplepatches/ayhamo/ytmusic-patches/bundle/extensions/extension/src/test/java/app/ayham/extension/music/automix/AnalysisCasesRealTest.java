package app.ayham.extension.music.automix;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.junit.Assume;
import org.junit.Test;

import ai.onnxruntime.OrtEnvironment;
import ai.onnxruntime.OrtSession;

/**
 * The synthetic analysis cases on the phone's real analyser, run on the PC (local only, skipped
 * without the natives): Analyzer.analyze's steps from the decode on, with its own code where it can be
 * called (Models.beats and Models.vocals, BeatGrid, EssentiaKey, Analyzer's resampleMono /
 * Pcm), on BitChord's native analyser built for linux x86_64 from its source and ONNX Runtime's desktop
 * natives under the onnxruntime-android Java API. The models are the ones the "Automix libraries" patch
 * ships (bundle/patches/src/main/resources/automix).
 *
 * What differs from the phone: the native code is compiled for x86_64 by g++ (the phone's is arm64 by
 * the NDK's clang), and ONNX Runtime runs its x86 kernels. Download and MediaCodec are not run: the
 * song comes as the 44100 Hz render (stereo L = R, the opening kept as 16-bit stereo for the vocal
 * model), and the beat model gets its half() as floats, as analysis-cases.md §4 has both sides do; the
 * key and the native analyser get that half() as Analyzer.decode's 16-bit mono.
 *
 * Run it: scripts/analysis-natives.ps1 builds the natives into work/scratch/analysis-natives, then
 * the unit tests with that folder mounted and AUTOMIX_NATIVES pointing at it, e.g. add
 * {@code -v "$work\scratch\analysis-natives:/natives" -e AUTOMIX_NATIVES=/natives} to the docker command
 * and {@code --tests '*AnalysisCasesRealTest'} to gradle. AUTOMIX_MODELS overrides the models folder.
 */
public class AnalysisCasesRealTest {
    private static final int RATE = 44100;

    private static File natives() {
        String p = System.getenv("AUTOMIX_NATIVES");
        if (p == null) p = System.getProperty("automix.natives");
        return p == null ? null : new File(p);
    }

    private static File models() {
        String p = System.getenv("AUTOMIX_MODELS");
        if (p != null) return new File(p);
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File m = new File(d, "bundle/patches/src/main/resources/automix");
            if (m.isDirectory()) return m;
            m = new File(d, "patches/src/main/resources/automix");
            if (m.isDirectory()) return m;
        }
        return null;
    }

    private static boolean ready;

    static synchronized void setUp() throws Exception {
        if (ready) return;
        File dir = natives(), models = models();
        Assume.assumeTrue("AUTOMIX_NATIVES not set: the real analyser runs only where its natives are built", dir != null);
        Assume.assumeTrue("no " + new File(dir, "libbitchord_analysis.so"), new File(dir, "libbitchord_analysis.so").isFile());
        assertNotNull("models folder not found (AUTOMIX_MODELS)", models);
        // ONNX Runtime's Java API (onnxruntime-android's classes) loads its natives from here off Android
        System.setProperty("onnxruntime.native.path", dir.getAbsolutePath());
        System.load(new File(dir, "libbitchord_analysis.so").getAbsolutePath());
        set(Models.class, "nativeLoaded", true);
        OrtEnvironment env = OrtEnvironment.getEnvironment();
        set(Models.class, "beat", env.createSession(new File(models, Models.BEAT).getPath(), new OrtSession.SessionOptions()));
        set(Models.class, "vocals", env.createSession(new File(models, Models.VOCALS).getPath(), new OrtSession.SessionOptions()));
        ready = true;
    }

    private static void set(Class<?> c, String name, Object v) throws Exception {
        Field f = c.getDeclaredField(name);
        f.setAccessible(true);
        f.set(null, v);
    }

    private static Object call(String name, Class<?>[] types, Object... args) throws Exception {
        Method m = Analyzer.class.getDeclaredMethod(name, types);
        m.setAccessible(true);
        return m.invoke(null, args);
    }

    private static short clip(float x) {
        int v = Math.round(x * 32767f);
        return (short) Math.max(-32768, Math.min(32767, v));
    }

    /** Analyzer.decode's output for a stereo file whose channels are both [x] (44100 Hz), its mono [b]. */
    private static Analyzer.Decoded decode(float[] x, float[] b, File headFile) throws Exception {
        Analyzer.Decoded d = new Analyzer.Decoded();
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(headFile), 1 << 16))) {
            Analyzer.Pcm.writeHeader(out, RATE, 0);
            for (float a : x) {
                short s = clip(a);
                out.writeShort(Short.reverseBytes(s));
                out.writeShort(Short.reverseBytes(s));
            }
        }
        short[] mono = new short[b.length];
        for (int i = 0; i < b.length; i++) mono[i] = clip(b[i]);
        d.rate = RATE;
        d.monoRate = RATE / 2;
        d.frames = x.length;
        d.mono = mono;
        d.monoLength = mono.length;
        return d;
    }

    /** [from, to) s of the half() render, as floats. */
    private static float[] span(float[] b, double from, double to) {
        int a = (int) Math.max(0, Math.round(from * RATE / 2)), e = (int) Math.min(b.length, Math.round(to * RATE / 2));
        return java.util.Arrays.copyOfRange(b, a, Math.max(a, e));
    }

    /** Analyzer.analyze from the decode on: beats, the head grid, the key, the vocal windows. */
    private static Analysis analyse(AnalysisCases.Case c, StringBuilder info) throws Exception {
        float[] x = AnalysisSignals.render(c.song, RATE), b = AnalysisSignals.half(x);
        File head = File.createTempFile("analysis-case", ".head");
        try {
            Analyzer.Decoded d = decode(x, b, head);
            double dur = d.duration();
            Analysis a = new Analysis();
            a.fileKey = c.name;
            a.durationSec = dur;
            a.headBeats = Models.beats(null, span(b, 0, Analyzer.BEAT_WINDOW_SEC), d.monoRate, 0);
            if (dur > Analyzer.BEAT_WINDOW_SEC) {
                double from = dur - Analyzer.BEAT_WINDOW_SEC;
                a.tailBeats = Models.beats(null, span(b, from, dur), d.monoRate, from);
            } else {
                a.tailBeats = a.headBeats;
            }
            // the native analyser runs on the phone for the key (and the grid when Beat This! finds none)
            double ar = com.music.bitchord.playback.smart.TrackFeatures.nativeSampleRate();
            float[] whole = (float[]) call("resampleMono", new Class<?>[]{Analyzer.Decoded.class, double.class}, d, ar);
            String natText = com.music.bitchord.playback.smart.TrackFeatures.nativeAnalyze(whole, ar, dur);
            // the key as Analyzer finds it: Essentia's KeyExtractor on the whole song at 44.1 kHz
            float[] m44 = (float[]) call("resampleMono", new Class<?>[]{Analyzer.Decoded.class, double.class}, d, (double) EssentiaKey.SR);
            EssentiaKey.Key key = EssentiaKey.of(m44, m44.length);
            if (a.headBeats != null) {
                Analysis.LocalGrid g = BeatGrid.localGrid(a.headBeats);
                a.bpm = g.bpm;
                a.beatIntervalSec = g.beatIntervalSec;
                a.firstDownbeatSec = g.firstDownbeatSec;
                a.gridConfidence = g.gridConfidence;
            } else {
                info.append("\n       no beats from Beat This! (the phone would take the native grid: ").append(natText).append(")");
            }
            info.append(String.format(Locale.US, "\n       key %s (strength %.2f); native: %s", key == null ? "none" : key.name,
                    key == null ? 0 : key.strength, natText.length() > 160 ? natText.substring(0, 160) + "..." : natText));
            // the vocal mask, windows placed as Analyzer.analyze places them
            double W = Analyzer.VOCAL_WINDOW_SEC;
            List<Double> starts = new ArrayList<>();
            for (double s : new double[]{0, W}) if (s + W <= dur) starts.add(s);
            for (int k = 1; k <= 3; k++) if (dur - k * W >= 2 * W) starts.add(dur - k * W);
            Analyzer.Pcm p = Analyzer.Pcm.open(head);
            for (double s : starts) {
                float[][] lr = p.read(s, s + W);
                int n = (int) Math.floor(W * p.rate);
                if (lr[0].length > n) lr = new float[][]{java.util.Arrays.copyOf(lr[0], n), java.util.Arrays.copyOf(lr[1], n)};
                Analysis.VocalWindow w = Models.vocals(null, lr[0], lr[1], p.rate, s);
                assertNotNull(c.name + ": the vocal model gave nothing for the window at " + s + " s", w);
                a.vocals.add(w);
            }
            return a;
        } finally {
            //noinspection ResultOfMethodCallIgnored
            head.delete();
        }
    }

    @Test
    public void syntheticCasesOnThePhonesAnalyser() throws Exception {
        setUp();
        AnalysisCases.Rules rules = AnalysisCases.rules();
        List<String> failed = new ArrayList<>();
        for (AnalysisCases.Case c : AnalysisCases.cases()) {
            if (!c.rendered()) continue;
            StringBuilder info = new StringBuilder();
            long t0 = System.nanoTime();
            Analysis a = analyse(c, info);
            AnalysisCases.Result r = AnalysisCases.check(c, a, rules);
            System.out.println(r + String.format(Locale.US, "\n       grid %.2f BPM from %.3f s (conf %.2f), %d beats, %d vocal windows, %d ms",
                    a.bpm, a.firstDownbeatSec, a.gridConfidence, AnalysisCases.beatsOf(a).length, a.vocals.size(), (System.nanoTime() - t0) / 1000000) + info);
            if (r.failed()) failed.add(c.name);
        }
        System.out.println(failed.isEmpty() ? "all synthetic cases pass on the phone's analyser" : failed.size() + " case(s) failed: " + failed);
        assertTrue("cases failed on the phone's analyser (printed above): " + failed, failed.isEmpty());
    }
}
