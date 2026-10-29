package app.fakh.extension.linkedin;


import java.util.Arrays;
import java.util.HashSet;
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

    /** Social count buttons of 4.1.1264: the count is a format string in the button, filled in from state. */
    private static final Set<String> COUNT_BUTTONS = new HashSet<>(Arrays.asList(
            "reaction-button", "feed-comment-button", "feed-share-button", "comment-reaction-button",
            "comment-container", "comment-reply"));
    private static final String DEFAULT_GAMES_TITLE = "Today's puzzles";
    private static volatile String gamesTitle = DEFAULT_GAMES_TITLE;
    private static final int MAX_LOGGED_VIEW_NAMES = 500;
    private static final Set<String> loggedViewNames = ConcurrentHashMap.newKeySet();
    private static final String[] COUNT_FORMATS = {"{0,plural,", "{0,number,"};

    /**
     * Called with every SDUI component before it is transformed; returns it or an edited copy. Focus mode blanks the
     * counts of the like, comment and repost buttons, and the Settings screen gets the Fakh Patches row.
     */
    public static Object rewrite(Object component) {
        component = SduiSettingsEntry.inject(component);
        if (!Settings.focusMode()) return component;
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking") ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            if (!COUNT_BUTTONS.contains(viewName)) return component;
            byte[] bytes = payload(component);
            if (bytes == null) return component;
            byte[] edited = bytes;
            for (String format : COUNT_FORMATS) edited = ProtoEdit.replaceStringsStartingWith(edited, format, "\u200b");
            if (edited == bytes) return component;
            Object copy = component.getClass().getMethod("parseFrom", byte[].class).invoke(null, (Object) edited);
            return copy != null ? copy : component;
        } catch (Throwable t) {
            Diagnostics.error("rewrite failed", t);
            return component;
        }
    }

    public static boolean shouldHide(Object component) {
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking")
                    ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            String screenName = Proto.string(component, "getObservabilityViewName");
            logViewName(viewName);
            if (viewName.isEmpty() && Settings.debug()) logUnnamed(component, screenName);
            if (MoreMenu.MORE_SCREEN.equals(screenName)) MoreMenu.capture(payload(component));

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
                case "view-likers":
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

            if (Settings.hideGames()) {
                if (isGameView(viewName)) {
                    learnGamesTitle(viewName, payload(component));
                    return hide(true, "games: " + viewName);
                }
                if (viewName.isEmpty() && isGamesHeader(payload(component))) return hide(true, "games header");
            }

            if (MoreMenu.hideItem(viewName)) return hide(true, "more item: " + viewName);

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

    /**
     * With diagnostic logging on, logs each view name once, so a report shows the names of the components a user
     * saw (for new filters). Names with digits are skipped: those can carry profile names.
     */
    private static void logViewName(String viewName) {
        if (viewName.isEmpty() || !Settings.debug() || loggedViewNames.size() >= MAX_LOGGED_VIEW_NAMES) return;
        for (int i = 0; i < viewName.length(); i++) {
            if (Character.isDigit(viewName.charAt(i))) return;
        }
        if (loggedViewNames.add(viewName)) Settings.debugLog("view " + viewName);
    }

    /** Logs the names of the child components embedded in a post, once each, to find markers for new post types. */
    private static void logChildNames(byte[] payload) {
        if (payload == null) return;
        for (String s : ProtoScanner.scan(payload).strings) {
            if (s.length() > 3 && s.length() < 60 && s.matches("[a-z]+(-[a-z]+)+")) {
                if (loggedViewNames.size() < MAX_LOGGED_VIEW_NAMES && loggedViewNames.add("child " + s)) {
                    Settings.debugLog("child " + s);
                }
            }
        }
    }

    private static void logUnnamed(Object component, String screenName) {
        if (loggedViewNames.size() >= MAX_LOGGED_VIEW_NAMES) return;
        StringBuilder sb = new StringBuilder("unnamed screen=").append(screenName).append(" strings=");
        byte[] bytes = payload(component);
        if (bytes != null) {
            int n = 0;
            for (String s : ProtoScanner.scan(bytes).strings) {
                if (s.length() > 60) continue;
                sb.append('[').append(s).append(']');
                if (++n >= 10) break;
            }
        }
        if (loggedViewNames.add(sb.toString())) Settings.debugLog(sb.toString());
    }

    private static boolean hideFeedUpdate(Object component, Object viewTracking) {
        boolean ads = Settings.hideAds();
        boolean suggested = Settings.hideSuggested();
        boolean celebrations = Settings.hideCelebrations();
        boolean jobs = Settings.hideFeedJobs();
        boolean reposts = Settings.hideReposts();
        boolean recommendations = Settings.hideRecommendations();
        boolean videos = Settings.hideVideoPosts();
        boolean shortLinks = Settings.resolveShortLinks();
        if (!ads && !suggested && !celebrations && !jobs && !reposts && !recommendations && !videos && !shortLinks) {
            return false;
        }

        byte[] payload = payload(component);
        if (Settings.debug()) logChildNames(payload);
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
        // Posts shown because of someone in the network ("X likes this", "X commented", "X reposted this",
        // "Followed by X") carry a header with that person's picture, or a highlighted comment of theirs; posts of
        // people you follow have neither.
        if (reposts && (ProtoScanner.containsAscii(payload, "feed-header-actor-image")
                || ProtoScanner.containsAscii(payload, "comment-container"))) {
            return hide(true, "network activity");
        }
        if (recommendations && isRecommendationModule(payload)) {
            return hide(true, "recommended for you");
        }
        // 4.1.1264 posts with a video embed the player controls (media-video-thumbnail-play, media-video-end-replay).
        if (videos && (ProtoScanner.containsAscii(payload, "media-video-")
                || ProtoScanner.containsAscii(payload, "large-single-video-view"))) {
            return hide(true, "video post");
        }
        // The header label is its own string field, so match the whole string, never a substring
        // of post text.
        if (suggested && ProtoScanner.hasExactString(payload, "Suggested", "Disarankan")) {
            return hide(true, "suggested post");
        }
        return false;
    }

    /**
     * "Recommended for you": a feed item listing several people or pages to follow, with a call to action and no post
     * text. Regular posts have one author, so two or more authors without post text mark the module.
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

    /**
     * Game promotions inside other screens: the search cards (search-game-card-queens) and the search carousel's
     * "Show all" (search-global-typeahead-games-carousel-show-all). The games hub itself (games-entry and its
     * children) stays, so opening the games from a shortcut or a link still shows them.
     */
    private static boolean isGameView(String viewName) {
        return viewName.contains("-game-") || viewName.contains("-games-");
    }

    /**
     * The "Today's puzzles" title above the search game cards is an unnamed text component whose only string is the
     * title. The carousel's "Show all" button carries that title as its first string, so it is learned from there
     * and the title matches in every language.
     */
    private static boolean isGamesHeader(byte[] payload) {
        if (payload == null) return false;
        List<String> strings = ProtoScanner.scan(payload).strings;
        return strings.size() == 1 && (strings.get(0).equals(gamesTitle) || strings.get(0).equals(DEFAULT_GAMES_TITLE));
    }

    private static void learnGamesTitle(String viewName, byte[] payload) {
        if (!viewName.endsWith("-games-carousel-show-all") || payload == null) return;
        List<String> strings = ProtoScanner.scan(payload).strings;
        if (!strings.isEmpty()) gamesTitle = strings.get(0);
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
