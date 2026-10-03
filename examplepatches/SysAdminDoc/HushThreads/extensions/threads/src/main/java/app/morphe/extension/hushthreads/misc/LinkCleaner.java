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
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

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
     * Threads 449 link handling names these keys (xmt, slof and igsh,igshid,igsi), inspected
     * 2026-09-29. ClearURLs and Brave are behavior references, not proof of Threads-specific
     * privacy semantics: ClearURLs Rules inspected 2026-10-01 had no Threads provider.
     * Only the query pairs listed below are removed; the path and all other pairs stay.
     *
     * Short /share/<code>/ links, checked 2026-10-02: copying the same post's link twice gave two
     * different codes, and each opened /@author/post/<post code>?xmt=<a different token>&slof=1,
     * while the page's canonical link and og:url were the bare /@author/post/<post code>. So the
     * code stands for the per-share xmt token. ownLink() swaps it for the post's own link, built
     * from the author and code Threads already holds for the post. The share request on that path
     * sends no carousel index, so the short link has none to lose.
     * See https://github.com/ClearURLs/Rules/issues/186.
     */

    /** Taken out on any host: Meta's apps add them to links that leave them. */
    private static final Set<String> EVERY_HOST = keys("fbclid", "igsh", "igshid", "igsi");

    /** Taken out of Threads' and Instagram's own links only. */
    private static final Set<String> META_ONLY = keys("xmt", "slof");

    /** Threads' and Instagram's hosts, each with its subdomains. */
    private static final String[] META_HOSTS = {"threads.com", "threads.net", "instagram.com"};

    /** The hosts Threads' short /share/ links come from. */
    private static final Set<String> SHORT_LINK_HOSTS = keys("threads.com", "www.threads.com", "threads.net", "www.threads.net");

    /** A short link's path: one code, with or without the closing slash. */
    private static final Pattern SHORT_PATH = Pattern.compile("/share/[A-Za-z0-9_-]+/?");

    /** A Threads username: letters, digits, periods and underscores, at most 30. */
    private static final Pattern USERNAME = Pattern.compile("[A-Za-z0-9._]{1,30}");

    /** A post code, the last part of a post's own link. */
    private static final Pattern POST_CODE = Pattern.compile("[A-Za-z0-9_-]{1,64}");

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
        String cleaned = clean(url);
        if (url != null && !url.equals(cleaned)) {
            HookStatus.counted(FamilyNames.SANITIZE_SHARING_LINKS, "shared links changed");
        }
        return cleaned;
    }

    /**
     * Injected where Threads' share sheet reads the post link it got back, with that post's author
     * ({@code Object} because the patch hands over whatever the author's name read gave, null
     * included) and code. Answers the post's own link in place of a short /share/ one, or the link
     * as it came while the switch is off, HushThreads is paused or the settings aren't ready yet.
     * Never throws.
     */
    public static String postLink(String url, Object author, String code) {
        HookStatus.invoked(FamilyNames.SANITIZE_SHARING_LINKS);
        try {
            if (!Utils.settingsReady() || !Settings.SANITIZE_SHARING_LINKS.get()) return url;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SANITIZE_SHARING_LINKS, "switch read", t);
            return url;
        }
        if (!isShortLink(url)) return url;
        String own = ownLink(url, author instanceof String ? (String) author : null, code);
        HookStatus.counted(FamilyNames.SANITIZE_SHARING_LINKS,
                own.equals(url) ? "short links kept, no author or code" : "short links replaced");
        return own;
    }

    /**
     * The post each share coroutine fetched a link for, by the coroutine. Send, WhatsApp status and
     * Instagram story, and WhatsApp quick sends let go of the post while they wait for its link,
     * then come back as the same coroutine object, so the post waits here against that object for
     * as long as it lives.
     */
    private static final Map<Object, Object> POSTS = Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Injected just before a share coroutine waits for a post's link, with the coroutine and the
     * post. Keeps nothing for a null post, or while the switch is off, HushThreads is paused or the
     * settings aren't ready yet. Never throws.
     */
    public static void rememberPost(Object coroutine, Object post) {
        if (coroutine == null || post == null) return;
        try {
            if (!Utils.settingsReady() || !Settings.SANITIZE_SHARING_LINKS.get()) return;
            POSTS.put(coroutine, post);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SANITIZE_SHARING_LINKS, "post kept for a share", t);
        }
    }

    /**
     * Injected where that coroutine reads the link, before {@link #postLink}: the post kept for it,
     * or null, which leaves the link as it came. Never throws.
     */
    public static Object rememberedPost(Object coroutine) {
        if (coroutine == null) return null;
        try {
            return POSTS.get(coroutine);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SANITIZE_SHARING_LINKS, "post kept for a share", t);
            return null;
        }
    }

    /**
     * The post's own link, {@code https://www.threads.com/@author/post/code}, in place of a short
     * /share/ link, keeping its scheme, host and anything after the path, with tracking keys
     * taken out. Answers {@code url} itself when it isn't a short Threads link or when the author
     * or code isn't one Threads could have made. Never throws.
     */
    public static String ownLink(String url, String author, String code) {
        if (!isShortLink(url) || author == null || code == null
                || !USERNAME.matcher(author).matches() || !POST_CODE.matcher(code).matches()) return url;
        int path = url.indexOf('/', url.indexOf(':') + 3);
        int end = pathEnd(url, path);
        return clean(url.substring(0, path) + "/@" + author + "/post/" + code + url.substring(end));
    }

    /** Whether {@code url} is a short /share/ link on Threads' own host, as Threads hands them out. */
    private static boolean isShortLink(String url) {
        if (url == null) return false;
        try {
            int colon = url.indexOf(':');
            if (colon <= 0) return false;
            String scheme = url.substring(0, colon).toLowerCase(Locale.ROOT);
            if (!scheme.equals("http") && !scheme.equals("https")) return false;
            if (!url.startsWith("//", colon + 1)) return false;
            int path = url.indexOf('/', colon + 3);
            if (path < 0) return false;
            // No user, port or other host: the whole authority is one of Threads' hosts.
            String authority = url.substring(colon + 3, path);
            if (!SHORT_LINK_HOSTS.contains(authority.toLowerCase(Locale.ROOT))) return false;
            return SHORT_PATH.matcher(url.substring(path, pathEnd(url, path))).matches();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Where the path that starts at {@code path} ends: the query, the fragment or the link's end. */
    private static int pathEnd(String url, int path) {
        int end = url.length();
        int query = url.indexOf('?', path);
        int fragment = url.indexOf('#', path);
        if (query >= 0) end = query;
        if (fragment >= 0 && fragment < end) end = fragment;
        return end;
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
