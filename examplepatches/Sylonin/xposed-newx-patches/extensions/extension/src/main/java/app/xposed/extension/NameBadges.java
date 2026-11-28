package app.xposed.extension;

import android.app.Activity;
import android.graphics.Bitmap;
import android.util.Log;
import android.util.LruCache;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import kotlin.jvm.functions.Function0;

/**
 * Adds the badge to the badge list of X's name rows (post and quote headers, user rows, the
 * profile header, chat headers) as an Affiliate item with an "xposed:" URL, then draws that
 * item ourselves when X renders it, since X would draw an affiliate badge as a square image
 * and our badge is wider than tall. On posts, the share button follows as a second item.
 */
final class NameBadges {
    private static final String URL_PREFIX = "xposed:";
    private static final String SHARE_PREFIX = URL_PREFIX + "share:";
    private static final int CACHE_LIMIT = 256;

    /** Something drawn in place of an Affiliate item. */
    interface Image {
        /** Height relative to the medium badge size, which is as tall as X's verified badge. */
        float relativeHeight();

        /** Width over height. */
        float aspectRatio();

        Bitmap toBitmap(int heightPx);
    }

    /** One look of an item and its rendered copy. Main thread. */
    private static final class Rendered {
        final Image image;
        final Function0<Object> onClick;
        int heightPx;
        Object painter, modifier;

        Rendered(Image image, Function0<Object> onClick) {
            this.image = image;
            this.onClick = onClick;
        }
    }

    /**
     * What a list we returned was made from. A composable's restart lambda keeps the arguments
     * our hook gave it, so a restarted row passes our own list back.
     */
    private static final class Made {
        final Object base;
        final String handle;
        final long postId;

        Made(Object base, String handle, long postId) {
            this.base = base;
            this.handle = handle;
            this.postId = postId;
        }
    }

    private static final Map<String, Rendered> rendered = new LinkedHashMap<String, Rendered>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Rendered> eldest) {
            return size() > CACHE_LIMIT;
        }
    };
    private static final WeakIdentityMap<Made> made = new WeakIdentityMap<>();
    private static volatile boolean broken;
    /** The badge whose inline placeholder the row builds next, when it is ours. */
    private static final ThreadLocal<Rendered> inline = new ThreadLocal<>();
    private static volatile boolean inlineBroken;

    /**
     * Lists we returned, by what they were made from. Equal inputs give the same list, so X can
     * skip the row even when it compares arguments by identity.
     */
    private static final LruCache<List<Object>, Object> lists = new LruCache<>(CACHE_LIMIT);

    private NameBadges() {
    }

    /**
     * Called when a name row composes; returns its badge list with ours appended when known.
     * handleText is null for rows that show no handle; their list tells whose it is.
     */
    static Object onNameRow(String handleText, Object badges) {
        if (broken || !(badges instanceof List)) return badges;
        Object base = badges;
        String handle = FilterText.handle(handleText);
        long postId;
        Made ours;
        synchronized (made) {
            ours = made.get(badges);
        }
        if (ours != null) {
            base = ours.base;
            if (handle == null) handle = ours.handle;
            postId = ours.postId;
        } else {
            BadgeOwners.Owner owner = BadgeOwners.owner(badges);
            if (handle == null && owner != null) handle = owner.handle;
            postId = owner != null && owner.handle.equals(handle) ? owner.postId : 0;
        }
        if (handle == null) return base;
        States.observe(handle);
        AccountInfo info = Lookup.get(handle);
        if (info == null || info.isEmpty()) return base;
        BadgeDrawable drawable = BadgeDrawable.create(info);
        if (drawable == null) return base;
        // The URL changes with the look, so X re-renders the item when it does.
        String url = URL_PREFIX + handle + '#' + Integer.toHexString(drawable.key().hashCode());
        String shareUrl = null;
        BadgeDrawable.ShareButton share = null;
        if (postId > 0 && Settings.badge().share) {
            share = BadgeDrawable.shareButton();
            shareUrl = SHARE_PREFIX + postId + ':' + handle + '#' + Integer.toHexString(share.key().hashCode());
        }
        synchronized (rendered) {
            if (!rendered.containsKey(url)) rendered.put(url, new Rendered(drawable, openSheet(handle)));
            if (share != null && !rendered.containsKey(shareUrl)) rendered.put(shareUrl, new Rendered(share, sharePost(handle, postId)));
        }
        String description = describe(info);
        List<Object> key = Arrays.asList(base, url, description, postId, shareUrl);
        Object cached = lists.get(key);
        if (cached != null) return cached;
        try {
            List<Object> list = new ArrayList<>((List<?>) base);
            list.add(ComposeBridge.affiliateBadge(description, url));
            if (shareUrl != null) list.add(ComposeBridge.affiliateBadge("Share post as an image", shareUrl));
            Object result = ComposeBridge.immutableList(list);
            lists.put(key, result);
            synchronized (made) {
                made.put(result, new Made(base, handle, postId));
            }
            return result;
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Badge items are unavailable", t);
            return base;
        }
    }

    private static Function0<Object> openSheet(String handle) {
        return () -> {
            Activity activity = Activities.current();
            if (activity != null) BadgeSheet.show(activity, handle);
            return null;
        };
    }

    private static Function0<Object> sharePost(String handle, long postId) {
        return () -> {
            Activity activity = Activities.current();
            if (activity != null) PostShareSheet.show(activity, handle, postId);
            return null;
        };
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
            int heightPx = Math.max(1, Math.round(sizeDp * r.image.relativeHeight() * density));
            if (r.painter == null || r.heightPx != heightPx) {
                Bitmap bitmap = r.image.toBitmap(heightPx);
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

    /**
     * Called with each badge item of a row that lays badges out as inline text content, just
     * before X builds the item's placeholder.
     */
    static void noteInline(Object item) {
        if (inlineBroken) return;
        try {
            String url = ComposeBridge.badgeUrl(item);
            Rendered r = null;
            if (url != null && url.startsWith(URL_PREFIX)) {
                synchronized (rendered) {
                    r = rendered.get(url);
                }
            }
            if (r != null) inline.set(r);
            else inline.remove();
        } catch (Throwable t) {
            inlineBroken = true;
            inline.remove();
            Log.e(Hooks.TAG, "Failed to read inline badge", t);
        }
    }

    /**
     * X gives every inline badge a square placeholder one badge size wide, which would shrink
     * ours to fit. Returns a placeholder with the shape and height of the noted badge instead.
     */
    static Object inlinePlaceholder(Object placeholder) {
        Rendered r = inline.get();
        inline.remove();
        if (r == null || inlineBroken) return placeholder;
        try {
            float height = r.image.relativeHeight();
            return ComposeBridge.placeholder(
                    scaleTextUnit(ComposeBridge.placeholderWidth(placeholder), height * r.image.aspectRatio()),
                    scaleTextUnit(ComposeBridge.placeholderHeight(placeholder), height),
                    ComposeBridge.placeholderAlign(placeholder));
        } catch (Throwable t) {
            inlineBroken = true;
            Log.e(Hooks.TAG, "Failed to size inline badge", t);
            return placeholder;
        }
    }

    /**
     * Multiplies a packed Compose TextUnit: the unit type in bits 32-39 and the value as a float
     * in the low 32 bits. An unspecified size stays unspecified.
     */
    static long scaleTextUnit(long textUnit, float factor) {
        long type = textUnit & 0xFF00000000L;
        if (type == 0) return textUnit;
        float value = Float.intBitsToFloat((int) textUnit);
        return type | (Float.floatToRawIntBits(value * factor) & 0xFFFFFFFFL);
    }

    /** Says what the flag shows: the account location, or the country of the connection source. */
    private static String describe(AccountInfo info) {
        String shown = info.country(Settings.badge().deviceCountry);
        if (shown == null) return "Account details";
        return shown.equals(info.location) ? "Account based in " + shown : "Connected via " + info.source;
    }
}
