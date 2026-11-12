/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ByteRange;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;

public class VideoCopyLogicTest {
    private static final String MP4 = "video/mp4; codecs=\"avc1.42001E, mp4a.40.2\"";
    private static final String AVC = "video/mp4; codecs=\"avc1.4D401E\"";
    private static final String VP9 = "video/webm; codecs=\"vp9\"";
    private static final String AV1 = "video/mp4; codecs=\"av01.0.01M.08\"";
    private static final String OPUS = "audio/webm; codecs=\"opus\"";

    private static Format.Builder muxed() {
        return Format.newBuilder().setItag(18).setMimeType(MP4).setUrl("https://example.invalid/v").setBitrate(444226);
    }

    /** A downloadable adaptive format: a plain url, a length, an lmt and the init and index ranges. */
    private static Format.Builder adaptive(int itag, String mime, long length) {
        return Format.newBuilder().setItag(itag).setMimeType(mime).setUrl("https://example.invalid/" + itag)
                .setContentLength(length).setLastModified(1_766_960_771_651_324L)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(9))
                .setIndexRange(ByteRange.newBuilder().setStart(10).setEnd(19));
    }

    private static PlayerResponse response(Format... adaptive) {
        StreamingData.Builder streaming = StreamingData.newBuilder().addFormats(muxed());
        for (Format format : adaptive) streaming.addAdaptiveFormats(format);
        return PlayerResponse.newBuilder().setStreamingData(streaming).build();
    }

    @Test public void theSupportedVideoStreamsAreTheThree360pOnesOfTheirContainer() {
        assertTrue(VideoCopyLogic.supportedVideo(134, AVC));
        assertTrue(VideoCopyLogic.supportedVideo(243, VP9));
        assertTrue(VideoCopyLogic.supportedVideo(396, AV1));
        assertFalse(VideoCopyLogic.supportedVideo(134, VP9));
        assertFalse(VideoCopyLogic.supportedVideo(243, AVC));
        assertFalse(VideoCopyLogic.supportedVideo(137, AVC));
        assertFalse(VideoCopyLogic.supportedVideo(18, MP4));
        assertFalse(VideoCopyLogic.supportedVideo(134, null));
    }

    @Test public void theAvcStreamIsPreferredThenVp9ThenAv1() {
        Format audio = adaptive(251, OPUS, 3_433_755).build();
        Format avc = adaptive(134, AVC, 8_390_921).build();
        Format vp9 = adaptive(243, VP9, 6_014_765).build();
        Format av1 = adaptive(396, AV1, 5_685_561).build();

        VideoCopyLogic.Selection all = VideoCopyLogic.select(response(av1, vp9, avc, audio), DownloadQuality.HIGHEST);
        assertEquals(134, all.video().getItag());
        assertEquals(251, all.audio().getItag());
        assertEquals(8_390_921 + 3_433_755, all.bytes());
        assertEquals(243, VideoCopyLogic.select(response(av1, vp9, audio), DownloadQuality.HIGHEST).video().getItag());
        assertEquals(396, VideoCopyLogic.select(response(av1, audio), DownloadQuality.HIGHEST).video().getItag());
    }

    @Test public void aCopyNeedsBothStreamsWithPlainUrlsLengthsAndRanges() {
        Format audio = adaptive(251, OPUS, 100).build();
        Format avc = adaptive(134, AVC, 100).build();

        assertNull(VideoCopyLogic.select(response(avc), DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(audio), DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(adaptive(134, AVC, 100).clearUrl().build(), audio),
                DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(adaptive(134, AVC, 0).build(), audio), DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(adaptive(134, AVC, 100).clearInitRange().build(), audio),
                DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(adaptive(134, AVC, 100).setIndexRange(
                ByteRange.newBuilder().setStart(50).setEnd(100)).build(), audio), DownloadQuality.HIGHEST));
        assertNull(VideoCopyLogic.select(response(avc, adaptive(251, OPUS, 100).clearUrl().build()),
                DownloadQuality.HIGHEST));
        assertNotNull(VideoCopyLogic.select(response(avc, adaptive(140, "audio/mp4; codecs=\"mp4a.40.2\"", 100)
                .build()), DownloadQuality.HIGHEST));
        assertNotNull(VideoCopyLogic.select(response(avc, audio), DownloadQuality.HIGHEST));
    }

    @Test public void theMuxedFormatOfAResponseIsNeitherSelectedNorTakenFromTheAdaptiveFormats() {
        Format audio = adaptive(251, OPUS, 100).build();
        Format avc = adaptive(134, AVC, 100).build();

        VideoCopyLogic.Selection withMuxed = VideoCopyLogic.select(response(avc, audio), DownloadQuality.HIGHEST);

        assertEquals(avc, withMuxed.video());
        assertEquals(audio, withMuxed.audio());
        assertEquals(withMuxed, VideoCopyLogic.select(PlayerResponse.newBuilder().setStreamingData(
                StreamingData.newBuilder().addAdaptiveFormats(avc).addAdaptiveFormats(audio)).build(),
                DownloadQuality.HIGHEST));
    }

    @Test public void aStoredCopyYieldsItsTwoFormatsByItag() {
        Format audio = adaptive(251, OPUS, 100).clearUrl().build();
        Format avc = adaptive(134, AVC, 200).clearUrl().build();
        PlayerResponse stored = response(avc, adaptive(140, "audio/mp4", 5).build(), audio);

        VideoCopyLogic.Stored formats = VideoCopyLogic.stored(stored, 134, 251);

        assertEquals(avc, formats.video());
        assertEquals(audio, formats.audio());
        assertNull(VideoCopyLogic.stored(stored, 243, 251));
    }

    @Test public void theOnlineUrlIsAFallbackOnlyForTheSameStream() {
        Format stored = adaptive(134, AVC, 100).clearUrl().build();

        assertEquals("https://example.invalid/134",
                VideoCopyLogic.fallbackUrl(stored, adaptive(134, AVC, 100).build()));
        assertNull(VideoCopyLogic.fallbackUrl(stored, adaptive(134, AVC, 101).build()));
        assertNull(VideoCopyLogic.fallbackUrl(stored, adaptive(134, AVC, 100).setLastModified(5).build()));
        assertNull(VideoCopyLogic.fallbackUrl(stored, adaptive(243, VP9, 100).build()));
        assertNull(VideoCopyLogic.fallbackUrl(stored, adaptive(134, AVC, 100).clearUrl().build()));
        assertNull(VideoCopyLogic.fallbackUrl(stored, null));
    }

    @Test public void everyAudioQualityKeepsTheSame360pVideoAndItsOwnCodecAndRanges() {
        Format video = adaptive(134, AVC, 2000).build();
        PlayerResponse response = response(video, adaptive(141, "audio/mp4; codecs=\"mp4a.40.2\"", 1000).build(),
                adaptive(251, OPUS, 900).build(),
                adaptive(140, "audio/mp4; codecs=\"mp4a.40.2\"", 800).build(),
                adaptive(139, "audio/mp4; codecs=\"mp4a.40.5\"", 300).build());
        int[] expected = {141, 251, 140, 139};
        for (DownloadQuality quality : DownloadQuality.values()) {
            VideoCopyLogic.Selection selected = VideoCopyLogic.select(response, quality);
            assertEquals(video, selected.video());
            assertEquals(expected[quality.ordinal()], selected.audio().getItag());
            Format local = VideoCopyLogic.local(selected.audio(), "local", selected.audio().getContentLength(), 1000);
            assertEquals(selected.audio().getMimeType(), local.getMimeType());
            assertEquals(selected.audio().getIndexRange(), local.getIndexRange());
        }
    }

    @Test public void fallbackNeverServesAnotherCodecUnderTheStoredDescriptor() {
        Format saved = adaptive(140, "audio/mp4; codecs=\"mp4a.40.2\"", 100).build();
        assertNull(VideoCopyLogic.fallbackUrl(saved, saved.toBuilder().setMimeType(OPUS).build()));
    }

    @Test public void theCopyIsAnnouncedWithTheLocalTokenTheRealLengthAndTheCopysDuration() {
        Format local = VideoCopyLogic.local(adaptive(134, AVC, 1).clearUrl().build(), "http://127.0.0.1:1/rvx",
                8_390_921, 213_000);

        assertEquals("http://127.0.0.1:1/rvx", local.getUrl());
        assertEquals(8_390_921, local.getContentLength());
        assertEquals(213_000, local.getApproxDurationMs());
        assertEquals(134, local.getItag());
        assertEquals(AVC, local.getMimeType());
        assertEquals(9, local.getInitRange().getEnd());
        assertEquals(19, local.getIndexRange().getEnd());
    }

    @Test public void aDurationTheFormatAlreadyHasIsKept() {
        Format local = VideoCopyLogic.local(muxed().setApproxDurationMs(213_400).build(), "t", 10, 99_000);

        assertEquals(213_400, local.getApproxDurationMs());
    }

    @Test public void theOnlineLengthMustMatchTheCopyOrBeUnknown() {
        assertTrue(VideoCopyLogic.sameLength(213, 213_000));
        assertTrue(VideoCopyLogic.sameLength(216, 213_000));
        assertFalse(VideoCopyLogic.sameLength(217, 213_000));
        assertTrue(VideoCopyLogic.sameLength(0, 213_000));
        assertTrue(VideoCopyLogic.sameLength(213, 0));
    }

    @Test public void theCopyNeedsItsLengthPlusTheReserveFree() {
        long reserve = VideoCopyLogic.MIN_FREE_BYTES_AFTER;

        assertTrue(VideoCopyLogic.hasRoomFor(reserve + 11_824_676, 11_824_676));
        assertFalse(VideoCopyLogic.hasRoomFor(reserve + 11_824_675, 11_824_676));
    }

    @Test public void theFinishedTextNamesTheVideosOnlyWhenTheListHasSome() {
        assertEquals("morphe_music_playlist_stream_complete", VideoCopyLogic.completionKey(5, 0, 0));
        assertEquals("morphe_music_playlist_stream_complete_videos", VideoCopyLogic.completionKey(5, 2, 3));
        assertEquals("morphe_music_playlist_stream_complete_videos", VideoCopyLogic.completionKey(0, 2, 3));
        assertEquals("morphe_music_playlist_stream_complete_videos", VideoCopyLogic.completionKey(5, 0, 3));
    }

    @Test public void aListIsAlreadySavedOnlyWhenNeitherAudioNorVideoWasSavedNow() {
        assertEquals("morphe_music_playlist_stream_already_saved", VideoCopyLogic.completionKey(0, 0, 0));
        assertEquals("morphe_music_playlist_stream_already_saved_videos", VideoCopyLogic.completionKey(0, 0, 3));
    }

    @Test public void onlyTheFormatThisBuildStoresIsCurrent() {
        assertTrue(VideoCopyLogic.currentFormat(VideoCopyLogic.COPY_FORMAT));
        assertFalse(VideoCopyLogic.currentFormat(0));
        assertFalse(VideoCopyLogic.currentFormat(VideoCopyLogic.COPY_FORMAT - 1));
    }
}
