package app.bin0culars.extension.reddit;

final class GlassTabLabel {

    private static final float LABEL_FONT_SIZE_SP = 13f;
    private static final float LABEL_LINE_HEIGHT_SP = 17f;
    private static final int TEXT_OVERRIDE_BITS = (1 << 3) | (1 << 10);
    private static final float PILL_CORNER_DP = 100f;
    // Compose graphicsLayer mask: bits 0..18 set except shape (bit 11) and clip (bit 12).
    private static final int GRAPHICS_LAYER_CLIP_MASK = 0x7e7ff;

    private static volatile Object pillShape;

    private GlassTabLabel() {}

    static long tabLabelFontSize() {
        try {
            return GlassTopTabs.isTabsActive() ? packSp(LABEL_FONT_SIZE_SP) : 0L;
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    static long tabLabelLineHeight() {
        try {
            return GlassTopTabs.isTabsActive() ? packSp(LABEL_LINE_HEIGHT_SP) : 0L;
        } catch (Throwable ignored) {
            return 0L;
        }
    }

    static int tabLabelMask(int original) {
        try {
            return GlassTopTabs.isTabsActive() ? (original & ~TEXT_OVERRIDE_BITS) : original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    static float tabItemTopPadding(float original) {
        try {
            return GlassTopTabs.isTabsActive() ? 0f : original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    static Object tabItemModifier(Object modifier) {
        try {
            if (modifier == null || !GlassTopTabs.isTabsActive()) {
                return modifier;
            }
            Object shape = pillShape;
            if (shape == null) {
                shape = roundedCornerShape(PILL_CORNER_DP);
                if (shape == null) {
                    return modifier;
                }
                pillShape = shape;
            }
            return GlassSearch.graphicsLayer(
                    modifier, 0f, 0f, 0f, 0f, 0f, shape, true, 0, GRAPHICS_LAYER_CLIP_MASK);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    private static long packSp(float value) {
        return 0x100000000L | (Float.floatToRawIntBits(value) & 0xFFFFFFFFL);
    }

    private static Object roundedCornerShape(float dp) {
        return null;
    }
}
