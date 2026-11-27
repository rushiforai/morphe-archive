package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

/**
 * The Java port of the extension's scripts/analysis_signals.mjs renders the same samples. The sums are
 * the JS renderer's (node 26, 2026-11-19): SHA-256 of each song's Float32Array (little-endian bytes):
 * the 44100 Hz render, and @22050 its half() (analysis-cases.md §4). A change to analysis_signals.mjs or to a song of analysis-cases.json
 * shows up here; take the new sums from the JS side, never from this port.
 */
public class AnalysisSignalsTest {
    private static final Map<String, String> JS = new HashMap<>();

    static {
        JS.put("click-120@44100", "1310158703e515fd0895a22c487a7fd2617803f1389e1c385c2ad92ca727a2c9");
        JS.put("click-120@22050", "d025104458c2e13beb1aab313bb02de176410fba89c48833c9ac119a8121e5b4");
        JS.put("drums-128-late-start@44100", "d3751cde758e4e6c5cd407cbc33a19553d8a7367e179ec8237e6a557345d93bf");
        JS.put("drums-128-late-start@22050", "59420e85d11e7b649a0446cbac0ac764b35d85cb03a42c0d3687e5c9a9536536");
        JS.put("drums-174@44100", "02a631d12f86edfd9736df5317e9b376fe2448a7041ec280f8162b67dc7cbb35");
        JS.put("drums-174@22050", "99af6dc6b0c41d16737d4f5b074df227b400956139d372305827fa177d4a450e");
        JS.put("drums-80@44100", "c663520cd058d39963583d3a09266327e3067a352654f017c1509f30d3facba1");
        JS.put("drums-80@22050", "235be5e79f2a9e6c50c0bdb7fed2259f96a1ce6e74983dd4752c70a65de9c692");
        JS.put("drums-85@44100", "81b9c91ca1351009aa40f002602ee435c219396180506df0e25cabe59c78e24f");
        JS.put("drums-85@22050", "2dd7b7b4416a939a8bce59758f8a94e32f77671ba62dbe299d71ea431955f497");
        JS.put("drums-90@44100", "7ac19eccfd2f026264c36a9a27b49ce9320a9c60a4c7ac0cd054ecfb6df2ed24");
        JS.put("drums-90@22050", "6b93b6d721ea6b835d7ae8ab239d6bf85ad3a2afddc7fb620db3ab686dd1846f");
        JS.put("tempo-change-120-126@44100", "200a249576acc9db92c0942a5e81403b7f7c871126eeb2e643a572c5352d20ad");
        JS.put("tempo-change-120-126@22050", "e0d7c77cfffd0a16e7e518dd620e300e9fbc560fffc6ca5c9c41e2ffbb6d1d44");
        JS.put("tempo-change-100-110@44100", "184ff981542b00ce02ef88ac7aacffe7c01d7ead748ccd3dd717535af012e2ec");
        JS.put("tempo-change-100-110@22050", "64a3bbef46ba2b043b71da430e63e41d3115454fc0d523d5df4372d41f35d083");
        JS.put("voice-section@44100", "6d0d07d83ee69aeccd9a396571a941e1996107cf569959f7039e949c622b1f09");
        JS.put("voice-section@22050", "e9f216001639767a87023b911a1f01e8017a223cd19436c6137a4ba40025579d");
        JS.put("no-voice@44100", "d3751cde758e4e6c5cd407cbc33a19553d8a7367e179ec8237e6a557345d93bf");
        JS.put("no-voice@22050", "59420e85d11e7b649a0446cbac0ac764b35d85cb03a42c0d3687e5c9a9536536");
        JS.put("voice-over-chord@44100", "1345a064f34c88a917f9fae38f184a0b6b38ef1088ee8f06d3b578da8a7e1f98");
        JS.put("voice-over-chord@22050", "a9716c3125605205b32db2344caa382cb50a6f0046a28a20a008795e59509435");
    }

    static String sha256(float[] x) throws Exception {
        ByteBuffer b = ByteBuffer.allocate(x.length * 4).order(ByteOrder.LITTLE_ENDIAN);
        for (float v : x) b.putFloat(v);
        StringBuilder sb = new StringBuilder();
        for (byte y : MessageDigest.getInstance("SHA-256").digest(b.array())) sb.append(String.format("%02x", y));
        return sb.toString();
    }

    @Test
    public void mulberry32MatchesTheJsGenerator() {
        AnalysisSignals.Mulberry32 r = new AnalysisSignals.Mulberry32(1);
        assertEquals(0.6270739405881613, r.next(), 0);
        assertEquals(0.002735721180215478, r.next(), 0);
        assertEquals(0.5274470399599522, r.next(), 0);
    }

    @Test
    public void everySongRendersTheJsRenderersSamples() throws Exception {
        List<String> diffs = new ArrayList<>();
        int checked = 0;
        for (AnalysisCases.Case c : AnalysisCases.cases()) {
            if (!c.rendered()) continue;
            float[] a = AnalysisSignals.render(c.song, 44100);
            assertEquals(c.name + " length", Math.round(c.song.sec * 44100), a.length);
            for (int sr : new int[]{44100, 22050}) {
                String key = c.name + "@" + sr, want = JS.get(key);
                assertTrue("no JS checksum for " + key + ": a new case? take its sum from analysis_signals.mjs", want != null);
                float[] x = sr == 44100 ? a : AnalysisSignals.half(a);
                if (sr == 22050) assertEquals(key + " length", a.length / 2, x.length);
                String got = sha256(x);
                if (!got.equals(want)) diffs.add(key + ": " + got);
                checked++;
            }
        }
        assertEquals("songs rendered", JS.size(), checked);
        assertTrue("renders that differ from the JS renderer: " + diffs, diffs.isEmpty());
    }

    @Test
    public void halfMatchesTheSpecsReferenceValues() {
        // analysis-cases.md §4's reference: tempo-change-120-126
        AnalysisSignals.Song s = null;
        for (AnalysisCases.Case c : AnalysisCases.cases()) if (c.name.equals("tempo-change-120-126")) s = c.song;
        assertTrue("tempo-change-120-126 in analysis-cases.json", s != null);
        float[] a = AnalysisSignals.render(s, 44100), b = AnalysisSignals.half(a);
        double sa = 0, sb = 0;
        for (float v : a) sa += (double) v * v;
        for (float v : b) sb += (double) v * v;
        assertEquals(2205000, a.length);
        assertEquals(30928.7347, sa, 5e-5);
        assertEquals(1102500, b.length);
        assertEquals(14341.9206, sb, 5e-5);
        assertEquals(0.0767018, b[22050], 5e-8);
        assertEquals(0.0108016, b[33075], 5e-8);
    }

    @Test
    public void beatTimesFollowEachPart() {
        AnalysisSignals.Song s = new AnalysisSignals.Song();
        s.sec = 10;
        s.kit = "drums";
        s.parts.add(new double[]{0.5, 120});
        s.parts.add(new double[]{4.5, 60});
        List<AnalysisSignals.Beat> b = AnalysisSignals.beatTimes(s);
        // 0.5 .. 4.0 every 0.5 s (8 beats), then 4.5 .. 9.5 every second (6 beats), bar count restarting
        assertEquals(14, b.size());
        assertEquals(4.0, b.get(7).t, 1e-12);
        assertEquals(3, b.get(7).beatInBar);
        assertEquals(4.5, b.get(8).t, 1e-12);
        assertEquals(0, b.get(8).beatInBar);
        assertEquals(60, b.get(8).bpm, 0);
        assertEquals(9.5, b.get(13).t, 1e-12);
    }
}
