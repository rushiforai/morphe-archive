package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import android.widget.TextView;
import app.yydarlinker.caption.contracts.CaptionContracts.Action;
import java.lang.reflect.Field;
import java.net.*;
import java.time.Duration;
import java.util.Collections;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.BooleanSupplier;
import okhttp3.mockwebserver.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Actual application port, source transport, provider protocol and retained native TextView. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=35,shadows={N39UiGeometryFixture.Geometry.class,ReintegratedApplicationTest.Keys.class,ReintegratedApplicationTest.Flags.class,NativeLanguageAuthorityTest.Tracks.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class ReintegratedApplicationTest extends N39UiGeometryFixture {
    @Implements(CaptionAddonSupport.class) public static class Flags {@Implementation public static boolean aiInstalled(){return true;}}
    @Implements(SecureApiKey.class) public static class Keys {@Implementation public static String load(Context c){return "fixture-key";}}
    static final String VIDEO="abcdefghijk";
    static final String SOURCE="https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en";
    enum Origin { PREFERRED_TRACK }
    MockWebServer server;Object previousCronet;AtomicInteger posts=new AtomicInteger(),sourceGets=new AtomicInteger();
    CountDownLatch received=new CountDownLatch(1),release=new CountDownLatch(1);
    volatile boolean delayFirst;volatile String lastModel="",lastTarget="";
    volatile boolean holdFirstSourceM3a;
    final CountDownLatch sourceHeldM3a=new CountDownLatch(1),sourceReleaseM3a=new CountDownLatch(1);
    final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
    public static final class Cronet {
        private final MockWebServer server;Cronet(MockWebServer server){this.server=server;}
        public HttpURLConnection openConnection(URL ignored) throws Exception{return (HttpURLConnection)server.url("/source").url().openConnection();}
    }
    @Before public void start() throws Exception {
        CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();super.setup();
        server=new MockWebServer();server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest request){
            try {
                if(request.getPath().startsWith("/source")){
                    int number=sourceGets.incrementAndGet();
                    if(holdFirstSourceM3a&&number==1){
                        sourceHeldM3a.countDown();
                        if(!sourceReleaseM3a.await(5,TimeUnit.SECONDS))return new MockResponse().setResponseCode(504);
                    }
                    return new MockResponse().setHeader("Content-Type","application/json").setBody("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":30000,\"segs\":[{\"utf8\":\"Hello \",\"tOffsetMs\":0},{\"utf8\":\"world.\",\"tOffsetMs\":1000}]}]}");
                }
                if(request.getPath().endsWith("/models"))return new MockResponse().setBody("{\"data\":[{\"id\":\"fixture-model\"}]}");
                JSONObject root=new JSONObject(request.getBody().readUtf8());lastModel=root.getString("model");
                int ordinal=posts.incrementAndGet();received.countDown();if(delayFirst&&ordinal==1)release.await(4,TimeUnit.SECONDS);
                JSONObject p=new JSONObject(root.getJSONArray("messages").getJSONObject(1).getString("content"));JSONArray tokens=p.getJSONArray("owned_tokens");
                String target=p.optString("language","zh-Hans");lastTarget=target;
                String translation=target.equals("fr")?"Bonjour, le monde.":"你好，世界。";
                JSONObject event=new JSONObject().put("from",tokens.getJSONArray(0).getInt(0)).put("to",tokens.getJSONArray(tokens.length()-1).getInt(0)).put("source",p.getString("source_text")).put("text",translation);
                String body=new JSONObject().put("block",p.getString("block")).put("events",new JSONArray().put(event)).toString();
                return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("message",new JSONObject().put("content",body)))).toString());
            }catch(Exception e){return new MockResponse().setResponseCode(500);}
        }});server.start();
        Field engine=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");engine.setAccessible(true);previousCronet=engine.get(null);engine.set(null,new Cronet(server));
        DeepSeekConfig.saveEnabled(a,true);DeepSeekConfig.saveBaseUrl(a,server.url("/v1").toString());DeepSeekConfig.saveModel(a,"fixture-model");
        SourceCaptionCache.clear(a);RebuildCache.clear(a);RebuildApi.reset();TokenCostAudit.clear(a);
        SourceCatalog.clear();SourceTrackPolicy.reset();
        CaptionNativeProjection.resetForTests();NativeCaptionBridge.resetForTests();CaptionSessionIntent.resetForTests(a);CaptionSessionReconciler.resetForTests();
        DeepSeekCaptionHookV2.setMainActivity(a);DeepSeekCaptionHookV2.onVideoId(VIDEO);CaptionActions.onVideoTime(0);
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        selectNative("zh-Hans",true);
    }
    @After public void finish() throws Exception {
        release.countDown();sourceReleaseM3a.countDown();CaptionActions.command(Action.DEACTIVATE,"teardown");
        Field engine=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");engine.setAccessible(true);engine.set(null,previousCronet);
        server.shutdown();super.done();
        CaptionSessionReconciler.resetForTests();CaptionNativeProjection.resetForTests();CaptionSessionIntent.resetForTests(a);SourceCatalog.clear();
    }
    void await(BooleanSupplier condition) throws Exception {
        long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(8);
        while(!condition.getAsBoolean()&&System.nanoTime()<deadline){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(80));Thread.sleep(15);}
        if(!condition.getAsBoolean()) {
            String history=CaptionDiagnostics.history(a);
            fail("application/display did not reach expected state: "+history.substring(Math.max(0,history.length()-12000)));
        }
    }
    void idle(long ms){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));}
    boolean showsOriginal(){try{TextView view=text();return CaptionOverlay.anchorVisible()&&view!=null&&view.getText().toString().contains("Hello world.");}catch(Exception e){return false;}}
    boolean translated(){try{TextView view=text();return CaptionOverlay.anchorVisible()&&view!=null&&view.getText().toString().replace("\n", "").contains("你好，世界。");}catch(Exception e){return false;}}
    /**
     * The user's own session: AI captions on, target zh-Hans, and the video's signed source track.
     * The reconciler - not the test - starts the engine from that intent.
     */
    void selectNative(String language,boolean translate){
        String current=CaptionActions.currentVideoIdSnapshot();
        String selected=SOURCE.replace(VIDEO,current)+(translate?"&tlang="+language:"");
        CaptionNativeProjection.selection(current,language,selected,false,translate,false,CaptionPlayerAuthority.ownerEpoch());
    }
    void ownSession(){
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        selectNative("zh-Hans",true);
        CaptionSessionReconciler.onVideo(a,VIDEO);
    }
    @Test public void localUiCommandUsesPinnedCoreAndDisplaysInTheActualRetainedView() throws Exception {
        CaptionActions.activate(a,url);await(this::translated);assertEquals(1,posts.get());assertTrue(CaptionActions.ownsNativeTrack());
        assertEquals("fixture-model",lastModel);assertEquals(2,text().getMaxLines());
        assertTrue(CaptionDiagnostics.history(a).contains("REBUILD_SOURCE_READY"));
        assertTrue(CaptionDiagnostics.history(a).contains("REBUILD_HTTP_RESPONSE"));
        DeepSeekConfig.saveCaptionSizeTier(a,4);DeepSeekConfig.saveBackgroundOpacity(a,35);CaptionActions.appearanceChanged();
        idle(250);assertEquals(1,posts.get());assertTrue(translated());
    }
    @Test public void stoppingThroughTheUiPortRejectsDelayedProviderOutput() throws Exception {
        delayFirst=true;CaptionActions.activate(a,url);assertTrue(received.await(3,TimeUnit.SECONDS));
        CaptionActions.deactivateByUser();release.countDown();
        idle(2000);Thread.sleep(200);
        assertFalse(CaptionActions.isVisibleActive());assertFalse(translated());assertEquals(1,posts.get());
    }
    void sourceLaneBarrierM3a() throws Exception {
        Field field=RebuildController.class.getDeclaredField("SOURCE_IO");field.setAccessible(true);
        ((ExecutorService)field.get(null)).submit(()->{}).get(5,TimeUnit.SECONDS);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }
    @Test public void aHeldSourceReplyCannotPublishIntoTheNextVideoM3a() throws Exception {
        holdFirstSourceM3a=true;selectNative("en",false);
        CaptionActions.activateSource(a,SOURCE);
        assertTrue("source response is held before video replacement",sourceHeldM3a.await(3,TimeUnit.SECONDS));
        String next="lmnopqrstuv";DeepSeekCaptionHookV2.onVideoId(next);
        assertFalse(CaptionActions.isVisibleActive());assertNull(CaptionSessionReconciler.currentSelection());
        sourceReleaseM3a.countDown();sourceLaneBarrierM3a();
        assertFalse("completed old source must not restore visible ownership",CaptionActions.isVisibleActive());
        assertFalse(showsOriginal());assertFalse(translated());assertEquals(0,posts.get());
        assertEquals(next,CaptionActions.currentVideoIdSnapshot());
        // Positive control: same real source transport and renderer, now admitted by the new video.
        selectNative("en",false);CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"controller");
        CaptionActions.activateSource(a,SOURCE.replace(VIDEO,next));sourceLaneBarrierM3a();
        assertTrue(showsOriginal());assertTrue(CaptionActions.isVisibleActive());
        assertEquals(2,sourceGets.get());assertEquals("source mode never calls the provider",0,posts.get());
    }
    @Test public void settingsApiTestAndModelCatalogUseTheApplicationServices() throws Exception {
        assertEquals("你好，世界。",CaptionActions.testApi());assertEquals(1,posts.get());
        assertEquals(java.util.Collections.singletonList("fixture-model"),CaptionActions.models(server.url("/v1").toString()));
        Field usage=TokenCostAudit.class.getDeclaredField("memoryState");usage.setAccessible(true);
        JSONObject snapshot=new JSONObject(usage.get(null).toString());
        assertEquals(1,snapshot.getJSONObject("session").getJSONObject("buckets").getJSONObject("core_event_rebuild_r2").getInt("logical_requests"));
    }
    @Test public void nativeSourceSelectionShowsTheOriginalCaptionInTheOverlayWithoutTranslating() throws Exception {
        CaptionActions.activate(a,url);await(this::translated);
        CaptionSessionIntent.userToggled(a,true);
        selectNative("en",false);
        // Source mode draws the original text while the native renderer is masked.
        CaptionActions.activateSource(a,SOURCE);
        await(this::showsOriginal);
        assertTrue(CaptionActions.isVisibleActive());assertTrue("the native renderer stays masked",CaptionActions.ownsNativeTrack());
        assertFalse(translated());assertEquals("no translation request for source captions",1,posts.get());
    }
    /**
     * The session that stopped with the departure is not remembered as a url: the same persistent
     * intent is applied again by the next session of the same video.
     */
    @Test public void aVideoShownAgainAfterItsDepartureGetsItsCaptionsBack() throws Exception {
        ownSession();await(this::translated);assertTrue(CaptionActions.isVisibleActive());
        CaptionActions.onVideoId("");
        idle(300);
        assertFalse(CaptionActions.isVisibleActive());
        CaptionActions.onVideoId(VIDEO);
        await(this::translated);assertTrue(CaptionActions.isVisibleActive());
        assertEquals("served from the cache",1,posts.get());
        assertTrue(CaptionDiagnostics.history(a).contains("INTENT_APPLY"));
        assertTrue(CaptionDiagnostics.history(a).contains("applied=true"));
    }
    /**
     * Leaving the player reports the compact miniplayer. YouTube may reuse the same player when the
     * video is opened again, so no second type callback is guaranteed. The player tick must ask the
     * official current-player surface and lift the stale COMPACT quarantine.
     */
    @Test public void aCompactStateFromThePreviousVisitRecoversOnAReentryTick() throws Exception {
        ownSession();await(this::translated);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MINIMIZED");
        idle(250);
        assertFalse("the compact state retracts the caption",translated());

        CaptionPlayerAuthority.installCurrentPlayerTypeForTests(()->"WATCH_WHILE_MAXIMIZED");
        CaptionActions.onVideoId(VIDEO);
        CaptionActions.onVideoTime(5000);
        await(this::translated);
        assertTrue(CaptionActions.isVisibleActive());
        assertEquals(CaptionPlayerAuthority.REGULAR,CaptionPlayerAuthority.state());
    }
    /**
     * YouTube resets its own caption model: the display stops, the intent does not. A player tick
     * used to reconcile only after a measured silence (EngineResume's 1200 ms gap); the intent now
     * decides, so the very next tick applies it again.
     */
    @Test public void playerTicksAfterAnAutomaticCaptionResetBringTheSessionBack() throws Exception {
        ownSession();await(this::translated);
        CaptionSessionIntent before=CaptionSessionIntent.load(a);
        CaptionActions.deactivateAfterNativeReset();
        idle(300);
        assertFalse("the reset stops the display",CaptionActions.isVisibleActive());
        assertEquals("an automatic reset never writes the intent",before.revision,CaptionSessionIntent.load(a).revision);
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals("the live player owns the target","zh-Hans",CaptionSessionReconciler.currentSelection().target());
        CaptionActions.onVideoTime(100);
        await(this::translated);
        assertTrue(CaptionActions.isVisibleActive());
    }
    @Test public void captionsTheUserTurnedOffStayOffWhenTheVideoIsShownAgain() throws Exception {
        ownSession();await(this::translated);
        CaptionActions.deactivateByUser();
        assertTrue("CC off preserves the AI choice",CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        CaptionActions.onVideoId("");CaptionActions.onVideoId(VIDEO);
        CaptionActions.onVideoTime(2000);idle(3000);CaptionActions.onVideoTime(100);
        idle(1000);Thread.sleep(200);
        assertFalse(CaptionActions.isVisibleActive());assertFalse(translated());
    }
    @Test public void aNativeMenuOffIsNotUndoneEither() throws Exception {
        ownSession();await(this::translated);
        long epoch=CaptionPlayerAuthority.ownerEpoch();
        CaptionNativeProjection.selection(VIDEO,"","",true,false,true,epoch);
        CaptionSessionReconciler.onNativeSelection(a,epoch,true);
        assertTrue("the caption-menu Off preserves the AI choice",CaptionSessionIntent.load(a).aiEnabled);
        CaptionActions.onVideoId("");CaptionActions.onVideoId(VIDEO);
        CaptionActions.onVideoTime(2000);idle(3000);CaptionActions.onVideoTime(100);
        idle(1000);Thread.sleep(200);
        assertFalse(CaptionActions.isVisibleActive());
    }

    /**
     * The video id alone is enough: the signed url is already in the catalogue, so onVideo starts
     * the source request before any native track list or CC observation exists.
     */
    @Test public void videoEntryWaitsForCcBeforeStartingTheSourceRequest() throws Exception {
        CaptionNativeProjection.ccState(CaptionIntentPolicy.UNKNOWN);
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        selectNative("zh-Hans",true);
        CaptionSessionReconciler.onVideo(a,VIDEO);
        CaptionActions.onVideoTime(100);idle(500);
        assertEquals("a saved AI choice cannot grant CC permission",0,sourceGets.get());
        assertFalse(CaptionActions.isVisibleActive());
        CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"test_controller");
        await(()->sourceGets.get()>0);
        assertTrue("the source request is already in flight",sourceGets.get()>=1);
        assertTrue("the first block request follows without any native observation",received.await(5,TimeUnit.SECONDS));
        assertTrue("the active language comes from the observed native selection",CaptionNativeProjection.snapshot().observed);
    }
    /** No native display permission means the host exposes no translating session to prewarm. */
    @Test public void prewarmWhileTheCcStateIsUnknownDoesNotStartASession() throws Exception {
        CaptionNativeProjection.ccState(CaptionIntentPolicy.UNKNOWN);
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        selectNative("zh-Hans",true);
        assertEquals(CaptionNativeProjection.UNKNOWN,CaptionNativeProjection.ccState());
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);
        assertNull("the scenario begins without an engine session",active.get(null));
        CaptionActions.command(Action.PREWARM,url);
        idle(500);assertEquals(0,sourceGets.get());assertFalse(CaptionActions.isVisibleActive());
        assertNull("the real PREWARM port must not start even an invisible session",active.get(null));
        assertEquals("no CC observation was consulted",CaptionNativeProjection.UNKNOWN,CaptionNativeProjection.ccState());
    }
    @Test public void prewarmWithNativePermissionUsesTheRealPortWithoutShowingTheSession() throws Exception {
        assertEquals(CaptionNativeProjection.ON,CaptionNativeProjection.ccState());
        assertNotNull("native selection must be available",CaptionSessionReconciler.currentSelection());
        Field active=RebuildController.class.getDeclaredField("active");active.setAccessible(true);
        assertNull("the scenario begins without an engine session",active.get(null));
        CaptionActions.command(Action.PREWARM,url);
        assertNotNull("permission allows a real prewarm session",active.get(null));
        assertFalse("prewarm itself does not show the session",CaptionActions.isVisibleActive());
        await(()->sourceGets.get()>0);
    }
    /**
     * The real port, not a test shadow: the caption menu's Off must write the USER_OFF intent and
     * stop the session exactly like a tap on the CC control.
     */
    @Test public void theCaptionMenuOffWritesTheIntentThroughTheRealPort() throws Exception {
        ownSession();await(this::translated);
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        CaptionSessionReconciler.onPlayerRegular(a);
        NativeCaptionBridge.onNativeAppliedEvent(new Object(),null,null,Origin.PREFERRED_TRACK,0,VIDEO);
        assertTrue("the caption-menu Off preserves the AI choice",CaptionSessionIntent.load(a).aiEnabled);
        assertFalse("the visible session is stopped",CaptionActions.isVisibleActive());
    }
    @Test public void configurationChangeUsesTheNewModelAndRetiresTheOutstandingRequest() throws Exception {
        delayFirst=true;CaptionActions.activate(a,url);assertTrue(received.await(3,TimeUnit.SECONDS));
        DeepSeekConfig.saveModel(a,"fixture-model-new");CaptionActions.refreshConfiguration(a);release.countDown();
        await(()->posts.get()==2&&translated());assertEquals("fixture-model-new",lastModel);
    }

    /** The real touch listener and YouTube-like click run in their actual DOWN/UP/click order. */
    android.widget.ImageView ccButton(boolean on) {
        android.widget.ImageView button=new android.widget.ImageView(a);
        ((android.view.ViewGroup)a.findViewById(android.R.id.content)).addView(button,
                new android.view.ViewGroup.LayoutParams(100,100));
        button.setContentDescription(on?"Turn off captions":"Turn on captions");
        button.setOnClickListener(v->{
            boolean wasOn=v.getContentDescription().toString().equals("Turn off captions");
            v.setContentDescription(wasOn?"Turn on captions":"Turn off captions");
            CaptionButtonController.onNativeCaptionButtonController(button);
        });
        button.layout(0,0,100,100);
        CaptionButtonController.onNativeCaptionButtonController(button);
        return button;
    }
    void tap(android.widget.ImageView button) {
        long now=android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent down=android.view.MotionEvent.obtain(now,now,0,50,50,0);
        android.view.MotionEvent up=android.view.MotionEvent.obtain(now,now+40,1,50,50,0);
        button.dispatchTouchEvent(down);button.dispatchTouchEvent(up);down.recycle();up.recycle();
        idle(1200);
    }
    @Test public void repeatedRealCcTapsRestoreAiWithoutTogglingTheAiSwitch() throws Exception {
        ownSession();await(this::translated);
        android.widget.ImageView button=ccButton(true);
        long revision=CaptionSessionIntent.load(a).revision;
        for(int cycle=0;cycle<3;cycle++) {
            tap(button);
            assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
            assertFalse(CaptionActions.isVisibleActive());assertFalse(translated());
            assertTrue(DeepSeekConfig.enabled(a));assertTrue(CaptionSessionIntent.load(a).aiEnabled);
            CaptionActions.onVideoTime(100);idle(300);
            assertFalse("a player tick must respect CC off",CaptionActions.isVisibleActive());
            tap(button);CaptionActions.onVideoTime(100);await(this::translated);
            assertEquals(revision,CaptionSessionIntent.load(a).revision);
        }
    }
    @Test public void enablingAiWhileCcIsOffWaitsForCcAndBlocksEveryActivationEntry() throws Exception {
        ownSession();await(this::translated);
        CaptionActions.deactivateByUser();
        assertTrue(CaptionQuickToggle.setEngine(a,false));
        assertTrue(CaptionQuickToggle.setEngine(a,true));
        CaptionActions.activate(a,url);CaptionActions.activateSource(a,SOURCE);
        CaptionActions.command(Action.PREWARM,url);
        for(int i=0;i<3;i++)CaptionActions.onVideoTime(100);
        idle(1000);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        assertFalse(CaptionActions.isVisibleActive());assertFalse(translated());
        assertEquals("a native request cannot reopen CC",url,DeepSeekCaptionHook.rewriteUrl(null,url));
        CaptionSessionReconciler.onUserActivated(a);CaptionActions.onVideoTime(100);await(this::translated);
    }
    @Test public void ccOnAndNativeLanguageSelectionNeverEnableADisabledAiSwitch() throws Exception {
        ownSession();await(this::translated);
        assertTrue("AI mode masks the native renderer",NativeCaptionBridge.suppressNativeDraw());
        assertEquals("native caption data remains ready for an AI-off switch",url,
                DeepSeekCaptionHook.rewriteUrl(null,url));
        assertTrue(CaptionQuickToggle.setEngine(a,false));
        CaptionActions.deactivateByUser();CaptionSessionReconciler.onUserActivated(a);
        long epoch=CaptionPlayerAuthority.ownerEpoch();
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",url,false,true,true,epoch);
        CaptionSessionReconciler.onNativeSelection(a,epoch,true);
        CaptionActions.onVideoTime(100);idle(500);
        assertFalse(DeepSeekConfig.enabled(a));assertFalse(CaptionSessionIntent.load(a).aiEnabled);
        assertFalse(CaptionActions.isVisibleActive());
        assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertEquals(url,DeepSeekCaptionHook.rewriteUrl(null,url));
    }
    @Test public void v2RequestsPreserveNativeDataAndAiOffReleasesTheDrawMaskM2a() throws Exception {
        ownSession();await(this::translated);
        assertEquals(url,DeepSeekCaptionHookV2.rewriteUrl(null,url));
        assertEquals(SOURCE,DeepSeekCaptionHookV2.rewriteUrl(null,SOURCE));
        assertTrue(NativeCaptionBridge.suppressNativeDraw());
        assertTrue(CaptionQuickToggle.setEngine(a,false));
        int fetched=sourceGets.get(),requests=posts.get();
        assertEquals(url,DeepSeekCaptionHookV2.rewriteUrl(null,url));
        assertEquals(SOURCE,DeepSeekCaptionHookV2.rewriteUrl(null,SOURCE));
        idle(500);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
        assertFalse(CaptionActions.isVisibleActive());
        assertFalse("native draw is available with the unchanged native URL",NativeCaptionBridge.suppressNativeDraw());
        assertEquals(fetched,sourceGets.get());assertEquals(requests,posts.get());
    }
    @Test public void v2PrefetchAndDepartedRequestsCannotRetargetTheRealSessionM2a() throws Exception {
        ownSession();await(this::translated);
        int fetched=sourceGets.get(),requests=posts.get();
        String prefetch=url.replace("zh-Hans","fr"),departed=url.replace(VIDEO,"lmnopqrstuv");
        assertEquals(prefetch,DeepSeekCaptionHookV2.rewriteUrl(null,prefetch));
        assertEquals(departed,DeepSeekCaptionHookV2.rewriteUrl(null,departed));
        idle(500);
        assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
        assertTrue(translated());assertEquals(fetched,sourceGets.get());assertEquals(requests,posts.get());
        CaptionActions.deactivateByUser();
        assertEquals(url,DeepSeekCaptionHookV2.rewriteUrl(null,url));
        assertEquals(prefetch,DeepSeekCaptionHookV2.rewriteUrl(null,prefetch));
        assertEquals(departed,DeepSeekCaptionHookV2.rewriteUrl(null,departed));
        idle(500);
        assertFalse(CaptionActions.isVisibleActive());
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        assertEquals(fetched,sourceGets.get());assertEquals(requests,posts.get());
    }
    @Test public void aDelayedLayoutCannotPaintAfterCcCloses() throws Exception {
        ownSession();await(this::translated);
        CaptionActions.deactivateByUser();
        CaptionOverlay.showEvent("迟到的字幕",()->true,"late",0,30000,100,
                CaptionLanguageContext.explicit("en","zh-Hans").renderSpec);
        idle(1000);
        assertFalse("even a valid async result cannot bypass CC",CaptionOverlay.anchorVisible());
    }
    @Test public void settledCcObservationsStopAndResumeWithoutAnyTouchEvent() throws Exception {
        ownSession();await(this::translated);
        CaptionSessionIntent before=CaptionSessionIntent.load(a);
        CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.OFF,"test_controller");
        CaptionActions.onVideoTime(100);idle(500);
        assertFalse(CaptionActions.isVisibleActive());assertFalse(translated());
        CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"test_controller");
        CaptionActions.onVideoTime(100);await(this::translated);
        assertEquals(before.revision,CaptionSessionIntent.load(a).revision);
    }
    @Test public void ccCyclingAlsoRestoresAiSourceCaptionsWithoutCallingTheProvider() throws Exception {
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);selectNative("en",false);
        CaptionSessionReconciler.onVideo(a,VIDEO);CaptionActions.onVideoTime(100);await(this::showsOriginal);
        android.widget.ImageView button=ccButton(true);
        tap(button);assertFalse(CaptionActions.isVisibleActive());assertFalse(showsOriginal());
        tap(button);CaptionActions.onVideoTime(100);await(this::showsOriginal);
        assertEquals("source mode does not translate",0,posts.get());
    }
    @Test public void aMenuSelectionImmediatelyAfterCcOffUsesTheCurrentEpoch() throws Exception {
        ownSession();await(this::translated);
        CaptionActions.deactivateByUser();
        long current=CaptionPlayerAuthority.ownerEpoch();
        assertTrue("current native callbacks need no intervening player tick",CaptionSessionReconciler.observable(current));
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",url,false,true,true,current);
        CaptionSessionReconciler.onNativeSelection(a,current,true);
        CaptionActions.onVideoTime(100);await(this::translated);
    }
    @Test public void aNewVideoMustAcquireItsOwnCcPermission() throws Exception {
        ownSession();await(this::translated);
        String nextVideo="lmnopqrstuv";
        String nextSource=SOURCE.replace(VIDEO,nextVideo);
        SourceCatalog.register(nextVideo,Collections.singletonList(new SourceSelection(nextVideo,"en","en",nextSource,SourceSelection.Kind.MANUAL,true,0,"")),true);
        DeepSeekCaptionHookV2.onVideoId(nextVideo);CaptionActions.onVideoTime(100);idle(500);
        assertEquals(CaptionIntentPolicy.UNKNOWN,CaptionNativeProjection.ccState());
        assertFalse("a saved AI preference is not CC permission for the next video",CaptionActions.isVisibleActive());
        assertFalse(translated());
        selectNative("zh-Hans",true);
        CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"test_controller");
        CaptionActions.onVideoTime(100);await(this::translated);
    }
    boolean showsFrench(){try{return CaptionOverlay.anchorVisible()&&text()!=null&&text().getText().toString().contains("Bonjour");}catch(Exception e){return false;}}
    @Test public void anAutomaticNativeTargetChangeReplacesTheProviderLanguageAndDisplayedText() throws Exception {
        ownSession();await(this::translated);long revision=CaptionSessionIntent.load(a).revision;
        selectNative("fr",true);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
        CaptionActions.onVideoTime(100);await(this::showsFrench);
        assertEquals("fr",lastTarget);assertFalse(translated());assertEquals(2,posts.get());
        assertEquals(revision,CaptionSessionIntent.load(a).revision);
    }
    @Test public void anOldLanguageResponseCannotPaintAfterTheNativeTargetChanges() throws Exception {
        delayFirst=true;ownSession();assertTrue(received.await(3,TimeUnit.SECONDS));
        selectNative("fr",true);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
        CaptionActions.onVideoTime(100);await(this::showsFrench);release.countDown();idle(1000);
        assertTrue(showsFrench());assertFalse(translated());
    }
    @Test public void aSourceRequestDuringMiniplayerRecoveryNeverRegainsAnOldTarget() throws Exception {
        ownSession();await(this::translated);CaptionActions.onPlayerType("WATCH_WHILE_MINIMIZED");
        assertEquals(SOURCE,CaptionActions.restoreTargetAfterMiniplayer(SOURCE));
    }
    @Test public void aManualSourceChoiceDoesNotOverrideTheNextVideosAutomaticTranslation() throws Exception {
        ownSession();await(this::translated);selectNative("en",false);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),true);
        CaptionActions.onVideoTime(100);await(this::showsOriginal);
        DeepSeekCaptionHookV2.onVideoId("lmnopqrstuv");selectNative("zh-Hans",true);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
        CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"test_controller");
        CaptionActions.onVideoTime(100);await(this::translated);
        assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());assertFalse(showsOriginal());
    }
    @Test public void theNextVideoStartsAfterStableCcConfirmationWithoutTheOldFourSecondWait() throws Exception {
        ownSession();await(this::translated);idle(1000);
        android.widget.ImageView button=ccButton(true);idle(0);
        DeepSeekCaptionHookV2.onVideoId("lmnopqrstuv");selectNative("fr",true);
        CaptionButtonController.onNativeCaptionButtonController(button);idle(32);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");idle(200);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertTrue("the real engine starts within the bounded CC observation pass",CaptionActions.isVisibleActive());
        CaptionActions.onVideoTime(100);await(this::showsFrench);assertEquals("fr",lastTarget);
    }
    @Test public void aFastStartupPassWithCcOffCannotFetchOrTranslateTheNextVideo() throws Exception {
        ownSession();await(this::translated);idle(1000);
        android.widget.ImageView button=ccButton(false);idle(0);
        int fetched=sourceGets.get(),translatedRequests=posts.get();
        DeepSeekCaptionHookV2.onVideoId("lmnopqrstuv");selectNative("fr",true);
        CaptionButtonController.onNativeCaptionButtonController(button);idle(32);
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_MAXIMIZED");idle(300);
        assertNotEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertFalse(CaptionActions.isVisibleActive());assertEquals(fetched,sourceGets.get());assertEquals(translatedRequests,posts.get());
    }
    @Test public void historyShortsReentryWithLateGeometryRestoresFreshTranslationWithoutATimeTickN75() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        long epoch=CaptionPlayerAuthority.ownerEpoch();
        CaptionPlayerAuthority.onShortsStateChanged(false);N39UiGeometryFixture.shorts=false;
        NativeCaptionBridge.onNativeAppliedEvent(new NativeLanguageAuthorityTest.Manager(VIDEO),
                new NativeLanguageAuthorityTest.Track(VIDEO,"fr",true),new NativeLanguageAuthorityTest.Track(VIDEO,"fr",true),
                NativeLanguageAuthorityTest.Origin.DEFAULT,2,VIDEO);
        CaptionPlayerAuthority.onShortsStateChanged(true);DeepSeekCaptionHookV2.onVideoId(VIDEO);idle(50);
        assertFalse(CaptionActions.isVisibleActive());
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        await(this::showsFrench);
        assertEquals("fr",lastTarget);assertEquals(epoch,CaptionPlayerAuthority.ownerEpoch());
    }
    @Test public void historyShortsSourceTrackRestartsAfterGeometryWithoutAnApiRequestN75() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        int requests=posts.get();CaptionPlayerAuthority.onShortsStateChanged(false);N39UiGeometryFixture.shorts=false;
        NativeLanguageAuthorityTest.Track source=new NativeLanguageAuthorityTest.Track(VIDEO,"en",false);
        NativeCaptionBridge.onNativeAppliedEvent(new NativeLanguageAuthorityTest.Manager(VIDEO),source,source,NativeLanguageAuthorityTest.Origin.DEFAULT,2,VIDEO);
        CaptionPlayerAuthority.onShortsStateChanged(true);DeepSeekCaptionHookV2.onVideoId(VIDEO);idle(50);
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.settleRegularFromGeometry();
        await(()->{try{return CaptionOverlay.anchorVisible()&&text()!=null&&text().getText().toString().replace('\n',' ').replaceAll("\\s+"," ").contains("Hello world.");}catch(Exception e){return false;}});
        assertEquals(requests,posts.get());assertEquals("en",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aShortsDefaultStartsTheRealEngineWithoutAManualLanguageChoice() throws Exception {
        CaptionSessionIntent.userToggled(a,true);N39UiGeometryFixture.shorts=true;
        DeepSeekCaptionHookV2.onVideoId("lmnopqrstuv");CaptionPlayerAuthority.onNotification("NONE");
        String selected=SOURCE.replace(VIDEO,"lmnopqrstuv")+"&tlang=fr";
        CaptionNativeProjection.selection("lmnopqrstuv","fr",selected,false,true,false,
                CaptionPlayerAuthority.ownerEpoch(),true);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
        CaptionActions.onVideoTime(100);await(this::showsFrench);
        assertEquals("fr",lastTarget);assertEquals(1,posts.get());
    }
    @Test public void leavingShortsRemovesTheRealTranslationAndCannotBeRepaintedByATick() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        CaptionPlayerAuthority.onShortsStateChanged(false);
        assertFalse("the close notification removes the current real caption immediately",CaptionOverlay.anchorVisible());
        CaptionActions.onVideoTime(200);idle(600);
        assertFalse(CaptionOverlay.anchorVisible());
    }

    void regularPlayerAfterShortsN73() {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();CaptionPlayerAuthority.onShortsStateChanged(false);
        N39UiGeometryFixture.shorts=false;
        CaptionPlayerAuthority.onNotification("WATCH_WHILE_FULLSCREEN");
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);selectNative("zh-Hans",true);
    }
    void nativeAppliedN73(String language,boolean off) {
        CaptionNativeProjection.selection(VIDEO,off?"":language,off?"":SOURCE+"&tlang="+language,
                off,!off,false,CaptionPlayerAuthority.ownerEpoch(),true);
        CaptionSessionReconciler.onNativeSelection(a,CaptionPlayerAuthority.ownerEpoch(),false);
    }
    @Test public void aiOffOnAfterLeavingShortsRetainsTheRealFullscreenPlayerN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        long epoch=CaptionPlayerAuthority.ownerEpoch();
        assertTrue(CaptionQuickToggle.setEngine(a,false));
        assertEquals("stopping AI must not close the actual YouTube player",CaptionPlayerAuthority.REGULAR,CaptionPlayerAuthority.state());
        assertEquals(epoch,CaptionPlayerAuthority.ownerEpoch());assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertTrue(CaptionQuickToggle.setEngine(a,true));await(this::translated);
    }
    @Test public void realCcOffOnAfterLeavingShortsRestartsWithoutATypeOrTimeEventN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        CaptionActions.deactivateByUser();nativeAppliedN73("",true);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertFalse(translated());
        CaptionSessionReconciler.onUserActivated(a);nativeAppliedN73("zh-Hans",false);
        assertTrue("CC on plus the actual restored track starts immediately",CaptionActions.isVisibleActive());
        await(this::translated);
    }
    @Test public void repeatedFlyoutSwitchesAfterShortsRestoreWithoutNavigationN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        for(int i=0;i<3;i++){
            assertTrue(CaptionQuickToggle.setEngine(a,false));assertFalse(CaptionActions.isVisibleActive());
            assertFalse(NativeCaptionBridge.suppressNativeDraw());
            assertTrue(CaptionQuickToggle.setEngine(a,true));
            assertTrue("AI reenable cannot depend on another player notification",CaptionActions.isVisibleActive());
            await(this::translated);
        }
    }
    @Test public void switchingTargetAfterShortsDoesNotCloseThePlayerMidApplyN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        nativeAppliedN73("fr",false);
        assertTrue("replacing an AI language keeps player permission",CaptionActions.isVisibleActive());
        await(this::showsFrench);assertEquals("fr",lastTarget);
    }
    @Test public void aiOffOnInOpenShortsDoesNotChangePlayerOwnerOrCcN73() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        long epoch=CaptionPlayerAuthority.ownerEpoch();CaptionQuickToggle.setEngine(a,false);
        assertEquals(CaptionPlayerAuthority.REGULAR,CaptionPlayerAuthority.state());assertEquals(epoch,CaptionPlayerAuthority.ownerEpoch());
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        CaptionQuickToggle.setEngine(a,true);await(this::translated);
    }
    @Test public void ccOffAndAiOnAfterShortsCannotStartOrFetchN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        CaptionActions.deactivateByUser();nativeAppliedN73("",true);
        int fetched=sourceGets.get(),calls=posts.get();
        CaptionQuickToggle.setEngine(a,false);assertFalse(NativeCaptionBridge.suppressNativeDraw());
        CaptionQuickToggle.setEngine(a,true);idle(400);CaptionActions.onVideoTime(100);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());
        assertFalse(CaptionActions.isVisibleActive());assertEquals(fetched,sourceGets.get());assertEquals(calls,posts.get());
    }
    @Test public void ccOnWhileAiOffAfterShortsKeepsNativeModeN73() throws Exception {
        regularPlayerAfterShortsN73();ownSession();await(this::translated);
        CaptionQuickToggle.setEngine(a,false);CaptionActions.deactivateByUser();nativeAppliedN73("",true);
        CaptionSessionReconciler.onUserActivated(a);nativeAppliedN73("zh-Hans",false);idle(300);
        assertFalse(DeepSeekConfig.enabled(a));assertFalse(CaptionSessionIntent.load(a).aiEnabled);
        assertFalse(CaptionActions.isVisibleActive());assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertEquals(url,DeepSeekCaptionHook.rewriteUrl(null,url));
    }
    @Test public void sameShortReentryWithDefaultBeforeVideoIdShowsTheFreshTargetN73() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        CaptionPlayerAuthority.onShortsStateChanged(false);assertFalse(CaptionOverlay.anchorVisible());
        NativeLanguageAuthorityTest.Manager manager=new NativeLanguageAuthorityTest.Manager(VIDEO);
        NativeLanguageAuthorityTest.Track fresh=new NativeLanguageAuthorityTest.Track(VIDEO,"fr",true);
        NativeCaptionBridge.onNativeAppliedEvent(manager,fresh,fresh,NativeLanguageAuthorityTest.Origin.DEFAULT,2,VIDEO);
        CaptionPlayerAuthority.onShortsStateChanged(true);DeepSeekCaptionHookV2.onVideoId(VIDEO);
        CaptionPlayerAuthority.onNotification("NONE");CaptionActions.onVideoTime(100);await(this::showsFrench);
        assertEquals("fr",CaptionSessionReconciler.currentSelection().target());assertEquals("fr",lastTarget);
    }
    @Test public void shortsNativeCcOffAiOffOnAndNativeCcOnFollowTheTruthTableN73() throws Exception {
        N39UiGeometryFixture.shorts=true;CaptionPlayerAuthority.onShortsStateChanged(true);
        CaptionPlayerAuthority.noteShortsSurface();ownSession();await(this::translated);
        NativeLanguageAuthorityTest.Manager manager=new NativeLanguageAuthorityTest.Manager(VIDEO);
        NativeCaptionBridge.onNativeAppliedEvent(manager,null,null,NativeLanguageAuthorityTest.Origin.DEFAULT,1,VIDEO);
        assertEquals(CaptionIntentPolicy.OFF,CaptionNativeProjection.ccState());assertFalse(CaptionActions.isVisibleActive());
        CaptionQuickToggle.setEngine(a,false);assertFalse(NativeCaptionBridge.suppressNativeDraw());
        CaptionQuickToggle.setEngine(a,true);idle(300);assertFalse(CaptionActions.isVisibleActive());
        NativeLanguageAuthorityTest.Track fresh=new NativeLanguageAuthorityTest.Track(VIDEO,"fr",true);
        NativeCaptionBridge.onNativeAppliedEvent(manager,fresh,fresh,NativeLanguageAuthorityTest.Origin.DEFAULT,1,VIDEO);
        await(this::showsFrench);assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
    }
}
