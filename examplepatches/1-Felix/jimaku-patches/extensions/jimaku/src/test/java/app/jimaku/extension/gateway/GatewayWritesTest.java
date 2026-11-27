package app.jimaku.extension.gateway;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;
import app.jimaku.extension.subtitles.Line;

/** The gateway's write half, as {@code gateway.ts} calls it, against the local test server. */
public class GatewayWritesTest {
    private static final String VIDEO = "bWCkSOafQNc";
    private static final String USER_AGENT = "Jimaku-Android/1.2.3";
    private static final String STATUS = "{\"job\":\"j1\",\"video\":\"" + VIDEO + "\",\"kind\":\"captions\",\"lang\":\"de\",\"state\":\"translating\",\"percent\":40,\"reason\":null}";

    private TestServer server;
    private MemoryInstalls installs;
    private Gateway gateway;

    @Before
    public void start() throws IOException {
        server = new TestServer();
        installs = new MemoryInstalls();
        gateway = new Gateway(server.origin(), USER_AGENT, 5_000, installs);
        server.answer("/installs", 201, "{\"install\":\"i1\",\"secret\":\"s1\"}");
    }

    @After
    public void stop() throws IOException {
        server.close();
    }

    @Test
    public void startsStandardWithTheCaptionTrackAsItsBody() throws Exception {
        server.answer("/jobs", 201, "{\"job\":\"j1\",\"kind\":\"captions\",\"state\":\"waiting\",\"percent\":null,\"joined\":false}");
        String body = "{\"title\":\"魔法\",\"events\":[]}";
        StartedJob started = gateway.start(StartRequest.captions(VIDEO, "魔法", "de", 124.6, "ja", body), new Cancellation());
        assertEquals("j1", started.job);
        assertEquals(JobKind.CAPTIONS, started.kind);
        assertEquals(JobState.WAITING, started.state);
        assertNull(started.percent);
        assertFalse(started.joined);

        TestServer.Request sent = server.requestsTo("/jobs").get(0);
        assertEquals("POST /jobs?video=" + VIDEO + "&lang=de&method=captions&duration=125&source=ja HTTP/1.1", sent.line);
        assertEquals("application/json", sent.header("content-type"));
        assertEquals("Bearer s1", sent.header("authorization"));
        assertEquals(body, sent.body);
    }

    @Test
    public void startsATranslationWithNothingInItsBody() throws Exception {
        server.answer("/jobs", 200, "{\"job\":\"j2\",\"kind\":\"translate\",\"state\":\"translating\",\"percent\":12.5,\"joined\":true}");
        StartedJob started = gateway.start(StartRequest.premium(VIDEO, "t", "zh-Hant", 0.2), new Cancellation());
        assertEquals(JobKind.TRANSLATE, started.kind);
        assertEquals(12.5, started.percent, 0);
        assertTrue(started.joined);
        TestServer.Request sent = server.requestsTo("/jobs").get(0);
        assertEquals("POST /jobs?video=" + VIDEO + "&lang=zh-Hant&method=premium&duration=1 HTTP/1.1", sent.line);
        assertEquals("0", sent.header("content-length"));
        assertNull(sent.header("content-type"));
    }

    @Test
    public void aRefusalCarriesItsCodeAndWhatCameWithIt() {
        server.answer("/jobs", 409, "{\"error\":\"busy\",\"video\":\"aaaaaaaaaaa\"}");
        GatewayException refused = refusal(() -> gateway.start(StartRequest.premium(VIDEO, "t", "de", 60), new Cancellation()));
        assertEquals("busy", refused.code);
        assertEquals("aaaaaaaaaaa", refused.extra.get("video"));
        assertFalse(refused.extra.containsKey("error"));

        server.answer("/jobs", 429, "{\"error\":\"daily_limit\",\"resets\":1790000000000}");
        assertEquals("daily_limit", refusal(() -> gateway.start(StartRequest.premium(VIDEO, "t", "de", 60), new Cancellation())).code);
        server.answer("/jobs", 502, "<html>");
        assertEquals("http_502", refusal(() -> gateway.start(StartRequest.premium(VIDEO, "t", "de", 60), new Cancellation())).code);
    }

    @Test
    public void aStartTheGatewayAnswersOddlyIsABadAnswer() {
        for (String answer : new String[]{
                "{\"kind\":\"captions\",\"state\":\"waiting\"}",
                "{\"job\":\"j\",\"kind\":\"other\",\"state\":\"waiting\"}",
                "{\"job\":\"j\",\"kind\":\"captions\",\"state\":\"paused\"}",
                "[]"}) {
            server.answer("/jobs", 201, answer);
            assertEquals(answer, "bad_answer", refusal(() -> gateway.start(StartRequest.premium(VIDEO, "t", "de", 60), new Cancellation())).code);
        }
    }

    @Test
    public void theInstallIsCreatedOnceForConcurrentCallers() throws Exception {
        server.answerLate("/installs", 300, 201, "{\"install\":\"i1\",\"secret\":\"s1\"}");
        server.answer("/jobs/j1", 200, STATUS);
        ExecutorService threads = Executors.newFixedThreadPool(4);
        CountDownLatch go = new CountDownLatch(1);
        try {
            List<Future<JobStatus>> checks = new ArrayList<>();
            for (int i = 0; i < 4; i++) {
                checks.add(threads.submit(() -> {
                    go.await();
                    return gateway.job("j1", new Cancellation());
                }));
            }
            go.countDown();
            for (Future<JobStatus> check : checks) assertEquals(JobState.TRANSLATING, check.get(5, TimeUnit.SECONDS).state);
        } finally {
            threads.shutdownNow();
        }
        assertEquals(1, server.requestsTo("/installs").size());
        assertEquals("s1", installs.install.secret);
        for (TestServer.Request check : server.requestsTo("/jobs/j1")) assertEquals("Bearer s1", check.header("authorization"));
    }

    @Test
    public void anInstallTheGatewayNoLongerKnowsIsReplacedOnce() throws Exception {
        installs.install = new Install("old", "s0");
        server.answerFirst("/jobs/j1", 401, "{\"error\":\"unknown_install\"}", 200, STATUS);
        assertEquals("j1", gateway.job("j1", new Cancellation()).job);
        List<TestServer.Request> checks = server.requestsTo("/jobs/j1");
        assertEquals(2, checks.size());
        assertEquals("Bearer s0", checks.get(0).header("authorization"));
        assertEquals("Bearer s1", checks.get(1).header("authorization"));
        assertEquals("i1", installs.install.install);
    }

    @Test
    public void aSecondUnknownInstallIsTheAnswer() {
        installs.install = new Install("old", "s0");
        server.answer("/jobs/j1", 401, "{\"error\":\"unknown_install\"}");
        assertEquals("unknown_install", refusal(() -> gateway.job("j1", new Cancellation())).code);
        assertEquals(2, server.requestsTo("/jobs/j1").size());
        assertEquals(1, server.requestsTo("/installs").size());
    }

    @Test
    public void tooManyInstallsIsSaid() {
        server.answer("/installs", 429, "{\"error\":\"too_many_installs\",\"retryAt\":1790000000000}");
        assertEquals("too_many_installs", refusal(() -> gateway.start(StartRequest.premium(VIDEO, "t", "de", 60), new Cancellation())).code);
        assertTrue(server.requestsTo("/jobs").isEmpty());
        assertNull(installs.install);
    }

    @Test
    public void readsAJobsStatus() throws Exception {
        server.answer("/jobs/j1", 200, "{\"job\":\"j1\",\"video\":\"" + VIDEO + "\",\"kind\":\"premium\",\"lang\":\"en\",\"state\":\"failed\",\"percent\":null,\"reason\":\"no_speech\"}");
        JobStatus status = gateway.job("j1", new Cancellation());
        assertEquals(VIDEO, status.video);
        assertEquals(JobKind.PREMIUM, status.kind);
        assertEquals("en", status.lang);
        assertEquals(JobState.FAILED, status.state);
        assertNull(status.percent);
        assertEquals("no_speech", status.reason);

        server.answer("/jobs/j1", 200, "{\"job\":\"j1\",\"kind\":\"premium\",\"lang\":\"en\",\"state\":\"done\"}");
        assertEquals("bad_answer", refusal(() -> gateway.job("j1", new Cancellation())).code);
        server.answer("/jobs/j1", 404, "{\"error\":\"not_found\"}");
        assertEquals("not_found", refusal(() -> gateway.job("j1", new Cancellation())).code);
    }

    @Test
    public void aJobsIdIsOneSegmentOfThePath() throws Exception {
        server.answer("/jobs/a%2Fb%20c", 200, STATUS);
        gateway.job("a/b c", new Cancellation());
        assertEquals("GET /jobs/a%2Fb%20c HTTP/1.1", server.requests.get(server.requests.size() - 1).line);
    }

    @Test
    public void stopSaysWhatCameBack() throws Exception {
        server.answer("/jobs/j1/stop", 200, "{\"refunded\":0,\"kept\":\"transcript\"}");
        StoppedJob kept = gateway.stop("j1", new Cancellation());
        assertTrue(kept.keptTranscript);
        assertEquals("POST", server.requestsTo("/jobs/j1/stop").get(0).method());

        server.answer("/jobs/j1/stop", 200, "{\"refunded\":300,\"kept\":null}");
        StoppedJob refunded = gateway.stop("j1", new Cancellation());
        assertFalse(refunded.keptTranscript);
        assertEquals(300, refunded.refunded, 0);

        for (String answer : new String[]{"{\"refunded\":300}", "{\"refunded\":300,\"kept\":\"minutes\"}", "{\"kept\":null}"}) {
            server.answer("/jobs/j1/stop", 200, answer);
            assertEquals(answer, "bad_answer", refusal(() -> gateway.stop("j1", new Cancellation())).code);
        }
        server.answer("/jobs/j1/stop", 409, "{\"error\":\"finished\"}");
        assertEquals("finished", refusal(() -> gateway.stop("j1", new Cancellation())).code);
    }

    @Test
    public void linesSoFarAreNoneUntilThereAreSome() throws Exception {
        assertTrue(gateway.partial("j1", new Cancellation()).isEmpty());
        server.answer("/jobs/j1/partial", 200, "{\"lines\":[{\"start\":1,\"end\":2,\"text\":\"Hallo\"}]}");
        List<Line> lines = gateway.partial("j1", new Cancellation());
        assertEquals(1, lines.size());
        assertEquals("Hallo", lines.get(0).text);
    }

    @Test
    public void readsAStandardResultWithAndWithoutItsOriginal() throws Exception {
        server.answer("/jobs/j1/result", 200, "{\"lines\":[{\"start\":1,\"end\":2,\"text\":\"Hallo\"}],"
                + "\"original\":{\"lang\":\"ja\",\"lines\":[{\"start\":1,\"end\":2,\"text\":\"こんにちは\"}]}}");
        CaptionResult result = gateway.result("j1", new Cancellation());
        assertEquals("Hallo", result.lines.get(0).text);
        assertEquals("ja", result.originalLang);
        assertEquals("こんにちは", result.originalLines.get(0).text);

        server.answer("/jobs/j1/result", 200, "{\"lines\":[],\"original\":null}");
        CaptionResult alone = gateway.result("j1", new Cancellation());
        assertTrue(alone.lines.isEmpty());
        assertNull(alone.originalLang);
        assertNull(alone.originalLines);

        server.answer("/jobs/j1/result", 200, "{\"lines\":[],\"original\":{\"lang\":\"xx\",\"lines\":[]}}");
        assertEquals("bad_answer", refusal(() -> gateway.result("j1", new Cancellation())).code);
        server.answer("/jobs/j1/result", 200, "{\"lines\":[],\"original\":\"ja\"}");
        assertEquals("bad_answer", refusal(() -> gateway.result("j1", new Cancellation())).code);
    }

    @Test
    public void readsCarryNoAuthorizationAlsoWithAnInstall() throws Exception {
        installs.install = new Install("i1", "s1");
        server.answer("/videos/" + VIDEO, 200, "{\"video\":\"" + VIDEO + "\",\"original\":\"ja\",\"translations\":[\"de\"]}");
        server.answer("/videos/" + VIDEO + "/de", 200, "{\"lines\":[]}");
        gateway.lookup(VIDEO, new Cancellation());
        assertEquals("de", gateway.freshLookup(VIDEO, new Cancellation()).translations.get(0));
        gateway.document(VIDEO, "de", new Cancellation());
        assertEquals("GET /videos/" + VIDEO + "?fresh=1 HTTP/1.1", server.requests.get(1).line);
        for (TestServer.Request read : server.requests) assertNull(read.header("authorization"));
        assertTrue(server.requestsTo("/installs").isEmpty());
    }

    private interface Call {
        Object run() throws GatewayException;
    }

    private static GatewayException refusal(Call call) {
        try {
            call.run();
        } catch (GatewayException e) {
            return e;
        }
        fail("expected a refusal");
        return null;
    }
}
