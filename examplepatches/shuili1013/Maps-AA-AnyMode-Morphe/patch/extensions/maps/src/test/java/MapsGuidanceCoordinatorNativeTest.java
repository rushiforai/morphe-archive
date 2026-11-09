import static org.junit.Assert.*;
import android.content.Context;
import android.media.AudioManager;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.ungoogled.ui.MapsGuidanceCoordinator;

/** Native-shape fixtures verify fencing side effects; these do not establish original-app audio. */
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE) @LooperMode(LooperMode.Mode.PAUSED)
public class MapsGuidanceCoordinatorNativeTest {
    MapsGuidanceCoordinator coordinator;
    static Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
    @Before public void setup()throws Exception{coordinator=new MapsGuidanceCoordinator(RuntimeEnvironment.getApplication());players().clear();}
    @After public void cleanup()throws Exception{players().clear();field(MapsGuidanceCoordinator.class,"current").set(null,null);}
    @SuppressWarnings("unchecked") Map<Object,Object> players()throws Exception{return (Map<Object,Object>)field(MapsGuidanceCoordinator.class,"PLAYERS").get(null);}
    @Test public void ordinaryNativeDispatchKeepsOriginalCallbackAndDoesNotInventStart()throws Exception{
        bmtl job=new bmtl();bmsk player=new bmsk();bmua callback=new bmua(){};
        MapsGuidanceCoordinator.dispatch(job,player,callback);
        assertEquals(1,player.plays);assertSame(callback,player.callback);assertEquals(0,player.stops);assertFalse(job.s.get());assertEquals(0,job.neverPlayed);
        assertSame(player,players().get(job));
    }
    @Test public void holdRejectsLateAsyncDispatchAndReleasesPreparedMediaBeforeNativeCompletion()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);
        bmtl job=new bmtl();bmsk player=new bmsk();job.player=player;
        MapsGuidanceCoordinator.dispatch(job,player,new bmua(){});
        assertTrue(job.s.get());assertEquals(0,player.plays);assertEquals(1,player.stops);assertNull(player.a);assertEquals(1,job.neverPlayed);assertTrue(job.releasedWhenCompleted);assertFalse(players().containsKey(job));
    }
    @Test public void nativeDispatchExceptionIsPreservedWithoutFakingCompletion()throws Exception{
        bmtl job=new bmtl();bmsk player=new bmsk();player.fail=true;
        try{MapsGuidanceCoordinator.dispatch(job,player,new bmua(){});fail("native play failure");}catch(IllegalStateException expected){assertEquals("native failure",expected.getMessage());}
        assertEquals(0,job.neverPlayed);assertEquals(1,player.plays);assertSame(player,players().get(job));
    }
    @Test public void nativeTerminalObserverRemovesOnlyTheCompletedJob()throws Exception{
        bmtl first=new bmtl(),second=new bmtl();bmsk a=new bmsk(),b=new bmsk();
        MapsGuidanceCoordinator.dispatch(first,a,new bmua(){});MapsGuidanceCoordinator.dispatch(second,b,new bmua(){});
        MapsGuidanceCoordinator.terminal(new bmth(first),a);assertSame(a,players().get(first));
        a.l();MapsGuidanceCoordinator.terminal(new bmth(first),a);assertFalse(players().containsKey(first));assertSame(b,players().get(second));assertEquals(0,first.neverPlayed);assertEquals(0,second.neverPlayed);
    }
    @Test public void nativeNonAudioPlayersDoNotPoisonTheAudioQuiescenceFence()throws Exception{
        for(bmuc player:new bmuc[]{new bmtp(),new bmty()}){
            bmtl job=new bmtl();MapsGuidanceCoordinator.dispatch(job,player,new bmua(){});
            assertSame(player,players().get(job));
            MapsGuidanceCoordinator.terminal(new bmth(job),player);
            assertFalse(players().containsKey(job));assertFalse(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
            assertEquals(0,job.neverPlayed);
        }
    }
    @Test public void unknownPlayersStillFailClosedInsteadOfInventingQuiescence()throws Exception{
        bmtl job=new bmtl();bmuc unknown=new bmuc(){public void d(bmua callback){}public void l(){}};
        MapsGuidanceCoordinator.dispatch(job,unknown,new bmua(){});MapsGuidanceCoordinator.terminal(new bmth(job),unknown);
        assertSame(unknown,players().get(job));assertTrue(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
    }
    @Test public void nativeFocusCannotStealTheOwnedWarningHold()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);
        // Null would throw if the guarded native focus API were actually called.
        assertEquals(AudioManager.AUDIOFOCUS_REQUEST_FAILED,MapsGuidanceCoordinator.requestNativeFocus(null,null));
        assertTrue(field(MapsGuidanceCoordinator.class,"regenerate").getBoolean(coordinator));
        assertEquals(0,field(MapsGuidanceCoordinator.class,"nativeFocusInFlight").getInt(null));
    }
    @Test public void originalFocusExceptionDoesNotLeaveAnInFlightHoldFence()throws Exception{
        try{MapsGuidanceCoordinator.requestNativeFocus(null,null);fail("Original null manager");}catch(NullPointerException expected){}
        assertEquals(0,field(MapsGuidanceCoordinator.class,"nativeFocusInFlight").getInt(null));
    }
    @Test public void deniedFocusCallbackReleasesPreparedPlayerAndCompletesNativeQueueOnce()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);bmtl job=new bmtl();bmsk player=new bmsk();job.player=player;
        assertTrue(MapsGuidanceCoordinator.cancelPreparedCallback(new bmtf(new bmtg(job),player,0)));
        assertEquals(0,player.plays);assertEquals(1,player.stops);assertEquals(1,player.releases);assertEquals(1,job.neverPlayed);assertTrue(job.releasedWhenCompleted);
        assertEquals(java.util.Arrays.asList("stop","release","native_complete"),player.lifecycle);
        assertFalse(MapsGuidanceCoordinator.cancelPreparedCallback(new bmtf(new Object(),new Object(),4)));
    }
    @Test public void routeRegenerationUsesGuardedBaseFieldsDespiteObfuscatedSubclassShadowing()throws Exception{
        anys owner=new anys();bmia base=owner;base.o=new ybc();base.e=new blot();base.c=new RouteController();
        field(MapsGuidanceCoordinator.class,"route").set(null,new java.lang.ref.WeakReference<>(owner));
        java.lang.reflect.Method regenerate=MapsGuidanceCoordinator.class.getDeclaredMethod("regenerateCurrent");regenerate.setAccessible(true);regenerate.invoke(coordinator);
        assertSame(base.o,base.lastPull);assertTrue(owner.o);assertFalse(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
    }
}
interface bmua{}
interface bmuc{void d(bmua callback);void l();}
final class bmtp implements bmuc{public void d(bmua callback){}public void l(){throw new AssertionError("An audio observer must not mutate a native sentinel");}}
final class bmty implements bmuc{public void d(bmua callback){}public void l(){throw new AssertionError("An audio observer must not cancel native haptics");}}
final class bmsk implements bmuc {
    final java.util.List<String> lifecycle=new java.util.ArrayList<>();
    final PreparedMedia resource=new PreparedMedia(lifecycle);Object a=resource;int plays,stops,releases;boolean fail;bmua callback;
    public void d(bmua callback){plays++;this.callback=callback;if(fail)throw new IllegalStateException("native failure");}
    public void l(){if(a!=null){resource.stop();stops++;resource.release();releases++;a=null;}}
}
final class PreparedMedia {
    final java.util.List<String> lifecycle;boolean stopped,released;
    PreparedMedia(java.util.List<String> lifecycle){this.lifecycle=lifecycle;}
    void stop(){stopped=true;lifecycle.add("stop");}
    void release(){if(!stopped)throw new IllegalStateException("release before stop");released=true;lifecycle.add("release");}
}
final class bmtl {
    final AtomicBoolean s=new AtomicBoolean();int neverPlayed;boolean releasedWhenCompleted;bmsk player;
    public void e(bmuc ignored){neverPlayed++;releasedWhenCompleted=player==null||player.a==null&&player.resource.released;if(player!=null)player.lifecycle.add("native_complete");}
}
final class bmth {final bmtl a;bmth(bmtl job){a=job;}}
final class bmtg {final bmtl a;bmtg(bmtl job){a=job;}}
final class bmtf {final Object b,a;final int $cid;bmtf(Object parent,Object player,int selector){b=parent;a=player;$cid=selector;}}
class bmia {ybc o;blot e;bmhh c;ybc lastPull;public void u(ybc step){lastPull=step;}}
final class anys extends bmia {final boolean o=true;}
final class ybc{}
final class blot{yap b;}
final class yap{bjix k;}
final class bjix{final double[] lat,lon;bjix(double[] a,double[] b){lat=a;lon=b;}public int g(){return lat.length;}public bjis n(int i){return new bjis(lat[i],lon[i]);}}
final class bjis{final double latitude,longitude;bjis(double a,double b){latitude=a;longitude=b;}public double b(){return latitude;}public double d(){return longitude;}}
interface bmhh {boolean bv();}
final class RouteController implements bmhh {public boolean bv(){return true;}}
