package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.os.Looper;
import app.yydarlinker.caption.contracts.CaptionContracts.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Current Shorts native selection and display lifecycle, through the real reconciler. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,qualifiers="w1280dp-h1000dp-mdpi",shadows={N39UiGeometryFixture.Geometry.class,
        NativeLanguageAuthorityTest.Tracks.class,NativeLanguageAuthorityTest.Flags.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class ShortsCaptionAuthorityTest {
    static final String A="abcdefghijk",B="lmnopqrstuv";
    N39UiGeometryFixture h;
    String video="";
    boolean active;
    List<String> starts=new ArrayList<>();

    void historyReentryWithEarlyTrackN75(String language,boolean translated) {
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");assertTrue(active);
        CaptionPlayerAuthority.onShortsStateChanged(false);starts.clear();
        N39UiGeometryFixture.shorts=false;
        NativeCaptionBridge.onNativeSelectionApplied(new NativeLanguageAuthorityTest.Manager(A),
                new NativeLanguageAuthorityTest.Track(A,language,translated),
                NativeLanguageAuthorityTest.Origin.DEFAULT,2,A);
        CaptionPlayerAuthority.onShortsStateChanged(true);
        DeepSeekCaptionHook.onVideoId(A); // Same id/epoch, and no new PlayerType or time callback.
        assertNotNull(CaptionSessionReconciler.currentSelection());assertFalse(active);
    }
    @Test public void aHistoryReentryStartsWhenItsSurfaceBecomesReadyWithoutATimeTickN75(){
        historyReentryWithEarlyTrackN75("fr",true);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(50));
        assertTrue("geometry readiness must reconcile the already committed current track",active);
        assertEquals("fr",CaptionSessionReconciler.currentSelection().target());assertEquals(1,starts.size());
    }
    @Test public void aSourceTrackAlsoResumesAfterLateGeometryWithoutAnyTimeCallbackN75(){
        historyReentryWithEarlyTrackN75("zh",false);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(50));
        assertTrue(active);assertEquals("zh",CaptionSessionReconciler.currentSelection().target());
        assertFalse(starts.get(0).contains("tlang="));
    }
    @Test public void aRepeatedSameVideoNotificationCanFinishShortsCcAfterGeometrySettledN75(){
        historyReentryWithEarlyTrackN75("fr",true);
        CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(50));
        assertFalse(active);N39UiGeometryFixture.shorts=true;DeepSeekCaptionHook.onVideoId(A);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(50));
        assertTrue("repeated VIDEO is a readiness observation, not a reason to skip CC",active);
    }
    @Test public void aQueuedReadinessPassCannotUndoCcOffN75(){
        historyReentryWithEarlyTrackN75("fr",true);
        CaptionSessionReconciler.onUserOff(h.a,"cc_button");
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertFalse(active);assertTrue(starts.isEmpty());assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
    }
    @Test public void closingBeforeAReadyPassRunsCannotReviveTheOldShortN75(){
        historyReentryWithEarlyTrackN75("fr",true);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        CaptionPlayerAuthority.onShortsStateChanged(false);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertFalse(active);assertTrue(starts.isEmpty());assertNull(CaptionSessionReconciler.currentSelection());
    }
    @Test public void noFreshNativeTrackMeansNoRememberedLanguageOnReadyN75(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");
        CaptionPlayerAuthority.onShortsStateChanged(false);starts.clear();
        CaptionPlayerAuthority.onShortsStateChanged(true);DeepSeekCaptionHook.onVideoId(A);
        CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertTrue(starts.isEmpty());assertFalse(active);assertNull(CaptionSessionReconciler.currentSelection());
    }
    @Test public void repeatedReadySignalsApplyTheCurrentTrackOnlyOnceN75(){
        historyReentryWithEarlyTrackN75("fr",true);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        for(int i=0;i<20;i++)CaptionSessionReconciler.onPlayerReady(h.a,"geometry_ready");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertTrue(active);assertEquals(1,starts.size());
    }
    @Test public void aReadyShortWithAiOffKeepsNativeModeUntilTheUserEnablesAiN75(){
        historyReentryWithEarlyTrackN75("fr",true);CaptionSessionReconciler.onUserSwitched(h.a,false);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertFalse(active);assertTrue(starts.isEmpty());assertFalse(DeepSeekConfig.enabled(h.a));
        CaptionSessionReconciler.onUserSwitched(h.a,true);assertTrue(active);assertEquals(1,starts.size());
    }
    @Test public void anOldShortsOpenFlagCannotGrantCcToAnOrdinaryVideoN75(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");starts.clear();
        N39UiGeometryFixture.shorts=false;DeepSeekCaptionHook.onVideoId(B);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");applied(B,"fr");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(100));
        assertTrue(starts.isEmpty());assertFalse(active);assertNotEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
    }

    // Retain the actual queued callback so removal from Handler cannot hide a missing run guard.
    Runnable heldReadyM3a() throws Exception {
        java.lang.reflect.Field field=CaptionSessionReconciler.class.getDeclaredField("playerReadyTask");
        field.setAccessible(true);
        Runnable task=(Runnable)field.get(null);
        assertNotNull("the readiness callback must be pending before the intervening event",task);
        return task;
    }
    @Test public void aHeldReadyCallbackCannotApplyAfterTeardownM3a() throws Exception {
        historyReentryWithEarlyTrackN75("fr",true);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        Runnable held=heldReadyM3a();
        CaptionSessionReconciler.onTeardown(h.a);
        held.run();Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertFalse(active);assertTrue(starts.isEmpty());assertEquals("",CaptionSessionReconciler.sessionVideo());
        assertTrue("teardown preserves the AI choice",CaptionSessionIntent.load(h.a).aiEnabled);
    }
    @Test public void aHeldOldOwnerReadyCallbackCannotTakeOverTheNewOwnerM3a() throws Exception {
        // Activity setup drains framework work; create it before holding the readiness queue.
        android.app.Activity replacement=Robolectric.buildActivity(android.app.Activity.class).setup().get();
        try {
            historyReentryWithEarlyTrackN75("fr",true);
            N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
            Runnable held=heldReadyM3a();long oldEpoch=CaptionPlayerAuthority.ownerEpoch();
            assertFalse(active);assertTrue(starts.isEmpty());
            CaptionPlayerAuthority.setOwner(replacement);
            assertNotEquals(oldEpoch,CaptionPlayerAuthority.ownerEpoch());
            // Make every non-identity condition permissive: the stale callback must still fail.
            CaptionPlayerAuthority.noteShortsSurface();
            held.run();
            assertFalse(active);assertTrue(starts.isEmpty());
            assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());
            CaptionSessionReconciler.onPlayerReady(h.a,"geometry_ready");
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue("the new owner's valid ready callback is the positive control",active);
            assertEquals(1,starts.size());assertTrue(starts.get(0).contains("tlang=fr"));
        } finally { replacement.finish(); }
    }
    @Test public void coalescedReadyReadsTheLatestSelectionInsteadOfTheQueuedLanguageM3a() throws Exception {
        historyReentryWithEarlyTrackN75("fr",true);
        Runnable held=heldReadyM3a();
        for(int i=0;i<10;i++)CaptionSessionReconciler.onPlayerReady(h.a,"observation_request");
        applied(A,"ja");
        assertFalse(active);assertTrue(starts.isEmpty());assertSame(held,heldReadyM3a());
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        assertSame("strong geometry signal upgrades the same pending task",held,heldReadyM3a());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertTrue(active);assertEquals(1,starts.size());assertTrue(starts.get(0).contains("tlang=ja"));
        assertEquals("ja",CaptionSessionReconciler.currentSelection().target());
    }

    @Before public void before(){
        CaptionButtonController.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
        CaptionPlayerAuthority.resetForTests();CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();NativeCaptionBridge.resetForTests();SourceCatalog.clear();
        h=new N39UiGeometryFixture();h.setup();CaptionAddonSupport.initialize(h.a);
        CaptionSessionIntent.resetForTests(h.a);DeepSeekConfig.saveEnabled(h.a,true);CaptionSessionIntent.userToggled(h.a,true);
        NativeCaptionBridge.initialize(h.a);
        CaptionActions.install(new CaptionPort(){
            public void command(Action action,String value){
                if(action==Action.VIDEO){video=value;active=false;CaptionSessionReconciler.onVideo(h.a,value);}
                if(action==Action.ACTIVATE||action==Action.SOURCE){active=true;starts.add(value);}
                if(action==Action.DEACTIVATE){active=false;if("user_off".equals(value))CaptionSessionReconciler.onUserOff(h.a,value);else CaptionSessionReconciler.retireApplication();}
            }
            public boolean active(){return active;}public boolean ownsNativeTrack(){return active;}
            public String restoreTarget(String u){return u;}public String videoId(){return video;}
            public void playback(long at){CaptionSessionReconciler.onPlayerRegular(h.a);}
        },new CaptionActions.SettingsServices(){
            public String testApi(){return "fixture";}public List<String> models(String u){return Collections.emptyList();}
            public List<CaptionDisplayPage> displayPages(String body,long start,long end,CaptionPresentationBudget budget,CaptionRenderSpec spec){return TranslationPresentation.pages(body,start,end,budget,spec);}
        });
        CaptionPlayerTransitionGuard.installAuthorityListener();CaptionPlayerTransitionGuard.setActivity(h.a);
        CaptionPlayerAuthority.setOwner(h.a);N39UiGeometryFixture.shorts=true;
        enter(A);
    }
    @After public void after(){
        h.done();CaptionButtonController.resetForTests();CaptionPlayerTransitionGuard.resetForTests();
        CaptionPlayerAuthority.resetForTests();CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();NativeCaptionBridge.resetForTests();CaptionSessionIntent.resetForTests(h.a);
    }
    void enter(String id){DeepSeekCaptionHook.onVideoId(id);CaptionPlayerAuthority.onNotification("NONE");}
    void applied(String id,String language){
        NativeCaptionBridge.onNativeSelectionApplied(new NativeLanguageAuthorityTest.Manager(id),
            language==null?null:new NativeLanguageAuthorityTest.Track(id,language,true),
            NativeLanguageAuthorityTest.Origin.DEFAULT,0,id);
    }
    @Test public void committedDefaultStartsShortsWithoutOpeningTheLanguageMenu(){
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());
        applied(A,"zh-Hans");CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertTrue(active);assertEquals(1,starts.size());assertTrue(starts.get(0).contains("tlang=zh-Hans"));
    }
    @Test public void aDepartedShortsSurfaceCannotRetainDisplayPermissionWithoutAnotherTypeCallback(){
        CaptionPlayerAuthority.noteShortsSurface();assertTrue(CaptionPlayerAuthority.displayPermitted());
        N39UiGeometryFixture.shorts=false;
        assertFalse("an absent Shorts player cannot own a caption on the account page",CaptionPlayerAuthority.displayPermitted());
    }
    @Test public void aKnownCcOffCannotBeOverriddenByDefaultOrByEnablingAi(){
        CaptionSessionReconciler.onCcState(h.a,CaptionIntentPolicy.OFF,"controller");
        applied(A,"zh-Hans");CaptionSessionReconciler.onUserSwitched(h.a,true);
        CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertFalse(active);assertTrue(starts.isEmpty());
    }
    @Test public void aRegularPlayersHiddenCcButtonCannotOverrideShortsCcOff(){
        CaptionButtonController.install(h.a);
        android.widget.ImageView old=new android.widget.ImageView(h.a);
        ((android.view.ViewGroup)h.a.findViewById(android.R.id.content)).addView(old,new android.view.ViewGroup.LayoutParams(100,100));
        old.layout(0,0,100,100);old.setContentDescription("Turn off captions");
        CaptionSessionReconciler.onCcState(h.a,CaptionIntentPolicy.OFF,"shorts_off");applied(A,"zh-Hans");
        CaptionButtonController.onNativeCaptionButtonController(old);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(1500));
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void aRawRequestedTrackCannotInitializeCc(){
        NativeCaptionBridge.onNativeSelection(new NativeLanguageAuthorityTest.Manager(A),
                new NativeLanguageAuthorityTest.Track(A,"fr",true),NativeLanguageAuthorityTest.Origin.DEFAULT);
        CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void anOffDefaultCannotStartShorts(){
        applied(A,null);CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void anAutomaticOffWithAForcedTrackStillCannotGrantCcOn(){
        NativeCaptionBridge.onNativeAppliedEvent(new NativeLanguageAuthorityTest.Manager(A),
                new NativeLanguageAuthorityTest.Track(A,"en",false),null,
                NativeLanguageAuthorityTest.Origin.DEFAULT,2,A);
        CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void anAutomaticResetCannotLatchUserOffBeforeTheActualDefaultArrives(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,null);
        CaptionPlayerAuthority.close(); // the real runtime closes after a native reset
        applied(A,"fr");assertTrue(active);assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void anExplicitShortsOffStaysOffWhenAnotherDefaultArrives(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");
        NativeCaptionBridge.onNativeSelectionApplied(new NativeLanguageAuthorityTest.Manager(A),null,
                NativeLanguageAuthorityTest.Origin.PREFERRED_TRACK,1,A);
        starts.clear();applied(A,"fr");CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void backgroundPrefetchCannotInitializeTheVisibleShort(){
        applied(B,"fr");CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());assertTrue(starts.isEmpty());
    }
    @Test public void aCommittedSelectionCanArriveBeforeTheSurface(){
        N39UiGeometryFixture.shorts=false;CaptionPlayerAuthority.onNotification("NONE");
        applied(A,"fr");assertTrue(starts.isEmpty());
        N39UiGeometryFixture.shorts=true;CaptionSessionReconciler.onPlayerRegular(h.a);
        assertTrue(active);assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void theNextShortUsesItsNewDefaultInsteadOfThePreviousManualLanguage(){
        NativeCaptionBridge.onNativeSelectionApplied(new NativeLanguageAuthorityTest.Manager(A),
                new NativeLanguageAuthorityTest.Track(A,"de",true),NativeLanguageAuthorityTest.Origin.PREFERRED_TRACK,1,A);
        applied(B,"fr");enter(B);CaptionSessionReconciler.onPlayerRegular(h.a);
        assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
        assertTrue(starts.get(starts.size()-1).contains("tlang=fr"));
    }
    @Test public void aiOffStaysOffWhenShortsCcIsInitialized(){
        CaptionSessionReconciler.onUserSwitched(h.a,false);applied(A,"zh-Hans");
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());assertFalse(active);assertTrue(starts.isEmpty());
    }
    @Test public void anExitRevokesDisplayEvenWhenTheOldReelViewIsStillVisible(){
        CaptionPlayerAuthority.onShortsStateChanged(true);CaptionPlayerAuthority.noteShortsSurface();
        CaptionPlayerAuthority.onShortsStateChanged(false);
        assertFalse(CaptionPlayerAuthority.displayPermitted());assertFalse(CaptionPlayerAuthority.recoverShorts());
        CaptionPlayerAuthority.onNotification("NONE");assertFalse(CaptionPlayerAuthority.displayPermitted());
    }
    @Test public void aRealRegularPlayerAfterShortsExitCanStillDisplay(){
        CaptionPlayerAuthority.onShortsStateChanged(true);CaptionPlayerAuthority.noteShortsSurface();
        CaptionPlayerAuthority.onShortsStateChanged(false);N39UiGeometryFixture.shorts=false;
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        assertTrue(CaptionPlayerAuthority.displayPermitted());
    }
    @Test public void reenteringTheSameShortInitializesTheNewDefaultWithoutAnOldCcOffLatch(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");
        CaptionSessionReconciler.onCcState(h.a,CaptionIntentPolicy.OFF,"shorts_off");
        CaptionPlayerAuthority.onShortsStateChanged(false);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());
        assertNull(CaptionSessionReconciler.currentSelection());assertFalse(active);
        CaptionPlayerAuthority.onShortsStateChanged(true);enter(A);applied(A,"fr");
        assertTrue(active);assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aLateShortsCloseCannotClearTheRegularVideoThatAlreadyTookOver(){
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"de");
        N39UiGeometryFixture.shorts=false;enter(B);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");
        applied(B,"fr");CaptionSessionReconciler.onCcState(h.a,CaptionIntentPolicy.ON,"controller");
        CaptionPlayerAuthority.onShortsStateChanged(false);
        assertTrue(active);assertTrue(CaptionPlayerAuthority.displayPermitted());
        assertEquals("fr",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void anExitImmediatelyRetractsTheActualTextViewAndRejectsLateRenders() throws Exception {
        applied(A,"zh-Hans");CaptionPlayerAuthority.onShortsStateChanged(true);CaptionPlayerAuthority.noteShortsSurface();
        CaptionOverlay.showEvent("让它弹起来。",()->true,"short-test",1000,61000,2000,
                CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        h.awaitPreparedCaption();assertTrue(CaptionOverlay.anchorVisible());
        CaptionPlayerAuthority.onShortsStateChanged(false);
        assertFalse("retraction happens in the close callback",CaptionOverlay.anchorVisible());
        CaptionOverlay.showEvent("离开后晚到的译文",()->true,"late",1000,61000,2000,
                CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(400));
        assertFalse(CaptionOverlay.anchorVisible());
    }
    @Test public void anUnknownOwnerRebindAfterExitCannotRestoreTheOldSessionOrPaint() throws Exception {
        CaptionPlayerAuthority.onShortsStateChanged(true);applied(A,"fr");
        CaptionPlayerAuthority.onShortsStateChanged(false);
        CaptionPlayerAuthority.close();CaptionPlayerAuthority.setOwner(h.a);
        assertEquals(CaptionPlayerAuthority.UNKNOWN,CaptionPlayerAuthority.state());
        // Simulate late old controller/model feedback after the engine owner was rebound.
        CaptionNativeProjection.selection(A,"fr","https://www.youtube.com/api/timedtext?v="+A+"&lang=en&tlang=fr",
                false,true,false,CaptionPlayerAuthority.ownerEpoch(),true);
        starts.clear();CaptionSessionReconciler.onUserActivated(h.a);
        assertTrue(starts.isEmpty());assertFalse(active);
        CaptionOverlay.showEvent("离开后晚到的译文",()->true,"late-rebind",1000,61000,2000,
                CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(400));
        assertFalse(CaptionOverlay.anchorVisible());
    }
    @Test public void aMissingExitCallbackStillRetractsOnTheNextDraw() throws Exception {
        applied(A,"zh-Hans");CaptionPlayerAuthority.noteShortsSurface();
        CaptionOverlay.showEvent("让它弹起来。",()->true,"short-test",1000,61000,2000,
                CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        h.awaitPreparedCaption();N39UiGeometryFixture.shorts=false;
        h.a.getWindow().getDecorView().getViewTreeObserver().dispatchOnPreDraw();
        assertFalse("no playback tick is needed to remove the old paint",CaptionOverlay.anchorVisible());
    }
    void ccControlN73(String language){
        NativeCaptionBridge.onNativeSelectionApplied(new NativeLanguageAuthorityTest.Manager(A),
                language==null?null:new NativeLanguageAuthorityTest.Track(A,language,true),
                NativeLanguageAuthorityTest.Origin.DEFAULT,1,A);
    }
    @Test public void defaultOriginCcOffIsAUserCommandNativeCcReasonN73(){
        applied(A,"fr");ccControlN73(null);
        assertEquals("native CC click reports DEFAULT / reason 1",CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        assertFalse(active);assertTrue(CaptionSessionIntent.load(h.a).aiEnabled);
    }
    @Test public void aDefaultCannotUndoCcOffWithDefaultOriginNativeCcReasonN73(){
        applied(A,"fr");ccControlN73(null);starts.clear();applied(A,"zh-Hans");
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertFalse(active);assertTrue(starts.isEmpty());
    }
    @Test public void defaultOriginCcOnRestoresAiNativeCcReasonN73(){
        applied(A,"fr");CaptionSessionReconciler.onCcState(h.a,CaptionIntentPolicy.OFF,"controller");
        ccControlN73("fr");assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());assertTrue(active);
    }
}
