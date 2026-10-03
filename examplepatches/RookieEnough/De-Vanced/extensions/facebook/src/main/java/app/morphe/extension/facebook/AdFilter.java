/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Removes Facebook sponsored units from feed data before Litho creates views.
 * Do not hide already-rendered views Ã¢â‚¬â€ that causes ads to flash then collapse.
 */
public final class AdFilter {

    private static final int MAX_DEPTH = 4;
    private static final WeakHashMap<Object, Boolean> CACHE = new WeakHashMap<>();
    private static final String[] SPONSORED_TOKENS = {
            "SPONSORED",
            "sponsored_data",
            "SponsoredData",
            "sponsored_label",
            "SponsoredLabel",
            "is_sponsored",
            "IS_SPONSORED",
            "sponsor_context",
            "GraphQLFeedAd",
            "FeedAd",
            "StoryAdsInDisc",
            "ads_insertion",
            "ads_deletion",
            "ad_client_token",
            "AdAttachment"
    };

    private AdFilter() {
    }

    public static boolean shouldBlockService(String name) {
        if (name == null || name.isEmpty()) {
            return false;
        }
        String n = name.toLowerCase(Locale.US);
        // Do not use contains("ads") Ã¢â‚¬â€ that matches "downloads" / "uploads" and
        // breaks Reels media loading.
        return n.contains("audiencenetwork")
                || n.contains("adsregistry")
                || n.contains("fbawesomelogger")
                || n.contains("adsmanager")
                || n.startsWith("ads")
                || n.contains("sponsored")
                || n.contains("advert");
    }

    /**
     * @return true if this object is a sponsored feed/story/reel unit and must be dropped.
     */
    public static boolean isSponsored(Object obj) {
        if (obj == null) {
            return false;
        }
        try {
            synchronized (CACHE) {
                Boolean cached = CACHE.get(obj);
                if (cached != null) {
                    return cached;
                }
            }
            boolean result = isSponsoredDeep(obj, 0, new IdentityHashMap<Object, Boolean>());
            synchronized (CACHE) {
                CACHE.put(obj, result);
            }
            return result;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Mutates the list in place, removing sponsored edges/units so they never bind.
     *
     * @return true if at least one item was removed
     */
    public static boolean stripSponsored(List<?> list) {
        if (list == null || list.isEmpty()) {
            return false;
        }
        int before = list.size();
        try {
            Iterator<?> it = list.iterator();
            while (it.hasNext()) {
                Object item = it.next();
                if (isSponsored(item)) {
                    it.remove();
                }
            }
            return list.size() < before;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Filter that works for immutable lists: returns a new list when items were dropped.
     * Returns null when nothing changed.
     */
    public static ArrayList<Object> filteredCopy(List<?> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        ArrayList<Object> kept = new ArrayList<>(list.size());
        boolean dropped = false;
        for (Object item : list) {
            if (isSponsored(item)) {
                dropped = true;
            } else {
                kept.add(item);
            }
        }
        return dropped ? kept : null;
    }

    private static boolean isSponsoredDeep(Object obj, int depth, IdentityHashMap<Object, Boolean> seen) {
        if (obj == null || depth > MAX_DEPTH) {
            return false;
        }
        if (obj instanceof String) {
            return isSponsoredLabel((String) obj);
        }
        if (obj instanceof Number || obj instanceof Boolean) {
            return false;
        }
        if (seen.containsKey(obj)) {
            return false;
        }
        seen.put(obj, Boolean.TRUE);

        String className = obj.getClass().getName();
        if (classLooksSponsored(className)) {
            return true;
        }
        if (className.startsWith("java.") || className.startsWith("android.")
                || className.startsWith("dalvik.") || className.startsWith("kotlin.")) {
            if (obj instanceof Iterable) {
                for (Object child : (Iterable<?>) obj) {
                    if (isSponsoredDeep(child, depth + 1, seen)) {
                        return true;
                    }
                }
            }
            if (obj instanceof Map) {
                for (Map.Entry<?, ?> e : ((Map<?, ?>) obj).entrySet()) {
                    if (keyLooksSponsored(e.getKey()) || isSponsoredDeep(e.getValue(), depth + 1, seen)) {
                        return true;
                    }
                }
            }
            return false;
        }

        String asString = String.valueOf(obj);
        if (asString.length() < 512 && containsSponsoredToken(asString)) {
            // Short model toString() often includes category=SPONSORED.
            if (asString.contains("SPONSORED")
                    || asString.contains("sponsored_data")
                    || asString.contains("is_sponsored")
                    || asString.contains("ad_client_token")) {
                return true;
            }
        }

        try {
            for (Method m : obj.getClass().getMethods()) {
                if (m.getParameterCount() != 0) {
                    continue;
                }
                String name = m.getName();
                Class<?> rt = m.getReturnType();
                if (rt == Void.TYPE) {
                    continue;
                }

                if (isEnumLike(rt)) {
                    Object value = invokeQuiet(m, obj);
                    if (value != null && containsSponsoredToken(String.valueOf(value))) {
                        return true;
                    }
                }

                if (looksLikeSponsoredAccessor(name)) {
                    Object value = invokeQuiet(m, obj);
                    if (value instanceof Boolean) {
                        if ((Boolean) value) {
                            return true;
                        }
                    } else if (value instanceof String) {
                        if (isSponsoredLabel((String) value) || containsSponsoredToken((String) value)) {
                            return true;
                        }
                    } else if (value != null) {
                        return true;
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        if (depth >= 2) {
            return false;
        }

        try {
            for (Method m : obj.getClass().getMethods()) {
                if (m.getParameterCount() != 0) {
                    continue;
                }
                String name = m.getName();
                if (!looksLikeNodeAccessor(name)) {
                    continue;
                }
                Object nested = invokeQuiet(m, obj);
                if (nested != null && nested != obj && isSponsoredDeep(nested, depth + 1, seen)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }

        try {
            for (Field f : obj.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) {
                    continue;
                }
                String n = f.getName();
                if (looksLikeSponsoredAccessor(n) || "category".equalsIgnoreCase(n)) {
                    f.setAccessible(true);
                    Object value = f.get(obj);
                    if (value instanceof Boolean && (Boolean) value) {
                        return true;
                    }
                    if (value != null && containsSponsoredToken(String.valueOf(value))) {
                        return true;
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        return false;
    }

    private static boolean classLooksSponsored(String className) {
        if (className == null) {
            return false;
        }
        String n = className.toLowerCase(Locale.US);
        return n.contains("sponsored")
                || n.contains("feedad")
                || n.contains("storyad")
                || n.contains("adattachment");
    }

    private static boolean isSponsoredLabel(String s) {
        if (s == null) {
            return false;
        }
        String t = s.trim();
        return t.equalsIgnoreCase("Sponsored")
                || t.equalsIgnoreCase("SPONSORED")
                || t.equalsIgnoreCase("Ad")
                || t.equals("Suggested for you");
    }

    private static boolean looksLikeSponsoredAccessor(String name) {
        if (name == null) {
            return false;
        }
        String n = name.toLowerCase(Locale.US);
        return n.contains("sponsored")
                || n.contains("adid")
                || n.contains("ad_id")
                || n.equals("isad")
                || n.equals("getisad")
                || n.contains("is_ad")
                || n.contains("advertiser")
                || n.contains("adclienttoken");
    }

    private static boolean looksLikeNodeAccessor(String name) {
        if (name == null || name.length() > 24) {
            return false;
        }
        return name.equals("getNode")
                || name.equals("getStory")
                || name.equals("getEdge")
                || name.equals("node")
                || name.equals("story")
                || name.startsWith("getFeed")
                || name.equals("getComponent")
                || name.equals("getRenderInfo")
                || name.equals("B3H")
                || name.equals("A00");
    }

    private static boolean isEnumLike(Class<?> rt) {
        return rt.isEnum() || rt.getName().contains("Category") || rt.getName().contains("Enum");
    }

    private static boolean keyLooksSponsored(Object key) {
        return key != null && containsSponsoredToken(String.valueOf(key));
    }

    private static boolean containsSponsoredToken(String s) {
        if (s == null || s.length() < 2) {
            return false;
        }
        for (String token : SPONSORED_TOKENS) {
            if (s.contains(token)) {
                return true;
            }
        }
        return false;
    }

    private static Object invokeQuiet(Method m, Object obj) {
        try {
            m.setAccessible(true);
            return m.invoke(obj);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
