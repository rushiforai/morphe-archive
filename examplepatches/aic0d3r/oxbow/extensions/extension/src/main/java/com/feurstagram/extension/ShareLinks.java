package com.feurstagram.extension;

import android.content.ClipData;
import android.os.Bundle;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Clean share links: strips Instagram's tracking parameters (igsh, utm_*, ...) from every
 * Instagram URL that leaves the app, through the clipboard or a share intent.
 *
 * The server hands out links that already carry igsh, through several routes, so the hooks
 * sit where text goes out instead: every ClipData.newPlainText / ClipboardManager.setText
 * call in the app is redirected here, plus the share-intent builder's EXTRA_TEXT.
 * Only the URLs inside the text are touched; anything else (backup codes...) is kept as is.
 */
public final class ShareLinks {

    private ShareLinks() {}

    private static final Pattern IG_URL = Pattern.compile(
            "https?://(?:www\\.)?(?:instagram\\.com|instagr\\.am|ig\\.me)/[^\\s\"'<>]*",
            Pattern.CASE_INSENSITIVE);

    /**
     * Query parameters that change what an Instagram link opens. Everything else is tracking
     * (igsh, igshid, utm_*, obrf...): an allowlist, because Instagram keeps adding new ones.
     */
    private static final Pattern FUNCTIONAL = Pattern.compile(
            "^(?:img_index|story_media_id|comment_id|hl)$", Pattern.CASE_INSENSITIVE);

    /** Returns {@code text} itself when nothing changed (keeps any styling). */
    public static CharSequence clean(CharSequence text) {
        if (text == null || !Config.isCleanLinks()) return text;
        String s = text.toString();
        Matcher m = IG_URL.matcher(s);
        StringBuilder out = null;
        int last = 0;
        while (m.find()) {
            String url = m.group();
            String cleaned = cleanUrl(url);
            if (cleaned.equals(url)) continue;
            if (out == null) out = new StringBuilder(s.length());
            out.append(s, last, m.start()).append(cleaned);
            last = m.end();
        }
        if (out == null) return text;
        return out.append(s, last, s.length()).toString();
    }

    public static String clean(String text) {
        CharSequence c = clean((CharSequence) text);
        return c == null ? null : c.toString();
    }

    static String cleanUrl(String url) {
        int q = url.indexOf('?');
        if (q < 0) return url;
        int hash = url.indexOf('#', q);
        String query = hash < 0 ? url.substring(q + 1) : url.substring(q + 1, hash);
        StringBuilder kept = new StringBuilder();
        for (String pair : query.split("&")) {
            if (pair.isEmpty()) continue;
            int eq = pair.indexOf('=');
            String key = eq < 0 ? pair : pair.substring(0, eq);
            if (!FUNCTIONAL.matcher(key).matches()) continue;
            if (kept.length() > 0) kept.append('&');
            kept.append(pair);
        }
        String base = url.substring(0, q);
        String fragment = hash < 0 ? "" : url.substring(hash);
        return kept.length() == 0 ? base + fragment : base + "?" + kept + fragment;
    }

    // ---- Call-site replacements (same arguments as the framework calls they replace) ----

    public static ClipData newPlainText(CharSequence label, CharSequence text) {
        return ClipData.newPlainText(label, clean(text));
    }

    public static void setText(android.text.ClipboardManager clipboard, CharSequence text) {
        clipboard.setText(clean(text));
    }

    /** Share intents: Instagram puts the link in EXTRA_TEXT of this bundle. */
    public static void cleanBundle(Bundle extras) {
        if (extras == null) return;
        CharSequence text = extras.getCharSequence("android.intent.extra.TEXT");
        CharSequence cleaned = clean(text);
        if (cleaned != text) extras.putCharSequence("android.intent.extra.TEXT", cleaned);
    }

    /** Self-check for the URL cleaner; run from DebugBridge or a unit test. */
    static void selfCheck() {
        check("https://www.instagram.com/p/ABC/?igsh=xyz", "https://www.instagram.com/p/ABC/");
        check("https://www.instagram.com/reel/ABC/?utm_source=ig_web_copy_link&igsh=1",
                "https://www.instagram.com/reel/ABC/");
        check("https://www.instagram.com/p/ABC/?img_index=2&igsh=1", "https://www.instagram.com/p/ABC/?img_index=2");
        check("https://instagram.com/natgeo?igshid=1#x", "https://instagram.com/natgeo#x");
        check("https://www.instagram.com/p/DeuOR-CjKE9/?obrf=bWZt", "https://www.instagram.com/p/DeuOR-CjKE9/");
        check("https://example.com/?igsh=1", "https://example.com/?igsh=1");
    }

    private static void check(String in, String expected) {
        String got = cleanUrl(in);
        if (IG_URL.matcher(in).matches() && !got.equals(expected)) {
            throw new AssertionError(in + " -> " + got + " != " + expected);
        }
    }
}
