/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original first edition code:
 * https://github.com/ReVanced/revanced-integrations/pull/584
 * https://github.com/ReVanced/revanced-integrations/commit/0cbad9820577c476f1f29b6ac77611b38afbb950
 * https://github.com/ReVanced/revanced-integrations/commit/1ee99aa6f0b4af15eeca25c7e21e8a0f5e9d189a
 * https://github.com/ReVanced/revanced-integrations/commit/c3bfa77d62b15dedfed8f697583f2f0805f0c2c1
 * https://github.com/ReVanced/revanced-integrations/commit/75fa5797f70123f68d4676201503cf35dcef46dc
 * https://github.com/ReVanced/revanced-integrations/commit/3a3ceec4b596354dcccbf3516ef1634bd8819b90
 * https://github.com/ReVanced/revanced-integrations/commit/cda1f3160c12d239df1183799ead39526cbac20f
 * https://github.com/ReVanced/revanced-integrations/commit/d8d2a852d3879060bd95cc43d66c7cf195e82b43
 * https://github.com/ReVanced/revanced-integrations/commit/2f2eeea5a722b6b7053eb2825d16fa37938b4e9e
 * https://github.com/ReVanced/revanced-integrations/commit/5314dd90d16dc8565331c4cddce114956d85a173
 * https://github.com/MorpheApp/morphe-patches/commit/f5371ca998c019609c2b5558b3408ab1fec065c8
 * https://github.com/MorpheApp/morphe-patches/commit/017eac71a3f9542b8ad6221e3600797d6b97fae4
 * https://github.com/MorpheApp/morphe-patches/pull/1972
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.patches.keywordfilter;

import static app.morphe.extension.shared.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.BackgroundColorSpan;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.LineBackgroundSpan;
import android.text.style.LineHeightSpan;
import android.text.style.ReplacementSpan;
import android.text.style.StyleSpan;
import android.util.Base64;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.litho.ComponentHost;
import com.facebook.litho.TextContent;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Deque;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.innertube.utils.AuthUtils;
import app.morphe.extension.shared.patches.LithoRelayoutPatch;
import app.morphe.extension.shared.patches.components.BufferHideStatsTracker;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import app.morphe.extension.shared.patches.components.BufferPhraseFilter.Source;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.youtube.addon.AddOnApi;
import app.morphe.extension.youtube.patches.components.LayoutComponentsFilter;
import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.settings.LongSetting;
import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.youtube.patches.CaptionCookiesPatch;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.patches.utils.ProtoNode;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * Allows hiding or dimming (in debug mode) home feed, subscriptions, search results, and comments
 * based on video title keywords, channel names/handles, or full regular expressions, and optionally
 * scans opened video subtitles to display:
 * 1) a native semi-transparent player overlay chip next to the chapter button, and
 * 2) a standalone native card banner at the top of the video description with clickable timestamps.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class EnhancedKeywordContentFilter extends EnhancedBufferPhraseFilter {

    private static final AtomicBoolean addOnRegistered = new AtomicBoolean();
    private static volatile String browseId = "";

    public static void setBrowseId(@Nullable String id) {
        browseId = id == null ? "" : id;
    }

    public static void clearBrowseId() {
        browseId = "";
    }

    public static boolean isChannelBrowsePage() {
        String id = browseId;
        return id != null && (id.startsWith("UC") || id.contains("channel"));
    }

    public static void registerAddOn() {
        if (!addOnRegistered.compareAndSet(false, true)) return;
        KeywordFilterSettings.ensureLoaded();
        AddOnApi.addVideoIdListener(EnhancedKeywordContentFilter::onVideoIdLoaded);
    }

    public static Filter[] installFilter(Filter[] filters) {
        EnhancedKeywordContentFilter enhanced = new EnhancedKeywordContentFilter();
        if (filters == null) {
            return new Filter[]{enhanced};
        }
        for (int i = 0; i < filters.length; i++) {
            Filter f = filters[i];
            if (f != null && f.getClass().getName().endsWith(".KeywordContentFilter")) {
                filters[i] = enhanced;
                return filters;
            }
        }
        Filter[] copy = Arrays.copyOf(filters, filters.length + 1);
        copy[filters.length] = enhanced;
        return copy;
    }

    /**
     * Minimum keyword/phrase length to prevent excessively broad content filtering.
     * Only applies when not using whole word syntax or explicit regex.
     */
    private static final int MINIMUM_KEYWORD_LENGTH = 3;

    /**
     * Protobuf field numbers in YouTube's Litho elements.
     */
    private static final int SEGMENT_FIELD_NUMBER = 1;
    private static final int SEGMENT_TEXT_FIELD_NUMBER = 1;
    private static final int TEXT_CONTENT_FIELD_NUMBER = 1;
    private static final int RANGE_START_FIELD_NUMBER = 1;
    private static final int RANGE_LENGTH_FIELD_NUMBER = 2;
    private static final int STYLE_RUNS_FIELD_NUMBER = 3;
    private static final int COMMAND_RUNS_FIELD_NUMBER = 4;
    private static final int ATTACHMENT_RUNS_FIELD_NUMBER = 5;
    private static final int INNERTUBE_COMMAND_FIELD_NUMBER = 169495254;
    private static final int BROWSE_ENDPOINT_FIELD_NUMBER = 48687626;
    private static final int LOCKUP_METADATA_VIEW_MODEL_FIELD_NUMBER = 8178;
    private static final int LOCKUP_METADATA_TITLE_FIELD_NUMBER = 1;
    private static final int LOCKUP_METADATA_CONTENT_FIELD_NUMBER = 3;
    private static final int BUTTON_VIEW_MODEL_FIELD_NUMBER = 461054335;
    private static final int TOGGLE_BUTTON_VIEW_MODEL_FIELD_NUMBER = 479644279;
    private static final int LIKE_BUTTON_VIEW_MODEL_FIELD_NUMBER = 484585818;
    private static final int ADD_TO_PLAYLIST_BUTTON_VIEW_MODEL_FIELD_NUMBER = 484598023;
    private static final int RENDERER_CONTEXT_FIELD_NUMBER = 997;
    private static final int LOGGING_DIRECTIVES_FIELD_NUMBER = 999;

    private static final String COMMENT_THREAD_PATH = "comment_thread.eml";
    private static final String DESCRIPTION_IDENTIFIER = "description_rich_text_list.eml";
    private static final String SHORTS_DESCRIPTION_IDENTIFIER = "cell_description_body.eml";
    private static final String EXPANDABLE_METADATA_IDENTIFIER = "expandable_metadata.eml";
    private static final String DESCRIPTION_BODY_STATE_ID = "structured-description-body-state-id";
    private static final String DESCRIPTION_REDIRECT_PATH = "/redirect";

    /** Invisible zero-width markers bounding the subtitle section inside description text. */
    private static final String SUBTITLE_BANNER_START_MARKER = "\u2060\u200B\u2060";
    private static final String SUBTITLE_DIVIDER_MARKER = "\u2060\u00A0\u200D\u2060";
    private static final String SUBTITLE_BANNER_END_MARKER = "\u2060\u200C\u2060";
    private static final String SUBTITLE_TEASER_MARKER = "\u2060\u200E\u2060";

    private static final ByteArrayFilterGroup descriptionElementBuffer = new ByteArrayFilterGroup(
            null,
            DESCRIPTION_IDENTIFIER,
            SHORTS_DESCRIPTION_IDENTIFIER
    );

    /** Litho component identifier pattern, such as 'video_lockup_with_attachment.eml-fe|c0c4a49b6544b5fb'. */
    private static final Pattern IDENTIFIER_PATTERN =
            Pattern.compile("^[^\\s|]+\\.[^\\s|]+\\|[0-9a-f]{1,16}$");

    /** YouTube channel ID pattern (UC followed by 22 base64-url chars). */
    private static final Pattern CHANNEL_ID_PATTERN =
            Pattern.compile("^UC[A-Za-z0-9_-]{22}$");

    /** Base64 entity key pattern. */
    private static final Pattern ENTITY_KEY_PATTERN =
            Pattern.compile("^[A-Za-z0-9_-]{14,}(?:%3D|=)*$");

    /** Video ID encoded as field 1 or 2 inside a Base64 entity key. */
    private static final Pattern ENCODED_VIDEO_ID_PATTERN =
            Pattern.compile("[\\x0A\\x12]\\x0B([A-Za-z0-9_-]{11})");

    /** Short duration badge text such as 4:05 or 1:02:33. */
    private static final Pattern DURATION_BADGE_PATTERN =
            Pattern.compile("^(?:[^\\p{L}\\p{N}])?\\d{1,2}(?:[:.]\\d{2}){1,2}$");

    /** Timestamp token pattern inside the subtitle banner, such as 18:47 or 1:02:33. */
    private static final Pattern TIMESTAMP_TOKEN_PATTERN =
            Pattern.compile("(?<!\\d)(?:\\d{1,2}:)?\\d{2}:\\d{2}(?!\\d)");

    /** Regex metacharacters that trigger regex compilation when the Regex setting is enabled. */
    private static final Pattern REGEX_META_PATTERN =
            Pattern.compile("[\\\\()\\[\\]|^$*+?{}]");

    /** Technical single-word ASCII tokens that appear in buffers and are not user-visible titles. */
    private static final Set<String> TECHNICAL_SINGLE_WORDS = Set.of(
            "ANDROID",
            "webp",
            "searchR",
            "browse-feed",
            "FEwhat_to_watch",
            "FEsubscriptions",
            "FEstorefront",
            "FEhistory",
            "FElibrary",
            "g-high-recZ",
            "shortswatch",
            "watch",
            "browse",
            "search",
            "next",
            "player",
            "default",
            "mqdefault",
            "hqdefault",
            "sddefault",
            "hq720",
            "oardefault",
            "frame0",
            "oar1",
            "oar2",
            "oar3",
            "sans-serif",
            "sans-serif-medium",
            "Roboto",
            "dismiss",
            "expand",
            "collapse",
            "PAfeedback_genai"
    );

    /** Localized UI action labels inside comments that should never be treated as comment body text. */
    private static final Set<String> COMMENT_UI_LABELS = Set.of(
            "ответить",
            "перевести",
            "перевести на русский",
            "показать оригинал",
            "показать ответы",
            "скрыть ответы",
            "читать дальше",
            "свернуть",
            "ещё",
            "еще",
            "нравится",
            "не нравится",
            "действия",
            "поделиться",
            "пожаловаться",
            "закреплено",
            "(изменено)",
            "изменено",
            "reply",
            "translate",
            "view replies",
            "hide replies",
            "read more",
            "show less"
    );

    private static final Set<String> COMMON_BUFFER_STRINGS;
    static {
        Set<String> set = new HashSet<>();
        Collections.addAll(set, STRINGS_IN_EVERY_BUFFER);
        COMMON_BUFFER_STRINGS = Collections.unmodifiableSet(set);
    }

    private final StringFilterGroup commentsFilter = new StringFilterGroup(
            KeywordFilterSettings.HIDE_KEYWORD_CONTENT_COMMENTS,
            COMMENT_THREAD_PATH
    );

    /**
     * The button that shows the replies of a comment ("Показать ответы") is outside comment_thread.eml
     * and shares comment/reply IDs with its parent comment_thread.eml.
     */
    private final StringFilterGroup commentRepliesFilter = new StringFilterGroup(
            KeywordFilterSettings.HIDE_KEYWORD_CONTENT_COMMENTS,
            "comment_replies",
            "|comment_reply"
    );

    /** State of settings when rules were last parsed. */
    private volatile String lastKeywordPhrasesParsed;
    private volatile boolean lastUseAndOperator;
    private volatile boolean lastUseRegex;
    private volatile boolean lastCaseSensitive;
    private static final AtomicInteger rulesVersionCounter = new AtomicInteger(1);
    private volatile int currentRulesVersion = 1;

    /** Compiled keyword rules in user-specified order. */
    private volatile List<KeywordRule> parsedRules = Collections.emptyList();

    /** Active singleton instance so static hooks can access rules. */
    @Nullable
    private static volatile EnhancedKeywordContentFilter instance;

    // region Comment Thread & Replies Decision Tracking

    private static final int MIN_COMMENT_ID_LENGTH = 24;
    private static final int MAX_IDS_PER_COMMENT = 40;
    private static final int MAX_COMMENT_IDS = 4000;

    private static final class CommentDecision {
        final String path;
        final int rulesVersion;
        @Nullable
        final String matchedWord;
        final boolean hidden;
        boolean hideReplies;

        CommentDecision(String path, int rulesVersion, @Nullable String matchedWord, boolean hidden) {
            this.path = path;
            this.rulesVersion = rulesVersion;
            this.matchedWord = matchedWord;
            this.hidden = hidden;
            this.hideReplies = hidden;
        }
    }

    private static final CommentDecision AMBIGUOUS_COMMENT_ID =
            new CommentDecision("", 0, null, false);
    private static final ThreadLocal<CommentDecision> lastCommentDecision = new ThreadLocal<>();
    private static final Map<String, CommentDecision> commentDecisionsById =
            Collections.synchronizedMap(Utils.createSizeRestrictedMap(MAX_COMMENT_IDS));

    // endregion

    /**
     * Details of a match for Debug Mode and Match History Log.
     */
    public record MatchLogEntry(
            long timestampMs,
            Source source,
            String matchedWord,
            String matchedText,
            String ruleDisplay,
            @Nullable String videoId,
            boolean debugMode
    ) {}

    private static final int MAX_MATCH_LOG_ENTRIES = 60;
    private static final Deque<MatchLogEntry> recentMatchLogs = new ArrayDeque<>(MAX_MATCH_LOG_ENTRIES);
    private static final Set<String> recentLoggedKeys = new HashSet<>();

    /**
     * Thread-safe LRU cache mapping the exact matched text to its {@link MatchDetails}.
     */
    private record MatchDetails(String matchedWord, String matchedText, String ruleDisplay) {}

    private static final int MAX_DEBUG_CACHE_SIZE = 1000;
    private static final Map<String, MatchDetails> debugMatchedTextMap =
            Collections.synchronizedMap(Utils.createSizeRestrictedMap(MAX_DEBUG_CACHE_SIZE, true));

    /** Root ComponentHosts that currently have a DebugCardOverlay attached. Accessed on main thread. */
    private static final Map<ComponentHost, DebugCardOverlay> debugOverlays = new WeakHashMap<>();
    private static final Map<ComponentHost, Boolean> pendingHostsToUpdate =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static volatile boolean hostsUpdateScheduled;

    /**
     * Represents a single condition within a line (or the entire line when '&' is not used).
     */
    private static final class Clause {
        final String rawClause;
        final boolean isRegex;
        final boolean isWholeWord;
        final boolean caseSensitive;
        @Nullable
        final Pattern regexPattern;
        final String literalPhrase;

        Clause(String rawClause, boolean isRegex, boolean isWholeWord, boolean caseSensitive,
               @Nullable Pattern regexPattern, String literalPhrase) {
            this.rawClause = rawClause;
            this.isRegex = isRegex;
            this.isWholeWord = isWholeWord;
            this.caseSensitive = caseSensitive;
            this.regexPattern = regexPattern;
            this.literalPhrase = literalPhrase;
        }

        @Nullable
        String findFirstMatchedWord(String text) {
            if (text.isEmpty()) return null;
            if (isRegex && regexPattern != null) {
                Matcher m = regexPattern.matcher(text);
                while (m.find()) {
                    String g = m.group();
                    if (!g.isEmpty()) {
                        return g;
                    }
                }
                return null;
            }
            int[] range = findLiteralRange(text, 0);
            if (range != null) {
                return text.substring(range[0], range[1]);
            }
            return null;
        }

        void collectMatchRanges(String text, List<int[]> outRanges) {
            if (text.isEmpty()) return;
            if (isRegex && regexPattern != null) {
                Matcher m = regexPattern.matcher(text);
                while (m.find()) {
                    if (m.end() > m.start()) {
                        outRanges.add(new int[]{m.start(), m.end()});
                    }
                }
                return;
            }
            int from = 0;
            while (from < text.length()) {
                int[] range = findLiteralRange(text, from);
                if (range == null) break;
                outRanges.add(range);
                from = Math.max(from + 1, range[1]);
            }
        }

        @Nullable
        private int[] findLiteralRange(String text, int startFrom) {
            final int phraseLen = literalPhrase.length();
            final int textLen = text.length();
            if (phraseLen == 0 || startFrom + phraseLen > textLen) {
                return null;
            }
            int from = startFrom;
            while (from + phraseLen <= textLen) {
                int idx = indexOfRegion(text, literalPhrase, from, caseSensitive);
                if (idx < 0) {
                    return null;
                }
                if (!isWholeWord || keywordMatchIsWholeWord(text, idx, phraseLen)) {
                    return new int[]{idx, idx + phraseLen};
                }
                from = idx + 1;
            }
            return null;
        }

        private static int indexOfRegion(String haystack, String needle, int fromIndex, boolean caseSensitive) {
            if (caseSensitive) {
                return haystack.indexOf(needle, fromIndex);
            }
            final int needleLen = needle.length();
            final int max = haystack.length() - needleLen;
            for (int i = Math.max(0, fromIndex); i <= max; i++) {
                if (haystack.regionMatches(true, i, needle, 0, needleLen)) {
                    return i;
                }
            }
            return -1;
        }
    }

    /**
     * Represents a complete single-line rule (consisting of 1 or more AND-ed {@link Clause}s).
     */
    private static final class KeywordRule {
        final String displayRule;
        final List<Clause> clauses;

        KeywordRule(String displayRule, List<Clause> clauses) {
            this.displayRule = displayRule;
            this.clauses = clauses;
        }

        @Nullable
        List<MatchDetails> matchAcrossTexts(List<String> texts) {
            List<MatchDetails> matchedDetails = new ArrayList<>(clauses.size());
            for (int i = 0, cSize = clauses.size(); i < cSize; i++) {
                Clause clause = clauses.get(i);
                MatchDetails found = null;
                for (int j = 0, tSize = texts.size(); j < tSize; j++) {
                    String t = texts.get(j);
                    String word = clause.findFirstMatchedWord(t);
                    if (word != null) {
                        found = new MatchDetails(word, t, displayRule);
                        break;
                    }
                }
                if (found == null) {
                    return null;
                }
                matchedDetails.add(found);
            }
            return matchedDetails;
        }

        void collectMatchRangesInText(String text, boolean allowPartialAnd, List<int[]> outRanges) {
            if (clauses.size() == 1) {
                clauses.get(0).collectMatchRanges(text, outRanges);
                return;
            }
            List<int[]> temp = new ArrayList<>();
            int clausesMatched = 0;
            for (int i = 0, cSize = clauses.size(); i < cSize; i++) {
                int before = temp.size();
                clauses.get(i).collectMatchRanges(text, temp);
                if (temp.size() > before) {
                    clausesMatched++;
                }
            }
            if (clausesMatched == clauses.size() || (allowPartialAnd && clausesMatched > 0)) {
                outRanges.addAll(temp);
            }
        }
    }

    private record DebugRuleSpan(String matchedWord, String matchedText, String ruleDisplay, String componentName) {}

    private static boolean phraseUsesWholeWordSyntax(String phrase) {
        return phrase.length() >= 2 && phrase.startsWith("\"") && phrase.endsWith("\"");
    }

    private static String stripWholeWordSyntax(String phrase) {
        return phrase.substring(1, phrase.length() - 1);
    }

    /**
     * Rewrites regex character class escapes (\w, \W, \b, \B) into Unicode-aware equivalents
     * so Cyrillic and other non-ASCII scripts work properly on Android.
     */
    public static String toUnicodeRegex(String pattern) {
        final String wordChars = "\\p{L}\\p{M}\\p{N}_";
        final String wordClass = "[" + wordChars + "]";
        final String nonWordClass = "[^" + wordChars + "]";
        final String wordBoundary = "(?:(?<=" + wordClass + ")(?!" + wordClass + ")|(?<!" + wordClass + ")(?=" + wordClass + "))";
        final String nonWordBoundary = "(?:(?<=" + wordClass + ")(?=" + wordClass + ")|(?<!" + wordClass + ")(?!" + wordClass + "))";

        StringBuilder out = new StringBuilder(pattern.length() + 32);
        int inCharClass = 0;
        final int n = pattern.length();
        int i = 0;
        while (i < n) {
            char c = pattern.charAt(i);
            if (c == '\\') {
                if (i + 1 < n) {
                    char nxt = pattern.charAt(i + 1);
                    if (nxt == 'w') {
                        out.append(inCharClass > 0 ? wordChars : wordClass);
                        i += 2;
                        continue;
                    } else if (nxt == 'W' && inCharClass == 0) {
                        out.append(nonWordClass);
                        i += 2;
                        continue;
                    } else if (nxt == 'b' && inCharClass == 0) {
                        out.append(wordBoundary);
                        i += 2;
                        continue;
                    } else if (nxt == 'B' && inCharClass == 0) {
                        out.append(nonWordBoundary);
                        i += 2;
                        continue;
                    } else {
                        out.append(c).append(nxt);
                        i += 2;
                        continue;
                    }
                } else {
                    out.append(c);
                    i++;
                    continue;
                }
            }
            if (c == '[') {
                inCharClass++;
            } else if (c == ']' && inCharClass > 0) {
                inCharClass--;
            }
            out.append(c);
            i++;
        }
        return out.toString();
    }

    @Nullable
    private static Clause parseSingleClause(String rawClause, boolean useRegexSetting, boolean caseSensitiveSetting) {
        String trimmed = rawClause.trim();
        if (trimmed.isEmpty()) {
            return null;
        }

        if (useRegexSetting && (trimmed.startsWith("/") || trimmed.regionMatches(true, 0, "regex:", 0, 6)
                || trimmed.regionMatches(true, 0, "re:", 0, 3))) {
            String regexBody = null;
            boolean forceCaseSensitive = caseSensitiveSetting;
            boolean forceCaseInsensitive = !caseSensitiveSetting;

            if (trimmed.startsWith("/")) {
                int lastSlash = trimmed.lastIndexOf('/');
                if (lastSlash > 0) {
                    regexBody = trimmed.substring(1, lastSlash);
                    String flagsStr = trimmed.substring(lastSlash + 1).toLowerCase(Locale.ROOT);
                    if (flagsStr.contains("i")) {
                        forceCaseInsensitive = true;
                        forceCaseSensitive = false;
                    }
                    if (flagsStr.contains("c") || flagsStr.contains("s")) {
                        forceCaseSensitive = true;
                        forceCaseInsensitive = false;
                    }
                }
            } else if (trimmed.regionMatches(true, 0, "regex:", 0, 6)) {
                regexBody = trimmed.substring(6).trim();
            } else if (trimmed.regionMatches(true, 0, "re:", 0, 3)) {
                regexBody = trimmed.substring(3).trim();
            }

            if (regexBody != null && !regexBody.isEmpty()) {
                try {
                    int flags = Pattern.UNICODE_CASE | Pattern.DOTALL | Pattern.MULTILINE;
                    if (forceCaseInsensitive && !forceCaseSensitive) {
                        flags |= Pattern.CASE_INSENSITIVE;
                    }
                    Pattern pattern = Pattern.compile(toUnicodeRegex(regexBody), flags);
                    return new Clause(trimmed, true, false, forceCaseSensitive, pattern, regexBody);
                } catch (PatternSyntaxException ex) {
                    Logger.printDebug(() -> "Invalid regex keyword pattern: " + trimmed, ex);
                    Utils.showSnackbarLong(str("morphe_hide_keyword_toast_invalid_regex", trimmed));
                    return null;
                }
            }
        }

        if (phraseUsesWholeWordSyntax(trimmed)) {
            String stripped = stripWholeWordSyntax(trimmed);
            if (stripped.isEmpty()) {
                return null;
            }
            return new Clause(trimmed, false, true, caseSensitiveSetting, null, stripped);
        }

        if (useRegexSetting && REGEX_META_PATTERN.matcher(trimmed).find()) {
            try {
                int flags = Pattern.UNICODE_CASE | Pattern.DOTALL | Pattern.MULTILINE;
                if (!caseSensitiveSetting) {
                    flags |= Pattern.CASE_INSENSITIVE;
                }
                Pattern pattern = Pattern.compile(toUnicodeRegex(trimmed), flags);
                return new Clause(trimmed, true, false, caseSensitiveSetting, pattern, trimmed);
            } catch (PatternSyntaxException ex) {
                Logger.printDebug(() -> "Invalid regex keyword pattern: " + trimmed, ex);
                Utils.showSnackbarLong(str("morphe_hide_keyword_toast_invalid_regex", trimmed));
                return null;
            }
        }

        if (trimmed.length() < MINIMUM_KEYWORD_LENGTH && !isLanguageWithNoSpaces(trimmed)) {
            Utils.showSnackbarLong(str("morphe_hide_keyword_toast_invalid_length", trimmed, MINIMUM_KEYWORD_LENGTH));
            return null;
        }

        return new Clause(trimmed, false, false, caseSensitiveSetting, null, trimmed);
    }

    private synchronized void parseKeywords() {
        String rawKeywords = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_PHRASES.get();
        boolean useAnd = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_USE_AND_OPERATOR.get();
        boolean useRegex = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_USE_REGEX.get();
        boolean caseSensitive = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CASE_SENSITIVE.get();

        //noinspection StringEquality
        if (rawKeywords == lastKeywordPhrasesParsed
                && useAnd == lastUseAndOperator
                && useRegex == lastUseRegex
                && caseSensitive == lastCaseSensitive) {
            return;
        }

        List<KeywordRule> rules = new ArrayList<>();
        Map<String, String> seenCanonicalRules = new LinkedHashMap<>();

        String[] lines = rawKeywords.split("\n");
        for (String rawLine : lines) {
            String line = rawLine.trim();
            if (line.isEmpty() || line.startsWith("#") || line.startsWith("//")) {
                continue;
            }

            String[] rawClauses = useAnd ? splitByTopLevelAmpersand(line) : new String[]{line};
            List<Clause> parsedClauses = new ArrayList<>(rawClauses.length);
            boolean lineValid = true;

            for (String rawClause : rawClauses) {
                Clause clause = parseSingleClause(rawClause, useRegex, caseSensitive);
                if (clause == null) {
                    lineValid = false;
                    break;
                }
                parsedClauses.add(clause);
            }

            if (!lineValid || parsedClauses.isEmpty()) {
                continue;
            }

            StringBuilder canonicalKey = new StringBuilder();
            for (int i = 0; i < parsedClauses.size(); i++) {
                if (i > 0) canonicalKey.append(" & ");
                Clause c = parsedClauses.get(i);
                canonicalKey.append(c.isRegex ? "R:" : (c.isWholeWord ? "W:" : "S:"))
                        .append(c.caseSensitive ? "CS:" : "CI:")
                        .append(c.caseSensitive ? c.literalPhrase : c.literalPhrase.toLowerCase(Locale.ROOT));
            }
            String key = canonicalKey.toString();
            if (seenCanonicalRules.containsKey(key)) {
                continue;
            }
            seenCanonicalRules.put(key, line);
            rules.add(new KeywordRule(line, parsedClauses));
        }

        debugMatchedTextMap.clear();
        commentDecisionsById.clear();
        subtitleScanCache.clear();
        parsedRules = Collections.unmodifiableList(rules);
        currentRulesVersion = rulesVersionCounter.incrementAndGet();
        lastKeywordPhrasesParsed = rawKeywords;
        lastUseAndOperator = useAnd;
        lastUseRegex = useRegex;
        lastCaseSensitive = caseSensitive;
    }

    private static String[] splitByTopLevelAmpersand(String line) {
        if (line.indexOf('&') < 0) {
            return new String[]{line};
        }
        List<String> parts = new ArrayList<>();
        boolean inQuotes = false;
        boolean inSlashRegex = false;
        int parenDepth = 0;
        int bracketDepth = 0;
        int start = 0;

        for (int i = 0, len = line.length(); i < len; i++) {
            char c = line.charAt(i);
            if (c == '\\' && i + 1 < len) {
                i++;
                continue;
            }
            if (c == '"' && !inSlashRegex && bracketDepth == 0) {
                inQuotes = !inQuotes;
            } else if (c == '/' && !inQuotes && bracketDepth == 0 && (i == start || inSlashRegex)) {
                inSlashRegex = !inSlashRegex;
            } else if (!inQuotes && !inSlashRegex) {
                if (c == '[') bracketDepth++;
                else if (c == ']' && bracketDepth > 0) bracketDepth--;
                else if (c == '(' && bracketDepth == 0) parenDepth++;
                else if (c == ')' && bracketDepth == 0 && parenDepth > 0) parenDepth--;
                else if (c == '&' && bracketDepth == 0 && parenDepth == 0) {
                    parts.add(line.substring(start, i));
                    start = i + 1;
                }
            }
        }
        parts.add(line.substring(start));
        return parts.toArray(new String[0]);
    }

    public EnhancedKeywordContentFilter() {
        super();
        instance = this;
        addPathCallbacks(commentsFilter, commentRepliesFilter);
        VideoInformation.onVideoIdChange.addObserver(EnhancedKeywordContentFilter::onVideoIdLoaded);
    }

    @Override
    protected void reparseIfNeeded() {
        //noinspection StringEquality
        if (KeywordFilterSettings.HIDE_KEYWORD_CONTENT_PHRASES.get() != lastKeywordPhrasesParsed
                || KeywordFilterSettings.HIDE_KEYWORD_CONTENT_USE_AND_OPERATOR.get() != lastUseAndOperator
                || KeywordFilterSettings.HIDE_KEYWORD_CONTENT_USE_REGEX.get() != lastUseRegex
                || KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CASE_SENSITIVE.get() != lastCaseSensitive) {
            parseKeywords();
        }
    }

    @Override
    protected boolean isDebugModeEnabled() {
        return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_DEBUG.get();
    }

    @Override
    protected boolean isActiveForFeedContext(ContextInterface contextInterface) {
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) {
            return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_HOME.get();
        }
        if (NavigationBar.isSearchBarActive()) {
            return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_SEARCH.get();
        }
        if (NavigationBar.isBackButtonVisible() || isChannelBrowsePage()) {
            return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHANNEL.get();
        }
        NavigationBar.NavigationButton selectedNavButton =
                NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface);
        if (selectedNavButton == null) {
            return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_HOME.get();
        }
        return switch (selectedNavButton) {
            case HOME -> KeywordFilterSettings.HIDE_KEYWORD_CONTENT_HOME.get();
            case SUBSCRIPTIONS -> KeywordFilterSettings.HIDE_KEYWORD_CONTENT_SUBSCRIPTIONS.get();
            default -> KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHANNEL.get();
        };
    }

    @Override
    @Nullable
    protected String matchBuffer(byte[] buffer, StringFilterGroup matchedGroup,
                                 ContextInterface contextInterface) {
        return matchBuffer(buffer, "", "", matchedGroup, contextInterface);
    }

    @Override
    @Nullable
    protected String matchBuffer(byte[] buffer, String accessibility, CharSequence path,
                                 StringFilterGroup matchedGroup, ContextInterface contextInterface) {
        List<KeywordRule> rules = parsedRules;
        if (rules.isEmpty()) {
            return null;
        }

        final int rulesVer = currentRulesVersion;
        final boolean debug = isDebugModeEnabled();

        if (matchedGroup == commentRepliesFilter) {
            if (debug || Utils.contains(path, COMMENT_THREAD_PATH)) {
                return null;
            }
            return isCommentRepliesHidden(buffer, rulesVer, lastCommentDecision.get()) ? "" : null;
        }

        if (matchedGroup == commentsFilter) {
            CommentDecision last = lastCommentDecision.get();
            if (last != null && last.rulesVersion == rulesVer
                    && path.length() > last.path.length() && Utils.startsWith(path, last.path)) {
                return last.matchedWord;
            }
            if (buffer == null || buffer.length == 0) {
                return null;
            }

            String activeVideoId = VideoInformation.getVideoId();
            String videoId = activeVideoId.isEmpty() ? null : activeVideoId;
            List<String> commentTexts = extractCommentTexts(buffer, videoId);
            String componentName = extractRootComponentName(path);
            String matchedWord = evaluateRulesAndRecord(commentTexts, rules, Source.COMMENTS, videoId, componentName, debug);

            CommentDecision decision = new CommentDecision(
                    path.toString(),
                    rulesVer,
                    matchedWord,
                    matchedWord != null && !debug
            );
            lastCommentDecision.set(decision);
            rememberCommentIds(buffer, decision);
            return matchedWord;
        }

        if (path != null && (Utils.contains(path, "expandable_metadata")
                || Utils.contains(path, "inline_expander"))) {
            return null;
        }

        String videoId = extractVideoIdFromBuffer(buffer);
        List<String> searchableTexts = extractSearchableTexts(buffer, accessibility, videoId);
        if (searchableTexts.isEmpty()) {
            return null;
        }

        String componentName = extractRootComponentName(path);
        Source source = detectSource(matchedGroup, contextInterface);
        return evaluateRulesAndRecord(searchableTexts, rules, source, videoId, componentName, debug);
    }

    private static String extractRootComponentName(@Nullable CharSequence path) {
        if (path == null || path.length() == 0) return "";
        String s = path.toString();
        int pipe = s.indexOf('|');
        String head = pipe > 0 ? s.substring(0, pipe) : s;
        int dash = head.indexOf('-');
        return dash > 0 ? head.substring(0, dash) : head;
    }

    @Nullable
    private String evaluateRulesAndRecord(List<String> searchableTexts, List<KeywordRule> rules,
                                          Source source, @Nullable String videoId,
                                          String componentName, boolean debug) {
        if (searchableTexts.isEmpty()) {
            return null;
        }
        for (int i = 0, size = rules.size(); i < size; i++) {
            KeywordRule rule = rules.get(i);
            List<MatchDetails> matchedClauses = rule.matchAcrossTexts(searchableTexts);
            if (matchedClauses != null && !matchedClauses.isEmpty()) {
                MatchDetails primary = matchedClauses.get(0);
                for (int j = 0, cSize = matchedClauses.size(); j < cSize; j++) {
                    MatchDetails detail = matchedClauses.get(j);
                    debugMatchedTextMap.put(detail.matchedText(), detail);
                }
                String logText = primary.matchedText();
                String firstTitle = searchableTexts.get(0);
                if (source != Source.COMMENTS && !firstTitle.equals(logText)
                        && !logText.contains(firstTitle)) {
                    logText = firstTitle + " (" + logText + ")";
                }
                if (componentName != null && !componentName.isEmpty()) {
                    logText = "[" + componentName + "] " + logText;
                }
                recordMatchLog(source, primary.matchedWord(), logText,
                        rule.displayRule, videoId, debug);
                recordHide(source, videoId, firstTitle);
                return primary.matchedWord();
            }
        }
        return null;
    }

    private static boolean isCommentRepliesHidden(byte[] buffer, int rulesVer,
                                                  @Nullable CommentDecision last) {
        CommentDecision comment = findCommentOfReplies(buffer, rulesVer);
        if (comment == null) {
            if (last == null || last.rulesVersion != rulesVer || !last.hideReplies) {
                return false;
            }
            comment = last;
        } else if (!comment.hidden) {
            return false;
        }
        comment.hideReplies = false;
        return true;
    }

    @Nullable
    private static CommentDecision findCommentOfReplies(byte[] buffer, int rulesVer) {
        CommentDecision hiddenComment = null;
        for (String id : findCommentIds(buffer)) {
            CommentDecision decision = commentDecisionsById.get(id);
            if (decision == null || decision == AMBIGUOUS_COMMENT_ID || decision.rulesVersion != rulesVer) {
                continue;
            }
            if (!decision.hidden) {
                return decision;
            }
            hiddenComment = decision;
        }
        return hiddenComment;
    }

    private static void rememberCommentIds(byte[] buffer, CommentDecision decision) {
        List<String> ids = findCommentIds(buffer);
        synchronized (commentDecisionsById) {
            for (String id : ids) {
                CommentDecision existing = commentDecisionsById.get(id);
                if (existing == AMBIGUOUS_COMMENT_ID) {
                    continue;
                }
                if (existing == null || existing.rulesVersion != decision.rulesVersion
                        || existing.hidden == decision.hidden) {
                    commentDecisionsById.put(id, decision);
                } else {
                    commentDecisionsById.put(id, AMBIGUOUS_COMMENT_ID);
                }
            }
        }
    }

    private static List<String> findCommentIds(byte[] buffer) {
        List<String> ids = new ArrayList<>();
        int start = -1;
        for (int i = 0, length = buffer.length; i <= length; i++) {
            if (i < length && isCommentIdChar(buffer[i])) {
                if (start < 0) start = i;
                continue;
            }
            if (start >= 0) {
                if (i - start >= MIN_COMMENT_ID_LENGTH) {
                    ids.add(new String(buffer, start, i - start, StandardCharsets.US_ASCII));
                    if (ids.size() >= MAX_IDS_PER_COMMENT) break;
                }
                start = -1;
            }
        }
        return ids;
    }

    private static boolean isCommentIdChar(byte b) {
        return (b >= 'A' && b <= 'Z')
                || (b >= 'a' && b <= 'z')
                || (b >= '0' && b <= '9')
                || b == '-' || b == '_';
    }

    private static void recordMatchLog(Source source, String matchedWord, String matchedText,
                                       String ruleDisplay, @Nullable String videoId, boolean debugMode) {
        Logger.printInfo(() -> "[KeywordFilter] " + (debugMode ? "DIMMED" : "HIDDEN")
                + " | Word: '" + matchedWord + "'"
                + " | Text: '" + matchedText + "'"
                + " | Source: " + source);

        String dedupId = (videoId != null && !videoId.isEmpty() && source != Source.COMMENTS)
                ? videoId
                : matchedText;
        String dedupKey = source + "|" + dedupId + "|" + matchedWord;
        synchronized (recentMatchLogs) {
            if (!recentLoggedKeys.add(dedupKey)) {
                return;
            }
            if (recentMatchLogs.size() >= MAX_MATCH_LOG_ENTRIES) {
                MatchLogEntry removed = recentMatchLogs.removeLast();
                String remId = (removed.videoId() != null && !removed.videoId().isEmpty() && removed.source() != Source.COMMENTS)
                        ? removed.videoId()
                        : removed.matchedText();
                String removedKey = removed.source() + "|" + remId + "|" + removed.matchedWord();
                recentLoggedKeys.remove(removedKey);
            }
            recentMatchLogs.addFirst(new MatchLogEntry(
                    System.currentTimeMillis(),
                    source,
                    matchedWord,
                    matchedText,
                    ruleDisplay,
                    videoId,
                    debugMode
            ));
        }
    }

    public static List<MatchLogEntry> getRecentMatchLogs() {
        synchronized (recentMatchLogs) {
            return new ArrayList<>(recentMatchLogs);
        }
    }

    public static void clearRecentMatchLogs() {
        synchronized (recentMatchLogs) {
            recentMatchLogs.clear();
            recentLoggedKeys.clear();
        }
    }

    /**
     * Extracts strictly the visible AttributedString texts from a comment thread buffer
     * (author @handle and comment body text), ignoring all binary fields, entity keys,
     * tracking tokens, and UI button labels.
     */
    public static List<String> extractCommentTexts(byte[] buffer, @Nullable String videoId) {
        List<String> results = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        if (buffer == null || buffer.length == 0) {
            return results;
        }
        List<ProtoNode> root = ProtoNode.parse(buffer);
        if (root != null) {
            collectAttributedCommentTexts(root, videoId, results, seen);
        }
        return results;
    }

    private static void collectAttributedCommentTexts(List<ProtoNode> nodes, @Nullable String videoId,
                                                      List<String> out, Set<String> seen) {
        for (int i = 0, size = nodes.size(); i < size; i++) {
            ProtoNode node = nodes.get(i);
            final int fn = node.getFieldNumber();
            if (fn == INNERTUBE_COMMAND_FIELD_NUMBER
                    || fn == BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fn == TOGGLE_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fn == LIKE_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fn == ADD_TO_PLAYLIST_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fn == RENDERER_CONTEXT_FIELD_NUMBER
                    || fn == LOGGING_DIRECTIVES_FIELD_NUMBER) {
                continue;
            }

            if (fn == TEXT_CONTENT_FIELD_NUMBER && isAttributedStringParent(node.getParent())) {
                if (node.isText()) {
                    addFilteredCommentText(node.getText(), videoId, out, seen);
                    continue;
                }
                String multiLine = decodeGenuineMultiLineText(node);
                if (multiLine != null) {
                    addFilteredCommentText(multiLine, videoId, out, seen);
                    continue;
                }
            }

            if (node.children != null) {
                collectAttributedCommentTexts(node.children, videoId, out, seen);
            }
        }
    }

    private static boolean isAttributedStringParent(@Nullable ProtoNode parent) {
        if (parent == null || parent.children == null || parent.children.size() < 2) {
            return false;
        }
        int field1Count = 0;
        boolean hasStyleOrRunField = false;
        for (int i = 0, size = parent.children.size(); i < size; i++) {
            ProtoNode child = parent.children.get(i);
            int fn = child.getFieldNumber();
            if (fn > 12) {
                return false;
            }
            if (fn == TEXT_CONTENT_FIELD_NUMBER) {
                field1Count++;
                if (field1Count > 1) return false;
            } else if (fn == STYLE_RUNS_FIELD_NUMBER
                    || fn == COMMAND_RUNS_FIELD_NUMBER
                    || fn == ATTACHMENT_RUNS_FIELD_NUMBER) {
                hasStyleOrRunField = true;
            }
        }
        return field1Count == 1 && hasStyleOrRunField;
    }

    @Nullable
    private static String decodeGenuineMultiLineText(ProtoNode node) {
        String decoded = node.decodeText();
        if (decoded == null || decoded.isEmpty()) {
            return null;
        }
        char first = decoded.charAt(0);
        if (first == '\n' || first == '\r' || first == '\t') {
            return null;
        }
        if (decoded.indexOf('\n') <= 0 || decoded.indexOf('\r') >= 0 || decoded.indexOf('\t') >= 0) {
            return null;
        }
        return decoded;
    }

    private static void addFilteredCommentText(@Nullable String rawText, @Nullable String videoId,
                                               List<String> out, Set<String> seen) {
        String cleaned = normalizeAndFilterUserText(rawText, videoId);
        if (cleaned == null) {
            return;
        }
        if (COMMENT_UI_LABELS.contains(cleaned.toLowerCase(Locale.ROOT))) {
            return;
        }
        if (seen.add(cleaned)) {
            out.add(cleaned);
        }
    }

    /**
     * Extracts human-readable visible content texts (video title, channel name/metadata row,
     * @handle) from feed/search video card buffers.
     */
    public static List<String> extractSearchableTexts(byte[] buffer, @Nullable String accessibility,
                                                      @Nullable String videoId) {
        List<String> results = new ArrayList<>();
        Set<String> seen = new HashSet<>();

        // 1. Accessibility label of the video card is always the primary visible title + channel + metadata
        //    and never includes the hidden expandable_metadata.eml (PAfeedback_genai) AI summary block.
        if (accessibility != null && !accessibility.isEmpty()) {
            int pipeIndex = accessibility.indexOf('|');
            String a11yText = pipeIndex >= 0 ? accessibility.substring(pipeIndex + 1) : accessibility;
            addFilteredUserText(a11yText, videoId, results, seen);
        }

        if (buffer != null && buffer.length > 0) {
            List<ProtoNode> root = ProtoNode.parse(buffer);
            if (root != null) {
                // Structurally prune any embedded expandable_metadata.eml / inline_expander / PAfeedback_genai
                // child element before extracting readable texts from the card buffer.
                collectReadableProtoTexts(root, videoId, results, seen);
                collectChannelHandlesRecursive(root, videoId, results, seen);
            }
        }

        return results;
    }

    /**
     * Checks whether a ProtoNode subtree is the embedded {@code expandable_metadata.eml} /
     * {@code inline_expander} / {@code PAfeedback_genai} AI video summary attachment inside
     * {@code video_lockup_with_attachment.eml}.
     * The main video lockup branch always contains the video thumbnail ({@code thumbnail.e} /
     * {@code ytimg.com}), whereas the attached AI summary component contains
     * {@code expandable_metadata} / {@code PAfeedback_genai} and has no video thumbnail.
     */
    private static boolean isExpandableSummaryAttachmentSubtree(ProtoNode node) {
        if (node.children == null) {
            return false;
        }
        boolean hasSummaryComponentMarker = false;
        boolean hasMainVideoLockupMarker = false;
        List<ProtoNode> textNodes = ProtoNode.textNodes(node.children);
        for (int i = 0, size = textNodes.size(); i < size; i++) {
            String t = textNodes.get(i).getText();
            if (t.contains("PAfeedback_genai")
                    || t.startsWith("expandable_metadata.")
                    || t.startsWith("cell_expandable_metadata.")
                    || t.startsWith("inline_expander.")) {
                hasSummaryComponentMarker = true;
            }
            if (t.startsWith("video_lockup_thumbnail.")
                    || t.startsWith("thumbnail.e")
                    || t.contains("ytimg.com/vi")) {
                hasMainVideoLockupMarker = true;
            }
        }
        return hasSummaryComponentMarker && !hasMainVideoLockupMarker;
    }

    private static void findNodesByFieldNumber(List<ProtoNode> nodes, int targetField, List<ProtoNode> out) {
        for (int i = 0, size = nodes.size(); i < size; i++) {
            ProtoNode node = nodes.get(i);
            if (node.getFieldNumber() == targetField) {
                out.add(node);
            } else if (node.children != null && node.getFieldNumber() != INNERTUBE_COMMAND_FIELD_NUMBER) {
                findNodesByFieldNumber(node.children, targetField, out);
            }
        }
    }

    private static void collectChannelHandlesRecursive(List<ProtoNode> nodes, @Nullable String videoId,
                                                       List<String> out, Set<String> seen) {
        for (int i = 0, size = nodes.size(); i < size; i++) {
            ProtoNode node = nodes.get(i);
            if (node.isText()) {
                String t = node.getText().trim();
                if (t.startsWith("/@") && t.length() > 2 && t.indexOf('/', 2) < 0) {
                    addFilteredUserText(t.substring(1), videoId, out, seen);
                }
            } else if (node.children != null) {
                collectChannelHandlesRecursive(node.children, videoId, out, seen);
            }
        }
    }

    private static void collectReadableProtoTexts(List<ProtoNode> nodes, @Nullable String videoId,
                                                  List<String> out, Set<String> seen) {
        for (int i = 0, size = nodes.size(); i < size; i++) {
            ProtoNode node = nodes.get(i);
            final int fieldNumber = node.getFieldNumber();

            if (fieldNumber == INNERTUBE_COMMAND_FIELD_NUMBER) {
                if (node.children != null) {
                    collectChannelHandlesFromCommand(node.children, videoId, out, seen);
                }
                continue;
            }
            if (fieldNumber == BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fieldNumber == TOGGLE_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fieldNumber == LIKE_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fieldNumber == ADD_TO_PLAYLIST_BUTTON_VIEW_MODEL_FIELD_NUMBER
                    || fieldNumber == RENDERER_CONTEXT_FIELD_NUMBER
                    || fieldNumber == LOGGING_DIRECTIVES_FIELD_NUMBER) {
                continue;
            }

            if (node.isText()) {
                addFilteredUserText(node.getText(), videoId, out, seen);
                continue;
            }

            if (node.children != null) {
                if (isExpandableSummaryAttachmentSubtree(node)) {
                    continue;
                }
                collectReadableProtoTexts(node.children, videoId, out, seen);
            } else if (fieldNumber == TEXT_CONTENT_FIELD_NUMBER) {
                String multiLine = decodeGenuineMultiLineText(node);
                if (multiLine != null) {
                    addFilteredUserText(multiLine, videoId, out, seen);
                }
            }
        }
    }

    private static void collectChannelHandlesFromCommand(List<ProtoNode> nodes, @Nullable String videoId,
                                                         List<String> out, Set<String> seen) {
        for (int i = 0, size = nodes.size(); i < size; i++) {
            ProtoNode node = nodes.get(i);
            if (node.isText()) {
                String t = node.getText().trim();
                if (t.startsWith("/@") && t.length() > 2 && t.indexOf('/', 2) < 0) {
                    addFilteredUserText(t.substring(1), videoId, out, seen);
                }
            } else if (node.children != null) {
                if (node.getFieldNumber() == BROWSE_ENDPOINT_FIELD_NUMBER || node.getFieldNumber() <= 10) {
                    collectChannelHandlesFromCommand(node.children, videoId, out, seen);
                }
            }
        }
    }

    private static void addFilteredUserText(@Nullable String rawText, @Nullable String videoId,
                                            List<String> out, Set<String> seen) {
        String cleaned = normalizeAndFilterUserText(rawText, videoId);
        if (cleaned != null && seen.add(cleaned)) {
            out.add(cleaned);
        }
    }

    public static String stripFormatCharacters(@Nullable CharSequence input) {
        if (input == null) return "";
        final int len = input.length();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c = input.charAt(i);
            if (Character.getType(c) != Character.FORMAT) {
                sb.append(c);
            }
        }
        return sb.toString().trim();
    }

    @Nullable
    public static String normalizeAndFilterUserText(@Nullable String rawText, @Nullable String videoId) {
        if (rawText == null || rawText.isEmpty()) {
            return null;
        }
        char rawFirst = rawText.charAt(0);
        if (rawFirst == '\n' || rawFirst == '\r' || rawFirst == '\t'
                || rawText.indexOf('\r') >= 0 || rawText.indexOf('\t') >= 0) {
            return null;
        }
        String text = stripFormatCharacters(rawText);
        if (text.isEmpty()) {
            return null;
        }

        if (text.startsWith("/@") && text.length() > 2 && text.indexOf('/', 2) < 0 && !containsWhitespace(text)) {
            text = text.substring(1);
        }

        if (videoId != null && text.equals(videoId)) {
            return null;
        }

        String lowerText = text.toLowerCase(Locale.ROOT);
        if (COMMON_BUFFER_STRINGS.contains(text)
                || TECHNICAL_SINGLE_WORDS.contains(text)
                || COMMENT_UI_LABELS.contains(lowerText)
                || isYouTubeSystemBoilerplate(lowerText)) {
            return null;
        }

        if (!containsLetter(text) || isDurationOrBadgeText(text)) {
            return null;
        }

        if (text.startsWith("http://")
                || text.startsWith("https://")
                || text.startsWith("android-app://")
                || text.startsWith("/")
                || text.startsWith("www.")
                || text.contains("://")
                || text.contains("googlevideo.com")
                || text.contains("ytimg.com")
                || text.contains("ggpht.com")
                || text.contains("youtube.com")
                || text.contains("/vi/")
                || text.contains("/vi_")
                || text.contains("initplayback")) {
            return null;
        }

        if (text.contains(".eml")
                || text.contains(".e|")
                || IDENTIFIER_PATTERN.matcher(text).matches()
                || ENTITY_KEY_PATTERN.matcher(text).matches()
                || text.startsWith("theme|")
                || text.startsWith("id.")
                || text.startsWith("yt_")
                || text.startsWith("ic_")
                || text.startsWith("quantum_ic_")
                || text.startsWith("shorts-shelf-item-")
                || text.startsWith("shorts-lockup")
                || text.startsWith("OMX.")
                || text.startsWith("c2.")
                || text.startsWith("YouTubeSans")
                || text.startsWith("Roboto-")
                || CHANNEL_ID_PATTERN.matcher(text).matches()) {
            return null;
        }

        if (isAllAscii(text) && looksLikeBinaryOrTechnicalAscii(text)) {
            return null;
        }

        return text;
    }

    private static boolean looksLikeBinaryOrTechnicalAscii(String text) {
        final int len = text.length();
        if (!containsWhitespace(text)) {
            if (text.charAt(0) == '@' || text.charAt(0) == '#') {
                if (len > 64) return true;
                for (int i = 1; i < len; i++) {
                    char c = text.charAt(i);
                    if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')
                            || (c >= '0' && c <= '9') || c == '_' || c == '.' || c == '-')) {
                        return true;
                    }
                }
                return false;
            }
            for (int i = 0; i < len; i++) {
                char c = text.charAt(i);
                if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z'))) {
                    return true;
                }
            }
            if ((text.startsWith("FE") || text.startsWith("VL") || text.startsWith("PL") || text.startsWith("RD"))
                    && len > 4 && Character.isUpperCase(text.charAt(2))) {
                return true;
            }
            if (len >= 14 && hasInternalUppercaseTransition(text)) {
                return true;
            }
            return len == 11 && hasMultipleInternalUppercaseTransitions(text);
        }

        int openParen = 0;
        int quotes = 0;
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            if (c == '`' || c == '~' || c == '^' || c == '\\' || c == '|'
                    || c == '{' || c == '}' || c == '<' || c == '>' || c == '=') {
                return true;
            }
            if (c == '(') openParen++;
            else if (c == ')') {
                openParen--;
                if (openParen < 0) return true;
            } else if (c == '"') {
                quotes++;
            }
        }
        return openParen != 0 || (quotes & 1) != 0;
    }

    private static boolean containsLetter(String text) {
        for (int i = 0, len = text.length(); i < len;) {
            int cp = text.codePointAt(i);
            if (Character.isLetter(cp)) return true;
            i += Character.charCount(cp);
        }
        return false;
    }

    private static boolean containsWhitespace(String text) {
        for (int i = 0, len = text.length(); i < len; i++) {
            char c = text.charAt(i);
            if (Character.isWhitespace(c) || c == '\u00A0' || c == '\u202F') {
                return true;
            }
        }
        return false;
    }

    private static boolean isAllAscii(String text) {
        for (int i = 0, len = text.length(); i < len; i++) {
            if (text.charAt(i) > 0x7F) return false;
        }
        return true;
    }

    private static boolean hasInternalUppercaseTransition(String text) {
        boolean seenLower = false;
        for (int i = 1, len = text.length(); i < len; i++) {
            char c = text.charAt(i);
            if (Character.isLowerCase(c)) {
                seenLower = true;
            } else if (Character.isUpperCase(c) && seenLower) {
                return true;
            }
        }
        return false;
    }

    private static boolean hasMultipleInternalUppercaseTransitions(String text) {
        int transitions = 0;
        for (int i = 1, len = text.length(); i < len; i++) {
            boolean prevUpper = Character.isUpperCase(text.charAt(i - 1));
            boolean currUpper = Character.isUpperCase(text.charAt(i));
            if (prevUpper != currUpper) {
                transitions++;
                if (transitions >= 3) return true;
            }
        }
        return false;
    }

    private static boolean isYouTubeSystemBoilerplate(String lowerText) {
        return lowerText.contains("ии может ошибаться")
                || lowerText.contains("перепроверяйте ответы")
                || lowerText.contains("краткий пересказ от ии")
                || lowerText.contains("ai-generated summary")
                || lowerText.contains("ai can make mistakes")
                || lowerText.contains("double-check responses")
                || lowerText.equals("спросить")
                || lowerText.equals("спросить о видео")
                || lowerText.equals("ask about this video")
                || lowerText.contains("ответы сгенерированы ии");
    }

    private static boolean isDurationOrBadgeText(String text) {
        String trimmed = text.trim();
        if (trimmed.length() <= 12 && DURATION_BADGE_PATTERN.matcher(trimmed).matches()) {
            return true;
        }
        return trimmed.equals("LIVE") || trimmed.equals("4K") || trimmed.equals("HD") || trimmed.equals("CC");
    }

    // region Subtitle / Transcript Keyword Scanner, Player Overlay Chip & Native Description Block

    private static final int SUBTITLE_CONNECT_TIMEOUT_MS = 8_000;
    private static final int SUBTITLE_READ_TIMEOUT_MS = 10_000;
    private static final String INNERTUBE_PLAYER_URL =
            "https://www.youtube.com/youtubei/v1/player?prettyPrint=false";
    private static final int MAX_SUBTITLE_MATCH_ITEMS = 5;
    private static final int MAX_TIMESTAMPS_PER_WORD = 3;
    private static final long MIN_TIMESTAMP_GAP_MS = 20_000L;
    private static final Pattern SUBTITLE_BRACKETS_PATTERN = Pattern.compile("\\[[^]]*]");
    private static final Pattern SUBTITLE_PARENS_PATTERN = Pattern.compile("\\([^)]*\\)");

    private static final String PLAYER_CHIP_TAG = "morphe_subtitle_overlay_chip";
    private static final int ID_BOTTOM_UI_CONTAINER =
            ResourceUtils.getIdentifier(ResourceType.ID, "youtube_controls_bottom_ui_container");

    private static final Set<LinearLayout> playerOverlayChips =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static final Set<View> hookedTimeBarAncestors =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static final Set<String> notifiedSubtitleVideoKeys =
            Collections.synchronizedSet(new HashSet<>());
    private static volatile String activeChipVideoId = "";
    private static volatile int activeChipClickIndex = 0;

    public static final class SubtitleMatchItem {
        public final String matchedWord;
        public final String snippet;
        public final List<String> timestamps;
        public final List<Long> timestampMsList;
        long lastTimestampMs;

        SubtitleMatchItem(String matchedWord, String snippet, String firstTimestamp, long firstMs) {
            this.matchedWord = matchedWord;
            this.snippet = snippet;
            this.timestamps = new ArrayList<>(MAX_TIMESTAMPS_PER_WORD);
            this.timestampMsList = new ArrayList<>(MAX_TIMESTAMPS_PER_WORD);
            this.timestamps.add(firstTimestamp);
            this.timestampMsList.add(firstMs);
            this.lastTimestampMs = firstMs;
        }
    }

    private record ChipSeekPoint(String word, String timestamp, long timestampMs) {}

    private static final class SubtitleScanState {
        final CountDownLatch latch = new CountDownLatch(1);
        volatile boolean pending = true;
        volatile List<SubtitleMatchItem> items = Collections.emptyList();
        volatile List<ChipSeekPoint> seekPoints = Collections.emptyList();
    }

    private static final Map<String, SubtitleScanState> subtitleScanCache =
            Collections.synchronizedMap(Utils.createSizeRestrictedMap(80, true));

    /**
     * Called when a new video is loaded so subtitle scanning starts immediately in the background
     * and the player overlay chip resets.
     */
    public static void onVideoIdLoaded(@Nullable String videoId) {
        try {
            if (videoId == null || videoId.isEmpty()) {
                return;
            }
            activeChipVideoId = videoId;
            activeChipClickIndex = 0;
            Utils.runOnMainThread(EnhancedKeywordContentFilter::updatePlayerOverlayChip);

            if (!KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES.get()) {
                return;
            }
            EnhancedKeywordContentFilter filter = instance;
            if (filter == null) return;
            filter.reparseIfNeeded();
            List<KeywordRule> rules = filter.parsedRules;
            if (rules.isEmpty()) return;
            ensureSubtitleScanStarted(videoId, filter.currentRulesVersion, rules);
        } catch (Exception ex) {
            Logger.printException(() -> "EnhancedKeywordContentFilter.onVideoIdLoaded failure", ex);
        }
    }

    private static SubtitleScanState ensureSubtitleScanStarted(String videoId, int rulesVer,
                                                               List<KeywordRule> rules) {
        String cacheKey = videoId + "|" + rulesVer;
        synchronized (subtitleScanCache) {
            SubtitleScanState existing = subtitleScanCache.get(cacheKey);
            if (existing != null) {
                return existing;
            }
            SubtitleScanState state = new SubtitleScanState();
            subtitleScanCache.put(cacheKey, state);
            Utils.runOnBackgroundThread(() -> runSubtitleScan(videoId, rulesVer, state, rules));
            return state;
        }
    }

    private static void runSubtitleScan(String videoId, int rulesVer, SubtitleScanState state,
                                        List<KeywordRule> rules) {
        try {
            List<SubtitleLine> lines = fetchSubtitleLines(videoId);
            if (!lines.isEmpty()) {
                Map<String, SubtitleMatchItem> byWordKey = new LinkedHashMap<>();
                Set<String> seenSnippets = new HashSet<>();

                for (int i = 0, size = lines.size(); i < size; i++) {
                    SubtitleLine line = lines.get(i);
                    String text = line.text;
                    if (text.length() < 2) continue;

                    String matchedWord = findFirstRuleWordInSubtitle(text, rules);
                    if (matchedWord == null) continue;

                    String wordKey = matchedWord.toLowerCase(Locale.ROOT).trim();
                    if (wordKey.isEmpty()) continue;

                    SubtitleMatchItem existing = byWordKey.get(wordKey);
                    if (existing != null) {
                        if (line.startMs - existing.lastTimestampMs >= MIN_TIMESTAMP_GAP_MS
                                && existing.timestamps.size() < MAX_TIMESTAMPS_PER_WORD) {
                            String ts = formatTimestamp(line.startMs);
                            if (!existing.timestamps.contains(ts)) {
                                existing.timestamps.add(ts);
                                existing.timestampMsList.add(line.startMs);
                                existing.lastTimestampMs = line.startMs;
                            }
                        }
                        continue;
                    }

                    if (byWordKey.size() >= MAX_SUBTITLE_MATCH_ITEMS) {
                        continue;
                    }

                    String snippet = buildCleanSubtitleSnippet(text, matchedWord, 42);
                    String snippetKey = snippet.toLowerCase(Locale.ROOT);
                    if (!seenSnippets.add(snippetKey)) {
                        continue;
                    }

                    byWordKey.put(wordKey, new SubtitleMatchItem(
                            matchedWord,
                            snippet,
                            formatTimestamp(line.startMs),
                            line.startMs
                    ));
                }

                if (!byWordKey.isEmpty()) {
                    List<SubtitleMatchItem> itemList = new ArrayList<>(byWordKey.values());
                    List<ChipSeekPoint> points = new ArrayList<>();
                    for (SubtitleMatchItem item : itemList) {
                        for (int k = 0; k < item.timestamps.size(); k++) {
                            points.add(new ChipSeekPoint(
                                    item.matchedWord,
                                    item.timestamps.get(k),
                                    item.timestampMsList.get(k)
                            ));
                        }
                    }
                    points.sort((a, b) -> Long.compare(a.timestampMs(), b.timestampMs()));
                    state.items = Collections.unmodifiableList(itemList);
                    state.seekPoints = Collections.unmodifiableList(points);
                }
            }
        } catch (Exception ex) {
            Logger.printDebug(() -> "Subtitle scan failed for video: " + videoId, ex);
        } finally {
            state.pending = false;
            state.latch.countDown();
            Utils.runOnMainThread(EnhancedKeywordContentFilter::updatePlayerOverlayChip);
        }
    }

    private static String buildCompactSubtitleSummary(List<SubtitleMatchItem> items, int maxItems) {
        if (items.isEmpty()) return "";
        StringBuilder sb = new StringBuilder();
        int limit = Math.min(items.size(), maxItems);
        for (int i = 0; i < limit; i++) {
            if (i > 0) sb.append(", ");
            SubtitleMatchItem item = items.get(i);
            String word = item.matchedWord;
            if (word.length() > 14) {
                word = word.substring(0, 13) + "…";
            }
            sb.append(word)
                    .append(" (")
                    .append(String.join(", ", item.timestamps))
                    .append(')');
        }
        if (items.size() > limit) {
            sb.append(" +").append(items.size() - limit);
        }
        return sb.toString();
    }

    /**
     * Called from {@link LayoutComponentsFilter#hideChaptersTimelineButton(View)} and
     * {@link LayoutComponentsFilter#hideChapterTitle(View)} when the player time bar overlay views
     * are initialized. Attaches the semi-transparent subtitle chip next to the timestamp / chapter button.
     */
    public static void onPlayerTimeBarViewCreated(@Nullable View view) {
        if (view == null) return;
        try {
            LinearLayout targetRow = findPlayerTimestampRow(view);
            if (targetRow == null) return;

            View existing = targetRow.findViewWithTag(PLAYER_CHIP_TAG);
            if (existing instanceof LinearLayout existingChip) {
                playerOverlayChips.add(existingChip);
                ensureAncestorsHookedForChip(existingChip);
                updatePlayerOverlayChip();
                return;
            }

            LinearLayout chip = createPlayerSubtitleChip(targetRow.getContext());
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Dim.dp(26)
            );
            lp.gravity = Gravity.CENTER_VERTICAL;
            lp.setMarginStart(Dim.dp6);
            targetRow.addView(chip, lp);
            playerOverlayChips.add(chip);
            ensureAncestorsHookedForChip(chip);
            updatePlayerOverlayChip();
        } catch (Exception ex) {
            Logger.printException(() -> "onPlayerTimeBarViewCreated failure", ex);
        }
    }

    /**
     * Finds the horizontal LinearLayout in the player's bottom timestamp bar.
     * Prefers the shared horizontal LinearLayout that also holds the timestamp ("23:52 / 1:13:35")
     * so the chip stays outside the chapter wrapper that YouTube hides when a video has no chapters.
     */
    @Nullable
    private static LinearLayout findPlayerTimestampRow(View view) {
        LinearLayout innerHorizontalRow = null;
        LinearLayout sharedHorizontalRow = null;
        View childBranch = view;
        ViewParent p = view.getParent();
        int depth = 0;
        while (p instanceof ViewGroup vg && depth < 7) {
            if (vg instanceof LinearLayout ll && ll.getOrientation() == LinearLayout.HORIZONTAL) {
                if (innerHorizontalRow == null) {
                    innerHorizontalRow = ll;
                }
                if (hasNonChapterSibling(ll, childBranch)) {
                    sharedHorizontalRow = ll;
                }
            }
            if (ID_BOTTOM_UI_CONTAINER != 0 && vg.getId() == ID_BOTTOM_UI_CONTAINER) {
                break;
            }
            childBranch = vg;
            p = vg.getParent();
            depth++;
        }
        return sharedHorizontalRow != null ? sharedHorizontalRow : innerHorizontalRow;
    }

    private static boolean hasNonChapterSibling(ViewGroup group, View chapterBranch) {
        for (int i = 0, count = group.getChildCount(); i < count; i++) {
            View child = group.getChildAt(i);
            if (child != chapterBranch && !PLAYER_CHIP_TAG.equals(child.getTag())) {
                return true;
            }
        }
        return false;
    }

    private static void ensureAncestorsHookedForChip(LinearLayout chip) {
        ViewParent p = chip.getParent();
        int depth = 0;
        while (p instanceof ViewGroup vg && depth < 5) {
            if (ID_BOTTOM_UI_CONTAINER != 0 && vg.getId() == ID_BOTTOM_UI_CONTAINER) {
                break;
            }
            if (hookedTimeBarAncestors.add(vg)) {
                vg.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                    if (chip.getVisibility() == View.VISIBLE && v.getVisibility() != View.VISIBLE) {
                        v.setVisibility(View.VISIBLE);
                    }
                });
            }
            p = vg.getParent();
            depth++;
        }
    }

    private static void ensureChipAncestorsVisible(LinearLayout chip) {
        View curr = chip;
        ViewParent p = chip.getParent();
        int depth = 0;
        while (p instanceof ViewGroup vg && depth < 5) {
            if (ID_BOTTOM_UI_CONTAINER != 0 && vg.getId() == ID_BOTTOM_UI_CONTAINER) {
                break;
            }
            if (vg.getVisibility() != View.VISIBLE) {
                for (int i = 0, count = vg.getChildCount(); i < count; i++) {
                    View sibling = vg.getChildAt(i);
                    if (sibling != curr && sibling != chip && isChapterSpecificView(sibling)) {
                        if (sibling instanceof TextView tv && TextUtils.isEmpty(tv.getText())) {
                            sibling.setVisibility(View.GONE);
                        }
                    }
                }
                vg.setVisibility(View.VISIBLE);
            }
            ViewGroup.LayoutParams lp = vg.getLayoutParams();
            if (lp != null && (lp.width == 0 || lp.height == 0)) {
                lp.width = ViewGroup.LayoutParams.WRAP_CONTENT;
                lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                vg.setLayoutParams(lp);
            }
            if (hasNonChapterSibling(vg, curr)) {
                break;
            }
            curr = vg;
            p = vg.getParent();
            depth++;
        }
    }

    private static boolean isChapterSpecificView(View v) {
        int id = v.getId();
        if (id == View.NO_ID || id == 0) return false;
        if (LayoutComponentsFilter.CONTAINER_ID != 0 && id == LayoutComponentsFilter.CONTAINER_ID) {
            return true;
        }
        try {
            String name = v.getResources().getResourceEntryName(id);
            return name != null && name.contains("chapter");
        } catch (Exception ignored) {
            return false;
        }
    }

    private static LinearLayout createPlayerSubtitleChip(Context context) {
        LinearLayout chip = new LinearLayout(context);
        chip.setTag(PLAYER_CHIP_TAG);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.setPadding(Dim.dp8, 0, Dim.dp6, 0);

        GradientDrawable bg = new GradientDrawable();
        bg.setShape(GradientDrawable.RECTANGLE);
        bg.setCornerRadius(Dim.dp(999));
        bg.setColor(0x66000000);
        chip.setBackground(bg);
        chip.setClickable(true);
        chip.setFocusable(true);
        chip.setVisibility(View.GONE);

        ImageView iconView = new ImageView(context);
        iconView.setImageDrawable(new VectorSubtitlesIconDrawable(0xE6FFFFFF));
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(Dim.dp(14), Dim.dp(14));
        iconLp.gravity = Gravity.CENTER_VERTICAL;
        iconLp.setMarginEnd(Dim.dp(5));
        chip.addView(iconView, iconLp);

        TextView labelView = new TextView(context);
        labelView.setTextColor(0xFFFFFFFF);
        labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        labelView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labelView.setSingleLine(true);
        labelView.setEllipsize(TextUtils.TruncateAt.END);
        labelView.setMaxWidth(Dim.dp(175));
        labelView.setIncludeFontPadding(false);
        LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        labelLp.gravity = Gravity.CENTER_VERTICAL;
        chip.addView(labelView, labelLp);

        ImageView chevronView = new ImageView(context);
        chevronView.setImageDrawable(new VectorChevronDrawable(0xCCFFFFFF));
        LinearLayout.LayoutParams chevronLp = new LinearLayout.LayoutParams(Dim.dp10, Dim.dp10);
        chevronLp.gravity = Gravity.CENTER_VERTICAL;
        chevronLp.setMarginStart(Dim.dp(3));
        chip.addView(chevronView, chevronLp);

        chip.setOnClickListener(v -> onPlayerSubtitleChipClicked(chip));
        return chip;
    }

    private static void onPlayerSubtitleChipClicked(LinearLayout chip) {
        try {
            SubtitleScanState state = getActiveVideoSubtitleState();
            if (state == null || state.seekPoints.isEmpty()) {
                return;
            }
            List<ChipSeekPoint> points = state.seekPoints;
            int idx = activeChipClickIndex;
            if (idx < 0 || idx >= points.size()) {
                idx = 0;
            }
            ChipSeekPoint target = points.get(idx);
            chip.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
            VideoInformation.seekTo(target.timestampMs());

            if (points.size() > 1) {
                activeChipClickIndex = (idx + 1) % points.size();
                synchronized (playerOverlayChips) {
                    for (LinearLayout c : playerOverlayChips) {
                        if (c != null) {
                            bindPlayerChipText(c, points, activeChipClickIndex);
                        }
                    }
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onPlayerSubtitleChipClicked failure", ex);
        }
    }

    private static void updatePlayerOverlayChip() {
        try {
            boolean enabled = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES.get();
            SubtitleScanState state = enabled ? getActiveVideoSubtitleState() : null;
            boolean show = state != null && !state.pending && !state.seekPoints.isEmpty();

            List<ChipSeekPoint> points = show ? state.seekPoints : Collections.emptyList();
            if (show && (activeChipClickIndex < 0 || activeChipClickIndex >= points.size())) {
                activeChipClickIndex = 0;
            }

            synchronized (playerOverlayChips) {
                for (LinearLayout chip : playerOverlayChips) {
                    if (chip == null) continue;
                    if (!show) {
                        chip.setVisibility(View.GONE);
                    } else {
                        bindPlayerChipText(chip, points, activeChipClickIndex);
                        chip.setVisibility(View.VISIBLE);
                        ensureChipAncestorsVisible(chip);
                    }
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "updatePlayerOverlayChip failure", ex);
        }
    }

    private static void bindPlayerChipText(LinearLayout chip, List<ChipSeekPoint> points, int index) {
        if (chip.getChildCount() < 2 || !(chip.getChildAt(1) instanceof TextView labelView)) {
            return;
        }
        ChipSeekPoint pt = points.get(index);
        String word = pt.word();
        if (word.length() > 16) {
            word = word.substring(0, 15) + "…";
        }
        String text = word + " (" + pt.timestamp() + ")";
        if (points.size() > 1) {
            text += " · " + (index + 1) + "/" + points.size();
        }
        labelView.setText(text);
    }

    @Nullable
    private static SubtitleScanState getActiveVideoSubtitleState() {
        EnhancedKeywordContentFilter filter = instance;
        if (filter == null) return null;
        String videoId = VideoInformation.getStartingOrPlayingVideoId();
        if (videoId.isEmpty()) {
            videoId = VideoInformation.getVideoId();
        }
        if (videoId.isEmpty()) {
            videoId = activeChipVideoId;
        }
        if (videoId == null || videoId.isEmpty()) {
            return null;
        }
        return subtitleScanCache.get(videoId + "|" + filter.currentRulesVersion);
    }

    /**
     * Injection point called by {@code hookElement("$KEYWORD_FILTER->onDescriptionElementLoaded")}.
     * Prepends the native YouTube-styled subtitle matches section to the first text segment of
     * {@code description_rich_text_list.eml} or {@code cell_description_body.eml} and shifts
     * all protobuf runs so original links and social icons remain aligned.
     * Also awaits the subtitle scan when {@code expandable_metadata.eml} loads on the watch page.
     */
    public static byte[] onDescriptionElementLoaded(byte[] bytes) {
        try {
            if (!KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES.get()
                    || bytes == null
                    || !descriptionElementBuffer.check(bytes).isFiltered()) {
                return bytes;
            }

            EnhancedKeywordContentFilter filter = instance;
            if (filter == null) {
                return bytes;
            }
            filter.reparseIfNeeded();
            List<KeywordRule> rules = filter.parsedRules;
            if (rules.isEmpty()) {
                return bytes;
            }

            List<ProtoNode> root = ProtoNode.parse(bytes);
            if (root == null) {
                return bytes;
            }

            List<ProtoNode> textNodes = ProtoNode.textNodes(root);
            String identifier = null;
            for (int i = 0, size = textNodes.size(); i < size; i++) {
                String text = textNodes.get(i).getText();
                if (IDENTIFIER_PATTERN.matcher(text).matches()) {
                    identifier = text;
                    break;
                }
            }
            if (identifier == null) {
                return bytes;
            }

            boolean isShortsDescription = identifier.startsWith(SHORTS_DESCRIPTION_IDENTIFIER);
            boolean isVideoDescription = identifier.startsWith(DESCRIPTION_IDENTIFIER);
            if (!isShortsDescription && !isVideoDescription) {
                return bytes;
            }

            String videoId = findDescriptionVideoId(textNodes);
            if (videoId == null || videoId.isEmpty()) {
                videoId = VideoInformation.getStartingOrPlayingVideoId();
                if (videoId.isEmpty()) {
                    videoId = VideoInformation.getVideoId();
                }
            }
            if (videoId.isEmpty()) {
                return bytes;
            }

            SubtitleScanState state = ensureSubtitleScanStarted(videoId, filter.currentRulesVersion, rules);
            if (state.pending) {
                try {
                    state.latch.await(1500, TimeUnit.MILLISECONDS);
                } catch (InterruptedException ignored) {
                    Thread.currentThread().interrupt();
                }
            }

            List<SubtitleMatchItem> items = state.items;
            if (items.isEmpty()) {
                return bytes;
            }

            String headerTitle = str("morphe_hide_keyword_subtitles_header");
            int totalCount = Math.max(items.size(), state.seekPoints.size());
            StringBuilder block = new StringBuilder();
            block.append(SUBTITLE_BANNER_START_MARKER)
                    .append("\u00A0 ")
                    .append(headerTitle)
                    .append(" · ")
                    .append(totalCount)
                    .append('\n');
            for (int i = 0, size = items.size(); i < size; i++) {
                SubtitleMatchItem item = items.get(i);
                block.append(String.join(" ", item.timestamps))
                        .append(' ')
                        .append(item.snippet)
                        .append('\n');
            }
            block.append(SUBTITLE_DIVIDER_MARKER)
                    .append(SUBTITLE_BANNER_END_MARKER)
                    .append('\n');
            String prefix = block.toString();

            boolean modified = isShortsDescription
                    ? prependToShortsDescription(root, prefix)
                    : prependToVideoDescription(root, prefix);

            return modified ? ProtoNode.write(root) : bytes;
        } catch (Exception ex) {
            Logger.printException(() -> "onDescriptionElementLoaded failure", ex);
        }
        return bytes;
    }

    @Nullable
    private static String findDescriptionVideoId(List<ProtoNode> textNodes) {
        for (int i = 0, size = textNodes.size(); i < size; i++) {
            String text = textNodes.get(i).getText();
            if (text.contains(DESCRIPTION_REDIRECT_PATH)) {
                try {
                    Uri uri = Uri.parse(text);
                    if (DESCRIPTION_REDIRECT_PATH.equals(uri.getPath()) && uri.getHost() != null) {
                        String v = uri.getQueryParameter("v");
                        if (v != null && v.length() == 11) {
                            return v;
                        }
                    }
                } catch (Exception ignored) {
                }
            }
        }
        for (int i = 0, size = textNodes.size(); i < size; i++) {
            String text = textNodes.get(i).getText();
            if (!ENTITY_KEY_PATTERN.matcher(text).matches()) {
                continue;
            }
            try {
                byte[] decoded = Base64.decode(text.replace("%3D", ""),
                        Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP);
                Matcher matcher = ENCODED_VIDEO_ID_PATTERN.matcher(
                        new String(decoded, StandardCharsets.ISO_8859_1));
                if (matcher.find()) {
                    return matcher.group(1);
                }
            } catch (IllegalArgumentException ignored) {
            }
        }
        return null;
    }

    private static boolean prependToVideoDescription(List<ProtoNode> root, String prefix) {
        List<ProtoNode> segments = findDescriptionBodySegments(root);
        if (segments == null) {
            return false;
        }
        for (int i = 0, size = segments.size(); i < size; i++) {
            ProtoNode segment = segments.get(i);
            ProtoNode segmentText = ProtoNode.field(segment.children, SEGMENT_TEXT_FIELD_NUMBER);
            ProtoNode content = segmentText == null || segmentText.children == null
                    ? null
                    : ProtoNode.field(segmentText.children, TEXT_CONTENT_FIELD_NUMBER);
            if (content != null && content.decodeText() != null && !content.decodeText().isEmpty()) {
                return prependTextAndShiftRuns(segmentText.children, content, prefix);
            }
        }
        return false;
    }

    @Nullable
    private static List<ProtoNode> findDescriptionBodySegments(List<ProtoNode> message) {
        boolean isBody = false;
        List<ProtoNode> segments = new ArrayList<>();
        boolean hasText = false;
        for (int i = 0, size = message.size(); i < size; i++) {
            ProtoNode field = message.get(i);
            if (field.isText() && DESCRIPTION_BODY_STATE_ID.equals(field.getText())) {
                isBody = true;
            } else if (field.getFieldNumber() == SEGMENT_FIELD_NUMBER && field.children != null) {
                segments.add(field);
                ProtoNode segmentText = ProtoNode.field(field.children, SEGMENT_TEXT_FIELD_NUMBER);
                ProtoNode content = segmentText == null || segmentText.children == null
                        ? null
                        : ProtoNode.field(segmentText.children, TEXT_CONTENT_FIELD_NUMBER);
                if (content != null) {
                    String decoded = content.decodeText();
                    hasText |= decoded != null && !decoded.isEmpty();
                }
            }
        }
        if (isBody && hasText) {
            return segments;
        }

        for (int i = 0, size = message.size(); i < size; i++) {
            ProtoNode field = message.get(i);
            if (field.children != null) {
                List<ProtoNode> bodySegments = findDescriptionBodySegments(field.children);
                if (bodySegments != null) {
                    return bodySegments;
                }
            }
        }
        return null;
    }

    private static boolean prependToShortsDescription(List<ProtoNode> root, String prefix) {
        ProtoNode content = findShortsDescriptionContent(root, null);
        if (content == null) {
            return false;
        }
        ProtoNode parent = content.getParent();
        if (parent != null && parent.children != null
                && ProtoNode.field(parent.children, TEXT_CONTENT_FIELD_NUMBER) == content) {
            return prependTextAndShiftRuns(parent.children, content, prefix);
        }
        String originalText = content.decodeUtf8();
        if (originalText.contains(SUBTITLE_BANNER_START_MARKER)) {
            return false;
        }
        content.setText(prefix + originalText);
        return true;
    }

    @Nullable
    private static ProtoNode findShortsDescriptionContent(List<ProtoNode> message,
                                                          @Nullable ProtoNode best) {
        for (int i = 0, size = message.size(); i < size; i++) {
            ProtoNode field = message.get(i);
            if (field.children != null) {
                best = findShortsDescriptionContent(field.children, best);
                continue;
            }
            if (field.getFieldNumber() != TEXT_CONTENT_FIELD_NUMBER) {
                continue;
            }
            String text = field.decodeText();
            if (text != null && normalizeAndFilterUserText(text, null) != null
                    && (best == null || text.length() > best.decodeUtf8().length())) {
                best = field;
            }
        }
        return best;
    }

    private static final int DECORATION_RUNS_FIELD_NUMBER = 8;

    private static boolean prependTextAndShiftRuns(List<ProtoNode> textFields, ProtoNode content,
                                                   String prefix) {
        String originalText = content.decodeUtf8();
        if (originalText == null || originalText.isEmpty()
                || originalText.contains(SUBTITLE_BANNER_START_MARKER)) {
            return false;
        }
        final int originalLength = originalText.length();
        final int prefixLength = prefix.length();

        for (int i = 0, size = textFields.size(); i < size; i++) {
            ProtoNode run = textFields.get(i);
            if (run == content || run.children == null) {
                continue;
            }
            int fn = run.getFieldNumber();
            if (fn != STYLE_RUNS_FIELD_NUMBER
                    && fn != COMMAND_RUNS_FIELD_NUMBER
                    && fn != ATTACHMENT_RUNS_FIELD_NUMBER
                    && fn != DECORATION_RUNS_FIELD_NUMBER) {
                continue;
            }
            shiftRunRange(run.children, originalLength, prefixLength,
                    fn == STYLE_RUNS_FIELD_NUMBER, fn == DECORATION_RUNS_FIELD_NUMBER);
        }

        content.setText(prefix + originalText);
        return true;
    }

    private static void shiftRunRange(List<ProtoNode> runFields, int originalLength,
                                      int prefixLength, boolean isStyleRun, boolean isDecorationRun) {
        List<ProtoNode> rangeMessage = resolveRunRangeMessage(runFields, originalLength, isDecorationRun);
        if (rangeMessage == null) {
            return;
        }
        ProtoNode startNode = ProtoNode.field(rangeMessage, RANGE_START_FIELD_NUMBER);
        ProtoNode lengthNode = ProtoNode.field(rangeMessage, RANGE_LENGTH_FIELD_NUMBER);
        if (lengthNode == null || lengthNode.getVarint() == null) {
            return;
        }
        long start = (startNode != null && startNode.getVarint() != null) ? startNode.getVarint() : 0L;
        long len = lengthNode.getVarint();
        if (start < 0 || len <= 0 || start + len > originalLength) {
            return;
        }

        // Full-text base StyleRun: keep start = 0 and extend length to cover prefix + originalText
        // so both the subtitle block and the end of the description receive the exact base style.
        if (isStyleRun && start == 0L && len >= originalLength) {
            if (startNode != null) {
                startNode.setVarint(0L);
            }
            lengthNode.setVarint(len + prefixLength);
            return;
        }

        // All other runs (including runs starting at 0 where start_index was omitted on wire):
        // shift start_index by +prefixLength and keep length unchanged.
        long shiftedStart = start + prefixLength;
        if (startNode != null && startNode.getVarint() != null) {
            startNode.setVarint(shiftedStart);
        } else {
            ProtoNode newStart = createVarintNode(RANGE_START_FIELD_NUMBER, shiftedStart);
            if (newStart != null) {
                rangeMessage.add(0, newStart);
            }
        }
    }

    @Nullable
    private static List<ProtoNode> resolveRunRangeMessage(List<ProtoNode> runFields,
                                                          int originalLength,
                                                          boolean isDecorationRun) {
        ProtoNode directLength = ProtoNode.field(runFields, RANGE_LENGTH_FIELD_NUMBER);
        if (directLength != null && directLength.getVarint() != null) {
            return runFields;
        }
        if (isDecorationRun) {
            for (int i = 0, size = runFields.size(); i < size; i++) {
                List<ProtoNode> child = runFields.get(i).children;
                if (child == null) continue;
                ProtoNode lenNode = ProtoNode.field(child, RANGE_LENGTH_FIELD_NUMBER);
                if (lenNode != null && lenNode.getVarint() != null) {
                    long len = lenNode.getVarint();
                    if (len > 0 && len <= originalLength) {
                        return child;
                    }
                }
            }
        }
        return null;
    }

    @Nullable
    private static ProtoNode createVarintNode(int fieldNumber, long value) {
        byte tag = (byte) (fieldNumber << 3);
        List<ProtoNode> parsed = ProtoNode.parse(new byte[]{tag, 0});
        if (parsed == null || parsed.isEmpty()) {
            return null;
        }
        ProtoNode node = parsed.get(0);
        node.setVarint(value);
        return node;
    }

    private static final class SubtitleBannerDecoratedSpan {}

    /**
     * Styles the subtitle matches section inside the description card using 100% native YouTube
     * design tokens without altering line heights (preventing any vertical clipping/shifting).
     */
    private static void decorateSubtitleBannerSpans(Spannable spannable) {
        SubtitleBannerDecoratedSpan[] existing =
                spannable.getSpans(0, spannable.length(), SubtitleBannerDecoratedSpan.class);
        if (existing != null && existing.length > 0) {
            return;
        }

        String text = spannable.toString();
        int startIdx = text.indexOf(SUBTITLE_BANNER_START_MARKER);
        if (startIdx < 0) {
            return;
        }
        int endMarkerIdx = text.indexOf(SUBTITLE_BANNER_END_MARKER, startIdx);
        if (endMarkerIdx <= startIdx) {
            return;
        }
        final int bannerEnd = endMarkerIdx + SUBTITLE_BANNER_END_MARKER.length();

        boolean dark = ((ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF) < 0x00808080);
        int primaryColor = dark ? 0xFFF1F1F1 : 0xFF0F0F0F;
        int secondaryColor = dark ? 0xFFAAAAAA : 0xFF606060;

        spannable.setSpan(new ForegroundColorSpan(secondaryColor),
                startIdx, bannerEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);

        // 1. Header line: vector CC icon + bold title + secondary count
        int iconStart = startIdx + SUBTITLE_BANNER_START_MARKER.length();
        int firstNewline = text.indexOf('\n', iconStart);
        if (firstNewline > iconStart + 2) {
            spannable.setSpan(new SubtitleVectorIconSpan(primaryColor),
                    iconStart, iconStart + 2, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            int dotIdx = text.indexOf(" · ", iconStart + 2);
            int titleEnd = (dotIdx > iconStart + 2 && dotIdx < firstNewline) ? dotIdx : firstNewline;
            spannable.setSpan(new ForegroundColorSpan(primaryColor),
                    iconStart + 2, titleEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            spannable.setSpan(new StyleSpan(Typeface.BOLD),
                    iconStart + 2, titleEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }

        // 2. Native YouTube rounded blue timestamp pills (08:29) that seek on click
        String bannerSlice = text.substring(startIdx, bannerEnd);
        Matcher tsMatcher = TIMESTAMP_TOKEN_PATTERN.matcher(bannerSlice);
        while (tsMatcher.find()) {
            String tsStr = tsMatcher.group();
            long seekMs = parseTimestampToMs(tsStr);
            if (seekMs >= 0) {
                int tsAbsStart = startIdx + tsMatcher.start();
                int tsAbsEnd = startIdx + tsMatcher.end();
                spannable.setSpan(new SubtitleTimestampPillSpan(seekMs),
                        tsAbsStart, tsAbsEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                spannable.setSpan(new SubtitleTimestampClickableSpan(seekMs),
                        tsAbsStart, tsAbsEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
        }

        // 3. Highlight matched keywords inside the subtitle snippets using native bold primary text
        SubtitleScanState state = getActiveVideoSubtitleState();
        if (state != null && !state.items.isEmpty()) {
            String lowerBanner = bannerSlice.toLowerCase(Locale.ROOT);
            for (SubtitleMatchItem item : state.items) {
                String lowerWord = item.matchedWord.toLowerCase(Locale.ROOT);
                if (lowerWord.isEmpty()) continue;
                int searchFrom = firstNewline > startIdx ? (firstNewline - startIdx) : 0;
                while (searchFrom < lowerBanner.length()) {
                    int wIdx = lowerBanner.indexOf(lowerWord, searchFrom);
                    if (wIdx < 0) break;
                    int wAbsStart = startIdx + wIdx;
                    int wAbsEnd = wAbsStart + item.matchedWord.length();
                    if (wAbsEnd <= bannerEnd) {
                        spannable.setSpan(new ForegroundColorSpan(primaryColor),
                                wAbsStart, wAbsEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                        spannable.setSpan(new StyleSpan(Typeface.BOLD),
                                wAbsStart, wAbsEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    }
                    searchFrom = wIdx + Math.max(1, lowerWord.length());
                }
            }
        }

        // 4. Subtle 1px bottom divider line on the dedicated separator line at the end of the block
        int divIdx = text.indexOf(SUBTITLE_DIVIDER_MARKER, startIdx);
        if (divIdx >= startIdx && divIdx < bannerEnd) {
            int divEnd = divIdx + SUBTITLE_DIVIDER_MARKER.length();
            spannable.setSpan(new SubtitleBottomDividerSpan(divIdx, divEnd),
                    divIdx, bannerEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }

        spannable.setSpan(new SubtitleBannerDecoratedSpan(),
                startIdx, bannerEnd, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private static long parseTimestampToMs(String ts) {
        try {
            String[] parts = ts.split(":");
            if (parts.length == 2) {
                long m = Long.parseLong(parts[0]);
                long s = Long.parseLong(parts[1]);
                return (m * 60L + s) * 1000L;
            } else if (parts.length == 3) {
                long h = Long.parseLong(parts[0]);
                long m = Long.parseLong(parts[1]);
                long s = Long.parseLong(parts[2]);
                return (h * 3600L + m * 60L + s) * 1000L;
            }
        } catch (NumberFormatException ignored) {
        }
        return -1L;
    }

    public static final class SubtitleTimestampClickableSpan extends ClickableSpan {
        final long timestampMs;

        SubtitleTimestampClickableSpan(long timestampMs) {
            this.timestampMs = timestampMs;
        }

        @Override
        public void onClick(@NonNull View widget) {
            try {
                widget.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                VideoInformation.seekTo(timestampMs);
            } catch (Exception ex) {
                Logger.printException(() -> "SubtitleTimestampClickableSpan.onClick failure", ex);
            }
        }

        @Override
        public void updateDrawState(@NonNull TextPaint ds) {
            boolean dark = ((ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF) < 0x00808080);
            ds.setColor(dark ? 0xFF3EA6FF : 0xFF065FD4);
            ds.setUnderlineText(false);
            ds.setFakeBoldText(true);
        }
    }

    private static final class SubtitleTimestampPillSpan extends ReplacementSpan {
        final long timestampMs;
        private final Paint bgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint textPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final RectF pillRect = new RectF();
        private final int padH = Dim.dp(6);
        private final int marginEnd = Dim.dp(6);
        private final float cornerRadius = Dim.dp(4);
        int lastMeasuredPillWidth;

        SubtitleTimestampPillSpan(long timestampMs) {
            this.timestampMs = timestampMs;
        }

        private void configurePaints(Paint basePaint, boolean dark) {
            textPaint.set(basePaint);
            textPaint.setTextSize(basePaint.getTextSize() * 0.90f);
            textPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            textPaint.setColor(dark ? 0xFF3EA6FF : 0xFF065FD4);
            bgPaint.setStyle(Paint.Style.FILL);
            bgPaint.setColor(dark ? 0x263EA6FF : 0x1A065FD4);
        }

        @Override
        public int getSize(@NonNull Paint paint, CharSequence text, int start, int end,
                           @Nullable Paint.FontMetricsInt fm) {
            boolean dark = ((ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF) < 0x00808080);
            configurePaints(paint, dark);
            // Do not mutate fm (FontMetricsInt) so StaticLayout line height matches YouTube's container measurement.
            float textWidth = textPaint.measureText(text, start, end);
            lastMeasuredPillWidth = Math.round(textWidth + padH * 2);
            return lastMeasuredPillWidth + marginEnd;
        }

        @Override
        public void draw(@NonNull Canvas canvas, CharSequence text, int start, int end,
                         float x, int top, int y, int bottom, @NonNull Paint paint) {
            boolean dark = ((ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF) < 0x00808080);
            configurePaints(paint, dark);

            float textWidth = textPaint.measureText(text, start, end);
            float pillWidth = textWidth + padH * 2;
            lastMeasuredPillWidth = Math.round(pillWidth);

            Paint.FontMetrics baseFm = paint.getFontMetrics();
            float pillTop = y + baseFm.ascent;
            float pillBottom = y + baseFm.descent;
            pillRect.set(x, pillTop, x + pillWidth, pillBottom);
            canvas.drawRoundRect(pillRect, cornerRadius, cornerRadius, bgPaint);

            Paint.FontMetrics tfm = textPaint.getFontMetrics();
            float textBaseline = (pillTop + pillBottom) / 2f - (tfm.ascent + tfm.descent) / 2f;
            canvas.drawText(text, start, end, x + padH, textBaseline, textPaint);
        }
    }

    /**
     * Draws a single subtle 1px native YouTube horizontal divider on the dedicated blank separator
     * line below the subtitle matches section without altering line height metrics.
     */
    private static final class SubtitleBottomDividerSpan implements LineBackgroundSpan {
        private final int divStart;
        private final int divEnd;
        private final Paint linePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        SubtitleBottomDividerSpan(int divStart, int divEnd) {
            this.divStart = divStart;
            this.divEnd = divEnd;
            linePaint.setStyle(Paint.Style.STROKE);
            linePaint.setStrokeWidth(Math.max(1f, Dim.dp1 * 0.75f));
        }

        @Override
        public void drawBackground(@NonNull Canvas canvas, @NonNull Paint paint,
                                   int left, int right, int top, int baseline, int bottom,
                                   @NonNull CharSequence text, int start, int end, int lineNumber) {
            if (start <= divStart && end >= divEnd) {
                boolean dark = ((ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF) < 0x00808080);
                linePaint.setColor(dark ? 0x1FFFFFFF : 0x14000000);
                float midY = (top + bottom) / 2f;
                canvas.drawLine(left, midY, right, midY, linePaint);
            }
        }
    }

    /**
     * ReplacementSpan that draws a crisp vector Subtitles / Closed-Caption icon inline (zero emojis).
     */
    private static final class SubtitleVectorIconSpan extends ReplacementSpan {
        private final VectorSubtitlesIconDrawable drawable;
        private final int widthPx;
        private final int iconSizePx;

        SubtitleVectorIconSpan(int color) {
            this.drawable = new VectorSubtitlesIconDrawable(color);
            this.iconSizePx = Dim.dp(15);
            this.widthPx = Dim.dp20;
        }

        @Override
        public int getSize(@NonNull Paint paint, CharSequence text, int start, int end,
                           @Nullable Paint.FontMetricsInt fm) {
            return widthPx;
        }

        @Override
        public void draw(@NonNull Canvas canvas, CharSequence text, int start, int end,
                         float x, int top, int y, int bottom, @NonNull Paint paint) {
            Paint.FontMetricsInt fm = paint.getFontMetricsInt();
            int centerY = y + (fm.ascent + fm.descent) / 2;
            int iconTop = centerY - iconSizePx / 2;
            int iconLeft = Math.round(x);
            drawable.setBounds(iconLeft, iconTop, iconLeft + iconSizePx, iconTop + iconSizePx);
            drawable.draw(canvas);
        }
    }

    /**
     * Vector drawable of a Subtitles / Closed-Caption icon (rounded frame + two caption bars).
     */
    private static final class VectorSubtitlesIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF boxRect = new RectF();

        VectorSubtitlesIconDrawable(int color) {
            paint.setColor(color);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            float w = b.width();
            float h = b.height();
            float stroke = Math.max(1.5f, w * 0.11f);
            paint.setStrokeWidth(stroke);

            // Outer rounded caption box
            paint.setStyle(Paint.Style.STROKE);
            float vInset = h * 0.12f;
            float hInset = w * 0.06f;
            boxRect.set(b.left + hInset, b.top + vInset, b.right - hInset, b.bottom - vInset);
            float corner = w * 0.18f;
            canvas.drawRoundRect(boxRect, corner, corner, paint);

            // Two horizontal subtitle lines inside the box
            float line1Y = b.top + h * 0.43f;
            float line2Y = b.top + h * 0.63f;
            canvas.drawLine(b.left + w * 0.24f, line1Y, b.left + w * 0.76f, line1Y, paint);
            canvas.drawLine(b.left + w * 0.24f, line2Y, b.left + w * 0.58f, line2Y, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Vector drawable of a right-pointing chevron ('>') matching YouTube's player overlay chip.
     */
    private static final class VectorChevronDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();

        VectorChevronDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            float w = b.width();
            float h = b.height();
            paint.setStrokeWidth(Math.max(1.5f, w * 0.16f));

            path.reset();
            path.moveTo(b.left + w * 0.30f, b.top + h * 0.20f);
            path.lineTo(b.left + w * 0.68f, b.top + h * 0.50f);
            path.lineTo(b.left + w * 0.30f, b.top + h * 0.80f);
            canvas.drawPath(path, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    @Nullable
    private static String findFirstRuleWordInSubtitle(String text, List<KeywordRule> rules) {
        List<String> singleList = Collections.singletonList(text);
        for (int i = 0, size = rules.size(); i < size; i++) {
            List<MatchDetails> details = rules.get(i).matchAcrossTexts(singleList);
            if (details != null && !details.isEmpty()) {
                return details.get(0).matchedWord();
            }
        }
        return null;
    }

    private static String buildCleanSubtitleSnippet(String text, String matchedWord, int maxChars) {
        String cleaned = text.replaceAll("\\s+", " ").trim();
        if (cleaned.length() <= maxChars) {
            return cleaned;
        }
        int idx = cleaned.toLowerCase(Locale.ROOT).indexOf(matchedWord.toLowerCase(Locale.ROOT));
        if (idx < 0) {
            idx = 0;
        }
        int half = Math.max(8, (maxChars - matchedWord.length()) / 2);
        int start = Math.max(0, idx - half);
        int end = Math.min(cleaned.length(), start + maxChars);
        if (end == cleaned.length()) {
            start = Math.max(0, end - maxChars);
        }

        if (start > 0) {
            int nextSpace = cleaned.indexOf(' ', start);
            if (nextSpace > start && nextSpace < idx) {
                start = nextSpace + 1;
            }
        }
        if (end < cleaned.length()) {
            int prevSpace = cleaned.lastIndexOf(' ', end);
            if (prevSpace > idx + matchedWord.length()) {
                end = prevSpace;
            }
        }

        StringBuilder sb = new StringBuilder();
        if (start > 0) sb.append("…");
        sb.append(cleaned, start, end);
        if (end < cleaned.length()) sb.append("…");
        return sb.toString();
    }

    private static String formatTimestamp(long ms) {
        long totalSec = Math.max(0L, ms / 1000L);
        long hours = totalSec / 3600L;
        long minutes = (totalSec % 3600L) / 60L;
        long seconds = totalSec % 60L;
        if (hours > 0) {
            return String.format(Locale.US, "%d:%02d:%02d", hours, minutes, seconds);
        }
        return String.format(Locale.US, "%02d:%02d", minutes, seconds);
    }

    private record SubtitleLine(long startMs, String text) {}

    private static List<SubtitleLine> fetchSubtitleLines(String videoId) {
        Utils.verifyOffMainThread();
        // 1. Try ANDROID_VR client first (does not require poToken) and ANDROID client with auth
        String[][] clients = {
                {"ANDROID_VR", "1.60.19", "28", "com.google.android.apps.youtube.vr.oculus/1.60.19 (Linux; U; Android 12; en_US; Quest 2) gzip"},
                {"ANDROID", "20.10.38", "3", "com.google.android.youtube/20.10.38 (Linux; U; Android 11) gzip"}
        };
        for (String[] client : clients) {
            try {
                String[] innertube = fetchCaptionUrlFromInnertube(videoId, client[0], client[1], client[2], client[3]);
                String captionUrl = innertube[0];
                String poToken = innertube[1];
                if (captionUrl != null) {
                    String baseUrl = captionUrl.replaceAll("&fmt=[^&]*", "") + "&fmt=json3";
                    if (poToken != null) baseUrl += "&pot=" + poToken;
                    String json = fetchSubtitleHttp(baseUrl);
                    List<SubtitleLine> parsed = parseJson3Subtitles(json);
                    if (!parsed.isEmpty()) {
                        return parsed;
                    }
                }
            } catch (Exception ex) {
                Logger.printDebug(() -> "Innertube caption lookup failed for " + client[0], ex);
            }
        }

        for (String lang : List.of("ru", "en", "en-US", "uk")) {
            try {
                String url = "https://www.youtube.com/api/timedtext?v=" + videoId
                        + "&lang=" + lang + "&kind=asr&fmt=json3";
                String json = fetchSubtitleHttp(url);
                if (!json.isEmpty()) {
                    List<SubtitleLine> parsed = parseJson3Subtitles(json);
                    if (!parsed.isEmpty()) {
                        return parsed;
                    }
                }
            } catch (Exception ignored) {
            }
        }
        return Collections.emptyList();
    }

    private static String[] fetchCaptionUrlFromInnertube(String videoId, String clientName,
                                                         String clientVersion, String clientIdHeader,
                                                         String userAgent) throws Exception {
        String body = "{\"context\":{\"client\":{\"clientName\":\"" + clientName + "\","
                + "\"clientVersion\":\"" + clientVersion + "\"}},"
                + "\"videoId\":\"" + videoId + "\"}";

        HttpURLConnection conn = Requester.openConnection(INNERTUBE_PLAYER_URL);
        conn.setRequestMethod("POST");
        conn.setConnectTimeout(SUBTITLE_CONNECT_TIMEOUT_MS);
        conn.setReadTimeout(SUBTITLE_READ_TIMEOUT_MS);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("User-Agent", userAgent);
        conn.setRequestProperty("X-YouTube-Client-Name", clientIdHeader);
        conn.setRequestProperty("X-YouTube-Client-Version", clientVersion);
        if ("ANDROID".equals(clientName)) {
            Map<String, String> authHeaders = AuthUtils.getRequestHeader();
            for (Map.Entry<String, String> entry : authHeaders.entrySet()) {
                if (!entry.getValue().isEmpty()) {
                    conn.setRequestProperty(entry.getKey(), entry.getValue());
                }
            }
        }
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes(StandardCharsets.UTF_8));
        }

        if (conn.getResponseCode() != 200) {
            throw new Exception("Unexpected HTTP status: " + conn.getResponseCode());
        }

        String response = Requester.parseString(conn);
        return new String[]{selectBestCaptionTrackUrl(response), extractPoToken(response)};
    }

    @Nullable
    private static String extractPoToken(String json) {
        int idx = json.indexOf("\"poToken\":\"");
        if (idx < 0) return null;
        idx += "\"poToken\":\"".length();
        int end = json.indexOf('"', idx);
        return end < 0 ? null : json.substring(idx, end);
    }

    @Nullable
    private static String selectBestCaptionTrackUrl(String json) {
        int tracksIdx = json.indexOf("\"captionTracks\":[");
        if (tracksIdx < 0) return null;

        String preferredLang = Locale.getDefault().getLanguage().toLowerCase(Locale.ROOT);
        String firstUrl = null;
        String firstNonGemini = null;
        String preferredLangUrl = null;
        String ruUrl = null;
        int searchFrom = tracksIdx;

        while (true) {
            int baseUrlIdx = json.indexOf("\"baseUrl\":\"", searchFrom);
            if (baseUrlIdx < 0 || baseUrlIdx > tracksIdx + 50_000) break;
            baseUrlIdx += "\"baseUrl\":\"".length();

            int endIdx = json.indexOf('"', baseUrlIdx);
            if (endIdx < 0) break;

            String url = json.substring(baseUrlIdx, endIdx)
                    .replace("\\u0026", "&")
                    .replace("\\u003d", "=")
                    .replace("\\u003e", ">")
                    .replace("\\u003c", "<");

            if (firstUrl == null) firstUrl = url;
            boolean nonGemini = !url.contains("variant=gemini");
            if (firstNonGemini == null && nonGemini) firstNonGemini = url;

            String urlLang = extractLangParam(url).split("-")[0].toLowerCase(Locale.ROOT);
            if (preferredLangUrl == null && nonGemini && preferredLang.equals(urlLang)) {
                preferredLangUrl = url;
            }
            if (ruUrl == null && nonGemini && "ru".equals(urlLang)) {
                ruUrl = url;
            }

            searchFrom = endIdx + 1;
        }

        if (preferredLangUrl != null) return preferredLangUrl;
        if (ruUrl != null) return ruUrl;
        return firstNonGemini != null ? firstNonGemini : firstUrl;
    }

    private static String extractLangParam(String url) {
        for (String prefix : List.of("&lang=", "?lang=")) {
            int idx = url.indexOf(prefix);
            if (idx >= 0) {
                idx += prefix.length();
                int end = url.indexOf('&', idx);
                return end < 0 ? url.substring(idx) : url.substring(idx, end);
            }
        }
        return "";
    }

    private static String fetchSubtitleHttp(String urlStr) throws Exception {
        HttpURLConnection conn = Requester.openConnection(urlStr);
        conn.setConnectTimeout(SUBTITLE_CONNECT_TIMEOUT_MS);
        conn.setReadTimeout(SUBTITLE_READ_TIMEOUT_MS);
        conn.setRequestProperty("User-Agent", CaptionCookiesPatch.getUserAgent());
        String cookies = CaptionCookiesPatch.getCookies();
        if (!cookies.isEmpty()) {
            conn.setRequestProperty("Cookie", cookies);
        }
        Map<String, String> authHeaders = AuthUtils.getRequestHeader();
        for (Map.Entry<String, String> entry : authHeaders.entrySet()) {
            if (!entry.getValue().isEmpty()) {
                conn.setRequestProperty(entry.getKey(), entry.getValue());
            }
        }
        if (conn.getResponseCode() != 200) {
            throw new Exception("HTTP " + conn.getResponseCode());
        }
        return Requester.parseString(conn);
    }

    private static List<SubtitleLine> parseJson3Subtitles(String json) throws Exception {
        List<SubtitleLine> lines = new ArrayList<>();
        JSONObject root = new JSONObject(json);
        JSONArray events = root.optJSONArray("events");
        if (events == null) return lines;

        String prevText = "";
        for (int i = 0, len = events.length(); i < len; i++) {
            JSONObject event = events.getJSONObject(i);
            if (event.optInt("aAppend", 0) == 1) continue;

            JSONArray segs = event.optJSONArray("segs");
            if (segs == null) continue;

            long startMs = event.optLong("tStartMs", -1);
            if (startMs < 0) continue;

            StringBuilder sb = new StringBuilder();
            for (int j = 0, sLen = segs.length(); j < sLen; j++) {
                sb.append(segs.getJSONObject(j).optString("utf8", ""));
            }

            String text = sb.toString()
                    .replace('\n', ' ')
                    .replace(">>", "")
                    .replace("\u266A", "")
                    .replace("\u266B", "")
                    .trim();
            text = SUBTITLE_BRACKETS_PATTERN.matcher(text).replaceAll("");
            text = SUBTITLE_PARENS_PATTERN.matcher(text).replaceAll("");
            text = text.replaceAll("\\s+", " ").trim();

            if (!text.isEmpty() && !text.equalsIgnoreCase(prevText)) {
                lines.add(new SubtitleLine(startMs, text));
                prevText = text;
            }
        }
        return lines;
    }

    // endregion

    // region Debug Mode & Description Banner Touch Hooks

    private static final Map<ComponentHost, Boolean> touchHookedBannerHosts =
            Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Injection point called by {@code hookLithoSpannableString(KEYWORD_FILTER)}.
     */
    public static CharSequence onLithoTextLoaded(ContextInterface contextInterface, CharSequence original) {
        try {
            if (original == null) {
                return null;
            }

            EnhancedKeywordContentFilter filter = instance;
            if (filter == null) {
                return original;
            }
            filter.reparseIfNeeded();

            String rawStr = original.toString();

            // 1. If this text contains the subtitle banner markers, decorate it with native pills & clickable spans
            if (rawStr.contains(SUBTITLE_BANNER_START_MARKER)) {
                SpannableString spanned = original instanceof SpannableString ss
                        ? ss
                        : new SpannableString(original);
                decorateSubtitleBannerSpans(spanned);
                return spanned;
            }

            // 3. Debug Mode inline word highlighting
            if (!KeywordFilterSettings.HIDE_KEYWORD_CONTENT_DEBUG.get()) {
                return original;
            }
            if (getDebugRuleSpan(original) != null) {
                return original;
            }

            List<KeywordRule> rules = filter.parsedRules;
            if (rules.isEmpty()) {
                return original;
            }

            if (!filter.isContextFilterableForDebug(contextInterface)) {
                return original;
            }

            String cleaned = stripFormatCharacters(rawStr);
            if (cleaned.length() < 2
                    || isDurationOrBadgeText(cleaned)
                    || COMMENT_UI_LABELS.contains(cleaned.toLowerCase(Locale.ROOT))) {
                return original;
            }

            MatchDetails recorded = debugMatchedTextMap.get(cleaned);
            List<int[]> matchRanges = new ArrayList<>();
            String matchedWord = null;
            String matchedRuleDisplay = null;

            for (int i = 0, size = rules.size(); i < size; i++) {
                KeywordRule rule = rules.get(i);
                boolean allowPartialAnd = recorded != null && recorded.ruleDisplay().equals(rule.displayRule);
                List<int[]> ruleRanges = new ArrayList<>();
                rule.collectMatchRangesInText(rawStr, allowPartialAnd, ruleRanges);
                if (!ruleRanges.isEmpty()) {
                    matchRanges.addAll(ruleRanges);
                    if (matchedWord == null) {
                        int[] first = ruleRanges.get(0);
                        matchedWord = rawStr.substring(first[0], first[1]);
                        matchedRuleDisplay = rule.displayRule;
                    }
                    break;
                }
            }

            if (matchRanges.isEmpty() || matchedWord == null || matchedRuleDisplay == null) {
                return original;
            }

            if (recorded == null) {
                recordMatchLog(Source.HOME, matchedWord, cleaned, matchedRuleDisplay, null, true);
            }

            SpannableStringBuilder builder = new SpannableStringBuilder(original);
            for (int i = 0, size = matchRanges.size(); i < size; i++) {
                int[] range = matchRanges.get(i);
                int start = Math.max(0, Math.min(range[0], builder.length()));
                int end = Math.max(start, Math.min(range[1], builder.length()));
                if (end > start) {
                    builder.setSpan(new BackgroundColorSpan(0xFFD32F2F), start, end,
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    builder.setSpan(new ForegroundColorSpan(0xFFFFFFFF), start, end,
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    builder.setSpan(new StyleSpan(Typeface.BOLD), start, end,
                            Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }

            String compName = contextInterface != null
                    ? extractRootComponentName(contextInterface.patch_getPathBuilder())
                    : "";
            builder.setSpan(new DebugRuleSpan(matchedWord, cleaned, matchedRuleDisplay, compName),
                    0, builder.length(), Spanned.SPAN_INCLUSIVE_INCLUSIVE);
            return new SpannableString(builder);
        } catch (Exception ex) {
            Logger.printException(() -> "EnhancedKeywordContentFilter.onLithoTextLoaded failure", ex);
        }
        return original;
    }

    private boolean isContextFilterableForDebug(@Nullable ContextInterface contextInterface) {
        if (contextInterface == null) {
            return false;
        }
        StringBuilder pathBuilder = contextInterface.patch_getPathBuilder();
        if (pathBuilder == null || pathBuilder.length() == 0) {
            return false;
        }
        String path = pathBuilder.toString();
        if (path.contains("overflow_button.e")
                || path.contains("button.e")
                || path.contains("badge.e")
                || path.contains("avatar.e")
                || path.contains("thumbnail.e")) {
            return false;
        }
        if (path.contains(COMMENT_THREAD_PATH) || path.contains("|comment.e")) {
            return KeywordFilterSettings.HIDE_KEYWORD_CONTENT_COMMENTS.get();
        }
        for (CharSequence prefix : startsWithFilter.filters) {
            if (path.startsWith(prefix.toString())) {
                return isActiveForFeedContext(contextInterface);
            }
        }
        for (CharSequence sub : containsFilter.filters) {
            if (path.contains(sub)) {
                return isActiveForFeedContext(contextInterface);
            }
        }
        return false;
    }

    @Nullable
    private static DebugRuleSpan getDebugRuleSpan(@Nullable CharSequence text) {
        if (text instanceof Spanned spanned) {
            DebugRuleSpan[] spans = spanned.getSpans(0, spanned.length(), DebugRuleSpan.class);
            if (spans != null && spans.length > 0) {
                return spans[0];
            }
        }
        return null;
    }

    /**
     * Injection point called at the end of {@code com.facebook.litho.ComponentHost.onLayout}.
     * Ensures subtitle banner spans & timestamp touch handling are active on description hosts,
     * and dims matched cards in Debug Mode.
     */
    public static void onComponentHostLayout(ComponentHost host) {
        if (host == null) {
            return;
        }
        try {
            if (KeywordFilterSettings.HIDE_KEYWORD_CONTENT_CHECK_SUBTITLES.get()) {
                attachBannerTouchHandlerIfNeeded(host);
            }
            if (!KeywordFilterSettings.HIDE_KEYWORD_CONTENT_DEBUG.get() && debugOverlays.isEmpty()) {
                return;
            }
            ComponentHost root = findRootHost(host);
            if (root == null) {
                return;
            }
            pendingHostsToUpdate.put(root, Boolean.TRUE);
            if (!hostsUpdateScheduled) {
                hostsUpdateScheduled = true;
                Utils.runOnMainThread(updateDebugHostsRunnable);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "EnhancedKeywordContentFilter.onComponentHostLayout failure", ex);
        }
    }

    @SuppressLint("ClickableViewAccessibility")
    private static void attachBannerTouchHandlerIfNeeded(ComponentHost host) {
        TextContent tc = host.getTextContent();
        Spannable bannerSpannable = null;
        if (tc != null) {
            for (CharSequence item : tc.getTextItems()) {
                if (item instanceof Spannable sp && item.toString().contains(SUBTITLE_BANNER_START_MARKER)) {
                    bannerSpannable = sp;
                    break;
                }
            }
        }
        if (bannerSpannable == null) {
            if (touchHookedBannerHosts.remove(host) != null) {
                host.setOnTouchListener(null);
            }
            return;
        }
        if (touchHookedBannerHosts.containsKey(host)) {
            return;
        }
        touchHookedBannerHosts.put(host, Boolean.TRUE);

        host.setOnTouchListener(new View.OnTouchListener() {
            @Nullable
            private SubtitleTimestampClickableSpan pressedSpan;

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                try {
                    int action = event.getActionMasked();
                    if (action == MotionEvent.ACTION_DOWN) {
                        pressedSpan = findTappedTimestampSpan(host, event.getX(), event.getY());
                        if (pressedSpan != null) {
                            if (host.getParent() != null) {
                                host.getParent().requestDisallowInterceptTouchEvent(true);
                            }
                            return true;
                        }
                        return false;
                    }
                    if (pressedSpan != null) {
                        if (action == MotionEvent.ACTION_UP) {
                            SubtitleTimestampClickableSpan hit =
                                    findTappedTimestampSpan(host, event.getX(), event.getY());
                            SubtitleTimestampClickableSpan toTrigger = hit != null ? hit : pressedSpan;
                            pressedSpan = null;
                            toTrigger.onClick(host);
                        } else if (action == MotionEvent.ACTION_CANCEL) {
                            pressedSpan = null;
                        }
                        return true;
                    }
                } catch (Exception ignored) {
                    pressedSpan = null;
                }
                return false;
            }
        });
    }

    @Nullable
    private static SubtitleTimestampClickableSpan findTappedTimestampSpan(ComponentHost host,
                                                                          float touchX, float touchY) {
        List<Drawable> drawables = new ArrayList<>();
        try {
            findMountedTextDrawables(host, drawables);
        } catch (Exception ignored) {
        }
        for (int i = 0, size = drawables.size(); i < size; i++) {
            Drawable d = drawables.get(i);
            if (!(d instanceof TextContent tc)) continue;
            Spanned targetSpanned = null;
            for (CharSequence item : tc.getTextItems()) {
                if (item instanceof Spanned sp && item.toString().contains(SUBTITLE_BANNER_START_MARKER)) {
                    targetSpanned = sp;
                    break;
                }
            }
            if (targetSpanned == null) continue;

            Layout layout = extractLayoutFromTextDrawable(d);
            if (layout == null) continue;

            Rect bounds = d.getBounds();
            int localX = Math.round(touchX) - bounds.left;
            int localY = Math.round(touchY) - bounds.top;
            if (localY < 0 || localY > layout.getHeight() || localX < 0 || localX > layout.getWidth()) {
                continue;
            }
            int line = layout.getLineForVertical(localY);
            int lineStart = layout.getLineStart(line);
            int lineEnd = layout.getLineEnd(line);
            SubtitleTimestampClickableSpan[] lineSpans =
                    targetSpanned.getSpans(lineStart, lineEnd, SubtitleTimestampClickableSpan.class);
            if (lineSpans != null && lineSpans.length > 0) {
                for (SubtitleTimestampClickableSpan candidate : lineSpans) {
                    int sStart = targetSpanned.getSpanStart(candidate);
                    float xLeft = layout.getPrimaryHorizontal(sStart);
                    float pillW = Dim.dp(52);
                    SubtitleTimestampPillSpan[] pills =
                            targetSpanned.getSpans(sStart, targetSpanned.getSpanEnd(candidate), SubtitleTimestampPillSpan.class);
                    if (pills != null && pills.length > 0 && pills[0].lastMeasuredPillWidth > 0) {
                        pillW = pills[0].lastMeasuredPillWidth;
                    }
                    if (localX >= xLeft - Dim.dp(4) && localX <= xLeft + pillW + Dim.dp(4)) {
                        return candidate;
                    }
                }
            }
        }
        return null;
    }

    @Nullable
    private static Layout extractLayoutFromTextDrawable(Drawable drawable) {
        try {
            for (Class<?> type = drawable.getClass();
                 type != null && !type.getName().startsWith("android.");
                 type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    if (Layout.class.isAssignableFrom(field.getType())) {
                        field.setAccessible(true);
                        Object val = field.get(drawable);
                        if (val instanceof Layout layout) {
                            return layout;
                        }
                    }
                }
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    private static void findMountedTextDrawables(ComponentHost host, List<Drawable> out) throws Exception {
        Set<Object> visited = Collections.newSetFromMap(new IdentityHashMap<>());
        List<Object> level = new ArrayList<>();
        addInstanceFieldValues(host, ComponentHost.class, level);

        for (int depth = 1; depth <= 4 && !level.isEmpty(); depth++) {
            List<Object> next = new ArrayList<>();
            for (Object obj : level) {
                if (obj == null || obj instanceof View || obj instanceof Context
                        || obj instanceof CharSequence || obj instanceof Number
                        || obj instanceof Class || !visited.add(obj)) {
                    continue;
                }
                if (visited.size() > 600) return;
                if (obj instanceof Drawable drawable) {
                    if (drawable instanceof TextContent && drawable.getCallback() == host
                            && !out.contains(drawable)) {
                        out.add(drawable);
                    }
                } else if (obj instanceof Object[] arr) {
                    next.addAll(Arrays.asList(arr));
                } else if (obj instanceof Iterable<?> it) {
                    for (Object item : it) next.add(item);
                } else if (obj instanceof SparseArray<?> sa) {
                    for (int i = 0, s = sa.size(); i < s; i++) next.add(sa.valueAt(i));
                } else if (!obj.getClass().isArray()) {
                    for (Class<?> t = obj.getClass();
                         t != null && !t.getName().startsWith("java.") && !t.getName().startsWith("android.");
                         t = t.getSuperclass()) {
                        addInstanceFieldValues(obj, t, next);
                    }
                }
            }
            level = next;
        }
    }

    private static void addInstanceFieldValues(Object object, Class<?> type, List<Object> values) throws Exception {
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) {
                continue;
            }
            field.setAccessible(true);
            values.add(field.get(object));
        }
    }

    private static final Runnable updateDebugHostsRunnable = () -> {
        hostsUpdateScheduled = false;
        try {
            ComponentHost[] roots = pendingHostsToUpdate.keySet().toArray(new ComponentHost[0]);
            pendingHostsToUpdate.clear();

            final boolean debugEnabled = KeywordFilterSettings.HIDE_KEYWORD_CONTENT_DEBUG.get();
            for (ComponentHost root : roots) {
                if (root == null) continue;
                if (!debugEnabled) {
                    detachDebugOverlay(root);
                    continue;
                }
                if (!root.isAttachedToWindow() || root.getParent() instanceof ComponentHost) {
                    continue;
                }
                if (hasHorizontalScrollingChild(root) || isHostInDialog(root)) {
                    detachDebugOverlay(root);
                    continue;
                }

                DebugRuleSpan matchedSpan = findDebugSpanInViewTree(root);
                if (matchedSpan != null) {
                    DebugCardOverlay overlay = debugOverlays.get(root);
                    if (overlay == null) {
                        overlay = new DebugCardOverlay(root);
                        debugOverlays.put(root, overlay);
                    }
                    overlay.bind(root, matchedSpan);
                } else {
                    detachDebugOverlay(root);
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "updateDebugHostsRunnable failure", ex);
        }
    };

    private static void detachDebugOverlay(ComponentHost root) {
        DebugCardOverlay existing = debugOverlays.remove(root);
        if (existing != null) {
            existing.detach(root);
        }
    }

    @Nullable
    private static DebugRuleSpan findDebugSpanInViewTree(View view) {
        if (view instanceof ComponentHost host) {
            TextContent textContent = host.getTextContent();
            if (textContent != null) {
                for (CharSequence item : textContent.getTextItems()) {
                    DebugRuleSpan span = getDebugRuleSpan(item);
                    if (span != null) {
                        return span;
                    }
                }
            }
        } else if (view instanceof TextView textView) {
            DebugRuleSpan span = getDebugRuleSpan(textView.getText());
            if (span != null) {
                return span;
            }
        }

        if (view instanceof ViewGroup group) {
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() == View.VISIBLE && !isHorizontalScrollingView(child)) {
                    DebugRuleSpan found = findDebugSpanInViewTree(child);
                    if (found != null) {
                        return found;
                    }
                }
            }
        }
        return null;
    }

    @Nullable
    private static ComponentHost findRootHost(ComponentHost host) {
        ComponentHost root = host;
        ViewParent parent = host.getParent();
        while (parent instanceof ComponentHost parentHost) {
            root = parentHost;
            parent = parentHost.getParent();
        }
        return root;
    }

    private static boolean isHorizontalScrollingView(View view) {
        if (view instanceof ComponentHost) {
            return false;
        }
        String name = view.getClass().getName();
        return name.contains("RecyclerView")
                || name.contains("HorizontalScrollView")
                || name.contains("ViewPager")
                || view.canScrollHorizontally(1)
                || view.canScrollHorizontally(-1);
    }

    private static boolean hasHorizontalScrollingChild(ViewGroup group) {
        for (int i = 0, count = group.getChildCount(); i < count; i++) {
            View child = group.getChildAt(i);
            if (isHorizontalScrollingView(child)
                    || (child instanceof ViewGroup childGroup && hasHorizontalScrollingChild(childGroup))) {
                return true;
            }
        }
        return false;
    }

    private static boolean isHostInDialog(ComponentHost host) {
        Context context = host.getContext();
        while (context instanceof ContextWrapper wrapper && !(context instanceof Activity)) {
            context = wrapper.getBaseContext();
        }
        if (context instanceof Activity activity && activity.getWindow() != null) {
            View decorView = activity.getWindow().peekDecorView();
            if (decorView != null && host.getRootView() != decorView) {
                return true;
            }
        }
        return false;
    }

    /**
     * Drawable attached to {@link ComponentHost#getOverlay()} in Debug Mode.
     * Dims the matched card with a clean semi-transparent scrim and subtle border.
     */
    private static final class DebugCardOverlay extends Drawable {
        private static final int BORDER_COLOR = 0x99EF5350;

        private final Paint scrimPaint = new Paint();
        private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint badgeBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint badgeTextPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final RectF cardRect = new RectF();
        private final RectF badgeRect = new RectF();
        private final float density;
        private boolean added;
        private String badgeLabel = "";

        DebugCardOverlay(ComponentHost host) {
            density = host.getResources().getDisplayMetrics().density;
            borderPaint.setColor(BORDER_COLOR);
            borderPaint.setStyle(Paint.Style.STROKE);
            borderPaint.setStrokeWidth(1.5f * density);
            badgeBgPaint.setColor(0xD91E1E1E);
            badgeBgPaint.setStyle(Paint.Style.FILL);
            badgeTextPaint.setColor(0xFFFF8A80);
            badgeTextPaint.setTextSize(10.5f * density);
            badgeTextPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        }

        void bind(ComponentHost host, @Nullable DebugRuleSpan span) {
            setBounds(0, 0, host.getWidth(), host.getHeight());
            if (span != null) {
                String comp = span.componentName() != null && !span.componentName().isEmpty()
                        ? span.componentName() + " · "
                        : "";
                badgeLabel = comp + "«" + span.matchedWord() + "»";
            }
            if (!added) {
                host.getOverlay().add(this);
                added = true;
            }
            invalidateSelf();
        }

        void detach(ComponentHost host) {
            if (added) {
                host.getOverlay().remove(this);
                added = false;
            }
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.isEmpty()) return;

            int appBg = ThemeUtils.getAppBackgroundColor() & 0x00FFFFFF;
            scrimPaint.setColor(appBg | 0x9E000000);
            cardRect.set(bounds);
            canvas.drawRect(cardRect, scrimPaint);

            float strokeInset = borderPaint.getStrokeWidth() / 2f;
            cardRect.inset(strokeInset, strokeInset);
            float cornerRadius = 8f * density;
            canvas.drawRoundRect(cardRect, cornerRadius, cornerRadius, borderPaint);

            if (!badgeLabel.isEmpty()) {
                float padH = 6f * density;
                float padV = 3f * density;
                float textW = badgeTextPaint.measureText(badgeLabel);
                Paint.FontMetrics fm = badgeTextPaint.getFontMetrics();
                float textH = fm.descent - fm.ascent;
                float left = bounds.left + 8f * density;
                float top = bounds.top + 8f * density;
                badgeRect.set(left, top, Math.min(bounds.right - 8f * density, left + textW + padH * 2), top + textH + padV * 2);
                canvas.drawRoundRect(badgeRect, 4f * density, 4f * density, badgeBgPaint);
                canvas.drawRoundRect(badgeRect, 4f * density, 4f * density, borderPaint);
                canvas.drawText(badgeLabel, left + padH, top + padV - fm.ascent, badgeTextPaint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter colorFilter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // endregion

    @Override
    protected void onBroadFilterDetected(@Nullable String matched) {
        Utils.showSnackbarLong(str("morphe_hide_keyword_toast_invalid_broad", matched));
    }

    private void recordHide(Source source, @Nullable String extractedVideoId, @Nullable String fallbackText) {
        String videoId = source == Source.COMMENTS
                ? (VideoInformation.getVideoId().isEmpty() ? null : VideoInformation.getVideoId())
                : extractedVideoId;
        if (videoId == null || videoId.isEmpty()) {
            if (fallbackText == null || fallbackText.isEmpty()) return;
            videoId = "h_" + Integer.toHexString(fallbackText.hashCode());
        }

        if (sharedTracker.recordHide(videoId, source, System.currentTimeMillis())) {
            LongSetting counter = allTimeCounterFor(source);
            if (counter != null) counter.save(counter.get() + 1);
        }
    }

    private Source detectSource(StringFilterGroup matchedGroup, ContextInterface contextInterface) {
        if (matchedGroup == commentsFilter || matchedGroup == commentRepliesFilter) return Source.COMMENTS;
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return Source.HOME;
        if (NavigationBar.isSearchBarActive()) return Source.SEARCH;
        NavigationBar.NavigationButton nav = NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface);
        return nav == NavigationBar.NavigationButton.SUBSCRIPTIONS ? Source.SUBSCRIPTIONS : Source.HOME;
    }

    private static LongSetting allTimeCounterFor(Source source) {
        return switch (source) {
            case HOME -> KeywordFilterSettings.KEYWORD_HIDE_COUNT_HOME;
            case SUBSCRIPTIONS -> KeywordFilterSettings.KEYWORD_HIDE_COUNT_SUBSCRIPTIONS;
            case SEARCH -> KeywordFilterSettings.KEYWORD_HIDE_COUNT_SEARCH;
            case COMMENTS -> KeywordFilterSettings.KEYWORD_HIDE_COUNT_COMMENTS;
        };
    }

    public static int hidesInLast24Hours() {
        return sharedTracker.totalSize(System.currentTimeMillis());
    }

    public static int hidesInLast24Hours(Source source) {
        return sharedTracker.sourceSize(source, System.currentTimeMillis());
    }

    public static void resetHidesTracker() {
        sharedTracker.reset();
    }

    private static final BufferHideStatsTracker sharedTracker =
            new BufferHideStatsTracker(KeywordFilterSettings.KEYWORD_HIDES_24H);
}
