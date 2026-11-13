package dev.utaa.cutlog.extension.editor;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** 撮影画面に足すボタンの横位置。単位は dp 相当（計算は比率だけなので単位に依らない）。 */
public class CameraChromeTest {
    private static final float WIDTH = 50f;
    private static final float MARGIN = 16f;

    /** 幅 375dp の端末（XIG07）。シャッターは中央、フラッシュはその 89dp 左。 */
    private static final float NARROW = 375f;
    private static final float SHUTTER = NARROW / 2f;
    private static final float UNIT = 89f;

    @Test
    public void keepsSlotPositionWhenItFits() {
        assertEquals(SHUTTER + UNIT, CameraChrome.centerX(SHUTTER, UNIT, 1f, WIDTH, NARROW, MARGIN), 0.01f);
        float wide = 600f;
        assertEquals(wide / 2f - UNIT * 2, CameraChrome.centerX(wide / 2f, UNIT, -2f, WIDTH, wide, MARGIN), 0.01f);
    }

    /** slot -2 が画面の左端からはみ出す幅では、画面の端に収め、フラッシュとも重ねない。 */
    @Test
    public void staysInsideScreenLeftOfFlash() {
        float center = CameraChrome.centerX(SHUTTER, UNIT, -2f, WIDTH, NARROW, MARGIN);
        float left = center - WIDTH / 2f;
        float right = center + WIDTH / 2f;
        float flashLeft = SHUTTER - UNIT - WIDTH / 2f;
        assertTrue("left edge " + left, left >= MARGIN);
        assertTrue("overlaps flash: " + right + " > " + flashLeft, right <= flashLeft);
        // 端（margin の位置）とフラッシュの間の真ん中に置く。
        assertEquals(left - MARGIN, flashLeft - right, 0.01f);
    }

    @Test
    public void staysInsideScreenOnRightSide() {
        float center = CameraChrome.centerX(SHUTTER, UNIT, 2f, WIDTH, NARROW, MARGIN);
        assertTrue(center + WIDTH / 2f <= NARROW - MARGIN);
        assertTrue(center - WIDTH / 2f >= SHUTTER + UNIT + WIDTH / 2f);
    }
}
