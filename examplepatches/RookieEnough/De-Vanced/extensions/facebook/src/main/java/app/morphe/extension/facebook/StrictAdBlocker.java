/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import org.json.JSONObject;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.settings.DeVancedSettings;

/**
 * Strict helpers for the Facebook 576 ad patch.
 *
 * <p>This class deliberately avoids localized labels and broad strings such as
 * "ad", "promoted", "suggested", or "midcard". Feed items are rejected only
 * when their model exposes the exact SPONSORED enum category or is a dedicated
 * Facebook ad model. Other surfaces are blocked by their internal query or
 * component identifiers.</p>
 */
public final class StrictAdBlocker {
    private static final int MAX_DEPTH = 4;
    private static final int MAX_VISITS = 96;

    private static final String MULTI_ADS_FEED_UNIT =
            "com.facebook.graphql.model.GraphQLFBMultiAdsFeedUnit";
    private static final String[] MARKETPLACE_AD_QUERIES = {
            "MarketplaceHomeFeedAds",
            "MarketplaceHomeFeedBoostedListingAds",
            "MarketplaceHomeFeedThemedAds"
    };
    private static final String[] GAME_AD_MESSAGES = {
            "getinterstitialadasync",
            "getrewardedvideoasync",
            "getrewardedinterstitialasync",
            "loadadasync",
            "showadasync",
            "loadbanneradasync",
            "hidebanneradasync"
    };

    private static final Map<Class<?>, List<Method>> CATEGORY_GETTERS =
            new ConcurrentHashMap<>();
    private static final Map<Class<?>, List<Field>> OBJECT_FIELDS =
            new ConcurrentHashMap<>();
    private static final Map<Object, Boolean> CLASSIFICATION_CACHE =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile boolean performanceMode;

    private StrictAdBlocker() {
    }

    public static void enablePerformanceMode() {
        setPerformanceMode(true);
    }

    public static void setPerformanceMode(boolean enabled) {
        performanceMode = enabled;
        AiContentFilter.setPerformanceMode(enabled);
        clearClassificationCache();
    }

    public static void clearClassificationCache() {
        CLASSIFICATION_CACHE.clear();
        AiContentFilter.clearCache();
    }

    public static void trimCaches() {
        CLASSIFICATION_CACHE.clear();
        CATEGORY_GETTERS.clear();
        OBJECT_FIELDS.clear();
        AiContentFilter.trimCaches();
    }

    public static boolean shouldHideFeedComponent(Object root) {
        if (root == null) return false;
        boolean blockAds = DeVancedSettings.isAdsDisabled();
        if (!blockAds) return false;
        if (performanceMode) {
            return isSponsoredFast(root);
        }

        ArrayDeque<Node> queue = new ArrayDeque<>();
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        queue.add(new Node(root, 0));

        int visits = 0;
        while (!queue.isEmpty() && visits++ < MAX_VISITS) {
            Node node = queue.removeFirst();
            Object value = node.value;
            if (value == null || node.depth > MAX_DEPTH || seen.put(value, Boolean.TRUE) != null) {
                continue;
            }

            Class<?> type = value.getClass();
            String className = type.getName();
            if (blockAds && (MULTI_ADS_FEED_UNIT.equals(className) ||
                    className.endsWith(".AdStory") ||
                    className.endsWith(".AdBucket"))) {
                return remember(root, true);
            }
            if (value instanceof Enum<?>) {
                if (blockAds && "SPONSORED".equals(((Enum<?>) value).name())) {
                    return remember(root, true);
                }
                continue;
            }
            if (isLeaf(type)) continue;

            if (blockAds) {
                for (Method getter : categoryGetters(type)) {
                    try {
                        Object category = getter.invoke(value);
                        if (category instanceof Enum<?> &&
                                "SPONSORED".equals(((Enum<?>) category).name())) {
                            return remember(root, true);
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }

            if (value instanceof Iterable<?>) {
                for (Object child : (Iterable<?>) value) {
                    if (child != null) queue.addLast(new Node(child, node.depth + 1));
                }
                continue;
            }
            if (type.isArray() && !type.getComponentType().isPrimitive()) {
                int length = Math.min(Array.getLength(value), 32);
                for (int i = 0; i < length; i++) {
                    Object child = Array.get(value, i);
                    if (child != null) queue.addLast(new Node(child, node.depth + 1));
                }
                continue;
            }

            for (Field field : objectFields(type)) {
                try {
                    Object child = field.get(value);
                    if (child != null && child != value) {
                        queue.addLast(new Node(child, node.depth + 1));
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return remember(root, false);
    }

    private static boolean isSponsoredFast(Object root) {
        if (hasDirectSponsoredMarker(root)) return true;

        int inspected = 0;
        for (Field field : objectFields(root.getClass())) {
            if (inspected++ >= 12) break;
            try {
                Object child = field.get(root);
                if (child == null || child == root) continue;
                if (hasDirectSponsoredMarker(child)) return true;
                if (child instanceof Iterable<?>) {
                    int count = 0;
                    for (Object item : (Iterable<?>) child) {
                        if (count++ >= 4) break;
                        if (hasDirectSponsoredMarker(item)) return true;
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static boolean hasDirectSponsoredMarker(Object value) {
        if (value == null) return false;
        String className = value.getClass().getName();
        if (MULTI_ADS_FEED_UNIT.equals(className) ||
                className.endsWith(".AdStory") ||
                className.endsWith(".AdBucket")) {
            return true;
        }
        if (value instanceof Enum<?>) {
            return "SPONSORED".equals(((Enum<?>) value).name());
        }
        for (Method getter : categoryGetters(value.getClass())) {
            try {
                Object category = getter.invoke(value);
                if (category instanceof Enum<?> &&
                        "SPONSORED".equals(((Enum<?>) category).name())) {
                    return true;
                }
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    private static boolean remember(Object root, boolean result) {
        if (performanceMode) {
            CLASSIFICATION_CACHE.put(root, result);
        }
        return result;
    }

    /**
     * @return null to block the request, the original map to allow it, or a
     * replacement ReadableMap when organic Marketplace variables were updated.
     */
    public static Object filterMarketplaceRequest(String url, Object data) {
        if (!DeVancedSettings.isAdsDisabled()) return data;
        String body = requestBody(data);
        if (body == null) return data;

        for (String query : MARKETPLACE_AD_QUERIES) {
            if (body.contains(query)) return null;
        }

        if (body.contains("MarketplaceHomeFeedQueryRendererQuery") ||
                body.contains("MarketplaceHomeFeedPaginationQuery")) {
            String rewritten = rewriteMarketplaceVariables(body);
            if (rewritten != null) {
                Object replacement = readableMapWithString(data, rewritten);
                if (replacement != null) return replacement;
            }
        }
        return data;
    }

    public static boolean shouldBlockGameAdMessage(String type, String payload) {
        if (!DeVancedSettings.isAdsDisabled()) return false;
        String first = type == null ? "" : type.toLowerCase(Locale.US);
        String second = payload == null ? "" : payload.toLowerCase(Locale.US);
        for (String message : GAME_AD_MESSAGES) {
            if (first.equals(message) ||
                    first.contains("\"type\":\"" + message + "\"") ||
                    second.contains("\"type\":\"" + message + "\"")) {
                return true;
            }
        }
        return false;
    }

    private static List<Method> categoryGetters(Class<?> type) {
        return CATEGORY_GETTERS.computeIfAbsent(type, StrictAdBlocker::findCategoryGetters);
    }

    private static List<Method> findCategoryGetters(Class<?> type) {
        ArrayList<Method> result = new ArrayList<>();
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Method method : current.getDeclaredMethods()) {
                Class<?> returnType = method.getReturnType();
                if (method.getParameterCount() != 0 || !returnType.isEnum()) continue;
                Object[] constants = returnType.getEnumConstants();
                if (constants == null) continue;

                boolean hasSponsored = false;
                for (Object constant : constants) {
                    if (constant instanceof Enum<?> &&
                            "SPONSORED".equals(((Enum<?>) constant).name())) {
                        hasSponsored = true;
                        break;
                    }
                }
                if (!hasSponsored) continue;
                try {
                    method.setAccessible(true);
                    result.add(method);
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.unmodifiableList(result);
    }

    private static List<Field> objectFields(Class<?> type) {
        return OBJECT_FIELDS.computeIfAbsent(type, StrictAdBlocker::findObjectFields);
    }

    private static List<Field> findObjectFields(Class<?> type) {
        ArrayList<Field> result = new ArrayList<>();
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true);
                    result.add(field);
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.unmodifiableList(result);
    }

    private static boolean isLeaf(Class<?> type) {
        String name = type.getName();
        return type == String.class ||
                Number.class.isAssignableFrom(type) ||
                type == Boolean.class ||
                type == Character.class ||
                name.startsWith("android.") ||
                name.startsWith("java.time.") ||
                name.startsWith("java.lang.reflect.");
    }

    private static String requestBody(Object data) {
        if (data == null) return null;
        try {
            Method hasKey = data.getClass().getMethod("hasKey", String.class);
            Method getString = data.getClass().getMethod("getString", String.class);
            if (Boolean.TRUE.equals(hasKey.invoke(data, "string"))) {
                return (String) getString.invoke(data, "string");
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String rewriteMarketplaceVariables(String body) {
        final String marker = "variables=";
        int markerIndex = body.indexOf(marker);
        if (markerIndex < 0) return null;
        int start = markerIndex + marker.length();
        int end = body.indexOf('&', start);
        if (end < 0) end = body.length();

        try {
            String decoded = URLDecoder.decode(body.substring(start, end), "UTF-8");
            JSONObject variables = new JSONObject(decoded);
            boolean changed = false;
            if (!variables.optBoolean("shouldSkipAdRequest", false)) {
                variables.put("shouldSkipAdRequest", true);
                changed = true;
            }
            if (!variables.optBoolean("shouldSkipBoostedListingAdRequest", false)) {
                variables.put("shouldSkipBoostedListingAdRequest", true);
                changed = true;
            }
            if (!changed) return null;
            String encoded = URLEncoder.encode(variables.toString(), "UTF-8");
            return body.substring(0, start) + encoded + body.substring(end);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object readableMapWithString(Object original, String body) {
        if (original == null) return null;
        try {
            ClassLoader loader = original.getClass().getClassLoader();
            Class<?> mapClass = loader.loadClass("com.facebook.react.bridge.WritableNativeMap");
            Object replacement = mapClass.getDeclaredConstructor().newInstance();
            Method putString = mapClass.getMethod("putString", String.class, String.class);
            putString.invoke(replacement, "string", body);
            return replacement;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static final class Node {
        final Object value;
        final int depth;

        Node(Object value, int depth) {
            this.value = value;
            this.depth = depth;
        }
    }
}
