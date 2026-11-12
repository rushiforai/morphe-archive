/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.io.File;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ByteRange;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.MediaCommonConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlaybackRoutingConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class StreamSwapLogicTest {
    private static final String MIME = "audio/webm; codecs=\"opus\"";

    private RawAudioFiles.Entry raw() {
        return new RawAudioFiles.Entry(new File("track.251"), 251, MIME, 1000, 123, "muxed", "digest");
    }

    private Format.Builder audio() {
        return Format.newBuilder().setItag(251).setMimeType(MIME).setContentLength(1000).setLastModified(123)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(99))
                .setIndexRange(ByteRange.newBuilder().setStart(100).setEnd(199));
    }

    private PlayerResponse.Builder online() {
        return PlayerResponse.newBuilder().setVideoDetails(VideoDetails.newBuilder().setLengthSeconds(200))
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(audio()));
    }

    @Test public void onlyAWorkerThreadIsRequired() {
        assertNull(StreamSwapLogic.gate(false));
        assertNotNull(StreamSwapLogic.gate(true));
    }

    @Test public void exactOriginalStreamCanSwap() {
        assertNull(StreamSwapLogic.mismatch(raw(), audio().build(), online().build()));
    }

    @Test public void aacAndPremiumCopiesSwapOnlyWithTheirOwnExactDescriptors() {
        for (int itag : new int[]{139, 140, 141, 249, 250, 251, 774}) {
            String mime = itag == 139 ? "audio/mp4; codecs=\"mp4a.40.5\""
                    : itag < 200 ? "audio/mp4; codecs=\"mp4a.40.2\"" : MIME;
            RawAudioFiles.Entry copy = new RawAudioFiles.Entry(new File("track." + itag),
                    itag, mime, 1000, 123, null, "digest");
            Format selected = audio().setItag(itag).setMimeType(mime).build();
            assertNull(StreamSwapLogic.mismatch(copy, selected, online().build()));
            assertNotNull(StreamSwapLogic.mismatch(copy,
                    selected.toBuilder().setContentLength(1001).build(), online().build()));
        }
    }

    @Test public void anOnlineResponseMissingTheSavedTierUsesTheSavedCodecRangesAndBytesOnly() {
        String aac = "audio/mp4; codecs=\"mp4a.40.5\"";
        RawAudioFiles.Entry copy = new RawAudioFiles.Entry(new File("track.139"), 139, aac, 1000, 123, null, "d");
        Format downloaded = audio().setItag(139).setMimeType(aac).build();
        PlayerResponse live = online().setVideoDetails(VideoDetails.newBuilder()
                .setVideoId("track").setLengthSeconds(200)).build();
        PlayerResponse saved = live.toBuilder().setStreamingData(StreamingData.newBuilder()
                .addAdaptiveFormats(downloaded)).build();
        Format selected = StreamSwapLogic.savedAudio("track", copy, live, saved);
        assertEquals(downloaded, selected);
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(live, selected);
        assertEquals(139, swapped.getStreamingData().getAdaptiveFormats(0).getItag());
        assertEquals(aac, swapped.getStreamingData().getAdaptiveFormats(0).getMimeType());
        assertEquals(downloaded.getInitRange(), swapped.getStreamingData().getAdaptiveFormats(0).getInitRange());
        assertEquals(live.getVideoDetails(), swapped.getVideoDetails());
        assertNull(VideoCopyLogic.fallbackUrl(selected, audio().setUrl("https://example.invalid/251").build()));
        assertNull(StreamSwapLogic.savedAudio("track", copy, live, null));
        assertNull(StreamSwapLogic.savedAudio("track", copy, live, saved.toBuilder()
                .setVideoDetails(saved.getVideoDetails().toBuilder().setVideoId("other")).build()));
        assertNull(StreamSwapLogic.savedAudio("track", copy, live, saved.toBuilder()
                .setStreamingData(saved.getStreamingData().toBuilder().setAdaptiveFormats(0,
                        downloaded.toBuilder().setLastModified(124))).build()));
    }

    /** The 9.40.51 SABR shape from device round P1: empty Format.url, routing URL in StreamingData field 15. */
    @Test public void sabrFormatWithoutUrlSwapsAndDropsTheSabrRoute() {
        Format audio = audio().build();
        PlayerResponse online = online().setStreamingData(StreamingData.newBuilder()
                .setServerAbrStreamingUrl("https://example.invalid/sabr").addAdaptiveFormats(audio)).build();
        assertEquals("", audio.getUrl());
        assertNull(StreamSwapLogic.mismatch(raw(), audio, online));
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(online,
                audio.toBuilder().setUrl("http://127.0.0.1:1/rvx").build());
        assertFalse(swapped.getStreamingData().hasServerAbrStreamingUrl());
        assertEquals("http://127.0.0.1:1/rvx", swapped.getStreamingData().getAdaptiveFormats(0).getUrl());
    }

    @Test public void onlyUsableHttpsUrlsAreKeptAsOptionalFallbacks() {
        assertNull(StreamSwapLogic.onlineUrl(null));
        assertNull(StreamSwapLogic.onlineUrl(""));
        assertNull(StreamSwapLogic.onlineUrl("   "));
        assertNull(StreamSwapLogic.onlineUrl("https://"));
        assertNull(StreamSwapLogic.onlineUrl("not a URL"));
        assertNull(StreamSwapLogic.onlineUrl("http://example.invalid/audio"));
        assertEquals("https://example.invalid/audio", StreamSwapLogic.onlineUrl("https://example.invalid/audio"));
    }

    @Test public void lengthAndLastModifiedMustBePresentAndExact() {
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().clearContentLength().build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setContentLength(999).build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().clearLastModified().build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setLastModified(124).build(), online().build()));
    }

    @Test public void otherFormatsAndMimeTypesStayOnline() {
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setItag(140).build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setMimeType("audio/mp4").build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setMimeType("video/webm").build(), online().build()));
        RawAudioFiles.Entry otherItag = new RawAudioFiles.Entry(raw().file(), 140, MIME, 1000, 123, "m", "d");
        assertNotNull(StreamSwapLogic.mismatch(otherItag, audio().build(), online().build()));
        RawAudioFiles.Entry otherMime = new RawAudioFiles.Entry(raw().file(), 251, "audio/ogg", 1000, 123, "m", "d");
        assertNotNull(StreamSwapLogic.mismatch(otherMime, audio().build(), online().build()));
    }

    @Test public void liveAndSegmentedContentStaysOnline() {
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().build(), online()
                .setVideoDetails(VideoDetails.newBuilder()).build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().build(), online()
                .setStreamingData(StreamingData.newBuilder().setHlsManifestUrl("https://example/hls")).build()));
    }

    @Test public void rangesMustDescribeTheSavedBytes() {
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().clearInitRange().build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().clearIndexRange().build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setIndexRange(ByteRange.newBuilder()
                .setStart(100).setEnd(1000)).build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setInitRange(ByteRange.newBuilder()
                .setStart(-1).setEnd(99)).build(), online().build()));
        assertNotNull(StreamSwapLogic.mismatch(raw(), audio().setInitRange(ByteRange.newBuilder()
                .setStart(99).setEnd(98)).build(), online().build()));
    }

    @Test public void stockGuardPredicateRemainsAnExactHostMatch() {
        assertTrue(StreamSwapLogic.isGuardedHost("127.0.0.1"));
        assertTrue(StreamSwapLogic.isGuardedHost("localhost"));
        assertFalse(StreamSwapLogic.isGuardedHost("127.0.0.2"));
        assertFalse(StreamSwapLogic.isGuardedHost("localhost.example"));
        assertFalse(StreamSwapLogic.isGuardedHost(null));
    }

    @Test public void aTokenUrlKeepsTheLoopbackHostAndNamesTheStream() {
        assertEquals("http://127.0.0.1:1/rvx?v=clip&i=134&m=video&t=key",
                StreamSwapLogic.tokenUrl("clip", 134, "video", "key"));
        assertTrue(StreamSwapLogic.isGuardedHost("127.0.0.1"));
    }

    private static final String MP4 = "video/mp4; codecs=\"avc1.42001E, mp4a.40.2\"";

    private Format.Builder muxed() {
        return Format.newBuilder().setItag(18).setMimeType(MP4).setUrl("http://127.0.0.1:1/rvx")
                .setContentLength(11_829_048);
    }

    /** The 9.40.51 shape of a music video: SABR route, adaptive formats and the request hints that force SABR. */
    private PlayerResponse sabrVideo() {
        return PlayerResponse.newBuilder()
                .setVideoDetails(VideoDetails.newBuilder().setVideoId("clip").setLengthSeconds(213))
                .setStreamingData(StreamingData.newBuilder().setExpiresInSeconds(21_540)
                        .setServerAbrStreamingUrl("https://example.invalid/sabr")
                        .setHlsManifestUrl("https://example.invalid/hls")
                        .addAdaptiveFormats(audio()).addAdaptiveFormats(Format.newBuilder().setItag(137)))
                .setPlayerConfig(PlayerConfig.newBuilder().setMediaCommonConfig(MediaCommonConfig.newBuilder()
                        .setEnableSabr(true)).setPlaybackRoutingConfig(PlaybackRoutingConfig.newBuilder()
                        .setPreferredEngine(3)))
                .build();
    }

    private Format.Builder video() {
        return Format.newBuilder().setItag(134).setMimeType("video/mp4; codecs=\"avc1.4D401E\"")
                .setUrl("http://127.0.0.1:1/rvx?v=clip&i=134&m=video&t=a").setContentLength(8_390_921);
    }

    private Format.Builder videoAudio() {
        return audio().setUrl("http://127.0.0.1:1/rvx?v=clip&i=251&m=vaudio&t=b");
    }

    @Test public void theVideoResponseExposesExactlyTheTwoStreamsOfTheCopyAndNoMuxedFormat() {
        PlayerResponse online = sabrVideo().toBuilder().setStreamingData(sabrVideo().getStreamingData().toBuilder()
                .addFormats(muxed())).build();

        PlayerResponse swapped = StreamSwapLogic.replacePair(online, video().build(), videoAudio().build());

        StreamingData streaming = swapped.getStreamingData();
        assertEquals(2, streaming.getAdaptiveFormatsCount());
        assertEquals(134, streaming.getAdaptiveFormats(0).getItag());
        assertEquals(251, streaming.getAdaptiveFormats(1).getItag());
        assertEquals("video/mp4; codecs=\"avc1.4D401E\"", streaming.getAdaptiveFormats(0).getMimeType());
        assertEquals(0, streaming.getFormatsCount());
        assertFalse(streaming.hasServerAbrStreamingUrl());
        assertFalse(streaming.hasHlsManifestUrl());
        assertEquals(21_540, streaming.getExpiresInSeconds());
    }

    @Test public void theVideoResponseDropsTheRequestHintsThatForceSabrAndKeepsTheRest() {
        PlayerResponse swapped = StreamSwapLogic.replacePair(sabrVideo(), video().build(), videoAudio().build());

        assertFalse(swapped.getPlayerConfig().hasMediaCommonConfig());
        assertFalse(swapped.getPlayerConfig().hasPlaybackRoutingConfig());
        assertEquals("clip", swapped.getVideoDetails().getVideoId());
        assertEquals(213, swapped.getVideoDetails().getLengthSeconds());
    }

    @Test public void aStoredVideoResponseKeepsItsEngineFlagsThroughTheSwap() {
        PlayerResponse stored = PlayerResponse.newBuilder()
                .setVideoDetails(VideoDetails.newBuilder().setVideoId("clip"))
                .setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(video().clearUrl())
                        .addAdaptiveFormats(audio()))
                .setPlayerConfig(OfflineResponseTrim.forExoPlayer(PlayerConfig.getDefaultInstance())).build();

        PlayerResponse swapped = StreamSwapLogic.replacePair(stored, video().build(), videoAudio().build());

        assertEquals("http://127.0.0.1:1/rvx?v=clip&i=134&m=video&t=a",
                swapped.getStreamingData().getAdaptiveFormats(0).getUrl());
        assertEquals(0, swapped.getStreamingData().getFormatsCount());
        assertTrue(swapped.getPlayerConfig().getExoPlayerConfig().getUseExoPlayer());
        assertTrue(swapped.getPlayerConfig().getAudioConfig().getExoAudioGate());
    }

    @Test public void theAudioSwapStillKeepsTheFormatsOutOfTheVideoField() {
        PlayerResponse swapped = StreamSwapLogic.replaceAudio(sabrVideo(), audio().build());

        assertEquals(0, swapped.getStreamingData().getFormatsCount());
        assertEquals(1, swapped.getStreamingData().getAdaptiveFormatsCount());
    }
}
