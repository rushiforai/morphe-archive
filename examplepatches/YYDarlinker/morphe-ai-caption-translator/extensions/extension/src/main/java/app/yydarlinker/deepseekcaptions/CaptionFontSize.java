package app.yydarlinker.deepseekcaptions;

/** Portable glyph-ink size tiers anchored to the measured Bilibili player sizes. */
final class CaptionFontSize {
    static final int COUNT = 5;
    static final int DEFAULT_TIER = 2;
    private static final float DETAIL_SCREEN_WIDTH_PX = 1264f;
    private static final float FULL_SCREEN_WIDTH_PX = 2736f;
    private static final float FULL_SCREEN_SCALE = 55.5f / 44.5f;
    private static final float[] DETAIL_GLYPH_HEIGHTS_PX = {34f, 39f, 44.5f, 50f, 56f};

    private CaptionFontSize() {}

    static int clampTier(int tier) {
        return Math.max(0, Math.min(COUNT - 1, tier));
    }

    static float detailGlyphHeightPx(int tier) {
        return DETAIL_GLYPH_HEIGHTS_PX[clampTier(tier)];
    }

    static float fullScreenGlyphHeightPx(int tier) {
        return detailGlyphHeightPx(tier) * FULL_SCREEN_SCALE;
    }

    static float detailRatio(int tier) {
        return detailGlyphHeightPx(tier) / DETAIL_SCREEN_WIDTH_PX;
    }

    static float fullScreenRatio(int tier) {
        return fullScreenGlyphHeightPx(tier) / FULL_SCREEN_WIDTH_PX;
    }

    static int nearestTierForDetailGlyphHeight(float glyphHeightPx) {
        if (Float.isNaN(glyphHeightPx)) return DEFAULT_TIER;
        int nearest = 0;
        float distance = Math.abs(glyphHeightPx - DETAIL_GLYPH_HEIGHTS_PX[0]);
        for (int tier = 1; tier < COUNT; tier++) {
            float candidate = Math.abs(glyphHeightPx - DETAIL_GLYPH_HEIGHTS_PX[tier]);
            // Strict comparison makes an exact midpoint choose the smaller tier.
            if (candidate < distance) {
                nearest = tier;
                distance = candidate;
            }
        }
        return nearest;
    }
}
