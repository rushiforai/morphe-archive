/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.util.Log;

import org.json.JSONObject;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.DeVancedSettings;

/**
 * Rejects Facebook AI-labelled semantic models before Litho renders them.
 *
 * <p>Only exact schema types and keys found in Facebook 576 are used. Visible
 * text such as "AI content" is deliberately not classified.</p>
 */
public final class AiContentFilter {
    private static final String TAG = "DeVancedAiFilter";
    private static final int MAX_DEPTH = 6;
    private static final int MAX_VISITS = 192;
    private static final int MAX_COLLECTION_ITEMS = 64;
    private static final int REELS_580_MODEL_TYPE_ID = 1637226688;
    private static final String SHORTS_ATTRIBUTION =
            "XFBFBShortsGenAITransparencyAttribution";

    private static final Set<String> AI_TYPE_NAMES = Collections.unmodifiableSet(
            new HashSet<>(Arrays.asList(
                    SHORTS_ATTRIBUTION,
                    "XFBGenAITransparencyLabelInfo",
                    "XFBAIGeneratedDetectedInfo",
                    "XFBAIGeneratedSelfDisclosureInfo",
                    "XFBFBImplicitMetaAIFeedUnit"
            ))
    );
    private static final String[] AI_BOOLEAN_METHODS = {
            "isAIGenerated",
            "isSelfDisclosedAsAIGenerated",
            "wasDetectedAsAiGenerated",
            "wasSelfDisclosedAsAiGenerated"
    };
    private static final String[] AI_BOOLEAN_KEYS = {
            "is_ai_generated",
            "isAIGenerated",
            "isSelfDisclosedAsAIGenerated",
            "wasDetectedAsAiGenerated",
            "wasSelfDisclosedAsAiGenerated"
    };
    private static final String[] AI_METADATA_KEYS = {
            "ai_metadata",
            "gen_ai_transparency",
            "gen_ai_transparency_label_info"
    };

    private static final Map<Class<?>, Method> TYPE_NAME_METHODS =
            new ConcurrentHashMap<>();
    private static final Set<Class<?>> NO_TYPE_NAME_METHOD =
            Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Map<Class<?>, List<Method>> BOOLEAN_METHODS =
            new ConcurrentHashMap<>();
    private static final Map<Class<?>, List<Method>> REEL_MODEL_GETTERS =
            new ConcurrentHashMap<>();
    private static final Map<Class<?>, List<Field>> OBJECT_FIELDS =
            new ConcurrentHashMap<>();
    private static final Map<Object, Boolean> CLASSIFICATION_CACHE =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<ClassLoader, Method> SHORTS_LOOKUPS =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<ClassLoader, Reels580Types> REELS_580_TYPES =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object, Boolean> REELS_FEED_CLASSIFICATION_CACHE =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Set<ClassLoader> NO_SHORTS_LOOKUP =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(12);
    private static final AtomicInteger REELS_FILTER_LOG_BUDGET =
            new AtomicInteger(24);
    private static final AtomicInteger REELS_DIAGNOSTIC_LOG_BUDGET =
            new AtomicInteger(48);
    private static final AtomicInteger REELS_LABEL_DIAGNOSTIC_LOG_BUDGET =
            new AtomicInteger(80);
    private static final AtomicInteger REELS_COMPONENT_DIAGNOSTIC_LOG_BUDGET =
            new AtomicInteger(40);
    private static final AtomicInteger AI_STRING_DIAGNOSTIC_LOG_BUDGET =
            new AtomicInteger(4);
    private static final Map<Object, Integer> REELS_SNAPSHOT_MODELS =
            Collections.synchronizedMap(new IdentityHashMap<>());
    private static final Set<Object> REELS_INFO_COMPONENT_MODELS =
            Collections.synchronizedSet(
                    Collections.newSetFromMap(new IdentityHashMap<>())
            );
    private static final ThreadLocal<Object> NATIVE_ATTRIBUTION_MODEL =
            new ThreadLocal<>();
    private static final ThreadLocal<Object> NATIVE_REELS_AI_PREDICATE_MODEL =
            new ThreadLocal<>();

    private static volatile boolean performanceMode = true;

    private AiContentFilter() {
    }

    public static void setPerformanceMode(boolean enabled) {
        performanceMode = enabled;
        clearCache();
    }

    public static void clearCache() {
        CLASSIFICATION_CACHE.clear();
        REELS_FEED_CLASSIFICATION_CACHE.clear();
    }

    public static void trimCaches() {
        CLASSIFICATION_CACHE.clear();
        TYPE_NAME_METHODS.clear();
        NO_TYPE_NAME_METHOD.clear();
        BOOLEAN_METHODS.clear();
        REEL_MODEL_GETTERS.clear();
        OBJECT_FIELDS.clear();
        REELS_FEED_CLASSIFICATION_CACHE.clear();
        REELS_580_TYPES.clear();
        synchronized (SHORTS_LOOKUPS) {
            SHORTS_LOOKUPS.clear();
        }
        synchronized (NO_SHORTS_LOOKUP) {
            NO_SHORTS_LOOKUP.clear();
        }
        synchronized (REELS_SNAPSHOT_MODELS) {
            REELS_SNAPSHOT_MODELS.clear();
        }
        synchronized (REELS_INFO_COMPONENT_MODELS) {
            REELS_INFO_COMPONENT_MODELS.clear();
        }
        NATIVE_ATTRIBUTION_MODEL.remove();
        NATIVE_REELS_AI_PREDICATE_MODEL.remove();
    }

    public static void onFeedEdgeRejected() {
        if (LOG_BUDGET.getAndDecrement() <= 0) return;
        Log.i(
                TAG,
                "Filtered AI item at feed_collection on " +
                        Thread.currentThread().getName()
        );
    }

    /**
     * Filters an ArrayList or Guava ImmutableList while preserving its runtime
     * container type.
     */
    public static Object filterList(Object value) {
        return filterList(value, "semantic_list", false);
    }

    public static Object filterReelsList(Object value) {
        return filterList(value, "reels_collection", true);
    }

    public static Object filterReelsSnapshot(Object value) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                !(value instanceof List<?>)) {
            return value;
        }

        List<?> source = (List<?>) value;
        ArrayList<Object> kept = null;
        int size = source.size();
        for (int index = 0; index < size; index++) {
            Object item = source.get(index);
            Object model = reelModel(item);
            String marker = nativeReelsStoryAiMarker(item);
            if (marker == null) {
                marker = nativeReelsAiMarker(model);
            }
            if (marker != null) {
                if (kept == null) {
                    kept = new ArrayList<>(size - 1);
                    for (int previous = 0; previous < index; previous++) {
                        kept.add(source.get(previous));
                    }
                }
                if (LOG_BUDGET.getAndDecrement() > 0) {
                    Log.i(
                            TAG,
                            "Filtered AI item at reels_snapshot: " + marker
                    );
                }
            } else if (kept != null) {
                kept.add(item);
            }
        }
        if (kept == null) return value;

        Object rebuilt = rebuildList(value, kept);
        return rebuilt == null ? value : rebuilt;
    }

    public static boolean shouldRejectReelsItem(Object item) {
        if (!DeVancedSettings.isAiFilterEnabled() || item == null) {
            return false;
        }
        String marker = reelsItemMarker(item);
        if (marker == null) return false;

        if (REELS_FILTER_LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(TAG, "Rejected AI Reel before collection insert: " + marker);
        }
        return true;
    }

    public static Object filterReelsSemanticCollection(Object value) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                !(value instanceof Collection<?>)) {
            return value;
        }

        Collection<?> source = (Collection<?>) value;
        ArrayList<Object> kept = null;
        int index = 0;
        for (Object item : source) {
            if (shouldRejectReelsItem(item)) {
                if (kept == null) {
                    kept = new ArrayList<>(Math.max(0, source.size() - 1));
                    int previous = 0;
                    for (Object prior : source) {
                        if (previous++ >= index) break;
                        kept.add(prior);
                    }
                }
            } else if (kept != null) {
                kept.add(item);
            }
            index++;
        }
        return kept == null ? value : kept;
    }

    public static boolean shouldRejectReelsFeedItem(Object item) {
        if (item == null) return false;
        synchronized (REELS_FEED_CLASSIFICATION_CACHE) {
            Boolean cached = REELS_FEED_CLASSIFICATION_CACHE.get(item);
            if (cached != null ||
                    REELS_FEED_CLASSIFICATION_CACHE.containsKey(item)) {
                return Boolean.TRUE.equals(cached);
            }
        }

        boolean rejected = isReelsAd580(item) ||
                shouldRejectReelsItem(item) ||
                StrictAdBlocker.shouldHideFeedComponent(item);
        synchronized (REELS_FEED_CLASSIFICATION_CACHE) {
            REELS_FEED_CLASSIFICATION_CACHE.put(item, rejected);
        }
        return rejected;
    }

    public static Object filterReelsFeedCollection(Object value) {
        if (!(value instanceof Collection<?>) ||
                (!DeVancedSettings.isAiFilterEnabled() &&
                        !DeVancedSettings.isAdsDisabled())) {
            return value;
        }

        Collection<?> source = (Collection<?>) value;
        ArrayList<Object> kept = new ArrayList<>(source.size());
        for (Object item : source) {
            if (!shouldRejectReelsFeedItem(item)) {
                kept.add(item);
            }
        }
        return kept.size() == source.size() ? value : kept;
    }

    private static String reelsItemMarker(Object item) {
        String marker = nativeReelsStoryAiMarker(item);
        if (marker != null) return marker;
        return nativeReelsAiMarker(reelModel(item));
    }

    private static boolean isReelsAd580(Object item) {
        if (!DeVancedSettings.isAdsDisabled() || item == null) {
            return false;
        }
        try {
            ClassLoader loader = item.getClass().getClassLoader();
            Reels580Types types = reels580Types(loader);
            if (types == null) return false;

            Object model = item;
            if (!types.modelType.isInstance(model)) {
                Object story = reelModel(item);
                if (story == null) return false;
                model = invokeStaticThreeArg(
                        types.converter,
                        story,
                        types.concreteType,
                        REELS_580_MODEL_TYPE_ID
                );
            }
            if (model == null || !types.modelType.isInstance(model)) return false;
            Object result = types.adPredicate.invoke(
                    types.adHelperInstance,
                    model
            );
            return Boolean.TRUE.equals(result);
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static String nativeReelsStoryAiMarker(Object item) {
        if (item == null) return null;
        try {
            Object semantic = item;
            if ("X.7ZB".equals(item.getClass().getName())) {
                semantic = readNamedField(item, "A04");
            }
            // 578 Reels semantic items (8Kz/OCA via 6gv) expose the current
            // GraphQLStory through BSH(); 576 used BTd().
            Object story = reelModel(semantic);
            if (story == null) {
                story = invokeNoArg(semantic, "BSH");
            }
            if (story == null) {
                story = invokeNoArg(semantic, "BTd");
            }
            if (story == null &&
                    "com.facebook.graphql.model.GraphQLStory".equals(
                            semantic.getClass().getName()
                    )) {
                story = semantic;
            }
            if (story == null) return null;

            if (findShortsAttribution(story) != null) {
                return "story_genai_attribution";
            }

            if (hasReelsGenAiInfoAction(story)) {
                return "story_genai_info";
            }

            Object selfDisclosed = invokeNoArg(story, "A0W");
            if (selfDisclosed == null) {
                selfDisclosed = invokeNoArg(story, "A0Y");
            }
            if (Boolean.TRUE.equals(invokeIntMethod(
                    selfDisclosed,
                    "getCachedBoolean",
                    -1133610173
            ))) {
                return "story_self_disclosed";
            }

            Object detected = invokeNoArg(story, "A0X");
            if (Boolean.TRUE.equals(invokeIntMethod(
                    detected,
                    "getCachedBoolean",
                    1916708350
            ))) {
                return "story_detected";
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean hasReelsGenAiInfoAction(Object story) {
        if (story == null) return false;
        try {
            Object actionContainer = invokeNoArg(story, "A0K");
            Object actions = invokeNoArg(actionContainer, "A1F");
            if (!(actions instanceof Iterable<?>)) return false;

            ClassLoader loader = story.getClass().getClassLoader();
            Class<?> actionType = Class.forName("X.2zb", false, loader);
            Object genAiInfo = actionType.getField("A0E").get(null);
            for (Object item : (Iterable<?>) actions) {
                Object action = invokeNoArg(item, "A0D");
                Object type = invokeNoArg(action, "A04");
                if (type == genAiInfo) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static void inspectReelsSnapshot(Object value) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                !(value instanceof List<?>) ||
                REELS_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() <= 0) {
            return;
        }

        List<?> source = (List<?>) value;
        int aiCount = 0;
        StringBuilder wrappers = new StringBuilder();
        int limit = Math.min(source.size(), MAX_COLLECTION_ITEMS);
        for (int index = 0; index < limit; index++) {
            Object item = source.get(index);
            Object semantic = readNamedField(item, "A04");
            Object model = reelModel(item);
            rememberReelsSnapshotModel(model, index);
            Object attribution = model == null ? null : findShortsAttribution(model);
            if (attribution != null) {
                aiCount++;
                Log.i(
                        TAG,
                        "reels_snapshot_ai index=" + index +
                                " wrapper=" + className(item) +
                                " semantic=" + className(semantic) +
                                " model=" + identity(model) +
                                " attribution=" + identity(attribution)
                );
            }
            if (index < 12) {
                if (wrappers.length() > 0) wrappers.append(',');
                wrappers.append(index)
                        .append(':')
                        .append(className(item))
                        .append('>')
                        .append(className(semantic))
                        .append('>')
                        .append(className(model));
            }
        }
        Log.i(
                TAG,
                "reels_snapshot size=" + source.size() +
                        " ai=" + aiCount +
                        " thread=" + Thread.currentThread().getName() +
                        " wrappers=[" + wrappers + ']'
        );
    }

    public static Object inspectCurrentReelModel(Object model) {
        if (DeVancedSettings.isAiFilterEnabled() &&
                model != null &&
                REELS_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() > 0) {
            Object attribution = findShortsAttribution(model);
            Log.i(
                    TAG,
                    "reels_current model=" + identity(model) +
                            " attribution=" + identity(attribution) +
                            " thread=" + Thread.currentThread().getName()
            );
        }
        return model;
    }

    public static void beginNativeAttributionInspection(Object model) {
        if (DeVancedSettings.isAiFilterEnabled() && model != null) {
            NATIVE_ATTRIBUTION_MODEL.set(model);
        }
    }

    public static Object inspectNativeAttributionResult(Object value) {
        Object model = NATIVE_ATTRIBUTION_MODEL.get();
        NATIVE_ATTRIBUTION_MODEL.remove();
        if (!DeVancedSettings.isAiFilterEnabled() ||
                model == null ||
                REELS_LABEL_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() <= 0) {
            return value;
        }

        Integer snapshotIndex = reelsSnapshotIndex(model);
        String attributions = attributionTypes(value);
        if (snapshotIndex != null || attributions.contains(SHORTS_ATTRIBUTION)) {
            Log.i(
                    TAG,
                    "reels_attributions model=" + identity(model) +
                            " snapshotIndex=" + snapshotIndex +
                            " values=" + attributions +
                            " thread=" + Thread.currentThread().getName()
            );
        }
        return value;
    }

    public static void inspectReelsAiLabelComponent(Object component) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                component == null ||
                REELS_COMPONENT_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() <= 0) {
            return;
        }

        Object attribution = readNamedField(component, "A01");
        Object model = readNamedField(component, "A02");
        Object nativeLookup = model == null ? null : findShortsAttribution(model);
        Log.i(
                TAG,
                "reels_ai_label model=" + identity(model) +
                        " snapshotIndex=" + reelsSnapshotIndex(model) +
                        " attribution=" + identity(attribution) +
                        " attributionType=" + typeName(attribution) +
                        " lookup=" + identity(nativeLookup) +
                        " thread=" + Thread.currentThread().getName()
        );
    }

    public static void inspectReelsSponsoredAiLabelComponent(Object component) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                component == null ||
                REELS_COMPONENT_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() <= 0) {
            return;
        }

        Object session = readNamedField(component, "A00");
        Object model = readNamedField(component, "A01");
        Log.i(
                TAG,
                "reels_sponsored_ai_label model=" + identity(model) +
                        " snapshotIndex=" + reelsSnapshotIndex(model) +
                        " nativePredicate=" + nativeSponsoredAiPredicate(session, model) +
                        " marker=" + nativeReelsAiMarker(model) +
                        " thread=" + Thread.currentThread().getName()
        );
    }

    public static void beginNativeReelsAiPredicate(Object model) {
        if (DeVancedSettings.isAiFilterEnabled() && model != null) {
            NATIVE_REELS_AI_PREDICATE_MODEL.set(model);
        }
    }

    public static boolean finishNativeReelsAiPredicate(boolean result) {
        Object model = NATIVE_REELS_AI_PREDICATE_MODEL.get();
        NATIVE_REELS_AI_PREDICATE_MODEL.remove();
        if (result &&
                model != null &&
                REELS_COMPONENT_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(
                    TAG,
                    "reels_native_ai_predicate model=" + identity(model) +
                            " snapshotIndex=" + reelsSnapshotIndex(model) +
                            " marker=" + nativeReelsAiMarker(model) +
                            " thread=" + Thread.currentThread().getName()
            );
        }
        return result;
    }

    public static void inspectReelsInfoComponent(Object component) {
        if (!DeVancedSettings.isAiFilterEnabled() || component == null) return;

        Object model = readNamedField(component, "A03");
        if (model == null || !"X.9BL".equals(interfaceName(model))) {
            model = readNamedField(component, "A02");
        }
        if (model == null) return;

        synchronized (REELS_INFO_COMPONENT_MODELS) {
            if (!REELS_INFO_COMPONENT_MODELS.add(model)) return;
            if (REELS_INFO_COMPONENT_MODELS.size() > 256) {
                REELS_INFO_COMPONENT_MODELS.clear();
                REELS_INFO_COMPONENT_MODELS.add(model);
            }
        }

        Log.i(
                TAG,
                "reels_info component=" + component.getClass().getName() +
                        " model=" + identity(model) +
                        " snapshotIndex=" + reelsSnapshotIndex(model) +
                        " cacheId=" + invokeNoArg(model, "getCacheId") +
                        " attributions=" + nativeAttributionTypes(model) +
                        " marker=" + nativeReelsAiMarker(model) +
                        " thread=" + Thread.currentThread().getName()
        );
    }

    public static void inspectReelsDisclosureComponent(Object component) {
        if (!DeVancedSettings.isAiFilterEnabled() ||
                component == null ||
                REELS_COMPONENT_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() <= 0) {
            return;
        }

        Object model = readNamedField(component, "A01");
        Log.i(
                TAG,
                "reels_disclosure model=" + identity(model) +
                        " snapshotIndex=" + reelsSnapshotIndex(model) +
                        " state=" + nativeDisclosureState(model) +
                        " thread=" + Thread.currentThread().getName()
        );
    }

    public static Object inspectResolvedUiString(Object value) {
        if (DeVancedSettings.isAiFilterEnabled() &&
                "AI content".equals(value) &&
                AI_STRING_DIAGNOSTIC_LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(
                    TAG,
                    "Resolved AI content label on " +
                            Thread.currentThread().getName(),
                    new Throwable("AI content caller")
            );
        }
        return value;
    }

    private static Object filterList(
            Object value,
            String stage,
            boolean unwrapReelModels
    ) {
        if (!DeVancedSettings.isAiFilterEnabled() || !(value instanceof List<?>)) {
            return value;
        }

        List<?> source = (List<?>) value;
        ArrayList<Object> kept = null;
        int size = source.size();
        for (int index = 0; index < size; index++) {
            Object item = source.get(index);
            Object reelModel = unwrapReelModels ? reelModel(item) : null;
            Object candidate = reelModel == null ? item : reelModel;
            if (isAiGenerated(candidate)) {
                if (kept == null) {
                    kept = new ArrayList<>(size - 1);
                    for (int previous = 0; previous < index; previous++) {
                        kept.add(source.get(previous));
                    }
                }
                logFiltered(stage, candidate);
            } else if (kept != null) {
                kept.add(item);
            }
        }
        if (kept == null) return value;

        Object rebuilt = rebuildList(value, kept);
        if (rebuilt == null) {
            Log.w(TAG, "Could not preserve list type " + value.getClass().getName());
            return value;
        }
        return rebuilt;
    }

    private static Object reelModel(Object item) {
        if (item == null) return null;
        if (isReelModel(item)) return item;

        Object direct = invokeReelModelGetter(item);
        if (direct != null) return direct;

        for (Field field : objectFields(item.getClass())) {
            String fieldType = field.getType().getName();
            if (!"X.9BL".equals(fieldType) &&
                    !"X.5L3".equals(fieldType) &&
                    !"X.9cZ".equals(fieldType) &&
                    !"X.5PU".equals(fieldType) &&
                    !"X.7US".equals(fieldType) &&
                    !"X.9iM".equals(fieldType) &&
                    !"X.9iP".equals(fieldType) &&
                    !"X.6gv".equals(fieldType) &&
                    !"com.facebook.graphql.model.GraphQLStory".equals(
                            fieldType
                    )) {
                continue;
            }
            try {
                Object value = field.get(item);
                if (value == null) continue;
                if ("X.9BL".equals(fieldType) ||
                        "X.5L3".equals(fieldType) ||
                        "X.9cZ".equals(fieldType) ||
                        "X.5PU".equals(fieldType) ||
                        "com.facebook.graphql.model.GraphQLStory".equals(
                                fieldType
                        )) {
                    return value;
                }
                Object nested = reelModel(value);
                if (nested != null) return nested;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeReelModelGetter(Object value) {
        for (Method method : reelModelGetters(value.getClass())) {
            try {
                Object model = method.invoke(value);
                if (model != null) return model;
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static List<Method> reelModelGetters(Class<?> type) {
        return REEL_MODEL_GETTERS.computeIfAbsent(
                type,
                AiContentFilter::findReelModelGetters
        );
    }

    private static List<Method> findReelModelGetters(Class<?> type) {
        ArrayList<Method> result = new ArrayList<>();
        for (Method method : type.getMethods()) {
            String name = method.getName();
            String returnType = method.getReturnType().getName();
            if (method.getParameterCount() != 0 ||
                    (!"X.9BL".equals(returnType) &&
                            !"X.5L3".equals(returnType) &&
                            !"X.9cZ".equals(returnType) &&
                            !"X.5PU".equals(returnType) &&
                            !"com.facebook.graphql.model.GraphQLStory".equals(
                                    returnType
                            )) ||
                    (!"A00".equals(name) &&
                            !"A01".equals(name) &&
                            !"AGu".equals(name) &&
                            !"BSc".equals(name))) {
                continue;
            }
            try {
                method.setAccessible(true);
                result.add(method);
            } catch (Throwable ignored) {
            }
        }
        return Collections.unmodifiableList(result);
    }

    private static boolean isReelModel(Object value) {
        if (value == null) return false;
        return hasType(value.getClass(), "X.9BL") ||
                hasType(value.getClass(), "X.5L3") ||
                hasType(value.getClass(), "X.9cZ") ||
                hasType(value.getClass(), "X.5PU");
    }

    private static boolean hasType(Class<?> type, String name) {
        if (type == null) return false;
        if (name.equals(type.getName())) return true;
        for (Class<?> interfaceType : type.getInterfaces()) {
            if (hasType(interfaceType, name)) return true;
        }
        return hasType(type.getSuperclass(), name);
    }

    private static Object readNamedField(Object value, String name) {
        if (value == null) return null;
        for (Class<?> current = value.getClass();
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(value);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static String className(Object value) {
        return value == null ? "null" : value.getClass().getName();
    }

    private static String identity(Object value) {
        return value == null
                ? "null"
                : value.getClass().getName() + '@' +
                Integer.toHexString(System.identityHashCode(value));
    }

    private static void rememberReelsSnapshotModel(Object model, int index) {
        if (model == null) return;
        synchronized (REELS_SNAPSHOT_MODELS) {
            if (REELS_SNAPSHOT_MODELS.size() >= 256) {
                REELS_SNAPSHOT_MODELS.clear();
            }
            REELS_SNAPSHOT_MODELS.put(model, index);
        }
    }

    private static Integer reelsSnapshotIndex(Object model) {
        if (model == null) return null;
        synchronized (REELS_SNAPSHOT_MODELS) {
            return REELS_SNAPSHOT_MODELS.get(model);
        }
    }

    private static String attributionTypes(Object value) {
        if (!(value instanceof Iterable<?>)) return className(value);

        StringBuilder result = new StringBuilder("[");
        int count = 0;
        for (Object item : (Iterable<?>) value) {
            if (count++ >= 16) {
                result.append("...");
                break;
            }
            if (result.length() > 1) result.append(',');
            String itemType = typeName(item);
            result.append(itemType == null ? className(item) : itemType);
        }
        return result.append(']').toString();
    }

    private static String nativeAttributionTypes(Object model) {
        if (model == null) return "null";
        try {
            ClassLoader loader = model.getClass().getClassLoader();
            Class<?> type = Class.forName("X.5IJ", false, loader);
            Object instance = type.getField("A00").get(null);
            for (Method method : type.getDeclaredMethods()) {
                if ("A08".equals(method.getName()) &&
                        method.getParameterCount() == 1) {
                    method.setAccessible(true);
                    return attributionTypes(method.invoke(instance, model));
                }
            }
        } catch (Throwable ignored) {
        }
        return "unavailable";
    }

    private static String interfaceName(Object value) {
        if (value == null) return null;
        if (hasType(value.getClass(), "X.5L3")) return "X.5L3";
        if (hasType(value.getClass(), "X.9BL")) return "X.9BL";
        return null;
    }

    private static Boolean nativeSponsoredAiPredicate(
            Object session,
            Object model
    ) {
        if (session == null || model == null) return null;
        try {
            ClassLoader loader = model.getClass().getClassLoader();
            Class<?> type = Class.forName("X.Afs", false, loader);
            Object instance = type.getField("A00").get(null);
            for (Method method : type.getDeclaredMethods()) {
                if (!"A03".equals(method.getName()) ||
                        method.getParameterCount() != 2) {
                    continue;
                }
                method.setAccessible(true);
                Object result = method.invoke(instance, session, model);
                return result instanceof Boolean ? (Boolean) result : null;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String nativeReelsAiMarker(Object model) {
        if (model == null) return null;
        String authorDisclosure = nativeAuthorAiDisclosureMarker(model);
        if (authorDisclosure != null) return authorDisclosure;
        if (findShortsAttribution(model) != null) {
            return "genai_attribution";
        }
        try {
            Object aft = invokeNoArg(model, "AFS");
            Object afu = invokeNoArg(aft, "A00");
            if (afu == null) return null;

            ClassLoader loader = model.getClass().getClassLoader();
            Class<?> afvType = Class.forName("X.Afv", false, loader);
            Object sponsored = invokeCachedNullableTree(
                    afu,
                    -146063518,
                    afvType,
                    1783020703
            );
            if (sponsored != null) return "sponsored_tree";

            Class<?> xrbType = Class.forName("X.XrB", false, loader);
            Object disclosure = invokeCachedNullableTree(
                    afu,
                    1057081943,
                    xrbType,
                    1625426277
            );
            if (disclosure == null) return null;

            Object detected = invokeIntMethod(
                    disclosure,
                    "getBooleanValue",
                    -1941960999
            );
            if (Boolean.TRUE.equals(detected)) return "detected_bool";

            Class<?> stateType = Class.forName("X.YdS", false, loader);
            Object disclosedState = stateType.getField("A04").get(null);
            Object defaultState = stateType.getField("A05").get(null);
            Object state = invokeCachedEnum(
                    disclosure,
                    1666637449,
                    defaultState
            );
            if (state == disclosedState) return "self_disclosed_enum";
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String nativeAuthorAiDisclosureMarker(Object model) {
        if (model == null) return null;
        try {
            ClassLoader loader = model.getClass().getClassLoader();
            Class<?> modelHelper = Class.forName("X.9j3", false, loader);
            Object attachmentRoot = invokeStaticOneArg(
                    modelHelper,
                    "A0L",
                    model
            );
            Object attachments = invokeStaticOneArg(
                    modelHelper,
                    "A0g",
                    attachmentRoot
            );
            if (!(attachments instanceof Iterable<?>)) return null;

            Class<?> containerType = Class.forName("X.CU9", false, loader);
            Class<?> primaryType = Class.forName("X.CM6", false, loader);
            Class<?> secondaryType = Class.forName("X.CM3", false, loader);
            for (Object attachment : (Iterable<?>) attachments) {
                if (!"AiInteractiveEmbodimentAttachmentStyleInfo".equals(
                        typeName(attachment)
                )) {
                    continue;
                }

                Object container = invokeConcreteReinterpret(
                        attachment,
                        1390161507,
                        818262794,
                        containerType,
                        -1408192044
                );
                Object disclosure = invokeNoArg(container, "A00");
                if (disclosure == null) continue;

                if (invokeIwiTree(
                        disclosure,
                        primaryType,
                        865849896,
                        -10410331
                ) != null) {
                    return "author_ai_disclosure_primary";
                }
                if (invokeIwiTree(
                        disclosure,
                        secondaryType,
                        -1533743146,
                        2057668161
                ) != null) {
                    return "author_ai_disclosure_secondary";
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String nativeDisclosureState(Object model) {
        if (model == null) return "null";
        try {
            Object disclosure = invokeNoArg(model, "AFL");
            if (disclosure == null) return "no_afl";

            Object type = invokeIntMethod(
                    disclosure,
                    "getIntValue",
                    1055778621
            );
            Object primaryFlag = invokeIntMethod(
                    disclosure,
                    "getBooleanValue",
                    -2121288338
            );
            Object creatorFlag = invokeIntMethod(
                    disclosure,
                    "getBooleanValue",
                    -962870708
            );
            Object creatorFlag2 = invokeIntMethod(
                    disclosure,
                    "getBooleanValue",
                    -501112955
            );

            ClassLoader loader = model.getClass().getClassLoader();
            Object customTree = invokeCachedNullableTree(
                    disclosure,
                    -814475515,
                    Class.forName("X.AXq", false, loader),
                    -1463583704
            );
            Object qoeTree = invokeCachedNullableTree(
                    disclosure,
                    -1676707298,
                    Class.forName("X.QOE", false, loader),
                    -321583856
            );

            return "type=" + type +
                    ",primary=" + primaryFlag +
                    ",creator1=" + creatorFlag +
                    ",creator2=" + creatorFlag2 +
                    ",custom=" + (customTree != null) +
                    ",qoe=" + (qoeTree != null) +
                    ",a00=" + invokeStaticModelBoolean(loader, "A00", model) +
                    ",a01=" + invokeStaticModelBoolean(loader, "A01", model) +
                    ",a02=" + invokeStaticModelBoolean(loader, "A02", model) +
                    ",a03=" + invokeStaticModelBoolean(loader, "A03", model);
        } catch (Throwable error) {
            return "error=" + error.getClass().getSimpleName();
        }
    }

    private static Boolean invokeStaticModelBoolean(
            ClassLoader loader,
            String name,
            Object model
    ) {
        try {
            Class<?> type = Class.forName("X.AXp", false, loader);
            for (Method method : type.getDeclaredMethods()) {
                if (!name.equals(method.getName()) ||
                        method.getParameterCount() != 1) {
                    continue;
                }
                method.setAccessible(true);
                Object result = method.invoke(null, model);
                return result instanceof Boolean ? (Boolean) result : null;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object invokeNoArg(Object value, String name) {
        if (value == null) return null;
        try {
            Method method = value.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(value);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object invokeCachedNullableTree(
            Object value,
            int fieldId,
            Class<?> treeType,
            int typeId
    ) {
        if (value == null) return null;
        for (Method method : value.getClass().getMethods()) {
            if (!"getCachedNullableTree".equals(method.getName()) ||
                    method.getParameterCount() != 3) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(value, fieldId, treeType, typeId);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeCachedReinterpret(
            Object value,
            int fieldId,
            Class<?> treeType,
            int typeId
    ) {
        if (value == null) return null;
        for (Method method : value.getClass().getMethods()) {
            if (!"getCachedReinterpret".equals(method.getName()) ||
                    method.getParameterCount() != 3) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(value, fieldId, treeType, typeId);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object reinterpretPandoStory(
            Object value,
            Class<?> storyType
    ) {
        if (value == null || storyType == null) return null;
        if (storyType.isInstance(value)) return value;
        try {
            ClassLoader loader = value.getClass().getClassLoader();
            Class<?> helper = Class.forName("X.2q8", false, loader);
            for (Method method : helper.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (!"A02".equals(method.getName()) ||
                        !Modifier.isStatic(method.getModifiers()) ||
                        parameters.length != 3 ||
                        parameters[1] != Class.class ||
                        parameters[2] != Integer.TYPE ||
                        !parameters[0].isInstance(value)) {
                    continue;
                }
                method.setAccessible(true);
                return method.invoke(null, value, storyType, 1759749660);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Class<?> loadFirstClass(
            ClassLoader loader,
            String... names
    ) {
        if (loader == null) return null;
        for (String name : names) {
            try {
                return Class.forName(name, false, loader);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeConcreteReinterpret(
            Object value,
            int firstId,
            int secondId,
            Class<?> treeType,
            int typeId
    ) {
        if (value == null) return null;
        for (Method method : value.getClass().getMethods()) {
            if (!"getCachedNullableConcreteReinterpret".equals(method.getName()) ||
                    method.getParameterCount() != 4) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(
                        value,
                        firstId,
                        secondId,
                        treeType,
                        typeId
                );
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeStaticOneArg(
            Class<?> type,
            String name,
            Object argument
    ) {
        if (type == null || argument == null) return null;
        for (Method method : type.getDeclaredMethods()) {
            if (!name.equals(method.getName()) ||
                    !Modifier.isStatic(method.getModifiers()) ||
                    method.getParameterCount() != 1 ||
                    !method.getParameterTypes()[0].isInstance(argument)) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(null, argument);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeStaticThreeArg(
            Class<?> type,
            String name,
            Object first,
            Class<?> second,
            int third
    ) {
        if (type == null || first == null || second == null) return null;
        for (Method method : type.getDeclaredMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (!name.equals(method.getName()) ||
                    !Modifier.isStatic(method.getModifiers()) ||
                    parameters.length != 3 ||
                    !parameters[0].isInstance(first) ||
                    parameters[1] != Class.class ||
                    parameters[2] != Integer.TYPE) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(null, first, second, third);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeStaticThreeArg(
            Method method,
            Object first,
            Class<?> second,
            int third
    ) {
        if (method == null || first == null || second == null) return null;
        try {
            return method.invoke(null, first, second, third);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object invokeIwiTree(
            Object value,
            Class<?> treeType,
            int fieldId,
            int typeId
    ) {
        if (value == null) return null;
        try {
            ClassLoader loader = value.getClass().getClassLoader();
            Class<?> helper = Class.forName("X.19e", false, loader);
            for (Method method : helper.getDeclaredMethods()) {
                if (!"A06".equals(method.getName()) ||
                        !Modifier.isStatic(method.getModifiers()) ||
                        method.getParameterCount() != 4) {
                    continue;
                }
                try {
                    method.setAccessible(true);
                    return method.invoke(
                            null,
                            value,
                            treeType,
                            fieldId,
                            typeId
                    );
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object invokeIntMethod(
            Object value,
            String name,
            int argument
    ) {
        if (value == null) return null;
        for (Method method : value.getClass().getMethods()) {
            if (!name.equals(method.getName()) ||
                    method.getParameterCount() != 1) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(value, argument);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static Object invokeCachedEnum(
            Object value,
            int fieldId,
            Object defaultValue
    ) {
        if (value == null || defaultValue == null) return null;
        for (Method method : value.getClass().getMethods()) {
            if (!"getCachedEnum".equals(method.getName()) ||
                    method.getParameterCount() != 2) {
                continue;
            }
            try {
                method.setAccessible(true);
                return method.invoke(value, fieldId, defaultValue);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public static boolean isAiGenerated(Object root) {
        if (root == null || !DeVancedSettings.isAiFilterEnabled()) return false;
        if (performanceMode) {
            synchronized (CLASSIFICATION_CACHE) {
                Boolean cached = CLASSIFICATION_CACHE.get(root);
                if (cached != null || CLASSIFICATION_CACHE.containsKey(root)) {
                    return Boolean.TRUE.equals(cached);
                }
            }
        }

        ArrayDeque<Node> queue = new ArrayDeque<>();
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        queue.addLast(new Node(root, 0));

        int visits = 0;
        while (!queue.isEmpty() && visits++ < MAX_VISITS) {
            Node node = queue.removeFirst();
            Object value = node.value;
            if (value == null ||
                    node.depth > MAX_DEPTH ||
                    seen.put(value, Boolean.TRUE) != null) {
                continue;
            }

            if (hasExactAiMarker(value)) return remember(root, true);

            Class<?> type = value.getClass();
            if (isLeaf(type)) continue;

            if (value instanceof Map<?, ?>) {
                int count = 0;
                for (Map.Entry<?, ?> entry : ((Map<?, ?>) value).entrySet()) {
                    if (count++ >= MAX_COLLECTION_ITEMS) break;
                    Object key = entry.getKey();
                    Object child = entry.getValue();
                    if (key != null) queue.addLast(new Node(key, node.depth + 1));
                    if (child != null) queue.addLast(new Node(child, node.depth + 1));
                }
                continue;
            }
            if (value instanceof Iterable<?>) {
                int count = 0;
                for (Object child : (Iterable<?>) value) {
                    if (count++ >= MAX_COLLECTION_ITEMS) break;
                    if (child != null) queue.addLast(new Node(child, node.depth + 1));
                }
                continue;
            }
            if (type.isArray() && !type.getComponentType().isPrimitive()) {
                int length = Math.min(Array.getLength(value), MAX_COLLECTION_ITEMS);
                for (int index = 0; index < length; index++) {
                    Object child = Array.get(value, index);
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

    /**
     * Narrow normal-feed classifier. Unlike isAiGenerated(), this does not
     * walk arbitrary TreeJNI fields or run Reels attribution lookups.
     */
    public static boolean isNativeStoryAiGenerated(Object root) {
        return root != null &&
                DeVancedSettings.isAiFilterEnabled() &&
                hasNativeStoryAiMarker(root);
    }

    private static boolean hasExactAiMarker(Object value) {
        if (value == null) return false;
        if (value instanceof JSONObject) {
            return jsonHasMarker((JSONObject) value);
        }
        if (value instanceof Map<?, ?>) {
            return mapHasMarker((Map<?, ?>) value);
        }
        if (value instanceof CharSequence) {
            String str = value.toString();
            return AI_TYPE_NAMES.contains(str) || isAiString(str);
        }

        String tName = typeName(value);
        if (tName != null) {
            if (AI_TYPE_NAMES.contains(tName) ||
                    tName.contains("MetaAI") ||
                    tName.contains("GenAI") ||
                    tName.contains("AiPrompt") ||
                    tName.contains("AiGenerated") ||
                    tName.contains("ImplicitMetaAI")) {
                return true;
            }
        }
        if (hasNativeStoryAiMarker(value)) return true;
        if (findShortsAttribution(value) != null) return true;

        for (Method method : booleanMethods(value.getClass())) {
            try {
                if (Boolean.TRUE.equals(method.invoke(value))) return true;
            } catch (Throwable ignored) {
            }
        }
        return false;
    }

    /**
     * Facebook stores normal-feed AI disclosure state in GraphQL or Pando
     * TreeJNI cached booleans rather than ordinary Java fields.
     */
    private static boolean hasNativeStoryAiMarker(Object value) {
        if (value == null) return false;
        Object story = invokeNoArg(value, "BTd");
        if (story == null) story = value;

        // 578 moved self-disclosed from A0Y() to A0W(); retain the older
        // accessor for 576.
        Object selfDisclosed = invokeNoArg(story, "A0W");
        if (selfDisclosed == null) {
            selfDisclosed = invokeNoArg(story, "A0Y");
        }
        if (hasCachedBoolean(selfDisclosed, -1133610173)) return true;

        Object detected = invokeNoArg(story, "A0X");
        if (hasCachedBoolean(detected, 1916708350)) return true;

        return hasPandoStoryAiMarker(story) ||
                (story != value && hasPandoStoryAiMarker(value));
    }

    private static boolean hasPandoStoryAiMarker(Object value) {
        if (value == null) return false;
        try {
            ClassLoader loader = value.getClass().getClassLoader();
            Class<?> storyType = loadFirstClass(
                    loader,
                    "X.30V",
                    "X.C31G"
            );
            Class<?> transparencyType = loadFirstClass(
                    loader,
                    "X.30l",
                    "X.C31U"
            );
            Class<?> detectedType = loadFirstClass(
                    loader,
                    "X.30m",
                    "X.C31V"
            );
            Class<?> selfDisclosedType = loadFirstClass(
                    loader,
                    "X.30n",
                    "X.C31W"
            );
            if (storyType == null ||
                    transparencyType == null ||
                    detectedType == null ||
                    selfDisclosedType == null) {
                return false;
            }

            Object pandoStory = reinterpretPandoStory(value, storyType);
            Object transparency = invokeCachedReinterpret(
                    pandoStory,
                    -2065719258,
                    transparencyType,
                    2102714801
            );
            Object detected = invokeCachedNullableTree(
                    transparency,
                    -1258690940,
                    detectedType,
                    630175505
            );
            if (Boolean.TRUE.equals(invokeIntMethod(
                    detected,
                    "getBooleanValue",
                    1916708350
            ))) {
                return true;
            }

            Object disclosed = invokeCachedNullableTree(
                    transparency,
                    1943669876,
                    selfDisclosedType,
                    -146921327
            );
            return Boolean.TRUE.equals(invokeIntMethod(
                    disclosed,
                    "getBooleanValue",
                    -1133610173
            ));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean hasCachedBoolean(Object value, int fieldId) {
        return Boolean.TRUE.equals(
                invokeIntMethod(value, "getCachedBoolean", fieldId)
        );
    }

    private static boolean isAiString(String text) {
        if (text == null || text.isEmpty()) return false;
        String lower = text.toLowerCase(Locale.US);
        return lower.contains("meta ai") ||
                lower.contains("created with ai") ||
                lower.contains("generated with ai") ||
                lower.contains("imagined with");
    }

    private static String typeName(Object value) {
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
        if (method == null) return null;
        try {
            Object result = method.invoke(value);
            return result instanceof String ? (String) result : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method findTypeNameMethod(Class<?> type) {
        try {
            Method method = type.getMethod("getTypeName");
            if (method.getParameterCount() == 0 &&
                    method.getReturnType() == String.class) {
                method.setAccessible(true);
                return method;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** Uses Facebook's own exact Reel-attribution lookup. */
    private static Object findShortsAttribution(Object value) {
        ClassLoader loader = value.getClass().getClassLoader();
        if (loader == null) return null;

        Object attribution = findShortsAttribution580(value, loader);
        if (attribution != null) return attribution;

        attribution = findShortsAttribution578(value, loader);
        if (attribution != null) return attribution;

        Method lookup;
        synchronized (SHORTS_LOOKUPS) {
            lookup = SHORTS_LOOKUPS.get(loader);
            if (lookup == null && !NO_SHORTS_LOOKUP.contains(loader)) {
                lookup = resolveShortsLookup(loader);
                if (lookup == null) {
                    NO_SHORTS_LOOKUP.add(loader);
                } else {
                    SHORTS_LOOKUPS.put(loader, lookup);
                }
            }
        }
        if (lookup == null || !lookup.getParameterTypes()[0].isInstance(value)) {
            return null;
        }
        try {
            return lookup.invoke(null, value, SHORTS_ATTRIBUTION);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Reels580Types reels580Types(ClassLoader loader) {
        if (loader == null) return null;
        synchronized (REELS_580_TYPES) {
            Reels580Types cached = REELS_580_TYPES.get(loader);
            if (cached != null) return cached;
        }

        try {
            Class<?> modelType = Class.forName("X.5PU", false, loader);
            Class<?> concreteType = Class.forName("X.812", false, loader);
            Class<?> converterType = Class.forName("X.2XA", false, loader);
            Method converter = findNamedMethod(
                    converterType,
                    "A03",
                    3
            );

            Class<?> attributionType = Class.forName("X.AxN", false, loader);
            Method attribution = findNamedMethod(
                    attributionType,
                    "A00",
                    1
            );
            Object attributionTarget = Modifier.isStatic(
                    attribution.getModifiers()
            ) ? null : singletonValue(attributionType, "A00");

            Class<?> adType = Class.forName("X.7wK", false, loader);
            Method adPredicate = findNamedMethod(adType, "A18", 1);
            Object adHelperInstance = singletonValue(adType, "A00");

            Reels580Types resolved = new Reels580Types(
                    modelType,
                    concreteType,
                    converter,
                    attribution,
                    attributionTarget,
                    adPredicate,
                    adHelperInstance
            );
            synchronized (REELS_580_TYPES) {
                REELS_580_TYPES.put(loader, resolved);
            }
            return resolved;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method findNamedMethod(
            Class<?> type,
            String name,
            int parameterCount
    ) throws NoSuchMethodException {
        for (Method method : type.getDeclaredMethods()) {
            if (name.equals(method.getName()) &&
                    method.getParameterCount() == parameterCount) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new NoSuchMethodException(name);
    }

    private static Object singletonValue(Class<?> type, String fieldName) {
        try {
            Field field = type.getDeclaredField(fieldName);
            field.setAccessible(true);
            return field.get(null);
        } catch (Throwable error) {
            return null;
        }
    }

    private static Object findShortsAttribution580(
            Object value,
            ClassLoader loader
    ) {
        try {
            if (SHORTS_ATTRIBUTION.equals(typeName(value))) {
                return value;
            }

            Reels580Types types = reels580Types(loader);
            if (types == null) return null;

            Object model = value;
            if (!types.modelType.isInstance(model)) {
                Object story = "com.facebook.graphql.model.GraphQLStory".equals(
                        value.getClass().getName()
                ) ? value : reelModel(value);
                if (story == null) return null;
                model = invokeStaticThreeArg(
                        types.converter,
                        story,
                        types.concreteType,
                        REELS_580_MODEL_TYPE_ID
                );
            }
            if (model == null || !types.modelType.isInstance(model)) return null;

            Object attribution = types.attribution.invoke(
                    types.attributionTarget,
                    model
            );
            return attribution != null &&
                    SHORTS_ATTRIBUTION.equals(typeName(attribution))
                    ? attribution
                    : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object findShortsAttribution578(
            Object value,
            ClassLoader loader
    ) {
        try {
            Class<?> helper = Class.forName("X.7nl", false, loader);
            Object instance = helper.getField("A00").get(null);
            for (Method method : helper.getDeclaredMethods()) {
                if (!"A08".equals(method.getName()) ||
                        method.getParameterCount() != 1 ||
                        !method.getParameterTypes()[0].isInstance(value)) {
                    continue;
                }
                method.setAccessible(true);
                Object attributions = method.invoke(instance, value);
                if (!(attributions instanceof Iterable<?>)) return null;
                for (Object item : (Iterable<?>) attributions) {
                    if (item != null &&
                            SHORTS_ATTRIBUTION.equals(typeName(item))) {
                        return item;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Method resolveShortsLookup(ClassLoader loader) {
        try {
            Class<?> asv = Class.forName("X.ASV", false, loader);
            for (Method method : asv.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if ("A02".equals(method.getName()) &&
                        Modifier.isStatic(method.getModifiers()) &&
                        parameters.length == 2 &&
                        "X.9BL".equals(parameters[0].getName()) &&
                        parameters[1] == String.class &&
                        method.getReturnType() != Void.TYPE) {
                    method.setAccessible(true);
                    return method;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static List<Method> booleanMethods(Class<?> type) {
        return BOOLEAN_METHODS.computeIfAbsent(type, AiContentFilter::findBooleanMethods);
    }

    private static List<Method> findBooleanMethods(Class<?> type) {
        ArrayList<Method> result = new ArrayList<>();
        for (String name : AI_BOOLEAN_METHODS) {
            try {
                Method method = type.getMethod(name);
                Class<?> returnType = method.getReturnType();
                if (method.getParameterCount() == 0 &&
                        (returnType == Boolean.TYPE || returnType == Boolean.class)) {
                    method.setAccessible(true);
                    result.add(method);
                }
            } catch (Throwable ignored) {
            }
        }
        return Collections.unmodifiableList(result);
    }

    private static List<Field> objectFields(Class<?> type) {
        return OBJECT_FIELDS.computeIfAbsent(type, AiContentFilter::findObjectFields);
    }

    private static List<Field> findObjectFields(Class<?> type) {
        ArrayList<Field> result = new ArrayList<>();
        for (Class<?> current = type;
             current != null && current != Object.class;
             current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) ||
                        field.getType().isPrimitive()) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    result.add(field);
                } catch (Throwable ignored) {
                }
            }
        }
        return Collections.unmodifiableList(result);
    }

    private static boolean mapHasMarker(Map<?, ?> map) {
        Object typeName = map.get("__typename");
        if (typeName != null && AI_TYPE_NAMES.contains(typeName.toString())) return true;
        for (String key : AI_BOOLEAN_KEYS) {
            Object value = map.get(key);
            if (Boolean.TRUE.equals(value) ||
                    (value instanceof String && Boolean.parseBoolean((String) value))) {
                return true;
            }
        }
        for (String key : AI_METADATA_KEYS) {
            Object value = map.get(key);
            if (value != null && value != JSONObject.NULL) return true;
        }
        return false;
    }

    private static boolean jsonHasMarker(JSONObject object) {
        if (AI_TYPE_NAMES.contains(object.optString("__typename", null))) return true;
        for (String key : AI_BOOLEAN_KEYS) {
            if (object.optBoolean(key, false)) return true;
        }
        for (String key : AI_METADATA_KEYS) {
            if (object.has(key) && !object.isNull(key)) return true;
        }
        return false;
    }

    private static Object rebuildList(Object original, ArrayList<Object> kept) {
        if (original instanceof ArrayList<?>) return kept;

        String className = original.getClass().getName();
        if (className.startsWith("com.google.common.collect.") &&
                className.contains("ImmutableList")) {
            try {
                ClassLoader loader = original.getClass().getClassLoader();
                Class<?> immutableList = Class.forName(
                        "com.google.common.collect.ImmutableList",
                        false,
                        loader
                );
                for (Method method : immutableList.getMethods()) {
                    if (!"copyOf".equals(method.getName()) ||
                            !Modifier.isStatic(method.getModifiers()) ||
                            method.getParameterCount() != 1) {
                        continue;
                    }
                    Class<?> parameter = method.getParameterTypes()[0];
                    if (parameter.isAssignableFrom(ArrayList.class) ||
                            parameter == Iterable.class ||
                            parameter == Collection.class) {
                        return method.invoke(null, kept);
                    }
                }
            } catch (Throwable ignored) {
                return null;
            }
            return null;
        }

        try {
            Constructor<?> constructor = original.getClass().getDeclaredConstructor();
            constructor.setAccessible(true);
            Object copy = constructor.newInstance();
            if (copy instanceof Collection<?>) {
                @SuppressWarnings("unchecked")
                Collection<Object> collection = (Collection<Object>) copy;
                collection.addAll(kept);
                return copy;
            }
        } catch (Throwable ignored) {
        }
        return kept;
    }

    private static boolean isLeaf(Class<?> type) {
        String name = type.getName();
        return type == String.class ||
                Number.class.isAssignableFrom(type) ||
                type == Boolean.class ||
                type == Character.class ||
                type == Class.class ||
                name.startsWith("android.") ||
                name.startsWith("java.time.") ||
                name.startsWith("java.lang.reflect.") ||
                name.startsWith("kotlin.");
    }

    private static boolean remember(Object root, boolean result) {
        if (performanceMode) CLASSIFICATION_CACHE.put(root, result);
        return result;
    }

    private static void logFiltered(String stage, Object item) {
        if (LOG_BUDGET.getAndDecrement() <= 0) return;
        String typeName = typeName(item);
        Log.i(
                TAG,
                "Filtered AI item at " + stage +
                        " on " + Thread.currentThread().getName() + ": " +
                        (typeName == null ? item.getClass().getName() : typeName)
        );
    }

    private static final class Node {
        final Object value;
        final int depth;

        Node(Object value, int depth) {
            this.value = value;
            this.depth = depth;
        }
    }

    private static final class Reels580Types {
        final Class<?> modelType;
        final Class<?> concreteType;
        final Method converter;
        final Method attribution;
        final Object attributionTarget;
        final Method adPredicate;
        final Object adHelperInstance;

        Reels580Types(
                Class<?> modelType,
                Class<?> concreteType,
                Method converter,
                Method attribution,
                Object attributionTarget,
                Method adPredicate,
                Object adHelperInstance
        ) {
            this.modelType = modelType;
            this.concreteType = concreteType;
            this.converter = converter;
            this.attribution = attribution;
            this.attributionTarget = attributionTarget;
            this.adPredicate = adPredicate;
            this.adHelperInstance = adHelperInstance;
        }
    }
}
