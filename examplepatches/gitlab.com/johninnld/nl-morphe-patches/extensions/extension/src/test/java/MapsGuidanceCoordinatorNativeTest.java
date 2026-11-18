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
    @After public void cleanup()throws Exception{players().clear();field(MapsGuidanceCoordinator.class,"current").set(null,null);field(MapsGuidanceCoordinator.class,"holder").set(null,new java.lang.ref.WeakReference<>(null));}
    @SuppressWarnings("unchecked") Map<Object,Object> players()throws Exception{return (Map<Object,Object>)field(MapsGuidanceCoordinator.class,"PLAYERS").get(null);}
    void hold(MapsGuidanceCoordinator value)throws Exception{field(MapsGuidanceCoordinator.class,"holding").setBoolean(value,true);holder(new java.lang.ref.WeakReference<>(value));}
    void holder(java.lang.ref.WeakReference<MapsGuidanceCoordinator> value)throws Exception{field(MapsGuidanceCoordinator.class,"holder").set(null,value);}
    MapsGuidanceCoordinator holder()throws Exception{return ((java.lang.ref.WeakReference<MapsGuidanceCoordinator>)field(MapsGuidanceCoordinator.class,"holder").get(null)).get();}
    @Test public void ordinaryNativeDispatchKeepsOriginalCallbackAndDoesNotInventStart()throws Exception{
        bnad job=new bnad();bmzd player=new bmzd();bnas callback=new bnas(){};
        MapsGuidanceCoordinator.dispatch(job,player,callback);
        assertEquals(1,player.plays);assertSame(callback,player.callback);assertEquals(0,player.stops);assertFalse(job.s.get());assertEquals(0,job.neverPlayed);
        assertSame(player,players().get(job));
    }
    @Test public void holdRejectsLateAsyncDispatchAndReleasesPreparedMediaBeforeNativeCompletion()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);
        bnad job=new bnad();bmzd player=new bmzd();job.player=player;
        MapsGuidanceCoordinator.dispatch(job,player,new bnas(){});
        assertTrue(job.s.get());assertEquals(0,player.plays);assertEquals(1,player.stops);assertNull(player.a);assertEquals(1,job.neverPlayed);assertTrue(job.releasedWhenCompleted);assertFalse(players().containsKey(job));
    }
    @Test public void nativeDispatchExceptionIsPreservedWithoutFakingCompletion()throws Exception{
        bnad job=new bnad();bmzd player=new bmzd();player.fail=true;
        try{MapsGuidanceCoordinator.dispatch(job,player,new bnas(){});fail("native play failure");}catch(IllegalStateException expected){assertEquals("native failure",expected.getMessage());}
        assertEquals(0,job.neverPlayed);assertEquals(1,player.plays);assertSame(player,players().get(job));
    }
    @Test public void nativeTerminalObserverRemovesOnlyTheCompletedJob()throws Exception{
        bnad first=new bnad(),second=new bnad();bmzd a=new bmzd(),b=new bmzd();
        MapsGuidanceCoordinator.dispatch(first,a,new bnas(){});MapsGuidanceCoordinator.dispatch(second,b,new bnas(){});
        MapsGuidanceCoordinator.terminal(new bmzz(first),a);assertSame(a,players().get(first));
        a.l();MapsGuidanceCoordinator.terminal(new bmzz(first),a);assertFalse(players().containsKey(first));assertSame(b,players().get(second));assertEquals(0,first.neverPlayed);assertEquals(0,second.neverPlayed);
    }
    @Test public void nativeNonAudioPlayersDoNotPoisonTheAudioQuiescenceFence()throws Exception{
        for(bnau player:new bnau[]{new bnah(),new bnaq()}){
            bnad job=new bnad();MapsGuidanceCoordinator.dispatch(job,player,new bnas(){});
            assertSame(player,players().get(job));
            MapsGuidanceCoordinator.terminal(new bmzz(job),player);
            assertFalse(players().containsKey(job));assertFalse(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
            assertEquals(0,job.neverPlayed);
        }
    }
    @Test public void unknownPlayersStillFailClosedInsteadOfInventingQuiescence()throws Exception{
        bnad job=new bnad();bnau unknown=new bnau(){public void d(bnas callback){}public void l(){}};
        MapsGuidanceCoordinator.dispatch(job,unknown,new bnas(){});MapsGuidanceCoordinator.terminal(new bmzz(job),unknown);
        assertSame(unknown,players().get(job));assertTrue(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
    }
    @Test public void nativeFocusCannotStealTheOwnedWarningHold()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);
        // Null would throw if the guarded native focus API were actually called.
        assertEquals(AudioManager.AUDIOFOCUS_REQUEST_FAILED,MapsGuidanceCoordinator.requestNativeFocus(null,null));
        assertTrue(field(MapsGuidanceCoordinator.class,"regenerate").getBoolean(coordinator));
        assertEquals(0,field(MapsGuidanceCoordinator.class,"nativeFocusInFlight").getInt(null));
    }
    @Test public void newlyConstructedIdleCoordinatorCannotEraseTheOwnedHold()throws Exception{
        hold(coordinator);
        MapsGuidanceCoordinator idle=new MapsGuidanceCoordinator(RuntimeEnvironment.getApplication());
        assertEquals("A replacement constructor must not become the active hold owner",coordinator,holder());
        assertEquals(AudioManager.AUDIOFOCUS_REQUEST_FAILED,MapsGuidanceCoordinator.requestNativeFocus(null,null));
        assertTrue(field(MapsGuidanceCoordinator.class,"regenerate").getBoolean(coordinator));
        assertFalse(field(MapsGuidanceCoordinator.class,"regenerate").getBoolean(idle));
    }
    @Test public void releasingTheHoldClearsTheOwnerEvenAfterReplacement()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);
        field(MapsGuidanceCoordinator.class,"holdToken").set(coordinator,"warning");
        holder(new java.lang.ref.WeakReference<>(coordinator));
        new MapsGuidanceCoordinator(RuntimeEnvironment.getApplication());
        java.lang.reflect.Method release=MapsGuidanceCoordinator.class.getDeclaredMethod("releaseMain",String.class);release.setAccessible(true);release.invoke(coordinator,"warning");
        assertNull("A released coordinator must not keep fencing native focus",holder());
        try{MapsGuidanceCoordinator.requestNativeFocus(null,null);fail("Original null manager");}catch(NullPointerException expected){}
        assertEquals(0,field(MapsGuidanceCoordinator.class,"nativeFocusInFlight").getInt(null));
    }
    @Test public void originalFocusExceptionDoesNotLeaveAnInFlightHoldFence()throws Exception{
        try{MapsGuidanceCoordinator.requestNativeFocus(null,null);fail("Original null manager");}catch(NullPointerException expected){}
        assertEquals(0,field(MapsGuidanceCoordinator.class,"nativeFocusInFlight").getInt(null));
    }
    @Test public void deniedFocusCallbackReleasesPreparedPlayerAndCompletesNativeQueueOnce()throws Exception{
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);bnad job=new bnad();bmzd player=new bmzd();job.player=player;
        assertTrue(MapsGuidanceCoordinator.cancelPreparedCallback(new bmyo(new bmzy(job),player,2)));
        assertEquals(0,player.plays);assertEquals(1,player.stops);assertEquals(1,player.releases);assertEquals(1,job.neverPlayed);assertTrue(job.releasedWhenCompleted);
        assertEquals(java.util.Arrays.asList("stop","release","native_complete"),player.lifecycle);
        assertFalse(MapsGuidanceCoordinator.cancelPreparedCallback(new bmyo(new Object(),new Object(),0)));
        assertFalse(MapsGuidanceCoordinator.cancelPreparedCallback(new bmyo(new Object(),new Object(),4)));
    }
    static final class VoiceRoute extends bmon implements MapsGuidanceCoordinator.NativeReplay {
        final boolean o=true;boolean eligible=true;int voiceCalls;ycx voiceStep;
        public boolean morpheCanResumeGuidance(){return eligible&&((bmon)this).o!=null&&e!=null;}
        public void morpheResumeGuidance(){if(morpheCanResumeGuidance()){voiceCalls++;voiceStep=((bmon)this).o;}}
    }
    private void route(Object owner)throws Exception{field(MapsGuidanceCoordinator.class,"route").set(null,new java.lang.ref.WeakReference<>(owner));}
    private void regenerate()throws Exception{java.lang.reflect.Method m=MapsGuidanceCoordinator.class.getDeclaredMethod("regenerateCurrent");m.setAccessible(true);m.invoke(coordinator);}
    private boolean canRegenerate()throws Exception{java.lang.reflect.Method m=MapsGuidanceCoordinator.class.getDeclaredMethod("canRegenerate");m.setAccessible(true);return (Boolean)m.invoke(coordinator);}
    @Test public void recoveryRequestsFreshNativeVoiceWithoutSelectingAPreviewStep()throws Exception{
        VoiceRoute owner=new VoiceRoute();bmon base=owner;base.o=new ycx();base.e=new blvb();base.c=new RouteController();route(owner);
        regenerate();assertSame(base.o,owner.voiceStep);assertEquals(1,owner.voiceCalls);
        assertNull("The original u method inspects a map step and must never restore voice",base.lastPull);
        base.o=new ycx();regenerate();assertSame("Resume uses the current step rather than a captured warning-era step",base.o,owner.voiceStep);assertEquals(2,owner.voiceCalls);
        assertTrue(owner.o);assertFalse(field(MapsGuidanceCoordinator.class,"fault").getBoolean(coordinator));
    }
    @Test public void nativeEligibilityAndEndedNavigationPreventRecovery()throws Exception{
        VoiceRoute owner=new VoiceRoute();bmon base=owner;base.o=new ycx();base.e=new blvb();base.c=new RouteController();route(owner);assertTrue(canRegenerate());
        owner.eligible=false;assertFalse(canRegenerate());regenerate();assertEquals(0,owner.voiceCalls);
        owner.eligible=true;base.c=new bmnv(){public boolean bv(){return false;}};assertFalse(canRegenerate());regenerate();assertEquals(0,owner.voiceCalls);
        base.c=new RouteController();base.o=null;assertFalse(canRegenerate());base.o=new ycx();base.e=null;assertFalse(canRegenerate());
    }
    @Test public void anOwnerWithoutTheGuardedVoiceBridgeNeverFallsBackToStepInspection()throws Exception{
        bmon old=new bmon();old.o=new ycx();old.e=new blvb();old.c=new RouteController();route(old);
        assertFalse(canRegenerate());regenerate();assertNull(old.lastPull);
    }
    @Test public void releasingAWarningHoldRestoresNativeVoiceOnlyOnce()throws Exception{
        VoiceRoute owner=new VoiceRoute();bmon base=owner;base.o=new ycx();base.e=new blvb();base.c=new RouteController();route(owner);
        field(MapsGuidanceCoordinator.class,"holding").setBoolean(coordinator,true);field(MapsGuidanceCoordinator.class,"regenerate").setBoolean(coordinator,true);field(MapsGuidanceCoordinator.class,"holdToken").set(coordinator,"warning");
        java.lang.reflect.Method release=MapsGuidanceCoordinator.class.getDeclaredMethod("releaseMain",String.class);release.setAccessible(true);release.invoke(coordinator,"warning");release.invoke(coordinator,"warning");
        assertEquals(1,owner.voiceCalls);assertNull(base.lastPull);assertFalse(field(MapsGuidanceCoordinator.class,"holding").getBoolean(coordinator));
    }

}
interface bnas{}
interface bnau{void d(bnas callback);void l();}
final class bnah implements bnau{public void d(bnas callback){}public void l(){throw new AssertionError("An audio observer must not mutate a native sentinel");}}
final class bnaq implements bnau{public void d(bnas callback){}public void l(){throw new AssertionError("An audio observer must not cancel native haptics");}}
final class bmzd implements bnau {
    final java.util.List<String> lifecycle=new java.util.ArrayList<>();
    final PreparedMedia resource=new PreparedMedia(lifecycle);Object a=resource;int plays,stops,releases;boolean fail;bnas callback;
    public void d(bnas callback){plays++;this.callback=callback;if(fail)throw new IllegalStateException("native failure");}
    public void l(){if(a!=null){resource.stop();stops++;resource.release();releases++;a=null;}}
}
final class PreparedMedia {
    final java.util.List<String> lifecycle;boolean stopped,released;
    PreparedMedia(java.util.List<String> lifecycle){this.lifecycle=lifecycle;}
    void stop(){stopped=true;lifecycle.add("stop");}
    void release(){if(!stopped)throw new IllegalStateException("release before stop");released=true;lifecycle.add("release");}
}
final class bnad {
    final AtomicBoolean s=new AtomicBoolean();int neverPlayed;boolean releasedWhenCompleted;bmzd player;
    public void e(bnau ignored){neverPlayed++;releasedWhenCompleted=player==null||player.a==null&&player.resource.released;if(player!=null)player.lifecycle.add("native_complete");}
}
final class bmzz {final bnad a;bmzz(bnad job){a=job;}}
final class bmzy {final bnad a;bmzy(bnad job){a=job;}}
final class bmyo {final Object a,b;final int $cid;bmyo(Object parent,Object player,int selector){a=parent;b=player;$cid=selector;}}
class bmon {ycx o;blvb e;bmnv c;ycx lastPull;public void u(ycx step){lastPull=step;}}
final class anys extends bmon {final boolean o=true;}
final class ycx{}
final class blvb{ycj b;}
final class ycj{bjpp k;}
final class bjpp{final double[] lat,lon;bjpp(double[] a,double[] b){lat=a;lon=b;}public int g(){return lat.length;}public bjpk n(int i){return new bjpk(lat[i],lon[i]);}}
final class bjpk{final double latitude,longitude;bjpk(double a,double b){latitude=a;longitude=b;}public double b(){return latitude;}public double d(){return longitude;}}
interface bmnv {boolean bv();}
final class RouteController implements bmnv {public boolean bv(){return true;}}
