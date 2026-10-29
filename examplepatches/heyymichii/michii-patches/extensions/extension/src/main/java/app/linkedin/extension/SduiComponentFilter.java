package app.linkedin.extension;

import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Hook for the server driven UI (SDUI) screens, which render through
 * ComponentTransformer.doTransform(Component, ...). Returning true makes doTransform
 * return null, which the transformer already does for components it skips.
 *
 * Markers below were taken from real payloads of LinkedIn 4.1.1255.1 (viewTracking.viewName).
 */
@SuppressWarnings("unused")
public final class SduiComponentFilter {
    private static final String MEDIA_SCREEN_PREFIX = "com.linkedin.sdui.impl.mediaproduct.screens.";
    private static final String PROFILE_MEDIA_PREFIX = "com.linkedin.sdui.impl.profile.destinations.";
    private static final int MAX_LOGGED_VIEW_NAMES = 500;
    private static final Set<String> loggedViewNames = ConcurrentHashMap.newKeySet();

    /**
     * With diagnostic logging on, logs each view name once, so a diagnostic report shows the names of the
     * components a user saw (for new filters). Names with digits are skipped: those can carry profile names.
     */
    private static void logViewName(String viewName) {
        if (viewName.isEmpty() || !Settings.debug() || loggedViewNames.size() >= MAX_LOGGED_VIEW_NAMES) return;
        for (int i = 0; i < viewName.length(); i++) {
            if (Character.isDigit(viewName.charAt(i))) return;
        }
        if (loggedViewNames.add(viewName)) Settings.debugLog("view " + viewName);
    }

    /** Components of LinkedIn's puzzle games: search cards (search-game-card-queens), the hub (games-sdui-hub). */
    private static boolean isGameView(String viewName) {
        return viewName.startsWith("games-") || viewName.startsWith("game-") || viewName.contains("-game-")
                || viewName.endsWith("-game") || viewName.endsWith("-games");
    }

    public static boolean shouldHide(Object component) {
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking")
                    ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            String screenName = Proto.string(component, "getObservabilityViewName");
            logViewName(viewName);
            if (Settings.hideGames() && isGameView(viewName)) {
                return hide(true, "games: " + viewName);
            }

            switch (viewName) {
                case "feed-full-update":
                    return hideFeedUpdate(component, viewTracking);
                case "job-card":
                    return hidePromotedJob(component);
                case "multiphoto-viewer":
                    collectMedia(component, viewName);
                    return false;
                case "feed-reaction-count":
                case "feed-comment-count":
                case "feed-repost-count":
                case "comment-reaction-count":
                    return hide(Settings.focusMode(), "focus mode: " + viewName);
                case "feed-new-update-pill":
                    return hide(Settings.hideNewPostsPill(), "new posts pill");
                case "feed-see-translation":
                    return hide(Settings.hideTranslation(), "see translation");
                case "profile-card-promo":
                    // "Suggested for you" profile section; hidden when it carries Premium upsells.
                    return hide(Settings.hidePremium()
                            && ProtoScanner.containsAscii(payload(component), "premium-upsell-card"), "profile promo");
                default:
                    break;
            }

            if (Settings.hidePremium() && viewName.contains("upsell")) {
                // premium-upsell-card, profile-ai-enhance-card-upsell, taj-home-upsell, ...
                return hide(true, "premium upsell: " + viewName);
            }

            if (screenName.startsWith(MEDIA_SCREEN_PREFIX) || screenName.startsWith(PROFILE_MEDIA_PREFIX)) {
                collectMedia(component, screenName);
            }
            return false;
        } catch (Throwable t) {
            Diagnostics.error("shouldHide failed", t);
            return false;
        }
    }

    private static boolean hideFeedUpdate(Object component, Object viewTracking) {
        boolean ads = Settings.hideAds();
        boolean suggested = Settings.hideSuggested();
        boolean celebrations = Settings.hideCelebrations();
        boolean jobs = Settings.hideFeedJobs();
        boolean reposts = Settings.hideReposts();
        boolean activity = Settings.hideActivityPosts();
        boolean recommendations = Settings.hideRecommendations();
        boolean videos = Settings.hideVideoPosts();
        boolean shortLinks = Settings.resolveShortLinks();
        if (!ads && !suggested && !celebrations && !jobs && !reposts && !activity && !recommendations && !videos
                && !shortLinks) {
            return false;
        }

        byte[] payload = payload(component);
        if (shortLinks && ProtoScanner.containsAscii(payload, ShortLinkResolver.PREFIX)) {
            for (String s : ProtoScanner.scan(payload).strings) {
                if (s.contains(ShortLinkResolver.PREFIX)) OpenLinksDirectlyPatch.prefetchShortLinks(s);
            }
        }
        if (ads && (hasSponsoredTracking(viewTracking)
                || ProtoScanner.containsAscii(payload, "urn:li:sponsoredContentV2:"))) {
            return hide(true, "sponsored feed update");
        }
        // Child components are embedded in the post payload, so their view names identify the post type.
        if (celebrations && ProtoScanner.containsAscii(payload, "feed-celebrations-update-detail")) {
            return hide(true, "celebration post");
        }
        if (jobs && ProtoScanner.containsAscii(payload, "feed-job-card-entity")) {
            return hide(true, "job post");
        }
        if (reposts && ProtoScanner.containsAscii(payload, "feed-original-share-description")) {
            return hide(true, "repost");
        }
        if (videos && ProtoScanner.containsAscii(payload, "large-single-video-view")) {
            return hide(true, "video post");
        }
        boolean recommendationModule = (recommendations || activity) && isRecommendationModule(payload);
        if (recommendations && recommendationModule) {
            return hide(true, "recommended for you");
        }
        if (activity && !recommendationModule && isActivityPost(payload)) {
            return hide(true, "post from someone's activity");
        }
        // The header label is its own string field, so match the whole string, never a substring
        // of post text.
        if (suggested && ProtoScanner.hasExactString(payload, "Suggested", "Disarankan")) {
            return hide(true, "suggested post");
        }
        return false;
    }

    /**
     * Posts shown because someone liked, commented on, or reacted to them have a header above the author ("X likes
     * this") whose text links to that person's, company's or school's page. The header comes before the author in
     * the payload, so a page action between the two belongs to the header. Matched by structure, so it works in
     * every language.
     */
    private static boolean isActivityPost(byte[] payload) {
        if (!ProtoScanner.containsAscii(payload, "feed-header")) return false;
        List<String> strings = ProtoScanner.scan(payload).strings;
        int header = strings.indexOf("feed-header");
        int author = strings.indexOf("feed-actor");
        if (header < 0 || author < header) return false;
        for (String s : strings.subList(header, author)) {
            if (s.equals("viewMember") || s.equals("viewCompany") || s.equals("viewSchool")) return true;
        }
        return false;
    }

    /**
     * "Recommended for you": a feed item listing several people or pages to follow, with a "Show more" button and
     * no post text. Regular posts have one author, so two or more authors without post text mark the module.
     */
    private static boolean isRecommendationModule(byte[] payload) {
        if (!ProtoScanner.containsAscii(payload, "feed-call-to-action")
                || !ProtoScanner.containsAscii(payload, "edge-creation-follow-action")
                || ProtoScanner.containsAscii(payload, "feed-commentary")) {
            return false;
        }
        int authors = 0;
        for (String s : ProtoScanner.scan(payload).strings) {
            if (s.equals("feed-actor") && ++authors >= 2) return true;
        }
        return false;
    }

    private static boolean hidePromotedJob(Object component) {
        if (!Settings.hidePromotedJobs()) return false;
        return hide(ProtoScanner.hasExactString(payload(component), "Promoted", "Dipromosikan"), "promoted job");
    }

    private static boolean hide(boolean hide, String reason) {
        if (hide) Settings.debugLog("hide " + reason);
        return hide;
    }

    /** viewTracking.metadata[] contains a TrackingMetadata with sponsoredData for ads. */
    private static boolean hasSponsoredTracking(Object viewTracking) {
        Object metadata = Proto.call(viewTracking, "getMetadataList");
        if (!(metadata instanceof List)) return false;
        for (Object item : (List<?>) metadata) {
            if (Proto.is(item, "hasSponsoredData")) return true;
        }
        return false;
    }

    private static void collectMedia(Object component, String source) {
        if (!Settings.downloadMedia()) return;
        SduiMediaDownload.offer(ProtoScanner.scan(payload(component)), source, source.startsWith(PROFILE_MEDIA_PREFIX));
    }

    private static byte[] payload(Object component) {
        Object bytes = Proto.call(component, "toByteArray");
        return bytes instanceof byte[] ? (byte[]) bytes : null;
    }
}
