package app.jimaku.extension.youtube;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.jimaku.extension.SharedCases;
import app.jimaku.extension.gateway.Cancellation;
import app.jimaku.extension.gateway.GatewayException;
import app.jimaku.extension.gateway.TestServer;

/** YouTube's caption tracks as the extension's captions tests have them, on recorded answers and on the local test server. */
public class YouTubeTest {
    private static final String VIDEO = "94uXFbAQngU";

    private TestServer server;
    private YouTube youtube;

    @Before
    public void start() throws Exception {
        server = new TestServer();
        youtube = new YouTube(server.origin(), "21.16.256", 36, "16", 2_000);
    }

    @After
    public void stop() throws Exception {
        server.close();
    }

    private static TrackInfo recorded(String video) throws Exception {
        return PlayerAnswer.read(video, new JSONObject(SharedCases.resource("/youtube/player-" + video + ".json")));
    }

    @Test
    public void anAutomaticJapaneseTrackIsStandardsSource() throws Exception {
        TrackInfo info = recorded("bWCkSOafQNc");
        assertEquals("ja", info.language);
        assertTrue(info.source.automatic);
        assertTrue(info.uploaded.isEmpty());
        assertEquals(80, info.duration, 0);
        assertFalse(info.live);
        assertTrue(info.title, info.title.startsWith("葬送のフリーレン"));
    }

    @Test
    public void uploadedTracksBesideAnAutomaticOneAreListedOncePerLanguage() throws Exception {
        TrackInfo info = recorded("h6fcK_fRYaI");
        // The uploaded track in the automatic track's language, which the player loads in its place.
        assertEquals("en", info.language);
        assertEquals("en-GB", info.source.code);
        assertFalse(info.source.automatic);
        assertEquals(486, info.duration, 0);
        assertEquals("en-GB", info.uploadedIn("en").code);
        assertEquals("de", info.uploadedIn("de").code);
        assertEquals("iw", info.uploadedIn("he").code);
        assertEquals("no", info.uploadedIn("nb").code);
        assertEquals("zh", info.uploadedIn("zh-Hans").code);
        assertEquals("zh-TW", info.uploadedIn("zh-Hant").code);
        assertEquals("pt", info.uploadedIn("pt").code);
        List<String> langs = new ArrayList<>();
        for (TrackInfo.Uploaded each : info.uploaded) {
            assertFalse(each.lang, langs.contains(each.lang));
            assertFalse(each.track.automatic);
            langs.add(each.lang);
        }
    }

    @Test
    public void listsUploadedTracksInJimakusLanguagesAndTranslatesFromTheSpokenOne() throws Exception {
        // As dQw4w9WgXcQ's list had them on 2026-10-14, with a language Jimaku has no name for and one in two codes.
        TrackInfo info = read(withTracks(Arrays.asList("en", "en:asr", "de-DE", "pt-BR", "es-419", "tlh", "de"), null));
        List<String> uploaded = new ArrayList<>();
        for (TrackInfo.Uploaded each : info.uploaded) uploaded.add(each.lang + "=" + each.track.code);
        assertEquals(Arrays.asList("en=en", "de=de-DE", "pt=pt-BR", "es=es-419"), uploaded);
        assertEquals("en", info.language);
    }

    @Test
    public void translatesFromTheAutomaticTrackWhereNothingWasUploadedInItsLanguage() throws Exception {
        TrackInfo info = read(withTracks(Arrays.asList("ja:asr", "ko"), null));
        assertEquals("ja", info.language);
        assertEquals("ko", info.uploaded.get(0).lang);
    }

    @Test
    public void withoutAnAutomaticTrackTheOneThePlayerStartsWithOrTheOnlyOne() throws Exception {
        assertEquals("fr", read(withTracks(Arrays.asList("ko", "fr"), 1)).language);
        assertEquals("ja", read(withTracks(Collections.singletonList("ja"), null)).language);
        // Several, and none the player starts with: no telling which is the video's own.
        assertNull(read(withTracks(Arrays.asList("ko", "fr"), null)).language);
    }

    @Test
    public void aStreamIsLiveWhileItsDataSaysSo() throws Exception {
        for (String key : new String[]{"isLive", "isUpcoming", "isPostLiveDvr"}) {
            JSONObject answer = withTracks(Collections.emptyList(), null);
            answer.getJSONObject("videoDetails").put(key, true).put("isLiveContent", true).put("lengthSeconds", "0");
            // Yet to start, YouTube doesn't play it; it is live all the same.
            answer.getJSONObject("playabilityStatus").put("status", "LIVE_STREAM_OFFLINE");
            TrackInfo info = read(answer);
            assertTrue(key, info.live);
            assertNull(info.duration);
        }
        JSONObject ended = withTracks(Collections.singletonList("ja:asr"), null);
        ended.getJSONObject("videoDetails").put("isLive", false).put("isLiveContent", true);
        assertFalse(read(ended).live);
    }

    @Test
    public void noCaptionsAtAllIsNoLanguage() throws Exception {
        TrackInfo info = read(withTracks(Collections.emptyList(), null));
        assertNull(info.language);
        assertNull(info.source);
        assertTrue(info.uploaded.isEmpty());
        JSONObject bare = new JSONObject().put("playabilityStatus", new JSONObject().put("status", "OK"))
                .put("videoDetails", new JSONObject().put("videoId", VIDEO).put("lengthSeconds", "60"));
        assertNull(read(bare).language);
    }

    @Test
    public void aVideoYouTubeWontPlayWithoutAnAccountIsUnknown() throws Exception {
        for (String status : new String[]{"LOGIN_REQUIRED", "UNPLAYABLE", "ERROR"}) {
            JSONObject answer = withTracks(Collections.singletonList("ja:asr"), null);
            answer.getJSONObject("playabilityStatus").put("status", status);
            assertNull(status, read(answer));
        }
        assertNull(PlayerAnswer.read("aaaaaaaaaaa", withTracks(Collections.singletonList("ja:asr"), null)));
    }

    @Test
    public void asksAsTheYouTubeAppWithNothingElse() throws Exception {
        server.answer("/youtubei/v1/player", 200, SharedCases.resource("/youtube/player-bWCkSOafQNc.json"));
        TrackInfo info = youtube.tracks("bWCkSOafQNc", new Cancellation());
        assertEquals("ja", info.language);

        TestServer.Request sent = server.requests.get(0);
        assertEquals("POST /youtubei/v1/player?prettyPrint=false HTTP/1.1", sent.line);
        List<String> names = new ArrayList<>(sent.headers.keySet());
        Collections.sort(names);
        assertEquals(Arrays.asList("accept", "connection", "content-length", "content-type", "host", "user-agent",
                "x-youtube-client-name", "x-youtube-client-version"), names);
        assertEquals("com.google.android.youtube/21.16.256 (Linux; U; Android 16) gzip", sent.header("user-agent"));
        assertEquals("3", sent.header("x-youtube-client-name"));
        assertEquals("21.16.256", sent.header("x-youtube-client-version"));
        JSONObject body = new JSONObject(sent.body);
        assertEquals(Arrays.asList("context", "videoId"), keys(body));
        assertEquals(Collections.singletonList("client"), keys(body.getJSONObject("context")));
        JSONObject client = body.getJSONObject("context").getJSONObject("client");
        assertEquals(Arrays.asList("androidSdkVersion", "clientName", "clientVersion"), keys(client));
        assertEquals("ANDROID", client.getString("clientName"));
        assertEquals(36, client.getInt("androidSdkVersion"));
    }

    @Test
    public void aRefusedOrUnreadableAnswerIsUnknown() throws Exception {
        server.answer("/youtubei/v1/player", 403, "{}");
        assertNull(youtube.tracks(VIDEO, new Cancellation()));
        server.answer("/youtubei/v1/player", 200, "<html>");
        assertNull(youtube.tracks(VIDEO, new Cancellation()));
    }

    @Test
    public void readsATracksTextAsJson3AndSendsItAsTheExtensionDoes() throws Exception {
        String events = "[{\"tStartMs\":40,\"dDurationMs\":3000,\"segs\":[{\"utf8\":\"見せてなかった。\",\"tOffsetMs\":0}]}]";
        server.answer("/api/timedtext", 200, "{\"wireMagic\":\"pb3\",\"events\":" + events + "}");
        TrackInfo info = read(withTracks(Collections.singletonList("ja:asr"), null));
        CaptionTrack track = new CaptionTrack("ja", server.origin() + "/api/timedtext?v=" + VIDEO + "&caps=asr&kind=asr&lang=ja&fmt=srv3", true);
        String body = youtube.captions(info, track, new Cancellation());
        assertEquals("GET /api/timedtext?v=" + VIDEO + "&caps=asr&kind=asr&lang=ja&fmt=json3 HTTP/1.1", server.requests.get(0).line);
        JSONObject sent = new JSONObject(body);
        assertEquals(Arrays.asList("events", "title"), keys(sent));
        assertEquals("Seoul 10K", sent.getString("title"));
        assertEquals(new JSONArray(events).toString(), sent.getJSONArray("events").toString());
    }

    @Test
    public void anAutomaticTrackWithoutEachWordsTimingIsAskedForAgainAsTheOlderApp() throws Exception {
        String untimed = "[{\"tStartMs\":230,\"dDurationMs\":9810,\"segs\":[{\"utf8\":\"[音楽]\"},{\"utf8\":\"\\n早々の\"}]}]";
        String timed = "[{\"tStartMs\":230,\"dDurationMs\":9810,\"segs\":[{\"utf8\":\"早々\"},{\"utf8\":\"の\",\"tOffsetMs\":400}]}]";
        server.answer("/api/timedtext", 200, "{\"events\":" + untimed + "}");
        server.answer("/api/timed", 200, "{\"events\":" + timed + "}");
        server.answer("/youtubei/v1/player", 200, older("/api/timed", true).toString());
        TrackInfo info = read(withTracks(Collections.singletonList("ja:asr"), null));
        CaptionTrack track = new CaptionTrack("ja", server.origin() + "/api/timedtext?v=" + VIDEO + "&kind=asr&lang=ja&exp=xpo", true);

        JSONObject sent = new JSONObject(youtube.captions(info, track, new Cancellation()));
        assertEquals(new JSONArray(timed).toString(), sent.getJSONArray("events").toString());
        TestServer.Request asked = server.requestsTo("/youtubei/v1/player").get(0);
        assertEquals(YouTube.TIMED_VERSION, new JSONObject(asked.body).getJSONObject("context").getJSONObject("client").getString("clientVersion"));
        assertEquals("com.google.android.youtube/" + YouTube.TIMED_VERSION + " (Linux; U; Android 16) gzip", asked.header("user-agent"));
        assertEquals("com.google.android.youtube/" + YouTube.TIMED_VERSION + " (Linux; U; Android 16) gzip",
                server.requestsTo("/api/timed").get(0).header("user-agent"));

        // Untimed there too, or refused: the untimed track goes.
        server.answer("/api/timed", 200, "{\"events\":" + untimed + "}");
        assertEquals(new JSONArray(untimed).toString(), new JSONObject(youtube.captions(info, track, new Cancellation())).getJSONArray("events").toString());
        server.answer("/youtubei/v1/player", 400, "{}");
        assertEquals(new JSONArray(untimed).toString(), new JSONObject(youtube.captions(info, track, new Cancellation())).getJSONArray("events").toString());
        // An automatic track in another language there isn't this one.
        server.answer("/youtubei/v1/player", 200, older("/api/timed", false).toString());
        server.answer("/api/timed", 200, "{\"events\":" + timed + "}");
        assertEquals(new JSONArray(untimed).toString(), new JSONObject(youtube.captions(info, track, new Cancellation())).getJSONArray("events").toString());
    }

    @Test
    public void anUploadedTrackIsReadOnce() throws Exception {
        server.answer("/api/timedtext", 200, "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"Hallo\"}]}]}");
        TrackInfo info = read(withTracks(Collections.singletonList("de"), null));
        youtube.captions(info, new CaptionTrack("de", server.origin() + "/api/timedtext?lang=de", false), new Cancellation());
        assertEquals(1, server.requests.size());
    }

    /** The older app's answer, with its automatic track in Japanese, or in Korean where {@code same} is false. */
    private JSONObject older(String path, boolean same) throws Exception {
        String code = same ? "ja" : "ko";
        JSONObject answer = withTracks(Collections.singletonList(code + ":asr"), null);
        answer.getJSONObject("captions").getJSONObject("playerCaptionsTracklistRenderer").getJSONArray("captionTracks").getJSONObject(0)
                .put("baseUrl", server.origin() + path + "?v=" + VIDEO + "&kind=asr&lang=" + code);
        return answer;
    }

    @Test
    public void aTrackYouTubeAnswersWithNothingHasNoCaptions() throws Exception {
        TrackInfo info = read(withTracks(Collections.singletonList("ja:asr"), null));
        CaptionTrack track = new CaptionTrack("ja", server.origin() + "/api/timedtext?lang=ja", true);
        server.answer("/api/timedtext", 200, "");
        assertCode("no_captions", () -> youtube.captions(info, track, new Cancellation()));
        server.answer("/api/timedtext", 200, "{\"events\":[]}");
        assertCode("no_captions", () -> youtube.captions(info, track, new Cancellation()));
        server.answer("/api/timedtext", 404, "{}");
        assertCode("no_captions", () -> youtube.captions(info, track, new Cancellation()));
    }

    @Test
    public void aTrackElsewhereThanYouTubeIsNeverRead() throws Exception {
        TrackInfo info = read(withTracks(Collections.singletonList("ja:asr"), null));
        assertCode("no_captions", () -> youtube.captions(info, new CaptionTrack("ja", "https://example.com/api/timedtext?lang=ja", true), new Cancellation()));
        assertTrue(server.requests.isEmpty());
        assertEquals("https://www.youtube.com/api/timedtext?v=x&lang=ja&fmt=json3",
                new YouTube(YouTube.ORIGIN, "1", 1, "1", 1).json3("https://www.youtube.com/api/timedtext?fmt=srv3&v=x&lang=ja").toString());
    }

    private static TrackInfo read(JSONObject answer) {
        return PlayerAnswer.read(VIDEO, answer);
    }

    /**
     * The player's data with these caption tracks, as its list has them ("ja:asr" for an automatic
     * one); {@code opening} is the track it starts with.
     */
    private static JSONObject withTracks(List<String> all, Integer opening) throws Exception {
        JSONArray tracks = new JSONArray();
        JSONArray indices = new JSONArray();
        for (int i = 0; i < all.size(); i++) {
            String[] parts = all.get(i).split(":");
            boolean asr = parts.length > 1;
            JSONObject track = new JSONObject().put("languageCode", parts[0]).put("vssId", (asr ? "a." : ".") + parts[0])
                    .put("baseUrl", "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=" + parts[0] + (asr ? "&kind=asr" : ""));
            if (asr) track.put("kind", "asr");
            tracks.put(track);
            indices.put(i);
        }
        JSONObject audio = opening == null ? new JSONObject().put("captionTrackIndices", indices) : new JSONObject().put("defaultCaptionTrackIndex", opening);
        return new JSONObject()
                .put("playabilityStatus", new JSONObject().put("status", "OK"))
                .put("videoDetails", new JSONObject().put("videoId", VIDEO).put("title", "Seoul 10K").put("lengthSeconds", "1588"))
                .put("captions", new JSONObject().put("playerCaptionsTracklistRenderer",
                        new JSONObject().put("captionTracks", tracks).put("audioTracks", new JSONArray().put(audio))));
    }

    private static List<String> keys(JSONObject object) {
        List<String> names = new ArrayList<>();
        for (java.util.Iterator<String> it = object.keys(); it.hasNext(); ) names.add(it.next());
        Collections.sort(names);
        return names;
    }

    private interface Call {
        Object run() throws GatewayException;
    }

    private static void assertCode(String code, Call call) {
        try {
            call.run();
            fail("expected " + code);
        } catch (GatewayException e) {
            assertEquals(code, e.code);
        }
    }
}
