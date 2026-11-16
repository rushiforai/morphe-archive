package app.danielthemaniel.patches.campfire.extension;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.util.Log;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/**
 * Builds Ionic CSS variables from the Android 12+ Monet palette and hands them to the WebView:
 *
 *  - appendTheme(): appended to Capacitor's injected bridge script (JSInjector.getScriptString()),
 *    so every page load starts with the right palette.
 *  - filterResponse(): hooked into WebViewLocalServer.handleLocalRequest, rewrites hard-coded
 *    colors in every stylesheet as it is served (see ThemeCss) — including OTA web bundles.
 *  - onBridgeResume() / onConfigurationChanged(): paint the native WebView background (the
 *    app's html/body are transparent, so it shows through) and, on uiMode changes, re-theme
 *    the open page (MainActivity handles uiMode itself, so the page is not reloaded).
 *
 * Tone map (system_*_N): 0=100, 10=99, 50=95, 100=90, 200=80, ... 600=40, 700=30, 800=20, 900=10.
 * The tonal palettes are the same in light and dark; only which tones we pick changes.
 *
 * Campfire's palette roles vs. Material 3:
 *   primary   (brand cyan)        -> accent1        light tone 40 / dark tone 80
 *   secondary (contrasting orange) -> accent3        (M3's contrasting-hue accent)
 *   tertiary  (same-hue blue)      -> accent2
 *   dark / text (navy)             -> neutral2 20   / neutral1 90
 * success/warning/danger and game-brand colors (purple, green, yellow, niantic-orange, ...) are
 * left alone so their meaning survives.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    private static final String TAG = "CampfireMaterialYou";
    private static final String STYLE_ID = "morphe-material-you";

    private MaterialYou() {}

    // ---------------------------------------------------------------------------------------
    // Hooks
    // ---------------------------------------------------------------------------------------

    /** Called on every return of JSInjector.getScriptString(). Never throws. */
    public static String appendTheme(String script) {
        try {
            Context ctx = application();
            if (ctx == null || !supported()) return script;
            String css = buildCss(ctx, isNight(ctx.getResources().getConfiguration()));
            return script + "\n\n" + applyJs(css);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to build Material You theme", t);
            return script;
        }
    }

    /** Called at the start of Bridge.onConfigurationChanged(Configuration). Never throws. */
    public static void onConfigurationChanged(Object bridge, Configuration config) {
        try {
            Context ctx = application();
            if (ctx == null || !supported() || config == null) return;
            WebView webView = webView(bridge);
            if (webView == null) return;
            boolean night = isNight(config);
            webView.setBackgroundColor(backgroundColor(ctx, night));
            webView.evaluateJavascript(applyJs(buildCss(ctx, night)), null);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to re-theme on configuration change", t);
        }
    }

    /** Called at the start of Bridge.onResume(). Never throws. */
    public static void onBridgeResume(Object bridge) {
        try {
            Context ctx = application();
            if (ctx == null || !supported()) return;
            WebView webView = webView(bridge);
            if (webView == null) return;
            webView.setBackgroundColor(
                backgroundColor(ctx, isNight(ctx.getResources().getConfiguration())));
        } catch (Throwable t) {
            Log.e(TAG, "Failed to paint WebView background", t);
        }
    }

    /**
     * Called on every return of WebViewLocalServer.handleLocalRequest(). Rewrites stylesheets,
     * passes everything else through untouched. Never throws.
     */
    public static WebResourceResponse filterResponse(WebResourceResponse response) {
        if (response == null || !supported()) return response;
        String mime = response.getMimeType();
        if (mime == null || !mime.startsWith("text/css")) return response;

        byte[] original = null;
        try {
            InputStream in = response.getData();
            if (in == null) return response;
            original = readAll(in);
            String css = new String(original, StandardCharsets.UTF_8);
            byte[] patched = ThemeCss.rewrite(css).getBytes(StandardCharsets.UTF_8);
            response.setData(new ByteArrayInputStream(patched));
        } catch (Throwable t) {
            Log.e(TAG, "Failed to theme stylesheet", t);
            if (original != null) response.setData(new ByteArrayInputStream(original));
        }
        return response;
    }

    // ---------------------------------------------------------------------------------------
    // Palette
    // ---------------------------------------------------------------------------------------

    private static int backgroundColor(Context c, boolean dark) {
        return c.getColor(dark ? android.R.color.system_neutral1_900 : android.R.color.system_neutral1_50);
    }

    private static String buildCss(Context c, boolean dark) {
        int primary, onPrimary, secondary, onSecondary, tertiary, onTertiary;
        int text, onText, background, surface, surfaceVariant;
        int medium, onMedium, light, onLight, slate, outline;
        int tabBar = c.getColor(dark ? android.R.color.system_neutral2_700 : android.R.color.system_neutral2_400);
        int onDark = c.getColor(android.R.color.system_neutral1_10);

        if (!dark) {
            primary = c.getColor(android.R.color.system_accent1_600);
            onPrimary = c.getColor(android.R.color.system_accent1_0);
            secondary = c.getColor(android.R.color.system_accent3_600);
            onSecondary = c.getColor(android.R.color.system_accent3_0);
            tertiary = c.getColor(android.R.color.system_accent2_600);
            onTertiary = c.getColor(android.R.color.system_accent2_0);

            text = c.getColor(android.R.color.system_neutral2_800);
            onText = c.getColor(android.R.color.system_neutral1_0);
            background = c.getColor(android.R.color.system_neutral1_50);
            surface = c.getColor(android.R.color.system_neutral1_10);
            surfaceVariant = c.getColor(android.R.color.system_neutral2_100);
            medium = c.getColor(android.R.color.system_neutral2_500);
            onMedium = c.getColor(android.R.color.system_neutral1_1000);
            light = c.getColor(android.R.color.system_neutral2_200);
            onLight = c.getColor(android.R.color.system_neutral2_700);
            slate = c.getColor(android.R.color.system_neutral2_700);
            outline = c.getColor(android.R.color.system_neutral2_400);
        } else {
            primary = c.getColor(android.R.color.system_accent1_200);
            onPrimary = c.getColor(android.R.color.system_accent1_800);
            secondary = c.getColor(android.R.color.system_accent3_200);
            onSecondary = c.getColor(android.R.color.system_accent3_800);
            tertiary = c.getColor(android.R.color.system_accent2_200);
            onTertiary = c.getColor(android.R.color.system_accent2_800);

            text = c.getColor(android.R.color.system_neutral1_100);
            onText = c.getColor(android.R.color.system_neutral1_900);
            background = c.getColor(android.R.color.system_neutral1_900);
            surface = c.getColor(android.R.color.system_neutral1_800);
            surfaceVariant = c.getColor(android.R.color.system_neutral2_700);
            medium = c.getColor(android.R.color.system_neutral2_400);
            onMedium = c.getColor(android.R.color.system_neutral1_1000);
            light = c.getColor(android.R.color.system_neutral2_700);
            onLight = c.getColor(android.R.color.system_neutral2_200);
            slate = c.getColor(android.R.color.system_neutral2_300);
            outline = c.getColor(android.R.color.system_neutral2_500);
        }

        StringBuilder sb = new StringBuilder(6144);
        // :root:root outranks the app's :root palette. The body selector (id-level specificity
        // via :not(#...)) outranks body-class themes like "discovery" (cream background) and
        // the game themes, which set their own variables on <body>.
        sb.append(":root:root,html:root body:not(#morphe-my){");
        put(sb, "color-scheme", dark ? "dark" : "light");

        ionColor(sb, "primary", primary, onPrimary);
        ionColor(sb, "secondary", secondary, onSecondary);
        ionColor(sb, "tertiary", tertiary, onTertiary);
        ionColor(sb, "dark", text, onText);
        ionColor(sb, "medium", medium, onMedium);
        ionColor(sb, "light", light, onLight);
        ionColor(sb, "white", surface, text);

        // Translucent text-ish colors the app defines with alpha.
        put(sb, "--ion-color-blue-grey", hex(text) + "80");
        put(sb, "--ion-color-slate", hex(slate) + "cc");

        put(sb, "--ion-background-color", hex(background));
        put(sb, "--ion-background-color-rgb", rgb(background));
        put(sb, "--ion-text-color", hex(text));
        put(sb, "--ion-text-color-rgb", rgb(text));
        put(sb, "--ion-card-background", hex(surface));

        // Ionic's step scale is a blend from background to text.
        for (int step = 50; step <= 950; step += 50) {
            put(sb, "--ion-color-step-" + step, hex(mix(background, text, step / 1000f)));
        }

        // Palette entries the body-class themes build their backgrounds/text from.
        ionColor(sb, "cream", background, text);
        ionColor(sb, "slate-900", text, onText);
        ionColor(sb, "slate-600", slate, onText);
        ionColor(sb, "slate-500", medium, onMedium);
        ionColor(sb, "slate-300", outline, text);
        ionColor(sb, "slate-100", surfaceVariant, text);
        put(sb, "--ion-background-color-contrast", hex(text));
        put(sb, "--ion-background-color-shade", hex(shade(background)));
        put(sb, "--ion-background-color-tint", hex(tint(background)));

        // App-specific variables that hard-code light surfaces.
        put(sb, "--c-page-background", hex(background));
        put(sb, "--c-chat-card-background", hex(surface));
        put(sb, "--c-chat-card-background-rgb", rgb(surface));
        put(sb, "--c-chat-mention-picker-background-color", hex(surface));
        put(sb, "--c-chat-reaction-background-color", hex(surfaceVariant));
        // Floating tab bar: a mid tone so its light content (see ThemeCss) reads in both modes.
        put(sb, "--c-app-tab-bar-v2-background-color", hex(tabBar));
        put(sb, "--c-ui-card-flexible-background-color", "var(--ion-color-white)");
        put(sb, "--c-ui-card-flexible-text-color", "var(--ion-text-color)");
        put(sb, "--toastify-color-light", hex(surface));
        put(sb, "--toastify-text-color-light", hex(text));

        // Light hard-coded backgrounds are rewritten at patch time to
        // color-mix(<orig> var(--my-light-mix), var(--my-surface)): original in light mode,
        // a dark surface faintly tinted with the original hue in dark mode.
        put(sb, "--my-light-mix", dark ? "14%" : "100%");
        // ...and dark hard-coded text/icons mixed toward the theme text color.
        put(sb, "--my-dark-mix", dark ? "12%" : "100%");

        // App-specific variables that hard-code the brand cyan or white.
        put(sb, "--c-chat-link-color", hex(primary));
        put(sb, "--c-chat-action-color", hex(primary));
        put(sb, "--c-user-profile-fragment-btn-gradient",
            "linear-gradient(0deg,rgba(" + rgb(background) + ",1),rgba(" + rgb(background) + ",.67) 77%,rgba("
                + rgb(background) + ",0))");

        // Targets of the patch-time CSS rewrite (see MaterialYouThemePatch.kt).
        theme(sb, "primary", primary);
        put(sb, "--my-primary-shade", hex(shade(primary)));
        put(sb, "--my-primary-tint", hex(tint(primary)));
        theme(sb, "text", text);
        theme(sb, "slate", slate);
        theme(sb, "outline", outline);
        // Light content on dark/grey backdrops (tab bar, blur menus).
        theme(sb, "on-dark", onDark);
        put(sb, "--my-on-dark-contrast", hex(text));
        put(sb, "--my-surface", hex(surface));
        put(sb, "--my-surface-variant", hex(surfaceVariant));
        sb.append('}');

        sb.append("html{background:var(--ion-background-color);}");

        // SVG icons rendered from JS with hard-coded fill/stroke attributes. A CSS rule beats a
        // presentation attribute, so these follow the palette without touching the JS bundles.
        sb.append("[fill=\"#2f496d\" i]{fill:var(--my-text);}");
        sb.append("[stroke=\"#2f496d\" i]{stroke:var(--my-text);}");
        sb.append("[fill=\"#97a4b6\" i]{fill:var(--my-outline);}");
        sb.append("[fill=\"#16bcf0\" i]{fill:var(--my-primary);}");

        return sb.toString();
    }

    /** --my-NAME and --my-NAME-rgb, for the rewritten #RRGGBB / #RRGGBBAA literals. */
    private static void theme(StringBuilder sb, String name, int color) {
        put(sb, "--my-" + name, hex(color));
        put(sb, "--my-" + name + "-rgb", rgb(color));
    }

    /** The six variables Ionic expects for each named color. */
    private static void ionColor(StringBuilder sb, String name, int base, int contrast) {
        String p = "--ion-color-" + name;
        put(sb, p, hex(base));
        put(sb, p + "-rgb", rgb(base));
        put(sb, p + "-contrast", hex(contrast));
        put(sb, p + "-contrast-rgb", rgb(contrast));
        put(sb, p + "-shade", hex(shade(base)));
        put(sb, p + "-tint", hex(tint(base)));
    }

    private static void put(StringBuilder sb, String name, String value) {
        sb.append(name).append(':').append(value).append(';');
    }

    // ---------------------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------------------

    private static WebView webView(Object bridge) throws Exception {
        if (bridge == null) return null;
        return (WebView) bridge.getClass().getMethod("getWebView").invoke(bridge);
    }

    private static byte[] readAll(InputStream in) throws java.io.IOException {
        try (InputStream input = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream(64 * 1024);
            byte[] buffer = new byte[16 * 1024];
            int n;
            while ((n = input.read(buffer)) != -1) out.write(buffer, 0, n);
            return out.toByteArray();
        }
    }

    /** Creates the <style> on first run, replaces its contents afterwards. */
    private static String applyJs(String css) {
        return "(function(){try{"
            + "var s=document.getElementById('" + STYLE_ID + "');"
            + "if(!s){s=document.createElement('style');s.id='" + STYLE_ID + "';"
            + "(document.head||document.documentElement).appendChild(s);}"
            + "s.textContent=" + jsString(css) + ";"
            + "}catch(e){console.error('[MaterialYou]',e);}})();";
    }

    private static boolean supported() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    private static boolean isNight(Configuration config) {
        return (config.uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    // Ionic's own generator: shade = 12% toward black, tint = 10% toward white.
    private static int shade(int c) { return mix(c, 0xFF000000, 0.12f); }
    private static int tint(int c) { return mix(c, 0xFFFFFFFF, 0.10f); }

    private static int mix(int from, int to, float t) {
        int r = Math.round(((from >> 16) & 0xFF) * (1 - t) + ((to >> 16) & 0xFF) * t);
        int g = Math.round(((from >> 8) & 0xFF) * (1 - t) + ((to >> 8) & 0xFF) * t);
        int b = Math.round((from & 0xFF) * (1 - t) + (to & 0xFF) * t);
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }

    private static String hex(int c) {
        return String.format(Locale.ROOT, "#%06x", c & 0xFFFFFF);
    }

    private static String rgb(int c) {
        return ((c >> 16) & 0xFF) + "," + ((c >> 8) & 0xFF) + "," + (c & 0xFF);
    }

    /** Single-quoted JS string literal. The CSS contains double quotes, never single quotes or newlines. */
    private static String jsString(String s) {
        return "'" + s.replace("\\", "\\\\").replace("'", "\\'") + "'";
    }

    /** JSInjector has no Context; ActivityThread.currentApplication() is on the public SDK greylist. */
    private static Context application() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication")
                .invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "No application context", t);
            return null;
        }
    }
}
