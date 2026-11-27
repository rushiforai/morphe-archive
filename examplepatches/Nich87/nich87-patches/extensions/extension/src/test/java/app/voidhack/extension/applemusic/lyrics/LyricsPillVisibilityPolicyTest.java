package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public final class LyricsPillVisibilityPolicyTest {
    @Test
    public void keepsPillHiddenOnTrackChangeWhileControlsAreHidden() {
        LyricsPillVisibilityPolicy.Decision decision = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.INVISIBLE,
                0.0f,
                LyricsPillVisibilityPolicy.INVISIBLE,
                LyricsPillVisibilityPolicy.INVISIBLE,
                0.0f);

        assertEquals(LyricsPillVisibilityPolicy.INVISIBLE, decision.visibility);
        assertEquals(0.0f, decision.alpha, 0.0001f);
    }

    @Test
    public void keepsPillHiddenWhenControlsViewIsInvisibleEvenIfTargetWasVisible() {
        LyricsPillVisibilityPolicy.Decision decision = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.INVISIBLE,
                0.0f,
                LyricsPillVisibilityPolicy.VISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f);

        assertEquals(LyricsPillVisibilityPolicy.INVISIBLE, decision.visibility);
        assertEquals(0.0f, decision.alpha, 0.0001f);
    }

    @Test
    public void doesNotPopPillBackToFullAlphaDuringControlsFadeOut() {
        LyricsPillVisibilityPolicy.Decision midFade = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.4f,
                LyricsPillVisibilityPolicy.INVISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.45f);

        assertEquals(LyricsPillVisibilityPolicy.VISIBLE, midFade.visibility);
        assertEquals(0.4f, midFade.alpha, 0.0001f);

        LyricsPillVisibilityPolicy.Decision nearZero = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.04f,
                LyricsPillVisibilityPolicy.INVISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.04f);

        assertEquals(LyricsPillVisibilityPolicy.INVISIBLE, nearZero.visibility);
        assertEquals(0.0f, nearZero.alpha, 0.0001f);

        LyricsPillVisibilityPolicy.Decision alreadyHidden = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.4f,
                LyricsPillVisibilityPolicy.INVISIBLE,
                LyricsPillVisibilityPolicy.INVISIBLE,
                0.0f);

        assertEquals(LyricsPillVisibilityPolicy.INVISIBLE, alreadyHidden.visibility);
        assertEquals(0.0f, alreadyHidden.alpha, 0.0001f);
    }

    @Test
    public void tracksControlsAlphaSmoothlyDuringFadeInAndVisibleSteadyState() {
        LyricsPillVisibilityPolicy.Decision fadingIn = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.25f,
                LyricsPillVisibilityPolicy.VISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                0.25f);

        assertEquals(LyricsPillVisibilityPolicy.VISIBLE, fadingIn.visibility);
        assertEquals(0.25f, fadingIn.alpha, 0.0001f);

        LyricsPillVisibilityPolicy.Decision shown = LyricsPillVisibilityPolicy.resolveForRefresh(
                true,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f,
                LyricsPillVisibilityPolicy.VISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f);

        assertEquals(LyricsPillVisibilityPolicy.VISIBLE, shown.visibility);
        assertEquals(1.0f, shown.alpha, 0.0001f);
    }

    @Test
    public void fallsBackToTrackedTargetVisibilityWhenControlsViewIsUnavailable() {
        LyricsPillVisibilityPolicy.Decision hidden = LyricsPillVisibilityPolicy.resolveForRefresh(
                false,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f,
                LyricsPillVisibilityPolicy.INVISIBLE,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f);

        assertEquals(LyricsPillVisibilityPolicy.INVISIBLE, hidden.visibility);
        assertEquals(0.0f, hidden.alpha, 0.0001f);

        LyricsPillVisibilityPolicy.Decision visible = LyricsPillVisibilityPolicy.resolveForRefresh(
                false,
                LyricsPillVisibilityPolicy.VISIBLE,
                1.0f,
                LyricsPillVisibilityPolicy.VISIBLE,
                LyricsPillVisibilityPolicy.INVISIBLE,
                0.0f);

        assertEquals(LyricsPillVisibilityPolicy.VISIBLE, visible.visibility);
        assertEquals(1.0f, visible.alpha, 0.0001f);
    }

    @Test
    public void restoresControlsWhenHiddenOrFadingOutOnMissingLyricsTrack() {
        assertTrue(LyricsPillVisibilityPolicy.shouldRestoreControls(
                true, LyricsPillVisibilityPolicy.INVISIBLE, 0.0f, LyricsPillVisibilityPolicy.INVISIBLE));
        assertTrue(LyricsPillVisibilityPolicy.shouldRestoreControls(
                true, LyricsPillVisibilityPolicy.VISIBLE, 0.5f, LyricsPillVisibilityPolicy.INVISIBLE));
        assertTrue(LyricsPillVisibilityPolicy.shouldRestoreControls(
                true, LyricsPillVisibilityPolicy.VISIBLE, 1.0f, LyricsPillVisibilityPolicy.INVISIBLE));
        assertFalse(LyricsPillVisibilityPolicy.shouldRestoreControls(
                true, LyricsPillVisibilityPolicy.VISIBLE, 1.0f, LyricsPillVisibilityPolicy.VISIBLE));
    }
}
