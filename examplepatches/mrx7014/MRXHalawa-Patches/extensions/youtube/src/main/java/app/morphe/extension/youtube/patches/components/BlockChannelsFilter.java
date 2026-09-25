/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.ByteTrieSearch;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.TrieSearch;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.patches.components.BufferPhraseFilter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Permanently hides content and channel results identified by a YouTube channel ID or handle.
 *
 * <p>One value can be entered per line in any of these forms:
 * <ul>
 *     <li>UCxxxxxxxxxxxxxxxxxxxxxx</li>
 *     <li>https://www.youtube.com/channel/UCxxxxxxxxxxxxxxxxxxxxxx</li>
 *     <li>@channel_handle</li>
 *     <li>https://www.youtube.com/@channel_handle</li>
 * </ul>
 * Stable channel IDs are preferred, but handles make the feature practical when copying a
 * channel link from the YouTube app. The ID and handle are searched in serialized YouTube
 * element buffers, including video cards and channel search-result cards.
 */
@SuppressWarnings({"unused", "unchecked"})
public final class BlockChannelsFilter extends BufferPhraseFilter {
    private static final Pattern CHANNEL_ID_PATTERN =
            Pattern.compile("UC[A-Za-z0-9_-]{22}");
    private static final Pattern HANDLE_PATTERN =
            Pattern.compile("@[A-Za-z0-9._-]{3,30}");
    private static final Pattern BARE_HANDLE_PATTERN =
            Pattern.compile("[A-Za-z0-9._-]{3,30}");
    private static final Pattern HANDLE_URL_PATTERN =
            Pattern.compile("https?://(?:www\\.)?youtube\\.com/(@[A-Za-z0-9._-]{3,30})(?:[/?#].*)?",
                    Pattern.CASE_INSENSITIVE);

    private final StringFilterGroup commentsFilter = new StringFilterGroup(
            Settings.BLOCK_CHANNELS,
            "comment_thread.eml"
    );

    /*
     * Renderer names for channel results change frequently between YouTube versions.  All
     * Litho component paths currently end in .e, so use that stable path shape instead of a
     * short allow-list of renderer names.  BufferPhraseFilter still skips metadata, thumbnails,
     * avatars, and overflow buttons through its exception list.
     */
    private final StringFilterGroup allLithoComponentsFilter = new StringFilterGroup(
            Settings.BLOCK_CHANNELS,
            ".e"
    );

    private volatile String lastChannelsParsed;
    private volatile ByteTrieSearch channelSearch;
    private volatile ByteTrieSearch handleSearch;

    /** Adds a channel ID from the channel-page menu without requiring manual settings input. */
    public static boolean addChannelId(String channelId) {
        return addChannel(channelId, null);
    }

    /** Adds the stable ID and, when available, the channel handle for broader card coverage. */
    public static boolean addChannel(String channelId, String handle) {
        if (channelId == null || !CHANNEL_ID_PATTERN.matcher(channelId).matches()) return false;

        String current = Settings.BLOCK_CHANNELS_LIST.get();
        Set<String> existing = new LinkedHashSet<>();
        for (String entry : current.split("\\R")) {
            if (!entry.trim().isEmpty()) existing.add(entry.trim());
        }

        if (existing.contains(channelId)) {
            Utils.showToastLong(str("morphe_block_channels_already_blocked"));
            return false;
        }
        StringBuilder updated = new StringBuilder(current.trim());
        if (updated.length() > 0) updated.append('\n');
        updated.append(channelId);
        if (handle != null && HANDLE_PATTERN.matcher(handle).matches() && !existing.contains(handle)) {
            updated.append('\n').append(handle);
        }
        Setting.preferences.preferences.edit().putString(
                Settings.BLOCK_CHANNELS_LIST.key,
                updated.toString()
        ).apply();
        Utils.showToastLong(str("morphe_block_channels_added", channelId));
        return true;
    }

    private static String normalizeEntry(String value) {
        Matcher idMatcher = CHANNEL_ID_PATTERN.matcher(value);
        if (idMatcher.find()) return idMatcher.group();

        Matcher handleUrlMatcher = HANDLE_URL_PATTERN.matcher(value);
        if (handleUrlMatcher.matches()) return handleUrlMatcher.group(1);

        Matcher handleMatcher = HANDLE_PATTERN.matcher(value);
        if (handleMatcher.matches()) return handleMatcher.group();

        Matcher bareHandleMatcher = BARE_HANDLE_PATTERN.matcher(value);
        if (bareHandleMatcher.matches()) return "@" + bareHandleMatcher.group();

        return null;
    }

    private synchronized void parseChannels() {
        String rawChannels = Settings.BLOCK_CHANNELS_LIST.get();
        //noinspection StringEquality
        if (rawChannels == lastChannelsParsed) return;

        ByteTrieSearch search = new ByteTrieSearch();
        ByteTrieSearch handles = new ByteTrieSearch();
        Set<String> channels = new LinkedHashSet<>();

        for (String entry : rawChannels.split("\\R")) {
            String value = entry.trim();
            if (value.isEmpty() || value.startsWith("#")) continue;

            String normalized = normalizeEntry(value);
            if (normalized == null) {
                Utils.showToastLong(str("morphe_block_channels_toast_invalid_id", value));
                continue;
            }
            channels.add(normalized);
        }

        for (String channel : channels) {
            final String matchedChannel = channel;
            TrieSearch.TriePatternMatchedCallback<byte[]> callback =
                    (textSearched, startIndex, matchLength, callbackParameter) -> {
                        MutableReference<String> reference =
                                (MutableReference<String>) callbackParameter;
                        reference.value = matchedChannel;
                        Logger.printDebug(() -> "Matched blocked channel: " + matchedChannel);
                        return true;
                    };
            search.addPattern(channel.getBytes(StandardCharsets.UTF_8), callback);
            if (channel.charAt(0) == '@') {
                handles.addPattern(channel.toLowerCase(Locale.ROOT).getBytes(StandardCharsets.UTF_8), callback);
            }
        }

        channelSearch = search;
        handleSearch = handles;
        lastChannelsParsed = rawChannels;
        Logger.printDebug(() -> "Blocking channels: " + channels);
    }

    public BlockChannelsFilter() {
        super();
        addPathCallbacks(commentsFilter, allLithoComponentsFilter);
        parseChannels();
    }

    @Override
    protected void reparseIfNeeded() {
        //noinspection StringEquality
        if (Settings.BLOCK_CHANNELS_LIST.get() != lastChannelsParsed) {
            parseChannels();
        }
    }

    @Override
    protected boolean isActiveForFeedContext() {
        return Settings.BLOCK_CHANNELS.get();
    }

    @Override
    @Nullable
    protected String matchBuffer(byte[] buffer, StringFilterGroup matchedGroup) {
        ByteTrieSearch search = channelSearch;
        if (search == null) return null;

        MutableReference<String> matchRef = new MutableReference<>();
        if (search.matches(buffer, matchRef)) return matchRef.value;

        ByteTrieSearch handles = handleSearch;
        if (handles != null && handles != search) {
            String lowerBuffer = new String(buffer, StandardCharsets.UTF_8).toLowerCase(Locale.ROOT);
            if (handles.matches(lowerBuffer.getBytes(StandardCharsets.UTF_8), matchRef)) {
                return matchRef.value;
            }
        }
        return null;
    }
}
