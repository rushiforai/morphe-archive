package app.danielthemaniel.patches.campfire.extension;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Rewrites hard-coded colors in Campfire's CSS so they follow the Material You palette that
 * MaterialYou injects as CSS variables.
 *
 * Runs at serve time (WebViewLocalServer.handleLocalRequest) instead of patch time because the
 * app downloads OTA web bundles (Capgo) from nianticlabs.com and serves them from storage;
 * patching the APK's assets alone would leave every updated bundle unthemed.
 *
 * Every replacement keeps the original color as a fallback, so the CSS looks stock when the
 * variables are absent (Android < 12).
 */
@SuppressWarnings("unused")
public final class ThemeCss {
    private ThemeCss() {}

    private static final int CI = Pattern.CASE_INSENSITIVE;

    private static final Pattern PRIMARY_SHADE = Pattern.compile("#13a5d3\\b", CI);
    private static final Pattern PRIMARY_TINT = Pattern.compile("#2dc3f2\\b", CI);
    private static final Pattern PRIMARY_RGB = Pattern.compile("(--ion-color-primary-rgb:)22,188,240");
    private static final Pattern WHITE_SURFACE = Pattern.compile(
        "((?:--)?background(?:-color|-hover|-activated|-focused)?:)#fff(?:fff)?(?=[;}!])", CI);
    private static final Pattern GREY_SURFACE = Pattern.compile(
        "((?:--)?background(?:-color)?:)(#e4e7eb|#f1f2f4)(?=[;}!])", CI);
    private static final Pattern GREY_TEXT = Pattern.compile("(^|[;{])color:#333(?=[;}!])");

    /** Background declarations: property, value. */
    private static final Pattern BACKGROUND_DECL = Pattern.compile(
        "(?<=[{;])((?:--[\\w-]*)?background[\\w-]*):([^;{}]*)", CI);
    /** Foreground declarations: color / fill / stroke and *text* / *icon* custom properties. */
    private static final Pattern FOREGROUND_DECL = Pattern.compile(
        "(?<=[{;])(color|fill|stroke|--[\\w-]*(?:text|icon)[\\w-]*):([^;{}]*)", CI);
    /** A declaration block (no nesting). */
    private static final Pattern BLOCK = Pattern.compile("\\{([^{}]*)\\}");
    /** Backdrops whose content the app draws in --ion-color-white ("white on dark/grey"). */
    private static final Pattern ON_DARK_BACKDROP = Pattern.compile(
        "(?:^|;)background(?:-color)?:(?:var\\(--c-app-tab-bar-v2-background-color\\)"
            // translucent black, alpha >= 25%: #000000[40-ff] or #000[4-f]
            + "|#000000[4-9a-f][0-9a-f]\\b|#000[4-9a-f]\\b)", CI);

    private static final Pattern HEX = Pattern.compile(
        "#([0-9a-f]{8}|[0-9a-f]{6}|[0-9a-f]{3,4})\\b", CI);

    /** Already rewritten (e.g. a bundle that went through the patch-time rewrite)? */
    public static boolean isThemed(String css) {
        return css.contains("--my-");
    }

    public static String rewrite(String css) {
        if (isThemed(css)) return css;

        String out = css;
        out = themeHex(out, "16bcf0", "primary"); // brand cyan
        out = themeHex(out, "2f496d", "text");    // navy text / icons
        out = themeHex(out, "4b5e78", "slate");   // secondary text, dividers, overlays
        out = themeHex(out, "97a4b6", "outline"); // muted icons / placeholder text

        out = PRIMARY_SHADE.matcher(out).replaceAll("var(--my-primary-shade,#13a5d3)");
        out = PRIMARY_TINT.matcher(out).replaceAll("var(--my-primary-tint,#2dc3f2)");
        out = PRIMARY_RGB.matcher(out).replaceAll("$1var(--my-primary-rgb,22,188,240)");

        out = WHITE_SURFACE.matcher(out).replaceAll("$1var(--my-surface,#fff)");
        out = GREY_SURFACE.matcher(out).replaceAll("$1var(--my-surface-variant,$2)");
        out = GREY_TEXT.matcher(out).replaceAll("$1color:var(--my-text,#333)");

        // Remaining light surfaces / dark foregrounds: mixed toward the theme so they keep a hint
        // of their hue. --my-light-mix / --my-dark-mix are 100% in light mode (= original color).
        out = mixDeclarations(out, BACKGROUND_DECL, true);
        out = mixDeclarations(out, FOREGROUND_DECL, false);
        out = lightContentOnDarkBackdrops(out);
        return out;
    }

    /**
     * The app uses --ion-color-white both as the card surface and as the content color on
     * grey/dark backdrops (floating tab bar: icons and the game label; translucent-black blur
     * menus). With a dark surface the latter turns dark-on-dark, so blocks that paint such a
     * backdrop get a local --ion-color-white that stays light; their contents inherit it.
     */
    private static String lightContentOnDarkBackdrops(String css) {
        Matcher m = BLOCK.matcher(css);
        StringBuffer sb = new StringBuffer(css.length() + 512);
        while (m.find()) {
            String body = m.group(1);
            String block = m.group();
            if (ON_DARK_BACKDROP.matcher(body).find()) {
                block = "{" + body + (body.isEmpty() || body.endsWith(";") ? "" : ";")
                    + "--ion-color-white:var(--my-on-dark,#fff);"
                    + "--ion-color-white-rgb:var(--my-on-dark-rgb,255,255,255);"
                    + "--ion-color-white-contrast:var(--my-on-dark-contrast,#2f496d)}";
            }
            m.appendReplacement(sb, Matcher.quoteReplacement(block));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /**
     * #RRGGBB -> var(--my-NAME, #RRGGBB) and #RRGGBBAA -> rgba(var(--my-NAME-rgb, r,g,b), a).
     */
    private static String themeHex(String css, String hex, String name) {
        int r = Integer.parseInt(hex.substring(0, 2), 16);
        int g = Integer.parseInt(hex.substring(2, 4), 16);
        int b = Integer.parseInt(hex.substring(4, 6), 16);

        Matcher m = Pattern.compile("#" + hex + "([0-9a-f]{2})\\b", CI).matcher(css);
        StringBuffer sb = new StringBuffer(css.length() + 256);
        while (m.find()) {
            double alpha = Integer.parseInt(m.group(1), 16) / 255.0;
            String repl = "rgba(var(--my-" + name + "-rgb," + r + "," + g + "," + b + "),"
                + String.format(Locale.ROOT, "%.3f", alpha) + ")";
            m.appendReplacement(sb, Matcher.quoteReplacement(repl));
        }
        m.appendTail(sb);

        return Pattern.compile("#" + hex + "\\b", CI).matcher(sb.toString())
            .replaceAll(Matcher.quoteReplacement("var(--my-" + name + ",#" + hex + ")"));
    }

    /**
     * Background: light (luminance > 0.8), mostly-opaque hex ->
     *   color-mix(in srgb, <orig> var(--my-light-mix,100%), var(--my-surface,#fff))
     * Foreground: dark (luminance < 0.3), mostly-opaque hex ->
     *   color-mix(in srgb, <orig> var(--my-dark-mix,100%), var(--my-text,<orig>))
     * Hex colors inside var() fallbacks are left alone.
     */
    private static String mixDeclarations(String css, Pattern declaration, boolean background) {
        Matcher decl = declaration.matcher(css);
        StringBuffer sb = new StringBuffer(css.length() + 1024);
        while (decl.find()) {
            String property = decl.group(1);
            String value = decl.group(2);
            String lower = property.toLowerCase(Locale.ROOT);
            if (!background && (lower.contains("contrast") || lower.contains("shadow"))) {
                decl.appendReplacement(sb, Matcher.quoteReplacement(decl.group()));
                continue;
            }

            Matcher hex = HEX.matcher(value);
            StringBuilder newValue = new StringBuilder(value.length() + 64);
            int last = 0;
            while (hex.find()) {
                newValue.append(value, last, hex.start());
                String h = hex.group();
                boolean replace = !insideVar(value, hex.start())
                    && (background ? isLight(hex.group(1)) : isDark(hex.group(1)));
                if (!replace) {
                    newValue.append(h);
                } else if (background) {
                    newValue.append("color-mix(in srgb,").append(h)
                        .append(" var(--my-light-mix,100%),var(--my-surface,#fff))");
                } else {
                    newValue.append("color-mix(in srgb,").append(h)
                        .append(" var(--my-dark-mix,100%),var(--my-text,").append(h).append("))");
                }
                last = hex.end();
            }
            newValue.append(value.substring(last));
            decl.appendReplacement(sb, Matcher.quoteReplacement(property + ":" + newValue));
        }
        decl.appendTail(sb);
        return sb.toString();
    }

    /** Whether index sits inside a var(...) call, i.e. is a fallback value. */
    private static boolean insideVar(String value, int index) {
        int depth = 0;
        for (int i = index - 1; i >= 0; i--) {
            char c = value.charAt(i);
            if (c == ')') {
                depth++;
            } else if (c == '(') {
                if (depth == 0) {
                    if (value.substring(0, i).endsWith("var")) return true;
                } else {
                    depth--;
                }
            }
        }
        return false;
    }

    /** {luminance, alpha}, or null if alpha < 50%. */
    private static double[] parse(String hex) {
        String full = hex;
        if (hex.length() <= 4) {
            StringBuilder sb = new StringBuilder(8);
            for (char c : hex.toCharArray()) sb.append(c).append(c);
            full = sb.toString();
        }
        int alpha = full.length() == 8 ? Integer.parseInt(full.substring(6, 8), 16) : 255;
        if (alpha < 0x80) return null;
        double r = Integer.parseInt(full.substring(0, 2), 16) / 255.0;
        double g = Integer.parseInt(full.substring(2, 4), 16) / 255.0;
        double b = Integer.parseInt(full.substring(4, 6), 16) / 255.0;
        return new double[] {0.2126 * r + 0.7152 * g + 0.0722 * b, alpha};
    }

    private static boolean isLight(String hex) {
        double[] p = parse(hex);
        return p != null && p[0] > 0.8;
    }

    private static boolean isDark(String hex) {
        double[] p = parse(hex);
        return p != null && p[0] < 0.3;
    }
}
