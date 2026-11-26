package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;
import kotlin.jvm.functions.Function1;

final class GlassPill {

    private static final float NAV_PILL_INSET_DP = 6f;
    private static final float CAPSULE_CORNER_RADIUS_DP = 18f;
    private static final float LIGHT_PILL_ALPHA = 0.07f;
    private static final float DARK_PILL_ALPHA = 0.14f;

    private static final Function1<Object, Object> NAV_PILL_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (isActive()) {
                            drawNavPill(scope);
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            GlassNavPatch.drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private GlassPill() {}

    static boolean isActive() {
        try {
            return BinocularsMods.isEnabled("glass_navigation")
                    && !GlassNavPatch.railInUse
                    && !GlassSearch.isTablet(GlassSearch.getActivity());
        } catch (Throwable ignored) {
            return false;
        }
    }

    static Object navItemModifier(boolean selected, Object modifier) {
        try {
            if (modifier == null || !selected || !isActive()) {
                return modifier;
            }
            return GlassBlur.drawWithContent(modifier, NAV_PILL_DRAW);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    private static void drawNavPill(Object scope) {
        long size = GlassNavPatch.drawScopeSize(scope);
        float scopeWidth = Float.intBitsToFloat((int) (size >>> 32));
        float scopeHeight = Float.intBitsToFloat((int) size);
        if (scopeWidth <= 0f || scopeHeight <= 0f) {
            return;
        }
        float density = GlassNavPatch.getDensity();
        float inset = NAV_PILL_INSET_DP * density;
        float pillWidth = scopeWidth - (2f * inset);
        float pillHeight = GlassNavPatch.capsuleHeightPx() - (2f * inset);
        if (pillWidth <= 0f || pillHeight <= 0f) {
            return;
        }
        float left = (scopeWidth - pillWidth) / 2f;
        float top = (scopeHeight - pillHeight) / 2f;
        float radius = BinocularsMods.isEnabled("glass_navigation_round")
                ? pillHeight / 2f
                : (CAPSULE_CORNER_RADIUS_DP - NAV_PILL_INSET_DP) * density;
        drawPill(scope, left, top, pillWidth, pillHeight, radius);
    }

    static void drawPill(
            Object scope, float left, float top, float width, float height, float radius) {
        if (width <= 0f || height <= 0f) {
            return;
        }
        boolean dark = GlassNavPatch.glassIsDark();
        int alpha = Math.round(255f * (dark ? DARK_PILL_ALPHA : LIGHT_PILL_ALPHA));
        int argb = (alpha << 24) | (dark ? 0xFFFFFF : 0x000000);
        long color = ((long) argb & 0xFFFFFFFFL) << 32;

        GlassNavPatch.drawRoundRect(
                scope,
                color,
                GlassNavPatch.packFloats(left, top),
                GlassNavPatch.packFloats(width, height),
                GlassNavPatch.packFloats(radius, radius),
                null,
                1.0f,
                0xF0);
    }
}
