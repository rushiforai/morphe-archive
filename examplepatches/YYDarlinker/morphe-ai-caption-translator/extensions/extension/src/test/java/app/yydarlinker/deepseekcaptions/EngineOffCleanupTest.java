package app.yydarlinker.deepseekcaptions;
import android.app.Activity;
import android.content.Context;
import java.lang.reflect.*;
import java.util.concurrent.FutureTask;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Real session shutdown path, without starting any network/source task. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=28)
public class EngineOffCleanupTest {
    @Test public void offCancelsRealSessionEvenWithoutAnyNativeManager()throws Exception{
        Activity a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        PageCaptionController.onVideoId("coreofftest");CaptionChoice.select("fr",true);DeepSeekConfig.saveEnabled(a,true);
        Class<?> type=Class.forName("app.yydarlinker.deepseekcaptions.ContextualUnitCaptionController$Session");
        Constructor<?> constructor=type.getDeclaredConstructor(long.class,Context.class,String.class,String.class,String.class,TargetLanguage.class,DeepSeekConfig.Snapshot.class);
        constructor.setAccessible(true);
        Object session=constructor.newInstance(1L,a,"https://www.youtube.com/api/timedtext?v=coreofftest&lang=en&tlang=fr","test-only","coreofftest",TargetLanguage.fromCode("fr"),DeepSeekConfig.load(a));
        Field visible=type.getDeclaredField("visible"),cancelled=type.getDeclaredField("cancelled"),sourceTask=type.getDeclaredField("sourceTask");
        visible.setAccessible(true);cancelled.setAccessible(true);sourceTask.setAccessible(true);visible.setBoolean(session,true);
        FutureTask<Void> neverStarted=new FutureTask<>(()->{throw new AssertionError("No network task may start in this test");});sourceTask.set(session,neverStarted);
        Field active=ContextualUnitCaptionController.class.getDeclaredField("active");active.setAccessible(true);Object previous=active.get(null);active.set(null,session);
        try{
            assertTrue(DynamicCaptionController.isVisibleActive());
            assertTrue(CaptionQuickToggle.setEngine(a,false));
            assertFalse(DeepSeekConfig.enabled(a));assertFalse(DynamicCaptionController.isVisibleActive());
            assertTrue(cancelled.getBoolean(session));assertTrue(neverStarted.isCancelled());assertNull(active.get(null));
        }finally{active.set(null,previous);DeepSeekConfig.saveEnabled(a,false);a.finish();}
    }
}
