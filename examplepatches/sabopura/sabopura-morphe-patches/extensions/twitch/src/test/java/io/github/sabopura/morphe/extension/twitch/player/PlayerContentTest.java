package io.github.sabopura.morphe.extension.twitch.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PlayerContentTest {
    private static final String FOLDER = "/6a87209cc7e6_somebody_316709179505_1794618002";

    /** A VOD's master playlist as Twitch 31.9.0 hands it to the player. */
    private static String vod(String servingId, String folder) {
        return "#EXTM3U\n"
                + "#EXT-X-TWITCH-INFO:ORIGIN=\"s3\",SERVING-ID=\"" + servingId + "\",CLUSTER=\"cloudfront_vod\"\n"
                + "#EXT-X-MEDIA:TYPE=VIDEO,GROUP-ID=\"chunked\",NAME=\"1080p60\",AUTOSELECT=YES,DEFAULT=YES\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=6000000,CODECS=\"avc1.64002A,mp4a.40.2\",VIDEO=\"chunked\"\n"
                + "https://d3vd9lfkzbru3h.cloudfront.net" + folder + "/chunked/index-dvr.m3u8?sig=abc\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=1380233,VIDEO=\"480p30\"\n"
                + "https://d3vd9lfkzbru3h.cloudfront.net" + folder + "/480p30/index-dvr.m3u8\n";
    }

    @Test
    public void aPlaylistsTextIsToldFromAUrl() {
        assertTrue(PlayerContent.isPlaylist(vod("a", FOLDER)));
        assertTrue(PlayerContent.isPlaylist("﻿\n #EXTM3U\n"));
        assertFalse(PlayerContent.isPlaylist("https://usher.ttvnw.net/vod/123.m3u8?nauth=x"));
        assertFalse(PlayerContent.isPlaylist(""));
    }

    @Test
    public void theSameVodFetchedAgainHasTheSameName() {
        String name = PlayerContent.playlistName(vod("first", FOLDER));
        assertEquals(name, PlayerContent.playlistName(vod("second", FOLDER)));
        assertEquals("playlist:" + FOLDER + "/chunked", name);
        assertTrue(PlayerContent.isPlaylistName(name));
    }

    @Test
    public void anotherVodHasAnotherName() {
        assertNotEquals(PlayerContent.playlistName(vod("a", FOLDER)),
                PlayerContent.playlistName(vod("a", "/0b12_somebody_316709179506_1794700000")));
    }

    @Test
    public void aPlaylistWithoutRenditionsOrFoldersStillHasAName() {
        assertEquals("playlist:", PlayerContent.playlistName("#EXTM3U\n#EXT-X-ENDLIST\n"));
        assertEquals("playlist:", PlayerContent.playlistName("#EXTM3U\nindex.m3u8\n"));
        assertEquals("playlist:/a/b", PlayerContent.playlistName("#EXTM3U\r\n/a/b/index.m3u8\r\n"));
    }

    /** A live stream's master playlist: every rendition comes from the same path, under a token. */
    private static String live(String token) {
        return "#EXTM3U\n"
                + "#EXT-X-TWITCH-INFO:NODE=\"video-edge.tyo05\",MANIFEST-NODE-TYPE=\"weaver_cluster\",STREAM-TIME=\"120.5\"\n"
                + "#EXT-X-MEDIA:TYPE=VIDEO,GROUP-ID=\"chunked\",NAME=\"1080p60 (source)\",AUTOSELECT=YES,DEFAULT=YES\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=6000000,CODECS=\"avc1.64002A,mp4a.40.2\",VIDEO=\"chunked\"\n"
                + "https://video-weaver.tyo05.hls.ttvnw.net/v1/playlist/" + token + ".m3u8\n";
    }

    @Test
    public void aLiveStreamsPlaylistIsNotTakenForARecording() {
        // After a VOD, the live stream opened next used to show the VOD's chapters and chat offset.
        String name = PlayerContent.playlistName(live("CpAFtokenA"));
        assertTrue(PlayerContent.isPlaylistName(name));
        assertFalse(PlayerContent.isRecordingName(name));
        assertEquals(name, PlayerContent.playlistName(live("CpAFtokenB")));
        assertTrue(PlayerContent.isRecordingName(PlayerContent.playlistName(vod("a", FOLDER))));
        assertFalse(PlayerContent.isRecordingName("/vod/123.m3u8"));
        assertFalse(PlayerContent.isRecordingName(""));
    }

    @Test
    public void aUrlPathIsNotAPlaylistName() {
        assertFalse(PlayerContent.isPlaylistName("/vod/123.m3u8"));
        assertFalse(PlayerContent.isPlaylistName(""));
    }
}
