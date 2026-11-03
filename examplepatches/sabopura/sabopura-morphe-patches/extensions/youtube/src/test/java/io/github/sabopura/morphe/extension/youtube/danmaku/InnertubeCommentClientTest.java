package io.github.sabopura.morphe.extension.youtube.danmaku;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

public final class InnertubeCommentClientTest {
    @Test
    public void generatedCommentContinuationContainsVideoAndSection() throws Exception {
        String token = InnertubeCommentClient.generateCommentContinuation("jNQXAC9IVRw");
        String decoded = new String(Base64.getDecoder().decode(token), StandardCharsets.UTF_8);

        assertTrue(decoded.contains("jNQXAC9IVRw"));
        assertTrue(decoded.contains("comments-section"));
    }

    @Test
    public void replayPlayerOffsetUsesInnertubeInt64StringRepresentation() throws Exception {
        JSONObject body = new JSONObject();

        InnertubeCommentClient.Session.putCurrentPlayerState(body, 5_595_066L);

        Object offset = body.getJSONObject("currentPlayerState").get("playerOffsetMs");
        assertTrue(offset instanceof String);
        assertEquals("5595066", offset);
    }

    @Test
    public void replayPrefetchWaitsUntilPlaybackApproachesFetchedWindow() {
        assertEquals(192_853L, InnertubeCommentClient.Session.replayPrefetchDelayMs(
                5_847_919L, 5_595_066L));
        assertEquals(0L, InnertubeCommentClient.Session.replayPrefetchDelayMs(
                5_650_000L, 5_595_066L));
        assertEquals(0L, InnertubeCommentClient.Session.replayPrefetchDelayMs(
                -1L, 5_595_066L));
    }

    @Test
    public void liveSourceModesSelectExpectedWorkers() {
        InnertubeCommentClient.SourcePlan preferred = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.LIVE_REPLAY, true,
                DanmakuSettings.STREAM_MODE_CHAT_PREFERRED, false);
        assertTrue(preferred.stream);
        assertTrue(!preferred.regular);

        InnertubeCommentClient.SourcePlan fallback = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.PREMIERE_REPLAY, false,
                DanmakuSettings.STREAM_MODE_CHAT_PREFERRED, false);
        assertTrue(!fallback.stream);
        assertTrue(fallback.regular);

        InnertubeCommentClient.SourcePlan regularOnly = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.LIVE, true,
                DanmakuSettings.STREAM_MODE_REGULAR_ONLY, false);
        assertTrue(!regularOnly.stream);
        assertTrue(regularOnly.regular);

        InnertubeCommentClient.SourcePlan mixed = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.PREMIERE, true,
                DanmakuSettings.STREAM_MODE_CHAT_AND_TIMESTAMPS, false);
        assertTrue(mixed.stream);
        assertTrue(mixed.regular);
    }

    @Test
    public void officialNiconicoCommentsKeepLiveChat() {
        InnertubeCommentClient.SourcePlan preferred = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.LIVE, true,
                DanmakuSettings.STREAM_MODE_CHAT_PREFERRED, true);
        assertTrue(!preferred.stream);
        assertTrue(!preferred.regular);

        InnertubeCommentClient.SourcePlan mixed = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.LIVE_REPLAY, true,
                DanmakuSettings.STREAM_MODE_CHAT_AND_TIMESTAMPS, true);
        assertTrue(!mixed.stream);
        assertTrue(mixed.regular);

        InnertubeCommentClient.SourcePlan withoutChat = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.PREMIERE_REPLAY, false,
                DanmakuSettings.STREAM_MODE_CHAT_PREFERRED, true);
        assertTrue(withoutChat.regular);

        InnertubeCommentClient.SourcePlan regular = InnertubeCommentClient.selectSources(
                InnertubeCommentClient.VideoKind.REGULAR, false,
                DanmakuSettings.STREAM_MODE_CHAT_PREFERRED, true);
        assertTrue(regular.regular);
    }
}
