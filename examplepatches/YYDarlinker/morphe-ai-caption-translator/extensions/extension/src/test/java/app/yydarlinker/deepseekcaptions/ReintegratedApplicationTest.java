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
@Config(sdk=35,shadows={N39UiGeometryFixture.Geometry.class,ReintegratedApplicationTest.Keys.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE) @LooperMode(LooperMode.Mode.PAUSED)
public class ReintegratedApplicationTest extends N39UiGeometryFixture {
    @Implements(SecureApiKey.class) public static class Keys {@Implementation public static String load(Context c){return "fixture-key";}}
    static final String VIDEO="abcdefghijk";
    static final String SOURCE="https://www.youtube.com/api/timedtext?v="+VIDEO+"&lang=en";
    enum Origin { PREFERRED_TRACK }
    MockWebServer server;Object previousCronet;AtomicInteger posts=new AtomicInteger(),sourceGets=new AtomicInteger();
    CountDownLatch received=new CountDownLatch(1),release=new CountDownLatch(1);
    volatile boolean delayFirst;volatile String lastModel="";
    final String url="https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans";
    public static final class Cronet {
        private final MockWebServer server;Cronet(MockWebServer server){this.server=server;}
        public HttpURLConnection openConnection(URL ignored) throws Exception{return (HttpURLConnection)server.url("/source").url().openConnection();}
    }
    @Before public void start() throws Exception {
        CaptionPlayerTransitionGuard.resetForTests();CaptionPlayerAuthority.resetForTests();super.setup();
        server=new MockWebServer();server.setDispatcher(new Dispatcher(){public MockResponse dispatch(RecordedRequest request){
            try {
                if(request.getPath().startsWith("/source")){sourceGets.incrementAndGet();return new MockResponse().setHeader("Content-Type","application/json").setBody("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":30000,\"segs\":[{\"utf8\":\"Hello \",\"tOffsetMs\":0},{\"utf8\":\"world.\",\"tOffsetMs\":1000}]}]}");}
                if(request.getPath().endsWith("/models"))return new MockResponse().setBody("{\"data\":[{\"id\":\"fixture-model\"}]}");
                JSONObject root=new JSONObject(request.getBody().readUtf8());lastModel=root.getString("model");
                int ordinal=posts.incrementAndGet();received.countDown();if(delayFirst&&ordinal==1)release.await(4,TimeUnit.SECONDS);
                JSONObject p=new JSONObject(root.getJSONArray("messages").getJSONObject(1).getString("content"));JSONArray tokens=p.getJSONArray("owned_tokens");
                JSONObject event=new JSONObject().put("from",tokens.getJSONArray(0).getInt(0)).put("to",tokens.getJSONArray(tokens.length()-1).getInt(0)).put("source",p.getString("source_text")).put("text","你好，世界。");
                String body=new JSONObject().put("block",p.getString("block")).put("events",new JSONArray().put(event)).toString();
                return new MockResponse().setBody(new JSONObject().put("choices",new JSONArray().put(new JSONObject().put("message",new JSONObject().put("content",body)))).toString());
            }catch(Exception e){return new MockResponse().setResponseCode(500);}
        }});server.start();
        Field engine=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");engine.setAccessible(true);previousCronet=engine.get(null);engine.set(null,new Cronet(server));
        DeepSeekConfig.saveEnabled(a,true);DeepSeekConfig.saveBaseUrl(a,server.url("/v1").toString());DeepSeekConfig.saveModel(a,"fixture-model");
        SourceCaptionCache.clear(a);RebuildCache.clear(a);RebuildApi.reset();TokenCostAudit.clear(a);
        SourceCatalog.clear();SourceTrackPolicy.reset();
        CaptionNativeProjection.resetForTests();CaptionSessionIntent.resetForTests(a);CaptionSessionReconciler.resetForTests();
        DeepSeekCaptionHookV2.setMainActivity(a);DeepSeekCaptionHookV2.onVideoId(VIDEO);CaptionActions.onVideoTime(0);
    }
    @After public void finish() throws Exception {
        release.countDown();CaptionActions.command(Action.DEACTIVATE,"teardown");
        Field engine=DeepSeekCaptionHook.class.getDeclaredField("youtubeCronetEngine");engine.setAccessible(true);engine.set(null,previousCronet);
        server.shutdown();super.done();
        CaptionSessionReconciler.resetForTests();CaptionNativeProjection.resetForTests();CaptionSessionIntent.resetForTests(a);SourceCatalog.clear();
    }
    void await(BooleanSupplier condition) throws Exception {
        long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(8);
        while(!condition.getAsBoolean()&&System.nanoTime()<deadline){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(80));Thread.sleep(15);}
        assertTrue("application/display did not reach expected state",condition.getAsBoolean());
    }
    void idle(long ms){Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));}
    boolean showsOriginal(){try{TextView view=text();return CaptionOverlay.anchorVisible()&&view!=null&&view.getText().toString().contains("Hello world.");}catch(Exception e){return false;}}
    boolean translated(){try{TextView view=text();return CaptionOverlay.anchorVisible()&&view!=null&&view.getText().toString().contains("你好，世界。");}catch(Exception e){return false;}}
    /**
     * The user's own session: AI captions on, target zh-Hans, and the video's signed source track.
     * The reconciler - not the test - starts the engine from that intent.
     */
    void ownSession(){
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        CaptionSessionIntent.userSelected(a,"zh-Hans",true);
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
        CaptionSessionIntent.userSelected(a,"en",false);
        // YouTube received an empty track for this selection, so the overlay shows the original text.
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
        assertEquals("the intent still owns the target",before.targetLanguage,CaptionSessionIntent.load(a).targetLanguage);
        CaptionActions.onVideoTime(100);
        await(this::translated);
        assertTrue(CaptionActions.isVisibleActive());
    }
    @Test public void captionsTheUserTurnedOffStayOffWhenTheVideoIsShownAgain() throws Exception {
        ownSession();await(this::translated);
        CaptionActions.deactivateByUser();
        assertFalse("a user off is written to the intent",CaptionSessionIntent.load(a).aiEnabled);
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
        assertFalse("the explicit caption-menu Off is a user act",CaptionSessionIntent.load(a).aiEnabled);
        CaptionActions.onVideoId("");CaptionActions.onVideoId(VIDEO);
        CaptionActions.onVideoTime(2000);idle(3000);CaptionActions.onVideoTime(100);
        idle(1000);Thread.sleep(200);
        assertFalse(CaptionActions.isVisibleActive());
    }

    /**
     * The video id alone is enough: the signed url is already in the catalogue, so onVideo starts
     * the source request before any native track list or CC observation exists.
     */
    @Test public void videoEntryStartsTheSourceRequestBeforeAnyNativeObservation() throws Exception {
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        CaptionSessionIntent.userSelected(a,"zh-Hans",true);
        CaptionSessionReconciler.onVideo(a,VIDEO);
        await(()->sourceGets.get()>0);
        assertTrue("the source request is already in flight",sourceGets.get()>=1);
        assertTrue("the first block request follows without any native observation",received.await(5,TimeUnit.SECONDS));
        assertFalse("no native selection was observed",CaptionNativeProjection.snapshot().observed);
    }
    /** Prewarm is a fetch, not a display grant: it must not wait for a known CC state. */
    @Test public void prewarmStartsTheSourceRequestWhileTheCcStateIsUnknown() throws Exception {
        SourceCatalog.register(VIDEO,Collections.singletonList(new SourceSelection(VIDEO,"en","en",SOURCE,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionIntent.userToggled(a,true);
        CaptionSessionIntent.userSelected(a,"zh-Hans",true);
        assertEquals(CaptionNativeProjection.UNKNOWN,CaptionNativeProjection.ccState());
        RebuildController.prewarm(a,SOURCE);
        await(()->sourceGets.get()>0);
        assertEquals("no CC observation was consulted",CaptionNativeProjection.UNKNOWN,CaptionNativeProjection.ccState());
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
        assertFalse("the caption-menu Off is a USER_OFF",CaptionSessionIntent.load(a).aiEnabled);
        assertFalse("the visible session is stopped",CaptionActions.isVisibleActive());
    }
    @Test public void configurationChangeUsesTheNewModelAndRetiresTheOutstandingRequest() throws Exception {
        delayFirst=true;CaptionActions.activate(a,url);assertTrue(received.await(3,TimeUnit.SECONDS));
        DeepSeekConfig.saveModel(a,"fixture-model-new");CaptionActions.refreshConfiguration(a);release.countDown();
        await(()->posts.get()==2&&translated());assertEquals("fixture-model-new",lastModel);
    }
}
