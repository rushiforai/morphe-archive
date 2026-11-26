/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.components;

import androidx.annotation.Nullable;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;

import app.morphe.extension.shared.patches.components.ByteArrayFilterGroup;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.LazyBufferFilter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.StringTrieSearch;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ComponentType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.Element;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.ElementType;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModel;
import app.morphe.extension.youtube.innertube.FeedCardLayoutOuterClass.LockupViewModelHolder;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.EngagementPanel;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.NavigationBar.NavigationButton;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.RootView;

@SuppressWarnings({"unused", "deprecation"})
public final class ShortsShelfFilter extends LazyBufferFilter {
    private static final String BROWSE_ID_HISTORY = "FEhistory";
    private static final String BROWSE_ID_LIBRARY = "FElibrary";
    private static final String BROWSE_ID_NOTIFICATION_INBOX = "FEnotifications_inbox";
    private static final String BROWSE_ID_SUBSCRIPTIONS = "FEsubscriptions";
    private static final String CONVERSATION_CONTEXT_FEED_IDENTIFIER =
            "horizontalCollectionSwipeProtector=null";
    private static final String SHELF_HEADER_PATH = "shelf_header.";
    private static final String LOCKUP_TEMPLATE = "lockup.eml";
    private static final String ITEM_ROOT_SUFFIX = "|CellType|";
    // Native full-width Shorts cards use the same template as ordinary videos.
    // See MorpheApp/morphe-patches@49b828305ceb for the A/B layout and content type.
    private static final int LOCKUP_CONTENT_TYPE_SHORT = 3;

    private final StringFilterGroup channelProfile;
    private final StringFilterGroup compactFeedVideoPath;
    private final ByteArrayFilterGroup compactFeedVideoBuffer;
    private final StringFilterGroup standaloneShortCardPath;
    private final StringFilterGroup shelfHeaderIdentifier;
    private final StringFilterGroup shelfHeaderPath;
    private static final StringTrieSearch feedGroup = new StringTrieSearch();
    private static final BooleanSetting hideShortsShelf = Settings.HIDE_SHORTS_SHELF;
    private static final BooleanSetting hideChannel = Settings.HIDE_SHORTS_SHELF_CHANNEL;
    private static final ByteArrayFilterGroup legacyFeedShelfHeader =
            new ByteArrayFilterGroup(
                    hideShortsShelf,
                    "Shorts"
            );
    private static final ByteArrayFilterGroup channelProfileShelfHeader =
            new ByteArrayFilterGroup(
                    hideChannel,
                    "Shorts"
            );

    public ShortsShelfFilter() {
        feedGroup.addPattern(CONVERSATION_CONTEXT_FEED_IDENTIFIER);

        channelProfile = new StringFilterGroup(
                hideChannel,
                "shorts_pivot_item"
        );

        final StringFilterGroup shortsIdentifiers = new StringFilterGroup(
                hideShortsShelf,
                "shorts_shelf",
                "inline_shorts",
                "shorts_grid",
                "shorts_video_cell"
        );

        shelfHeaderIdentifier = new StringFilterGroup(
                hideShortsShelf,
                SHELF_HEADER_PATH
        );

        addIdentifierCallbacks(channelProfile, shortsIdentifiers, shelfHeaderIdentifier);

        compactFeedVideoPath = new StringFilterGroup(
                hideShortsShelf,
                // Shorts that appear in the feed/search when the device is using tablet layout.
                "compact_video.",
                // 'video_lockup_with_attachment.' is used instead of 'compact_video.' for some users. (A/B tests)
                "video_lockup_with_attachment.",
                // Search results that appear in a horizontal shelf.
                "video_card."
        );

        // Filter out items that use the 'frame0' thumbnail.
        // This is a valid thumbnail for both regular videos and Shorts,
        // but it appears these thumbnails are used only for Shorts.
        compactFeedVideoBuffer = new ByteArrayFilterGroup(
                hideShortsShelf,
                "/frame0.jpg"
        );

        // Feed Shorts shelf header.
        // Use a different filter group for this pattern, as it requires an additional check after matching.
        shelfHeaderPath = new StringFilterGroup(
                hideShortsShelf,
                SHELF_HEADER_PATH
        );

        standaloneShortCardPath = new StringFilterGroup(hideShortsShelf, LOCKUP_TEMPLATE);
        addPathCallbacks(compactFeedVideoPath, shelfHeaderPath, standaloneShortCardPath);
    }

    @Override
    public boolean isFilteredLazy(String path, String identifier, String allValue, Buffer buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        // The legacy buffer can belong to another card; only inspect an exact serialized Element.
        if (matchedGroup == standaloneShortCardPath) {
            return false;
        }

        boolean isHomeFeedOrRelatedVideo = feedGroup.matches(allValue)
                || ((matchedGroup == shelfHeaderPath || matchedGroup == shelfHeaderIdentifier)
                && !RootView.isBackButtonVisible()
                && legacyFeedShelfHeader.check(buffer.get()).isFiltered());
        return isFiltered(isHomeFeedOrRelatedVideo, path, identifier, buffer, matchedGroup, contentType, contentIndex);
    }

    @Override
    public boolean isFilteredLazy(Object contextSource, String identifier, String accessibility,
                                  String path, Buffer buffer,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == standaloneShortCardPath) {
            return contentIndex == 0 && isLockupItemRoot(path)
                    && shouldHideShortsFeedItems(null)
                    && isShortLockup(buffer.get());
        }

        return isFiltered(contextSource instanceof ContextInterface contextInterface
                        ? contextInterface.isHomeFeedOrRelatedVideo()
                        : String.valueOf(contextSource).contains(CONVERSATION_CONTEXT_FEED_IDENTIFIER),
                path, identifier, buffer, matchedGroup, contentType, contentIndex);
    }

    private boolean isFiltered(boolean isHomeFeedOrRelatedVideo, String path, String identifier, Buffer buffer,
                               StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (contentType == FilterContentType.PATH) {
            if (matchedGroup == compactFeedVideoPath) {
                // When a video is autoplaying in the feed, no new components are drawn on the screen.
                // Therefore, filtering is skipped when the current PlayerType is [INLINE_MINIMAL].
                return PlayerType.getCurrent() != PlayerType.INLINE_MINIMAL
                        // The litho path of the feed video is 'video_lockup_with_attachment.e'.
                        // It appears [shortsCompactFeedVideoBuffer] is used after 20 seconds during autoplay in the feed in YouTube 20.44.38.
                        // If the Shorts shelf is hidden on the Home feed, the video in the feed will be hidden after 20 seconds have passed since autoplay began in the feed.
                        // See: https://github.com/MorpheApp/morphe-patches/issues/773.
                        && compactFeedVideoBuffer.check(buffer.get()).isFiltered()
                        // Checked last, as only the Shorts are logged.
                        && shouldHideShortsFeedItems(path);
            } else if (matchedGroup == shelfHeaderPath) {
                // Shelf header reused in history/channel/etc.
                // Shorts header is always index 0.
                if (contentIndex != 0) {
                    return false;
                }
                if (!isHomeFeedOrRelatedVideo) {
                    return !NavigationBar.isSearchBarActive()
                            && channelProfileShelfHeader.check(buffer.get()).isFiltered();
                }
                return shouldHideShortsFeedItems(path);
            }
        } else if (contentType == FilterContentType.IDENTIFIER) {
            // Feed/search identifier components.
            if (matchedGroup == shelfHeaderIdentifier) {
                // Shelf header reused in history/channel/etc.
                // Shorts header is always index 0.
                if (contentIndex != 0) {
                    return false;
                }
                // Check ConversationContext to not hide shelf header in channel profile
                // This value does not exist in the shelf header in the channel profile
                if (!isHomeFeedOrRelatedVideo) {
                    return false;
                }
            } else if (matchedGroup == channelProfile) {
                return !NavigationBar.isSearchBarActive();
            }
            return shouldHideShortsFeedItems(identifier);
        }

        return true;
    }

    private static boolean isLockupItemRoot(String path) {
        // Exactly template|hash|CellType|, not a child of this card or a lockup inside another item.
        if (!path.endsWith(ITEM_ROOT_SUFFIX)) {
            return false;
        }

        final int templateEnd = LOCKUP_TEMPLATE.length();
        final char separator = path.charAt(templateEnd);
        if (separator != '|' && separator != '-') {
            return false;
        }

        final int hashStart = path.indexOf('|', templateEnd) + 1;
        return hashStart > 0 && hashStart < path.length() - ITEM_ROOT_SUFFIX.length()
                && path.indexOf('|', hashStart) == path.length() - ITEM_ROOT_SUFFIX.length();
    }

    private static boolean isShortLockup(byte[] bytes) {
        // Walk only the card's own typed model. Skip images, commands and nested elements without copying them.
        CodedInputStream input = CodedInputStream.newInstance(bytes);
        try {
            return enterMessage(input, Element.TYPE_FIELD_NUMBER)
                    && enterMessage(input, ElementType.COMPONENTTYPE_FIELD_NUMBER)
                    && enterMessage(input, ComponentType.MODEL_FIELD_NUMBER)
                    && enterMessage(input, ElementModel.LOCKUPMODEL_FIELD_NUMBER)
                    && enterMessage(input, LockupModel.VIEWMODEL_FIELD_NUMBER)
                    && enterMessage(input, LockupViewModelHolder.LOCKUPVIEWMODEL_FIELD_NUMBER)
                    && skipToField(input, LockupViewModel.CONTENTTYPE_FIELD_NUMBER, WireFormat.WIRETYPE_VARINT)
                    && input.readInt32() == LOCKUP_CONTENT_TYPE_SHORT;
        } catch (IOException ignored) {
            return false;
        }
    }

    private static boolean enterMessage(CodedInputStream input, int fieldNumber) throws IOException {
        if (!skipToField(input, fieldNumber, WireFormat.WIRETYPE_LENGTH_DELIMITED)) {
            return false;
        }

        input.pushLimit(input.readRawVarint32());
        return true;
    }

    private static boolean skipToField(CodedInputStream input, int fieldNumber, int wireType) throws IOException {
        final int wantedTag = (fieldNumber << 3) | wireType;
        for (int tag; (tag = input.readTag()) != 0; ) {
            if (tag == wantedTag) {
                return true;
            }
            if (!input.skipField(tag)) {
                break;
            }
        }
        return false;
    }

    /** @param component Identifier or path to log, or null to check the surface before classifying the item. */
    private static boolean shouldHideShortsFeedItems(@Nullable CharSequence component) {
        final boolean hideHomeAndRelatedVideos = Settings.HIDE_SHORTS_SHELF_HOME_RELATED_VIDEOS.get();
        final boolean hideSearch = Settings.HIDE_SHORTS_SHELF_SEARCH.get();
        final boolean hideSubscriptions = Settings.HIDE_SHORTS_SHELF_SUBSCRIPTIONS.get();
        final boolean hideVideoDescription = Settings.HIDE_SHORTS_SHELF_VIDEO_DESCRIPTION.get();
        final boolean hideHistory = Settings.HIDE_SHORTS_SHELF_HISTORY.get();

        if (hideHomeAndRelatedVideos && hideSearch && hideSubscriptions && hideVideoDescription && hideHistory) {
            // Shorts suggestions can load in the background if a video is opened and
            // then immediately minimized before any suggestions are loaded.
            // In this state the player type will show minimized, which makes it not possible to
            // distinguish between Shorts suggestions loading in the player and between
            // scrolling thru search/home/subscription tabs while a player is minimized.
            //
            // To avoid this situation for users that never want to show Shorts (all hide Shorts options are enabled)
            // then hide all Shorts everywhere including the Library history and Library playlists.
            return logDecision(component, true, "all feeds hidden");
        }

        // Must check player type first, as search bar can be active behind the player.
        if (RootView.isPlayerActive()) {
            // Treat the results below a video the same as Home.
            return EngagementPanel.isDescription()
                    ? logDecision(component, hideVideoDescription, "player: description")
                    : logDecision(component, hideHomeAndRelatedVideos, "player: home");
        }

        // Must check second, as search can be from any tab.
        if (RootView.isSearchBarActive()) {
            return logDecision(component, hideSearch, "search");
        }

        // Avoid checking navigation button status if all other Shorts should show.
        if (!hideHomeAndRelatedVideos && !hideSubscriptions && !hideHistory) {
            return logDecision(component, false, "others shown");
        }

        final NavigationButton selectedNavButton = NavigationButton.getSelectedNavigationButton();
        final String browseId = RootView.getBrowseId();

        // Unknown tab, treat the same as home.
        if (selectedNavButton == null) {
            return logHomeDecision(component, hideHomeAndRelatedVideos, null, browseId);
        }

        // Fixes a very rare bug in home.
        if (selectedNavButton == NavigationButton.HOME
                && (BROWSE_ID_LIBRARY.equals(browseId) || BROWSE_ID_NOTIFICATION_INBOX.equals(browseId))) {
            return logHomeDecision(component, hideHomeAndRelatedVideos, selectedNavButton, browseId);
        }

        switch (selectedNavButton) {
            case SEARCH -> {
                return logDecision(component, hideSearch, "search");
            }
            case SUBSCRIPTIONS -> {
                return logDecision(component, hideSubscriptions, "subscriptions");
            }
            case LIBRARY -> {
                return logDecision(component, hideHistory, "history/library");
            }
            default -> {
                switch (browseId) {
                    case BROWSE_ID_HISTORY, BROWSE_ID_LIBRARY, BROWSE_ID_NOTIFICATION_INBOX -> {
                        return logDecision(component, hideHistory, "history/library");
                    }
                    case BROWSE_ID_SUBSCRIPTIONS -> {
                        return logDecision(component, hideSubscriptions, "subscriptions");
                    }
                    default -> {
                        return logHomeDecision(component, hideHomeAndRelatedVideos, selectedNavButton, browseId);
                    }
                }
            }
        }
    }

    private static boolean logHomeDecision(@Nullable CharSequence component, boolean hide,
                                           @Nullable NavigationButton button, String browseId) {
        return component == null ? hide : logDecision(component, hide, "home: " + button + " browse: " + browseId);
    }

    /**
     * Logs why the Shorts of a feed are hidden or shown, to find the feeds where they are not hidden as expected.
     *
     * @return The decision.
     */
    private static boolean logDecision(@Nullable CharSequence component, boolean hide, String reason) {
        if (component != null && BaseSettings.DEBUG.get()) {
            String message = "Shorts " + (hide ? "hidden" : "shown") + " (" + reason + ") player: "
                    + PlayerType.getCurrent() + " search bar: " + NavigationBar.isSearchBarActive()
                    + " component: " + component;
            // The same element is filtered again on every layout, which would fill the log.
            if (!message.equals(lastDecisionLog)) {
                lastDecisionLog = message;
                Logger.printDebug(() -> message);
            }
        }
        return hide;
    }

    /**
     * Last message of {@link #logDecision(CharSequence, boolean, String)}.
     */
    private static volatile String lastDecisionLog = "";

}
