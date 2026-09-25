package app.onlynazril.extension.tiktokHandle;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.onlynazril.extension.tiktokHandle.internal.Debug;
import app.onlynazril.extension.tiktokHandle.internal.Reflect;

/**
 * The one place a region is resolved, for every element that shows one.
 *
 * The country next to a name belongs to the account that owns the name, never to the video the name
 * was posted under: a video carries a region of its own, and preferring it is what makes a comment
 * show the country of the post behind the panel instead of its author's. So the order is the
 * account's own field, then what was seen for that handle when its item was bound — the payload
 * does not always fill the field in — and only the feed header, which is about the video, may fall
 * back to the item's own region.
 *
 * Before this class existed each writer resolved the region itself: the name path stopped at the
 * bind cache, the header path fell back to the item, and the bind path read the account field
 * alone. The same switch, on the same video, therefore produced a region on one surface and none on
 * another. Every caller now asks here, so a region is either there for all of them or for none.
 */
public final class RegionSource {
    /** Bounded on purpose: the feed is unbounded, the header only ever needs recent handles. */
    private static final int MAX_HANDLES = 256;
    private static final int MAX_REPORTS = 12;

    private static final Map<String, String> SEEN_AT_BIND = new ConcurrentHashMap<>();

    private static int reported;

    private RegionSource() {}

    /**
     * The @handle of a user object, or null when the payload carries none. A leading "@" is
     * stripped, because some payloads store the handle with it and the stamp adds its own.
     */
    public static String handleOf(Object user) {
        if (user == null) return null;
        String unique = Reflect.string(user, "getUniqueId", "uniqueId");
        if (unique == null) {
            Object raw = Reflect.readField(user, "uniqueId");
            if (raw instanceof String) unique = (String) raw;
        }
        if (unique == null) return null;
        unique = unique.trim();
        if (unique.startsWith("@")) unique = unique.substring(1).trim();
        return unique.isEmpty() ? null : unique;
    }

    /** Exactly what the account's own field says, with no fallback: this is what bind caches. */
    public static String accountRegion(Object user) {
        return upper(Reflect.string(user, "getRegion", "region"));
    }

    /** A name or a comment: the account's field, then what was seen for that handle at bind. */
    public static String forUser(Object user, String handle) {
        if (user == null) return null;
        Object raw = Reflect.property(user, "getRegion", "region");
        String region = accountRegion(user);
        String source = region == null ? null : "account";
        if (region == null && handle != null) {
            region = SEEN_AT_BIND.get(key(handle));
            if (region != null) source = "bound";
        }
        report(handle, user, raw, region, source);
        return region;
    }

    /** The feed header: its author's region, and the item's own region only as a last resort. */
    public static String forAweme(Object aweme) {
        if (aweme == null) return null;
        Object author = Reflect.property(aweme, "getAuthor", "author");
        String handle = handleOf(author);
        if (handle != null) {
            String region = forUser(author, handle);
            if (region != null) return region;
        }
        return upper(Reflect.string(aweme, "getRegion", "region"));
    }

    /** A comment: read off the comment, so the name does not have to be written first. */
    public static String forComment(Object comment) {
        Object user = Reflect.property(comment, "getUser", "user");
        if (user == null) return null;
        String handle = handleOf(user);
        if (handle == null) return null;
        return forUser(user, handle);
    }

    /** Called at bind: the one moment the item and its author are both in hand. */
    public static void remember(String handle, String region) {
        if (region == null) return;
        if (handle == null || handle.isEmpty()) return;
        if (SEEN_AT_BIND.size() >= MAX_HANDLES) SEEN_AT_BIND.clear();
        SEEN_AT_BIND.put(key(handle), region);
    }

    /**
     * One line per resolution, capped. The value the model itself carries is printed next to the
     * answer, because "this user has no region" and "the field is not in this payload" are the same
     * nothing on screen and different things to act on.
     */
    private static void report(String handle, Object user, Object raw, String region, String source) {
        if (reported >= MAX_REPORTS) return;
        reported++;
        Debug.print("region: @" + (handle == null ? "?" : handle)
                + " model=" + describeModel(user, raw)
                + " -> " + (region == null ? "none" : region)
                + " (from " + (source == null ? "nothing" : source) + ")");
    }

    private static String describeModel(Object user, Object raw) {
        if (raw != null) return "'" + raw + "'";
        if (user == null) return "no user";
        boolean declared = Reflect.field(user.getClass(), "region") != null
                || Reflect.method(user.getClass(), "getRegion") != null;
        return declared ? "null (declared, unset)" : "absent (no getter or field)";
    }

    private static String key(String handle) {
        return handle.trim().toLowerCase(Locale.ROOT);
    }

    private static String upper(String value) {
        if (value == null) return null;
        String trimmed = value.trim().toUpperCase(Locale.ROOT);
        return trimmed.isEmpty() ? null : trimmed;
    }
}
