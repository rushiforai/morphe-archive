package app.yydarlinker.deepseekcaptions;
import static org.junit.Assert.*;

import java.util.concurrent.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
/** Read-only diagnosis of the old test's any-BLOCKED observation; production/R1 tests are unchanged. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={RebuildIntegrationTest.Keys.class,SchedulerLifecycleRegressionTest.CacheBoundary.class,SchedulerLifecycleRegressionTest.CommitBoundary.class,SchedulerLifecycleRegressionTest.OverlayBoundary.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class N29ScopeMonitorProbeTest {
 @Test(timeout=90000) public void scopeRevocationAtTheActualSessionMonitorNotAnUnrelatedRuntimeMonitor()throws Exception {
  JSONArray rows=new JSONArray();
  for(int round=0;round<20;round++) {
   SchedulerLifecycleRegressionTest h=new SchedulerLifecycleRegressionTest();h.setup();
   try {
    RebuildController.Session old=h.fixture();SchedulerLifecycleRegressionTest.install(old);
    RebuildController.Job sent=new RebuildController.Job(old,0,true);sent.sent=true;sent.dispatched=true;old.jobs[0]=sent;old.attempts[0]=1;old.states[0]=RebuildController.RUNNING;
    CountDownLatch held=new CountDownLatch(1),go=h.release();
    Thread scheduler=h.start("N29-Held-Scope",()->{synchronized(old){held.countDown();SchedulerLifecycleRegressionTest.await(go);SchedulerLifecycleRegressionTest.invoke("schedule",old);}});
    SchedulerLifecycleRegressionTest.await(held);
    Thread replacing=h.start("N29-Replacing-Scope",()->RebuildController.activate(h.h.a,h.url("fr"),false,true));
    long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(5);boolean sessionBlocked=false;
    while(System.nanoTime()<deadline && !sessionBlocked) {
     if(replacing.getState()==Thread.State.BLOCKED) {
      Object bean=Class.forName("java.lang.management.ManagementFactory").getMethod("getThreadMXBean").invoke(null);
      Object info=Class.forName("java.lang.management.ThreadMXBean").getMethod("getThreadInfo",long.class,int.class).invoke(bean,replacing.getId(),50);
      Class<?> type=Class.forName("java.lang.management.ThreadInfo");Object lockInfo=info==null?null:type.getMethod("getLockInfo").invoke(info);
      if(lockInfo!=null) {
       String lock=(String)Class.forName("java.lang.management.LockInfo").getMethod("getClassName").invoke(lockInfo);
       rows.put(new JSONObject().put("round",round).put("lock",lock).put("stack",java.util.Arrays.toString((Object[])type.getMethod("getStackTrace").invoke(info))).put("active_still_old",h.h.session()==old));
       sessionBlocked=lock.equals(RebuildController.Session.class.getName());
      }
     }
     if(!sessionBlocked)Thread.yield();
    }
    assertTrue("must reach actual old Session monitor",sessionBlocked);RebuildController.Session next=h.h.session();
    assertNotSame(old,next);assertTrue(RebuildController.current(next));assertFalse(RebuildController.current(old));assertFalse(sent.isCancelled());
    go.countDown();SchedulerLifecycleRegressionTest.join(scheduler);SchedulerLifecycleRegressionTest.join(replacing);h.ready(next);
    assertTrue(old.retired);assertEquals(1,old.attempts[0]);assertEquals(1,next.attempts[0]);
   }finally{h.cleanup();}
  }
  N28CGeometryTest.export("n29-scope-monitor-probe.json",new JSONObject().put("controlled_rounds",20).put("observations",rows));
 }
}
