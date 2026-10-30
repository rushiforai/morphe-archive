package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.ImageView;
import app.yydarlinker.caption.contracts.CaptionContracts.*;
import java.time.Duration;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Deterministic virtual-clock checks of real CC views, authority transitions and the command port. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class CaptionCcStartupTest {
    static final String A="abcdefghijk",B="lmnopqrstuv";
    Activity a;
    ImageView button;
    String video=A;
    boolean active;
    int starts,stops;
    long firstStart=-1;

    @Before public void before(){
        CaptionButtonController.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
        CaptionPlayerAuthority.resetForTests();CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();NativeCaptionBridge.resetForTests();SourceCatalog.clear();
        a=Robolectric.buildActivity(Activity.class).setup().visible().get();CaptionAddonSupport.initialize(a);
        CaptionSessionIntent.resetForTests(a);DeepSeekConfig.saveEnabled(a,true);CaptionSessionIntent.userToggled(a,true);
        CaptionActions.install(new CaptionPort(){
            public void command(Action action,String value){
                if(action==Action.VIDEO){video=value;active=false;CaptionSessionReconciler.onVideo(a,value);}
                if(action==Action.ACTIVATE||action==Action.SOURCE){active=true;starts++;if(firstStart<0)firstStart=SystemClock.uptimeMillis();}
                if(action==Action.DEACTIVATE){active=false;stops++;if("user_off".equals(value))CaptionSessionReconciler.onUserOff(a,value);else CaptionSessionReconciler.retireApplication();}
            }
            public boolean active(){return active;}public boolean ownsNativeTrack(){return active;}
            public String restoreTarget(String u){return u;}public String videoId(){return video;}
            public void playback(long at){CaptionSessionReconciler.onPlayerRegular(a);}
        },new CaptionActions.SettingsServices(){public String testApi(){return "fixture";}public List<String> models(String u){return Collections.emptyList();}});
        CaptionPlayerTransitionGuard.installAuthorityListener();CaptionPlayerTransitionGuard.setActivity(a);
        CaptionPlayerAuthority.setOwner(a);CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        CaptionButtonController.install(a);CaptionButtonController.onVideoId(A);
        button=makeButton(a,true);selected(A,"en",false);
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);CaptionSessionReconciler.onVideo(a,A);
        idle(1400);active=true;starts=stops=0;firstStart=-1;
    }
    @After public void after(){
        CaptionButtonController.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
        CaptionPlayerAuthority.resetForTests();CaptionSessionReconciler.resetForTests();CaptionNativeProjection.resetForTests();
        NativeCaptionBridge.resetForTests();CaptionSessionIntent.resetForTests(a);a.finish();
    }
    ImageView makeButton(Activity owner,boolean on){
        ImageView view=new ImageView(owner);
        ((ViewGroup)owner.findViewById(android.R.id.content)).addView(view,new ViewGroup.LayoutParams(100,100));
        view.layout(0,0,100,100);view.setContentDescription(on?"Turn off captions":"Turn on captions");
        view.setOnClickListener(v->{v.setContentDescription(v.getContentDescription().toString().equals("Turn off captions")?"Turn on captions":"Turn off captions");CaptionButtonController.onNativeCaptionButtonController(view);});
        return view;
    }
    void selected(String owner,String language,boolean translated){
        CaptionNativeProjection.selection(owner,language,"https://www.youtube.com/api/timedtext?v="+owner+"&lang=en"+(translated?"&tlang="+language:""),false,translated,false,CaptionPlayerAuthority.ownerEpoch());
    }
    void idle(long ms){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));}
    void entering(boolean on){
        enteringWithoutExactCallback(on);
        CaptionButtonController.onNativeCaptionButtonController(button);idle(0);
    }
    void enteringWithoutExactCallback(boolean on){
        DeepSeekCaptionHook.onVideoId(B);selected(B,"zh-Hans",true);
        button.setContentDescription(on?"Turn off captions":"Turn on captions");
    }
    void stable(){CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");}
    void tap(){long t=SystemClock.uptimeMillis();MotionEvent d=MotionEvent.obtain(t,t,0,50,50,0),u=MotionEvent.obtain(t,t+40,1,50,50,0);button.dispatchTouchEvent(d);button.dispatchTouchEvent(u);d.recycle();u.recycle();}

    @Test public void aStableNewVideoStartsWithinTwoHundredMsInsteadOfWaitingFourSeconds(){
        entering(true);idle(32);long settled=SystemClock.uptimeMillis();stable();idle(200);
        assertEquals("settled current CC on starts once",1,starts);
        assertTrue("CC recognition does not retain the 4.5 s transition window",firstStart-settled<=200);
        System.out.println("CC_EXACT_READY_AFTER_STABLE_MS="+(firstStart-settled));
        assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aStableScanPreemptsAScanAlreadyParkedAtTheQuietDeadline(){
        enteringWithoutExactCallback(true);idle(300);long settled=SystemClock.uptimeMillis();stable();idle(200);
        assertEquals(1,starts);assertTrue(firstStart-settled<=200);
        System.out.println("CC_PREEMPT_READY_AFTER_STABLE_MS="+(firstStart-settled));
    }
    @Test public void anUnsettledPlayerDoesNotUseTheFastConfirmationPath(){
        entering(true);idle(1000);assertEquals(0,starts);assertFalse(active);
        stable();idle(200);assertEquals(1,starts);
    }
    @Test public void aStableCcOffNeverStartsAiEvenWithANativeTranslatedTrack(){
        entering(false);stable();idle(1200);CaptionActions.onVideoTime(100);assertEquals(0,starts);assertFalse(active);
        assertNotEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
    }
    @Test public void anUnknownCcStateNeverStartsAiFromItsNativeTrackAlone(){
        entering(true);button.setContentDescription("Captions");stable();idle(1200);
        assertEquals(0,starts);assertFalse(active);assertNotEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
    }
    @Test public void aTransientOffWhileTheSameVideoSettlesDoesNotStopExistingAi(){
        CaptionButtonController.onNativeCaptionButtonController(button);idle(0);
        CaptionButtonController.onPlayerTransition("WATCH_WHILE_FULLSCREEN");
        button.setContentDescription("Turn on captions");CaptionButtonController.onNativeCaptionButtonController(button);idle(100);
        CaptionButtonController.onPlayerStable();idle(200);assertTrue(active);assertEquals(0,stops);
        button.setContentDescription("Turn off captions");CaptionButtonController.onNativeCaptionButtonController(button);idle(1000);
        assertTrue(active);assertEquals(0,stops);
    }
    @Test public void aPersistentOffAfterSettlingStillStopsAiAndKeepsTheMode(){
        CaptionButtonController.onPlayerTransition("WATCH_WHILE_FULLSCREEN");
        button.setContentDescription("Turn on captions");CaptionButtonController.onNativeCaptionButtonController(button);idle(100);
        CaptionButtonController.onPlayerStable();idle(1200);
        assertFalse(active);assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertTrue(CaptionSessionIntent.load(a).aiEnabled);
    }
    @Test public void aRealCcOffTapDuringTheProtectionWindowStopsImmediately(){
        CaptionButtonController.onNativeCaptionButtonController(button);idle(0);
        CaptionButtonController.onPlayerTransition("WATCH_WHILE_FULLSCREEN");tap();
        assertFalse(active);assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        CaptionButtonController.onPlayerStable();idle(200);assertFalse(active);
    }
    @Test public void aStableCcOnCannotInventANativeLanguage(){
        assertEquals("",NativeCaptionBridge.nativeModelVideo(null));
        assertEquals("",NativeCaptionBridge.nativeModelVideo(new Object()));
        entering(true);CaptionNativeProjection.beginVideo(B);stable();idle(300);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());assertEquals(0,starts);assertFalse(active);
        selected(B,"fr",true);CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
        assertEquals(1,starts);assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aCurrentExactControllerCanConfirmOnWhilePlayerControlsAreHidden(){
        entering(true);button.setVisibility(android.view.View.INVISIBLE);idle(32);stable();idle(200);
        assertEquals("the exact native controller remains evidence when controls fade",1,starts);
    }
    @Test public void aControlFromAnotherActivityCannotGrantThisVideosCcPermission(){
        entering(false);
        Activity departed=Robolectric.buildActivity(Activity.class).setup().visible().get();
        try{ImageView stale=makeButton(departed,true);CaptionButtonController.onNativeCaptionButtonController(stale);stable();idle(1200);assertEquals(0,starts);assertFalse(active);}
        finally{departed.finish();}
    }
    @Test public void aSafeBlankProbeEndingBeforeThePlayerIsProvenCannotReleaseTheGuard(){
        entering(true);CaptionButtonController.onPlayerStable();idle(200);
        assertEquals(0,starts);assertFalse(active);assertEquals(CaptionPlayerAuthority.UNKNOWN,CaptionPlayerAuthority.state());
    }
    @Test public void aStableCcOnCannotEnableAnAiSwitchThatIsOff(){
        CaptionSessionReconciler.onUserSwitched(a,false);entering(true);stable();idle(300);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());assertEquals(0,starts);assertFalse(active);
        CaptionSessionReconciler.onUserSwitched(a,true);assertEquals(1,starts);
    }
    @Test public void theStableReadUsesTheFinalButtonStateInsteadOfAPostedOnSnapshot(){
        entering(true);stable();button.setContentDescription("Turn on captions");idle(1200);
        assertEquals(0,starts);assertFalse(active);assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
    }
    @Test public void aFallbackScanCannotPromoteCcOffToOn(){
        enteringWithoutExactCallback(false);idle(300);stable();idle(1200);
        assertEquals(0,starts);assertFalse(active);assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
    }
}
