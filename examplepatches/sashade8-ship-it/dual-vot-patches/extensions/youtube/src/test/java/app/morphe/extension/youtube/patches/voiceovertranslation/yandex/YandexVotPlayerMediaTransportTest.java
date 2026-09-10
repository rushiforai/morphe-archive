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

import java.util.HashMap;
import java.util.Map;

/** Covers request selection only; live Cronet authorization remains an APK/device gate. */
public class YandexVotPlayerMediaTransportTest {
    private static final String VIDEO_A = "A1b2C3d4E5_";
    private static final String VIDEO_B = "Z9y8X7w6V5_";

    @After
    public void clearSnapshots() {
        YandexVotPlayerMediaTransport.resetForTests();
    }

    @Test
    public void retainsExactBodylessPlayerAudioRequestAndHeaders() {
        Map<String, String> headers = new HashMap<>();
        headers.put("X-Goog-Visitor-Id", "runtime-only");
        headers.put("User-Agent", "YouTube");
        headers.put("not-a-string", null);
        String url = "https://r.example/videoplayback?id=" + VIDEO_A
                + "&itag=251&clen=12345";

        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(url, 1, null, headers, VIDEO_A);

        YandexVotPlayerMediaTransport.Snapshot snapshot =
                YandexVotPlayerMediaTransport.find(VIDEO_A, 251);
        assertNotNull(snapshot);
        assertEquals(url, snapshot.url);
        assertEquals("GET", YandexVotPlayerMediaTransport.replayHttpMethod(snapshot.httpMethod));
        assertEquals("YouTube", snapshot.headers.get("User-Agent"));
        assertEquals("runtime-only", snapshot.headers.get("X-Goog-Visitor-Id"));
        assertNull(snapshot.headers.get("not-a-string"));
    }

    @Test
    public void neverTreatsBodyCarryingSabrRequestAsRawAudio() {
        String url = "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=251";

        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                url, 2, new byte[] {1, 2}, new HashMap<>(), VIDEO_A);

        assertNull(YandexVotPlayerMediaTransport.find(VIDEO_A, 251));
    }

    @Test
    public void retainsBodylessPostAndReplaysItAsPost() {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=251",
                2, null, new HashMap<>(), VIDEO_A);

        YandexVotPlayerMediaTransport.Snapshot snapshot =
                YandexVotPlayerMediaTransport.find(VIDEO_A, 251);
        assertNotNull(snapshot);
        assertEquals("POST", YandexVotPlayerMediaTransport.replayHttpMethod(snapshot.httpMethod));
    }

    @Test
    public void rejectsBodyfulPostHeadAndUnknownMethods() {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=251",
                2, new byte[] {1}, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=250",
                3, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=249",
                99, null, new HashMap<>(), VIDEO_A);

        assertNull(YandexVotPlayerMediaTransport.find(VIDEO_A, 251));
        assertNull(YandexVotPlayerMediaTransport.find(VIDEO_A, 250));
        assertNull(YandexVotPlayerMediaTransport.find(VIDEO_A, 249));
        assertNull(YandexVotPlayerMediaTransport.replayHttpMethod(3));
        assertNull(YandexVotPlayerMediaTransport.replayHttpMethod(99));
    }

    @Test
    public void preservesSnapshotsForMultipleVideosAndReplacesOnlyExactPair() {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=251",
                1, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_B + "&itag=250",
                1, null, new HashMap<>(), VIDEO_B);
        String replacement = "https://r.example/videoplayback?id=" + VIDEO_A
                + "&itag=251&generation=2";
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                replacement, 1, null, new HashMap<>(), VIDEO_A);

        assertEquals(replacement, YandexVotPlayerMediaTransport.find(VIDEO_A, 251).url);
        assertNotNull(YandexVotPlayerMediaTransport.find(VIDEO_B, 250));
    }

    @Test
    public void rejectsNonMediaAndUnidentifiedRequests() {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/other?id=" + VIDEO_A + "&itag=251",
                1, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?itag=251",
                1, null, new HashMap<>(), "not-a-video-id");

        assertNull(YandexVotPlayerMediaTransport.find(VIDEO_A, 251));
    }

    @Test
    public void matchesOpaqueMediaIdToCurrentCachedFormatWithoutTrustingDataSpecKey() {
        String captured = "https://rr1.example/videoplayback?id=o-opaque-media-stream"
                + "&itag=251&clen=9000000&audio_track=default&sig=captured";
        String cachedFormat = "https://rr9.example/videoplayback?id=o-opaque-media-stream"
                + "&itag=251&clen=9000000&audio_track=default&sig=player-response";

        // The DataSpec key is not a YouTube video id.  The transport must retain it and then
        // prove the match against the cached format for the requested current video.
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                captured, 1, null, new HashMap<>(), "cache-key:251");

        YandexVotPlayerMediaTransport.Snapshot snapshot =
                YandexVotPlayerMediaTransport.findForFormat(VIDEO_A, 251, cachedFormat);
        assertNotNull(snapshot);
        assertEquals(captured, snapshot.url);
        assertNull(YandexVotPlayerMediaTransport.findForFormat(
                VIDEO_A,
                250,
                cachedFormat.replace("itag=251", "itag=250")));
        assertNull(YandexVotPlayerMediaTransport.findForFormat(
                VIDEO_A,
                251,
                cachedFormat.replace("audio_track=default", "audio_track=alternate")));
    }

    @Test
    public void summarizesHookTrafficAndRejectionReasonsWithoutRequestDetails() {
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                (String) null, 1, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/other?itag=251", 1, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A,
                1, null, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=251",
                2, new byte[] {1}, new HashMap<>(), VIDEO_A);
        YandexVotPlayerMediaTransport.recordPlayerMediaRequest(
                "https://r.example/videoplayback?id=" + VIDEO_A + "&itag=250",
                1, null, new HashMap<>(), VIDEO_A);

        YandexVotPlayerMediaTransport.DiagnosticSummary summary =
                YandexVotPlayerMediaTransport.diagnosticSummary();
        assertEquals(5, summary.requestHooks());
        assertEquals(1, summary.invalidUri());
        assertEquals(1, summary.otherRoute());
        assertEquals(3, summary.playbackRoute());
        assertEquals(2, summary.methodGet());
        assertEquals(1, summary.methodPost());
        assertEquals(1, summary.bodyful());
        assertEquals(1, summary.missingItag());
        assertEquals(1, summary.retained());
        assertEquals(1, summary.snapshots());
    }

    @Test
    public void retainsPlayerContextIndependentlyOfMediaDataSourceHooks() {
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer runtime-only");
        headers.put("X-Goog-Visitor-Id", "must-not-be-retained");

        YandexVotPlayerMediaTransport.recordPlayerRequest(
                "https://youtubei.googleapis.com/youtubei/v1/player?id=" + VIDEO_A
                        + "&inline=1",
                headers);
        YandexVotPlayerMediaTransport.recordPlayerRequest(
                "https://youtubei.googleapis.com/youtubei/v1/heartbeat?id=" + VIDEO_B,
                headers);
        YandexVotPlayerMediaTransport.recordPlayerRequest(
                "https://youtubei.googleapis.com/youtubei/v1/player",
                headers);

        YandexVotPlayerMediaTransport.DiagnosticSummary summary =
                YandexVotPlayerMediaTransport.diagnosticSummary();
        assertEquals(3, summary.playerRequestHooks());
        assertEquals(1, summary.playerContextsRetained());
        assertEquals(1, summary.playerContexts());
        assertEquals(0, summary.requestHooks());
        assertEquals(0, summary.snapshots());
    }
}
