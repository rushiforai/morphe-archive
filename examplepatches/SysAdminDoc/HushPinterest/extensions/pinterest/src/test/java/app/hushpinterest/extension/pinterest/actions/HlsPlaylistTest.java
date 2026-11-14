/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** #27: the playlists Pinterest streams a video with, read down to the files that make it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HlsPlaylistTest {
    static final String HASH = "05c5679a7e9f8b57325862006a4980e9";
    static final String FOLDER = "https://v1.pinimg.com/videos/iht/hls/05/c5/67/";
    static final URI MASTER = URI.create(FOLDER + HASH + ".m3u8");

    /** A 2026 pin's master playlist as the media host serves it, with the 720 variant moved up. */
    static final String MASTER_TEXT = "#EXTM3U\n#EXT-X-VERSION:6\n#EXT-X-INDEPENDENT-SEGMENTS\n\n"
            + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"audio1\",NAME=\"1\",AUTOSELECT=YES,URI=\"" + HASH + "_audio.m3u8\",CHANNELS=\"2\"\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=513832,AVERAGE-BANDWIDTH=406773,CODECS=\"avc1.64000D,mp4a.40.29\",RESOLUTION=234x416,FRAME-RATE=30,AUDIO=\"audio1\"\n"
            + HASH + "_240w.m3u8\n\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=2712552,AVERAGE-BANDWIDTH=2023012,CODECS=\"avc1.64001F,mp4a.40.29\",RESOLUTION=720x1280,FRAME-RATE=30,AUDIO=\"audio1\"\n"
            + HASH + "_720w.m3u8\n\n"
            + "#EXT-X-STREAM-INF:BANDWIDTH=2022912,AVERAGE-BANDWIDTH=1538319,CODECS=\"avc1.64001F,mp4a.40.29\",RESOLUTION=648x1152,FRAME-RATE=30,AUDIO=\"audio1\"\n"
            + HASH + "_640w.m3u8\n";

    /** Its 720 variant: byte ranges of one fragmented MP4 after the initialization range. */
    static final String VARIANT_TEXT = "#EXTM3U\n#EXT-X-TARGETDURATION:3\n#EXT-X-VERSION:6\n#EXT-X-MEDIA-SEQUENCE:1\n"
            + "#EXT-X-PLAYLIST-TYPE:VOD\n#EXT-X-INDEPENDENT-SEGMENTS\n"
            + "#EXT-X-MAP:URI=\"" + HASH + "_720w.cmfv\",BYTERANGE=\"977@0\"\n"
            + "#EXTINF:2\n#EXT-X-BYTERANGE:372875@1377\n" + HASH + "_720w.cmfv\n"
            + "#EXTINF:2\n#EXT-X-BYTERANGE:492598@374252\n" + HASH + "_720w.cmfv\n"
            + "#EXTINF:1.2\n#EXT-X-BYTERANGE:337303@866850\n" + HASH + "_720w.cmfv\n\n#EXT-X-ENDLIST\n";

    /** Its sound, the same way. */
    static final String AUDIO_TEXT = "#EXTM3U\n#EXT-X-TARGETDURATION:3\n#EXT-X-VERSION:6\n#EXT-X-PLAYLIST-TYPE:VOD\n"
            + "#EXT-X-MAP:URI=\"" + HASH + "_audio.cmfa\",BYTERANGE=\"881@0\"\n"
            + "#EXTINF:2\n#EXT-X-BYTERANGE:16110@1281\n" + HASH + "_audio.cmfa\n"
            + "#EXTINF:2\n#EXT-X-BYTERANGE:16061@17391\n" + HASH + "_audio.cmfa\n#EXT-X-ENDLIST\n";

    @Test public void theMasterGivesTheHighestBandwidthVariantAndItsSound() {
        assertTrue(HlsPlaylist.playlist(MASTER_TEXT));
        assertTrue(HlsPlaylist.master(MASTER_TEXT));
        HlsPlaylist.Choice best = HlsPlaylist.best(MASTER, MASTER_TEXT);
        assertEquals(URI.create(FOLDER + HASH + "_720w.m3u8"), best.media);
        assertEquals(URI.create(FOLDER + HASH + "_audio.m3u8"), best.audio);
        assertTrue(HlsPlaylist.parts(MASTER, MASTER_TEXT).isEmpty());
    }

    @Test public void aFragmentedVariantIsOneFileAndItsSoundAnother() {
        URI variant = URI.create(FOLDER + HASH + "_720w.m3u8");
        assertFalse(HlsPlaylist.master(VARIANT_TEXT));
        assertEquals(Collections.singletonList(URI.create(FOLDER + HASH + "_720w.cmfv")), HlsPlaylist.parts(variant, VARIANT_TEXT));
        URI sound = URI.create(FOLDER + HASH + "_audio.m3u8");
        assertEquals(Collections.singletonList(URI.create(FOLDER + HASH + "_audio.cmfa")), HlsPlaylist.parts(sound, AUDIO_TEXT));
    }

    @Test public void anOlderPinsPiecesComeInOrder() {
        // A 2021 pin: MPEG-TS pieces with the sound inside, and no audio group.
        URI master = URI.create("https://v1.pinimg.com/videos/mc/hls/4e/2a/1c/4e2a1c.m3u8");
        String text = "#EXTM3U\n#EXT-X-VERSION:3\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=1200000,RESOLUTION=540x960\n4e2a1c_540w.m3u8\n"
                + "#EXT-X-STREAM-INF:BANDWIDTH=2400000,RESOLUTION=720x1280\nhttps://v1.pinimg.com/videos/mc/hls/4e/2a/1c/4e2a1c_720w.m3u8\n";
        HlsPlaylist.Choice best = HlsPlaylist.best(master, text);
        assertEquals(URI.create("https://v1.pinimg.com/videos/mc/hls/4e/2a/1c/4e2a1c_720w.m3u8"), best.media);
        assertNull(best.audio);
        String variant = "#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-TARGETDURATION:6\n#EXT-X-KEY:METHOD=NONE\n"
                + "#EXTINF:6.0,\n4e2a1c_720w00000.ts\n#EXTINF:6.0,\n4e2a1c_720w00001.ts\n"
                + "#EXTINF:6.0,\n4e2a1c_720w00002.ts\n#EXTINF:2.4,\n4e2a1c_720w00003.ts\n#EXT-X-ENDLIST\n";
        List<URI> parts = HlsPlaylist.parts(best.media, variant);
        assertEquals(4, parts.size());
        for (int i = 0; i < 4; i++) {
            assertEquals(URI.create("https://v1.pinimg.com/videos/mc/hls/4e/2a/1c/4e2a1c_720w0000" + i + ".ts"), parts.get(i));
        }
    }

    @Test public void aSeparateInitializationFileGoesFirst() {
        URI variant = URI.create(FOLDER + "v.m3u8");
        String text = "#EXTM3U\n#EXT-X-MAP:URI=\"init.mp4\"\n#EXTINF:2,\nseg1.m4s\n#EXTINF:2,\nseg2.m4s\n#EXT-X-ENDLIST\n";
        assertEquals(Arrays.asList(URI.create(FOLDER + "init.mp4"), URI.create(FOLDER + "seg1.m4s"), URI.create(FOLDER + "seg2.m4s")),
                HlsPlaylist.parts(variant, text));
    }

    @Test public void aPlaylistPuttingTheFilesEndToEndCantFollowIsntRead() {
        URI variant = URI.create(FOLDER + "v.m3u8");
        String head = "#EXTM3U\n#EXT-X-TARGETDURATION:2\n";
        // Still being streamed: no end.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXTINF:2,\na.ts\n").isEmpty());
        // Encrypted.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXT-X-KEY:METHOD=AES-128,URI=\"key\"\n#EXTINF:2,\na.ts\n#EXT-X-ENDLIST\n").isEmpty());
        assertTrue(HlsPlaylist.parts(variant, head + "#EXT-X-KEY:METHOD=SAMPLE-AES,URI=\"key\"\n#EXTINF:2,\na.ts\n#EXT-X-ENDLIST\n").isEmpty());
        // A part off the media host.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXTINF:2,\na.ts\n#EXTINF:2,\nhttps://outside.example/b.ts\n#EXT-X-ENDLIST\n").isEmpty());
        // Back to a file it left.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXTINF:2,\na.ts\n#EXTINF:2,\nb.ts\n#EXTINF:2,\na.ts\n#EXT-X-ENDLIST\n").isEmpty());
        // A second, different initialization, or one after the parts began.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXT-X-MAP:URI=\"i1.mp4\"\n#EXTINF:2,\na.m4s\n#EXT-X-MAP:URI=\"i2.mp4\"\n#EXTINF:2,\nb.m4s\n#EXT-X-ENDLIST\n").isEmpty());
        assertTrue(HlsPlaylist.parts(variant, head + "#EXTINF:2,\na.m4s\n#EXT-X-MAP:URI=\"i1.mp4\"\n#EXTINF:2,\nb.m4s\n#EXT-X-ENDLIST\n").isEmpty());
        // No parts, or not a playlist at all.
        assertTrue(HlsPlaylist.parts(variant, head + "#EXT-X-ENDLIST\n").isEmpty());
        assertTrue(HlsPlaylist.parts(variant, "<html><body>Not found</body></html>").isEmpty());
        assertFalse(HlsPlaylist.playlist("<html>#EXTM3U</html>"));
        assertTrue(HlsPlaylist.playlist("\r\n#EXTM3U\r\n#EXT-X-ENDLIST\r\n"));

        StringBuilder many = new StringBuilder(head);
        for (int i = 0; i <= HlsPlaylist.MOST_PARTS; i++) many.append("#EXTINF:1,\np").append(i).append(".ts\n");
        assertTrue(HlsPlaylist.parts(variant, many.append("#EXT-X-ENDLIST\n").toString()).isEmpty());
    }

    @Test public void theSoundIsTheGroupsDefaultElseItsFirst() {
        String variant = "#EXT-X-STREAM-INF:BANDWIDTH=1,AUDIO=\"a\"\nv.m3u8\n";
        String text = "#EXTM3U\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"en\",URI=\"en.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"main\",DEFAULT=YES,URI=\"main.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"de\",URI=\"de.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"b\",NAME=\"other\",DEFAULT=YES,URI=\"other.m3u8\"\n" + variant;
        assertEquals(URI.create(FOLDER + "main.m3u8"), HlsPlaylist.best(MASTER, text).audio);
        String noDefault = "#EXTM3U\n#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"en\",URI=\"en.m3u8\"\n"
                + "#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"de\",URI=\"de.m3u8\"\n" + variant;
        assertEquals(URI.create(FOLDER + "en.m3u8"), HlsPlaylist.best(MASTER, noDefault).audio);
        // A group with no playlist of its own: the sound is inside the variant.
        String inside = "#EXTM3U\n#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"en\",DEFAULT=YES\n" + variant;
        HlsPlaylist.Choice carried = HlsPlaylist.best(MASTER, inside);
        assertEquals(URI.create(FOLDER + "v.m3u8"), carried.media);
        assertNull(carried.audio);
        // Sound somewhere other than the media host isn't fetched, so the video isn't either.
        String elsewhere = "#EXTM3U\n#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID=\"a\",NAME=\"en\",URI=\"https://outside.example/en.m3u8\"\n" + variant;
        assertNull(HlsPlaylist.best(MASTER, elsewhere));
        // A variant off the media host isn't chosen.
        assertNull(HlsPlaylist.best(MASTER, "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=9\nhttps://outside.example/v.m3u8\n"));
        assertNull(HlsPlaylist.best(MASTER, "not a playlist"));
    }

    @Test public void attributesAndTypesReadAsTheSpecWritesThem() {
        Map<String, String> tags = HlsPlaylist.attributes(
                "BANDWIDTH=2712552,CODECS=\"avc1.64001F,mp4a.40.29\",RESOLUTION=720x1280,AUDIO=\"audio1\"");
        assertEquals("2712552", tags.get("BANDWIDTH"));
        assertEquals("avc1.64001F,mp4a.40.29", tags.get("CODECS"));
        assertEquals("720x1280", tags.get("RESOLUTION"));
        assertEquals("audio1", tags.get("AUDIO"));
        assertTrue(HlsPlaylist.type("application/vnd.apple.mpegurl"));
        assertTrue(HlsPlaylist.type("application/x-mpegURL; charset=UTF-8"));
        assertTrue(HlsPlaylist.type("audio/mpegurl"));
        assertFalse(HlsPlaylist.type("text/html"));
        assertFalse(HlsPlaylist.type(null));
        assertTrue(InAppDownloads.partType("video/mp4"));
        assertTrue(InAppDownloads.partType("audio/mp4"));
        assertTrue(InAppDownloads.partType("video/MP2T"));
        assertFalse(InAppDownloads.partType("text/html"));
        assertFalse(InAppDownloads.partType(null));
    }
}
