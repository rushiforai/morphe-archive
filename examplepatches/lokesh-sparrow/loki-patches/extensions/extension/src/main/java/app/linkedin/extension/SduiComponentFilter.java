/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Called for every component the server sent before LinkedIn renders it. Answering true makes the
 * transformer drop the component, which is exactly what it already does for the parts it does not draw,
 * so a hidden component never reaches a layout.
 *
 * Every check runs on the component's own bytes and on the names LinkedIn attached to it, never on
 * on-screen text: the app is used in many languages, and the payload is the one thing that stays the same.
 * The names used here were collected from real payloads of the supported app versions.
 */
@SuppressWarnings("unused")
public final class SduiComponentFilter {

    /** Prefixes of the screens whose payloads carry downloadable media (viewers, profile photo, banner). */
    private static final String MEDIA_SCREENS = "com.linkedin.sdui.impl.mediaproduct.screens.";
    private static final String PROFILE_MEDIA_SCREENS = "com.linkedin.sdui.impl.profile.destinations.";

    /** Field numbers of proto.sdui.components.core.Component, used by the diagnostic outline. */
    private static final int FIELD_VIEW_TRACKING = 26;
    private static final int FIELD_TRIGGERS = 25;
    private static final int FIELD_COMPACT_DATA = 35;
    private static final int FIELD_DISPLAYED = 40;

    /** Nesting limits of the outline, so a deeply nested payload cannot blow the stack. */
    private static final int MAX_OUTLINE_DEPTH = 40;
    private static final int MAX_CONTAINER_HOPS = 8;
    private static final int MAX_DESCRIBED_BYTES = 120;

    /** Words that mark an assistant or prompt card when they are a whole part of a view name. */
    private static final Set<String> AI_WORDS =
            new HashSet<>(Arrays.asList("ai", "genai", "gai", "llm", "copilot", "assistant", "aigc"));

    /**
     * View names already written to the log. Capped: a report only needs a sample of what a user sees, and
     * an uncapped set would grow for the whole session.
     */
    private static final int MAX_LOGGED_NAMES = 500;
    private static final Set<String> loggedNames = ConcurrentHashMap.newKeySet();

    /** Largest component already outlined per viewer screen, so each screen's root lands in the report once. */
    private static final Map<String, Integer> outlinedSizes = new ConcurrentHashMap<>();

    private SduiComponentFilter() {
    }

    // region Entry points

    /**
     * Runs before the hide decision and may return an edited copy of the component: the Loki items added to a
     * post's ⋯ menu, and the media viewers' tap to hide.
     */
    public static Object rewrite(Object component) {
        if (Settings.viewerTapToHide()) {
            try {
                Facts facts = new Facts(component);
                component = ViewerChrome.rewrite(component, facts.name, facts.screen, facts.bytes());
            } catch (Throwable t) {
                Diagnostics.error("viewer rewrite failed", t);
            }
        }
        if (!Settings.postMenu()) return component;
        // The menu works on the component the viewer rewrite just returned, not on the original one.
        return PostMenu.inject(component, payloadOf(component));
    }

    /** The serialized component, or null when LinkedIn's model cannot produce one. */
    private static byte[] payloadOf(Object component) {
        Object value = Proto.call(component, "toByteArray");
        return value instanceof byte[] ? (byte[]) value : null;
    }

    /** True when the component must not be drawn. Never throws: a payload it cannot read stays visible. */
    public static boolean shouldHide(Object component) {
        try {
            Facts facts = new Facts(component);
            reportWhatWasSeen(facts);
            String reason = whyHide(facts);
            if (reason == null) return false;
            Settings.debugLog("hide " + reason);
            return true;
        } catch (Throwable t) {
            Diagnostics.error("shouldHide failed", t);
            return false;
        }
    }

    // endregion

    // region The decision

    /** The reason to hide [facts], or null to keep the component. Cheap, general rules run first. */
    private static String whyHide(Facts facts) {
        String name = facts.name;

        if (Settings.hideAi() && isAssistantCard(name)) return "ai: " + name;
        if (Settings.hideGames() && isGameCard(name)) return "games: " + name;
        // The heading over the game cards has no view name at all, so only its text can identify it.
        if (Settings.hideGames() && name.isEmpty() && isPuzzleHeading(facts.bytes())) return "games heading";

        ExactRule exact = EXACT.get(name);
        if (exact != null) return exact.apply(facts);

        // Premium upsell cards carry the word in their name, except where the same parts wrap real content.
        if (Settings.hidePremium() && name.contains("upsell") && !isViewerListWrapper(name)) {
            return "premium upsell: " + name;
        }

        if (isMediaScreen(facts.screen)) {
            offerMedia(facts.scan(), facts.screen, facts.screen.startsWith(PROFILE_MEDIA_SCREENS));
        }
        return null;
    }

    /** A rule for one exact view name: the reason to hide it, or null to keep it. */
    private interface ExactRule {
        String apply(Facts facts);
    }

    private static final Map<String, ExactRule> EXACT = new HashMap<>();

    static {
        EXACT.put("multiphoto-viewer", facts -> {
            offerMedia(facts.scan(), facts.name, false);
            return null;
        });
        EXACT.put("feed-full-update", facts -> {
            if (Settings.postMenu()) PostMenu.remember(facts.bytes());
            return hideFeedUpdate(facts);
        });
        EXACT.put("job-card", facts -> hidePromotedJob(facts.bytes()));
        EXACT.put("feed-reaction-count", facts -> focusedCount(facts.name));
        EXACT.put("feed-comment-count", facts -> focusedCount(facts.name));
        EXACT.put("feed-repost-count", facts -> focusedCount(facts.name));
        EXACT.put("comment-reaction-count", facts -> focusedCount(facts.name));
        EXACT.put("feed-new-update-pill", facts -> flag(Settings.hideNewPostsPill(), "new posts pill"));
        // LinkedIn's own button, drawn only on documents the author allows to download; ours saves any document.
        EXACT.put("download-document", facts -> flag(Settings.downloadMedia(), "native document download"));
        EXACT.put("feed-see-translation", facts -> flag(Settings.hideTranslation(), "see translation"));
        // "Suggested for you" on a profile; only the variant carrying a Premium upsell is worth hiding.
        EXACT.put("profile-card-promo", facts -> flag(Settings.hidePremium()
                && ProtoScanner.containsAscii(facts.bytes(), "premium-upsell-card"), "profile promo"));
    }

    /** [reason] when [hide], so a rule reads as one expression and only logs what it actually does. */
    private static String flag(boolean hide, String reason) {
        return hide ? reason : null;
    }

    private static String focusedCount(String name) {
        return flag(Settings.focusMode(), "focus mode: " + name);
    }

    /**
     * A feed post. Its own view name says nothing about what it contains, so the rules look at the child
     * components embedded in the payload: their view names identify the post type in every language.
     */
    private static String hideFeedUpdate(Facts facts) {
        boolean ads = Settings.hideAds();
        boolean suggested = Settings.hideSuggested();
        boolean celebrations = Settings.hideCelebrations();
        boolean jobs = Settings.hideFeedJobs();
        boolean reposts = Settings.hideReposts();
        boolean activity = Settings.hideActivityPosts();
        boolean recommendations = Settings.hideRecommendations();
        boolean videos = Settings.hideVideoPosts();
        boolean shortLinks = Settings.resolveShortLinks();
        Pattern muted = mutedWordsPattern();
        if (!(ads || suggested || celebrations || jobs || reposts || activity || recommendations || videos
                || shortLinks || muted != null)) {
            return null;
        }

        byte[] bytes = facts.bytes();
        if (shortLinks && ProtoScanner.containsAscii(bytes, ShortLinkResolver.PREFIX)) {
            // Resolving happens on tap, but the payload is the only place the short links are visible at all.
            for (String text : ProtoScanner.scan(bytes).strings) {
                if (text.contains(ShortLinkResolver.PREFIX)) OpenLinksDirectlyPatch.prefetchShortLinks(text);
            }
        }
        if (ads && (hasSponsoredMetadata(facts.tracking)
                || ProtoScanner.containsAscii(bytes, "urn:li:sponsoredContentV2:"))) {
            return "sponsored feed update";
        }
        if (celebrations && ProtoScanner.containsAscii(bytes, "feed-celebrations-update-detail")) {
            return "celebration post";
        }
        if (jobs && ProtoScanner.containsAscii(bytes, "feed-job-card-entity")) {
            return "job post";
        }
        if (reposts && ProtoScanner.containsAscii(bytes, "feed-original-share-description")) {
            return "repost";
        }
        if (videos && ProtoScanner.containsAscii(bytes, "large-single-video-view")) {
            return "video post";
        }
        boolean module = (recommendations || activity) && isFollowModule(bytes);
        if (recommendations && module) {
            return "recommended for you";
        }
        if (activity && !module && isActivityPost(bytes)) {
            return "post from someone's activity";
        }
        if (muted != null) {
            for (String text : ProtoScanner.scan(bytes).strings) {
                Matcher match = muted.matcher(text);
                if (match.find()) return "muted word: " + match.group();
            }
        }
        // The header label is a string field of its own, so it is matched whole: a post that merely talks
        // about something suggested has to stay.
        if (suggested && ProtoScanner.hasExactString(bytes, "Suggested", "Disarankan")) {
            return "suggested post";
        }
        return null;
    }

    /** A job card is promoted when the header is exactly the promoted label, not when the text mentions it. */
    private static String hidePromotedJob(byte[] bytes) {
        if (!Settings.hidePromotedJobs()) return null;
        return flag(ProtoScanner.hasExactString(bytes, "Promoted", "Dipromosikan"), "promoted job");
    }

    // endregion

    // region Recognisers

    /** Assistant and prompt cards, marked by a whole word of the view name (feed-ai-prompt, genai-...). */
    private static boolean isAssistantCard(String name) {
        for (String part : name.split("[-_.]")) {
            if (AI_WORDS.contains(part)) return true;
        }
        return false;
    }

    /** LinkedIn's puzzle games: the hub (games-sdui-hub) and the cards in search (search-game-card-queens). */
    private static boolean isGameCard(String name) {
        return name.startsWith("games-") || name.startsWith("game-") || name.contains("-game-")
                || name.endsWith("-game") || name.endsWith("-games");
    }

    /**
     * The heading above the game cards ("Today's puzzles" in search, "Wind down with a puzzle" on My
     * Network) is a small text part with no view name, so it is recognised by the word in its payload.
     */
    private static boolean isPuzzleHeading(byte[] bytes) {
        return bytes != null && bytes.length < 4000 && ProtoScanner.containsAscii(bytes, "uzzle");
    }

    /**
     * "Recommended for you": one feed item listing several people or pages to follow. It carries a call to
     * action with a follow action and two or more authors, and has no commentary of its own, while a normal
     * post has exactly one author.
     */
    private static boolean isFollowModule(byte[] bytes) {
        if (!ProtoScanner.containsAscii(bytes, "feed-call-to-action")
                || !ProtoScanner.containsAscii(bytes, "edge-creation-follow-action")
                || ProtoScanner.containsAscii(bytes, "feed-commentary")) {
            return false;
        }
        int authors = 0;
        for (String text : ProtoScanner.scan(bytes).strings) {
            if (text.equals("feed-actor") && ++authors >= 2) return true;
        }
        return false;
    }

    /**
     * A post shown because somebody interacted with it ("X likes this") has a header above the author that
     * links to that person's, company's or school's page. The header comes first in the payload, so a page
     * action between the header and the author belongs to it. Structural, therefore language independent.
     */
    private static boolean isActivityPost(byte[] bytes) {
        if (!ProtoScanner.containsAscii(bytes, "feed-header")) return false;
        List<String> strings = ProtoScanner.scan(bytes).strings;
        int header = strings.indexOf("feed-header");
        int author = strings.indexOf("feed-actor");
        if (header < 0 || author < header) return false;
        for (String text : strings.subList(header, author)) {
            if (text.equals("viewMember") || text.equals("viewCompany") || text.equals("viewSchool")) return true;
        }
        return false;
    }

    /**
     * "Who viewed your profile". Free accounts see their latest viewers there, and the locked rows are
     * wrapped in the interstitial upsell parts, so hiding those would empty the list itself. The small
     * Premium cards between the rows are still hidden by the generic rule.
     */
    private static boolean isViewerListWrapper(String name) {
        return name.contains("interstitial") && SduiMediaDownload.resumedScreen().contains(".premium.wvmp.");
    }

    /** viewTracking.metadata[] holds a TrackingMetadata with sponsoredData on promoted content. */
    private static boolean hasSponsoredMetadata(Object tracking) {
        Object metadata = Proto.call(tracking, "getMetadataList");
        if (!(metadata instanceof List)) return false;
        for (Object item : (List<?>) metadata) {
            if (Proto.is(item, "hasSponsoredData")) return true;
        }
        return false;
    }

    private static boolean isMediaScreen(String screen) {
        return screen.startsWith(MEDIA_SCREENS) || screen.startsWith(PROFILE_MEDIA_SCREENS);
    }

    private static void offerMedia(ProtoScanner scan, String source, boolean profileScreen) {
        if (!Settings.downloadMedia()) return;
        SduiMediaDownload.offer(scan, source, profileScreen);
    }

    // endregion

    // region Muted words

    private static String mutedSource;
    private static Pattern mutedPattern;

    /**
     * All muted words as one alternation of whole words and phrases, ignoring case. Cached against the
     * setting, which would otherwise be read and compiled for every post. Null when nothing is muted.
     */
    private static Pattern mutedWordsPattern() {
        String words = Settings.mutedWords();
        if (words.equals(mutedSource)) return mutedPattern;
        StringBuilder alternatives = new StringBuilder();
        for (String line : words.split("[\\n,]")) {
            String word = line.trim();
            if (word.isEmpty()) continue;
            if (alternatives.length() > 0) alternatives.append('|');
            alternatives.append(Pattern.quote(word));
        }
        mutedPattern = alternatives.length() == 0 ? null : Pattern.compile(
                "(?<![\\p{L}\\p{N}])(?:" + alternatives + ")(?![\\p{L}\\p{N}])",
                Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
        mutedSource = words;
        return mutedPattern;
    }

    // endregion

    // region Diagnostics

    /**
     * With diagnostic logging on, records each view name once, so a report shows which components a user
     * actually saw, which is how new filters are found. Names with digits are skipped because they can carry
     * a member's name or an id.
     */
    private static void reportWhatWasSeen(Facts facts) {
        logViewName(facts.name);
        outlineViewer(facts);
    }

    private static void logViewName(String name) {
        if (name.isEmpty() || !Settings.debug() || loggedNames.size() >= MAX_LOGGED_NAMES) return;
        for (int i = 0; i < name.length(); i++) {
            if (Character.isDigit(name.charAt(i))) return;
        }
        if (loggedNames.add(name)) Settings.debugLog("view " + name);
    }

    /**
     * With diagnostic logging on, dumps the component tree of the video and document viewers into the
     * report: view names, type ids, the show/hide expression (d=) and whether a component has triggers.
     * That dump is what the viewers' tap to hide is built from, so it has to stay comparable.
     */
    private static void outlineViewer(Facts facts) {
        if (!Settings.debug()) return;
        // Components carry the name of the data that built them (documentViewerScreenDataAware,
        // setupDataAndViewer, mediaCommentaryBottomSheetDataAware), not the screen's, so the resumed screen
        // is what says whether the user is in a viewer.
        String resumed = SduiMediaDownload.resumedScreen();
        if (!(resumed.endsWith(".VideoViewer") || resumed.endsWith(".DocumentViewer"))) return;
        byte[] bytes = facts.bytes();
        if (bytes == null) return;
        String key = shortName(resumed) + "/" + shortName(facts.screen);
        Integer biggest = outlinedSizes.get(key);
        if (biggest != null && biggest >= bytes.length) return;
        outlinedSizes.put(key, bytes.length);
        StringBuilder out = new StringBuilder();
        appendComponent(bytes, out, 0);
        Settings.debugLog("outline " + key + " (" + bytes.length + " bytes): " + out);
    }

    private static String shortName(String screen) {
        return screen.substring(screen.lastIndexOf('.') + 1);
    }

    /** One component as {name#type flags{child}{child}}, keeping the order of its fields. */
    private static void appendComponent(byte[] bytes, StringBuilder out, int depth) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return;
        String name = "";
        long type = -1;
        StringBuilder flags = new StringBuilder();
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2) continue;
            if (field.number == FIELD_VIEW_TRACKING) {
                for (ProtoEdit.Field inner : orEmpty(ProtoEdit.parse(field.data))) {
                    if (inner.number == 1 && inner.wireType == 2) {
                        name = new String(inner.data, StandardCharsets.UTF_8);
                    }
                }
            } else if (field.number == FIELD_COMPACT_DATA) {
                type = compactType(field.data);
            } else if (field.number == FIELD_DISPLAYED) {
                flags.append(" d=").append(hexPreview(field.data));
            } else if (field.number == FIELD_TRIGGERS) {
                flags.append(" t");
            }
        }
        out.append('{').append(name.isEmpty() ? "-" : name).append('#').append(type).append(flags);
        if (depth < MAX_OUTLINE_DEPTH) {
            for (ProtoEdit.Field field : fields) {
                if (field.wireType == 2 && field.number != FIELD_VIEW_TRACKING
                        && field.number != FIELD_DISPLAYED && field.number != FIELD_TRIGGERS) {
                    appendChildren(field.data, out, depth + 1, 0);
                }
            }
        }
        out.append('}');
    }

    /** Walks a message looking for nested components, through the wrappers that hold them. */
    private static void appendChildren(byte[] bytes, StringBuilder out, int depth, int hops) {
        if (hops > MAX_CONTAINER_HOPS) return;
        List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return;
        for (ProtoEdit.Field field : fields) {
            if (field.wireType != 2 || field.data.length < 2) continue;
            if (looksLikeComponent(field.data)) appendComponent(field.data, out, depth);
            else appendChildren(field.data, out, depth, hops + 1);
        }
    }

    /** A component is recognised by a CompactAny (field 35) that names a real type. */
    private static boolean looksLikeComponent(byte[] bytes) {
        List<ProtoEdit.Field> fields = ProtoEdit.parse(bytes);
        if (fields == null) return false;
        for (ProtoEdit.Field field : fields) {
            if (field.number == FIELD_COMPACT_DATA && field.wireType == 2 && compactType(field.data) > 0) return true;
        }
        return false;
    }

    /** The type id in field 1 of a CompactAny, or -1 when there is none. */
    private static long compactType(byte[] compactAny) {
        for (ProtoEdit.Field field : orEmpty(ProtoEdit.parse(compactAny))) {
            if (field.number == 1 && field.wireType == 0) {
                long value = 0;
                for (int i = 0, shift = 0; i < field.data.length; i++, shift += 7) {
                    value |= (long) (field.data[i] & 0x7F) << shift;
                }
                return value;
            }
        }
        return -1;
    }

    /** Hex of a short message. The report strips anything that looks like an id, so hex is safe to log. */
    private static String hexPreview(byte[] bytes) {
        StringBuilder hex = new StringBuilder("[");
        for (int i = 0; i < Math.min(bytes.length, MAX_DESCRIBED_BYTES); i++) {
            if (i > 0) hex.append(' ');
            hex.append(String.format("%02x", bytes[i] & 0xFF));
        }
        return hex.append(']').toString();
    }

    private static List<ProtoEdit.Field> orEmpty(List<ProtoEdit.Field> fields) {
        return fields == null ? Collections.<ProtoEdit.Field>emptyList() : fields;
    }

    // endregion

    /** A component under inspection: its names, plus the payload read only once a rule actually needs it. */
    private static final class Facts {
        final Object component;
        final Object tracking;
        final String name;
        final String screen;
        private byte[] bytes;
        private boolean decoded;
        private ProtoScanner scan;

        Facts(Object component) {
            this.component = component;
            this.tracking = Proto.is(component, "hasViewTracking") ? Proto.call(component, "getViewTracking") : null;
            this.name = Proto.string(tracking, "getViewName");
            this.screen = Proto.string(component, "getObservabilityViewName");
        }

        byte[] bytes() {
            if (!decoded) {
                bytes = payloadOf(component);
                decoded = true;
            }
            return bytes;
        }

        /** Everything the payload holds, strings and images alike. */
        ProtoScanner scan() {
            if (scan == null) scan = ProtoScanner.scan(bytes());
            return scan;
        }
    }
}
