package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class LayerAnimatorTest {
    private static final long DURATION = 5000;
    private final LayerAnimator.State state = new LayerAnimator.State();

    private static TextSpec text(long start, long end) {
        TextSpec text = new TextSpec("abcd", 0xFFFFFFFF, 0.1f, 0.5f, 0.5f);
        text.startMs = start;
        text.endMs = end;
        return text;
    }

    @Test
    public void hidesOutsideRange() {
        TextSpec text = text(1000, 3000);
        LayerAnimator.stateAt(text, 999, DURATION, state);
        assertFalse(state.visible);
        LayerAnimator.stateAt(text, 1000, DURATION, state);
        assertTrue(state.visible);
        LayerAnimator.stateAt(text, 2999, DURATION, state);
        assertTrue(state.visible);
        LayerAnimator.stateAt(text, 3000, DURATION, state);
        assertFalse(state.visible);
    }

    /** 最後まで表示する要素は、動画の最後の時刻でも消さない。 */
    @Test
    public void staysUntilEndOfVideo() {
        TextSpec text = text(0, Layer.UNTIL_END);
        LayerAnimator.stateAt(text, DURATION, DURATION, state);
        assertTrue(state.visible);
        assertEquals(1f, state.alpha, 0f);
    }

    @Test
    public void fadesInAndOut() {
        TextSpec text = text(1000, 3000);
        text.animationIn = LayerAnimation.FADE;
        text.animationOut = LayerAnimation.FADE;
        LayerAnimator.stateAt(text, 1000, DURATION, state);
        assertEquals(0f, state.alpha, 0.001f);
        LayerAnimator.stateAt(text, 1250, DURATION, state);
        assertTrue(state.alpha > 0f && state.alpha < 1f);
        LayerAnimator.stateAt(text, 2000, DURATION, state);
        assertEquals(1f, state.alpha, 0f);
        LayerAnimator.stateAt(text, 2750, DURATION, state);
        assertTrue(state.alpha > 0f && state.alpha < 1f);
    }

    /** 短い区間では、入り・出が区間の 3 分の 1 に収まり、真ん中は完全に表示される。 */
    @Test
    public void shortensAnimationForShortRange() {
        TextSpec text = text(0, 600);
        text.animationIn = LayerAnimation.FADE;
        text.animationOut = LayerAnimation.FADE;
        LayerAnimator.stateAt(text, 300, DURATION, state);
        assertEquals(1f, state.alpha, 0f);
        LayerAnimator.stateAt(text, 100, DURATION, state);
        assertTrue(state.alpha < 1f);
    }

    @Test
    public void slidesUpFromBelow() {
        TextSpec text = text(0, 3000);
        text.animationIn = LayerAnimation.SLIDE;
        LayerAnimator.stateAt(text, 0, DURATION, state);
        assertEquals(LayerAnimator.SLIDE_DISTANCE, state.offsetY, 0.001f);
        LayerAnimator.stateAt(text, 600, DURATION, state);
        assertEquals(0f, state.offsetY, 0f);
    }

    @Test
    public void typesCharacters() {
        TextSpec text = text(0, 3000);
        text.animationIn = LayerAnimation.TYPE;
        LayerAnimator.stateAt(text, 250, DURATION, state);
        assertEquals(0.5f, state.reveal, 0.001f);
        assertEquals(2, LayerAnimator.revealedLength(text.text, state.reveal));
    }

    /** サロゲートペア（絵文字など）を途中で切らない。 */
    @Test
    public void countsCodePoints() {
        String text = "a😀b";
        assertEquals(3, LayerAnimator.revealedLength(text, 1f));
        assertEquals(0, LayerAnimator.revealedLength(text, 0f));
        assertEquals(1, LayerAnimator.revealedLength(text, 0.1f));
        assertEquals(2, LayerAnimator.revealedLength(text, 0.5f));
    }

    @Test
    public void popsWithOvershoot() {
        TextSpec text = text(0, 3000);
        text.animationIn = LayerAnimation.POP;
        float max = 0f;
        for (long t = 0; t < 500; t += 10) {
            LayerAnimator.stateAt(text, t, DURATION, state);
            max = Math.max(max, state.scale);
        }
        assertTrue("overshoot " + max, max > 1f);
        LayerAnimator.stateAt(text, 0, DURATION, state);
        assertEquals(0f, state.scale, 0.001f);
    }
}
