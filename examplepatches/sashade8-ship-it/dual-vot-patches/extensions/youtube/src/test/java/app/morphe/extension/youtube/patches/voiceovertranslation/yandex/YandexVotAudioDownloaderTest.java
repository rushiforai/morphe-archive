/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.After;
import org.junit.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/** Verifies that cached metadata never selects an itag the live player did not open. */
public class YandexVotAudioDownloaderTest {
    private static final String VIDEO_ID = "A1b2C3d4E5_";

    @After
    public void clearSnapshots() {
        YandexVotPlayerMediaTransport.resetForTests();
    }

    @Test
    public void selectsLowestBitrateCapturedOpusInsteadOfUnopenedCachedItag() {
        recordPlayerRequest(250);
        recordPlayerRequest(251);

        YandexVotAudioDownloader.CapturedAudioCandidate selected =
                YandexVotAudioDownloader.selectBestCapturedAudioCandidate(VIDEO_ID, Arrays.asList(
                        audioFormat(249, "audio/webm; codecs=opus", 48_000),
                        audioFormat(251, "audio/webm; codecs=opus", 128_000),
                        audioFormat(250, "audio/webm; codecs=opus", 70_000),
                        audioFormat(140, "audio/mp4; codecs=mp4a", 64_000)
                ));

        assertNotNull(selected);
        assertEquals(250, selected.candidate().itag());
        assertEquals(250, selected.mediaRequest().itag);
    }

    @Test
    public void fallsBackToCapturedNonOpusAudioWhenNoOpusSnapshotExists() {
        recordPlayerRequest(140);

        YandexVotAudioDownloader.CapturedAudioCandidate selected =
                YandexVotAudioDownloader.selectBestCapturedAudioCandidate(VIDEO_ID, Arrays.asList(
                        audioFormat(249, "audio/webm; codecs=opus", 48_000),
                        audioFormat(140, "audio/mp4; codecs=mp4a", 64_000)
                ));

        assertNotNull(selected);
        assertEquals(140, selected.candidate().itag());
        assertEquals(140, selected.mediaRequest().itag);
    }

    @Test
    public void directSourcePrefersLowestBitrateOpus() {
        YandexVotAudioDownloader.AudioCandidate selected =
                YandexVotAudioDownloader.selectBestDirectAudioCandidate(List.of(
                audioFormat(140, "audio/mp4; codecs=mp4a", 48_000),
                audioFormat(251, "audio/webm; codecs=opus", 128_000),
                audioFormat(250, "audio/webm; codecs=opus", 70_000)
        ));

        assertNotNull(selected);
        assertEquals(250, selected.itag());
    }

    @Test
    public void directSourceRejectsSabrMetadataWithoutByteAddressableUrl() {
        assertNull(YandexVotAudioDownloader.selectBestDirectAudioCandidate(List.of(
                new YandexVotAudioDownloader.AudioCandidate(
                        251, "", "audio/webm; codecs=opus", 70_000)
        )));
    }

    private static void recordPlayerRequest(int itag) {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_ID + "&itag=" + itag,
                1, null, new HashMap<>(), VIDEO_ID);
    }

    private static YandexVotAudioDownloader.AudioCandidate audioFormat(
            int itag,
            String mimeType,
            int bitrate
    ) {
        return new YandexVotAudioDownloader.AudioCandidate(
                itag,
                "https://cached.example/videoplayback?id=" + VIDEO_ID + "&itag=" + itag,
                mimeType,
                bitrate
        );
    }

}
