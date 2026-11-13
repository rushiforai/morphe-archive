package io.github.bryceaspringfield.morphe.extension.youtube;


import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.components.BufferAsciiStrings;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.PlayerType;

/**
 * The bundle's Litho filter for feed items and comments: channel filters, length bounds, playlists on Home, topics,
 * hidden channels, and categories. Added to Morphe's filter list by the patch.
 */
@SuppressWarnings("unused")
public final class XFilter extends Filter {

    /** The feed's video items, as Morphe's keyword filter reads them (paths starting with these). */
    private final StringFilterGroup feedItems = new StringFilterGroup(null,
            "home_video_with_context.e",
            "search_video_with_context.e",
            "video_with_context.e",
            "related_video_with_context.e",
            "video_lockup_with_attachment.e",
            // The card layout (Morphe's feed card layout, or YouTube's own A/B test): lockup.eml-fe|hash.
            "lockup.e",
            "compact_video.e",
            "compact_playlist.e",
            "compact_radio.e",
            "inline_shorts",
            "shorts_video_cell",
            "shorts_pivot_item.e");

    private final StringFilterGroup comments = new StringFilterGroup(null, "comment_thread.e");

    /** The video quality sheet's content: the extension adds its Audio only row to the sheet's window. */
    private final StringFilterGroup qualitySheet = new StringFilterGroup(null, "quick_quality_sheet_content.e");

    /** The red progress bar of a watched video's thumbnail (a brand gradient under the lockup's thumbnail). */
    private final StringFilterGroup progressBar = new StringFilterGroup(null, "brand_linear_gradient_container.e");

    /** The last top-level item laid out on this thread; Litho lays out an item's children after it, on its thread. */
    private static final ThreadLocal<VideoItem> LAST_ITEM = new ThreadLocal<>();

    private enum Place {HOME, SUBSCRIPTIONS, SEARCH, RELATED, OTHER}

    public XFilter() {
        XSettings.load();
        addPathCallbacks(feedItems, comments, progressBar, qualitySheet);
        SaveChooser.register();
        QualityAudioRow.register();
        NavTapFix.register();
        if (!"off".equals(XSettings.AUTO_WATCHED.get())) AccountHistory.refresh();
        SuggestedCard.register();
        PlaybackExtras.register();
        ChatAvatar.register();
        NetworkRecovery.register();
    }

    @Override
    public boolean isFiltered(ContextInterface contextInterface, String identifier, String accessibility,
                              CharSequence path, byte[] buffer, BufferAsciiStrings asciiStrings,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        // Only the item's own top-level component, whose buffer holds the whole item.
        if (matchedGroup == qualitySheet) {
            QualityAudioRow.sheetOpened();
            return false;
        }
        if (matchedGroup == progressBar) {
            String p = path.toString();
            // Home and the videos under the player only: History's first menu token removes the video from the
            // watch history, and search results offer no Not interested.
            if (watchedPlace(contextInterface)
                    && p.contains("thumbnail") && !p.contains("live_ring") && !p.contains("avatar")) {
                VideoItem parent = LAST_ITEM.get();
                if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: progress bar " + p + " parent " + parent);
                if (parent != null && parent.videoId != null && p.contains(parent.root)) Feedback.onWatched(parent);
            }
            return false;
        }
        WatchHistory.sample();
        if (!"off".equals(XSettings.AUTO_WATCHED.get())) AccountHistory.refresh();
        if (matchedGroup == comments) {
            return isTopLevel(path.subSequence(contentIndex, path.length())) && filterComment(buffer, path);
        }
        if (contentIndex != 0 || !isTopLevel(path)) return false;

        Place place = place(contextInterface);
        // Morphe's own keyword filter reads the classic feed templates only, so its keywords never reach the cards of
        // its card layout (lockup.eml): they are applied here, with Morphe's own list and its Home, Subscriptions,
        // and Search switches.
        if (path.toString().startsWith("lockup.") && MorpheKeywords.applies(place == Place.SEARCH, place == Place.SUBSCRIPTIONS)) {
            VideoItem card = VideoItem.parse(buffer, path);
            String kw = MorpheKeywords.match(card);
            if (kw != null) {
                if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: " + place + " " + card + " HIDDEN by Morphe keyword " + kw);
                return true;
            }
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: card text " + card.videoId + " [" + card.text.replace('\n', '|') + "]");
        }
        // Mark watched videos is its own option: it applies on Home and under the player whatever the filters' places.
        boolean filters = applies(place);
        if (!filters && ("off".equals(XSettings.AUTO_WATCHED.get()) || !watchedPlace(contextInterface))) return false;
        VideoItem item = VideoItem.parse(buffer, path);
        Channels.learn(item);
        LAST_ITEM.set(item);
        String found = filters ? reason(item, place) : null;
        if (found == null && place == Place.HOME && Resuggested.onHome(item)) found = "suggested on Home " + Resuggested.limit() + " times, never opened";
        final String reason = found != null ? found
                : watchedPlace(contextInterface) && watchedItem(item, buffer) ? "watched" : null;
        if ("watched".equals(reason)) Feedback.onWatched(item);
        if (XSettings.DEBUG.get()) {
            Logger.printDebug(() -> "YouTube Extras: " + place + " " + item + (reason == null ? "" : " HIDDEN by " + reason));
        }
        boolean feedbackPlace = watchedPlace(contextInterface) || NavigationBar.NavigationButton
                .getSelectedNavigationButton(contextInterface) == NavigationBar.NavigationButton.SUBSCRIPTIONS;
        if (reason == null) {
            if (watchedPlace(contextInterface)) Feedback.onFeedItem(item);
            // A category lookup slower than its wait shows the item; when the answer names a hidden category, the
            // item still gets Not interested, as the other filters' hidden items do (it hides at its next layout).
            if (filters && feedbackPlace && XSettings.AUTO_DISLIKE_FILTERED.get() && item.videoId != null
                    && !item.playlist && !item.mix && !Categories.hidden().isEmpty() && Categories.pending(item.videoId)) {
                Categories.onLate(item.videoId, cat -> {
                    if (!Categories.hidden().contains(cat.toLowerCase())) return;
                    if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: late category " + cat + " for " + item.videoId + ", Not interested");
                    Feedback.onHidden(item, "category " + cat);
                });
            }
            return false;
        }
        if (feedbackPlace) Feedback.onHidden(item, reason);
        return true;
    }

    
    /** An item whose own buffer states a red progress bar (any, or 90% with Fully), or one seen with one before. */
    private static boolean watchedItem(VideoItem item, byte[] buffer) {
        String mode = XSettings.AUTO_WATCHED.get();
        // A playlist or mix names its first video, whose watch says nothing of the list.
        if ("off".equals(mode) || item.videoId == null || item.playlist || item.mix) return false;
        boolean fully = "fully".equals(mode);
        float p = VideoItem.progress(buffer);
        if (p >= (fully ? 0.9f : 0.005f)) return true;
        // A feed item's data has no progress on most layouts: YouTube draws the red bar from the account's history.
        int account = AccountHistory.percent(item.videoId);
        if (account >= (fully ? 90 : 1)) return true;
        if (!item.videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getStartingOrPlayingVideoId())
                && WatchHistory.fraction(item.videoId) >= (fully ? 0.9f : 0.02f)) return true;
        return Feedback.isWatched(item.videoId);
    }

    private static String reason(VideoItem item, Place place) {
        ChannelRules.Rule rule = ChannelRules.match(item);
        if (rule != null) return "channel rule " + rule.channel.label() + " " + rule.kind;
        if (place == Place.HOME && XSettings.HIDE_HOME_PLAYLISTS.get() && item.playlist) return "home playlist";
        if (XSettings.HIDE_PAST_STREAMS.get() && !item.live && !item.shorts && item.text != null
                && VideoItem.PAST_STREAM.matcher(item.text).find()) return "past stream";
        if (item.seconds >= 0 && !item.shorts) {
            int min = Lengths.parse(XSettings.MIN_LENGTH.get());
            int max = Lengths.parse(XSettings.MAX_LENGTH.get());
            if (min > 0 && item.seconds < min) return "shorter than " + min + " s";
            if (max > 0 && item.seconds > max) return "longer than " + max + " s";
        }
        String topic = Topics.match(item);
        if (topic != null) return "topic " + topic;
        if (item.videoId != null && !item.playlist && !item.mix && !Categories.hidden().isEmpty()) {
            String cat = Categories.get(item.videoId);
            if (cat != null && Categories.hidden().contains(cat.toLowerCase())) return "category " + cat;
        }
        return null;
    }

    private static boolean filterComment(byte[] buffer, CharSequence path) {
        List<ChannelRules.Rule> rules = ChannelRules.commentRules(VideoInformation.getChannelId(),
                VideoInformation.getChannelName());
        if (rules.isEmpty()) return false;
        VideoItem comment = VideoItem.parse(buffer, path);
        // Handles are dropped (a comment's buffer names the channel, e.g., "by @RickAstleyYT" under a creator heart),
        // and so are the buffer's own labels after the comment text.
        String text = comment.text.replaceAll("@[\\w.\\-]+", " ");
        for (ChannelRules.Rule r : rules) {
            if (r.keyword != null && ChannelRules.containsKeyword(text, r.keyword, r.wholeWord)) {
                Logger.printDebug(() -> "YouTube Extras: comment hidden by " + r.channel.label() + " " + r.keyword);
                return true;
            }
        }
        return false;
    }

    /**
     * Whether the path is an item's top-level component ("video_lockup_with_attachment.eml-fe|HASH|CellType|"), whose
     * buffer holds the whole item; its child components start with the same path and hold parts of the buffer.
     */
    private static boolean isTopLevel(CharSequence path) {
        int components = 0;
        String p = path.toString();
        for (String s : p.split("\\|")) if (s.contains(".e")) components++;
        return components <= 1;
    }

    /** The player's related videos, or Home with its button selected (a page with none, such as History, is excluded). */
    private static boolean watchedPlace(ContextInterface contextInterface) {
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return true;
        if (NavigationBar.isSearchBarActive()) return false;
        return NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface)
                == NavigationBar.NavigationButton.HOME;
    }

    private static Place place(ContextInterface contextInterface) {
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return Place.RELATED;
        if (NavigationBar.isSearchBarActive()) return Place.SEARCH;
        NavigationBar.NavigationButton b = NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface);
        if (b == null) return Place.HOME;
        return switch (b) {
            case HOME -> Place.HOME;
            case SUBSCRIPTIONS -> Place.SUBSCRIPTIONS;
            default -> Place.OTHER;
        };
    }

    private static boolean applies(Place place) {
        return switch (place) {
            case HOME -> XSettings.APPLY_HOME.get();
            case SUBSCRIPTIONS -> XSettings.APPLY_SUBSCRIPTIONS.get();
            case SEARCH -> XSettings.APPLY_SEARCH.get();
            case RELATED -> XSettings.APPLY_RELATED.get();
            case OTHER -> false;
        };
    }
}
