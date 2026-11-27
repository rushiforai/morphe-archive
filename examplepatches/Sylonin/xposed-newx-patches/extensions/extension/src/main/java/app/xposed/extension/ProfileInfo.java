package app.xposed.extension;

import android.util.Log;

import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * Asks X's timeline queries for the profile part of each user (location, website, post
 * count), which only profile lookups request otherwise. Only while a saved filter needs it
 * and "Use profile details" is on; then requests are byte for byte what X sends.
 */
final class ProfileInfo {
    static final String VARIABLE = "include_profile_info";

    /**
     * Post timelines that X always loads from the network. Others may be read from Apollo's
     * cache, where the changed variable would turn cached entries into misses.
     */
    private static final Set<String> TIMELINES = new HashSet<>(Arrays.asList(
            "HomeTimeline", "HomeTimelineLatest", "ConversationTimeline", "SearchTimelineQuery",
            "UserWithProfileTweetsQueryV2", "UserProfileRepliesTimelineQuery", "UserProfileNewRepliesTimelineQuery",
            "UserProfileOriginalsTimelineQuery", "UserProfileMediaTimelineQuery", "UserProfilePhotosTimelineQuery",
            "UserProfileVideosTimelineQuery", "UserProfileRepostsTimelineQuery", "UserProfileFavoritesTimelineQuery",
            "UserProfileHighlightsTimelineQuery", "UserProfileArticlesTimelineQuery", "ListsTimelineQuery",
            "TimelineByIdQuery", "DeviceFollowPostsTimelineQuery", "CommunityDetailTimelineQuery",
            "NotificationTimelineQuery"));

    /** Set between {@link #begin} and the end of that variables writer, when it should add the variable. */
    private static final ThreadLocal<Boolean> forcing = new ThreadLocal<>();
    private static volatile boolean broken;

    private ProfileInfo() {
    }

    static void begin(Object operation) {
        boolean on = false;
        if (!broken) {
            try {
                on = Settings.sources().profileDetails && Filters.rules().needsProfileDetails()
                        && TIMELINES.contains(ModelBridge.operationName(operation));
            } catch (Throwable t) {
                broken = true;
                Log.e(Hooks.TAG, "Timeline profile details are unavailable", t);
            }
        }
        if (on) {
            forcing.set(Boolean.TRUE);
        } else {
            forcing.remove();
        }
    }

    static String json(String json) {
        if (forcing.get() == null) return json;
        forcing.remove();
        return withVariable(json);
    }

    static Map<String, Object> map(Map<String, Object> variables) {
        if (forcing.get() == null) return variables;
        forcing.remove();
        // Absent from the map: the operation doesn't declare it. True: already included.
        if (variables == null || !Boolean.FALSE.equals(variables.get(VARIABLE))) return variables;
        Map<String, Object> copy = new LinkedHashMap<>(variables);
        copy.put(VARIABLE, Boolean.TRUE);
        return copy;
    }

    /** The variables JSON object with the variable set to true first, unless it already names it. */
    static String withVariable(String json) {
        if (json == null || !json.startsWith("{") || json.contains("\"" + VARIABLE + "\"")) return json;
        String rest = json.substring(1);
        return "{\"" + VARIABLE + "\":true" + (rest.trim().startsWith("}") ? "" : ",") + rest;
    }
}
