package app.morphe.extension.tiktok.theme;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Build;
import android.util.TypedValue;

import java.lang.reflect.Method;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Maps TikTok/TUX theme colors to the active BlueIT palette.
 *
 * TikTok 46.7.3 obfuscates resource entry names (for example "j3", "a0p", "zt"), so semantic
 * classification cannot rely on names alone. We still use readable names when available, but fall
 * back to the stock color resolved from TikTok's own Theme and infer only neutral UI roles from it.
 * Colorful/functional colors deliberately remain native unless they are the TikTok brand accent.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeColorResolver {
    private static final int ROLE_NONE = 0;
    private static final int ROLE_BACKGROUND = 1;
    private static final int ROLE_SURFACE = 2;
    private static final int ROLE_TEXT = 3;
    private static final int ROLE_SECONDARY_TEXT = 4;
    private static final int ROLE_ACCENT = 5;
    private static final int ROLE_DIVIDER = 6;

    private static final int TIKTOK_ACCENT = Color.rgb(254, 44, 85);
    private static final int TIKTOK_LIGHT_TEXT = Color.rgb(22, 24, 35);

    // Exact 46.7.3 resources. bx is the legacy page background used by search/inbox/navigation
    // (res/b/x.xml, d4l.xml, a6y.xml). Some wrappers keep it white even in Android night mode.
    // Its role must not be inferred as text from that white value; a04 is the modern page token.
    private static final int TIKTOK_PAGE_BACKGROUND = 0x7f06001c;
    private static final int TIKTOK_PAGE_FLAT_BACKGROUND = 0x7f06039b;

    /** Resource ids are stable for the process; semantic role stays stable across palette changes. */
    private static final ConcurrentHashMap<Integer, Integer> ROLE_CACHE = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Method> CONVERTER_METHOD_CACHE =
            new ConcurrentHashMap<>();
    private static final AtomicInteger TOKEN_LOG_BUDGET = new AtomicInteger(64);

    private static volatile boolean contextPrimed;

    private ThemeColorResolver() {}

    /**
     * @return BlueIT color override, or null to let TikTok's original TUX resolver continue.
     */
    public static Integer resolve(int tokenId, Context context, String patchDefaultPreset) {
        try {
            if (context == null || tokenId == 0) return null;

            primeContext(context);
            String preset = ThemeStateStore.initialize(context, patchDefaultPreset);
            if ("default".equals(preset)) return null;

            return resolveMappedColor(tokenId, context);
        } catch (Throwable ignored) {
            // A visual override must always fail open to TikTok's stock resolver.
            return null;
        }
    }

    /**
     * TUX 46.7.3's generic resolver accepts a Function1 that converts a resolved TypedValue to the
     * caller's requested type. Build a real color TypedValue and let TikTok's converter produce the
     * expected result type instead of returning an Integer blindly.
     */
    public static Object resolveGeneric(
            int tokenId,
            Context context,
            Object converter,
            String patchDefaultPreset
    ) {
        try {
            if (converter == null) return null;
            Integer color = resolve(tokenId, context, patchDefaultPreset);
            if (color == null) return null;

            Method invoke = converterMethod(converter);
            if (invoke == null) return null;

            TypedValue value = new TypedValue();
            value.type = TypedValue.TYPE_INT_COLOR_ARGB8;
            value.data = color;
            value.resourceId = 0;
            return invoke.invoke(converter, value);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Resolves a styled-attribute index through the same semantic mapping. */
    public static Integer resolveFromAttributeArray(
            int index,
            Context context,
            int[] attributes,
            String patchDefaultPreset
    ) {
        try {
            if (attributes == null || index < 0 || index >= attributes.length) return null;
            return resolve(attributes[index], context, patchDefaultPreset);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Integer resolveMappedColor(int tokenId, Context context) {
        Integer cachedRole = ROLE_CACHE.get(tokenId);
        int role;
        String name = null;
        Integer stockColor = null;

        if (cachedRole != null) {
            role = cachedRole;
        } else {
            name = resourceName(tokenId, context);
            role = tokenId == TIKTOK_PAGE_BACKGROUND || tokenId == TIKTOK_PAGE_FLAT_BACKGROUND
                    ? ROLE_BACKGROUND : classifyName(name);

            // dev.8 proved that 46.7.3 normally exposes only obfuscated names. In that case use the
            // actual color TikTok resolves for the attribute. This keeps the hook independent of R
            // entry names while still leaving colorful status/media colors untouched.
            if (role == ROLE_NONE) {
                stockColor = resolveStockColor(tokenId, context);
                role = classifyStockColor(stockColor, context);
            }
            ROLE_CACHE.put(tokenId, role);
            logTokenSample(name, stockColor, role);
        }

        Integer mapped = colorForRole(role, context);
        if (mapped == null) return null;

        // Preserve stronger transparency from TikTok tokens. Theme surfaces may intentionally have
        // their own alpha (Liquid Glass), so use the smaller alpha rather than forcing opacity.
        if (stockColor == null) stockColor = resolveStockColor(tokenId, context);
        if (stockColor != null) {
            int stockAlpha = Color.alpha(stockColor);
            int mappedAlpha = Color.alpha(mapped);
            if (stockAlpha < mappedAlpha) {
                mapped = Color.argb(
                        stockAlpha,
                        Color.red(mapped),
                        Color.green(mapped),
                        Color.blue(mapped)
                );
            }
        }
        return mapped;
    }

    private static Integer colorForRole(int role, Context context) {
        switch (role) {
            case ROLE_BACKGROUND:
                return ThemeEngine.backgroundColor(context);
            case ROLE_SURFACE:
                return ThemeEngine.surfaceColor(context);
            case ROLE_TEXT:
                return ThemeEngine.textColor(context);
            case ROLE_SECONDARY_TEXT:
                return ThemeEngine.secondaryTextColor(context);
            case ROLE_ACCENT:
                return ThemeEngine.accentColor(context);
            case ROLE_DIVIDER:
                return ThemeEngine.dividerColor(context);
            case ROLE_NONE:
            default:
                return null;
        }
    }

    /** Resolve the stock color without calling the patched TUX helper again. */
    private static Integer resolveStockColor(int tokenId, Context context) {
        try {
            TypedValue value = new TypedValue();
            if (context.getTheme() != null && context.getTheme().resolveAttribute(tokenId, value, true)) {
                if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                        && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                    return value.data;
                }
                if (value.resourceId != 0) {
                    Integer color = readColorResource(context, value.resourceId);
                    if (color != null) return color;
                }
            }
        } catch (Throwable ignored) {
        }

        // Some callers pass a color resource id rather than an attr id.
        return readColorResource(context, tokenId);
    }

    private static Integer readColorResource(Context context, int resourceId) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                return context.getResources().getColor(resourceId, context.getTheme());
            }
            return context.getResources().getColor(resourceId);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Infer only roles that are safe to infer from color appearance.
     *
     * TikTok's page/surface/text/divider tokens are neutral or nearly neutral in both stock modes.
     * Success/error/warning/media colors are chromatic, so they intentionally fall through. The
     * brand pink is matched narrowly and mapped to the active accent.
     */
    private static int classifyStockColor(Integer stockColor, Context context) {
        if (stockColor == null) return ROLE_NONE;

        int color = stockColor;
        int alpha = Color.alpha(color);
        if (alpha == 0) return ROLE_NONE;

        int opaque = Color.rgb(Color.red(color), Color.green(color), Color.blue(color));

        // Narrow brand-accent match; do not swallow generic red/error colors.
        if (rgbDistance(opaque, TIKTOK_ACCENT) <= 34.0) {
            return ROLE_ACCENT;
        }

        int r = Color.red(opaque);
        int g = Color.green(opaque);
        int b = Color.blue(opaque);
        int spread = Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b));

        // TikTok's neutral palette can have a slight blue tint (#161823 etc), but highly colorful
        // values are functional/media colors and must remain native.
        if (spread > 34) return ROLE_NONE;

        boolean dark = stockDarkMode(context);
        double y = perceivedLightness(opaque);

        if (dark) {
            if (y <= 0.045) return ROLE_BACKGROUND;
            if (y <= 0.18) return ROLE_SURFACE;
            if (y >= 0.82) return ROLE_TEXT;
            if (alpha < 100) return ROLE_DIVIDER;
            if (y >= 0.34) return ROLE_SECONDARY_TEXT;
            return ROLE_DIVIDER;
        }

        // Light TikTok uses #161823-ish primary text instead of mathematical black.
        if (rgbDistance(opaque, TIKTOK_LIGHT_TEXT) <= 48.0 || y <= 0.12) {
            return ROLE_TEXT;
        }
        if (y >= 0.965) return ROLE_BACKGROUND;
        if (y >= 0.80) return ROLE_SURFACE;
        if (alpha < 100) return ROLE_DIVIDER;
        if (y <= 0.64) return ROLE_SECONDARY_TEXT;
        return ROLE_DIVIDER;
    }

    private static boolean stockDarkMode(Context context) {
        try {
            int mode = context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK;
            return mode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static double perceivedLightness(int color) {
        double r = Color.red(color) / 255.0;
        double g = Color.green(color) / 255.0;
        double b = Color.blue(color) / 255.0;
        return 0.2126 * r + 0.7152 * g + 0.0722 * b;
    }

    private static double rgbDistance(int first, int second) {
        int dr = Color.red(first) - Color.red(second);
        int dg = Color.green(first) - Color.green(second);
        int db = Color.blue(first) - Color.blue(second);
        return Math.sqrt(dr * dr + dg * dg + db * db);
    }

    private static Method converterMethod(Object converter) {
        Class<?> type = converter.getClass();
        Method cached = CONVERTER_METHOD_CACHE.get(type);
        if (cached != null) return cached;

        try {
            Method method = type.getMethod("invoke", Object.class);
            method.setAccessible(true);
            CONVERTER_METHOD_CACHE.put(type, method);
            return method;
        } catch (Throwable ignored) {
        }

        try {
            for (Method method : type.getMethods()) {
                if ("invoke".equals(method.getName()) && method.getParameterTypes().length == 1) {
                    method.setAccessible(true);
                    CONVERTER_METHOD_CACHE.put(type, method);
                    return method;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void primeContext(Context context) {
        if (contextPrimed) return;
        synchronized (ThemeColorResolver.class) {
            if (contextPrimed) return;
            try {
                Utils.setContext(context);
                contextPrimed = true;
            } catch (Throwable ignored) {
                // Leave false so a later TUX lookup can retry with a fully attached Context.
            }
        }
    }

    private static int classifyName(String name) {
        if (name == null || name.isEmpty()) return ROLE_NONE;

        String token = normalize(name);
        int tuxColorStart = token.indexOf("tuxcolor");
        if (tuxColorStart >= 0) {
            token = token.substring(tuxColorStart + "tuxcolor".length());
        }

        // Obfuscated names such as j3/a0p must not be mistaken for semantic names.
        if (!containsAny(token,
                "bg", "ui", "text", "shape", "page", "sheet", "divider", "separator",
                "border", "stroke", "accent", "placeholder")) {
            return ROLE_NONE;
        }

        if (containsAny(token,
                "imageoverlay", "brandtiktok", "success", "warning", "danger", "error", "info")) {
            return ROLE_NONE;
        }

        if (token.equals("bgprimary")
                || token.equals("uipageflat1")
                || token.equals("uipagegrouped1")) {
            return ROLE_BACKGROUND;
        }

        if (token.equals("bgsecondary")
                || token.startsWith("uipageflat")
                || token.startsWith("uipagegrouped")
                || token.startsWith("uisheetflat")
                || token.startsWith("uishapeneutral")
                || token.startsWith("uishapesecondarymuted")) {
            return ROLE_SURFACE;
        }

        if (token.equals("uitext1")
                || token.equals("uitext1display")
                || token.equals("uitextprimary")
                || token.equals("uitextprimarydisplay")) {
            return ROLE_TEXT;
        }

        if (token.equals("uitext2")
                || token.equals("uitext3")
                || token.equals("uitext3color")
                || token.equals("uitextplaceholder")
                || token.contains("placeholder")
                || token.contains("textsecondary")) {
            return ROLE_SECONDARY_TEXT;
        }

        if (token.equals("uishapeprimary")
                || token.equals("accent")
                || token.equals("accentprimary")) {
            return ROLE_ACCENT;
        }

        if (containsAny(token, "divider", "separator", "border", "stroke")) {
            return ROLE_DIVIDER;
        }

        return ROLE_NONE;
    }

    private static String resourceName(int tokenId, Context context) {
        try {
            return context.getResources().getResourceEntryName(tokenId);
        } catch (Throwable ignored) {
        }

        try {
            return context.getResources().getResourceName(tokenId);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void logTokenSample(String name, Integer stockColor, int role) {
        try {
            if (TOKEN_LOG_BUDGET.getAndDecrement() <= 0) return;
            final String token = (name == null || name.isEmpty()) ? "?" : name;
            final String stock = stockColor == null
                    ? "unresolved"
                    : String.format(Locale.ROOT, "#%08X", stockColor);
            final String message = "[BlueIT Theme TUX] token=" + token
                    + " stock=" + stock
                    + " role=" + roleName(role);
            Logger.printInfo(() -> message);
        } catch (Throwable ignored) {
        }
    }

    private static String roleName(int role) {
        switch (role) {
            case ROLE_BACKGROUND:
                return "background";
            case ROLE_SURFACE:
                return "surface";
            case ROLE_TEXT:
                return "text";
            case ROLE_SECONDARY_TEXT:
                return "secondary-text";
            case ROLE_ACCENT:
                return "accent";
            case ROLE_DIVIDER:
                return "divider";
            default:
                return "native";
        }
    }

    private static String normalize(String value) {
        if (value == null || value.isEmpty()) return "";
        String lower = value.toLowerCase(Locale.ROOT);
        StringBuilder result = new StringBuilder(lower.length());
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')) {
                result.append(c);
            }
        }
        return result.toString();
    }

    private static boolean containsAny(String value, String... tokens) {
        for (String token : tokens) {
            if (value.contains(token)) return true;
        }
        return false;
    }
}
