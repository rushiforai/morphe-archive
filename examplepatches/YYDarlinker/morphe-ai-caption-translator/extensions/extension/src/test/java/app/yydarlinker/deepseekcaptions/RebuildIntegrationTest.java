package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = 28,
    shadows = {RebuildIntegrationTest.Keys.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class RebuildIntegrationTest {
  @Implements(SecureApiKey.class)
  public static class Keys {
    @Implementation
    public static String load(Context c) {
      return "local-fixture-key";
    }
  }

  Activity a;
  MockWebServer server;
  Object oldEngine;
  Engine engine;
  AtomicInteger calls = new AtomicInteger();
  volatile int mode;
  volatile boolean blockResponse;
  CountDownLatch release;

  @Before
  public void setup() throws Exception {
    RebuildController.stop();
    RebuildApi.reset();
    a = Robolectric.buildActivity(Activity.class).setup().visible().get();
    SourceCaptionCache.clear(a);
    RebuildCache.clear(a);
    NativeAsrTrackReference.clear();
    CaptionDiagnostics.clear(a);
    server = new MockWebServer();
    release = new CountDownLatch(1);
    server.setDispatcher(
        new Dispatcher() {
          public MockResponse dispatch(RecordedRequest r) {
            calls.incrementAndGet();
            try {
              if (blockResponse) release.await(3, TimeUnit.SECONDS);
              JSONObject req = new JSONObject(r.getBody().clone().readUtf8());
              JSONObject input =
                  new JSONObject(
                      req.getJSONArray("messages").getJSONObject(1).getString("content"));
              if (mode == 1 && req.has("response_format"))
                return new MockResponse()
                    .setResponseCode(400)
                    .setBody("{\"error\":\"response_format unsupported\"}");
              if (mode == 2)
                return new MockResponse()
                    .setResponseCode(401)
                    .setBody("secret-error-never-exposed");
              if (mode == 3 || mode==7&&input.has("repair"))
                return new MockResponse()
                    .setBody(
                        "{\"choices\":[{\"finish_reason\":\"stop\",\"message\":{\"content\":\"not"
                            + " json\"}}]}");
              JSONArray words = input.getJSONArray("owned_tokens"), events = new JSONArray();
              int from = words.getJSONArray(0).getInt(0),
                  to = words.getJSONArray(words.length() - 1).getInt(0);
              String translation="这是一条完整的测试字幕。";
              if(mode>=5&&mode<=7)translation=mode==5&&input.has("repair")
                  ? "最后说明限制：虽然整集讨论中国现代化为何迅速，但这种速度恐怕不能永远持续。"
                  : "最后，我要对整体增长故事提出一些限制条件，";
              events.put(
                  new JSONObject().put("from", from).put("to", to).put("source",input.getString("source_text")).put("text", translation));
              String content =
                  new JSONObject()
                      .put("block", input.getString("block"))
                      .put("events", events)
                      .toString();
              return new MockResponse()
                  .setBody(
                      new JSONObject()
                          .put("model", "fixture")
                          .put(
                              "usage",
                              new JSONObject()
                                  .put("prompt_tokens", 100)
                                  .put("completion_tokens", 20))
                          .put(
                              "choices",
                              new JSONArray()
                                  .put(
                                      new JSONObject()
                                          .put("finish_reason", mode == 4 ? "length" : "stop")
                                          .put(
                                              "message", new JSONObject().put("content", content))))
                          .toString());
            } catch (Exception e) {
              return new MockResponse().setResponseCode(500).setBody("{}");
            }
          }
        });
    server.start();
    DeepSeekConfig.saveEnabled(a, true);
    DeepSeekConfig.saveBaseUrl(a, server.url("/v1").toString());
    DeepSeekConfig.saveModel(a, "fixture");
    CaptionChoice.select("zh-Hans", true, false);
    Field f = DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");
    f.setAccessible(true);
    oldEngine = f.get(null);
    engine = new Engine();
    f.set(null, engine);
    RebuildController.activity(a);
    RebuildController.video("rebuild0001");
    RebuildController.time(0);
  }

  @After
  public void cleanup() throws Exception {
    release.countDown();
    RebuildController.stop();
    Field f = DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");
    f.setAccessible(true);
    f.set(null, oldEngine);
    server.shutdown();
    a.finish();
  }

  public static class Engine {
    volatile int failures;
    volatile int gets;
    volatile boolean disconnected;
    volatile int duration = 2400;
    volatile int startMs;
    volatile String fixtureBody;

    public HttpURLConnection openConnection(URL u) throws Exception {
      gets++;
      boolean fail = failures-- > 0;
      byte[] bytes =
          ("{\"events\":[{\"tStartMs\":"
                  + startMs
                  + ",\"dDurationMs\":"
                  + duration
                  + ",\"segs\":[{\"utf8\":\"This is one complete sentence.\"}]}]}")
              .getBytes(StandardCharsets.UTF_8);
      final byte[] track =
          fixtureBody == null ? bytes : fixtureBody.getBytes(StandardCharsets.UTF_8);
      return new HttpURLConnection(u) {
        public void connect() {}

        public boolean usingProxy() {
          return false;
        }

        public void disconnect() {
          disconnected = true;
        }

        public int getResponseCode() throws IOException {
          if (fail) throw new IOException("fixture source drop");
          return 200;
        }

        public String getContentType() {
          return "application/json";
        }

        public InputStream getInputStream() {
          return new ByteArrayInputStream(track);
        }
      };
    }
  }

  static Object field(Object o, Class<?> c, String n) throws Exception {
    Field f = c.getDeclaredField(n);
    f.setAccessible(true);
    return f.get(o);
  }

  RebuildController.Session session() throws Exception {
    return (RebuildController.Session) field(null, RebuildController.class, "active");
  }

  void await(java.util.function.BooleanSupplier condition) throws Exception {
    long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
    while (System.nanoTime() < end) {
      if (condition.getAsBoolean()) return;
      Thread.sleep(15);
    }
    fail("timeout;calls=" + calls + ";diagnostics=" + CaptionDiagnostics.uiText(a));
  }

  void start(boolean original) throws Exception {
    RebuildController.activate(
        a,
        "https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&kind=asr"
            + (original ? "" : "&tlang=zh-Hans"),
        original,
        true);
  }

  void advance(long ms) {
    Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(ms));
  }

  DeepSeekConfig.Snapshot config() {
    return new DeepSeekConfig.Snapshot(
        true,
        server.url("/v1").toString(),
        "fixture",
        "Faithful translation",
        16,
        70,
        "local-fixture-key");
  }

  @Test
  public void productionControllerMakesUsableEvents() throws Exception {
    start(false);
    RebuildController.Session s = session();
    await(() -> s.states != null && s.states[0] == RebuildController.READY);
    assertEquals(1, calls.get());
    assertEquals(0, s.plans[0].events.get(0).start);
    assertEquals(2400, s.plans[0].events.get(0).end);
  }

  @Test
  public void originalModeMakesZeroModelCalls() throws Exception {
    start(true);
    RebuildController.Session s = session();
    await(() -> s.raw != null);
    RebuildController.time(1000);
    advance(100);
    assertEquals(0, calls.get());
    assertTrue(s.sourceOnly);
  }

  @Test
  public void acceptedReplayIsFree() throws Exception {
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    RebuildController.time(1800);
    RebuildController.time(300);
    advance(80);
    assertEquals(1, calls.get());
    assertEquals(RebuildController.READY, s.states[0]);
  }

  @Test
  public void coveringInFlightRequestNotDuplicatedOnSeek() throws Exception {
    blockResponse = true;
    start(false);
    await(() -> calls.get() == 1);
    RebuildController.time(1500);
    RebuildController.time(500);
    advance(80);
    assertEquals(1, calls.get());
    release.countDown();
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
  }

  @Test
  public void oldVideoCannotPublishOrRevive() throws Exception {
    blockResponse = true;
    start(false);
    await(() -> calls.get() == 1);
    RebuildController.Session old = session();
    RebuildController.video("rebuild0002");
    release.countDown();
    assertTrue(old.cancelled);
    assertFalse(RebuildController.visible());
    assertNull(session());
  }

  @Test
  public void foreignPrefetchCannotStealForeground() throws Exception {
    start(false);
    RebuildController.Session s = session();
    RebuildController.activate(
        a,
        "https://www.youtube.com/api/timedtext?v=rebuild0002&lang=en&tlang=zh-Hans",
        false,
        true);
    assertSame(s, session());
  }

  @Test
  public void turningOffClosesSourceOrApiConnections() throws Exception {
    blockResponse = true;
    start(false);
    await(() -> calls.get() == 1);
    RebuildController.Session s = session();
    RebuildController.stop();
    assertTrue(s.cancelled);
    assertTrue(s.connections.isEmpty());
    assertFalse(RebuildController.visible());
  }

  @Test
  public void formatFailureGetsOnlyOneRepair() throws Exception {
    mode = 3;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.states != null && s.states[0] == RebuildController.WAITING && s.attempts[0] == 1);
    advance(1500);
    await(() -> s.states[0] == RebuildController.FAILED);
    advance(5000);
    assertEquals(2, calls.get());
    assertEquals(1, s.repairCount);
    assertFalse(s.terminal);
  }

  @Test
  public void authenticationFailureStopsRequestsVisibly() throws Exception {
    mode = 2;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.terminal);
    advance(3000);
    assertEquals(1, calls.get());
    assertFalse(s.status.contains("secret-error"));
    assertTrue(s.status.contains("401"));
  }

  @Test
  public void sourceNetworkFailureRecoversWithoutToggle() throws Exception {
    engine.failures = 1;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.sourceFailures == 1);
    advance(1000);
    await(() -> s.plans != null && s.plans[0] != null);
    assertEquals(1, calls.get());
    assertTrue(engine.gets >= 2);
  }

  @Test
  public void failedSourceDoesNotSpendPaidRetries() throws Exception {
    engine.failures = 5;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.sourceFailures == 1);
    assertEquals(0, calls.get());
    assertEquals(0, s.repairCount);
  }

  @Test
  public void cacheRoundTripAvoidsSecondApiCall() throws Exception {
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    await(() -> RebuildCache.read(a, s.cacheKey, s.source, s.blocks.get(0)) != null);
    RebuildController.stop();
    start(false);
    RebuildController.Session next = session();
    await(() -> next.plans != null && next.plans[0] != null);
    assertEquals(1, calls.get());
    assertEquals(0, next.attempts[0]);
  }

  @Test
  public void corruptCacheIsNotAccepted() throws Exception {
    RebuildSource s = RebuildContractTest.source("hello world", 500);
    RebuildPlanner.Block b = RebuildContractTest.block(s);
    java.nio.file.Files.write(
        new File(RebuildCache.directory(a), "fixture-" + b.id() + ".json").toPath(),
        "garbage".getBytes(StandardCharsets.UTF_8));
    assertNull(RebuildCache.read(a, "fixture", s, b));
  }

  @Test
  public void translationConfigurationAndTimeInvalidateCache() {
    RebuildSource s = RebuildContractTest.source("hello world", 500),
        x = RebuildContractTest.source("hello world", 600);
    assertNotEquals(
        RebuildCache.identity(s, config(), "ja"), RebuildCache.identity(x, config(), "ja"));
    assertNotEquals(
        RebuildCache.identity(s, config(), "ja"), RebuildCache.identity(s, config(), "zh-Hans"));
  }

  @Test
  public void optionalSchemaNegotiationIsBoundedAndRemembered() throws Exception {
    mode = 1;
    RebuildSource s = RebuildContractTest.source("hello world", 500);
    RebuildPlanner.Block b = RebuildContractTest.block(s);
    RebuildApi.translate(s, b, config(), "zh-Hans", null, true, "");
    assertEquals(2, calls.get());
    RebuildApi.translate(s, b, config(), "zh-Hans", null, true, "");
    assertEquals(3, calls.get());
  }

  @Test
  public void testApiUsesExactlyThePlaybackProtocol() throws Exception {
    assertFalse(ContextualBatchApiClient.test(config()).isEmpty());
    RecordedRequest r = server.takeRequest(1, TimeUnit.SECONDS);
    JSONObject request = new JSONObject(r.getBody().readUtf8());
    JSONObject data =
        new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
    assertTrue(data.has("owned_tokens"));
    assertFalse(data.has("targets"));
  }

  @Test
  public void outputTruncationIsNotSalvaged() throws Exception {
    mode = 4;
    RebuildSource s = RebuildContractTest.source("hello world", 500);
    try {
      RebuildApi.translate(s, RebuildContractTest.block(s), config(), "ja", null, true, "");
      fail();
    } catch (RebuildProtocol.Invalid e) {
      assertEquals("output_truncated", e.code);
    }
  }

  @Test
  public void cancelledRequestDoesNotOpenNetwork() throws Exception {
    RebuildSource s = RebuildContractTest.source("hello world", 500);
    try {
      RebuildApi.translate(
          s,
          RebuildContractTest.block(s),
          config(),
          "ja",
          new DeepSeekApiClient.RequestControl() {
            public boolean isCancelled() {
              return true;
            }

            public void onConnection(HttpURLConnection c) {}
          },
          true,
          "");
      fail();
    } catch (InterruptedException expected) {
    }
    assertEquals(0, calls.get());
  }

  @Test
  public void debugEvidenceIsOptInAndRedacted() throws Exception {
    RebuildController.Session s;
    start(false);
    s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    assertEquals("", CaptionQualityTrace.text(a));
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, true);
    CaptionQualityTrace.record(
        a,
        "local-fixture-key",
        1,
        new JSONObject().put("x", "local-fixture-key"),
        "https://private.example/video",
        "Bearer abcdefghijkl");
    String evidence = CaptionQualityTrace.text(a);
    assertFalse(evidence.contains("local-fixture-key"));
    assertFalse(evidence.contains("private.example"));
  }

  @Test
  public void geometryNeverUsesUnverifiedWholeActivity() {
    FrameLayout host = new FrameLayout(a);
    a.setContentView(host);
    host.measure(1073742224, 1073742524);
    host.layout(0, 0, 400, 700);
    CaptionSurface.activity(a);
    assertNull(CaptionSurface.videoBounds(host));
  }

  @Test
  public void displayGuardRejectsDepartedText() throws Exception {
    CaptionOverlay.showCaption("stale", () -> false);
    assertNotEquals("stale", field(null, CaptionOverlay.class, "pendingText"));
  }

  @Test
  public void overlayRetainsTranslationUntilLayoutCanFit() throws Exception {
    String text = "完整的测试字幕不应被静默截断。";
    CaptionOverlay.showCaption(text, () -> true);
    assertEquals(text, field(null, CaptionOverlay.class, "pendingText"));
  }

  @Test
  public void repairBudgetDoesNotResetOnRewind() throws Exception {
    mode = 3;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.states != null && s.states[0] == RebuildController.WAITING && s.attempts[0] == 1);
    advance(1500);
    await(() -> s.states[0] == RebuildController.FAILED);
    RebuildController.time(1500);
    RebuildController.time(0);
    advance(3000);
    assertEquals(2, calls.get());
    assertEquals(1, s.repairCount);
  }

  @Test
  public void exhaustedSessionBudgetNeverStartsFifthRepair() throws Exception {
    mode = 3;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.states != null && s.states[0] == RebuildController.WAITING && s.attempts[0] == 1);
    s.repairCount = RebuildReview.MAX_SESSION_REPAIRS;
    advance(1800);
    assertEquals(RebuildController.FAILED, s.states[0]);
    assertEquals(1, calls.get());
  }

  @Test
  public void nativeBridgeEntryGoesToNewController() throws Exception {
    ContextualUnitCaptionController.activate(
        a, "https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&tlang=zh-Hans");
    RebuildController.Session s = session();
    assertNotNull(s);
    await(() -> s.plans != null && s.plans[0] != null);
    assertTrue(ContextualUnitCaptionController.isVisibleActive());
  }

  @Test
  public void clearingCacheRemovesNewFormat() throws Exception {
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    await(() -> RebuildCache.read(a, s.cacheKey, s.source, s.blocks.get(0)) != null);
    RebuildCache.clear(a);
    assertNull(RebuildCache.read(a, s.cacheKey, s.source, s.blocks.get(0)));
  }

  @Test
  public void persistentAuthenticationErrorIsBlockedAcrossVideos() throws Exception {
    mode = 2;
    start(false);
    RebuildController.Session first = session();
    await(() -> first.terminal);
    RebuildController.video("rebuild0002");
    RebuildController.time(0);
    RebuildController.activate(
        a,
        "https://www.youtube.com/api/timedtext?v=rebuild0002&lang=en&tlang=zh-Hans",
        false,
        true);
    RebuildController.Session second = session();
    await(() -> second.terminal);
    assertEquals(1, calls.get());
  }

  @Test
  public void explicitTestApiCanClearConfigurationBlock() throws Exception {
    mode = 2;
    RebuildSource s = RebuildContractTest.source("hello world", 500);
    try {
      RebuildApi.translate(s, RebuildContractTest.block(s), config(), "ja", null, true, "");
      fail();
    } catch (RebuildApi.Failure expected) {
      assertTrue(expected.configuration);
    }
    mode = 0;
    assertFalse(RebuildApi.test(config()).isEmpty());
    assertEquals(2, calls.get());
  }

  @Test
  public void callbackDoesNotRenderOlderTimeAfterTimerProjection() throws Exception {
    start(true);
    RebuildController.Session s = session();
    await(() -> s.source != null);
    advance(2000);
    RebuildClock clock = (RebuildClock) field(null, RebuildController.class, "CLOCK");
    long now = SystemClock.elapsedRealtime();
    clock.reset(now - 2000);
    clock.update(316000, now - 1000);
    assertEquals(317300, clock.position(now, 317000, now - 300, 1, 3));
    RebuildController.time(317076);
    assertEquals(317300, s.position);
    RebuildController.time(317328);
    assertEquals(317328, s.position);
    RebuildController.time(1000);
    assertEquals(1000, s.position); // Real rewind remains possible.
  }

  @Test
  public void beforeFirstCueStillCountsAsFocusNotAllBackground() throws Exception {
    TokenCostAudit.install(a);
    TokenCostAudit.clear(a);
    TokenCostAudit.onCoreSelected(a, "contextual_unit_v1");
    engine.startMs = 80;
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    String audit = TokenCostAudit.uiText(a);
    assertTrue(audit, audit.contains("当前优先：1 个逻辑请求 / 1 次 API"));
    assertTrue(audit, audit.contains("Event rebuild R2"));
  }

  @Test
  public void capturedFocusFlagSurvivesPositionChange() throws Exception {
    start(true);
    RebuildController.Session s = session();
    RebuildController.Job j = new RebuildController.Job(s, 0, true);
    s.position = 90000;
    assertTrue(j.priority);
  }

  @Test
  public void productionRequestUsesCorrectOrderFromOverlappingJson3() throws Exception {
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, true);
    engine.fixtureBody =
        new JSONObject()
            .put(
                "events",
                new JSONArray()
                    .put(RebuildR2SourceTest.cue(0, 5000, "The PLA was not", true))
                    .put(
                        RebuildR2SourceTest.cue(
                            1800, 5000, "born as a mechanized fighting machine.", true)))
            .toString();
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null);
    JSONObject request =
        new JSONObject(server.takeRequest(1, TimeUnit.SECONDS).getBody().readUtf8());
    JSONObject body =
        new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
    assertEquals(
        "The PLA was not born as a mechanized fighting machine.", body.getString("source_text"));
    assertEquals("estimated", body.getString("timing"));
    assertFalse(body.has("diagnostic_only_source_times"));
    assertTrue(CaptionQualityTrace.text(a).contains("diagnostic_only_source_times"));
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, false);
  }

  @Test
  public void sourceFallbackChoosesNewestCoveringCue() throws Exception {
    engine.fixtureBody =
        new JSONObject()
            .put(
                "events",
                new JSONArray()
                    .put(RebuildR2SourceTest.cue(0, 5000, "older words", false))
                    .put(RebuildR2SourceTest.cue(1800, 5000, "newer words", false)))
            .toString();
    start(true);
    RebuildController.Session s = session();
    await(() -> s.raw != null);
    Method original =
        RebuildController.class.getDeclaredMethod(
            "original", RebuildController.Session.class, long.class, boolean.class);
    original.setAccessible(true);
    assertEquals("newer words", original.invoke(null, s, 2000L, false));
    assertEquals(0, calls.get());
  }

  @Test
  public void eventCacheDirectoryIsNotR1() {
    assertEquals("caption-events-r2.12", RebuildCache.directory(a).getName());
  }

  void reviewSource()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray().put(RebuildR2SourceTest.cue(0,8000,
        "finally put some caveats on the overall growth story essentially explaining why after doing an entire episode on why china is modernizing so rapidly that pace of modernisation probably can't go on forever",false))).toString();
  }
  @Test public void advisoryReviewKeepsCandidateAndUsesOneBoundedRepair()throws Exception {
    mode=5;reviewSource();start(false);RebuildController.Session s=session();
    await(()->s.states!=null&&s.states[0]==RebuildController.WAITING&&s.plans[0]!=null);
    RebuildProtocol.Plan before=s.plans[0];assertTrue(RebuildReview.score(before.issues)>0);
    assertNull(RebuildCache.read(a,s.cacheKey,s.source,s.blocks.get(0)));
    advance(1500);await(()->s.states[0]==RebuildController.READY);
    assertEquals(2,calls.get());assertEquals(1,s.repairCount);
    if(s.pendingPlans[0]!=null){assertSame(before,s.plans[0]);assertEquals(0,RebuildReview.score(s.pendingPlans[0].issues)); RebuildController.time(8001);RebuildController.time(0);}
    assertEquals(0,RebuildReview.score(s.plans[0].issues));
    assertNotSame(before,s.plans[0]);assertTrue(s.plans[0].events.get(0).text.contains("不能"));
    String trace=CaptionDiagnostics.fullText(a);assertTrue(trace.contains("REBUILD_QUALITY_WARNING"));assertTrue(trace.contains("REBUILD_HTTP_RESPONSE"));
  }
  @Test public void unresolvedReviewDoesNotLoopOrDiscardCandidate()throws Exception {
    mode=6;reviewSource();start(false);RebuildController.Session s=session();
    await(()->s.states!=null&&s.states[0]==RebuildController.WAITING&&s.plans[0]!=null);
    advance(1500);await(()->s.states[0]==RebuildController.READY);advance(3000);
    assertEquals(2,calls.get());assertTrue(RebuildReview.score(s.plans[0].issues)>0);
    assertNull(RebuildCache.read(a,s.cacheKey,s.source,s.blocks.get(0)));
  }
  @Test public void malformedRepairPreservesPreviouslyValidatedCandidate()throws Exception {
    mode=7;reviewSource();start(false);RebuildController.Session s=session();
    await(()->s.states!=null&&s.states[0]==RebuildController.WAITING&&s.plans[0]!=null);
    RebuildProtocol.Plan before=s.plans[0];advance(1500);await(()->s.states[0]==RebuildController.READY);
    assertSame(before,s.plans[0]);assertEquals(2,calls.get());assertFalse(s.terminal);
  }
  @Test public void exhaustedSessionReviewBudgetMakesNoAdditionalCall()throws Exception {
    mode=6;reviewSource();start(false);RebuildController.Session s=session();
    await(()->s.states!=null&&s.states[0]==RebuildController.WAITING&&s.plans[0]!=null);
    synchronized(s){s.repairCount=RebuildReview.MAX_SESSION_REPAIRS;}advance(1500);await(()->s.states[0]==RebuildController.READY);
    assertEquals(1,calls.get());assertNotNull(s.plans[0]);
  }
  @Test public void pendingFallbackEndsWhenReadyAndCarriesSession()throws Exception {
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->calls.get()==1);
    assertTrue(CaptionDiagnostics.fullText(a).contains("REBUILD_FALLBACK_BEGIN"));
    release.countDown();await(()->s.plans!=null&&s.plans[0]!=null);
    await(()->CaptionDiagnostics.fullText(a).contains("REBUILD_FALLBACK_END"));
  }
  @Test public void startupAllowsOnlyOneNeighbourWhileFirstCallIsInFlight()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray()
        .put(RebuildR2SourceTest.cue(0,7000,"This is the first sentence.",false))
        .put(RebuildR2SourceTest.cue(7000,7000,"This is the second sentence.",false))
        .put(RebuildR2SourceTest.cue(14000,7000,"This is the third sentence.",false))).toString();
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->calls.get()==1);
    RebuildController.time(100);await(()->calls.get()==2);
    RebuildController.time(200);assertEquals(2,calls.get());
    assertEquals(1,s.attempts[0]);assertEquals(1,s.attempts[1]);
    assertEquals(2,Arrays.stream(s.states).filter(x->x==RebuildController.RUNNING).count());
    release.countDown();await(()->s.plans[0]!=null&&s.plans[1]!=null);
  }

  @Test
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void apiIncludesVerifiedGeometryAndRejectsOverflowWithoutExtraCall() throws Exception {
    Field budget = CaptionOverlay.class.getDeclaredField("layoutBudget");
    budget.setAccessible(true);
    budget.set(null, new CaptionOverlay.LayoutBudget(40, 12));
    try {
      RebuildSource source = RebuildContractTest.source("hello world", 500);
      RebuildProtocol.Plan candidate=RebuildApi.translate(source, RebuildContractTest.block(source),config(),"zh-Hans",null,true,"");
      assertTrue(candidate.issues.stream().anyMatch(x->x.code.equals("layout_overflow")));
      assertEquals(1, calls.get());
      JSONObject request =
          new JSONObject(server.takeRequest(1, TimeUnit.SECONDS).getBody().readUtf8());
      JSONObject body =
          new JSONObject(request.getJSONArray("messages").getJSONObject(1).getString("content"));
      assertEquals(2, body.getJSONObject("display_hint").getInt("max_lines"));
      assertEquals(3, body.getJSONObject("display_hint").getInt("approx_cjk_columns_per_line"));
    } finally {
      budget.set(null, null);
    }
  }

  @Test public void r28WaitingDoesNotSelectOriginalEnglish()throws Exception {
    blockResponse=true; start(false);await(()->calls.get()==1);
    RebuildController.Session s=session();
    assertTrue(s.lastShown.startsWith("status:"));
    assertFalse(s.lastShown.contains("[原文 / Original]"));
    assertTrue(s.lastShown.contains("字幕翻译中"));
  }
  @Test public void r28LateReadabilityDoesNotInventOrExtendTimes() {
    RebuildProtocol.Event e=new RebuildProtocol.Event(0,20,80,7040,"在2月24日之前，你只需在网上稍作搜索，就能找到声称俄罗斯拥有世界第二强军事力量的人");
    assertTrue(RebuildController.lateUnreadable(e,6282));
    assertFalse(RebuildController.lateUnreadable(e,200));
    assertEquals(7040,e.end);
    assertFalse(RebuildController.lateUnreadable(new RebuildProtocol.Event(0,0,0,2000,"是"),1800));
  }
  @Test public void r28DeferredCacheOnSeekMakesNoDuplicateTranslationCall()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray()
      .put(RebuildR2SourceTest.cue(0,7000,"This is the first sentence.",false))
      .put(RebuildR2SourceTest.cue(7000,7000,"This is the second sentence.",false))
      .put(RebuildR2SourceTest.cue(14000,7000,"This is the third sentence.",false))
      .put(RebuildR2SourceTest.cue(50000,7000,"This is the distant sentence.",false))).toString();
    start(false);RebuildController.Session s=session();await(()->s.plans!=null&&s.plans[0]!=null&&s.plans[1]!=null);
    assertFalse(s.cacheChecked[2]);
    RebuildPlanner.Block b=s.blocks.get(2);
    String json=RebuildContractTest.reply(b,new JSONArray().put(RebuildR26Test.quoted(s.source,b.from,b.to,"这是已缓存的第三句。")));
    RebuildCache.write(a,s.cacheKey,b,RebuildProtocol.parseBound(json,s.source,b));int before=calls.get();
    RebuildController.time(50050);await(()->s.plans[2]!=null);
    assertEquals(before,calls.get());assertEquals(0,s.attempts[2]);assertTrue(s.cacheChecked[2]);
  }
}
