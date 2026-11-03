/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.feed;

import app.morphe.extension.pinedrama.blockauthor.Reflect;
import app.morphe.extension.pinedrama.settings.Settings;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * The countries the comment rows show. PineDrama 47.5.3 sends comment accounts with no country, so
 * a commenter's country comes from the videos and comments that named it earlier.
 */
public final class AuthorRegion {
    /** Separates a comment's time from its country, matching the row's own middle dot. */
    public static final String SEPARATOR = " · ";

    private AuthorRegion() {
    }

    /** How many creators' countries are kept for the comment list to fall back on. */
    private static final int MAX_SEEN = 256;

    /**
     * The country of every creator whose video came up in the feed lately, by handle. Access ordered
     * and bounded, so it keeps the creators the reader met last; the video change runs on the main
     * thread but the comment cell may ask from another, so every touch is under the map's lock.
     */
    private static final Map<String, String> SEEN_AT_BIND = new LinkedHashMap<String, String>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_SEEN;
        }
    };

    /**
     * One spelling of a handle for both sides of the cache: the at sign and spaces off, lower
     * case, because handles are not case sensitive. Null for no handle.
     */
    static String handleKey(String handle) {
        if (handle == null) {
            return null;
        }
        String key = handle.trim();
        if (key.startsWith("@")) {
            key = key.substring(1).trim();
        }
        return key.isEmpty() ? null : key.toLowerCase(Locale.ROOT);
    }

    /**
     * The same countries by account id (#201). A uid never changes spelling or owner, so it
     * answers for a commenter whose handle is missing or was changed since the video was bound.
     * Bounded and access ordered like the handle cache, under its own lock.
     */
    private static final Map<String, String> SEEN_BY_UID = new LinkedHashMap<String, String>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_SEEN;
        }
    };

    /**
     * The video on screen changed: its creator's country is the one thing PineDrama sends that a
     * comment row can use, when that creator comments on a video.
     */
    public static void rememberVideo(Object aweme) {
        if (aweme == null) {
            return;
        }
        Object author = Reflect.property(aweme, "getAuthor", "author");
        rememberSeen(Reflect.string(author, "getUid", "uid"), Reflect.string(author, "getUniqueId", "uniqueId"),
                Reflect.string(aweme, "getRegion", "region"));
    }

    public static void rememberSeen(String handle, String region) {
        rememberSeen(null, handle, region);
    }

    /** Remembers a country under the account's id and its handle, whichever of the two is known. */
    public static void rememberSeen(String uid, String handle, String region) {
        String code = regionCode(region);
        if (code == null) {
            return;
        }
        String key = handleKey(handle);
        if (key != null) {
            synchronized (SEEN_AT_BIND) {
                SEEN_AT_BIND.put(key, code);
            }
        }
        String id = uid == null ? null : uid.trim();
        if (id != null && !id.isEmpty()) {
            synchronized (SEEN_BY_UID) {
                SEEN_BY_UID.put(id, code);
            }
        }
    }

    /**
     * What a comment's own account carried, kept for the same person's later comments: the uid
     * always, the handle only when the feed hasn't already remembered one, so a country the
     * feed bound is never replaced by a comment's.
     */
    public static void learnFromComment(String uid, String handle, String region) {
        String code = regionCode(region);
        if (code == null) {
            return;
        }
        String key = handleKey(handle);
        if (key != null) {
            synchronized (SEEN_AT_BIND) {
                if (!SEEN_AT_BIND.containsKey(key)) {
                    SEEN_AT_BIND.put(key, code);
                }
            }
        }
        rememberSeen(uid, null, code);
    }

    /** The country last remembered for this account id, or null. */
    public static String seenRegionByUid(String uid) {
        String id = uid == null ? null : uid.trim();
        if (id == null || id.isEmpty()) {
            return null;
        }
        synchronized (SEEN_BY_UID) {
            return SEEN_BY_UID.get(id);
        }
    }

    /**
     * The country a creator's video last showed in the feed, or null when none was bound with
     * one. The exact handle is the key, so a different commenter never gets someone else's.
     */
    public static String seenRegion(String handle) {
        String key = handleKey(handle);
        if (key == null) {
            return null;
        }
        synchronized (SEEN_AT_BIND) {
            return SEEN_AT_BIND.get(key);
        }
    }

    /** Lets a test start from no remembered creators. */
    public static void forgetSeenRegions() {
        synchronized (SEEN_AT_BIND) {
            SEEN_AT_BIND.clear();
        }
        synchronized (SEEN_BY_UID) {
            SEEN_BY_UID.clear();
        }
    }

    /** A country code the way HushPine shows one, trimmed and upper case, or null when there's none. */
    public static String regionCode(String raw) {
        String trimmed = raw == null ? null : raw.trim();
        return trimmed == null || trimmed.isEmpty() ? null : trimmed.toUpperCase(Locale.ROOT);
    }

    /**
     * A country code the way the reader asked to see it: its flag with Show the country as a
     * flag on (#157), made of the two regional indicator letters every flag emoji is, or else the
     * code. Anything that isn't two letters A to Z stays as it is.
     */
    public static String shown(String code) {
        if (code == null || code.length() != 2 || !Settings.REGION_AS_FLAG.get()) {
            return code;
        }
        StringBuilder flag = new StringBuilder(4);
        for (int i = 0; i < 2; i++) {
            char letter = code.charAt(i);
            if (letter < 'A' || letter > 'Z') {
                return code;
            }
            flag.appendCodePoint(0x1F1E6 + (letter - 'A'));
        }
        return flag.toString();
    }
}
