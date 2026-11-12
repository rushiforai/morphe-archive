/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Test;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailEntry;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ThumbnailList;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class OfflineCopyMetadataTest {
    private static VideoDetails details() {
        return VideoDetails.newBuilder().setVideoId("v").setTitle("Online title").setLengthSeconds(200)
                .setThumbnail(ThumbnailList.newBuilder()
                        .addThumbnails(ThumbnailEntry.newBuilder().setUrl("https://small").setWidth(60))
                        .addThumbnails(ThumbnailEntry.newBuilder().setUrl("https://large").setWidth(544))
                        .addThumbnails(ThumbnailEntry.newBuilder().setUrl("https://mid").setWidth(120))).build();
    }

    @Test public void roundTripsThroughJsonIncludingMissingValues() throws Exception {
        OfflineCopyMetadata full = new OfflineCopyMetadata("v", "T", "A", "Al", 5, "https://t", 9, "online");
        assertEquals(full, OfflineCopyMetadata.fromJson(new JSONObject(full.toJson().toString())));
        OfflineCopyMetadata sparse = new OfflineCopyMetadata("v", "T", "A", null, 0, null, 9, "download");
        OfflineCopyMetadata read = OfflineCopyMetadata.fromJson(new JSONObject(sparse.toJson().toString()));
        assertEquals(sparse, read);
        assertNull(read.album());
        assertNull(read.thumbnailUrl());
    }

    @Test public void picksTheWidestThumbnail() {
        assertEquals("https://large", OfflineCopyMetadata.largestThumbnail(details()));
        assertNull(OfflineCopyMetadata.largestThumbnail(VideoDetails.getDefaultInstance()));
    }

    @Test public void anOnlineRecordKeepsWhatTheDownloadKnewAndFillsTheRest() {
        OfflineCopyMetadata downloaded = new OfflineCopyMetadata("v", "Tag title", "Tag artist", "Album", 199_000,
                null, 1, OfflineCopyMetadata.SOURCE_DOWNLOAD);
        OfflineCopyMetadata online = OfflineCopyMetadata.online(downloaded, "v", details(), "Channel", 50);
        assertEquals("Tag title", online.title());
        assertEquals("Tag artist", online.artist());
        assertEquals("Album", online.album());
        assertEquals(199_000, online.durationMs());
        assertEquals("https://large", online.thumbnailUrl());
        assertEquals(50, online.storedAt());
        assertTrue(online.fromOnlineResponse());
        assertFalse(downloaded.fromOnlineResponse());
    }

    @Test public void anOnlineRecordWithoutAnEarlierOneUsesTheResponseDetails() {
        OfflineCopyMetadata online = OfflineCopyMetadata.online(null, "v", details(), "Channel", 50);
        assertEquals("Online title", online.title());
        assertEquals("Channel", online.artist());
        assertNull(online.album());
        assertEquals(200_000, online.durationMs());
    }

    @Test public void readsTheHeaderOfAnAlbumResponse() throws Exception {
        SourceHeader header = SourceHeader.read(new JSONObject("{\"header\":{\"musicResponsiveHeaderRenderer\":{"
                + "\"title\":{\"runs\":[{\"text\":\"Alb\"},{\"text\":\"um\"}]},"
                + "\"straplineTextOne\":{\"runs\":[{\"text\":\"The Artist\"}]},"
                + "\"subtitle\":{\"runs\":[{\"text\":\"Album\"},{\"text\":\" \\u2022 2020\"}]},"
                + "\"thumbnail\":{\"musicThumbnailRenderer\":{\"thumbnail\":{\"thumbnails\":["
                + "{\"url\":\"https://s\",\"width\":60},{\"url\":\"https://l\",\"width\":544}]}}}}}}"));
        assertEquals("Album", header.title());
        assertEquals("The Artist", header.subtitle());
        assertEquals("https://l", header.thumbnailUrl());
    }

    @Test public void theSubtitleFallsBackAndARowTitleIsNeverTheHeader() throws Exception {
        SourceHeader header = SourceHeader.read(new JSONObject("{\"contents\":["
                + "{\"musicPlaylistShelfRenderer\":{\"musicResponsiveListItemRenderer\":{"
                + "\"musicDetailHeaderRenderer\":{\"title\":{\"simpleText\":\"A song row\"}}}}},"
                + "{\"musicDetailHeaderRenderer\":{\"title\":{\"simpleText\":\"My playlist\"},"
                + "\"subtitle\":{\"simpleText\":\"Playlist\"}}}]}"));
        assertEquals("My playlist", header.title());
        assertEquals("Playlist", header.subtitle());
        assertEquals("", header.thumbnailUrl());
    }

    @Test public void aResponseWithoutATitleHasNoHeader() throws Exception {
        assertEquals(SourceHeader.EMPTY, SourceHeader.read(new JSONObject("{\"contents\":[]}")));
        assertFalse(SourceHeader.EMPTY.hasTitle());
    }
}
