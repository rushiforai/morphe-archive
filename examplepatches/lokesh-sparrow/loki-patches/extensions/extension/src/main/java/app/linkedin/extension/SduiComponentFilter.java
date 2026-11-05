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

    /** Size of the biggest component outlined per viewer screen, so each screen's root goes into the report. */
    private static final java.util.Map<String, Integer> outlined = new ConcurrentHashMap<>();
    private static final int COMPACT_DATA_FIELD = 35;
    private static final int VIEW_TRACKING_FIELD = 26;
    private static final int TRIGGERS_FIELD = 25;
    private static final int DISPLAYED_FIELD = 40;

    /**
     * With diagnostic logging, writes the component tree of the video and document viewer into the report: view
     * names, type ids, show/hide expressions (d=) and taps (t), to build the viewers' tap to hide on.
     */
    private static void outlineViewer(String screenName, Object component) {
        if (!Settings.debug()) return;
        // Components carry the name of the data that built them (documentViewerScreenDataAware,
        // setupDataAndViewer, mediaCommentaryBottomSheetDataAware), not the screen's, so the resumed screen decides.
        String resumed = SduiMediaDownload.resumedScreen();
        if (!(resumed.endsWith(".VideoViewer") || resumed.endsWith(".DocumentViewer"))) return;
        byte[] bytes = payload(component);
        if (bytes == null) return;
        String source = screenName.substring(screenName.lastIndexOf('.') + 1);
        String key = resumed.substring(resumed.lastIndexOf('.') + 1) + "/" + source;
        Integer biggest = outlined.get(key);
        if (biggest != null && biggest >= bytes.length) return;
        outlined.put(key, bytes.length);
        StringBuilder out = new StringBuilder();
        outlineComponent(bytes, out, 0);
        Settings.debugLog("outline " + key + " (" + bytes.length + " bytes): " + out);
    }

    private static void outlineComponent(byte[] bytes, StringBuilder out, int depth) {
        java.util.List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return;
        String name = "";
        long type = -1;
        StringBuilder flags = new StringBuilder();
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2) continue;
            if (field.number == VIEW_TRACKING_FIELD) {
                for (ProtoEdit.Field f : orEmpty(ProtoEdit.parse(field.data))) {
                    if (f.number == 1 && f.wireType == 2) name = new String(f.data, java.nio.charset.StandardCharsets.UTF_8);
                }
            } else if (field.number == COMPACT_DATA_FIELD) {
                type = typeId(field.data);
            } else if (field.number == DISPLAYED_FIELD) {
                flags.append(" d=").append(describe(field.data));
            } else if (field.number == TRIGGERS_FIELD) {
                flags.append(" t");
            }
        }
        out.append('{').append(name.isEmpty() ? "-" : name).append('#').append(type).append(flags);
        if (depth < 40) {
            for (ProtoEdit.Field field : fields) {
                if (field.wireType == 2 && field.number != VIEW_TRACKING_FIELD && field.number != DISPLAYED_FIELD
                        && field.number != TRIGGERS_FIELD) {
                    findComponents(field.data, out, depth + 1, 0);
                }
            }
        }
        out.append('}');
    }

    /** Looks for nested components in a message, through the messages that hold them. */
    private static void findComponents(byte[] bytes, StringBuilder out, int depth, int hops) {
        if (hops > 8) return;
        java.util.List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || field.data.length < 2) continue;
            if (isComponent(field.data)) outlineComponent(field.data, out, depth);
            else findComponents(field.data, out, depth, hops + 1);
        }
    }

    private static boolean isComponent(byte[] bytes) {
        java.util.List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return false;
        for (ProtoEdit.Field field : fields) {
            if (field.number == COMPACT_DATA_FIELD && field.wireType == 2 && typeId(field.data) > 0) return true;
        }
        return false;
    }

    /** The type id of a CompactAny (field 1), or -1. */
    private static long typeId(byte[] compactAny) {
        for (ProtoEdit.Field f : orEmpty(ProtoEdit.parse(compactAny))) {
            if (f.number == 1 && f.wireType == 0) {
                long value = 0;
                for (int i = 0, shift = 0; i < f.data.length; i++, shift += 7) value |= (long) (f.data[i] & 0x7F) << shift;
                return value;
            }
        }
        return -1;
    }

    /** Hex of a small message, with spaces: the diagnostic report removes anything that looks like an id. */
    private static String describe(byte[] bytes) {
        StringBuilder hex = new StringBuilder("[");
        for (int i = 0; i < Math.min(bytes.length, 120); i++) {
            if (i > 0) hex.append(' ');
            hex.append(String.format("%02x", bytes[i] & 0xFF));
        }
        return hex.append(']').toString();
    }

    private static java.util.List<ProtoEdit.Field> orEmpty(java.util.List<ProtoEdit.Field> fields) {
        return fields == null ? java.util.Collections.emptyList() : fields;
    }

    private static final java.util.Set<String> AI_WORDS = new java.util.HashSet<>(java.util.Arrays.asList(
            "ai", "genai", "gai", "llm", "copilot", "assistant", "aigc"));

    /** AI prompts and assistant cards, recognized by a whole word of the view name (feed-ai-prompt, genai-...). */
    private static boolean isAiView(String viewName) {
        for (String word : viewName.split("[-_.]")) {
            if (AI_WORDS.contains(word)) return true;
        }
        return false;
    }

    /** Components of LinkedIn's puzzle games: search cards (search-game-card-queens), the hub (games-sdui-hub). */
    private static boolean isGameView(String viewName) {
        return viewName.startsWith("games-") || viewName.startsWith("game-") || viewName.contains("-game-")
                || viewName.endsWith("-game") || viewName.endsWith("-games");
    }

    /** Called with every SDUI component before shouldHide; returns it, or an edited copy (the post ⋯ menu). */
    public static Object rewrite(Object component) {
        if (Settings.viewerTapToHide()) {
            try {
                Object viewTracking = Proto.is(component, "hasViewTracking")
                        ? Proto.call(component, "getViewTracking") : null;
                component = ViewerChrome.rewrite(component, Proto.string(viewTracking, "getViewName"),
                        Proto.string(component, "getObservabilityViewName"), payload(component));
            } catch (Throwable t) {
                Diagnostics.error("viewer rewrite failed", t);
            }
        }
        if (!Settings.postMenu()) return component;
        return PostMenu.inject(component, payload(component));
    }

    public static boolean shouldHide(Object component) {
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking")
                    ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            String screenName = Proto.string(component, "getObservabilityViewName");
            logViewName(viewName);
            outlineViewer(screenName, component);
            if (Settings.hideAi() && isAiView(viewName)) {
                return hide(true, "ai: " + viewName);
            }
            if (Settings.hideGames() && isGameView(viewName)) {
                return hide(true, "games: " + viewName);
            }

            switch (viewName) {
                case "feed-full-update":
                    if (Settings.postMenu()) PostMenu.remember(payload(component));
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
                case "download-document":
                    // LinkedIn's own button, only on documents the author allows to download; ours saves any.
                    return hide(Settings.downloadMedia(), "native document download");
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
        java.util.regex.Pattern muted = mutedPattern();
        if (!ads && !suggested && !celebrations && !jobs && !reposts && !activity && !recommendations && !videos
                && !shortLinks && muted == null) {
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
        if (muted != null) {
            for (String s : ProtoScanner.scan(payload).strings) {
                java.util.regex.Matcher m = muted.matcher(s);
                if (m.find()) return hide(true, "muted word: " + m.group());
            }
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

    private static String mutedSource;
    private static java.util.regex.Pattern mutedCompiled;

    /** The muted words as one pattern of whole words and phrases, ignoring case; null when there are none. */
    private static java.util.regex.Pattern mutedPattern() {
        String words = Settings.mutedWords();
        if (words.equals(mutedSource)) return mutedCompiled;
        StringBuilder alternatives = new StringBuilder();
        for (String line : words.split("[\\n,]")) {
            String word = line.trim();
            if (word.isEmpty()) continue;
            if (alternatives.length() > 0) alternatives.append('|');
            alternatives.append(java.util.regex.Pattern.quote(word));
        }
        mutedCompiled = alternatives.length() == 0 ? null : java.util.regex.Pattern.compile(
                "(?<![\\p{L}\\p{N}])(?:" + alternatives + ")(?![\\p{L}\\p{N}])",
                java.util.regex.Pattern.CASE_INSENSITIVE | java.util.regex.Pattern.UNICODE_CASE);
        mutedSource = words;
        return mutedCompiled;
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
