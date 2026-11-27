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

@SuppressWarnings("unused")
public final class XFilter extends Filter {

    private final StringFilterGroup feedItems = new StringFilterGroup(null,
            "home_video_with_context.e",
            "search_video_with_context.e",
            "video_with_context.e",
            "related_video_with_context.e",
            "video_lockup_with_attachment.e",
            "lockup.e",
            "compact_video.e",
            "compact_playlist.e",
            "compact_radio.e",
            "inline_shorts",
            "shorts_video_cell",
            "shorts_pivot_item.e");

    private final StringFilterGroup comments = new StringFilterGroup(null, "comment_thread.e");

    private final StringFilterGroup qualitySheet = new StringFilterGroup(null, "quick_quality_sheet_content.e");

    private final StringFilterGroup progressBar = new StringFilterGroup(null, "brand_linear_gradient_container.e");

    private static final ThreadLocal<VideoItem> LAST_ITEM = new ThreadLocal<>();

    private enum Place {HOME, SUBSCRIPTIONS, CHANNEL, SEARCH, RELATED, OTHER}

    public XFilter() {
        XSettings.load();
        addPathCallbacks(feedItems, comments, progressBar, qualitySheet);
        SaveChooser.register();
        QualityAudioRow.register();
        NavTapFix.register();
        ResumedActivity.register();
        if (!"off".equals(XSettings.AUTO_WATCHED.get())) AccountHistory.refresh();
        SuggestedCard.register();
        PlaybackExtras.register();
        SleepTimer.register();
        ChatAvatar.register();
        NetworkRecovery.register();
    }

    @Override
    public boolean isFiltered(ContextInterface contextInterface, String identifier, String accessibility,
                              CharSequence path, byte[] buffer, BufferAsciiStrings asciiStrings,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == qualitySheet) {
            QualityAudioRow.sheetOpened();
            return false;
        }
        if (matchedGroup == progressBar) {
            String p = path.toString();
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
        if (contentIndex != 0 || !(isTopLevel(path) || isAttachmentLockup(path))) {
            if (XSettings.DEBUG.get() && matchedGroup == feedItems) {
                Logger.printDebug(() -> "YouTube Extras: child " + path + " idx " + contentIndex + " :: " + VideoItem.runs(buffer, 400));
            }
            return false;
        }

        Place place = place(contextInterface);
        homeSelected = NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface)
                == NavigationBar.NavigationButton.HOME;
        if (isVideoCard(path)) MorpheKeywords.usedSignature = MorpheKeywords.signature();
        if (isVideoCard(path) && MorpheKeywords.applies(place == Place.SEARCH, place == Place.SUBSCRIPTIONS)) {
            VideoItem card = VideoItem.parse(buffer, path);
            String kw = MorpheKeywords.match(card);
            if (kw != null) {
                if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: " + place + " " + card + " HIDDEN by Morphe keyword " + kw);
                if (homeOrRelated(contextInterface)) Feedback.onHidden(card, "Morphe keyword " + kw);
                return true;
            }
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: card " + path + " " + card.videoId + " [" + card.text.replace('\n', '|') + "]");
        }
        boolean filters = applies(place);
        if (!filters && ("off".equals(XSettings.AUTO_WATCHED.get()) || !watchedPlace(contextInterface))) return false;
        VideoItem item = VideoItem.parse(buffer, path);
        Channels.learn(item);
        LAST_ITEM.set(item);
        String found = filters ? reason(item, place) : null;
        if (found == null && ((place == Place.HOME && homeSelected)
                || (place == Place.RELATED && XSettings.RESUGGESTED_RELATED.get())) && Resuggested.onHome(item)) {
            found = "suggested " + (place == Place.HOME ? "on Home " : "under videos ") + Resuggested.limit() + " times, never opened";
        }
        final String reason = found != null ? found
                : watchedPlace(contextInterface) && watchedItem(item, buffer) ? "watched" : null;
        if ("watched".equals(reason) && homeOrRelated(contextInterface)) Feedback.onWatched(item);
        if (XSettings.DEBUG.get()) {
            Logger.printDebug(() -> "YouTube Extras: " + place + " " + item + (reason == null ? "" : " HIDDEN by " + reason));
            if (item.videoId == null || item.playlist || item.seconds < 0) {
                Logger.printDebug(() -> "YouTube Extras: raw " + path + " :: " + VideoItem.runs(buffer, 3000));
            }
        }
        boolean feedbackPlace = homeOrRelated(contextInterface);
        if (reason == null) {
            if (watchedPlace(contextInterface)) Feedback.onFeedItem(item);
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

    private static boolean watchedItem(VideoItem item, byte[] buffer) {
        String mode = XSettings.AUTO_WATCHED.get();
        if ("off".equals(mode) || item.videoId == null || item.playlist || item.mix) return false;
        boolean fully = "fully".equals(mode);
        float p = VideoItem.progress(buffer);
        int account = AccountHistory.percent(item.videoId);
        float local = WatchHistory.fraction(item.videoId);
        boolean playing = item.videoId.equals(app.morphe.extension.youtube.patches.VideoInformation.getStartingOrPlayingVideoId());
        boolean marked = Feedback.isWatched(item.videoId);
        boolean watched = p >= (fully ? 0.9f : 0.005f)
                || account >= (fully ? 90 : 1)
                || (!playing && local >= (fully ? 0.9f : 0.02f))
                || marked;
        if (XSettings.DEBUG.get()) {
            Logger.printDebug(() -> "YouTube Extras: watched? " + item.videoId + " card " + p + " account " + account
                    + " local " + local + " marked " + marked + " -> " + watched);
        }
        return watched;
    }

    private static boolean homeSelected;

    private static String reason(VideoItem item, Place place) {
        ChannelRules.Rule rule = ChannelRules.match(item);
        if (rule != null) return "channel rule " + rule.channel.label() + " " + rule.kind;
        if (place == Place.HOME && XSettings.HIDE_HOME_PLAYLISTS.get() && item.playlist) return "home playlist";
        if (place == Place.HOME && XSettings.HIDE_HOME_LIVE.get() && item.live && !item.playlist) return "home live stream";
        if (XSettings.HIDE_PAST_STREAMS.get() && !item.live && !item.shorts && item.text != null
                && VideoItem.PAST_STREAM.matcher(item.text).find()) return "past stream";
        if (item.seconds >= 0 && !item.shorts) {
            int min = Lengths.parse(XSettings.MIN_LENGTH.get());
            int max = Lengths.parse(XSettings.MAX_LENGTH.get());
            if (min > 0 && item.seconds < min) return "shorter than " + min + " s";
            if (max > 0 && item.seconds > max) return "longer than " + max + " s";
        }
        if (item.text != null && !item.playlist && !item.mix) {
            if (XSettings.HIDE_MEMBERS_ONLY.get() && Metadata.membersOnly(item.text)) return "members only";
            if (XSettings.HIDE_UPCOMING.get() && Metadata.upcoming(item.text)) return "upcoming premiere or stream";
            double maxAge = Metadata.parseAge(XSettings.MAX_AGE.get());
            long minViews = Metadata.parseViews(XSettings.MIN_VIEWS.get());
            if ((maxAge > 0 || minViews > 0) && !item.live && !item.shorts) {
                double age = Metadata.ageDays(item.text);
                if (maxAge > 0 && age > maxAge) return "older than " + XSettings.MAX_AGE.get();
                if (minViews > 0 && (!XSettings.VIEWS_KEEP_NEW.get() || age >= 1)) {
                    long views = Metadata.views(item.text);
                    if (views >= 0 && views < minViews) return "under " + XSettings.MIN_VIEWS.get() + " views";
                }
            }
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
        String text = comment.text.replaceAll("@[\\w.\\-]+", " ");
        for (ChannelRules.Rule r : rules) {
            if (r.keyword != null && ChannelRules.containsKeyword(text, r.keyword, r.wholeWord)) {
                Logger.printDebug(() -> "YouTube Extras: comment hidden by " + r.channel.label() + " " + r.keyword);
                return true;
            }
        }
        return false;
    }

    private static boolean isAttachmentLockup(CharSequence path) {
        String p = path.toString();
        if (!p.startsWith("video_lockup_with_attachment.e")) return false;
        String[] parts = p.split("\\|");
        int components = 0;
        String last = "";
        for (String s : parts) if (s.contains(".e")) { components++; last = s; }
        return components == 2 && last.startsWith("video_lockup.e");
    }

    private static boolean isVideoCard(CharSequence path) {
        String p = path.toString();
        return !p.startsWith("inline_shorts") && !p.startsWith("shorts_") && !p.startsWith("compact_playlist")
                && !p.startsWith("compact_radio");
    }

    private static boolean isTopLevel(CharSequence path) {
        int components = 0;
        String p = path.toString();
        for (String s : p.split("\\|")) if (s.contains(".e")) components++;
        return components <= 1;
    }

    private static boolean homeOrRelated(ContextInterface contextInterface) {
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return true;
        if (NavigationBar.isSearchBarActive()) return false;
        return NavigationBar.NavigationButton.getSelectedNavigationButton(contextInterface)
                == NavigationBar.NavigationButton.HOME;
    }

    private static boolean watchedPlace(ContextInterface contextInterface) {
        return switch (place(contextInterface)) {
            case HOME -> XSettings.WATCHED_HOME.get();
            case SUBSCRIPTIONS -> XSettings.WATCHED_SUBSCRIPTIONS.get();
            case CHANNEL -> XSettings.WATCHED_CHANNEL.get();
            case SEARCH -> XSettings.WATCHED_SEARCH.get();
            case RELATED -> XSettings.WATCHED_RELATED.get();
            case OTHER -> false;
        };
    }

    private static Place place(ContextInterface contextInterface) {
        if (PlayerType.getCurrent().isMaximizedOrFullscreen()) return Place.RELATED;
        if (NavigationBar.isSearchBarActive()) return Place.SEARCH;
        if (BrowsePage.isChannel()) return Place.CHANNEL;
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
            case CHANNEL, OTHER -> false;
        };
    }
}
