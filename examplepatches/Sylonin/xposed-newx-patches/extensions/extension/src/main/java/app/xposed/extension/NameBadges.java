package app.xposed.extension;

import android.app.Activity;
import android.graphics.Bitmap;
import android.util.Log;
import android.util.LruCache;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import kotlin.jvm.functions.Function0;

/**
 * Adds the badge to the badge list of X's name rows (post and quote headers, user rows) as an
 * Affiliate item with an "xposed:" URL, then draws that item ourselves when X renders it, since
 * X would draw an affiliate badge as a square image and our badge is wider than tall.
 */
final class NameBadges {
    private static final String URL_PREFIX = "xposed:";
    private static final int CACHE_LIMIT = 256;

    /** A badge look for one account, and its rendered copy. Main thread. */
    private static final class Rendered {
        final BadgeDrawable drawable;
        final Function0<Object> onClick;
        int heightPx;
        Object painter, modifier;

        Rendered(String handle, BadgeDrawable drawable) {
            this.drawable = drawable;
            this.onClick = () -> {
                Activity activity = Activities.current();
                if (activity != null) BadgeSheet.show(activity, handle);
                return null;
            };
        }
    }

    private static final Map<String, Rendered> rendered = new LinkedHashMap<String, Rendered>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Rendered> eldest) {
            return size() > CACHE_LIMIT;
        }
    };
    private static volatile boolean broken;

    /**
     * Lists we returned, by what they were made from. Equal inputs give the same list, so X can
     * skip the row even when it compares arguments by identity.
     */
    private static final LruCache<List<Object>, Object> lists = new LruCache<>(CACHE_LIMIT);

    private NameBadges() {
    }

    /** Called when a name row composes; returns its badge list with ours appended when known. */
    static Object onNameRow(String handleText, Object badges) {
        if (broken || !(badges instanceof List)) return badges;
        String handle = normalizeHandle(handleText);
        if (handle == null) return badges;
        States.observe(handle);
        AccountInfo info = Lookup.get(handle);
        if (info == null || info.isEmpty()) return badges;
        BadgeDrawable drawable = BadgeDrawable.create(info);
        if (drawable == null) return badges;
        // The URL changes with the look, so X re-renders the item when it does.
        String url = URL_PREFIX + handle + '#' + Integer.toHexString(drawable.key().hashCode());
        synchronized (rendered) {
            if (!rendered.containsKey(url)) rendered.put(url, new Rendered(handle, drawable));
        }
        String description = describe(info);
        List<Object> key = Arrays.asList(badges, url, description);
        Object cached = lists.get(key);
        if (cached != null) return cached;
        try {
            List<Object> list = new ArrayList<>((List<?>) badges);
            list.add(ComposeBridge.affiliateBadge(description, url));
            Object result = ComposeBridge.immutableList(list);
            lists.put(key, result);
            return result;
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Badge items are unavailable", t);
            return badges;
        }
    }

    /**
     * Called when X renders an Affiliate badge. Draws ours and returns true, or returns false
     * for X's own badges. sizeDp is the size X gives badges in that row.
     */
    static boolean drawBadge(String url, String description, float sizeDp, Object composer) {
        if (url == null || !url.startsWith(URL_PREFIX)) return false;
        Rendered r;
        synchronized (rendered) {
            r = rendered.get(url);
        }
        // Evicted, or never ours: draw nothing rather than let X load the URL.
        if (r == null || broken) return true;
        Object painter, modifier;
        try {
            float density = Hooks.density();
            int heightPx = Math.max(1, Math.round(sizeDp * r.drawable.relativeHeight() * density));
            if (r.painter == null || r.heightPx != heightPx) {
                Bitmap bitmap = r.drawable.toBitmap(heightPx);
                r.painter = ComposeBridge.bitmapPainter(bitmap);
                r.modifier = ComposeBridge.clickable(
                        ComposeBridge.size(bitmap.getWidth() / density, heightPx / density), r.onClick);
                r.heightPx = heightPx;
            }
            painter = r.painter;
            modifier = r.modifier;
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Failed to draw badge", t);
            return true;
        }
        // Not caught: a failure inside a composable leaves the composition unusable anyway.
        ComposeBridge.image(painter, description, modifier, composer);
        return true;
    }

    /** "@Example" or "Example" from X's username text; null when it isn't a handle. */
    static String normalizeHandle(String username) {
        if (username == null) return null;
        int start = 0, end = username.length();
        while (start < end && username.charAt(start) <= ' ') start++;
        while (end > start && username.charAt(end - 1) <= ' ') end--;
        if (start < end && username.charAt(start) == '@') start++;
        if (end - start < 1 || end - start > 15) return null;
        for (int i = start; i < end; i++) {
            char c = username.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == '_')) return null;
        }
        return username.substring(start, end).toLowerCase(Locale.ROOT);
    }

    private static String describe(AccountInfo info) {
        return info.location != null ? "Account based in " + info.location : "Account details";
    }
}
