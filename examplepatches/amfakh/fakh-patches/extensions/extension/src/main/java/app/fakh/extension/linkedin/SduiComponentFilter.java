package app.fakh.extension.linkedin;


import java.util.Arrays;
import java.util.Collections;
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
    private static final String COMMENT_SHEET_PREFIX = "commentSheetNavigating_";
    private static final int MAX_HIDDEN_COMMENT_SHEETS = 500;
    /** Comment sheet keys of hidden posts, to hide their highlighted comments, which 4.1.1267 renders apart. */
    private static final Set<String> hiddenCommentSheets = ConcurrentHashMap.newKeySet();

    /**
     * Called with every SDUI component before it is transformed; returns it or an edited copy. Focus mode blanks the
     * counts of the like, comment and repost buttons, Expand posts opens the post text, and the Settings screen gets
     * the Fakh Patches row.
     */
    public static Object rewrite(Object component) {
        component = SduiSettingsEntry.inject(component);
        boolean focusMode = Settings.focusMode();
        boolean expandPosts = Settings.expandPosts();
        if (!focusMode && !expandPosts) return component;
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking") ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            boolean counts = focusMode && COUNT_BUTTONS.contains(viewName);
            boolean commentary = expandPosts && viewName.equals("feed-commentary");
            if (!counts && !commentary) return component;
            byte[] bytes = payload(component);
            if (bytes == null) return component;
            byte[] edited = commentary ? expandCommentary(bytes) : bytes;
            if (counts) {
                for (String format : COUNT_FORMATS) edited = ProtoEdit.replaceStringsStartingWith(edited, format, "\u200b");
            }
            if (edited == bytes) return component;
            Object copy = component.getClass().getMethod("parseFrom", byte[].class).invoke(null, (Object) edited);
            return copy != null ? copy : component;
        } catch (Throwable t) {
            Diagnostics.error("rewrite failed", t);
            return component;
        }
    }

    /**
     * Opens a post's text when it appears by running the action of its own "more" link, so tapping the text still
     * collapses it. The TextBlock sits in field 2 of the component's field 35, and that action in field 2 of the
     * TextBlock's field 12. The new trigger is a component field 25, with the action in field 1 and field 13 marking
     * it as firing on appear, so a collapsed post opens again when it comes back on screen.
     */
    private static byte[] expandCommentary(byte[] component) {
        byte[] expand = ProtoEdit.nested(component, 35, 2, 12, 2);
        if (expand == null) return component;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(component);
        fields.add(ProtoEdit.message(25, new ProtoEdit.Field(1, 2, expand), ProtoEdit.message(13)));
        return ProtoEdit.write(fields);
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

            if (viewName.isEmpty()) {
                byte[] bytes = payload(component);
                rememberHiddenWrapper(bytes);
                if (isCommentsOfHiddenPost(bytes)) return hide(true, "comments of a hidden post");
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
        if (ads && hasSponsoredTracking(viewTracking)) return hide(true, "sponsored feed update");
        String reason = contentFilter(payload, ProtoScanner.containsAscii(payload, "comment-container"));
        return reason != null && hide(true, reason);
    }

    /** The filter that hides a post with this payload, or null. A highlighted comment counts as network activity. */
    private static String contentFilter(byte[] payload, boolean highlightedComment) {
        if (Settings.hideAds() && ProtoScanner.containsAscii(payload, "urn:li:sponsoredContentV2:")) {
            return "sponsored feed update";
        }
        // Child components are embedded in the post payload, so their view names identify the post type.
        if (Settings.hideCelebrations() && ProtoScanner.containsAscii(payload, "feed-celebrations-update-detail")) {
            return "celebration post";
        }
        if (Settings.hideFeedJobs() && ProtoScanner.containsAscii(payload, "feed-job-card-entity")) {
            return "job post";
        }
        // Posts shown because of someone in the network ("X likes this", "X commented", "X reposted this",
        // "Followed by X") carry a header with that person's picture, or a highlighted comment of theirs; posts of
        // people you follow have neither.
        if (Settings.hideReposts() && (highlightedComment
                || ProtoScanner.containsAscii(payload, "feed-header-actor-image"))) {
            return "network activity";
        }
        if (Settings.hideRecommendations() && isRecommendationModule(payload)) {
            return "recommended for you";
        }
        // 4.1.1264 posts with a video embed the player controls (media-video-thumbnail-play, media-video-end-replay).
        if (Settings.hideVideoPosts() && (ProtoScanner.containsAscii(payload, "media-video-")
                || ProtoScanner.containsAscii(payload, "large-single-video-view"))) {
            return "video post";
        }
        // The header label is its own string field, so match the whole string, never a substring
        // of post text.
        if (Settings.hideSuggested() && ProtoScanner.hasExactString(payload, "Suggested", "Disarankan")) {
            return "suggested post";
        }
        return null;
    }

    /**
     * The wrapper of one post holds the post and its comments block and is transformed first; the two inside run on
     * different threads in either order, so the decision for the comments has to be made here. Its comments block is
     * part of this payload, so a comment does not count as network activity at this level.
     */
    private static void rememberHiddenWrapper(byte[] payload) {
        if (payload == null || !ProtoScanner.containsAscii(payload, COMMENT_SHEET_PREFIX)
                || !ProtoScanner.containsAscii(payload, "feed-full-update")
                || Collections.frequency(ProtoScanner.scan(payload).strings, "feed-full-update") != 1) {
            return;
        }
        if (contentFilter(payload, false) != null) rememberCommentSheets(payload);
    }

    /** Keeps the comment sheet keys of a hidden post, which its highlighted comments block carries too. */
    private static void rememberCommentSheets(byte[] payload) {
        if (payload == null || !ProtoScanner.containsAscii(payload, COMMENT_SHEET_PREFIX)) return;
        if (hiddenCommentSheets.size() >= MAX_HIDDEN_COMMENT_SHEETS) hiddenCommentSheets.clear();
        for (String s : ProtoScanner.scan(payload).strings) {
            if (s.startsWith(COMMENT_SHEET_PREFIX)) hiddenCommentSheets.add(s);
        }
    }

    /**
     * The highlighted comments under a post ("X commented") are a separate unnamed component that opens the post's
     * comment sheet, so it is matched to its post by that sheet's key. The feed list holds the same keys, so a
     * component that still contains posts is never it.
     */
    private static boolean isCommentsOfHiddenPost(byte[] payload) {
        if (hiddenCommentSheets.isEmpty() || payload == null
                || !ProtoScanner.containsAscii(payload, "comment-container")
                || !ProtoScanner.containsAscii(payload, COMMENT_SHEET_PREFIX)
                || ProtoScanner.containsAscii(payload, "feed-full-update")) {
            return false;
        }
        for (String s : ProtoScanner.scan(payload).strings) {
            if (s.startsWith(COMMENT_SHEET_PREFIX) && hiddenCommentSheets.contains(s)) return true;
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
