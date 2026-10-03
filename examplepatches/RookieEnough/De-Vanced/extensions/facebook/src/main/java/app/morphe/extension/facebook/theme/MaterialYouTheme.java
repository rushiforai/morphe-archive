/*
* Copyright 2026 De-Vanced
* Copyright 2026 Hushfacebook contributors
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*
* Token table and recolouring model adapted from Hushfacebook (GPL-3.0).
* [https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/MaterialYouTheme.java](https://github.com/SysAdminDoc/HushFacebook/blob/aa6cb7c4d904b3fbf1da07809231e97b151705fb/extensions/facebook/src/main/java/app/morphe/extension/facebook/theme/MaterialYouTheme.java)
*/

package app.morphe.extension.facebook.theme;

import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import app.morphe.extension.facebook.settings.DeVancedSettings;

public final class MaterialYouTheme {

    private MaterialYouTheme() {
    }

    private static final String FDS_DARK =
            "ACCENT=1D85FC;ACTIVE_DOT=E2E5E9;ATTACHMENT_FOOTER_BACKGROUND=F2F4F7;"
                    + "BLUE_LINK=5AA7FF,3E93F8;BOTTOM_SHEET_BACKGROUND_DEEMPHASIZED=252728;"
                    + "BOTTOM_SHEET_HANDLE=6F7276;BOTTOM_SHEET_INSET_BACKGROUND=333334;"
                    + "CARD_BACKGROUND=333334;CARD_BACKGROUND_FLAT=333334;"
                    + "CARD_BACKGROUND_LEGACY_WEB=252728;CARD_BORDER=333334;"
                    + "CLIENT_BOTTOM_SHEET_PRESSED=3B3C3E;COMMENT_BACKGROUND=333334;"
                    + "COMMENT_THREADING_LINES=46484B;DISABLED_BUTTON_BACKGROUND=333334;"
                    + "DISABLED_ICON=6F7276;DISABLED_TEXT=6F7276,505255;DIVIDER=65686C,505255;"
                    + "DOT_BADGE_BLUE=1D85FC;ENTITY_HEADER_BACKGROUND=252728;"
                    + "FBLITE_ACCENT_ON_BACKGROUND=1D85FC;FBLITE_STRONG_SECONDARY=D0D3D7;"
                    + "FBLITE_TEXT_INPUT_INACTIVE_INNER_BORDER=6F7276;FBLITE_WASH=080809;"
                    + "FEED_GAP_VERTICAL=101011;INACTIVE_DOT=84878B;LIST_CELL_BACKGROUND=252728;"
                    + "META_ICON=B0B3B8;META_TEXT=B0B3B8;NAV_BAR_BACKGROUND=252728;"
                    + "NAV_BAR_ICON=E8EAEE;NAV_BAR_TEXT=E8EAEE;PLACEHOLDER_ICON=B0B3B8,84878B;"
                    + "PLACEHOLDER_TEXT=B0B3B8,84878B;POPOVER_BACKGROUND=3B3C3E,3E4042;"
                    + "PRIMARY_BUTTON_TEXT=252728;PRIMARY_DEEMPHASIZED_BUTTON_ICON=75B6FF;"
                    + "PRIMARY_DEEMPHASIZED_BUTTON_TEXT=75B6FF,0866FF;PRIMARY_ICON=F2F4F7;"
                    + "PRIMARY_TEXT=F2F4F7;PROGRESS_RING_DISABLED_FOREGROUND=6F7276;"
                    + "SECONDARY_BUTTON_BACKGROUND=333334;SECONDARY_BUTTON_BACKGROUND_FLOATING=46484B;"
                    + "SECONDARY_BUTTON_BACKGROUND_OPAQUE=46484B;SECONDARY_BUTTON_ICON=F2F4F7;"
                    + "SECONDARY_BUTTON_TEXT=F2F4F7;SECONDARY_ICON=B0B3B8,A1A4A9;"
                    + "SECONDARY_TEXT=B0B3B8,A1A4A9;SURFACE_BACKGROUND=252728;"
                    + "SWITCH_CHECKED_BACKGROUND_COLOR_ANDROID=ADD5FF;"
                    + "SWITCH_CHECKED_HANDLE_FILL_COLOR_ANDROID=0866FF;"
                    + "SWITCH_DISABLED_HANDLE_FILL_COLOR=6F7276;"
                    + "SWITCH_UNCHECKED_BACKGROUND_COLOR=6F7276;TAB_BAR_ACTIVE_ICON=F2F4F7;"
                    + "TAB_BAR_BACKGROUND=252728;TAB_BAR_INACTIVE_ICON=F2F4F7;"
                    + "TEXT_INPUT_ACTIVE_INNER_BORDER=1D85FC;TEXT_INPUT_ACTIVE_TEXT=3E93F8;"
                    + "TEXT_INPUT_BAR_BACKGROUND=333334;TEXT_INPUT_BAR_BACKGROUND_ON_DEEMPHASIZED=333334;"
                    + "TEXT_INPUT_INACTIVE_INNER_BORDER=5C5E62;TOGGLE_ACTIVE_BACKGROUND=1D85FC,0866FF;"
                    + "TOOLTIP_TEXT=080809;UFI_TRAY_ICON_BUTTON_BACKGROUND=46484B;"
                    + "VOICE_SWITCHER_BACKGROUND=46484B;WASH=101011,1C1C1D;WEB_WASH=1C1C1D";

    private static final String SURFACES =
            "101011 18191A 1C1C1D 242526 252728 3E4042";

    private static final Map<String, int[]> FDS =
            Collections.unmodifiableMap(parseTokens(FDS_DARK));
    private static final int[] SURFACE_VALUES = parseSurfaces(SURFACES);

    public static int DARK_101011 = 0xff101011;
    public static int DARK_18191A = 0xff18191a;
    public static int DARK_1C1C1D = 0xff1c1c1d;
    public static int DARK_242526 = 0xff242526;
    public static int DARK_252728 = 0xff252728;
    public static int DARK_3E4042 = 0xff3e4042;

    private static volatile boolean enabled;
    private static volatile boolean bound;
    private static volatile TonePalette palette = TonePalette.fallback();

    public static synchronized void initialize(
            Context context,
            boolean enabledValue
    ) {
        enabled = enabledValue;
        if (enabled) {
            reload(context);
            bind(context);
        } else {
            publishOriginals();
        }
    }

    public static synchronized void setEnabled(
            Context context,
            boolean enabledValue
    ) {
        enabled = enabledValue;
        if (enabled) {
            reload(context);
            bind(context);
        } else {
            publishOriginals();
        }
    }

    public static boolean isEnabled() {
        return enabled;
    }

    /** Route one for FDS, after AMOLED has made its own decision. */
    public static int afterFds(
            int original,
            Object token,
            int amoledResult
    ) {
        if (!enabled || amoledResult == Color.BLACK ||
                !(token instanceof Enum)) {
            return amoledResult;
        }
        int recolored = recolorSurface(amoledResult);
        return recolored == amoledResult
                ? fds(original, token)
                : recolored;
    }

    public static int fds(int color, Object token) {
        if (!enabled || (color >>> 24) != 0xff || !(token instanceof Enum)) {
            return color;
        }
        int[] dark = FDS.get(((Enum<?>) token).name());
        if (dark == null) {
            return color;
        }
        for (int value : dark) {
            if (value == color) {
                return recolor(palette(), color);
            }
        }
        return color;
    }

    /** Route one for Mig. Its dark resolver is only used in dark mode. */
    public static int mig(int color, Object token) {
        if (!enabled || (color >>> 24) != 0xff) {
            return color;
        }
        return recolor(palette(), color);
    }

    /** Route four, called after AMOLED's parser. */
    public static int afterServer(int color) {
        if (!enabled) {
            return color;
        }
        return isSurface(color) ? recolorSurface(color) : color;
    }

    /** View-tree fallback for resources and drawables that bypass a resolver. */
    public static int recolorSurface(int color) {
        if (!enabled || color == Color.BLACK || (color >>> 24) != 0xff) {
            return color;
        }
        return recolor(palette(), color);
    }

    private static int recolor(TonePalette palette, int color) {
        if (isNeutral(color)) {
            return palette.sameLightness(TonePalette.NEUTRAL, color);
        }
        if (isFacebookBlue(color)) {
            return palette.sameLightness(TonePalette.ACCENT, color);
        }
        return color;
    }

    private static boolean isNeutral(int color) {
        int red = (color >> 16) & 0xff;
        int green = (color >> 8) & 0xff;
        int blue = color & 0xff;
        return Math.max(red, Math.max(green, blue))
                - Math.min(red, Math.min(green, blue)) <= 10;
    }

    private static boolean isFacebookBlue(int color) {
        int red = (color >> 16) & 0xff;
        int green = (color >> 8) & 0xff;
        int blue = color & 0xff;
        int delta = blue - Math.min(red, green);
        if (blue < red || blue < green || blue < 77 || delta * 4 < blue) {
            return false;
        }
        int turn = 60 * (red - green);
        return turn >= -40 * delta && turn <= -15 * delta;
    }

    private static boolean isSurface(int color) {
        return Arrays.binarySearch(SURFACE_VALUES, color) >= 0;
    }

    private static TonePalette palette() {
        return palette;
    }

    private static void bind(Context context) {
        if (bound || context == null) {
            return;
        }
        context.registerComponentCallbacks(new ComponentCallbacks() {
            @Override
            public void onConfigurationChanged(Configuration configuration) {
                if (enabled) {
                    reload(context);
                }
            }

            @Override
            public void onLowMemory() {
            }
        });
        bound = true;
    }

    private static void reload(Context context) {
        if (context == null) {
            return;
        }
        palette = TonePalette.of(context);
        publish(palette);
    }

    private static void publish(TonePalette palette) {
        DARK_101011 = palette.sameLightness(TonePalette.NEUTRAL, 0xff101011);
        DARK_18191A = palette.sameLightness(TonePalette.NEUTRAL, 0xff18191a);
        DARK_1C1C1D = palette.sameLightness(TonePalette.NEUTRAL, 0xff1c1c1d);
        DARK_242526 = palette.sameLightness(TonePalette.NEUTRAL, 0xff242526);
        DARK_252728 = palette.sameLightness(TonePalette.NEUTRAL, 0xff252728);
        DARK_3E4042 = palette.sameLightness(TonePalette.NEUTRAL, 0xff3e4042);
    }

    private static void publishOriginals() {
        DARK_101011 = 0xff101011;
        DARK_18191A = 0xff18191a;
        DARK_1C1C1D = 0xff1c1c1d;
        DARK_242526 = 0xff242526;
        DARK_252728 = 0xff252728;
        DARK_3E4042 = 0xff3e4042;
    }

    private static Map<String, int[]> parseTokens(String table) {
        Map<String, int[]> values = new HashMap<>();
        for (String entry : table.split(";")) {
            int equals = entry.indexOf('=');
            String[] hex = entry.substring(equals + 1).split(",");
            int[] colors = new int[hex.length];
            for (int index = 0; index < hex.length; index++) {
                colors[index] = 0xff000000 | Integer.parseInt(hex[index], 16);
            }
            if (values.put(entry.substring(0, equals), colors) != null) {
                throw new IllegalStateException("token listed twice: " + entry);
            }
        }
        return values;
    }

    private static int[] parseSurfaces(String list) {
        String[] hex = list.split(" ");
        int[] values = new int[hex.length];
        for (int index = 0; index < hex.length; index++) {
            values[index] = 0xff000000 | Integer.parseInt(hex[index], 16);
        }
        Arrays.sort(values);
        return values;
    }
}
