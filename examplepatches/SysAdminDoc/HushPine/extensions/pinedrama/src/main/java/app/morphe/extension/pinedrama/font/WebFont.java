/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.font;

import android.content.Context;
import android.os.SystemClock;
import android.util.Base64;
import android.webkit.WebView;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.privacy.BrowserPrivacyGuard;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * Carries Use system font and Use an imported font into TikTok's web pages (issue #7).
 *
 * <p>Activity center, Watch history, Comment history and a few other screens are PineDrama web
 * pages in a WebView (SparkActivity), styled with PineDrama's own web font, so the native font
 * engine {@link SystemFont} stands in never sees them. The patch calls {@link #onPageFinished}
 * from every PineDrama WebViewClient's page-finished and page-visible callbacks, and on PineDrama's own
 * pages this puts one style element in the document that sets every text element's family.
 * Pages anywhere else, the in-app browser's included, are left alone.
 *
 * <p>An imported font, or one picked in a Galaxy's settings ({@link PickedFont}), goes in as a
 * data URL, so the page needs no file access. A file over {@link #MAX_INLINE_BYTES} would make
 * every page load carry megabytes of text, so with one of those the pages get the device font
 * instead.
 */
public final class WebFont {
    private static final String HOOK_FAMILY = "web font";
    static final String STYLE_ID = "hushpine-font";
    static final String IMPORTED_FAMILY = "HushPine imported";
    static final String PICKED_FAMILY = "HushPine picked";
    static final long MAX_INLINE_BYTES = 2L * 1024 * 1024;

    /** Every text element, leaving SVG and icon glyph elements in the page's own font. */
    private static final String SELECTOR = "html body,html body *:not(svg):not(svg *)"
            + ":not([class*=\"icon\" i]):not([class*=\"icon\" i] *)";

    /**
     * PineDrama's hybrid kit hands one page event down a chain of its WebViewClients, each of them
     * hooked, so a page is styled once per event and the repeats within this window are skipped.
     */
    static final long REPEAT_WINDOW_MS = 500;

    private static final Object LOCK = new Object();
    /** The imported face as a data URL, keyed on the file it was read from. */
    private static String cachedKey;
    private static String cachedUrl;
    /** Each WebView's last styled page and when, so the chain's repeats are skipped. */
    private static final Map<WebView, String> lastUrl = new WeakHashMap<>();
    private static final Map<WebView, Long> lastAt = new WeakHashMap<>();

    private WebFont() {}

    /** Called at the start of PineDrama's page-finished and page-visible callbacks. Never throws. */
    public static void onPageFinished(WebView webView, String url) {
        try {
            if (webView == null || !BrowserPrivacyGuard.isTrustedAppPage(url)) return;
            String css = styleSheet(webView.getContext());
            HookStatus.bound(HOOK_FAMILY, css == null ? "tiktok"
                    : css.contains(IMPORTED_FAMILY) ? "imported"
                    : css.contains(PICKED_FAMILY) ? "picked" : "system");
            if (css == null || isRepeat(webView, url)) return;
            webView.evaluateJavascript(script(css), null);
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "onPageFinished", failure);
        }
    }

    private static boolean isRepeat(WebView webView, String url) {
        long now = SystemClock.uptimeMillis();
        synchronized (LOCK) {
            Long at = lastAt.get(webView);
            boolean repeat = at != null && now - at < REPEAT_WINDOW_MS && url.equals(lastUrl.get(webView));
            if (!repeat) {
                lastUrl.put(webView, url);
                lastAt.put(webView, now);
            }
            return repeat;
        }
    }

    /**
     * The style sheet the switches ask for, or null to leave the page in PineDrama's font. Follows
     * {@link SystemFont#replacementFamily()}: an imported font that loads wins, then the device
     * font while Use system font is on. A font picked in a Galaxy's settings is the device font
     * in PineDrama's own text but not in a WebView, so it goes in as a face of its own.
     */
    static String styleSheet(Context context) {
        return styleSheet(context, PickedFont.file());
    }

    static String styleSheet(Context context, File pickedFont) {
        if (Settings.IMPORTED_FONT.get() && ImportedFont.typeface() != null) {
            String face = importedFaceUrl(ImportedFont.file(context));
            if (face != null) return withFace(IMPORTED_FAMILY, face);
            return rule("sans-serif");
        }
        if (!Settings.SYSTEM_FONT.get()) return null;
        String picked = importedFaceUrl(pickedFont);
        return picked != null ? withFace(PICKED_FAMILY, picked) : rule("sans-serif");
    }

    private static String withFace(String family, String url) {
        return "@font-face{font-family:\"" + family + "\";src:url(" + url + ");}"
                + rule("\"" + family + "\",sans-serif");
    }

    private static String rule(String family) {
        return SELECTOR + "{font-family:" + family + " !important}";
    }

    /**
     * Puts {@code css} in the page's one HushPine style element, adding it the first time, so a
     * page told twice still has one.
     */
    static String script(String css) {
        return "(function(){var d=document,s=d.getElementById('" + STYLE_ID + "');"
                + "if(!s){s=d.createElement('style');s.id='" + STYLE_ID + "';"
                + "(d.head||d.documentElement).appendChild(s);}"
                + "s.textContent=" + JSONObject.quote(css) + ";})();";
    }

    /** The font as a data URL, or null when it's missing, too large or unreadable. */
    static String importedFaceUrl(File file) {
        if (file == null || !file.isFile()) return null;
        long length = file.length();
        if (length <= 0 || length > MAX_INLINE_BYTES) return null;
        String key = file.getAbsolutePath() + ':' + length + ':' + file.lastModified();
        synchronized (LOCK) {
            if (key.equals(cachedKey)) return cachedUrl;
            String url;
            try {
                url = "data:" + mimeType(file.getName()) + ";base64,"
                        + Base64.encodeToString(read(file, (int) length), Base64.NO_WRAP);
            } catch (IOException failure) {
                HookStatus.threw(HOOK_FAMILY, "read", failure);
                url = null;
            }
            cachedKey = key;
            cachedUrl = url;
            return url;
        }
    }

    private static String mimeType(String name) {
        if (name.endsWith(".otf")) return "font/otf";
        if (name.endsWith(".ttc")) return "font/collection";
        return "font/ttf";
    }

    private static byte[] read(File file, int length) throws IOException {
        byte[] bytes = new byte[length];
        try (InputStream input = new FileInputStream(file)) {
            int offset = 0;
            while (offset < length) {
                int count = input.read(bytes, offset, length - offset);
                if (count < 0) throw new IOException("Font file ended early");
                offset += count;
            }
        }
        return bytes;
    }
}
