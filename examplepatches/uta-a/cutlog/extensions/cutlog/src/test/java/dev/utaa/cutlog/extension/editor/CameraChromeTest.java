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

    /** setlog 1.3 (89) のエフェクトボタン（幅 50、シャッターの中心から 106 右）。 */
    private static final float EFFECT_LEFT = SHUTTER + 106f - WIDTH / 2f;
    private static final float EFFECT_RIGHT = SHUTTER + 106f + WIDTH / 2f;
    private static final float GAP = 4f;

    /** slot +1 がエフェクトボタンと重なるときは、その右へずらす。幅 393dp なら縮めずに入る。 */
    @Test
    public void movesPastSetlogButtonOnRightSide() {
        float width = 393f;
        float shutter = width / 2f;
        float effectRight = shutter + 131f;
        float slot = CameraChrome.centerX(shutter, UNIT, 1f, WIDTH, width, MARGIN);
        float[] placed = CameraChrome.avoid(slot, WIDTH / 2f, new float[] {shutter + 81f}, new float[] {effectRight},
                true, 0f, MARGIN, width - MARGIN);
        float half = WIDTH / 2f * placed[1];
        assertTrue("overlaps effect button: " + (placed[0] - half), placed[0] - half >= effectRight - 0.01f);
        assertTrue("right edge " + (placed[0] + half), placed[0] + half <= width - MARGIN + 0.01f);
        assertTrue("scale " + placed[1], placed[1] > 0.98f);
    }

    /** 幅 375dp（XIG07）では入りきらないので、縮めてエフェクトボタンと重ねない。 */
    @Test
    public void shrinksToFitBesideSetlogButton() {
        float slot = CameraChrome.centerX(SHUTTER, UNIT, 1f, WIDTH, NARROW, MARGIN);
        float[] placed = CameraChrome.avoid(slot, WIDTH / 2f, new float[] {EFFECT_LEFT}, new float[] {EFFECT_RIGHT},
                true, GAP, MARGIN, NARROW - MARGIN);
        float half = WIDTH / 2f * placed[1];
        assertTrue("scale " + placed[1], placed[1] < 1f && placed[1] >= CameraChrome.MIN_SCALE);
        assertTrue("overlaps effect button: " + (placed[0] - half), placed[0] - half >= EFFECT_RIGHT + GAP - 0.01f);
        assertTrue("right edge " + (placed[0] + half), placed[0] + half <= NARROW - MARGIN + 0.01f);
    }

    /** 重ならなければ動かさない（エフェクトボタンが無い端末や、隠れているとき）。 */
    @Test
    public void keepsPositionWithoutOverlap() {
        float slot = CameraChrome.centerX(SHUTTER, UNIT, 1f, WIDTH, NARROW, MARGIN);
        float[] placed = CameraChrome.avoid(slot, WIDTH / 2f, new float[0], new float[0], true, GAP, MARGIN, NARROW - MARGIN);
        assertEquals(slot, placed[0], 0.01f);
        assertEquals(1f, placed[1], 0.0001f);
        float left = CameraChrome.centerX(SHUTTER, UNIT, -2f, WIDTH, NARROW, MARGIN);
        placed = CameraChrome.avoid(left, WIDTH / 2f, new float[] {EFFECT_LEFT}, new float[] {EFFECT_RIGHT},
                false, GAP, MARGIN, NARROW - MARGIN);
        assertEquals(left, placed[0], 0.01f);
        assertEquals(1f, placed[1], 0.0001f);
    }

    /** 縮めても入らない幅では、下限まで縮めて画面の端に収める。 */
    @Test
    public void clampsToScreenAfterMoving() {
        float narrow = 340f;
        float shutter = narrow / 2f;
        float slot = CameraChrome.centerX(shutter, UNIT, 1f, WIDTH, narrow, MARGIN);
        float[] placed = CameraChrome.avoid(slot, WIDTH / 2f, new float[] {shutter + 81f}, new float[] {shutter + 131f},
                true, GAP, MARGIN, narrow - MARGIN);
        assertEquals(CameraChrome.MIN_SCALE, placed[1], 0.0001f);
        assertEquals(narrow - MARGIN - WIDTH / 2f * CameraChrome.MIN_SCALE, placed[0], 0.01f);
    }

    @Test
    public void staysInsideScreenOnRightSide() {
        float center = CameraChrome.centerX(SHUTTER, UNIT, 2f, WIDTH, NARROW, MARGIN);
        assertTrue(center + WIDTH / 2f <= NARROW - MARGIN);
        assertTrue(center - WIDTH / 2f >= SHUTTER + UNIT + WIDTH / 2f);
    }
}
