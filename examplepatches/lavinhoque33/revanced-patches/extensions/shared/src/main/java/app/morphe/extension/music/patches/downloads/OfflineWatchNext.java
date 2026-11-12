/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The watch-next (queue) response of an offline queue, as protobuf bytes the app parses like a stock response.
 *
 * <p>The shape is the one the app's own sideloaded builder writes, so the queue reader accepts it: the response
 * holds a queue with a single "up next" tab, whose playlist panel lists the tracks. Path (field numbers decoded
 * from the app's message info):
 * <pre>
 * response 7 -> contents 125354411 -> 7 -> renderer 91700600 -> 1 (tab list) -> 58174010 -> tab {2 title, 4 ->
 *   278751218 -> 1 -> renderer 50631000 -> playlist panel {2 items, 3 current index, 5 playlist id, 6 count}}
 * response 9 = the endpoint of the current track
 * item      = {51779701 -> track}
 * track     = {1 title, 2 byline, 3 thumbnail, 4 length, 5 position, 6 selected, 7 endpoint, 10 video id,
 *              12 short byline}
 * </pre>
 * The endpoint of every track is its offline watch command, so choosing a track (or Next, or auto-advance) makes an
 * offline request that the replay hooks answer from the stored copy.
 *
 * <p>An item may show the music video of its song: its id is the video copy's and its endpoint has the music video
 * type, as the items of an online album queue do in a video mode. The queue is asked for again on every navigation,
 * so the replay writes the items the mode of that moment shows.
 */
final class OfflineWatchNext {
    /**
     * One track of the queue. Only the video id is required; the rest only decorates the row. The music video type is
     * the one the item's endpoint names: the song (ATV), or the music video of the song (OMV) that has its own id.
     */
    record Item(String videoId, String title, String artist, String album, long durationMs,
                @Nullable String thumbnailUrl, int musicVideoType) {
        Item(String videoId, String title, String artist, String album, long durationMs,
             @Nullable String thumbnailUrl) {
            this(videoId, title, artist, album, durationMs, thumbnailUrl, CommandRewrite.TYPE_ATV);
        }

        /** The same row showing the music video {@code videoId} of its song. */
        Item showingVideo(String videoId) {
            return new Item(videoId, title, artist, album, durationMs, thumbnailUrl, CommandRewrite.TYPE_OMV);
        }
    }

    static final int RESPONSE_CONTENTS_FIELD = 7;
    static final int RESPONSE_CURRENT_ENDPOINT_FIELD = 9;
    static final int CONTENTS_QUEUE_FIELD = 125_354_411;
    static final int QUEUE_TABS_HOLDER_FIELD = 7;
    static final int TABS_RENDERER_FIELD = 91_700_600;
    static final int TABS_LIST_FIELD = 1;
    static final int TAB_FIELD = 58_174_010;
    static final int TAB_TITLE_FIELD = 2;
    static final int TAB_CONTENT_FIELD = 4;
    static final int TAB_PANEL_HOLDER_FIELD = 278_751_218;
    static final int PANEL_HOLDER_RENDERER_FIELD = 1;
    static final int PANEL_RENDERER_FIELD = 50_631_000;
    static final int PANEL_ITEMS_FIELD = 2;
    static final int PANEL_CURRENT_INDEX_FIELD = 3;
    static final int PANEL_PLAYLIST_ID_FIELD = 5;
    static final int PANEL_COUNT_FIELD = 6;
    static final int ITEM_TRACK_FIELD = 51_779_701;
    static final int TRACK_TITLE_FIELD = 1;
    static final int TRACK_BYLINE_FIELD = 2;
    static final int TRACK_THUMBNAIL_FIELD = 3;
    static final int TRACK_LENGTH_FIELD = 4;
    static final int TRACK_POSITION_FIELD = 5;
    static final int TRACK_SELECTED_FIELD = 6;
    static final int TRACK_ENDPOINT_FIELD = 7;
    static final int TRACK_VIDEO_ID_FIELD = 10;
    static final int TRACK_SHORT_BYLINE_FIELD = 12;

    /** Text message: 1 runs (each run: 1 text), 4 plain text. */
    static final int TEXT_RUNS_FIELD = 1;
    static final int TEXT_RUN_TEXT_FIELD = 1;
    static final int TEXT_SIMPLE_FIELD = 4;

    /** Thumbnail message: 1 sources (each source: 1 url, 2 width, 3 height). */
    static final int THUMBNAIL_SOURCES_FIELD = 1;
    static final int SOURCE_URL_FIELD = 1;
    static final int SOURCE_WIDTH_FIELD = 2;
    static final int SOURCE_HEIGHT_FIELD = 3;

    /** The label of the queue's only tab, the string the app shows for it. */
    static final String TAB_TITLE = "Up next";
    static final String BYLINE_SEPARATOR = " \u2022 ";

    /** Google image urls end in a size request such as {@code =w544-h544-l90-rj}. */
    private static final Pattern URL_SIZE = Pattern.compile("=w(\\d{1,5})-h(\\d{1,5})(?:-|$)");

    private OfflineWatchNext() {}

    /**
     * The watch-next response bytes of the queue {@code items} of {@code playlistId}, positioned on
     * {@code currentIndex}.
     */
    static byte[] build(String playlistId, List<Item> items, int currentIndex) {
        if (playlistId == null || playlistId.isEmpty()) throw new IllegalArgumentException("playlistId is empty");
        if (items == null || items.isEmpty()) throw new IllegalArgumentException("a queue needs at least one item");
        if (currentIndex < 0 || currentIndex >= items.size()) {
            throw new IllegalArgumentException("currentIndex " + currentIndex + " outside " + items.size() + " items");
        }

        byte[] panel = panel(playlistId, items, currentIndex);
        byte[] panelHolder = new ProtoWriter().message(PANEL_RENDERER_FIELD, panel).toByteArray();
        byte[] panelContent = new ProtoWriter().message(PANEL_HOLDER_RENDERER_FIELD, panelHolder).toByteArray();
        byte[] tabContent = new ProtoWriter().message(TAB_PANEL_HOLDER_FIELD, panelContent).toByteArray();
        byte[] tab = new ProtoWriter()
                .string(TAB_TITLE_FIELD, TAB_TITLE)
                .message(TAB_CONTENT_FIELD, tabContent)
                .toByteArray();
        byte[] tabEntry = new ProtoWriter().message(TAB_FIELD, tab).toByteArray();
        byte[] tabList = new ProtoWriter().message(TABS_LIST_FIELD, tabEntry).toByteArray();
        byte[] tabsRenderer = new ProtoWriter().message(TABS_RENDERER_FIELD, tabList).toByteArray();
        byte[] queue = new ProtoWriter().message(QUEUE_TABS_HOLDER_FIELD, tabsRenderer).toByteArray();
        byte[] contents = new ProtoWriter().message(CONTENTS_QUEUE_FIELD, queue).toByteArray();

        Item current = items.get(currentIndex);
        return new ProtoWriter()
                .message(RESPONSE_CONTENTS_FIELD, contents)
                .message(RESPONSE_CURRENT_ENDPOINT_FIELD,
                        OfflineWatchCommand.build(current.videoId(), playlistId, currentIndex,
                                current.musicVideoType()))
                .toByteArray();
    }

    private static byte[] panel(String playlistId, List<Item> items, int currentIndex) {
        ProtoWriter panel = new ProtoWriter();
        for (int index = 0; index < items.size(); index++) {
            byte[] track = track(items.get(index), playlistId, index, index == currentIndex);
            panel.message(PANEL_ITEMS_FIELD, new ProtoWriter().message(ITEM_TRACK_FIELD, track).toByteArray());
        }
        return panel
                .int32(PANEL_CURRENT_INDEX_FIELD, currentIndex)
                .string(PANEL_PLAYLIST_ID_FIELD, playlistId)
                .int32(PANEL_COUNT_FIELD, items.size())
                .toByteArray();
    }

    private static byte[] track(Item item, String playlistId, int index, boolean selected) {
        if (item.videoId() == null || item.videoId().isEmpty()) throw new IllegalArgumentException("videoId is empty");

        ProtoWriter track = new ProtoWriter().message(TRACK_TITLE_FIELD, plainText(nullToEmpty(item.title())));

        String[] byline = bylineRuns(item.artist(), item.album());
        if (byline.length > 0) track.message(TRACK_BYLINE_FIELD, runsText(byline));
        if (item.thumbnailUrl() != null && !item.thumbnailUrl().isEmpty()) {
            track.message(TRACK_THUMBNAIL_FIELD, thumbnail(item.thumbnailUrl()));
        }
        if (item.durationMs() > 0) track.message(TRACK_LENGTH_FIELD, runsText(formatLength(item.durationMs())));

        return track
                .message(TRACK_POSITION_FIELD, runsText(String.valueOf(index + 1)))
                .bool(TRACK_SELECTED_FIELD, selected)
                .message(TRACK_ENDPOINT_FIELD,
                        OfflineWatchCommand.build(item.videoId(), playlistId, index, item.musicVideoType()))
                .string(TRACK_VIDEO_ID_FIELD, item.videoId())
                .message(TRACK_SHORT_BYLINE_FIELD, plainText(nullToEmpty(item.artist())))
                .toByteArray();
    }

    /** The byline as separate runs: artist, separator, album; a missing part drops its separator too. */
    private static String[] bylineRuns(@Nullable String artist, @Nullable String album) {
        boolean hasArtist = artist != null && !artist.isEmpty();
        boolean hasAlbum = album != null && !album.isEmpty();
        if (hasArtist && hasAlbum) return new String[]{artist, BYLINE_SEPARATOR, album};
        if (hasArtist) return new String[]{artist};
        if (hasAlbum) return new String[]{album};
        return new String[0];
    }

    /** {@code m:ss}, or {@code h:mm:ss} from an hour up, the format the app uses for a track length. */
    static String formatLength(long durationMs) {
        long totalSeconds = durationMs / 1000;
        long hours = totalSeconds / 3600;
        long minutes = totalSeconds % 3600 / 60;
        long seconds = totalSeconds % 60;
        if (hours > 0) return String.format(Locale.ROOT, "%d:%02d:%02d", hours, minutes, seconds);
        return String.format(Locale.ROOT, "%d:%02d", minutes, seconds);
    }

    /** The single thumbnail source; its size is read from the url's size request, or left out when it has none. */
    private static byte[] thumbnail(String url) {
        ProtoWriter source = new ProtoWriter().string(SOURCE_URL_FIELD, url);
        Matcher size = URL_SIZE.matcher(url);
        if (size.find()) {
            source.int32(SOURCE_WIDTH_FIELD, Integer.parseInt(size.group(1)))
                    .int32(SOURCE_HEIGHT_FIELD, Integer.parseInt(size.group(2)));
        }
        return new ProtoWriter().message(THUMBNAIL_SOURCES_FIELD, source.toByteArray()).toByteArray();
    }

    private static byte[] plainText(String text) {
        return new ProtoWriter().string(TEXT_SIMPLE_FIELD, text).toByteArray();
    }

    private static byte[] runsText(String... runs) {
        ProtoWriter text = new ProtoWriter();
        for (String run : runs) {
            text.message(TEXT_RUNS_FIELD, new ProtoWriter().string(TEXT_RUN_TEXT_FIELD, run).toByteArray());
        }
        return text.toByteArray();
    }

    private static String nullToEmpty(@Nullable String value) {
        return value == null ? "" : value;
    }
}
