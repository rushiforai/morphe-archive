package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class FullArtTest {

    @Test
    public void fadeCurveRunsFromZeroToOne() {
        assertEquals(0f, FullArt.smoother(0f), 1e-6f);
        assertEquals(0.5f, FullArt.smoother(0.5f), 1e-6f);
        assertEquals(1f, FullArt.smoother(1f), 1e-6f);
    }

    @Test
    public void fadeCurveIsClampedOutsideTheBand() {
        assertEquals(0f, FullArt.smoother(-0.3f), 1e-6f);
        assertEquals(1f, FullArt.smoother(1.7f), 1e-6f);
    }

    @Test
    public void fadeCurveRisesSmoothly() {
        float last = -1;
        for (int i = 0; i <= 16; i++) {
            float v = FullArt.smoother(i / 16f);
            assertTrue("rises at stop " + i, v >= last);
            last = v;
        }
        // flat at both ends (smootherStep), so the banner's edge never shows a step
        assertTrue(FullArt.smoother(1 / 16f) < 0.01f);
        assertTrue(FullArt.smoother(15 / 16f) > 0.99f);
    }

    @Test
    public void animatedCoverFadeBoundsFollowMetrolist() {
        // fallback-free bounds on the S21 FE: title at 1250, artist ending at 1400 (px from the top)
        float H = 2340;
        float start = (1250 - H * FullArt.TITLE_OFFSET) / H;
        assertEquals(0.454f, start, 1e-3f);
        // the span is at least 18% of the height: the seam is start + 0.18, under the 0.85 cap
        assertEquals(0.634f, Math.min(0.85f, Math.max(1400 / H, start + FullArt.MIN_FADE_SPAN)), 1e-3f);
    }

    // BitChord's card box: min(screen - 2 x 30dp, 560dp)

    @Test
    public void cardBoxIsCappedAt560dp() {
        // the emulator: 1440 px at density 2 (720dp wide), BitChord draws 1120 px
        assertEquals(1120f, FullArt.cardBox(1440, 2f, 1f, 5000), 0.01f);
    }

    @Test
    public void cardBoxLeavesA30dpGutterOnANarrowPhone() {
        // 360dp wide at density 3: 1080 - 2 x 90
        assertEquals(900f, FullArt.cardBox(1080, 3f, 1f, 5000), 0.01f);
    }

    @Test
    public void cardBoxFollowsYtsOwnScale() {
        assertEquals(1120f * 0.9f, FullArt.cardBox(1440, 2f, 0.9f, 5000), 0.01f);
    }

    @Test
    public void cardBoxGivesWayToTheColumnButNotBelowHalfTheScreen() {
        assertEquals(1000f, FullArt.cardBox(1440, 2f, 1f, 1000), 0.01f);
        assertEquals(720f, FullArt.cardBox(1440, 2f, 1f, 300), 0.01f);
    }

    // the pause spring: DampingRatioLowBouncy (0.75), StiffnessLow (200)

    private static float[] settle(float k, float target, int frames, float frameMs) {
        float[] s = {k, 0f};
        for (int i = 0; i < frames; i++) s = FullArt.spring(s[0], s[1], target, frameMs);
        return s;
    }

    @Test
    public void springShrinksTo86PercentAndStopsExactly() {
        float[] s = settle(1f, 0.86f, 120, 16); // ~2 s of frames
        assertEquals(0.86f, s[0], 0f);
        assertEquals(0f, s[1], 0f);
    }

    @Test
    public void springGrowsBackToFullSize() {
        float[] s = settle(0.86f, 1f, 120, 16);
        assertEquals(1f, s[0], 0f);
        assertEquals(0f, s[1], 0f);
    }

    @Test
    public void springOvershootsALittleLikeLowBouncy() {
        float[] s = {1f, 0f};
        float min = 1f;
        for (int i = 0; i < 120; i++) {
            s = FullArt.spring(s[0], s[1], 0.86f, 16);
            min = Math.min(min, s[0]);
        }
        // a 0.75 damping ratio overshoots by about 2.8% of the travel
        assertTrue("overshoots: " + min, min < 0.86f);
        assertTrue("only a little: " + min, min > 0.86f - 0.14f * 0.06f);
    }

    @Test
    public void springIsMostlyThereWithinHalfASecond() {
        float[] s = settle(1f, 0.86f, 30, 16); // 480 ms
        assertTrue("at " + s[0], Math.abs(s[0] - 0.86f) < 0.14f * 0.1f);
    }

    @Test
    public void springDoesNotDependOnTheFrameRate() {
        float[] at60 = settle(1f, 0.86f, 15, 16);
        float[] at120 = settle(1f, 0.86f, 30, 8);
        assertEquals(at60[0], at120[0], 0.002f);
    }

    @Test
    public void springAtRestStaysPut() {
        float[] s = FullArt.spring(0.86f, 0f, 0.86f, 16);
        assertEquals(0.86f, s[0], 0f);
        assertEquals(0f, s[1], 0f);
    }
}
