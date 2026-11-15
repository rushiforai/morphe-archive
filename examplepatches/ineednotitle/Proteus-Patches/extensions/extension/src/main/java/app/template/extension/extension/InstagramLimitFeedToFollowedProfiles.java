/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.extension.extension;

import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unused")
public final class InstagramLimitFeedToFollowedProfiles {

    private InstagramLimitFeedToFollowedProfiles() {
    }

    /**
     * Injection point. Rewrites the default algorithmic "feed_recs" timeline
     * pagination_source header to "following" (chronological followed-only feed).
     */
    public static Map<String, String> setFollowingHeader(Map<String, String> requestHeaderMap) {
        if (requestHeaderMap == null) return null;
        if (!InstagramRuntimeFlags.isChronologicalFeedEnabled()) return requestHeaderMap;
        String paginationHeaderName = "pagination_source";

        // Patch the header only if it's trying to fetch the default recommended feed.
        String currentHeader = requestHeaderMap.get(paginationHeaderName);
        if (currentHeader != null && !currentHeader.equals("feed_recs")) {
            return requestHeaderMap;
        }

        // Create new map as original may be unmodifiable.
        Map<String, String> patchedRequestHeaderMap = new HashMap<>(requestHeaderMap);
        patchedRequestHeaderMap.put(paginationHeaderName, "following");
        return patchedRequestHeaderMap;
    }
}
