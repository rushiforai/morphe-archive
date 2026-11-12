/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-11.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ByteRange;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.StreamingData;

public class DownloadFormatsTest {
    private static final String OPUS = "audio/webm; codecs=\"opus\"";
    private static final String AAC = "audio/mp4; codecs=\"mp4a.40.2\"";
    private static final String HE_AAC = "audio/mp4; codecs=\"mp4a.40.5\"";

    private static Format format(int itag, String mime, int bitrate) {
        return Format.newBuilder().setItag(itag).setMimeType(mime).setBitrate(bitrate)
                .setUrl("https://example.invalid/" + itag).setContentLength(1000).setLastModified(123)
                .setInitRange(ByteRange.newBuilder().setStart(0).setEnd(99))
                .setIndexRange(ByteRange.newBuilder().setStart(100).setEnd(199)).build();
    }

    private static PlayerResponse adaptive(Format... formats) {
        StreamingData.Builder streaming = StreamingData.newBuilder();
        for (Format format : formats) streaming.addAdaptiveFormats(format);
        return PlayerResponse.newBuilder().setStreamingData(streaming).build();
    }

    private static int selected(PlayerResponse response, boolean copy, DownloadQuality quality) {
        return DownloadFormats.bestAudio(response, copy, quality).getItag();
    }

    @Test public void allFourChoicesSelectTheirSourceClassInBothDownloadMethods() {
        PlayerResponse response = adaptive(format(141, AAC, 256000), format(251, OPUS, 130000),
                format(140, AAC, 128000), format(139, HE_AAC, 48000));
        for (boolean copy : new boolean[]{false, true}) {
            assertEquals(141, selected(response, copy, DownloadQuality.HIGHEST));
            assertEquals(251, selected(response, copy, DownloadQuality.HIGH));
            assertEquals(140, selected(response, copy, DownloadQuality.NORMAL));
            assertEquals(139, selected(response, copy, DownloadQuality.LOW));
        }
    }

    @Test public void highestUsesOfferedPremiumOpusAndDoesNotInventItWhenAbsent() {
        PlayerResponse premium = adaptive(format(251, OPUS, 170000), format(774, OPUS, 256000));
        assertEquals(774, selected(premium, true, DownloadQuality.HIGHEST));
        assertEquals(251, selected(premium, true, DownloadQuality.HIGH));
        assertEquals(251, selected(adaptive(format(251, OPUS, 130000)), true, DownloadQuality.HIGHEST));
    }

    @Test public void variableBitrateDoesNotChangeTheStandardHighClass() {
        PlayerResponse response = adaptive(format(140, AAC, 145000), format(251, OPUS, 101000));
        assertEquals(251, selected(response, true, DownloadQuality.HIGHEST));
        assertEquals(251, selected(response, true, DownloadQuality.HIGH));
        assertEquals(140, selected(response, true, DownloadQuality.NORMAL));
    }

    @Test public void absentTiersFallBackLowerFirstThenToTheNearestHigherClass() {
        PlayerResponse lower = adaptive(format(250, OPUS, 70000), format(249, OPUS, 50000));
        assertEquals(250, selected(lower, true, DownloadQuality.HIGH));
        assertEquals(250, selected(lower, true, DownloadQuality.NORMAL));
        assertEquals(249, selected(lower, true, DownloadQuality.LOW));
        PlayerResponse higher = adaptive(format(251, OPUS, 140000), format(140, AAC, 128000));
        assertEquals(140, selected(higher, true, DownloadQuality.LOW));
    }

    @Test public void laterClientOfferingTheRequestedTierOutranksTheFirstClientsFallback() {
        Format standard = format(251, OPUS, 170000);
        Format premium = format(141, AAC, 256000);
        assertTrue(DownloadFormats.compare(premium, standard, DownloadQuality.HIGHEST) > 0);
        assertTrue(DownloadFormats.compare(standard, premium, DownloadQuality.HIGH) > 0);
        assertTrue(DownloadFormats.compare(format(139, HE_AAC, 48000), standard, DownloadQuality.LOW) > 0);
    }

    @Test public void sameTierCodecChoiceAndClientOrderAreStableDespiteVariableBitrate() {
        Format first = format(774, OPUS, 290000).toBuilder().setAverageBitrate(270000).build();
        Format second = format(141, AAC, 270000).toBuilder().setAverageBitrate(240000).build();
        assertTrue(DownloadFormats.compare(second, first, DownloadQuality.HIGHEST) > 0);
        assertEquals(0, DownloadFormats.compare(first, first.toBuilder().setAverageBitrate(200000).build(),
                DownloadQuality.HIGHEST));
    }

    @Test public void onlyUnbeatableChoicesMaySkipLaterClientsUntilTheirUrlIsRejected() {
        assertTrue(DownloadFormats.isTopChoice(format(141, AAC, 256000), DownloadQuality.HIGHEST));
        assertFalse(DownloadFormats.isTopChoice(format(774, OPUS, 256000), DownloadQuality.HIGHEST));
        assertFalse(DownloadFormats.isTopChoice(format(251, OPUS, 130000), DownloadQuality.HIGHEST));
        assertTrue(DownloadFormats.isTopChoice(format(251, OPUS, 130000), DownloadQuality.HIGH));
        assertTrue(DownloadFormats.isTopChoice(format(140, AAC, 128000), DownloadQuality.NORMAL));
        assertTrue(DownloadFormats.isTopChoice(format(139, HE_AAC, 48000), DownloadQuality.LOW));
        assertFalse(DownloadFormats.isTopChoice(format(249, OPUS, 50000), DownloadQuality.LOW));
    }

    @Test public void videosMuxedStreamsUnknownCodecsAndMissingUrlsAreNeverDownloadedAsAudio() {
        PlayerResponse response = adaptive(format(313, "video/webm; codecs=\"vp9\"", 9000000),
                format(251, AAC, 140000), format(251, OPUS, 140000).toBuilder().clearUrl().build());
        assertNull(DownloadFormats.bestAudio(response, true, DownloadQuality.HIGHEST));
        PlayerResponse muxed = PlayerResponse.newBuilder().setStreamingData(StreamingData.newBuilder()
                .addFormats(format(251, OPUS, 140000))).build();
        assertNull(DownloadFormats.bestAudio(muxed, false, DownloadQuality.HIGHEST));
    }

    @Test public void allUsableFormatsSurviveForRejectedUrlFallbackButOtherRecordingsDoNot() {
        Format standard = format(251, OPUS, 130000);
        Format low = format(139, HE_AAC, 48000);
        Format dubbed = format(141, AAC, 256000).toBuilder().setAudioTrack(
                app.morphe.extension.shared.innertube.PlayerResponseOuterClass.DownloadAudioTrack.newBuilder()
                        .setId("dubbed").setAudioIsDefault(false)).build();
        Format surround = format(141, AAC, 384000).toBuilder().setAudioChannels(6).build();
        assertEquals(java.util.List.of(standard, low),
                DownloadFormats.audioFormats(adaptive(standard, low, dubbed, surround), true));
        assertEquals(251, selected(adaptive(standard, low, dubbed, surround), true, DownloadQuality.HIGHEST));
    }

    @Test public void streamCopiesNeedTheirRealByteRangesAndModificationIdentity() {
        for (Format invalid : new Format[]{format(140, AAC, 128000).toBuilder().clearInitRange().build(),
                format(140, AAC, 128000).toBuilder().clearLastModified().build(),
                format(140, AAC, 128000).toBuilder().setIndexRange(
                        ByteRange.newBuilder().setStart(100).setEnd(1000)).build()}) {
            assertNull(DownloadFormats.bestAudio(adaptive(invalid), true, DownloadQuality.NORMAL));
            assertNotNull(DownloadFormats.bestAudio(adaptive(invalid), false, DownloadQuality.NORMAL));
        }
    }
}
