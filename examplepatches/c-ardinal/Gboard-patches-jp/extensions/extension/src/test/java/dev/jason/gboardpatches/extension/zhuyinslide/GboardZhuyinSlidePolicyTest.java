package dev.jason.gboardpatches.extension.zhuyinslide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class GboardZhuyinSlidePolicyTest {
    @Test
    public void normalizesNonBlankTokensAndPlansMissingOrdinaryActions() {
        GboardZhuyinSlidePolicy.PatchPlan plan = GboardZhuyinSlidePolicy.plan(
                "ㄆ", "ㄆ", new String[] {"", "ㄆ", " ", "q", "Q", ""},
                false, false);

        assertEquals("Q", plan.slideUpText);
        assertEquals("q", plan.slideDownText);
    }

    @Test
    public void nativeExactActionsAreNeverReplaced() {
        GboardZhuyinSlidePolicy.PatchPlan nativeUp = GboardZhuyinSlidePolicy.plan(
                "ㄉ", "ㄉ", new String[] {"ㄉ", "2", "@"}, true, false);
        assertNull(nativeUp.slideUpText);
        assertEquals("2", nativeUp.slideDownText);

        GboardZhuyinSlidePolicy.PatchPlan bothNative = GboardZhuyinSlidePolicy.plan(
                "ㄆ", "ㄆ", new String[] {"ㄆ", "q", "Q"}, true, true);
        assertTrue(bothNative.isEmpty());
    }

    @Test
    public void bottomOverridesUsePublishedSingleCharacterPayloads() {
        assertDown("ㄝ", "…");
        assertDown("ㄡ", "！");
        assertDown("ㄤ", "：");

        GboardZhuyinSlidePolicy.PatchPlan eng = GboardZhuyinSlidePolicy.plan(
                "ㄥ", "ㄥ", new String[] {"ㄥ", "？"}, false, false);
        assertNull(eng.slideUpText);
        assertEquals("？", eng.slideDownText);
    }

    @Test
    public void erBottomRowIsFullyExcludedByLabelOrFirstToken() {
        assertTrue(GboardZhuyinSlidePolicy.plan(
                "ㄦ", "ㄦ", new String[] {"ㄦ", "-", "——"}, false, false).isEmpty());
        assertTrue(GboardZhuyinSlidePolicy.plan(
                null, null, new String[] {"", "ㄦ", "-", "——"}, false, false).isEmpty());
    }

    @Test
    public void admitsZhuyinAndToneMetadataButRejectsEnglishAndSymbols() {
        assertEquals("!", GboardZhuyinSlidePolicy.plan(
                "ˊ", "ˊ", new String[] {"ˊ", "!"}, false, false).slideDownText);
        assertEquals("Q", GboardZhuyinSlidePolicy.plan(
                null, null, new String[] {"ㄆ", "q", "Q"}, false, false).slideUpText);
        assertTrue(GboardZhuyinSlidePolicy.plan(
                "q", "q", new String[] {"q", "1", "Q"}, false, false).isEmpty());
        assertTrue(GboardZhuyinSlidePolicy.plan(
                "，", "，", new String[] {"，", "?"}, false, false).isEmpty());
    }

    private static void assertDown(String label, String expected) {
        GboardZhuyinSlidePolicy.PatchPlan plan = GboardZhuyinSlidePolicy.plan(
                label, label, new String[] {label, "legacy"}, false, false);
        assertEquals(expected, plan.slideDownText);
    }
}
