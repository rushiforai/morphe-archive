package app.badfella.extension.linkedin;

import java.util.List;

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
    /** A post's text block; Expand posts edits only this component. */
    private static final String COMMENTARY = "feed-commentary";
    /** The video and document viewers' root; Tap to hide edits only this component. */
    private static final String VIEWER_CONTAINER = "feed-update-screen-container";
    /** Prefix of the feed's ⋯ menu page and its rows; Post menu edits only these components. */
    private static final String CONTROL_MENU = "feed-control-menu";
    private static final java.util.Set<String> AI_WORDS = new java.util.HashSet<>(java.util.Arrays.asList(
            "ai", "genai", "gai", "llm", "copilot", "assistant", "aigc"));

    /**
     * URN entity types and raw tokens that identify ad serving rather than an organic update: promoted
     * posts keep arriving under view names other than feed-full-update, so their payload is checked
     * directly. Plain byte searches, run before any parsing.
     */
    private static final String[] SPONSORED_MARKERS = {
            "urn:li:sponsoredContentV2:",
            "urn:li:sponsoredContent:",
            "urn:li:sponsoredCreative:",
            "urn:li:sponsoredUpdate:",
            "urn:li:adCreative:",
            "urn:li:adUpdate:",
            "urn:li:promotedUpdate:",
            "sponsoredcontent",
            "sponsoredcreative",
            "promotedupdate",
            "leadGenForm",
            "leadgen",
    };

    /**
     * Labels LinkedIn puts on a boosted or otherwise promoted post that carries no sponsored URN. Only
     * used to decide whether the payload is worth parsing; the parsed strings confirm the label.
     */
    private static final String[] PROMOTED_LABEL_MARKERS = {
            "Promoted", "promoted", "Sponsored", "sponsored", "Dipromosikan", "dipromosikan",
    };

    /** The labels themselves, compared case-insensitively against whole short strings. */
    private static final String[] PROMOTED_LABELS = {"promoted", "sponsored", "dipromosikan"};

    /**
     * AI prompts and assistant cards, recognized by a whole word of the view name (feed-ai-prompt, genai-...).
     * Scans the name directly: this runs for every component while the filter is on, where split()'s regex and
     * array allocation would add up.
     */
    private static boolean isAiView(String viewName) {
        int start = 0;
        for (int i = 0; i <= viewName.length(); i++) {
            char c = i == viewName.length() ? '-' : viewName.charAt(i);
            if (c != '-' && c != '_' && c != '.') continue;
            if (AI_WORDS.contains(viewName.substring(start, i))) return true;
            start = i + 1;
        }
        return false;
    }

    /** Components of LinkedIn's puzzle games: search cards (search-game-card-queens), the hub (games-sdui-hub). */
    /**
     * The heading above the game cards ("Wind down with a puzzle" on My Network, "Today's puzzles" in search) is a
     * small text part without a view name, so it can't be found by name: unnamed parts that mention a puzzle.
     */
    private static boolean isPuzzleHeading(Object component) {
        byte[] bytes = payload(component);
        return bytes != null && bytes.length < 4000 && ProtoScanner.containsAscii(bytes, "uzzle");
    }

    private static boolean isGameView(String viewName) {
        return viewName.startsWith("games-") || viewName.startsWith("game-") || viewName.contains("-game-")
                || viewName.endsWith("-game") || viewName.endsWith("-games");
    }

    /**
     * Called with every SDUI component before shouldHide; returns it, or an edited copy (the post ⋯ menu).
     *
     * doTransform also runs from the sampled viewport-visibility flow while the feed scrolls, so this runs per
     * component per sample. Every branch that needs component bytes is therefore gated on the component's view
     * name first: serializing one component also serializes its whole subtree, and doing that for every nested
     * component of every post is what made the feed stutter.
     */
    public static Object rewrite(Object component) {
        long captureStart = PerformanceCapture.beginHook();
        try {
            if (component == null) return null;
            boolean expandPosts = Settings.expandPosts();
            boolean viewer = Settings.viewerTapToHide();
            boolean postMenu = Settings.postMenu();
            boolean copyPostText = Settings.copyPostText();
            if (!expandPosts && !viewer && !postMenu && !copyPostText) return component;
            String viewName = viewName(component);
            // Before the transform builds this component's ClickActions, which the copy hook then replaces.
            if (copyPostText) CopyPostText.onComponent(component, viewName);
            if (expandPosts && COMMENTARY.equals(viewName)) {
                try {
                    byte[] bytes = payload(component);
                    byte[] edited = bytes == null ? null : expandCommentary(bytes);
                    if (edited != null && edited != bytes) {
                        Object copy = component.getClass().getMethod("parseFrom", byte[].class)
                                .invoke(null, (Object) edited);
                        if (copy != null) component = copy;
                    }
                } catch (Throwable t) {
                    Diagnostics.error("expand posts failed", t);
                }
            }
            if (viewer && VIEWER_CONTAINER.equals(viewName)) {
                try {
                    component = ViewerChrome.rewrite(component, viewName,
                            screenName(component), payload(component));
                } catch (Throwable t) {
                    Diagnostics.error("viewer rewrite failed", t);
                }
            }
            // Only the feed's control (⋯) menu page and its rows carry the template this edits.
            if (postMenu && viewName.startsWith(CONTROL_MENU)) {
                try {
                    component = PostMenu.inject(component, payload(component));
                } catch (Throwable t) {
                    Diagnostics.error("post menu failed", t);
                }
            }
            return component;

        } finally {
            PerformanceCapture.endHook(0, captureStart);
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
        if (fields == null) return component;
        fields.add(ProtoEdit.message(25, new ProtoEdit.Field(1, 2, expand), ProtoEdit.message(13)));
        return ProtoEdit.write(fields);
    }

    public static boolean shouldHide(Object component) {
        long captureStart = PerformanceCapture.beginHook();
        try {
            Object viewTracking = viewTracking(component);
            String viewName = viewName(component);
            String screen = screenName(component);
            boolean debug = Settings.debug();
            if (debug) {
                Settings.debugLog("view component");
            }
            if (MoreMenu.MORE_SCREEN.equals(screen)) MoreMenu.capture(payload(component));
            if (MoreMenu.hideItem(viewName)) return hide(true, "more item: " + viewName);
            // viewTracking already carries the unmarshalled ad metadata, so this is a cheap check that
            // catches a promoted component under any view name, not only feed-full-update.
            if (Settings.hideAds() && hasSponsoredTracking(viewTracking)) {
                return hide(true, "sponsored tracking: " + viewName);
            }
            if (Settings.hideAi() && isAiView(viewName)) {
                return hide(true, "ai: " + viewName);
            }
            if (Settings.hideGames() && isGameView(viewName)) {
                return hide(true, "games: " + viewName);
            }
            if (Settings.hideGames() && viewName.isEmpty() && isPuzzleHeading(component)) {
                return hide(true, "games heading");
            }

            switch (viewName) {
                case "feed-full-update": {
                    // One serialization of the post feeds both the remember store and the filters below.
                    byte[] post = Settings.postMenu() ? payload(component) : null;
                    if (post != null) PostMenu.remember(post);
                    return hideFeedUpdate(component, viewTracking, post);
                }
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

            if (Settings.hidePremium() && viewName.contains("upsell") && !keepViewerUpsell(viewName)) {
                // premium-upsell-card, profile-ai-enhance-card-upsell, taj-home-upsell, ...
                return hide(true, "premium upsell: " + viewName);
            }

            if (screen.startsWith(MEDIA_SCREEN_PREFIX) || screen.startsWith(PROFILE_MEDIA_PREFIX)) {
                collectMedia(component, screen);
            }
            return false;
        } catch (Throwable t) {
            Diagnostics.error("shouldHide failed", t);
            return false;
        } finally {
            PerformanceCapture.endHook(1, captureStart);
        }
    }

    /**
     * "Who viewed your profile". Free accounts see their latest viewers there, and the locked rows are wrapped in
     * the interstitial upsell parts (who-viewed-my-profile-interstitial-upsell), so hiding those hid the list
     * itself. The small Premium cards between the rows are still hidden.
     */
    private static boolean keepViewerUpsell(String viewName) {
        return viewName.contains("interstitial") && SduiMediaDownload.resumedScreen().contains(".premium.wvmp.");
    }

    private static boolean hideFeedUpdate(Object component, Object viewTracking, byte[] remembered) {
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

        byte[] payload = remembered != null ? remembered : payload(component);
        // Each ProtoScanner.scan() parses the whole post and decodes its strings, so the payload is scanned at most
        // once here and the result is shared by every check that needs the strings.
        ProtoScanner scanner = null;
        if (shortLinks && ProtoScanner.containsAscii(payload, ShortLinkResolver.PREFIX)) {
            scanner = ProtoScanner.scan(payload);
            for (String s : scanner.strings) {
                if (s.contains(ShortLinkResolver.PREFIX)) OpenLinksDirectlyPatch.prefetchShortLinks(s);
            }
        }
        if (ads) {
            if (hasSponsoredTracking(viewTracking) || containsAny(payload, SPONSORED_MARKERS)) {
                return hide(true, "sponsored feed update");
            }
            // A boosted organic post carries no sponsored URN, only a Promoted/Sponsored badge. The byte
            // check keeps posts without a label from being parsed just for this.
            if (containsAny(payload, PROMOTED_LABEL_MARKERS)) {
                if (scanner == null) scanner = ProtoScanner.scan(payload);
                if (hasPromotedLabel(scanner.strings)) return hide(true, "promoted feed update");
            }
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
        boolean recommendationModule = false;
        if (recommendations || activity) {
            // Cheap byte checks first: only a post that could be one of these modules is parsed.
            if (ProtoScanner.containsAscii(payload, "feed-call-to-action")
                    && ProtoScanner.containsAscii(payload, "edge-creation-follow-action")
                    && !ProtoScanner.containsAscii(payload, "feed-commentary")) {
                if (scanner == null) scanner = ProtoScanner.scan(payload);
                recommendationModule = isRecommendationModule(scanner);
            }
        }
        if (recommendations && recommendationModule) {
            return hide(true, "recommended for you");
        }
        if (activity && !recommendationModule && ProtoScanner.containsAscii(payload, "feed-header")) {
            if (scanner == null) scanner = ProtoScanner.scan(payload);
            if (isActivityPost(scanner)) return hide(true, "post from someone's activity");
        }
        if (muted != null) {
            if (scanner == null) scanner = ProtoScanner.scan(payload);
            for (String s : scanner.strings) {
                java.util.regex.Matcher m = muted.matcher(s);
                if (m.find()) return hide(true, "muted word: " + m.group());
            }
        }
        // The header label is its own string field, so match the whole string, never a substring
        // of post text.
        if (suggested) {
            if (scanner == null) scanner = ProtoScanner.scan(payload);
            for (String s : scanner.strings) {
                if (s.equals("Suggested") || s.equals("Disarankan")) return hide(true, "suggested post");
            }
        }
        return false;
    }

    /**
     * Posts shown because someone liked, commented on, or reacted to them have a header above the author ("X likes
     * this") whose text links to that person's, company's or school's page. The header comes before the author in
     * the payload, so a page action between the two belongs to the header. Matched by structure, so it works in
     * every language.
     */
    private static boolean isActivityPost(ProtoScanner scanner) {
        List<String> strings = scanner.strings;
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
    private static boolean isRecommendationModule(ProtoScanner scanner) {
        int authors = 0;
        for (String s : scanner.strings) {
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

    /** True if the payload contains any of the markers, as a single-byte scan per marker. */
    private static boolean containsAny(byte[] payload, String[] markers) {
        for (String marker : markers) {
            if (ProtoScanner.containsAscii(payload, marker)) return true;
        }
        return false;
    }

    /**
     * A promoted label is its own short post string ("Promoted", "Promoted by X", "Sponsored ·").
     * Compare only the leading word so a separator or a suffix does not defeat it, while a post whose
     * commentary merely mentions the word elsewhere is not matched.
     */
    private static boolean hasPromotedLabel(List<String> strings) {
        for (String s : strings) {
            if (s.length() > 60) continue;
            int end = s.length();
            while (end > 0 && !Character.isLetterOrDigit(s.charAt(end - 1))) end--;
            String value = s.substring(0, end);
            for (String label : PROMOTED_LABELS) {
                if (!value.regionMatches(true, 0, label, 0, label.length())) continue;
                if (value.length() == label.length()) return true;
                if (!Character.isLetter(value.charAt(label.length()))) return true;
            }
        }
        return false;
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

    // region Per-component memo

    /**
     * The component being processed and its view tracking, view name and bytes. rewrite and shouldHide run
     * back to back on the same component, and every lookup here is either a reflective call or a full protobuf
     * serialization of the component's subtree, so each is computed at most once per thread per component.
     *
     * A component may be transformed again for the next visibility sample: the identity check makes this a
     * cache for one component only, never stale data.
     */
    private static final Object NOT_COMPUTED = new Object();
    private static final ThreadLocal<Object[]> MEMO = new ThreadLocal<>();

    private static Object[] memo(Object component) {
        Object[] memo = MEMO.get();
        if (memo == null) {
            memo = new Object[5];
            MEMO.set(memo);
        }
        if (memo[0] != component) {
            memo[0] = component;
            memo[1] = NOT_COMPUTED;
            memo[2] = null;
            memo[3] = NOT_COMPUTED;
            memo[4] = null;
        }
        return memo;
    }

    private static Object viewTracking(Object component) {
        Object[] memo = memo(component);
        if (memo[1] == NOT_COMPUTED) {
            memo[1] = Proto.is(component, "hasViewTracking")
                    ? Proto.call(component, "getViewTracking") : null;
        }
        return memo[1] == NOT_COMPUTED ? null : memo[1];
    }

    /** viewTracking.viewName, or "": the name this filter matches components by. */
    private static String viewName(Object component) {
        Object[] memo = memo(component);
        if (memo[2] == null) memo[2] = Proto.string(viewTracking(component), "getViewName");
        return (String) memo[2];
    }

    /** The component's protobuf bytes (toByteArray), or null. Serializes the whole subtree, so call sparingly. */
    private static byte[] payload(Object component) {
        Object[] memo = memo(component);
        if (memo[3] == NOT_COMPUTED) {
            Object bytes = Proto.call(component, "toByteArray");
            memo[3] = bytes instanceof byte[] ? (byte[]) bytes : null;
        }
        return (byte[]) memo[3];
    }

    /** The screen a component belongs to (observability view name), or "". */
    private static String screenName(Object component) {
        Object[] memo = memo(component);
        if (memo[4] == null) memo[4] = Proto.string(component, "getObservabilityViewName");
        return (String) memo[4];
    }

    // endregion
}
