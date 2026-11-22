package app.revanced.extension.rif;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

public class VideoProcessingTest {

    // Shaped like Reddit's /api/info.json?id=t3_... and comments JSON; synthetic ids and text.
    private static final String COMMENTS = "{\"kind\": \"Listing\", \"data\": {\"children\": []}}";

    /** A processing post: video flag set, no media yet (still "default" thumbnail, no post_hint). */
    private static final String PROCESSING = "[{\"kind\": \"Listing\", \"data\": {\"after\": null, \"dist\": 1,"
            + " \"children\": [{\"kind\": \"t3\", \"data\": {\"subreddit\": \"test\", \"title\": \"A video\","
            + " \"name\": \"t3_aaaaaa\", \"thumbnail\": \"default\", \"is_video\": true, \"media\": null,"
            + " \"secure_media\": null, \"domain\": \"/r/test/comments/aaaaaa/a_video/\","
            + " \"url\": \"https://v.redd.it/zzzzzzzzzzzz\"}}]}}, " + COMMENTS + "]";

    /** The same post once ready: media.reddit_video is filled in. */
    private static final String READY = "[{\"kind\": \"Listing\", \"data\": {\"after\": null, \"dist\": 1,"
            + " \"children\": [{\"kind\": \"t3\", \"data\": {\"subreddit\": \"test\", \"title\": \"A video\","
            + " \"name\": \"t3_aaaaaa\", \"is_video\": true, \"post_hint\": \"hosted:video\","
            + " \"media\": {\"reddit_video\": {\"fallback_url\": \"https://v.redd.it/zzzzzzzzzzzz/CMAF_720.mp4\","
            + " \"dash_url\": \"https://v.redd.it/zzzzzzzzzzzz/DASHPlaylist.mpd\", \"duration\": 40,"
            + " \"is_gif\": false, \"transcoding_status\": \"completed\"}},"
            + " \"domain\": \"v.redd.it\", \"url\": \"https://v.redd.it/zzzzzzzzzzzz\"}}]}}, " + COMMENTS + "]";

    /** A post that never gets media: same shape as PROCESSING, so also "processing" for good. */
    private static final String NEVER = PROCESSING.replace("\"thumbnail\": \"default\", ", "");

    @Test
    public void processingPostIsDetected() {
        assertTrue(VideoProcessing.isProcessingPost(PROCESSING));
        assertTrue(VideoProcessing.isProcessingPost(NEVER));
        assertTrue(VideoProcessing.isProcessingPost("  \n" + PROCESSING));
    }

    @Test
    public void mediaMissingCountsAsProcessing() {
        assertTrue(VideoProcessing.isProcessingPost(
                "[{\"data\": {\"children\": [{\"kind\": \"t3\", \"data\": {\"is_video\": true}}]}}]"));
    }

    @Test
    public void listingWithoutTheCommentsArrayIsAccepted() {
        assertTrue(VideoProcessing.isProcessingPost(
                "{\"kind\": \"Listing\", \"data\": {\"children\": [{\"kind\": \"t3\","
                        + " \"data\": {\"is_video\": true, \"media\": null}}]}}"));
    }

    @Test
    public void readyPostIsNot() {
        assertFalse(VideoProcessing.isProcessingPost(READY));
    }

    @Test
    public void postsThatAreNotVideosAreNot() {
        // A self or link post that links a v.redd.it URL: media null, but is_video false.
        assertFalse(VideoProcessing.isProcessingPost(
                "[{\"data\": {\"children\": [{\"kind\": \"t3\", \"data\": {\"is_video\": false,"
                        + " \"media\": null, \"url\": \"https://v.redd.it/zzzzzzzzzzzz\"}}]}}]"));
        assertFalse(VideoProcessing.isProcessingPost(
                "[{\"data\": {\"children\": [{\"kind\": \"t3\", \"data\": {\"media\": null}}]}}]"));
    }

    @Test
    public void everythingElseIsNot() {
        assertFalse(VideoProcessing.isProcessingPost(null));
        assertFalse(VideoProcessing.isProcessingPost(""));
        assertFalse(VideoProcessing.isProcessingPost("[]"));
        assertFalse(VideoProcessing.isProcessingPost("{}"));
        assertFalse(VideoProcessing.isProcessingPost("[{\"data\": {\"children\": []}}]"));
        assertFalse(VideoProcessing.isProcessingPost("{\"message\": \"Forbidden\", \"error\": 403}"));
        // Reddit's HTML block page.
        assertFalse(VideoProcessing.isProcessingPost(
                "<body class=theme-beta><div>You've been blocked by network security.</div></body>"));
        // Cut off in the middle (a body over the limit).
        assertFalse(VideoProcessing.isProcessingPost(PROCESSING.substring(0, 120)));
    }

    @Test
    public void playlistKindNeedsTheExactPath() {
        assertEquals(1, VideoProcessing.playlistKind("v.redd.it", "/abc123/DASHPlaylist.mpd"));
        assertEquals(2, VideoProcessing.playlistKind("v.redd.it", "/abc123/HLSPlaylist.m3u8"));
        assertEquals(1, VideoProcessing.playlistKind("V.REDD.IT", "/abc123/DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", "/abc123/CMAF_720.mp4"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", "/abc123"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", "/DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", "//DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", "/a/b/DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind("example.com", "/abc123/DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind(null, "/abc123/DASHPlaylist.mpd"));
        assertEquals(0, VideoProcessing.playlistKind("v.redd.it", null));
    }

    @Test
    public void bothPlaylistsRefusedAndNothingElseExplainsTheFormatError() {
        int flags = VideoProcessing.addFailure(0, true, true);
        assertFalse(VideoProcessing.onlyRefused(flags));
        flags = VideoProcessing.addFailure(flags, false, true);
        assertTrue(VideoProcessing.onlyRefused(flags));
        // The refetch fails DASH again: still only refused.
        assertTrue(VideoProcessing.onlyRefused(VideoProcessing.addFailure(flags, true, true)));
    }

    @Test
    public void anyOtherFailureKeepsRifsToast() {
        int refused = VideoProcessing.addFailure(VideoProcessing.addFailure(0, true, true), false, true);
        assertFalse(VideoProcessing.onlyRefused(VideoProcessing.addFailure(refused, true, false)));
        assertFalse(VideoProcessing.onlyRefused(VideoProcessing.addFailure(0, true, false)));
        // DASH refused only (HLS not tried or fine).
        assertFalse(VideoProcessing.onlyRefused(VideoProcessing.addFailure(0, true, true)));
    }

    @Test
    public void is403WalksTheCauseChain() {
        Exception io = new IOException("Response code: 403");
        assertTrue(VideoProcessing.is403(io));
        assertTrue(VideoProcessing.is403(new RuntimeException("Source error", io)));
        assertTrue(VideoProcessing.is403(new RuntimeException("a", new RuntimeException("b", io))));
        assertFalse(VideoProcessing.is403(new IOException("Response code: 404")));
        assertFalse(VideoProcessing.is403(new RuntimeException("Source error")));
        assertFalse(VideoProcessing.is403(new RuntimeException(null, null)));
        assertFalse(VideoProcessing.is403(null));
    }

    @Test
    public void teeReturnsTheSameBytes() throws IOException {
        byte[] body = PROCESSING.getBytes(StandardCharsets.UTF_8);
        assertArrayEquals(body, readAll(VideoProcessing.teeMetadata(new Object(), new ByteArrayInputStream(body))));
        assertEquals(null, VideoProcessing.teeMetadata(new Object(), null));
    }

    @Test
    public void teeReturnsTheSameBytesBeyondTheLimit() throws IOException {
        byte[] body = new byte[VideoProcessing.MAX_BODY + 12345];
        for (int i = 0; i < body.length; i++) body[i] = (byte) ('a' + i % 26);
        assertArrayEquals(body, readAll(VideoProcessing.teeMetadata(new Object(), new ByteArrayInputStream(body))));
        byte[] exact = new byte[VideoProcessing.MAX_BODY];
        assertArrayEquals(exact, readAll(VideoProcessing.teeMetadata(new Object(), new ByteArrayInputStream(exact))));
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[4096];
        int n;
        while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        return out.toByteArray();
    }
}
