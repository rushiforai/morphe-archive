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
    protected boolean isActiveForFeedContext() {
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

        NavigationBar.NavigationButton selectedNavButton = NavigationBar.NavigationButton.getSelectedNavigationButton();
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
    protected String matchBuffer(byte[] buffer, StringFilterGroup matchedGroup) {
        ByteTrieSearch search = bufferSearch;
        if (search == null) return null;
        MutableReference<String> matchRef = new MutableReference<>();
        if (!search.matches(buffer, matchRef)) return null;
        recordHide(matchedGroup, buffer);
        return matchRef.value;
    }

    @Override
    protected void onBroadFilterDetected(@Nullable String matched) {
        Utils.showToastLong(str("morphe_channel_blacklist_toast_invalid_broad", matched));
    }

    private void recordHide(StringFilterGroup matchedGroup, byte[] buffer) {
        Source source = detectSource(matchedGroup);
        String videoId = getVideoIdForSource(source, buffer);
        if (videoId == null) return;

        if (sharedTracker.recordHide(videoId, source, System.currentTimeMillis())) {
            LongSetting counter = allTimeCounterFor(source);
            if (counter != null) counter.save(counter.get() + 1);
        }
    }

    private Source detectSource(StringFilterGroup matchedGroup) {
        if (matchedGroup == commentsFilter) return Source.COMMENTS;
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return Source.HOME;
        if (NavigationBar.isSearchBarActive()) return Source.SEARCH;
        NavigationBar.NavigationButton nav = NavigationBar.NavigationButton.getSelectedNavigationButton();
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
}
