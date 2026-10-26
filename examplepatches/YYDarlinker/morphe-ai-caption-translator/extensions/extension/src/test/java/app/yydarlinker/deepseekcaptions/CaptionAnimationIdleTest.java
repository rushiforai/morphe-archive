package app.yydarlinker.deepseekcaptions;
import android.app.Activity;import android.os.Looper;import java.time.Duration;
import org.junit.*;import org.junit.runner.RunWith;import org.robolectric.*;import org.robolectric.annotation.*;import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows=CaptionAnimationIdleTest.Core.class)
@LooperMode(LooperMode.Mode.PAUSED)
public class CaptionAnimationIdleTest {
    static boolean owns;
    @Implements(CaptionActions.class) public static class Core {@Implementation public static boolean ownsNativeTrack(){return owns;}}
    Activity a;
    @Before public void before(){CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();a=Robolectric.buildActivity(Activity.class).setup().visible().get();CaptionPlayerAuthority.setOwner(a);CaptionSurface.activity(a);CaptionMusicSuppressor.setActivity(a);CaptionMusicSuppressor.scanCount=0;owns=true;}
    @After public void after(){owns=false;CaptionMusicSuppressor.kick();idle(100);CaptionMusicSuppressor.setActivity(null);CaptionSurface.activity(null);CaptionPlayerAuthority.resetForTests();a.finish();}
    void idle(long ms){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));}
    @Test public void minimizingWithARetainedEngineDoesNotKeepSearchingTheWindow(){
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MINIMIZED");CaptionMusicSuppressor.forceNativeRendererScan();CaptionMusicSuppressor.kick();idle(1200);
        assertEquals("retaining the engine must not retain renderer tree discovery while compact",0,CaptionMusicSuppressor.scanCount);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");CaptionPlayerAuthority.settleRegular();CaptionMusicSuppressor.endNativeRendererTransition();idle(100);
        assertTrue("renderer protection resumes when the player becomes regular",CaptionMusicSuppressor.scanCount>0);
    }
    @Test public void anAiOffPlayerDoesNotStartRendererDiscovery(){
        owns=false;CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");CaptionMusicSuppressor.forceNativeRendererScan();idle(1200);assertEquals(0,CaptionMusicSuppressor.scanCount);
    }
    @Test public void slidingPausesOnlyAuxiliaryDiscoveryAndResumesAtTheSettledType(){
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED");
        assertTrue("caption display authority must remain permitted during a regular sliding type",CaptionPlayerAuthority.displayPermitted());
        CaptionMusicSuppressor.forceNativeRendererScan();CaptionMusicSuppressor.kick();idle(500);assertEquals(0,CaptionMusicSuppressor.scanCount);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");CaptionMusicSuppressor.endNativeRendererTransition();idle(100);
        assertTrue(CaptionMusicSuppressor.scanCount>0);assertTrue(CaptionPlayerAuthority.displayPermitted());
    }
}
