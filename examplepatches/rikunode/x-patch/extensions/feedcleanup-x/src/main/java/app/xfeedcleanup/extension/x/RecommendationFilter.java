package app.xfeedcleanup.extension.x;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Filters X recommendation timeline modules by their server entry-id prefix.
 * Kept in a unique package so it can coexist with Ahmed Yarub's extension classes.
 */
@SuppressWarnings("unused")
public final class RecommendationFilter {
    private static final String WHO_TO_FOLLOW_PREFIX = "who-to-follow";
    private static final String FIND_MORE_SEARCH_PREFIX = "toptabsrpusermodule";
    // Only post-detail related-tweet recommendations ("Discover more").
    // Never drop a generic tweetdetail entry: external post deep links may be injected
    // into Home timelines, and deleting a broader entry can break post navigation.
    private static final String FIND_MORE_POST_DETAIL_PREFIX = "tweetdetailrelatedtweets";
    // Verified by examining the DEX class/field chains of X 12.31.0 and 12.32.0:
    // w1 (URT tile item) -> a: d0 (timeline tile) -> a: s (tile content),
    // where o implements s and is serialized as TileContent.ScoreCard.
    // Match the content type itself; never rely on a sport name or entry-id prefix.
    private static final String TIMELINE_TILE_ITEM = "com.x.models.timelines.items.w1";
    private static final String TIMELINE_TILE = "com.x.models.timelines.items.d0";
    private static final String SCORE_CARD_CONTENT = "com.x.models.timelines.items.o";
    // X 12.31/12.32 UrtTimelineRelevancePrompt (the inline search feedback yes/no card).
    // Verified in official DEX: m1.a holds com.x.models.jf (TimelineRelevancePrompt),
    // m1.c() returns entry ID. Do not match ordinary tweet text or global search surveys.
    private static final String SEARCH_RELEVANCE_ITEM = "com.x.models.timelines.items.m1";

    /**
     * X 12.31 and 12.32 timeline items implement an interface whose public c() method returns the
     * server entry id. Cache that verified accessor per concrete model class instead of inspecting
     * every String field, so unrelated text can never be mistaken for an entry id.
     */
    private static final Map<Class<?>, Optional<Method>> ENTRY_ID_METHODS = new ConcurrentHashMap<>();

    private RecommendationFilter() {
    }

    /** Rewritten to true by the Hide Who to follow patch. */
    private static boolean hideWhoToFollow() {
        return false;
    }

    /** Rewritten to true by the Hide Find more patch. */
    private static boolean hideFindMore() {
        return false;
    }

    /** Rewritten to true by the optional Hide sports scores patch. */
    private static boolean hideSportsScores() {
        return false;
    }

    /** Rewritten to true only by the Hide search relevance prompt patch. */
    private static boolean hideSearchRelevancePrompt() {
        return false;
    }

    private static final class Setup {
        static final boolean HIDE_WHO_TO_FOLLOW = hideWhoToFollow();
        static final boolean HIDE_FIND_MORE = hideFindMore();
        static final boolean HIDE_SPORTS_SCORES = hideSportsScores();
        static final boolean HIDE_SEARCH_RELEVANCE_PROMPT = hideSearchRelevancePrompt();
    }

    public static boolean hide(Object item) {
        if (item == null) return false;

        if (Setup.HIDE_SPORTS_SCORES && isSportsScoreTile(item)) return true;
        if (Setup.HIDE_SEARCH_RELEVANCE_PROMPT && isSearchRelevancePrompt(item)) return true;

        String entryId = entryId(item);
        if (entryId == null) return false;

        return (Setup.HIDE_WHO_TO_FOLLOW && entryId.startsWith(WHO_TO_FOLLOW_PREFIX))
                || (Setup.HIDE_FIND_MORE && isFindMoreEntryId(entryId));
    }

    /**
     * Guard on the actual X 12.31/12.32 model structure as well as its obfuscated
     * class name: m1.a is TimelineRelevancePrompt (com.x.models.jf) and m1.c()
     * returns the URT item ID. If obfuscation changes, leave the item visible.
     * No text-based matching, no global search-survey suppression.
     */
    static boolean isSearchRelevancePrompt(Object item) {
        if (item == null || !SEARCH_RELEVANCE_ITEM.equals(item.getClass().getName())) return false;
        try {
            Class<?> type = item.getClass();
            Field content = type.getDeclaredField("a");
            Method id = type.getMethod("c");
            return "com.x.models.jf".equals(content.getType().getName())
                    && id.getParameterCount() == 0 && id.getReturnType() == String.class;
        } catch (ReflectiveOperationException | SecurityException ignored) {
            // Unknown X version: fail open rather than hide an unrelated search result.
            return false;
        }
    }

    static boolean isFindMoreEntryId(String entryId) {
        return entryId != null &&
                (entryId.startsWith(FIND_MORE_SEARCH_PREFIX) ||
                        entryId.startsWith(FIND_MORE_POST_DETAIL_PREFIX));
    }

    /**
     * Filter only the structurally verified Home timeline score-card tile.
     * X can use any entry ID, team name or event ID without affecting the match.
     * If a future app version changes obfuscated model names/fields, fail open.
     */
    static boolean isSportsScoreTile(Object item) {
        if (item == null || !TIMELINE_TILE_ITEM.equals(item.getClass().getName())) return false;

        try {
            Object tile = fieldA(item);
            if (tile == null || !TIMELINE_TILE.equals(tile.getClass().getName())) return false;

            Object content = fieldA(tile);
            return content != null && SCORE_CARD_CONTENT.equals(content.getClass().getName());
        } catch (ReflectiveOperationException | SecurityException ignored) {
            // Never hide an ordinary tweet due to a changed or inaccessible model.
            return false;
        }
    }

    private static Object fieldA(Object instance) throws ReflectiveOperationException {
        Field field = instance.getClass().getDeclaredField("a");
        field.setAccessible(true);
        return field.get(instance);
    }

    public static Object filter(Object item) {
        return hide(item) ? null : item;
    }

    private static String entryId(Object item) {
        try {
            Method method =
                    ENTRY_ID_METHODS.computeIfAbsent(
                                    item.getClass(),
                                    type -> Optional.ofNullable(entryIdMethod(type)))
                            .orElse(null);
            if (method == null) return null;

            Object value = method.invoke(item);
            return value instanceof String ? (String) value : null;
        } catch (Exception ignored) {
            // Fail open: an unexpected model should remain visible rather than breaking the timeline.
            return null;
        }
    }

    private static Method entryIdMethod(Class<?> itemClass) {
        try {
            Method method = itemClass.getMethod("c");
            return method.getParameterCount() == 0 && method.getReturnType() == String.class ? method : null;
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }
}
