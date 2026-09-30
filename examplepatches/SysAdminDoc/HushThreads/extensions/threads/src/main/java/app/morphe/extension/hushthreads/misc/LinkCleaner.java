/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.misc;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Takes Threads' tracking keys out of a link, offline.
 *
 * <p>Only the query changes, and only by losing whole {@code key=value} pairs whose key is on one
 * of the lists below. Everything else stays as it was written: the other pairs in their order,
 * a key given twice, how each value is encoded, the fragment, and a host in any script. So a
 * link that carries no tracking key comes back as the same string, and cleaning a clean link
 * changes nothing.
 *
 * <p>A link that isn't {@code http} or {@code https}, or that can't be read, comes back as it
 * came. Nothing here goes online.
 */
public final class LinkCleaner {

    private LinkCleaner() {}

    /*
     * Reviewed 2026-09-29 against ClearURLs (its Threads rule), Brave's query filter and the keys
     * Threads 449 names in its own link handling (xmt, slof and igsh,igshid,igsi). Each one only
     * labels who shared a link and from where; the post a link opens is picked by its path
     * (/@user/post/CODE), which stays.
     */

    /** Taken out on any host: Meta's apps add them to links that leave them. */
    private static final Set<String> EVERY_HOST = keys("fbclid", "igsh", "igshid", "igsi");

    /** Taken out of Threads' and Instagram's own links only. */
    private static final Set<String> META_ONLY = keys("xmt", "slof");

    /** Threads' and Instagram's hosts, each with its subdomains. */
    private static final String[] META_HOSTS = {"threads.com", "threads.net", "instagram.com"};

    /**
     * Injected where Threads reads a post link it hands out when someone copies or shares. Answers the link
     * without its tracking keys, or as it came while the switch is off, HushThreads is paused or
     * the settings aren't ready yet. Never throws.
     */
    public static String sanitizeShared(String url) {
        HookStatus.invoked(FamilyNames.SANITIZE_SHARING_LINKS);
        try {
            if (!Utils.settingsReady() || !Settings.SANITIZE_SHARING_LINKS.get()) return url;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SANITIZE_SHARING_LINKS, "switch read", t);
            return url;
        }
        return clean(url);
    }

    /**
     * {@code url} without the tracking keys, or {@code url} itself when it has none, isn't a web
     * link, or can't be read. Never throws.
     */
    public static String clean(String url) {
        if (url == null) return null;
        try {
            return cleaned(url);
        } catch (Throwable t) {
            // A link this can't take apart goes out as it came.
            return url;
        }
    }

    private static String cleaned(String url) {
        int colon = url.indexOf(':');
        if (colon <= 0) return url;
        String scheme = url.substring(0, colon).toLowerCase(Locale.ROOT);
        if (!scheme.equals("http") && !scheme.equals("https")) return url;

        // The fragment starts at the first '#', and a '?' after it is part of the fragment.
        int fragment = url.indexOf('#');
        int end = fragment < 0 ? url.length() : fragment;
        int query = url.indexOf('?');
        if (query < 0 || query > end) return url;

        boolean meta = isMetaHost(host(url, colon + 1, query));
        List<String> kept = new ArrayList<>();
        boolean removed = false;
        for (String pair : url.substring(query + 1, end).split("&", -1)) {
            if (isTracking(keyOf(pair), meta)) {
                removed = true;
            } else {
                kept.add(pair);
            }
        }
        if (!removed) return url;

        String rest = String.join("&", kept);
        return url.substring(0, rest.isEmpty() ? query : query + 1) + rest + url.substring(end);
    }

    private static boolean isTracking(String key, boolean meta) {
        return EVERY_HOST.contains(key) || (meta && META_ONLY.contains(key));
    }

    /** The key of a {@code key=value} pair, decoded, or as written when it doesn't decode. */
    private static String keyOf(String pair) {
        int equals = pair.indexOf('=');
        String key = equals < 0 ? pair : pair.substring(0, equals);
        if (key.indexOf('%') < 0) return key;
        try {
            return URLDecoder.decode(key.replace("+", "%2B"), "UTF-8");
        } catch (Exception malformed) {
            return key;
        }
    }

    /**
     * The host between {@code //} and the path, the query or the port, lower-cased, or
     * {@code null} when the link has no authority.
     */
    private static String host(String url, int from, int query) {
        if (!url.startsWith("//", from)) return null;
        int start = from + 2;
        int stop = query;
        int slash = url.indexOf('/', start);
        if (slash >= 0 && slash < stop) stop = slash;
        String authority = url.substring(start, stop);
        String host = authority.substring(authority.lastIndexOf('@') + 1);
        if (host.startsWith("[")) {
            int close = host.indexOf(']');
            host = close < 0 ? host : host.substring(0, close + 1);
        } else {
            int port = host.indexOf(':');
            if (port >= 0) host = host.substring(0, port);
        }
        if (host.endsWith(".")) host = host.substring(0, host.length() - 1);
        return host.toLowerCase(Locale.ROOT);
    }

    private static boolean isMetaHost(String host) {
        if (host == null) return false;
        for (String domain : META_HOSTS) {
            // The dot keeps "notthreads.com" from matching "threads.com".
            if (host.equals(domain) || host.endsWith("." + domain)) return true;
        }
        return false;
    }

    private static Set<String> keys(String... keys) {
        return Collections.unmodifiableSet(new HashSet<>(Arrays.asList(keys)));
    }
}
