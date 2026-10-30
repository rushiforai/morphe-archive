package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.graphics.Rect;
import android.os.Looper;
import java.lang.reflect.*;
import java.time.Duration;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Controlled private-state probes plus the actual queued show/owner-change path. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=35, shadows=N39UiGeometryFixture.Geometry.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@LooperMode(LooperMode.Mode.PAUSED)
public class S2PresentationSequenceTest extends N39UiGeometryFixture {
    @Before public void before() { CaptionPlayerAuthority.resetForTests(); super.setup(); }
    @After public void after() { super.done(); CaptionPlayerAuthority.resetForTests(); }
    static Object decision() throws Exception {
        Field f=CaptionOverlay.class.getDeclaredField("presentationDecision"); f.setAccessible(true); return f.get(null);
    }
    static Object decisionField(String name) throws Exception {
        Field f=CaptionPresentationDecision.class.getDeclaredField(name); f.setAccessible(true); return f.get(decision());
    }
    static void set(String name, Object value) throws Exception {
        Field f=CaptionPresentationDecision.class.getDeclaredField(name); f.setAccessible(true); f.set(decision(),value);
    }
    boolean classify(Rect video) throws Exception {
        Method m=CaptionOverlay.class.getDeclaredMethod("updatePresentationClass",Rect.class);
        m.setAccessible(true); return (Boolean)m.invoke(null,video);
    }
    String state() throws Exception {
        return decisionField("presentationClass")+":"+decisionField("classBaseWidth")+":"+decisionField("classFrameWidth")+":"+decisionField("reducedVideoWidth");
    }
    @Test public void originalNativeClassOverridesGeometryAndReentryForgetsWidthMemory() throws Exception {
        a.getResources().getDisplayMetrics().widthPixels=2736;
        a.getResources().getDisplayMetrics().heightPixels=1264;
        set("presentationClass",null);
        Rect full=new Rect(0,0,2247,1264), reduced=new Rect(0,0,1478,831);
        List<String> trace=new ArrayList<>();
        assertTrue(classify(reduced)); trace.add("fallback="+state());
        assertEquals(CaptionPresentationClass.Kind.REDUCED,decisionField("presentationClass"));
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        classify(reduced); trace.add("native_full="+state());
        assertEquals(CaptionPresentationClass.Kind.FULL,decisionField("presentationClass"));
        assertEquals(2067,decisionField("classFrameWidth"));
        assertFalse("same native input is coalesced",classify(reduced));
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        classify(full); trace.add("native_reduced="+state());
        assertEquals(CaptionPresentationClass.Kind.REDUCED,decisionField("presentationClass"));
        classify(reduced); trace.add("reduced_memory="+state());
        assertEquals(1478,decisionField("reducedVideoWidth"));
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        classify(reduced); assertEquals(0,decisionField("reducedVideoWidth"));
        set("stableGeometrySamples",2);
        CaptionOverlay.setActivity(null);
        assertNull(decisionField("presentationClass")); assertEquals(0,decisionField("classBaseWidth"));
        assertEquals(0,decisionField("classFrameWidth")); assertEquals(0,decisionField("stableGeometrySamples"));
        assertEquals(0,decisionField("reducedVideoWidth")); trace.add("detached="+state());
        CaptionPlayerAuthority.resetForTests();
        CaptionOverlay.setActivity(a);
        a.getResources().getDisplayMetrics().widthPixels=1264;
        a.getResources().getDisplayMetrics().heightPixels=2736;
        assertTrue(classify(new Rect(0,0,1264,711)));
        assertEquals(CaptionPresentationClass.Kind.DETAIL,decisionField("presentationClass"));
        trace.add("reentry="+state());
        // Captured from the unchanged production implementation in focused-01/extension.xml.
        assertEquals(Arrays.asList("fallback=REDUCED:1360:1360:0", "native_full=FULL:2067:2067:0",
                "native_reduced=REDUCED:1364:1364:0", "reduced_memory=REDUCED:1364:1364:1478",
                "detached=null:0:0:0", "reentry=DETAIL:1163:1163:0"), trace);
        System.out.println("S2_ORIGINAL_PRESENTATION "+trace);
    }
    void queue(Runnable work) throws Exception {
        CountDownLatch queued=new CountDownLatch(1);
        java.util.concurrent.atomic.AtomicReference<Throwable> failure=new java.util.concurrent.atomic.AtomicReference<>();
        Thread worker=new Thread(()->{try{work.run();}catch(Throwable t){failure.set(t);}finally{queued.countDown();}},"s2-queue-fixture");
        worker.start(); assertTrue("worker queued before looper drain",queued.await(2,TimeUnit.SECONDS));
        if(failure.get()!=null) throw new AssertionError(failure.get());
    }
    @Test public void originalQueuedShowCannotRestoreOldClassAfterInvalidationAndReentry() throws Exception {
        AtomicBoolean valid=new AtomicBoolean(true);
        CaptionOverlay.RenderGuard guard=()->valid.get();
        CaptionRenderSpec spec=CaptionLanguageContext.explicit("en","zh-Hans").renderSpec;
        queue(()->CaptionOverlay.showEvent("旧回调",guard,"s2-old",0,6000,1000,spec));
        valid.set(false);
        CaptionOverlay.clear(); CaptionOverlay.setActivity(null); CaptionOverlay.setActivity(a);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
        assertEquals("",field("pendingText")); assertEquals("",field("pendingIdentity"));
        assertNull(decisionField("presentationClass")); assertFalse(CaptionOverlay.anchorVisible());
        // A still-valid old guard is independently rejected by the captured render epoch.
        queue(()->CaptionOverlay.showEvent("旧owner",()->true,"s2-old-owner",0,6000,1000,spec));
        CaptionOverlay.setActivity(null); CaptionOverlay.setActivity(a);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
        assertEquals("",field("pendingIdentity")); assertFalse(CaptionOverlay.anchorVisible());
        CaptionOverlay.showEvent("新回调",()->true,"s2-new",-1,-1,1000,spec);
        assertEquals("s2-new",field("pendingIdentity")); assertEquals("新回调",field("pendingText"));
        System.out.println("S2_ORIGINAL_QUEUED invalid_guard=rejected;old_epoch=rejected;reentry_class=null;new_identity=s2-new;new_text=新回调");
    }
}
