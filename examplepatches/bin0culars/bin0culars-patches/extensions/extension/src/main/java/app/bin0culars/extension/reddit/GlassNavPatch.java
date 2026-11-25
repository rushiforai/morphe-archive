package app.bin0culars.extension.reddit;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.util.List;
import kotlin.jvm.functions.Function1;

public final class GlassNavPatch {

    // Reddit's button row height.
    public static final float BAR_ROW_HEIGHT_DP = 50f;

    private static final float RAIL_THRESHOLD_HEIGHT_DP = 500f;
    private static final float RAIL_HEADER_HEIGHT_DP = 60f;
    private static final float RAIL_TAB_HEIGHT_DP = 64f;
    private static final float RAIL_GAP_DP = 12f;

    private static volatile Context appContext;
    private static volatile float cachedDensity = -1f;
    private static volatile Boolean cachedIsDark;
    private static volatile int railTabCount;
    static volatile long lastPageColor;

    private static final Function1<Object, Object> BAR_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (BinocularsMods.isEnabled("glass_navigation")) {
                            drawBarCapsule(scope);
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private static final Function1<Object, Object> RAIL_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        if (BinocularsMods.isEnabled("glass_navigation")) {
                            drawRailCapsule(scope);
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private GlassNavPatch() {}

    private static void updateDarkTheme(long color) {
        try {
            int argb = (int) (color >>> 32);
            int r = (argb >> 16) & 0xFF;
            int g = (argb >> 8) & 0xFF;
            int b = argb & 0xFF;
            double luminance = (0.2126 * r + 0.7152 * g + 0.0722 * b) / 255.0;
            cachedIsDark = luminance < 0.5;
        } catch (Throwable ignored) {
        }
    }

    public static long barColor(long original) {
        try {
            updateDarkTheme(original);

            if (!BinocularsMods.isEnabled("glass_navigation")) {
                return original;
            }
            return original & 0x00FFFFFFFFFFFFFFL;
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static long barBackdrop(long color) {
        try {
            if (BinocularsMods.isEnabled("glass_navigation")) {
                return color & 0x00FFFFFFFFFFFFFFL;
            }
            return color;
        } catch (Throwable ignored) {
            return color;
        }
    }

    public static long pageColor(Object colors) {
        try {
            if (BinocularsMods.isEnabled("glass_navigation")) {
                long c = feedColor(colors);
                lastPageColor = c;
                return c;
            }
            return stripColor(colors);
        } catch (Throwable ignored) {
            return stripColor(colors);
        }
    }

    public static void railThemeColor(long color) {
        try {
            updateDarkTheme(color);
        } catch (Throwable ignored) {
        }
    }

    public static void railTabs(Object tabs) {
        try {
            if (tabs instanceof List) {
                railTabCount = ((List<?>) tabs).size();
            } else {
                railTabCount = 0;
            }
        } catch (Throwable ignored) {
            railTabCount = 0;
        }
    }

    public static float barElevation(float original) {
        try {
            if (BinocularsMods.isEnabled("glass_navigation")) {
                return 0f;
            }
            return original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    @SuppressWarnings("rawtypes")
    public static Function1 barDraw(Function1 original) {
        try {
            if (BinocularsMods.isEnabled("glass_navigation")) {
                return BAR_DRAW;
            }
            return original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    @SuppressWarnings("rawtypes")
    public static Function1 railDraw() {
        try {
            return RAIL_DRAW;
        } catch (Throwable ignored) {
            return RAIL_DRAW;
        }
    }

    public static boolean padContentForBottomNav(boolean original) {
        try {
            if (BinocularsMods.isEnabled("glass_navigation")) {
                return false;
            }
            return original;
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static Object barModifier(Object modifier) {
        try {
            if (!BinocularsMods.isEnabled("glass_navigation")) {
                return modifier;
            }
            int width = BinocularsMods.getInt("glass_navigation_width");
            if (width == 100) {
                return modifier;
            }
            float density = getDensity();
            float screenWidthDp = Resources.getSystem().getDisplayMetrics().widthPixels / density;
            float pad = screenWidthDp * (100 - width) / 200f;
            return padding(modifier, pad, 0f, pad, 0f, 0);
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    static Context getApplicationContext() {
        if (appContext != null) {
            return appContext;
        }
        try {
            appContext = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    private static boolean isAppNightMode() {
        try {
            Context context = getApplicationContext();
            Resources res = context != null ? context.getResources() : Resources.getSystem();
            int uiMode = res.getConfiguration().uiMode;
            return (uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean isDarkTheme() {
        Boolean dark = cachedIsDark;
        if (dark != null) {
            return dark;
        }
        return isAppNightMode();
    }

    static boolean glassIsDark() {
        try {
            String tint = BinocularsMods.getChoice("glass_navigation_tint");
            if ("light".equals(tint)) {
                return false;
            } else if ("dark".equals(tint)) {
                return true;
            }
            return isDarkTheme();
        } catch (Throwable ignored) {
            return isDarkTheme();
        }
    }

    private static long getCapsuleColor() {
        try {
            boolean effectiveDark = glassIsDark();
            int rgb = effectiveDark ? 0x1C1C1E : 0xF2F2F7;
            int opacity = BinocularsMods.getInt("glass_navigation_opacity_percent");
            float factor = GlassBlur.blurActive() ? 0.6f : 1.0f;
            int alpha = Math.round(255f * opacity / 100f * factor);
            int argb = (alpha << 24) | rgb;
            return ((long) argb & 0xFFFFFFFFL) << 32;
        } catch (Throwable ignored) {
            int alpha = Math.round(255f * 70f / 100f);
            int argb = (alpha << 24) | 0x1C1C1E;
            return ((long) argb & 0xFFFFFFFFL) << 32;
        }
    }

    static float getDensity() {
        if (cachedDensity <= 0f) {
            try {
                Context context = getApplicationContext();
                Resources res = context != null ? context.getResources() : Resources.getSystem();
                cachedDensity = res.getDisplayMetrics().density;
            } catch (Throwable ignored) {
                return 1.0f;
            }
        }
        return cachedDensity;
    }

    private static long packFloats(float x, float y) {
        return ((long) Float.floatToRawIntBits(x) << 32) | (Float.floatToRawIntBits(y) & 0xFFFFFFFFL);
    }

    private static void drawBarCapsule(Object scope) {
        long size = drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (size >>> 32));

        float density = getDensity();
        int widthPercent = BinocularsMods.getInt("glass_navigation_width");
        float pad = width * (100 - widthPercent) / 200f;
        float inset = 20f * density * widthPercent / 100f;
        float left = pad + inset;
        float capsuleWidth = width - (2f * pad) - (2f * inset);

        int heightPercent = BinocularsMods.getInt("glass_navigation_height");
        float capsuleHeight = (BAR_ROW_HEIGHT_DP + 10f) * density * heightPercent / 100f;
        float top = (BAR_ROW_HEIGHT_DP * density - capsuleHeight) / 2f;

        if (capsuleWidth <= 0f || capsuleHeight <= 0f) {
            return;
        }

        float radius = BinocularsMods.isEnabled("glass_navigation_round")
                ? capsuleHeight / 2f
                : 18f * density;
        long topLeft = packFloats(left, top);
        long capsuleSize = packFloats(capsuleWidth, capsuleHeight);
        long cornerRadius = packFloats(radius, radius);
        long color = getCapsuleColor();

        GlassBlur.drawBar(scope, left, top, capsuleWidth, capsuleHeight, radius);
        drawRoundRect(scope, color, topLeft, capsuleSize, cornerRadius, null, 1.0f, 0xF0);
        GlassBlur.drawEdge(scope, left, top, capsuleWidth, capsuleHeight, radius);
    }

    private static void drawRailCapsule(Object scope) {
        long size = drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (size >>> 32));
        float height = Float.intBitsToFloat((int) size);

        float density = getDensity();
        float heightDp = height / density;

        float left = RAIL_GAP_DP * density;
        float capsuleWidth = width - (2f * RAIL_GAP_DP * density);
        float top;
        float capsuleHeight;

        int n = railTabCount;
        if (heightDp > RAIL_THRESHOLD_HEIGHT_DP && n > 0) {
            float tabsHeight = (n * RAIL_TAB_HEIGHT_DP) + ((n - 1) * RAIL_GAP_DP);
            float tabsTop = RAIL_HEADER_HEIGHT_DP + (heightDp - RAIL_HEADER_HEIGHT_DP - tabsHeight) / 2f;
            top = (tabsTop - RAIL_GAP_DP) * density;
            capsuleHeight = (tabsHeight + (2f * RAIL_GAP_DP)) * density;
        } else {
            top = 16f * density;
            capsuleHeight = height - 32f * density;
        }

        if (capsuleWidth <= 0f || capsuleHeight <= 0f) {
            return;
        }

        float radius = BinocularsMods.isEnabled("glass_navigation_round")
                ? capsuleWidth / 2f
                : 18f * density;
        long topLeft = packFloats(left, top);
        long capsuleSize = packFloats(capsuleWidth, capsuleHeight);
        long cornerRadius = packFloats(radius, radius);
        long color = getCapsuleColor();

        drawRoundRect(scope, color, topLeft, capsuleSize, cornerRadius, null, 1.0f, 0xF0);
        GlassBlur.drawEdge(scope, left, top, capsuleWidth, capsuleHeight, radius);
    }

    private static Object padding(
            Object modifier, float start, float top, float end, float bottom, int mask) {
        return modifier;
    }

    static void drawRoundRect(
            Object scope,
            long color,
            long topLeft,
            long size,
            long radius,
            Object style,
            float alpha,
            int mask) {}

    static long drawScopeSize(Object scope) {
        return 0L;
    }

    static void drawContent(Object scope) {}

    private static long feedColor(Object colors) {
        return 0L;
    }

    private static long stripColor(Object colors) {
        return 0L;
    }
}
