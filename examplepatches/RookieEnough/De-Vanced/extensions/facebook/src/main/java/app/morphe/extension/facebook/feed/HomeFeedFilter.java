/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.feed;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.facebook.AiContentFilter;
import app.morphe.extension.facebook.StrictAdBlocker;
import app.morphe.extension.facebook.settings.DeVancedSettings;

public final class HomeFeedFilter {
    private static final String FEED_TYPE =
            "com.facebook.api.feedtype.FeedType";
    private static final String FEED_CATEGORY =
            "com.crossapp.graphql.facebook.enums.GraphQLFeedStoryCategory";

    private static final Set<String> REELS_CATEGORIES =
            immutableSet(
                    "FB_SHORTS",
                    "FB_SHORTS_FALLBACK",
                    "FB_SHORTS_FEED_UNIT",
                    "FB_SHORTS_IFR_SINGLE_VIDEO_FEED_UNIT",
                    "FB_SHORTS_IN_FEED_UNIT",
                    "FB_SHORTS_MIDCARD",
                    "FB_SHORTS_MIDCARD_H_SCROLL"
            );
    private static final Set<String> REELS_TYPES =
            immutableSet(
                    "FanHubReelsUnitFeedObject",
                    "ShowcaseFeedUnit",
                    "VideoHomeFeedUnit"
            );
    private static final Set<String> STORIES_CATEGORIES =
            immutableSet(
                    "FB_STORIES",
                    "FB_STORIES_ENGAGEMENT",
                    "MULTI_FB_STORIES_TRAY"
            );
    private static final Set<String> SUGGESTION_CATEGORIES =
            immutableSet(
                    "ENGAGEMENT_QP",
                    "FRIENDLY_FEED_MID_CARD",
                    "FRIENDLY_FEED_PROMOTION",
                    "HIGH_VALUE_PROMOTION",
                    "INJECTED_STORY",
                    "PROMOTION",
                    "SHOWCASE",
                    "TRENDING"
            );
    private static final Set<String> RECOMMENDATION_TYPES =
            immutableSet(
                    "CreativePagesYouMayLikeFeedUnit",
                    "DiscoverFeedUnit",
                    "GroupsYouShouldJoinFeedUnit",
                    "PagesYouMayAdvertiseFeedUnit",
                    "PagesYouMayFollowFeedUnit",
                    "PagesYouMayLikeFeedUnit",
                    "PaginatedPagesYouMayLikeFeedUnit",
                    "PaginatedPeopleYouMayKnowFeedUnit",
                    "SuggestedShowsFeedUnit"
            );

    private static final ConcurrentHashMap<Class<?>, Field> FEED_TYPE_FIELDS =
            new ConcurrentHashMap<>();
    private static final Set<Class<?>> NO_FEED_TYPE_FIELD =
            Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final ConcurrentHashMap<Class<?>, Method> CATEGORY_METHODS =
            new ConcurrentHashMap<>();
    private static final Set<Class<?>> NO_CATEGORY_METHOD =
            Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final ConcurrentHashMap<Class<?>, Method> TYPE_NAME_METHODS =
            new ConcurrentHashMap<>();
    private static final Set<Class<?>> NO_TYPE_NAME_METHOD =
            Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Map<Object, Boolean> NATIVE_NEWS_FEED_CACHE =
            Collections.synchronizedMap(new WeakHashMap<>());

    private HomeFeedFilter() {
    }

    public static boolean filterHomeReelsFetch(boolean original) {
        return DeVancedSettings.isHomeReelsHidden() ? false : original;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static ArrayList filterHomeReelsSection(ArrayList original) {
        if (!DeVancedSettings.isHomeReelsHidden()) return original;
        return new ArrayList();
    }

    public static boolean shouldHideStoriesTray() {
        return DeVancedSettings.isHomeStoriesHidden();
    }

    public static boolean shouldHideHomeLabel(CharSequence value) {
        if (value == null || value.length() == 0 || value.length() > 120) {
            return false;
        }
        String normalized = value.toString()
                .replaceAll("[\\u200B-\\u200D\\uFEFF\\u00A0\\u00AD]", "")
                .trim()
                .toLowerCase(Locale.US);
        if (normalized.isEmpty()) return false;

        if (DeVancedSettings.isAiFilterEnabled() && isAiLabel(normalized)) {
            return true;
        }
        if (DeVancedSettings.isHomeSuggestionsHidden() &&
                (normalized.equals("suggested for you") ||
                        normalized.startsWith("suggested for you ") ||
                        normalized.contains("recommended for you") ||
                        normalized.contains("suggested posts") ||
                        normalized.contains("you may like"))) {
            return true;
        }
        if (DeVancedSettings.isHomeReelsHidden() &&
                (normalized.equals("reels") ||
                        normalized.startsWith("reels ") ||
                        normalized.contains("more reels") ||
                        normalized.contains("watch reels"))) {
            return true;
        }
        return DeVancedSettings.isHomeStoriesHidden() &&
                (normalized.equals("stories") ||
                        normalized.startsWith("stories ") ||
                        normalized.contains("stories tray"));
    }

    public static boolean shouldDropEdge(Object manager, Object edge) {
        if (edge == null) return false;
        try {
            boolean hideAds = DeVancedSettings.isAdsDisabled();
            boolean filterAi = DeVancedSettings.isAiFilterEnabled();
            boolean hideReels = DeVancedSettings.isHomeReelsHidden();
            boolean hideStories = DeVancedSettings.isHomeStoriesHidden();
            boolean hideSuggestions = DeVancedSettings.isHomeSuggestionsHidden();

            if (!hideAds && !filterAi && !hideReels && !hideStories && !hideSuggestions) {
                return false;
            }

            Object node = getNode(edge);
            String category = category(edge);

            // 1. Sponsored Ads
            if (hideAds) {
                if ("SPONSORED".equalsIgnoreCase(category)) {
                    return true;
                }
                if (node != null) {
                    String nodeClass = node.getClass().getName();
                    if (nodeClass.contains("MultiAds") || nodeClass.contains("GraphQLFBMultiAdsFeedUnit")) {
                        return true;
                    }
                    if (StrictAdBlocker.shouldHideFeedComponent(node)) {
                        return true;
                    }
                }
            }

            // 2. AI Content
            if (filterAi) {
                if (isAiStoryOrEdge(edge, node)) {
                    AiContentFilter.onFeedEdgeRejected();
                    return true;
                }
            }

            // 3. Reels, Stories, Suggestions
            if (hideReels || hideStories || hideSuggestions) {
                Kind kind = classify(category, "");
                if (kind == Kind.UNKNOWN && node != null) {
                    kind = classify(category, normalizedTypeName(node));
                }
                if (hideReels && kind == Kind.REELS_PANEL) {
                    return true;
                }
                if (hideStories && kind == Kind.STORIES_TRAY) {
                    return true;
                }
                if (hideSuggestions && (kind == Kind.SUGGESTED_POST || kind == Kind.RECOMMENDATION_MODULE)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static boolean isAiStoryOrEdge(Object edge, Object node) {
        if (edge != null) {
            String edgeCategory = category(edge);
            if ("AI_GENERATED".equalsIgnoreCase(edgeCategory) ||
                    "META_AI".equalsIgnoreCase(edgeCategory) ||
                    "GEN_AI".equalsIgnoreCase(edgeCategory)) {
                return true;
            }
        }
        if (node == null && edge != null) {
            node = getNode(edge);
        }
        if (node == null) return false;

        String typeName = normalizedTypeName(node);
        if ("XFBFBImplicitMetaAIFeedUnit".equals(typeName) ||
                typeName.contains("MetaAI") ||
                typeName.contains("GenAI") ||
                typeName.contains("AiPrompt") ||
                typeName.contains("AiGenerated") ||
                typeName.contains("ImplicitMetaAI") ||
                "XFBGenAITransparencyLabelInfo".equals(typeName) ||
                "XFBAIGeneratedDetectedInfo".equals(typeName) ||
                "XFBAIGeneratedSelfDisclosureInfo".equals(typeName)) {
            return true;
        }

        if (hasAiAttachment(node)) {
            return true;
        }

        if (hasAiTransparencyLabel(node)) {
            return true;
        }

        // Keep normal-feed classification narrow. The full graph walker is
        // intended for Reels collections; using it here can inspect unrelated
        // TreeJNI fields and reject ordinary feed stories. Only the story's
        // dedicated native disclosure/detection models are safe at insertion.
        if (AiContentFilter.isNativeStoryAiGenerated(node)) {
            return true;
        }
        return node == null &&
                AiContentFilter.isNativeStoryAiGenerated(edge);
    }

    private static boolean hasAiTransparencyLabel(Object node) {
        if (node == null) return false;
        try {
            for (Method m : node.getClass().getMethods()) {
                if (m.getParameterCount() != 0 || Modifier.isStatic(m.getModifiers())) continue;
                String mName = m.getName();
                if ("getClass".equals(mName) || "hashCode".equals(mName) || "toString".equals(mName)) continue;
                Class<?> ret = m.getReturnType();
                if (ret == Void.TYPE || ret.isPrimitive()) continue;
                String retName = ret.getSimpleName();
                if (retName.contains("GenAI") || retName.contains("MetaAI") ||
                        retName.contains("Transparency") || retName.contains("AiGenerated")) {
                    m.setAccessible(true);
                    Object val = m.invoke(node);
                    if (val != null) return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean hasAiAttachment(Object node) {
        if (node == null) return false;
        try {
            for (Method m : node.getClass().getMethods()) {
                String name = m.getName();
                if (("getAttachments".equals(name) || "A0U".equals(name)) && m.getParameterCount() == 0) {
                    m.setAccessible(true);
                    Object atts = m.invoke(node);
                    if (atts instanceof Iterable<?>) {
                        for (Object att : (Iterable<?>) atts) {
                            if (att == null) continue;
                            if (isAttachmentAi(att)) return true;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean isAttachmentAi(Object att) {
        if (att == null) return false;
        String aType = normalizedTypeName(att);
        if (aType.contains("MetaAI") || aType.contains("GenAI") ||
                aType.contains("AiInteractiveEmbodiment") ||
                "XFBGenAITransparencyLabelInfo".equals(aType) ||
                "XFBAIGeneratedDetectedInfo".equals(aType) ||
                "XFBAIGeneratedSelfDisclosureInfo".equals(aType)) {
            return true;
        }

        for (Method m : att.getClass().getMethods()) {
            if (m.getParameterCount() != 0 || Modifier.isStatic(m.getModifiers())) continue;
            String mName = m.getName();
            if ("getTarget".equals(mName) || "A04".equals(mName)) {
                try {
                    m.setAccessible(true);
                    Object target = m.invoke(att);
                    if (target != null) {
                        String tType = normalizedTypeName(target);
                        if (tType.contains("MetaAI") || tType.contains("GenAI") ||
                                tType.contains("AiGenerated") ||
                                "XFBGenAITransparencyLabelInfo".equals(tType) ||
                                "XFBAIGeneratedDetectedInfo".equals(tType) ||
                                "XFBAIGeneratedSelfDisclosureInfo".equals(tType)) {
                            return true;
                        }
                    }
                } catch (Throwable ignored) {
                }
            } else if ("getStyleList".equals(mName) || "A08".equals(mName)) {
                try {
                    m.setAccessible(true);
                    Object styles = m.invoke(att);
                    if (styles instanceof Iterable<?>) {
                        for (Object s : (Iterable<?>) styles) {
                            if (s != null) {
                                String sStr = s.toString().toUpperCase(Locale.US);
                                if (sStr.contains("GEN_AI") || sStr.contains("META_AI") || sStr.contains("AI_GENERATED")) {
                                    return true;
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return false;
    }

    private static Object getNode(Object edge) {
        if (edge == null) return null;
        // GraphQLFeedUnitEdge node accessor:
        // 576: BPx(), 578: BOZ(). A03() is the shared cached virtual-model
        // fallback used by both versions before inflation.
        for (String accessor : new String[]{"BOZ", "BPx", "A03"}) {
            for (Class<?> c = edge.getClass();
                 c != null && c != Object.class;
                 c = c.getSuperclass()) {
                try {
                    Method method = c.getDeclaredMethod(accessor);
                    if (method.getParameterCount() != 0) continue;
                    method.setAccessible(true);
                    Object node = method.invoke(edge);
                    if (node != null) return node;
                } catch (Throwable ignored) {
                }
            }
            for (Method method : edge.getClass().getMethods()) {
                if (accessor.equals(method.getName()) &&
                        method.getParameterCount() == 0) {
                    try {
                        method.setAccessible(true);
                        Object node = method.invoke(edge);
                        if (node != null) return node;
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        for (Class<?> c = edge.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                String typeName = f.getType().getName();
                if (typeName.contains("FeedUnit") || typeName.contains("GraphQLStory") || typeName.contains("FeedStory")) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(edge);
                        if (val != null) return val;
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        return null;
    }

    public static boolean isAiLabel(String text) {
        if (text == null || text.isEmpty()) return false;
        if (text.equals("ai") ||
                text.equals("ai info") ||
                text.equals("ai content") ||
                text.equals("meta ai") ||
                text.equals("ask meta ai") ||
                text.equals("ai label") ||
                text.equals("ai disclosure") ||
                text.equals("ai transparency")) {
            return true;
        }
        return text.startsWith("ai content") ||
                text.startsWith("ai info") ||
                text.startsWith("ai label") ||
                text.startsWith("ai disclosure") ||
                text.startsWith("meta ai") ||
                text.startsWith("ask meta ai") ||
                text.contains("ai content•") ||
                text.contains("ai content ·") ||
                text.contains("ai content·") ||
                text.contains("ai content ") ||
                text.contains("ai content") ||
                text.contains("meta ai") ||
                text.contains("ask meta ai") ||
                text.contains("imagined with") ||
                text.contains("created with ai") ||
                text.contains("generated with ai") ||
                text.contains("made with ai") ||
                text.contains("ai generated") ||
                text.contains("ai-generated") ||
                text.contains("ai info") ||
                text.contains("ai label") ||
                text.contains("written with ai") ||
                text.contains("with meta ai") ||
                text.contains("summarized with ai") ||
                text.contains("ai summary") ||
                text.contains("genai") ||
                text.startsWith("ai •") || text.startsWith("ai ·") ||
                text.endsWith("• ai") || text.endsWith("· ai") ||
                text.contains(" ai •") || text.contains(" ai ·");
    }

    public static boolean shouldHideFeedEdge(
            Object manager,
            Object edge,
            Object node
    ) {
        boolean hideReels = DeVancedSettings.isHomeReelsHidden();
        boolean hideStories = DeVancedSettings.isHomeStoriesHidden();
        boolean hideSuggestions =
                DeVancedSettings.isHomeSuggestionsHidden();
        if ((!hideReels && !hideStories && !hideSuggestions) ||
                !isNativeNewsFeed(manager)) {
            return false;
        }

        String category = category(edge);
        Kind kind = classify(category, "");
        String nodeType = "";
        if (kind == Kind.UNKNOWN) {
            nodeType = normalizedTypeName(node);
            kind = classify(category, nodeType);
        }
        boolean hidden =
                (hideReels && kind == Kind.REELS_PANEL) ||
                (hideStories && kind == Kind.STORIES_TRAY) ||
                (hideSuggestions &&
                        (kind == Kind.SUGGESTED_POST ||
                                kind == Kind.RECOMMENDATION_MODULE));
        return hidden;
    }

    public static boolean filterHomeFeedEdgeResult(
            boolean original,
            Object manager,
            Object edge,
            Object node
    ) {
        return original && !shouldHideFeedEdge(manager, edge, node);
    }

    public static Kind classify(String category, String nodeType) {
        String normalizedCategory =
                category == null ? "" : category;
        String normalizedType = normalizeType(nodeType);
        if (REELS_CATEGORIES.contains(normalizedCategory)) {
            return Kind.REELS_PANEL;
        }
        if (REELS_TYPES.contains(normalizedType)) {
            return Kind.REELS_PANEL;
        }
        if (STORIES_CATEGORIES.contains(normalizedCategory) ||
                "StoriesTrayFeedUnit".equals(normalizedType)) {
            return Kind.STORIES_TRAY;
        }
        if (RECOMMENDATION_TYPES.contains(normalizedType)) {
            return Kind.RECOMMENDATION_MODULE;
        }
        if (SUGGESTION_CATEGORIES.contains(normalizedCategory)) {
            return Kind.SUGGESTED_POST;
        }
        if ("ORGANIC".equals(normalizedCategory) ||
                "ENGAGEMENT".equals(normalizedCategory) ||
                "SPONSORED".equals(normalizedCategory)) {
            return Kind.ORGANIC;
        }
        return Kind.UNKNOWN;
    }

    public static void clearCaches() {
        FEED_TYPE_FIELDS.clear();
        NO_FEED_TYPE_FIELD.clear();
        CATEGORY_METHODS.clear();
        NO_CATEGORY_METHOD.clear();
        TYPE_NAME_METHODS.clear();
        NO_TYPE_NAME_METHOD.clear();
        NATIVE_NEWS_FEED_CACHE.clear();
    }

    private static boolean isNativeNewsFeed(Object manager) {
        if (manager == null) return false;
        Object feedType = feedType(manager);
        if (feedType == null) return false;
        Boolean cached = NATIVE_NEWS_FEED_CACHE.get(feedType);
        if (cached != null) return cached;

        boolean nativeNewsFeed = false;
        for (Class<?> type = feedType.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            Field[] fields;
            try {
                fields = type.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    Object value = field.get(feedType);
                    if (value instanceof CharSequence &&
                        "native_newsfeed".contentEquals(
                                    (CharSequence) value
                            )) {
                        nativeNewsFeed = true;
                        break;
                    }
                } catch (Throwable ignored) {
                }
            }
            if (nativeNewsFeed) break;
        }
        NATIVE_NEWS_FEED_CACHE.put(feedType, nativeNewsFeed);
        return nativeNewsFeed;
    }

    private static Object feedType(Object manager) {
        Class<?> type = manager.getClass();
        Field field = FEED_TYPE_FIELDS.get(type);
        if (field == null && !NO_FEED_TYPE_FIELD.contains(type)) {
            field = findFieldByType(type, FEED_TYPE);
            if (field == null) {
                NO_FEED_TYPE_FIELD.add(type);
            } else {
                FEED_TYPE_FIELDS.put(type, field);
            }
        }
        if (field == null) return null;
        try {
            return field.get(manager);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Field findFieldByType(Class<?> owner, String typeName) {
        for (Class<?> type = owner;
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) ||
                        !typeName.equals(field.getType().getName())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    return field;
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static String category(Object edge) {
        if (edge == null) return "";
        Class<?> type = edge.getClass();
        Method method = CATEGORY_METHODS.get(type);
        if (method == null && !NO_CATEGORY_METHOD.contains(type)) {
            method = findMethodByReturnType(type, FEED_CATEGORY);
            if (method == null) {
                NO_CATEGORY_METHOD.add(type);
            } else {
                CATEGORY_METHODS.put(type, method);
            }
        }
        if (method == null) return "";
        try {
            Object result = method.invoke(edge);
            return result instanceof Enum<?>
                    ? ((Enum<?>) result).name()
                    : String.valueOf(result);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String normalizedTypeName(Object value) {
        if (value == null) return "";
        Class<?> type = value.getClass();
        Method method = TYPE_NAME_METHODS.get(type);
        if (method == null && !NO_TYPE_NAME_METHOD.contains(type)) {
            method = findTypeNameMethod(type);
            if (method == null) {
                NO_TYPE_NAME_METHOD.add(type);
            } else {
                TYPE_NAME_METHODS.put(type, method);
            }
        }
        String typeName = null;
        if (method != null) {
            try {
                Object result = method.invoke(value);
                if (result instanceof String) typeName = (String) result;
            } catch (Throwable ignored) {
            }
        }
        if (typeName == null || typeName.isEmpty()) {
            typeName = type.getSimpleName();
        }
        return normalizeType(typeName);
    }

    private static Method findMethodByReturnType(
            Class<?> owner,
            String returnType
    ) {
        for (Method method : owner.getMethods()) {
            if (method.getParameterCount() == 0 &&
                    returnType.equals(method.getReturnType().getName())) {
                try {
                    method.setAccessible(true);
                    return method;
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static Method findTypeNameMethod(Class<?> owner) {
        try {
            Method method = owner.getMethod("getTypeName");
            if (method.getParameterCount() == 0 &&
                    method.getReturnType() == String.class) {
                method.setAccessible(true);
                return method;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String normalizeType(String typeName) {
        if (typeName == null) return "";
        String normalized = typeName;
        int slash = normalized.lastIndexOf('/');
        if (slash >= 0) normalized = normalized.substring(slash + 1);
        int dot = normalized.lastIndexOf('.');
        if (dot >= 0) normalized = normalized.substring(dot + 1);
        if (normalized.startsWith("GraphQL")) {
            normalized = normalized.substring("GraphQL".length());
        }
        return normalized;
    }

    private static Set<String> immutableSet(String... values) {
        return Collections.unmodifiableSet(
                new HashSet<>(Arrays.asList(values))
        );
    }

    public enum Kind {
        REELS_PANEL,
        STORIES_TRAY,
        SUGGESTED_POST,
        RECOMMENDATION_MODULE,
        ORGANIC,
        UNKNOWN
    }
}
