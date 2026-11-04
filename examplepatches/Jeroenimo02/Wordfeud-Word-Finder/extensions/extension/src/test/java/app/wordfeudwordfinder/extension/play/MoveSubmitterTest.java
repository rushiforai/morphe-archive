package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.game.GameStore;
import app.wordfeudwordfinder.extension.hooks.UserAgentTap;
import app.wordfeudwordfinder.extension.words.RejectedWords;
import app.wordfeudwordfinder.extension.words.WordReporter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class MoveSubmitterTest {
    private static final long GAME = 4391319402L;
    private static final long NOW_MS = 1793538877_000L;

    @Rule public TemporaryFolder tmp = new TemporaryFolder();

    private File filesDir;
    private GameStore store;
    private RejectedWords rejected;
    private SessionReader session;

    private static String fixture(String name) {
        try (InputStream in = MoveSubmitterTest.class.getResourceAsStream("/fixtures/" + name)) {
            if (in == null) throw new AssertionError("missing fixture " + name);
            return new String(in.readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    @Before
    public void setUp() throws Exception {
        filesDir = tmp.newFolder("files");
        File dir = new File(filesDir, ".cookies/ie0_ps1");
        assertTrue(dir.mkdirs());
        try (OutputStream out = new FileOutputStream(new File(dir, ".domains"))) {
            out.write(fixture("cookies_domains.json").getBytes(StandardCharsets.UTF_8));
        }
        Storage storage = new Storage(tmp.newFolder("wfwf"));
        store = new GameStore(storage);
        rejected = new RejectedWords(storage);
        session = new SessionReader(filesDir, () -> NOW_MS);
    }

    /** Poster that counts calls, records the last request and returns a fixed body. */
    private static final class FakePoster implements Poster {
        final AtomicInteger calls = new AtomicInteger();
        final AtomicReference<String> url = new AtomicReference<>();
        final AtomicReference<String> body = new AtomicReference<>();
        final AtomicReference<Map<String, String>> headers = new AtomicReference<>();
        final String response;
        final IOException failure;

        FakePoster(String response) {
            this.response = response;
            this.failure = null;
        }

        FakePoster(IOException failure) {
            this.response = null;
            this.failure = failure;
        }

        @Override
        public String post(String u, String b, Map<String, String> h) throws IOException {
            calls.incrementAndGet();
            url.set(u);
            body.set(b);
            headers.set(h);
            if (failure != null) throw failure;
            return response;
        }
    }

    private MoveSubmitter submitter(Poster p) {
        return new MoveSubmitter(session, p, store, rejected);
    }

    @Test
    public void successUpdatesStore() {
        UserAgentTap.set("TestUA/1.0");
        assertNull(store.game(GAME));
        FakePoster p = new FakePoster(fixture("move_hoort.json"));
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.SUCCESS, r.kind);
        assertNull(r.error);
        assertNotNull(store.game(GAME));
        assertEquals(1, p.calls.get());
        assertEquals(MoveRequest.url(GAME), p.url.get());
        assertEquals(MoveRequest.body(MoveRequestTest.mandje(), 2), p.body.get());
        Map<String, String> h = p.headers.get();
        assertEquals("sessionid=TESTSESSION", h.get("Cookie"));
        assertEquals("TestUA/1.0", h.get("User-Agent"));
        assertEquals("application/json", h.get("Content-Type"));
    }

    @Test
    public void illegalWordRejects() {
        FakePoster p = new FakePoster("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}");
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.REJECTED, r.kind);
        assertEquals(Collections.singletonList("MANDJE"), r.words);
        assertFalse(r.oneOf);
        assertTrue(rejected.contains(2, "MANDJE"));
        assertFalse(rejected.contains(1, "MANDJE"));
        assertEquals("type=illegal_word keys=type", r.server);
    }

    @Test
    public void illegalWordUsesServerNamedWordsWhenPresent() {
        FakePoster p = new FakePoster(
                "{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\",\"words\":[\"ndj\",\"XY\"]}}");
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.REJECTED, r.kind);
        assertEquals(Arrays.asList("NDJ", "XY"), r.words);
        assertTrue(rejected.contains(2, "NDJ"));
        assertFalse(rejected.contains(2, "MANDJE"));
        assertFalse(r.oneOf);
        assertEquals("type=illegal_word keys=type,words words=[\"ndj\",\"XY\"]", r.server);
    }

    @Test
    public void illegalWordUsesIllegalWordsFromTheServer() {
        // Shape seen on the device (V6): keys illegal_words, legal_words, message, type.
        FakePoster p = new FakePoster("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\","
                + "\"illegal_words\":[\"ndj\"],\"legal_words\":[\"mandje\"],\"message\":\"x\"}}");
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.REJECTED, r.kind);
        assertEquals(Arrays.asList("NDJ"), r.words);
        assertTrue(rejected.contains(2, "NDJ"));
        assertFalse(rejected.contains(2, "MANDJE"));
        assertFalse(r.oneOf);
        assertEquals("type=illegal_word keys=illegal_words,legal_words,message,type illegal_words=[\"ndj\"]", r.server);
    }

    @Test
    public void serverNamedWordsAreReportedOnce() {
        List<String> reported = new ArrayList<>();
        WordReporter rep = new WordReporter("https://w.example/report", (u, json) -> {
            try {
                org.json.JSONArray a = new org.json.JSONObject(json).getJSONArray("words");
                for (int i = 0; i < a.length(); i++) reported.add(a.getString(i));
            } catch (Exception e) { // JSONException is checked on Android
                throw new IOException(e);
            }
        }, Runnable::run);
        String body = "{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\",\"illegal_words\":[\"ndj\"]}}";
        MoveSubmitter s = new MoveSubmitter(session, new FakePoster(body), store, rejected, rep);
        s.submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(Arrays.asList("NDJ"), reported);
        s.submit(GAME, 2, MoveRequestTest.mandje()); // already rejected on this device: not reported again
        assertEquals(Arrays.asList("NDJ"), reported);
    }

    @Test
    public void unnamedRejectionIsNotReported() {
        List<String> reported = new ArrayList<>();
        WordReporter rep = new WordReporter("https://w.example/report", (u, json) -> reported.add(json), Runnable::run);
        MoveSubmitter s = new MoveSubmitter(session,
                new FakePoster("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}"), store, rejected, rep);
        s.submit(GAME, 2, MoveRequestTest.mandje());
        assertTrue(reported.isEmpty());
    }

    @Test
    public void otherServerErrorIsError() {
        FakePoster p = new FakePoster("{\"status\":\"error\",\"content\":{\"type\":\"not_your_turn\"}}");
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.ERROR, r.kind);
        assertEquals("MV-SERVER-not_your_turn", r.error.code());
        assertFalse(rejected.contains(2, "MANDJE"));
    }

    @Test
    public void networkErrorNoRetry() {
        FakePoster p = new FakePoster(new IOException("timeout"));
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.ERROR, r.kind);
        assertEquals("MV-NET", r.error.code());
        assertEquals(1, p.calls.get());
    }

    @Test
    public void httpErrorWithServerBodyIsParsed() {
        FakePoster p = new FakePoster(new Poster.HttpStatusException(400,
                "{\"status\":\"error\",\"content\":{\"type\":\"illegal_tiles\"}}"));
        MoveSubmitter.Result r = submitter(p).submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals("MV-SERVER-illegal_tiles", r.error.code());
    }

    @Test
    public void httpErrorWithoutParseableBodyIsHttpStatus() {
        FakePoster p = new FakePoster(new Poster.HttpStatusException(502, "<html>bad gateway</html>"));
        assertEquals("MV-SERVER-http_502", submitter(p).submit(GAME, 2, MoveRequestTest.mandje()).error.code());
        FakePoster q = new FakePoster(new Poster.HttpStatusException(403, null));
        assertEquals("MV-SERVER-http_403", submitter(q).submit(GAME, 2, MoveRequestTest.mandje()).error.code());
    }

    @Test
    public void missingSessionIsErrorWithoutNetwork() {
        FakePoster p = new FakePoster(fixture("move_hoort.json"));
        MoveSubmitter s = new MoveSubmitter(new SessionReader(tmp.getRoot(), () -> NOW_MS), p, store, rejected);
        MoveSubmitter.Result r = s.submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.ERROR, r.kind);
        assertEquals("MV-SESSION", r.error.code());
        assertEquals(0, p.calls.get());
    }

    @Test
    public void secondConcurrentSubmitIsRejectedImmediately() throws Exception {
        CountDownLatch entered = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        AtomicInteger calls = new AtomicInteger();
        String ok = fixture("move_hoort.json");
        Poster blocking = (u, b, h) -> {
            calls.incrementAndGet();
            entered.countDown();
            try {
                release.await(10, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            return ok;
        };
        MoveSubmitter s = submitter(blocking);
        AtomicReference<MoveSubmitter.Result> first = new AtomicReference<>();
        Thread t = new Thread(() -> first.set(s.submit(GAME, 2, MoveRequestTest.mandje())));
        t.start();
        assertTrue(entered.await(10, TimeUnit.SECONDS));
        assertTrue(s.isBusy());
        MoveSubmitter.Result second = s.submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.ERROR, second.kind);
        assertEquals("MV-NET", second.error.code());
        release.countDown();
        t.join(10_000);
        assertEquals(MoveSubmitter.Result.Kind.SUCCESS, first.get().kind);
        assertEquals(1, calls.get());
        assertFalse(s.isBusy());
        // free again afterwards
        assertEquals(MoveSubmitter.Result.Kind.SUCCESS, s.submit(GAME, 2, MoveRequestTest.mandje()).kind);
    }

    @Test
    public void unparseable2xxBodyIsNetError() {
        assertEquals("MV-NET", submitter(new FakePoster("<html>")).submit(GAME, 2, MoveRequestTest.mandje())
                .error.code());
        assertEquals("MV-NET", submitter(new FakePoster("")).submit(GAME, 2, MoveRequestTest.mandje())
                .error.code());
        assertEquals("MV-NET", submitter(new FakePoster((String) null)).submit(GAME, 2, MoveRequestTest.mandje())
                .error.code());
        assertEquals("MV-NET", submitter(new FakePoster("{\"foo\":1}")).submit(GAME, 2, MoveRequestTest.mandje())
                .error.code());
    }

    @Test
    public void successStatusWithBrokenGameIsSuccess() {
        MoveSubmitter.Result r = submitter(new FakePoster("{\"status\":\"success\",\"content\":{\"game\":42}}"))
                .submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.SUCCESS, r.kind);
    }

    @Test
    public void failingStoreListenerAfterSuccessIsSuccess() {
        store.addListener(() -> {
            throw new IllegalStateException("listener");
        });
        MoveSubmitter.Result r = submitter(new FakePoster(fixture("move_hoort.json")))
                .submit(GAME, 2, MoveRequestTest.mandje());
        assertEquals(MoveSubmitter.Result.Kind.SUCCESS, r.kind);
        assertNotNull(store.game(GAME));
    }

    @Test
    public void unexpectedExceptionFromPosterIsNetErrorAndReleasesLock() {
        Poster boom = (u, b, h) -> {
            throw new IllegalStateException("boom");
        };
        MoveSubmitter s = submitter(boom);
        assertEquals("MV-NET", s.submit(GAME, 2, MoveRequestTest.mandje()).error.code());
        assertFalse(s.isBusy());
    }

    /** MANDJE with a cross word NDJ: two words formed. */
    private static app.wordfeudwordfinder.extension.solver.Move mandjeWithCross() {
        app.wordfeudwordfinder.extension.solver.Move m = MoveRequestTest.mandje();
        return new app.wordfeudwordfinder.extension.solver.Move(m.word, m.x, m.y, m.horizontal, m.placed,
                m.placedLetters, m.score, Arrays.asList("MANDJE", "NDJ"), m.bonuses, m.usesBoardLetter);
    }

    @Test
    public void serverNamedWordsAreRejectedEvenForAMultiWordMove() {
        FakePoster p = new FakePoster(
                "{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\",\"word\":\"ndj\"}}");
        MoveSubmitter s = submitter(p);
        MoveSubmitter.Result r = s.submit(GAME, 2, mandjeWithCross());
        assertEquals(MoveSubmitter.Result.Kind.REJECTED, r.kind);
        assertEquals(Collections.singletonList("NDJ"), r.words);
        assertFalse(r.oneOf);
        assertTrue(rejected.contains(2, "NDJ"));
        assertFalse(rejected.contains(2, "MANDJE"));
        assertFalse(s.hidden().isHidden(GAME, mandjeWithCross()));
    }

    @Test
    public void unnamedRejectionOfAMultiWordMoveHidesOnlyThatMove() {
        FakePoster p = new FakePoster("{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\"}}");
        MoveSubmitter s = submitter(p);
        MoveSubmitter.Result r = s.submit(GAME, 2, mandjeWithCross());
        assertEquals(MoveSubmitter.Result.Kind.REJECTED, r.kind);
        assertTrue(r.oneOf);
        assertEquals(Arrays.asList("MANDJE", "NDJ"), r.words);
        // no word is rejected permanently: the main word may well be valid
        assertFalse(rejected.contains(2, "MANDJE"));
        assertFalse(rejected.contains(2, "NDJ"));
        assertTrue(s.hidden().isHidden(GAME, mandjeWithCross()));
        assertFalse(s.hidden().isHidden(GAME + 1, mandjeWithCross()));
        // the same main word without the cross word is another move and stays listed
        assertFalse(s.hidden().isHidden(GAME, MoveRequestTest.mandje()));
        assertEquals(1, s.hidden().filter(GAME, Arrays.asList(mandjeWithCross(), MoveRequestTest.mandje())).size());
        assertEquals("type=illegal_word keys=type", r.server);
    }

    @Test
    public void rejectionShapeKeepsOnlyTypeKeyNamesAndWords() {
        assertEquals("type=illegal_word keys=foo,type",
                MoveSubmitter.rejectionShape(
                        "{\"status\":\"error\",\"content\":{\"type\":\"illegal_word\",\"foo\":\"secret\"}}"));
        assertEquals("type=illegal_word keys=type,word word=ABC", MoveSubmitter.rejectionShape(
                "{\"status\":\"error\",\"content\":{\"word\":\"ABC\",\"type\":\"illegal_word\"}}"));
        assertEquals("content=none", MoveSubmitter.rejectionShape("{\"status\":\"error\"}"));
        assertNull(MoveSubmitter.rejectionShape("not json"));
    }
}
