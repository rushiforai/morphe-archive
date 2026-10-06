package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.media.session.MediaController;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
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
  MediaSession mediaSession;
  /** N24 gate: translation requests for these block ids wait until {@link #n24Gate} opens. */
  final Set<String> n24GateBlocks = ConcurrentHashMap.newKeySet();
  volatile CountDownLatch n24Gate;
  /** N24 observation: requests the fixture server has actually received, and its live concurrency. */
  final Set<String> n24SeenBlocks = ConcurrentHashMap.newKeySet();
  final java.util.Map<String,AtomicInteger> n24BlockCalls = new ConcurrentHashMap<>();
  final AtomicInteger n24InFlight = new AtomicInteger();
  final AtomicInteger n24MaxInFlight = new AtomicInteger();
  /** N24: when set the fixture answers per block so a presentation can be traced to its own block. */
  volatile boolean n24TextByBlock;
  volatile RebuildController.Session n37LedgerSession;
  final java.util.concurrent.ConcurrentLinkedQueue<String> n37RequestLedger=new java.util.concurrent.ConcurrentLinkedQueue<>();
  volatile CountDownLatch n37PrefetchGate;
  final Set<String> n37PrefetchBlocks=ConcurrentHashMap.newKeySet();
  void n37Identity(String phase,String blockId)throws Exception{
    RebuildController.Session s=n37LedgerSession;if(s==null)return;
    synchronized(s){for(int i=0;i<s.blocks.size();i++)if(s.blocks.get(i).id().equals(blockId)){
      RebuildController.Job j=s.jobs[i];
      n37RequestLedger.add(new JSONObject().put("phase",phase).put("session",s.id).put("block",blockId)
        .put("index",i).put("requestID",j==null?-1:j.traceId).put("purpose",j==null?"completed":j.priority?"focus":"prefetch")
        .put("generation",s.generation).put("time",SystemClock.elapsedRealtime())
        .put("cancel",j!=null&&j.cancelled).put("publication_finish_sent",s.publication.finishSent()).toString());break;
    }}
  }

  @Before
  public void setup() throws Exception {
    RebuildController.stop();
    // N36: the player authority and its transition coordinator are process-wide; a fixture Activity
    // must start from a clean authority instead of inheriting the previous test owner state.
    CaptionPlayerTransitionGuard.resetForTests();
    CaptionPlayerAuthority.resetForTests();
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
            int live = n24InFlight.incrementAndGet();
            n24MaxInFlight.accumulateAndGet(live, Math::max);
            try {
              if (blockResponse) release.await(3, TimeUnit.SECONDS);
              JSONObject req = new JSONObject(r.getBody().clone().readUtf8());
              JSONObject input =
                  new JSONObject(
                      req.getJSONArray("messages").getJSONObject(1).getString("content"));
              String blockId = input.optString("block", "");
              n37Identity("received",blockId);
              n24SeenBlocks.add(blockId);
              n24BlockCalls.computeIfAbsent(blockId, k -> new AtomicInteger()).incrementAndGet();
              // The N24 tests hold chosen blocks open to prove that a second slot stays usable.
              CountDownLatch gate = n24Gate;
              if (gate != null && n24GateBlocks.contains(blockId)) gate.await(15, TimeUnit.SECONDS);
              if(n37PrefetchGate!=null&&n37PrefetchBlocks.contains(blockId))n37PrefetchGate.await(15,TimeUnit.SECONDS);
              n37Identity("response",blockId);
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
              if(n24TextByBlock)translation="这是"+blockId+"的译文。";
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
            } finally {
              n24InFlight.decrementAndGet();
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
    CountDownLatch gate = n24Gate;
    if (gate != null) gate.countDown();
    CountDownLatch finalGate = n37PrefetchGate;
    if (finalGate != null) finalGate.countDown();
    RebuildController.stop();
    if (mediaSession != null) mediaSession.release();
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
    fail("timeout;calls=" + calls + ";diagnostics=" + N37DiagnosticsReports.read(a));
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
    await(() -> s.source != null);
    RebuildController.time(1000);
    advance(100);
    assertEquals(0, calls.get());
    assertTrue(s.sourceOnly);
    assertTrue(s.lastShown,s.lastShown.endsWith("|This is one complete sentence.|"));
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
  public void acceptedResponseIsDurableBeforeImmediateRestart() throws Exception {
    start(false);
    RebuildController.Session first = session();
    await(() -> CaptionDiagnostics.fullText(a).contains(
        "REBUILD_EVENTS_ACCEPTED | block=0;events=1;session=" + first.id + ";"));
    assertNotNull(first.plans[0]);
    assertEquals(1, calls.get());

    RebuildController.stop();
    start(false);
    RebuildController.Session replay = session();
    await(() -> replay.plans != null && replay.plans[0] != null);
    assertEquals(first.cacheKey, replay.cacheKey);
    assertEquals(0, replay.attempts[0]);
    assertEquals(1, calls.get());
  }

  @Test
  public void promptModelAndSourceChangesInvalidateAcceptedBlock() throws Exception {
    start(false);
    RebuildController.Session first = session();
    await(() -> first.plans != null && first.plans[0] != null);
    assertEquals(1, calls.get());
    String firstKey = first.cacheKey;
    String blockId = first.blocks.get(0).id();

    RebuildController.stop();
    DeepSeekConfig.savePrompt(a, "N12 changed translation prompt");
    start(false);
    RebuildController.Session changedPrompt = session();
    await(() -> changedPrompt.plans != null && changedPrompt.plans[0] != null);
    assertEquals(blockId, changedPrompt.blocks.get(0).id());
    assertNotEquals(firstKey, changedPrompt.cacheKey);
    assertEquals(1, changedPrompt.attempts[0]);
    assertEquals(2, calls.get());

    RebuildController.stop();
    DeepSeekConfig.saveModel(a, "fixture-n12-model");
    start(false);
    RebuildController.Session changedModel = session();
    await(() -> changedModel.plans != null && changedModel.plans[0] != null);
    assertEquals(blockId, changedModel.blocks.get(0).id());
    assertNotEquals(changedPrompt.cacheKey, changedModel.cacheKey);
    assertEquals(1, changedModel.attempts[0]);
    assertEquals(3, calls.get());

    RebuildSource changedSource = RebuildR2SourceTest.json(new JSONArray().put(
        RebuildR2SourceTest.cue(0, 2400, "That is one complete sentence.", false)));
    RebuildPlanner.Block changedBlock = RebuildPlanner.plan(changedSource).get(0);
    String changedSourceKey = RebuildCache.identity(
        changedSource, changedModel.config, changedModel.target);
    assertEquals(blockId, changedBlock.id());
    assertNotEquals(changedModel.cacheKey, changedSourceKey);
    assertNull(RebuildCache.read(a, changedSourceKey, changedSource, changedBlock));
    assertEquals(3, calls.get());
  }

  @Test
  public void seekBackToGeneratedBlockDoesNotRequestAgain() throws Exception {
    engine.fixtureBody = new JSONObject().put("events", new JSONArray()
        .put(RebuildR2SourceTest.cue(0, 7000, "This is the first sentence.", false))
        .put(RebuildR2SourceTest.cue(7000, 7000, "This is the second sentence.", false))
        .put(RebuildR2SourceTest.cue(14000, 7000, "This is the third sentence.", false))
        .put(RebuildR2SourceTest.cue(50000, 7000, "This is the distant sentence.", false)))
        .toString();
    start(false);
    RebuildController.Session s = session();
    await(() -> s.plans != null && s.plans[0] != null && s.plans[1] != null);
    assertEquals(RebuildController.READY, s.states[1]);
    int replayedBlockAttempts = s.attempts[1];

    RebuildController.time(50050);
    await(() -> s.plans[2] != null);
    int callsBeforeReplay = calls.get();
    RebuildController.time(7000);
    advance(1500);
    assertEquals(RebuildController.READY, s.states[1]);
    assertEquals(replayedBlockAttempts, s.attempts[1]);
    assertEquals(callsBeforeReplay, calls.get());
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
    assertTrue(audit, audit.contains("Current priority: 1 logical request / 1 API call"));
    assertTrue(audit, audit.contains("Event rebuild / " + RebuildProtocol.VERSION));
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
            "original", RebuildController.Session.class, long.class);
    original.setAccessible(true);
    assertEquals("newer words", original.invoke(null, s, 2000L));
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
    advance(1500);await(()->calls.get()==2 && s.states[0]==RebuildController.WAITING);
    advance(1500);await(()->s.states[0]==RebuildController.READY);advance(3000);
    assertEquals(3,calls.get());assertEquals(2,s.repairCount);
    assertTrue(RebuildReview.score(s.plans[0].issues)>0);
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
  @Test public void startupPrefetchesUpToTheBackgroundBudgetAndKeepsTheFocusLaneFree()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray()
        .put(RebuildR2SourceTest.cue(0,7000,"This is the first sentence.",false))
        .put(RebuildR2SourceTest.cue(7000,7000,"This is the second sentence.",false))
        .put(RebuildR2SourceTest.cue(14000,7000,"This is the third sentence.",false))).toString();
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->calls.get()==1);
    // N24 D4: the in-flight current block no longer holds the background lane shut.
    RebuildController.time(100);await(()->calls.get()==2);
    assertEquals(2,s.blocks.size());
    assertEquals(1,s.attempts[0]);
    assertEquals("the qualified successor is prefetched while the current block is open",1,s.attempts[1]);
    String diag=CaptionDiagnostics.fullText(a);
    assertTrue(diag.contains("purpose=focus"));
    assertTrue("the successor request runs on the background lane",
        diag.contains("block="+s.blocks.get(1).id()+";purpose=prefetch"));
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

  @Test public void a01ColdWaitShowsPlaceholderThenReplacesWithinOwnedWindow()throws Exception {
    engine.startMs=80;engine.duration=6960;
    blockResponse=true; start(false);await(()->calls.get()==1);
    RebuildController.time(92);
    RebuildController.Session s=session();
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:source:0:80_7040"));
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+CaptionStrings.get(a,"caption_translating")+"|"));
    assertFalse(s.lastShown.contains("This is one complete sentence."));
    assertEquals("",s.displayedEvent);
    release.countDown();await(()->s.plans[0]!=null);
    RebuildController.time(3195);
    assertTrue(s.lastShown,s.lastShown.contains("这是一条完整的测试字幕。"));
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:0:0-"));
    assertTrue(s.position<7040);
    assertEquals(7040,s.plans[0].events.get(0).end);
  }
  @Test public void rawSourceShowsWaitingPlaceholderWithinOwnedCueBeforeEnginePlanExists()throws Exception {
    engine.startMs=80;engine.duration=6960;
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->s.blocks!=null);
    RebuildSource savedSource=s.source;
    List<RebuildPlanner.Block> savedBlocks=s.blocks;
    RebuildProtocol.Plan[] savedPlans=s.plans;
    synchronized(s){
      s.source=null;s.blocks=null;s.plans=null;s.position=92;s.lastShown="";
    }
    Method render=RebuildController.class.getDeclaredMethod("render",RebuildController.Session.class);
    render.setAccessible(true);render.invoke(null,s);
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:source:raw:80_7040"));
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+CaptionStrings.get(a,"caption_translating")+"|"));
    assertFalse(s.lastShown,s.lastShown.contains("This is one complete sentence."));
    assertFalse(s.lastShown,s.lastShown.contains("字幕准备中"));
    synchronized(s){s.position=7040;s.lastShown="";}
    render.invoke(null,s);
    assertFalse(s.lastShown,s.lastShown.contains("This is one complete sentence."));
    synchronized(s){s.source=savedSource;s.blocks=savedBlocks;s.plans=savedPlans;}
  }
  @Test public void lateReadySkipsExpiredFirstBlockAndRequestsCurrentBlock()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray()
        .put(RebuildR2SourceTest.cue(80,6960,"This is the first sentence.",false))
        .put(RebuildR2SourceTest.cue(7040,12960,"This is the current sentence.",false))).toString();
    RebuildController.time(11420);blockResponse=true;start(false);
    RebuildController.Session s=session();await(()->s.blocks!=null&&calls.get()==1);
    assertEquals(0,s.attempts[0]);
    assertEquals(1,s.attempts[1]);
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+CaptionStrings.get(a,"caption_translating")+"|"));
    assertFalse(s.lastShown,s.lastShown.contains("This is the current sentence."));
    assertTrue(CaptionDiagnostics.fullText(a).contains("skipped_due_to_late_ready"));
  }
  @Test public void failedBlockStaysBlankWithEachCueOnlyInItsOwnTime()throws Exception {
    engine.fixtureBody=new JSONObject().put("events",new JSONArray()
      .put(RebuildR2SourceTest.cue(80,6960,"This is the first sentence.",false))
      .put(RebuildR2SourceTest.cue(7040,12960,"Earlier claims belong to this cue.",false))
      .put(RebuildR2SourceTest.cue(20000,8920,"Later equipment belongs to this cue.",false))).toString();
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->s.blocks!=null);
    assertEquals(7040,s.blocks.get(1).start);
    assertEquals(28920,s.blocks.get(1).end);
    synchronized(s){s.states[1]=RebuildController.FAILED;s.reasons[1]="semantic_anchor_leak";}
    RebuildController.time(7000);
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+CaptionStrings.get(a,"caption_translating")+"|"));
    assertFalse(s.lastShown,s.lastShown.contains("This is the first sentence."));
    assertFalse(s.lastShown,s.lastShown.contains("字幕暂不可用"));
    assertFalse(s.lastShown,s.lastShown.contains("Later equipment"));
    RebuildController.time(7040);
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:source:1:7040_20000"));
    assertTrue(s.lastShown,s.lastShown.endsWith("||"));
    assertEquals("failed:semantic_anchor_leak",s.fallbackReason);
    long blankRevision=s.renderRevision;
    RebuildController.time(7041);
    assertEquals("identical blank owned cue must remain deduplicated",blankRevision,s.renderRevision);
    assertFalse(s.lastShown,s.lastShown.contains("Earlier claims"));
    assertFalse(s.lastShown,s.lastShown.contains("Later equipment"));
    assertFalse(s.lastShown,s.lastShown.contains("字幕暂不可用"));
    RebuildController.time(19999);
    assertFalse(s.lastShown,s.lastShown.contains("Later equipment"));
    RebuildController.time(20000);
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:source:1:20000_28920"));
    assertTrue(s.lastShown,s.lastShown.endsWith("||"));
    assertTrue("the next blank cue still produces its own render",s.renderRevision>blankRevision);
    RebuildController.time(28920);
    assertFalse(s.lastShown,s.lastShown.contains("Later equipment"));
    assertEquals("",s.fallbackReason);
    assertTrue(CaptionDiagnostics.fullText(a).contains("reason=failed:semantic_anchor_leak"));
    RebuildLayoutTest.exportDiagnostics("controller-failure-diagnostics.txt",CaptionDiagnostics.fullText(a));
  }
  @Test public void eventReviewStaysBlankWithinOwnedWindowAndKeepsAcceptedTextWhenSafe()throws Exception {
    engine.startMs=384639;engine.duration=7105;
    engine.fixtureBody=new JSONObject().put("events",new JSONArray().put(
        RebuildR2SourceTest.cue(384639,7105,"Foreign investment and explosive economic growth followed.",false))).toString();
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->s.blocks!=null);
    RebuildPlanner.Block b=s.blocks.get(0);
    RebuildProtocol.Event event=new RebuildProtocol.Event(b.from,b.to,b.start,b.end,"可展示的译文");
    synchronized(s){
      s.plans[0]=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",Collections.emptyList());
      s.states[0]=RebuildController.READY;
    }
    RebuildController.time(384647);
    assertTrue(s.lastShown,s.lastShown.contains("可展示的译文"));
    synchronized(s){
      s.plans[0]=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",Collections.singletonList(
          new RebuildReview.Issue(b.from,b.to,"possible_subject_attachment","review",true)));
    }
    RebuildController.time(384648);
    assertTrue(s.lastShown,s.lastShown.startsWith("caption:source:0:"));
    assertTrue(s.lastShown,s.lastShown.endsWith("||"));
    assertFalse(s.lastShown,s.lastShown.contains("Foreign investment"));
    assertFalse(s.lastShown,s.lastShown.contains("可展示的译文"));
    assertEquals("event_review",s.fallbackReason);
    assertTrue(CaptionDiagnostics.fullText(a).contains("reason=event_review"));
    assertFalse(s.lastShown,s.lastShown.contains("字幕暂不可用"));
    RebuildController.time(391744);
    assertFalse(s.lastShown,s.lastShown.contains("Foreign investment"));
    assertEquals("",s.fallbackReason);
  }

  @Test public void lateArrivalDisplaysAcceptedTextWithoutBorrowingItsOwnEnd()throws Exception {
    engine.startMs=80;engine.duration=6960;
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->s.blocks!=null);
    RebuildPlanner.Block b=s.blocks.get(0);
    RebuildProtocol.Event event=new RebuildProtocol.Event(b.from,b.to,b.start,b.end,
        "这段译文来得太晚，不能把后续时间借给当前字幕。");
    synchronized(s){
      s.plans[0]=new RebuildProtocol.Plan(Collections.singletonList(event),"{}",Collections.emptyList());
      s.states[0]=RebuildController.READY;
    }
    RebuildController.time(6282);
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+event.text+"|"));
    assertFalse(s.lastShown,s.lastShown.contains(CaptionStrings.get(a,"caption_translating")));
    assertFalse(s.lastShown,s.lastShown.contains("This is one complete sentence."));
    assertEquals("",s.fallbackReason);
    String history=CaptionDiagnostics.fullText(a);
    assertTrue(history.contains("REBUILD_LATE_ARRIVAL_WATCH"));
    assertTrue(history.contains(";remaining=758"));
    assertTrue(history.contains("reason=late_arrival_watch"));
    RebuildLayoutTest.exportDiagnostics("controller-late-diagnostics.txt",history);
    RebuildController.time(7040);
    assertTrue(s.lastShown,s.lastShown.endsWith("||"));
    assertEquals("",s.fallbackReason);
    assertEquals(7040,event.end);
  }

  @Test public void emptyStartupStatusUsesWaitingAndActionableStatusesRemainVisible()throws Exception {
    blockResponse=true;start(false);RebuildController.Session s=session();await(()->s.blocks!=null);
    RebuildSource saved=s.source;
    RawCaptionSource.Source savedRaw=s.raw;
    Method render=RebuildController.class.getDeclaredMethod("render",RebuildController.Session.class);
    render.setAccessible(true);
    synchronized(s){s.source=null;s.raw=null;s.status="";s.lastShown="";}
    render.invoke(null,s);
    assertTrue(s.lastShown,s.lastShown.endsWith("|"+CaptionStrings.get(a,"caption_translating")+"|"));
    assertTrue(s.lastShown,s.lastShown.startsWith("status:"));
    for(String message:new String[]{CaptionStrings.get(a,"configure_api"),
        "字幕 API 配置错误：invalid_model",CaptionStrings.get(a,"source_unavailable"),
        CaptionStrings.get(a,"source_retry")}) {
      synchronized(s){s.status=message;s.lastShown="";}
      render.invoke(null,s);
      assertTrue(s.lastShown,s.lastShown.endsWith("|"+message+"|"));
    }
    synchronized(s){s.raw=savedRaw;s.status=CaptionStrings.get(a,"source_retry");s.lastShown="";}
    render.invoke(null,s);
    assertTrue("retry remains actionable even with a raw cue",s.lastShown.endsWith(
        "|"+CaptionStrings.get(a,"source_retry")+"|"));
    synchronized(s){s.source=saved;s.raw=savedRaw;s.status="";}
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

  private MediaController pausedMedia() {
    mediaSession = new MediaSession(a, "paused-caption-fixture");
    MediaController controller = mediaSession.getController();
    Shadows.shadowOf(controller).setPackageName(a.getPackageName());
    a.setMediaController(controller);
    return controller;
  }

  private void reportMedia(MediaController controller, int state, long position) {
    Shadows.shadowOf(controller).setPlaybackState(new PlaybackState.Builder()
        .setState(state, position, state == PlaybackState.STATE_PLAYING ? 1 : 0,
            SystemClock.elapsedRealtime()).build());
  }

  @Test public void n23SeekStormPausesPrefetchButDispatchesFocusWithoutDuplicate() throws Exception {
    blockResponse=true;
    RebuildController.Session s=new RebuildController.Session(a, "", "rebuild0001", "n23-storm", "zh-Hans", config(), false, true, CaptionLanguageContext.LEGACY);
    s.source=new RebuildSource(Arrays.asList(
        new RebuildSource.Word("First complete sentence",0,6000,0,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Second complete sentence",6000,12000,1,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Third complete sentence",12000,18000,2,RebuildSource.Precision.NATIVE)));
    s.blocks=Arrays.asList(new RebuildPlanner.Block(0,0,0,s.source),new RebuildPlanner.Block(1,1,1,s.source),new RebuildPlanner.Block(2,2,2,s.source));
    s.plans=new RebuildProtocol.Plan[3];s.pendingPlans=new RebuildProtocol.Plan[3];
    s.states=new int[3];s.attempts=new int[3];s.retryAt=new long[3];s.reasons=new String[]{"","",""};
    s.jobs=new RebuildController.Job[3];s.cacheChecked=new boolean[]{true,true,true};s.position=6500;
    Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);active.set(null,s);
    long now=SystemClock.elapsedRealtime();s.noteSeek(now);s.noteSeek(now+1000);
    assertEquals(now+1000+RebuildController.SEEK_STORM_PAUSE_MS,s.prefetchPausedUntil);
    Method schedule=RebuildController.class.getDeclaredMethod("schedule",RebuildController.Session.class);schedule.setAccessible(true);
    schedule.invoke(null,s);await(()->s.jobs[1]!=null&&s.jobs[1].sent&&calls.get()==1);
    assertTrue(s.jobs[1].priority);assertEquals(1,calls.get());
    for(int i=0;i<5;i++)schedule.invoke(null,s);
    assertEquals("in-flight focus must not be duplicated",1,calls.get());
    assertNull("storm must not dispatch new prefetch",s.jobs[2]);
    release.countDown();await(()->s.plans[1]!=null);
    assertTrue(CaptionDiagnostics.fullText(a).contains("REBUILD_PREFETCH_PAUSED"));
    await(()->CaptionDiagnostics.fullText(a).contains("REBUILD_WAIT_BREAKDOWN"));
    assertTrue(CaptionDiagnostics.fullText(a).contains("slot_wait_ms="));
    assertTrue(CaptionDiagnostics.fullText(a).contains("validation_repair_retries="));
    RebuildController.time(6500);s.prefetchPausedUntil=0;schedule.invoke(null,s);
    await(()->s.plans[2]!=null);assertEquals(2,calls.get());
  }

  private RebuildController.Session readyPagedSession(MediaController controller) throws Exception {
    RebuildLayoutTest.shorts = false;
    RebuildLayoutTest.bounds = new android.graphics.Rect(0, 0, 600, 340);
    a.getResources().getDisplayMetrics().widthPixels = 1264;
    a.getResources().getDisplayMetrics().heightPixels = 2736;
    DeepSeekConfig.saveCaptionSizeTier(a, 2);
    DeepSeekConfig.saveDisplayTextDebugEnabled(a, true);
    CaptionOverlay.clear();
    CaptionOverlay.setActivity(a);
    RebuildController.Session s = new RebuildController.Session(a,
        "https://www.youtube.com/api/timedtext?v=rebuild0001&lang=en&tlang=zh-Hans",
        "rebuild0001", "paused-ready-fixture", "zh-Hans", config(), false, true);
    s.source = new RebuildSource(Collections.singletonList(new RebuildSource.Word(
        "A complete source sentence.", 0, 12000, 0, RebuildSource.Precision.NATIVE)));
    RebuildPlanner.Block block = RebuildContractTest.block(s.source);
    s.blocks = Collections.singletonList(block);
    String caption = "第一，中国的国防预算实际上比你以为的更大；这不是因为他们想隐瞒，"
        + "而是因为会计标准不同，以及纳入和排除的项目不同。";
    s.plans = new RebuildProtocol.Plan[]{new RebuildProtocol.Plan(Collections.singletonList(
        new RebuildProtocol.Event(block.from, block.to, block.start, block.end, caption)),
        "{}", Collections.emptyList())};
    s.pendingPlans = new RebuildProtocol.Plan[1];
    s.states = new int[]{RebuildController.READY};
    s.attempts = new int[1];
    s.retryAt = new long[1];
    s.reasons = new String[]{""};
    s.jobs = new RebuildController.Job[1];
    s.cacheChecked = new boolean[]{true};
    s.everReady = true;
    Field active = RebuildController.class.getDeclaredField("active");
    active.setAccessible(true);
    active.set(null, s);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 0);
    RebuildController.time(0);
    assertTrue("fixture must exercise a real page boundary", overlayPages().size() > 1);
    assertEquals("ready fixture must not request translation", 0, calls.get());
    return s;
  }

  @SuppressWarnings("unchecked")
  private List<RebuildPageLayout.Page> overlayPages() throws Exception {
    return (List<RebuildPageLayout.Page>) field(null, CaptionOverlay.class, "pendingPages");
  }

  private long overlayPosition() throws Exception {
    return (long) field(null, CaptionOverlay.class, "pendingPosition");
  }

  private int overlayPage() throws Exception {
    return (int) field(null, CaptionOverlay.class, "shownPage");
  }

  private int presentationCount() {
    return CaptionDiagnostics.fullText(a).split("REBUILD_PRESENTED", -1).length - 1;
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void pausedMediaJitterKeepsPositionPageAndRenderStable() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session s = readyPagedSession(controller);
    long frozen = overlayPages().get(0).end - 8;
    assertEquals(0, RebuildPageLayout.indexAt(overlayPages(), frozen));
    assertEquals(1, RebuildPageLayout.indexAt(overlayPages(), frozen + 16));
    reportMedia(controller, PlaybackState.STATE_NONE, frozen);
    RebuildController.time(frozen);
    assertEquals("a non-paused hook must not establish a freeze", -1, s.pausedDisplayPosition);
    reportMedia(controller, PlaybackState.STATE_PAUSED, frozen);
    advance(80);
    assertEquals("first paused tick must capture the reported position", frozen, s.pausedDisplayPosition);
    assertEquals(frozen, overlayPosition());
    long revision = s.renderRevision;
    int presented = presentationCount();
    int maintenanceScans = 0;
    for (int i = 0; i < 10; i++) {
      List<RebuildPageLayout.Page> pages = overlayPages();
      long previousScan = (long) field(null, CaptionOverlay.class, "lastScan");
      long reported = frozen + (i % 2 == 0 ? 16 : 0);
      reportMedia(controller, PlaybackState.STATE_PAUSED, reported);
      advance(80);
      assertEquals("schedule and render must consume the same paused freeze", frozen, s.position);
      assertEquals("raw winning observation is retained for evidence", reported, s.observation.position);
      assertEquals(frozen, s.pausedDisplayPosition);
      assertEquals(frozen, overlayPosition());
      assertEquals(0, overlayPage());
      assertEquals("same event must not issue another controller render", revision, s.renderRevision);
      if (previousScan == (long) field(null, CaptionOverlay.class, "lastScan"))
        assertSame("jitter must not replan pages between existing surface scans", pages, overlayPages());
      else maintenanceScans++;
      assertEquals("jitter must not generate another presentation", presented, presentationCount());
    }
    assertTrue("the existing surface maintenance must still run while paused", maintenanceScans > 0);
    assertEquals(0, calls.get());
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void resumedPlaybackClearsPauseFreezeAndAdvancesPage() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session s = readyPagedSession(controller);
    long frozen = overlayPages().get(0).end - 8;
    reportMedia(controller, PlaybackState.STATE_PAUSED, frozen);
    RebuildController.time(frozen);
    assertEquals(0, overlayPage());
    reportMedia(controller, PlaybackState.STATE_PLAYING, frozen + 16);
    advance(80);
    assertEquals(-1, s.pausedDisplayPosition);
    assertTrue("playing clock must advance again", s.position > frozen + 16);
    assertEquals(s.position, overlayPosition());
    assertEquals(1, overlayPage());
    assertEquals(0, calls.get());
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void pausedExplicitSeekAndSmallBackwardCallbackTakeEffectImmediately() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session s = readyPagedSession(controller);
    List<RebuildPageLayout.Page> pages = overlayPages();
    long frozen = pages.get(pages.size() - 1).start + 300;
    reportMedia(controller, PlaybackState.STATE_PAUSED, frozen);
    RebuildController.time(frozen);
    int generation = s.generation;
    RebuildController.time(frozen - 3000);
    assertEquals(generation + 1, s.generation);
    assertEquals(frozen - 3000, s.pausedDisplayPosition);
    assertEquals(frozen - 3000, overlayPosition());
    assertEquals(RebuildPageLayout.indexAt(overlayPages(), frozen - 3000), overlayPage());
    assertTrue(CaptionDiagnostics.fullText(a).contains("REBUILD_SEEK"));
    advance(80);
    assertEquals("the older paused snapshot must not undo an explicit seek beyond 1500 ms",
        frozen - 3000, overlayPosition());
    RebuildController.time(frozen - 3016);
    assertEquals("small explicit movement keeps normal seek threshold", generation + 1, s.generation);
    assertEquals(frozen - 3016, s.pausedDisplayPosition);
    assertEquals("small backward hook must outrank the clock's monotonic presentation",
        frozen - 3016, overlayPosition());
    advance(80);
    assertEquals("stale paused report must not undo the explicit callback",
        frozen - 3016, overlayPosition());
    long newlyReported = frozen - 3016 + 1601;
    reportMedia(controller, PlaybackState.STATE_PAUSED, newlyReported);
    advance(80);
    assertEquals("a changed report must still activate the safety valve after a hook",
        newlyReported, s.pausedDisplayPosition);
    assertEquals(newlyReported, overlayPosition());
    assertEquals(0, calls.get());
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void replacementSessionDoesNotInheritPauseFreeze() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session old = readyPagedSession(controller);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 1000);
    RebuildController.time(1000);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 1016);
    start(true);
    RebuildController.Session next = session();
    assertNotSame(old, next);
    assertEquals("cancel must discard the old session's freeze", -1, old.pausedDisplayPosition);
    assertEquals("replacement must capture its own first paused report", 1016, next.pausedDisplayPosition);
    await(() -> next.source != null);
    advance(80);
    assertEquals(1016, overlayPosition());
    assertEquals(0, calls.get());
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void pausedPositionSafetyValveUsesRawReportAndStrict1500msLimit() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session s = readyPagedSession(controller);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 1000);
    RebuildController.time(1000);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 2500);
    advance(80);
    assertEquals("exactly 1500 ms remains frozen", 1000, s.pausedDisplayPosition);
    assertEquals(1000, overlayPosition());
    reportMedia(controller, PlaybackState.STATE_PAUSED, 2501);
    advance(80);
    assertEquals("1501 ms is a real position change", 2501, s.pausedDisplayPosition);
    assertEquals(2501, overlayPosition());
    reportMedia(controller, PlaybackState.STATE_PAUSED, 5000);
    advance(80);
    assertEquals("large raw change must bypass the ordinary clock's evidence guard",
        5000, s.pausedDisplayPosition);
    assertEquals(5000, overlayPosition());
    assertEquals("a validated native-unavailable pause seek must share schedule/render time", 5000, s.position);
    reportMedia(controller, PlaybackState.STATE_PAUSED, 5016);
    advance(80);
    assertEquals(5000, overlayPosition());
    assertEquals(0, calls.get());
  }

  @Test
  @Config(shadows = {Keys.class, RebuildLayoutTest.Geometry.class})
  @GraphicsMode(GraphicsMode.Mode.NATIVE)
  public void everyNonPausedOrUnavailableMediaStateClearsDisplayFreeze() throws Exception {
    MediaController controller = pausedMedia();
    RebuildController.Session s = readyPagedSession(controller);
    int[] states = {PlaybackState.STATE_NONE, PlaybackState.STATE_STOPPED,
        PlaybackState.STATE_PLAYING, PlaybackState.STATE_FAST_FORWARDING,
        PlaybackState.STATE_REWINDING, PlaybackState.STATE_BUFFERING, PlaybackState.STATE_ERROR,
        PlaybackState.STATE_CONNECTING, PlaybackState.STATE_SKIPPING_TO_PREVIOUS,
        PlaybackState.STATE_SKIPPING_TO_NEXT, PlaybackState.STATE_SKIPPING_TO_QUEUE_ITEM, 99};
    for (int state : states) {
      reportMedia(controller, PlaybackState.STATE_PAUSED, 1000);
      RebuildController.time(1000);
      assertEquals(1000, s.pausedDisplayPosition);
      reportMedia(controller, state, 1100);
      advance(80);
      assertEquals("state " + state + " must clear the pause freeze", -1, s.pausedDisplayPosition);
      assertEquals(s.position, overlayPosition());
    }
    reportMedia(controller, PlaybackState.STATE_PAUSED, 1000);
    RebuildController.time(1000);
    Shadows.shadowOf(controller).setPlaybackState(null);
    advance(80);
    assertEquals("missing state must clear the pause freeze", -1, s.pausedDisplayPosition);
    assertEquals(s.position, overlayPosition());
    reportMedia(controller, PlaybackState.STATE_PAUSED, 1000);
    RebuildController.time(1000);
    Shadows.shadowOf(controller).setPackageName("another.player");
    advance(80);
    assertEquals("another player's media evidence must clear the pause freeze",
        -1, s.pausedDisplayPosition);
    assertEquals(s.position, overlayPosition());
    assertEquals(0, calls.get());
  }

  /* ------------------------------------------------------------------------------------------------
   * N24 D7: the production scheduler's task selection and lifecycle under a bounded budget.
   * These drive RebuildController.schedule()/time() and the real dispatch/translate path against the
   * local fixture server; nothing here measures provider latency, only queueing and lane ownership.
   * ---------------------------------------------------------------------------------------------- */

  /** Four one-word blocks at 0-6s, 6-12s, 12-18s, 18-24s so a landing can be placed exactly. */
  RebuildController.Session n24Session(int blockCount, long stepMs) throws Exception {
    RebuildSource source=new RebuildSource(Arrays.asList(
        new RebuildSource.Word("First complete sentence",0,stepMs,0,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Second complete sentence",stepMs,2*stepMs,1,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Third complete sentence",2*stepMs,3*stepMs,2,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Fourth complete sentence",3*stepMs,4*stepMs,3,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Fifth complete sentence",4*stepMs,5*stepMs,4,RebuildSource.Precision.NATIVE),
        new RebuildSource.Word("Sixth complete sentence",5*stepMs,6*stepMs,5,RebuildSource.Precision.NATIVE)));
    List<RebuildPlanner.Block> blocks=new ArrayList<>();
    for(int i=0;i<blockCount;i++)blocks.add(new RebuildPlanner.Block(i,i,i,source));
    RebuildController.Session s=new RebuildController.Session(
        a,"","rebuild0001","n24-"+System.nanoTime(),"zh-Hans",config(),false,true,CaptionLanguageContext.LEGACY);
    s.source=source;
    s.blocks=blocks;
    s.plans=new RebuildProtocol.Plan[blockCount];
    s.pendingPlans=new RebuildProtocol.Plan[blockCount];
    s.states=new int[blockCount];
    s.attempts=new int[blockCount];
    s.retryAt=new long[blockCount];
    s.reasons=new String[blockCount];
    for(int i=0;i<blockCount;i++)s.reasons[i]="";
    s.jobs=new RebuildController.Job[blockCount];
    s.cacheChecked=new boolean[blockCount];
    java.util.Arrays.fill(s.cacheChecked,true);
    Field active=RebuildController.class.getDeclaredField("active");
    active.setAccessible(true);
    active.set(null,s);
    return s;
  }

  int n24InFlight(RebuildController.Session s,boolean focus) {
    try {
      Method m=RebuildController.class.getDeclaredMethod("dispatched",RebuildController.Session.class,boolean.class);
      m.setAccessible(true);
      return (Integer)m.invoke(null,s,focus);
    } catch (Exception e) {
      throw new IllegalStateException(e);
    }
  }

  /** All requests the fixture server has received for a block, matched on the block id in the body. */
  boolean n24Saw(String blockId){return n24SeenBlocks.contains(blockId);}

  int n24Calls(String blockId){
    AtomicInteger count=n24BlockCalls.get(blockId);
    return count==null?0:count.get();
  }

  void n24GateAll(RebuildController.Session s){
    for(RebuildPlanner.Block b:s.blocks)n24GateBlocks.add(b.id());
    n24Gate=new CountDownLatch(1);
  }

  @Test public void n24BlockedOldFocusStillLeavesTheSecondSlotForTheNewLanding() throws Exception {
    RebuildController.Session s=n24Session(4,6000);n37LedgerSession=s;
    String first=s.blocks.get(0).id(),second=s.blocks.get(1).id();
    n24GateBlocks.add(first);n24GateBlocks.add(second);n24Gate=new CountDownLatch(1);
    n37PrefetchGate=new CountDownLatch(1);
    n37PrefetchBlocks.add(s.blocks.get(2).id());n37PrefetchBlocks.add(s.blocks.get(3).id());
    try{
      RebuildController.time(0);await(()->n24Saw(first));
      assertEquals("the old landing holds one foreground slot",1,n24InFlight(s,true));
      RebuildController.time(6500);await(()->n24Saw(second));
      assertTrue("both foreground slots are usable at once",n24MaxInFlight.get()>=2);
      assertEquals(1,s.attempts[0]);assertEquals(1,s.attempts[1]);
      assertEquals("before acceptance only the two focus requests are possible",2,calls.get());
      n24Gate.countDown();await(()->s.plans[0]!=null&&s.plans[1]!=null);
      int originalObservation=calls.get();
      await(()->n24Saw(s.blocks.get(2).id())&&n24Saw(s.blocks.get(3).id()));
      assertEquals("two focus plus two distinct legal successors",4,calls.get());
      assertEquals(4,n24BlockCalls.size());
      for(int i=0;i<4;i++)assertEquals("each block exactly once",1,n24BlockCalls.get(s.blocks.get(i).id()).get());
      synchronized(s){
        for(int i=2;i<4;i++){
          assertFalse("successors retain the prefetch lane",s.jobs[i].priority);
          assertTrue("unchanged 30-second lookahead",s.blocks.get(i).start<=s.position+30000);
        }
      }
      long focus=n37RequestLedger.stream().filter(line->line.contains("\"phase\":\"received\"")&&line.contains("\"purpose\":\"focus\"")).count();
      long prefetch=n37RequestLedger.stream().filter(line->line.contains("\"phase\":\"received\"")&&line.contains("\"purpose\":\"prefetch\"")).count();
      assertEquals(2,focus);assertEquals(2,prefetch);
      n37PrefetchGate.countDown();await(()->s.plans[2]!=null&&s.plans[3]!=null);
      JSONArray ledger=new JSONArray();for(String line:n37RequestLedger)ledger.put(new JSONObject(line));
      N28CGeometryTest.export("n37-original-n24-request-identities.json",new JSONObject()
          .put("original_assertion_expected_total",2).put("original_after_acceptance_observed",originalObservation)
          .put("focus",focus).put("prefetch",prefetch).put("total",calls.get()).put("ledger",ledger));
    }finally{n24Gate.countDown();n37PrefetchGate.countDown();n37LedgerSession=null;}
  }

  @Test public void n24TwoFocusInFlightRetainOnlyTheNewestPendingLanding() throws Exception {
    RebuildController.Session s=n24Session(6,6000);
    String b0=s.blocks.get(0).id(), b1=s.blocks.get(1).id();
    n24GateBlocks.add(b0);n24GateBlocks.add(b1);n24Gate=new CountDownLatch(1);
    Method schedule=RebuildController.class.getDeclaredMethod("schedule",RebuildController.Session.class);
    schedule.setAccessible(true);
    schedule.invoke(null,s);
    await(()->n24Saw(b0));
    RebuildController.time(6300);
    await(()->n24Saw(b1));
    assertEquals(2,n24InFlight(s,true));
    // Both slots busy: three further landings must collapse into one retained newest pending.
    RebuildController.time(12500);
    RebuildController.time(18500);
    RebuildController.time(24500);
    await(()->s.pendingFocus!=null);
    assertEquals("only the newest landing stays pending",4,s.pendingFocus.index);
    assertEquals("nothing new may be sent while both slots are busy",2,calls.get());
    assertEquals("both replaced landings are recorded",2,s.replacedFocus);
    for(int i=2;i<4;i++) {
      assertEquals("a replaced landing consumes no attempt",0,s.attempts[i]);
      assertFalse("a replaced landing is never sent",n24Saw(s.blocks.get(i).id()));
      assertEquals("a replaced landing goes back to WAITING",RebuildController.WAITING,s.states[i]);
    }
    assertEquals("the retained landing consumes no attempt before it is dispatched",0,s.attempts[4]);
    assertEquals(RebuildController.RUNNING,s.states[4]);
    assertTrue(CaptionDiagnostics.fullText(a).contains("REBUILD_FOCUS_PENDING_REPLACED"));
    assertTrue(CaptionDiagnostics.fullText(a).contains("attempts_consumed=0"));
    assertTrue("the retained pending block is reported",
        CaptionDiagnostics.fullText(a).contains("REBUILD_FOCUS_PENDING_HELD"));
    assertTrue(CaptionDiagnostics.fullText(a).contains("pending_focus_block="));
    // Releasing one slot dispatches the retained landing, and only that one.
    n24Gate.countDown();
    await(()->n24Saw(s.blocks.get(4).id()));
    await(()->s.pendingFocus==null);
    assertEquals("only the newest landing was dispatched after a slot freed up",3,calls.get());
    assertEquals(1,s.attempts[4]);
    assertTrue("queueing stays separated from network time",
        CaptionDiagnostics.fullText(a).contains("slot_wait_ms="));
  }

  @Test public void n24PrefetchBudgetUsesTwoSuccessorsAndStopsAtThirtySeconds() throws Exception {
    RebuildController.Session s=n24Session(6,6000);
    s.plans[0]=new RebuildProtocol.Plan(Collections.emptyList(),"{}",Collections.emptyList());
    s.states[0]=RebuildController.READY;s.everReady=true;s.position=0;s.prefetchPausedUntil=0;
    // Hold the two initial responses: completing one legally replenishes the lane.
    n24GateBlocks.add(s.blocks.get(1).id());n24GateBlocks.add(s.blocks.get(2).id());
    n24Gate=new CountDownLatch(1);
    RebuildController.time(0);
    // D4: one in-flight prefetch must not by itself block the second qualified successor.
    assertEquals(1,s.attempts[1]);
    assertEquals(1,s.attempts[2]);
    assertEquals("a third successor is over the prefetch budget",0,s.attempts[3]);
    await(()->n24Saw(s.blocks.get(1).id()));
    await(()->n24Saw(s.blocks.get(2).id()));
    assertFalse(n24Saw(s.blocks.get(3).id()));
    RebuildController.stop();n24Gate.countDown();
    await(()->n24InFlight.get()==0);
    n24GateBlocks.clear();n24Gate=null;
    // A block beyond the 30 second window is never dispatched, budget or not.
    RebuildController.Session far=n24Session(6,20000);
    far.plans[0]=new RebuildProtocol.Plan(Collections.emptyList(),"{}",Collections.emptyList());
    far.states[0]=RebuildController.READY;far.everReady=true;far.position=0;far.prefetchPausedUntil=0;
    n24SeenBlocks.clear();
    RebuildController.time(0);
    assertEquals("the only successor inside 30 seconds is dispatched",1,far.attempts[1]);
    assertEquals("a block past 30 seconds is out of prefetch range",0,far.attempts[2]);
    await(()->n24Saw(far.blocks.get(1).id()));
    assertFalse("a block past 30 seconds is never sent",n24Saw(far.blocks.get(2).id()));
  }

  @Test public void n24TotalInFlightStaysBoundedAndBackgroundKeepsItsOwnLanes() throws Exception {
    RebuildController.Session s=n24Session(6,6000);
    n24GateAll(s);
    RebuildController.time(0);
    // The release assertion names block 0: actually send it before the rapid landing storm.
    // Otherwise the legal unsent-focus replacement can cancel it before the mock sees a request.
    await(()->n24Saw(s.blocks.get(0).id())&&s.jobs[0]!=null&&s.jobs[0].sent);
    // Keep the final landing observable even on a fast local/CI server.
    n37PrefetchGate=new CountDownLatch(1);n37PrefetchBlocks.add(s.blocks.get(5).id());
    for(int i=1;i<6;i++)RebuildController.time(i*6000L+100);
    // Intermediate landings may already be sent and occupy both focus lanes. Check
    // pressure before releasing them; do not require a third focus request to bypass them.
    int stormFocus=n24InFlight(s,true),stormPrefetch=n24InFlight(s,false);
    assertTrue("storm foreground bound",stormFocus<=2);
    assertTrue("storm background bound",stormPrefetch<=2);
    assertTrue("storm total bound",stormFocus+stormPrefetch<=4);
    n24Gate.countDown();
    await(()->n24Saw(s.blocks.get(5).id())&&s.jobs[5]!=null&&s.jobs[5].sent);
    int focus=n24InFlight(s,true),prefetch=n24InFlight(s,false);
    assertTrue("foreground must never exceed two",focus<=2);
    assertTrue("background must never exceed two",prefetch<=2);
    assertTrue("client translation requests must never exceed four",focus+prefetch<=4);
    assertTrue("the fixture server never saw more than four at once",n24MaxInFlight.get()<=4);
    n24Gate.countDown();n37PrefetchGate.countDown();
    await(()->s.plans[0]!=null||s.plans[1]!=null);
  }

  @Test public void n24SameBlockIsReusedCacheRestoresAndSessionEndReleasesEverything() throws Exception {
    RebuildController.Session s=n24Session(4,6000);
    s.plans[0]=new RebuildProtocol.Plan(Collections.emptyList(),"{}",Collections.emptyList());
    s.states[0]=RebuildController.READY;s.everReady=true;s.position=0;s.prefetchPausedUntil=0;
    String second=s.blocks.get(1).id(), fourth=s.blocks.get(3).id();
    // Seed the cache before anything is scheduled, so a late lane completion can only restore it.
    RebuildPlanner.Block cached=s.blocks.get(3);
    String json=RebuildContractTest.reply(cached,new JSONArray().put(
        RebuildR26Test.quoted(s.source,cached.from,cached.to,"这是已缓存的第四句。")));
    RebuildCache.write(a,s.cacheKey,cached,RebuildProtocol.parseBound(json,s.source,cached));
    s.cacheChecked[3]=false;s.states[3]=RebuildController.WAITING;
    n24GateBlocks.add(second);n24Gate=new CountDownLatch(1);
    RebuildController.time(0);
    await(()->n24Saw(second));
    assertEquals("the successor was requested exactly once",1,n24Calls(second));
    // D3: landing on the block a background request already covers reuses it instead of re-requesting.
    RebuildController.time(6500);
    assertNotNull("the reused background request is still in flight",s.jobs[1]);
    assertFalse("the reused request keeps its background lane",s.jobs[1].priority);
    assertEquals("an in-flight background request is reused, never duplicated",1,n24Calls(second));
    assertTrue("the reuse is recorded with its reason",
        CaptionDiagnostics.fullText(a).contains("REBUILD_BLOCK_REUSED"));
    assertTrue(CaptionDiagnostics.fullText(a).contains("reason=in_flight_prefetch"));
    // The cached block is restored without any network call and never waits behind a lane.
    RebuildController.time(18500);
    await(()->s.plans[3]!=null);
    assertEquals("a cache restore makes no translation request for that block",0,n24Calls(fourth));
    assertEquals("a cache restore does not consume an attempt",0,s.attempts[3]);
    assertTrue(CaptionDiagnostics.fullText(a).contains("REBUILD_CACHE_RESTORED"));
    // Ending the session drops the retained pending request and marks the session cancelled.
    RebuildController.stop();
    assertTrue(s.cancelled);
    assertNull("session end releases the retained pending request",s.pendingFocus);
    n24Gate.countDown();
  }

  @Test public void n24LateResultNeverPresentsOnTheWrongLanding() throws Exception {
    n24TextByBlock=true;
    RebuildController.Session s=n24Session(4,6000);
    String first=s.blocks.get(0).id(), landed=s.blocks.get(3).id();
    n24GateBlocks.add(first);n24Gate=new CountDownLatch(1);
    RebuildController.time(0);
    await(()->n24Saw(first));
    // Land far away while the old request is still open, and let the new landing answer first.
    RebuildController.time(18500);
    await(()->s.plans[3]!=null);
    advance(200);
    assertTrue("the new landing presents its own block",s.lastShown.contains("这是"+landed));
    assertFalse("the open old request is not presented at the new landing",
        s.lastShown.contains("这是"+first));
    // The late old result may still be cached, but it must never be presented on this landing.
    n24Gate.countDown();
    await(()->s.plans[0]!=null);
    advance(200);
    assertFalse("a late result for the old block stays out of the new landing",
        s.lastShown.contains("这是"+first));
    assertTrue("the new landing keeps its own text",s.lastShown.contains("这是"+landed));
  }
}
