package app.voidhack.extension.applemusic;

/** Geometry and opacity for one frame of the native sheet slide. */
final class GlassPlayerMorph {
    private static final float GLASS_FADE_END = 0.28f;

    int left;
    int top;
    int right;
    int bottom;
    float radius;
    int miniAlpha;
    int glassAlpha;
    int metadataAlpha;

    static float progressAt(int top, int expandedTop, int collapsedTop) {
        if (expandedTop >= collapsedTop) return 0f;
        return Math.max(0f, Math.min(1f, (float) (collapsedTop - top) / (collapsedTop - expandedTop)));
    }

    static boolean isIntermediate(float progress) {
        return progress > 0f && progress < 1f;
    }

    boolean update(float progress, boolean animate, int miniLeft, int miniTop, int miniRight,
                   int miniBottom, int width, int height) {
        boolean moving = animate && isIntermediate(progress) && miniLeft < miniRight
                && miniTop < miniBottom && width > 0 && height > 0;
        miniAlpha = moving || progress >= 1f ? 0 : 255;
        glassAlpha = moving ? Math.round(255f * (1f - smoothStep(progress / GLASS_FADE_END))) : 0;
        metadataAlpha = Math.round(255f * smoothStep(progress));
        if (moving) {
            left = Math.round(mix(miniLeft, 0f, progress));
            top = Math.round(mix(miniTop, 0f, progress));
            right = Math.round(mix(miniRight, width, progress));
            bottom = Math.round(mix(miniBottom, height, progress));
            radius = Math.min(miniRight - miniLeft, miniBottom - miniTop) * 0.5f * (1f - progress);
        }
        return moving;
    }

    static float smoothStep(float progress) {
        float t = Math.max(0f, Math.min(1f, progress));
        return t * t * (3f - 2f * t);
    }

    private static float mix(float start, float end, float progress) {
        return start + (end - start) * progress;
    }
}
