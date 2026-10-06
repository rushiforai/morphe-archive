package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;
import android.os.*;import java.io.*;import java.net.*;import java.time.Duration;import java.util.concurrent.*;
import okhttp3.mockwebserver.*;import org.json.*;import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;
@RunWith(RobolectricTestRunner.class) @Config(sdk=28,shadows=RebuildIntegrationTest.Keys.class) @LooperMode(LooperMode.Mode.PAUSED)
public class N30ConnectionFailureTest {
 @Test public void socketConnectAndReadInterruptionKeepDistinctEnglishReasons(){
  assertEquals("connection_socket_exception",RebuildApi.transportReason(new SocketException("reset"),"read"));
  assertEquals("connection_establishment_failed",RebuildApi.transportReason(new ConnectException("refused"),"connect"));
  assertEquals("connection_establishment_failed",RebuildApi.transportReason(new UnknownHostException("dns"),"connect"));
  assertEquals("connection_establishment_timeout",RebuildApi.transportReason(new SocketTimeoutException("connect"),"connect"));
  assertEquals("read_interrupted",RebuildApi.transportReason(new InterruptedIOException("read"),"read"));
 }
 @Test public void actualSocketDropHasPhaseDeadlineIdentityAndConvergesWithinExistingTwoAttempts()throws Exception{
  SchedulerLifecycleRegressionTest h=new SchedulerLifecycleRegressionTest();h.setup();
  try{
   h.h.server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest r){h.h.calls.incrementAndGet();return new MockResponse().setSocketPolicy(SocketPolicy.DISCONNECT_AFTER_REQUEST);}});
   RebuildController.Session s=h.fixture();SchedulerLifecycleRegressionTest.install(s);SchedulerLifecycleRegressionTest.invoke("schedule",s);
   h.h.await(()->s.jobs[0]==null && s.attempts[0]==1);assertEquals(RebuildController.WAITING,s.states[0]);assertFalse(s.everReady);assertNull(s.plans[0]);
   Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(1300));SchedulerLifecycleRegressionTest.invoke("schedule",s);h.h.await(()->s.jobs[0]==null&&s.states[0]==RebuildController.FAILED);
   assertEquals(2,s.attempts[0]);assertNull(s.plans[0]);assertNull(s.pendingPlans[0]);assertEquals(2,h.h.calls.get());
   String log=CaptionDiagnostics.fullText(h.h.a);assertTrue(log.contains("REBUILD_HTTP_FAILURE"));assertTrue(log.contains("phase=read"));assertTrue(log.contains("remaining_deadline_ms="));assertTrue(log.contains("elapsed_ms="));assertTrue(log.contains("session="));assertTrue(log.contains("request="));assertTrue(log.contains("block=0"));assertTrue(log.contains("attempt="));assertTrue(log.contains("network 2"));assertTrue(log.contains("build=n37"));
   assertFalse(log.contains("crosses_source_break"));assertFalse(RebuildReview.structuralRetry(s.reasons[0]));
   N28CGeometryTest.export("n30-connection-failure.json",new JSONObject().put("actual_loopback_calls",h.h.calls.get()).put("attempts",s.attempts[0]).put("state",s.states[0]).put("reason",s.reasons[0]).put("semantic_plan",false).put("repair_budget",s.repairCount).put("raw_trace",log));
   RebuildController.stop();assertFalse(RebuildController.current(s));SchedulerLifecycleRegressionTest.invoke("schedule",s);assertEquals(2,h.h.calls.get());
  }finally{h.cleanup();}
 }
 @Test public void successfulHttpWithStructuralInvalidityIsNotTransportFailure()throws Exception {
  RebuildIntegrationTest h=new RebuildIntegrationTest();h.setup();try{h.mode=3;
   java.util.List<RebuildSource.Word> words=java.util.Arrays.asList(new RebuildSource.Word("Test.",0,500,0,RebuildSource.Precision.NATIVE));RebuildSource source=new RebuildSource(words);RebuildPlanner.Block b=RebuildPlanner.plan(source).get(0);
   DeepSeekConfig.saveBaseUrl(h.a,h.server.url("/").toString());DeepSeekConfig.Snapshot cfg=DeepSeekConfig.load(h.a);
   try{RebuildApi.translate(source,b,cfg,"fr",null,true,"",CaptionLanguageContext.explicit("en","fr"));fail();}catch(RebuildProtocol.Invalid expected){assertNotNull(expected.code);}
  }finally{h.cleanup();}
 }
}
