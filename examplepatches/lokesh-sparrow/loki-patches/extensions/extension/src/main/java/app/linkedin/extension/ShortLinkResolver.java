/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Expands lnkd.in short links ahead of time.
 *
 * <p>lnkd.in answers with a LinkedIn page rather than a redirect, and the destination sits in that
 * page's "continue" button. Fetching it on a click would show a spinner, so it is fetched in the
 * background as soon as a feed payload mentions the link; a tap that finds a cached target goes
 * straight there, and a tap that does not opens the normal page while the fetch starts.
 */
final class ShortLinkResolver {
    static final String PREFIX = "https://lnkd.in/";
    /** A short link in text. The slug is case sensitive, so the pattern is exact. */
    private static final Pattern SLUG = Pattern.compile("https://lnkd\\.in/[A-Za-z0-9_-]+");
    /** The continue button: its tracking name precedes the href, so both must be on one anchor. */
    private static final Pattern CONTINUE_BUTTON = Pattern.compile(
            "<a[^>]*data-tracking-control-name=\"external_url_click\"[^>]*href=\"([^\"]+)\"");

    /** Enough links for a long session, small enough that the maps stay bounded. */
    private static final int LIMIT = 200;
    private static final int TIMEOUT_MS = 8000;
    private static final int READ_CHUNK = 8192;
    private static final int PAGE_LIMIT = 512 * 1024;

    private static final Map<String, String> TARGETS = new ConcurrentHashMap<>();
    private static final Map<String, Boolean> IN_FLIGHT = new ConcurrentHashMap<>();
    /** Two fetches at a time: more would only compete with the feed's own traffic. */
    private static final ExecutorService FETCHER = Executors.newFixedThreadPool(2);

    private ShortLinkResolver() {
    }

    /** The target of a short link if it has been resolved already, otherwise null. */
    static String cached(String shortLink) {
        return TARGETS.get(canonical(shortLink));
    }

    /** Starts a fetch for every short link in the given text. */
    static void prefetchAll(String text) {
        Matcher found = SLUG.matcher(text);
        while (found.find()) prefetch(found.group());
    }

    /** Starts a fetch for one short link; a link is never fetched twice. */
    static void prefetch(String shortLink) {
        String key = canonical(shortLink);
        if (IN_FLIGHT.size() >= LIMIT) return;
        if (IN_FLIGHT.putIfAbsent(key, Boolean.TRUE) != null) return;
        Runnable job = () -> {
            String destination = resolve(key);
            if (destination == null) return;
            TARGETS.put(key, destination);
        };
        FETCHER.execute(job);
    }

    /** Fetches the warning page for one link and returns its target. Blocking; null on any error. */
    static String resolve(String shortLink) {
        HttpURLConnection http = null;
        try {
            URL endpoint = new URL(shortLink);
            http = (HttpURLConnection) endpoint.openConnection();
            http.setConnectTimeout(TIMEOUT_MS);
            http.setReadTimeout(TIMEOUT_MS);
            http.setInstanceFollowRedirects(true);
            int status = http.getResponseCode();
            if (status != 200) return null;
            try (InputStream body = http.getInputStream()) {
                ByteArrayOutputStream page = new ByteArrayOutputStream();
                byte[] chunk = new byte[READ_CHUNK];
                int read;
                while ((read = body.read(chunk)) > 0 && page.size() < PAGE_LIMIT) {
                    page.write(chunk, 0, read);
                }
                String html = page.toString(StandardCharsets.UTF_8.name());
                return targetFromPage(html);
            }
        } catch (Throwable unreadable) {
            return null;
        } finally {
            if (http != null) http.disconnect();
        }
    }

    /** The link behind a warning page's continue button, or null when there is none or it is no web link. */
    static String targetFromPage(String html) {
        Matcher button = CONTINUE_BUTTON.matcher(html);
        if (!button.find()) return null;
        String href = button.group(1);
        String unescaped = href.replace("&amp;", "&")
                .replace("&quot;", "\"")
                .replace("&#39;", "'")
                .replace("&#x3D;", "=");
        if (unescaped.startsWith("https://")) return unescaped;
        if (unescaped.startsWith("http://")) return unescaped;
        return null;
    }

    /**
     * The short link without a trailing slash, query or fragment. Case is preserved: the slug is
     * case sensitive and the wrong case is a different link.
     */
    private static String canonical(String shortLink) {
        Matcher found = SLUG.matcher(shortLink);
        if (found.find()) return found.group();
        return shortLink;
    }
}
