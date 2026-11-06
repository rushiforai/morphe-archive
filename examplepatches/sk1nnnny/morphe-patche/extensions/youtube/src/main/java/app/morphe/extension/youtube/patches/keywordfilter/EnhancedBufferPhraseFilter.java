package app.morphe.extension.youtube.patches.keywordfilter;

import static java.lang.Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS;
import static java.lang.Character.UnicodeBlock.HIRAGANA;
import static java.lang.Character.UnicodeBlock.KATAKANA;
import static java.lang.Character.UnicodeBlock.KHMER;
import static java.lang.Character.UnicodeBlock.LAO;
import static java.lang.Character.UnicodeBlock.MYANMAR;
import static java.lang.Character.UnicodeBlock.THAI;
import static java.lang.Character.UnicodeBlock.TIBETAN;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.StringTrieSearch;
import app.morphe.extension.shared.patches.components.BufferAsciiStrings;
import app.morphe.extension.shared.patches.components.BufferPhraseFilter.Source;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;

/**
 * Enhanced base for Litho filters that scan protocol buffers for phrase matches
 * inside feed/search/channel video cards. Includes modern {@code lockup.e} support
 * and accurate Unicode whole-word boundaries.
 */
@SuppressWarnings("unused")
public abstract class EnhancedBufferPhraseFilter extends Filter {

    public static final String[] STRINGS_IN_EVERY_BUFFER = {
            "googlevideo.com/initplayback?source=youtube",
            "ANDROID",
            "https://i.ytimg.com/vi/",
            "mqdefault.jpg",
            "hqdefault.jpg",
            "sddefault.jpg",
            "hq720.jpg",
            "webp",
            "_custom_",
            "OMX.ffmpeg.vp9.decoder",
            "OMX.Intel.sw_vd.vp9",
            "OMX.MTK.VIDEO.DECODER.SW.VP9",
            "OMX.google.vp9.decoder",
            "OMX.google.av1.decoder",
            "OMX.sprd.av1.decoder",
            "c2.android.av1.decoder",
            "c2.android.av1-dav1d.decoder",
            "c2.android.vp9.decoder",
            "c2.mtk.sw.vp9.decoder",
            "searchR",
            "browse-feed",
            "FEwhat_to_watch",
            "FEsubscriptions",
            "search_vwc_description_transition_key",
            "g-high-recZ",
            "expandable_metadata.e",
            "thumbnail.e",
            "avatar.e",
            "overflow_button.e",
            "shorts-lockup-image",
            "shorts-lockup.overlay-metadata.secondary-text",
            "YouTubeSans-SemiBold",
            "sans-serif"
    };

    private static final float ALL_VIDEOS_FILTERED_THRESHOLD = 0.95f;
    private static final float ALL_VIDEOS_FILTERED_SAMPLE_SIZE = 50;
    private static final long ALL_VIDEOS_FILTERED_BACKOFF_MILLISECONDS = 60 * 1000;
    private static final int UTF8_MAX_BYTE_COUNT = 4;

    protected final StringFilterGroup startsWithFilter = new StringFilterGroup(
            null,
            "home_video_with_context.e",
            "search_video_with_context.e",
            "video_with_context.e",
            "related_video_with_context.e",
            "video_lockup_with_attachment.e",
            "lockup.e",
            "grid_video_wrapper.e",
            "compact_video.e",
            "cell_video.e",
            "channel_video_player.e",
            "video_card.e",
            "inline_shorts",
            "shorts_video_cell",
            "shorts_pivot_item.e"
    );

    @SuppressWarnings("FieldCanBeLocal")
    protected final StringFilterGroup containsFilter = new StringFilterGroup(
            null,
            "modern_type_shelf_header_content.e",
            "shorts_lockup_cell.e",
            "video_card.e",
            "compact_video.e",
            "cell_video.e",
            "grid_video_wrapper.e"
    );

    private final StringTrieSearch exceptions = new StringTrieSearch(
            "metadata.e",
            "expandable_metadata",
            "inline_expander",
            "thumbnail.e",
            "avatar.e",
            "overflow_button.e"
    );

    private volatile float filteredVideosPercentage;
    private volatile long timeToResumeFiltering;

    protected EnhancedBufferPhraseFilter(StringFilterGroup... extraPathCallbacks) {
        StringFilterGroup[] all = new StringFilterGroup[2 + extraPathCallbacks.length];
        all[0] = startsWithFilter;
        all[1] = containsFilter;
        System.arraycopy(extraPathCallbacks, 0, all, 2, extraPathCallbacks.length);
        addPathCallbacks(all);
    }

    protected abstract void reparseIfNeeded();

    protected abstract boolean isActiveForFeedContext(ContextInterface contextInterface);

    @Nullable
    protected abstract String matchBuffer(byte[] buffer, StringFilterGroup matchedGroup,
                                          ContextInterface contextInterface);

    @Nullable
    protected String matchBuffer(byte[] buffer, String accessibility, CharSequence path,
                                 StringFilterGroup matchedGroup, ContextInterface contextInterface) {
        return matchBuffer(buffer, matchedGroup, contextInterface);
    }

    protected boolean isDebugModeEnabled() {
        return false;
    }

    protected void onDebugMatch(String matched, byte[] buffer, String accessibility,
                                CharSequence path, StringFilterGroup matchedGroup,
                                ContextInterface contextInterface) {
    }

    protected void onHideConfirmed(String matched) {
    }

    @Override
    public final boolean isFiltered(ContextInterface contextInterface,
                                    String identifier,
                                    String accessibility,
                                    CharSequence path,
                                    byte[] buffer,
                                    BufferAsciiStrings asciiStrings,
                                    StringFilterGroup matchedGroup,
                                    FilterContentType contentType,
                                    int contentIndex) {
        if (contentIndex != 0 && matchedGroup == startsWithFilter) {
            return false;
        }

        reparseIfNeeded();

        if (isBaseFeedGroup(matchedGroup) && !isActiveForFeedContextGuarded(contextInterface)) {
            return false;
        }

        if (exceptions.matches(path)) {
            return false;
        }

        String matched = matchBuffer(buffer, accessibility, path, matchedGroup, contextInterface);
        if (matched != null) {
            if (isDebugModeEnabled()) {
                onDebugMatch(matched, buffer, accessibility, path, matchedGroup, contextInterface);
                return false;
            }
            if (isBaseFeedGroup(matchedGroup)) {
                updateStats(true, matched);
            }
            onHideConfirmed(matched);
            return true;
        }

        if (!isDebugModeEnabled() && isBaseFeedGroup(matchedGroup)) {
            updateStats(false, null);
        }
        return false;
    }

    private boolean isBaseFeedGroup(StringFilterGroup group) {
        return group == startsWithFilter || group == containsFilter;
    }

    private boolean isActiveForFeedContextGuarded(ContextInterface contextInterface) {
        if (timeToResumeFiltering != 0) {
            if (System.currentTimeMillis() < timeToResumeFiltering) {
                return false;
            }
            timeToResumeFiltering = 0;
            filteredVideosPercentage = 0;
            Logger.printDebug(() -> "Resuming filtering: " + getClass().getSimpleName());
        }
        return isActiveForFeedContext(contextInterface);
    }

    private void updateStats(boolean videoWasHidden, @Nullable String matched) {
        float updatedAverage = filteredVideosPercentage
                * ((ALL_VIDEOS_FILTERED_SAMPLE_SIZE - 1) / ALL_VIDEOS_FILTERED_SAMPLE_SIZE);
        if (videoWasHidden) {
            updatedAverage += 1 / ALL_VIDEOS_FILTERED_SAMPLE_SIZE;
        }

        if (updatedAverage <= ALL_VIDEOS_FILTERED_THRESHOLD) {
            filteredVideosPercentage = updatedAverage;
            return;
        }

        timeToResumeFiltering = System.currentTimeMillis() + ALL_VIDEOS_FILTERED_BACKOFF_MILLISECONDS;
        Logger.printDebug(() -> "Temporarily turning off filtering due to excessively broad match: " + matched);
        onBroadFilterDetected(matched);
    }

    protected void onBroadFilterDetected(@Nullable String matched) {
    }

    public static boolean isLanguageWithNoSpaces(String text) {
        for (int i = 0, length = text.length(); i < length;) {
            final int codePoint = text.codePointAt(i);
            Character.UnicodeBlock block = Character.UnicodeBlock.of(codePoint);
            if (block == CJK_UNIFIED_IDEOGRAPHS
                    || block == HIRAGANA
                    || block == KATAKANA
                    || block == THAI
                    || block == LAO
                    || block == MYANMAR
                    || block == KHMER
                    || block == TIBETAN) {
                return true;
            }
            i += Character.charCount(codePoint);
        }
        return false;
    }

    public static boolean phrasesWillHideAllVideos(String[] phrases, boolean matchWholeWords) {
        for (String phrase : phrases) {
            if (phrase == null || phrase.isEmpty()) continue;
            for (String commonString : STRINGS_IN_EVERY_BUFFER) {
                if (matchWholeWords) {
                    int matchIndex = 0;
                    while (true) {
                        matchIndex = commonString.indexOf(phrase, matchIndex);
                        if (matchIndex < 0) break;
                        if (keywordMatchIsWholeWord(commonString, matchIndex, phrase.length())) {
                            return true;
                        }
                        matchIndex++;
                    }
                } else if (commonString.contains(phrase)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isWordCodePoint(int codePoint) {
        if (Character.isLetterOrDigit(codePoint) || codePoint == '_') {
            return true;
        }
        final int type = Character.getType(codePoint);
        return type == Character.NON_SPACING_MARK
                || type == Character.COMBINING_SPACING_MARK
                || type == Character.ENCLOSING_MARK;
    }

    public static boolean keywordMatchIsWholeWord(String text, int keywordStartCharIndex, int keywordCharLength) {
        if (keywordStartCharIndex > 0) {
            final int codePointBefore = Character.codePointBefore(text, keywordStartCharIndex);
            if (isWordCodePoint(codePointBefore)) {
                return false;
            }
        }
        final int endIndex = keywordStartCharIndex + keywordCharLength;
        if (endIndex < text.length()) {
            final int codePointAfter = Character.codePointAt(text, endIndex);
            if (isWordCodePoint(codePointAfter)) {
                return false;
            }
        }
        return true;
    }

    private static final int VIDEO_ID_LENGTH = 11;
    private static final byte[] THUMBNAIL_URL_PREFIX =
            ".ytimg.com/vi/".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] THUMBNAIL_WEBP_URL_PREFIX =
            ".ytimg.com/vi_webp/".getBytes(StandardCharsets.US_ASCII);

    @Nullable
    public static String extractVideoIdFromBuffer(byte[] buffer) {
        String id = extractVideoIdWithPrefix(buffer, THUMBNAIL_URL_PREFIX);
        if (id != null) {
            return id;
        }
        return extractVideoIdWithPrefix(buffer, THUMBNAIL_WEBP_URL_PREFIX);
    }

    @Nullable
    private static String extractVideoIdWithPrefix(byte[] buffer, byte[] prefix) {
        final int prefixLen = prefix.length;
        outer:
        for (int i = 0, max = buffer.length - prefixLen - VIDEO_ID_LENGTH; i <= max; i++) {
            for (int j = 0; j < prefixLen; j++) {
                if (buffer[i + j] != prefix[j]) continue outer;
            }
            int start = i + prefixLen;
            for (int k = 0; k < VIDEO_ID_LENGTH; k++) {
                if (!isVideoIdChar(buffer[start + k])) continue outer;
            }
            return new String(buffer, start, VIDEO_ID_LENGTH, StandardCharsets.US_ASCII);
        }
        return null;
    }

    private static boolean isVideoIdChar(byte b) {
        return (b >= 'A' && b <= 'Z')
                || (b >= 'a' && b <= 'z')
                || (b >= '0' && b <= '9')
                || b == '-' || b == '_';
    }
}
