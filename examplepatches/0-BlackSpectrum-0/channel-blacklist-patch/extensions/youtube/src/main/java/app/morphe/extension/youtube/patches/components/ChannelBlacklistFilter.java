/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.youtube.patches.components;

import static app.morphe.extension.shared.StringRef.str;

import androidx.annotation.Nullable;

import java.nio.charset.StandardCharsets;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.shared.ByteTrieSearch;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.TrieSearch;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.patches.components.BufferHideStatsTracker;
import app.morphe.extension.shared.patches.components.BufferPhraseFilter;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.settings.LongSetting;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * Allows hiding home feed, subscriptions, search results, and comments based on blacklisted channel names.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class ChannelBlacklistFilter extends BufferPhraseFilter {

    private final StringFilterGroup commentsFilter = new StringFilterGroup(
            Settings.HIDE_CHANNEL_BLACKLIST_COMMENTS,
            "comment_thread.eml"
    );

    /**
     * The last value of {@link Settings#HIDE_CHANNEL_BLACKLIST_CHANNELS}
     * parsed and loaded into {@link #bufferSearch}.
     */
    private volatile String lastChannelsParsed;

    private volatile ByteTrieSearch bufferSearch;

    public static synchronized boolean isChannelBlacklisted(String channelName) {
        if (channelName == null || channelName.isBlank()) return false;
        String cleanName = channelName.trim();
        String raw = Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.get();
        for (String line : raw.split("\n")) {
            if (line.trim().equalsIgnoreCase(cleanName)) {
                return true;
            }
        }
        return false;
    }

    public static synchronized void addChannel(String channelName) {
        if (channelName == null || channelName.isBlank()) return;
        String cleanName = channelName.trim();
        if (isChannelBlacklisted(cleanName)) return;
        String raw = Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.get();
        String updated;
        if (raw.isBlank()) {
            updated = cleanName;
        } else {
            updated = raw.stripTrailing() + "\n" + cleanName;
        }
        Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.save(updated);
    }

    public static synchronized void removeChannel(String channelName) {
        if (channelName == null || channelName.isBlank()) return;
        String cleanName = channelName.trim();
        String raw = Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.get();
        StringBuilder sb = new StringBuilder();
        for (String line : raw.split("\n")) {
            String trimmed = line.trim();
            if (!trimmed.isEmpty() && !trimmed.equalsIgnoreCase(cleanName)) {
                if (sb.length() > 0) sb.append("\n");
                sb.append(trimmed);
            }
        }
        Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.save(sb.toString());
    }

    private synchronized void parseChannels() { // Must be synchronized since Litho is multithreaded.
        String rawChannels = Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.get();

        //noinspection StringEquality
        if (rawChannels == lastChannelsParsed) {
            Logger.printDebug(() -> "Using previously initialized channel blacklist search");
            return;
        }

        ByteTrieSearch search = new ByteTrieSearch();
        String[] split = rawChannels.split("\n");
        if (split.length != 0) {
            Set<String> channels = new LinkedHashSet<>(10 * split.length);

            for (String channel : split) {
                channel = channel.stripTrailing().trim();
                if (channel.isBlank()) continue;

                Locale defaultLocale = Locale.getDefault();
                String[] channelVariations = {
                        channel,
                        channel.toLowerCase(Locale.ROOT),
                        channel.toLowerCase(defaultLocale),
                        titleCaseFirstWordOnly(channel),
                        capitalizeAllFirstLetters(channel),
                        channel.toUpperCase(Locale.ROOT),
                        channel.toUpperCase(defaultLocale)
                };

                if (phrasesWillHideAllVideos(channelVariations, false)) {
                    Utils.showToastLong(str("morphe_channel_blacklist_toast_invalid_broad", channel));
                    continue;
                }

                for (String variation : channelVariations) {
                    channels.add(variation);
                }
            }

            for (String channelName : channels) {
                TrieSearch.TriePatternMatchedCallback<byte[]> callback =
                        (textSearched, startIndex, matchLength, callbackParameter) -> {
                            if (!keywordMatchIsWholeWord(textSearched, startIndex, matchLength)) {
                                return false;
                            }

                            Logger.printDebug(() -> "Matched blacklisted channel: '" + channelName + "'");
                            ((MutableReference<String>) callbackParameter).value = channelName;
                            return true;
                        };
                byte[] stringBytes = channelName.getBytes(StandardCharsets.UTF_8);
                search.addPattern(stringBytes, callback);
            }

            Logger.printDebug(() -> "Channel blacklist search using: (" + search.getEstimatedMemorySize() + " KB) channels: " + channels);
        }

        bufferSearch = search;
        lastChannelsParsed = rawChannels;
    }

    public ChannelBlacklistFilter() {
        super();
        addPathCallbacks(commentsFilter);
    }

    @Override
    protected void reparseIfNeeded() {
        // Field is intentionally compared using reference equality.
        //noinspection StringEquality
        if (Settings.HIDE_CHANNEL_BLACKLIST_CHANNELS.get() != lastChannelsParsed) {
            parseChannels();
        }
    }

    @Override
    protected boolean isActiveForFeedContext(ContextInterface contextInterface) {
        // Must check player type first, as search bar can be active behind the player.
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) {
            return Settings.HIDE_CHANNEL_BLACKLIST_HOME.get();
        }

        // Must check second, as search can be from any tab.
        if (NavigationBar.isSearchBarActive()) {
            return Settings.HIDE_CHANNEL_BLACKLIST_SEARCH.get();
        }

        // Avoid checking navigation button status if all other settings are off.
        final boolean hideHome = Settings.HIDE_CHANNEL_BLACKLIST_HOME.get();
        final boolean hideSubscriptions = Settings.HIDE_CHANNEL_BLACKLIST_SUBSCRIPTIONS.get();
        if (!hideHome && !hideSubscriptions) {
            return false;
        }

        NavigationBar.NavigationButton selectedNavButton =
                NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface);
        if (selectedNavButton == null) {
            return hideHome; // Unknown tab, treat the same as home.
        }

        return switch (selectedNavButton) {
            case HOME -> hideHome;
            case SUBSCRIPTIONS -> hideSubscriptions;
            default -> false;
        };
    }

    @Override
    @Nullable
    protected String matchBuffer(byte[] buffer, StringFilterGroup matchedGroup,
                                 ContextInterface contextInterface) {
        ByteTrieSearch search = bufferSearch;
        if (search == null) return null;
        MutableReference<String> matchRef = new MutableReference<>();
        if (!search.matches(buffer, matchRef)) return null;
        recordHide(matchedGroup, buffer, contextInterface);
        return matchRef.value;
    }

    @Override
    protected void onBroadFilterDetected(@Nullable String matched) {
        Utils.showToastLong(str("morphe_channel_blacklist_toast_invalid_broad", matched));
    }

    private void recordHide(StringFilterGroup matchedGroup, byte[] buffer, ContextInterface contextInterface) {
        Source source = detectSource(matchedGroup, contextInterface);
        String videoId = getVideoIdForSource(source, buffer);
        if (videoId == null) return;

        if (sharedTracker.recordHide(videoId, source, System.currentTimeMillis())) {
            LongSetting counter = allTimeCounterFor(source);
            if (counter != null) counter.save(counter.get() + 1);
        }
    }

    private Source detectSource(StringFilterGroup matchedGroup, ContextInterface contextInterface) {
        if (matchedGroup == commentsFilter) return Source.COMMENTS;
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return Source.HOME;
        if (NavigationBar.isSearchBarActive()) return Source.SEARCH;
        NavigationBar.NavigationButton nav =
                NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface);
        return nav == NavigationBar.NavigationButton.SUBSCRIPTIONS ? Source.SUBSCRIPTIONS : Source.HOME;
    }

    @Nullable
    private static String getVideoIdForSource(Source source, byte[] buffer) {
        if (source == Source.COMMENTS) {
            String id = VideoInformation.getVideoId();
            return id.isEmpty() ? null : id;
        }
        return extractVideoIdFromBuffer(buffer);
    }

    private static LongSetting allTimeCounterFor(Source source) {
        return switch (source) {
            case HOME -> Settings.CHANNEL_BLACKLIST_HIDE_COUNT_HOME;
            case SUBSCRIPTIONS -> Settings.CHANNEL_BLACKLIST_HIDE_COUNT_SUBSCRIPTIONS;
            case SEARCH -> Settings.CHANNEL_BLACKLIST_HIDE_COUNT_SEARCH;
            case COMMENTS -> Settings.CHANNEL_BLACKLIST_HIDE_COUNT_COMMENTS;
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
            new BufferHideStatsTracker(Settings.CHANNEL_BLACKLIST_HIDES_24H);
    // Helpers below were removed from BufferPhraseFilter upstream (v2.3.0-dev.7, #4530)
    // and are kept here as private copies for the channel blacklist.

    private static final int UTF8_MAX_BYTE_COUNT = 4;

    /**
     * Strings found in the buffer for every video. Full strings should be specified.
     * <p>
     * This list does not include every common buffer string, and this can be added/changed as needed.
     * Words must be entered with the exact casing as found in the buffer.
     */
    private static final String[] STRINGS_IN_EVERY_BUFFER = {
            // Video playback data.
            "googlevideo.com/initplayback?source=youtube", // Video url.
            "ANDROID", // Video url parameter.
            "https://i.ytimg.com/vi/", // Thumbnail url.
            "mqdefault.jpg",
            "hqdefault.jpg",
            "sddefault.jpg",
            "hq720.jpg",
            "webp",
            "_custom_", // Custom thumbnail set by video creator.
            // Video decoders.
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
            // Analytics.
            "searchR",
            "browse-feed",
            "FEwhat_to_watch",
            "FEsubscriptions",
            "search_vwc_description_transition_key",
            "g-high-recZ",
            // Text and litho components found in the buffer that belong to path filters.
            "expandable_metadata.e",
            "thumbnail.e",
            "avatar.e",
            "overflow_button.e",
            "shorts-lockup-image",
            "shorts-lockup.overlay-metadata.secondary-text",
            "YouTubeSans-SemiBold",
            "sans-serif"
    };

    /**
     * Change first letter of the first word to use title case.
     */
    private static String titleCaseFirstWordOnly(String sentence) {
        if (sentence.isEmpty()) {
            return sentence;
        }
        final int firstCodePoint = sentence.codePointAt(0);
        // In some non-English languages title case is different from uppercase.
        return new StringBuilder()
                .appendCodePoint(Character.toTitleCase(firstCodePoint))
                .append(sentence, Character.charCount(firstCodePoint), sentence.length())
                .toString();
    }

    /**
     * Uppercase the first letter of each word.
     */
    private static String capitalizeAllFirstLetters(String sentence) {
        if (sentence.isEmpty()) {
            return sentence;
        }

        final int delimiter = ' ';
        // Use code points and not characters to handle Unicode surrogates.
        int[] codePoints = sentence.codePoints().toArray();
        boolean capitalizeNext = true;
        for (int i = 0, length = codePoints.length; i < length; i++) {
            final int codePoint = codePoints[i];
            if (codePoint == delimiter) {
                capitalizeNext = true;
            } else if (capitalizeNext) {
                codePoints[i] = Character.toUpperCase(codePoint);
                capitalizeNext = false;
            }
        }

        return new String(codePoints, 0, codePoints.length);
    }

    /**
     * @return If any of the given phrases would match a string in {@link #STRINGS_IN_EVERY_BUFFER}
     * (which would cause the filter to hide all videos).
     */
    private static boolean phrasesWillHideAllVideos(String[] phrases, boolean matchWholeWords) {
        for (String phrase : phrases) {
            for (String commonString : STRINGS_IN_EVERY_BUFFER) {
                if (matchWholeWords) {
                    byte[] commonStringBytes = commonString.getBytes(StandardCharsets.UTF_8);
                    int matchIndex = 0;
                    while (true) {
                        matchIndex = commonString.indexOf(phrase, matchIndex);
                        if (matchIndex < 0) break;

                        if (keywordMatchIsWholeWord(commonStringBytes, matchIndex, phrase.length())) {
                            return true;
                        }

                        matchIndex++;
                    }
                } else if (Utils.containsAny(commonString, phrases)) {
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * @return If the start and end indexes are not surrounded by other letters.
     *         If the indexes are surrounded by numbers/symbols/punctuation it is considered a whole word.
     */
    private static boolean keywordMatchIsWholeWord(byte[] text, int keywordStartIndex, int keywordLength) {
        final Integer codePointBefore = getUtf8CodePointBefore(text, keywordStartIndex);
        if (codePointBefore != null && Character.isLetter(codePointBefore)) {
            return false;
        }

        final Integer codePointAfter = getUtf8CodePointAt(text, keywordStartIndex + keywordLength);
        //noinspection RedundantIfStatement
        if (codePointAfter != null && Character.isLetter(codePointAfter)) {
            return false;
        }

        return true;
    }

    /**
     * @return The UTF8 character point immediately before the index,
     *         or null if the bytes before the index is not a valid UTF8 character.
     */
    @Nullable
    private static Integer getUtf8CodePointBefore(byte[] data, int index) {
        int characterByteCount = 0;
        while (--index >= 0 && ++characterByteCount <= UTF8_MAX_BYTE_COUNT) {
            if (isValidUtf8(data, index, characterByteCount)) {
                return decodeUtf8ToCodePoint(data, index, characterByteCount);
            }
        }

        return null;
    }
}
