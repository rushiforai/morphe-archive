/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Strips LinkedIn's tracking parameters from links that the user copies or shares.
 *
 * <p>The links keep working without them: every key below only feeds analytics. Keys the cleaner
 * does not know about are left exactly as they were, in their original order and spelling.
 * Deliberately Android-free so it can be exercised on a desktop JVM.
 */
final class LinkCleaner {
    /** A URL inside free text, stopping at whitespace, quotes and markup brackets. */
    private static final Pattern URL_IN_TEXT = Pattern.compile("https?://[^\\s\"'<>]+");
    /** Query keys that exist only for tracking; matched case-insensitively. */
    private static final Set<String> TRACKING_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "utm_source", "utm_medium", "utm_campaign",
            "utm_content", "utm_term", "utm_id", "trk",
            "trkinfo", "trkemail", "rcm", "lipi",
            "trackingid", "refid", "midtoken", "midsig",
            "eid", "li_fat_id", "originalsubdomain",
            "sharetype", "src")));

    private LinkCleaner() {
    }

    /**
     * Every LinkedIn link in {@code text} with its tracking parameters removed. Returns the very
     * same instance when nothing changed, so callers can skip replacing the text.
     */
    static String clean(String text) {
        if (text == null) return null;
        if (!text.contains("http")) return text;
        Matcher urls = URL_IN_TEXT.matcher(text);
        StringBuilder rebuilt = null;
        int copiedUpTo = 0;
        while (urls.find()) {
            String original = urls.group();
            String stripped = cleanUrl(original);
            if (stripped.equals(original)) continue;
            if (rebuilt == null) rebuilt = new StringBuilder(text.length());
            rebuilt.append(text, copiedUpTo, urls.start()).append(stripped);
            copiedUpTo = urls.end();
        }
        if (rebuilt == null) return text;
        rebuilt.append(text, copiedUpTo, text.length());
        return rebuilt.toString();
    }

    /**
     * One URL with its tracking parameters dropped. Anything that is not a LinkedIn host is
     * returned untouched, as is a URL without a query string.
     */
    static String cleanUrl(String url) {
        int authorityAt = url.indexOf("://") + 3;
        int hostStart = authorityAt;
        int hostEnd = firstOf(url, hostStart, '/', '?', '#');
        String host = url.substring(hostStart, hostEnd < 0 ? url.length() : hostEnd).toLowerCase(Locale.ROOT);
        if (!isLinkedInHost(host)) return url;

        int queryStart = url.indexOf('?', hostStart);
        if (queryStart < 0) return url;
        int fragmentStart = url.indexOf('#', queryStart);
        String head = url.substring(0, queryStart);
        String query = url.substring(queryStart + 1, fragmentStart < 0 ? url.length() : fragmentStart);
        String fragment = fragmentStart < 0 ? "" : url.substring(fragmentStart);

        StringBuilder surviving = new StringBuilder();
        // split() keeps empty pieces at the end out of the array, which is what we want here.
        for (String pair : query.split("&")) {
            if (pair.isEmpty()) continue;
            int equals = pair.indexOf('=');
            String key = (equals < 0 ? pair : pair.substring(0, equals)).toLowerCase(Locale.ROOT);
            if (TRACKING_KEYS.contains(key)) continue;
            if (surviving.length() > 0) surviving.append('&');
            surviving.append(pair);
        }
        return surviving.length() == 0 ? head + fragment : head + "?" + surviving + fragment;
    }

    /** linkedin.com and its subdomains, plus the lnkd.in shortener. */
    private static boolean isLinkedInHost(String host) {
        return host.equals("linkedin.com") || host.equals("lnkd.in") || host.endsWith(".linkedin.com");
    }

    /** Position of the first of {@code chars} at or after {@code from}, or -1. */
    private static int firstOf(String text, int from, char... chars) {
        for (int i = from; i < text.length(); i++) {
            for (char candidate : chars) {
                if (text.charAt(i) == candidate) return i;
            }
        }
        return -1;
    }
}
