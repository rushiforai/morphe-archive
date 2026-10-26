package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import app.yydarlinker.caption.contracts.CaptionContracts.*;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

/** Native committed selection -> video handoff -> real reconciler -> application command port. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,manifest=Config.NONE,shadows={NativeLanguageAuthorityTest.Tracks.class,NativeLanguageAuthorityTest.Flags.class})
public class NativeLanguageAuthorityTest {
    static final String A="abcdefghijk", B="lmnopqrstuv";
    enum Origin { DEFAULT, PREFERRED_TRACK }
    static class Manager { String video; Manager(String video){this.video=video;} }
    static class Track {
        String language,url;
        Track(String video,String language,boolean translated){
            this.language=language;
            url="https://www.youtube.com/api/timedtext?v="+video+"&lang="+(translated?"en":language)+(translated?"&tlang="+language:"");
        }
    }
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return true;}
    }
    @Implements(NativeCaptionBridge.class) public static class Tracks {
        @Implementation public static String nativeModelVideo(Object m){return ((Manager)m).video;}
        @Implementation public static String language(Object t){return ((Track)t).language;}
        @Implementation public static String url(Object t){return ((Track)t).url;}
        @Implementation public static String vss(Object t){return "."+((Track)t).language;}
        @Implementation public static List<?> nativeTracks(Object m){return Collections.singletonList(new Track(((Manager)m).video,"en",false));}
        @Implementation public static List<?> translatedTracks(Object m){return Collections.emptyList();}
    }
    Activity a;
    String video="";
    boolean active;
    List<String> starts=new ArrayList<>();
    int stops;

    @Before public void before(){
        a=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(a);
        NativeCaptionBridge.resetForTests();CaptionNativeProjection.resetForTests();CaptionSessionReconciler.resetForTests();
        CaptionSessionIntent.resetForTests(a);CaptionPlayerAuthority.resetForTests();SourceCatalog.clear();SourceTrackPolicy.reset();
        CaptionActions.install(new CaptionPort(){
            public void command(Action action,String value){
                if(action==Action.VIDEO){video=value;active=false;CaptionSessionReconciler.onVideo(a,value);}
                if(action==Action.ACTIVATE||action==Action.SOURCE){starts.add((action==Action.SOURCE?"source:":"translate:")+value);active=true;}
                if(action==Action.DEACTIVATE){active=false;stops++;if("user_off".equals(value))CaptionSessionReconciler.onUserOff(a,value);else CaptionSessionReconciler.retireApplication();}
            }
            public boolean active(){return active;}
            public boolean ownsNativeTrack(){return active;}
            public String restoreTarget(String u){return u;}
            public String videoId(){return video;}
            public void playback(long at){CaptionSessionReconciler.onPlayerRegular(a);}
        },new CaptionActions.SettingsServices(){
            public String testApi(){return "fixture";}
            public List<String> models(String endpoint){return Collections.emptyList();}
        });
        DeepSeekConfig.saveEnabled(a,true);CaptionSessionIntent.userToggled(a,true);
        enter(A);ccOn();
    }
    @After public void after(){NativeCaptionBridge.resetForTests();CaptionNativeProjection.resetForTests();CaptionSessionReconciler.resetForTests();CaptionSessionIntent.resetForTests(a);SourceCatalog.clear();a.finish();}
    void enter(String next){DeepSeekCaptionHook.onVideoId(next);}
    void ccOn(){CaptionSessionReconciler.onCcState(a,CaptionIntentPolicy.ON,"test_controller");}
    void select(Manager manager,Track track,Origin origin){NativeCaptionBridge.onNativeAppliedEvent(manager,track,track,origin,2,manager.video);}
    void select(String owner,String language,boolean translated,Origin origin){select(new Manager(owner),new Track(owner,language,translated),origin);}
    String last(){return starts.get(starts.size()-1);}

    @Test public void nextVideoAutomaticallyUsesItsPreferredTargetAfterAManualSourceChoice(){
        select(A,"en",false,Origin.PREFERRED_TRACK);assertTrue(last().startsWith("source:"));
        long revision=CaptionSessionIntent.load(a).revision;
        enter(B);ccOn();assertFalse(active);
        select(B,"zh-Hans",true,Origin.DEFAULT);
        assertTrue(last(),last().contains("v="+B));assertTrue(last(),last().contains("tlang=zh-Hans"));
        assertEquals(revision,CaptionSessionIntent.load(a).revision);
    }
    @Test public void aDefaultSelectionCommittedBeforeTheVideoIdIsHandedOff(){
        select(A,"en",false,Origin.PREFERRED_TRACK);
        Manager incoming=new Manager(B);Track preferred=new Track(B,"zh-Hans",true);
        select(incoming,preferred,Origin.DEFAULT);
        assertEquals("en",CaptionSessionReconciler.currentSelection().target());
        enter(B);ccOn();
        assertTrue(last(),last().contains("tlang=zh-Hans"));
        assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void anIncomingSelectionSurvivesAnIntermediateEmptyVideoNotification(){
        Manager incoming=new Manager(B);Track preferred=new Track(B,"fr",true);
        select(incoming,preferred,Origin.DEFAULT);enter("");enter(B);ccOn();
        assertTrue(last(),last().contains("tlang=fr"));
    }
    @Test public void returningToAVideoCannotReplayItsConsumedManualLanguage(){
        select(A,"en",false,Origin.PREFERRED_TRACK);enter(B);ccOn();select(B,"zh-Hans",true,Origin.DEFAULT);
        int count=starts.size();enter(A);ccOn();CaptionActions.onVideoTime(100);
        assertEquals(count,starts.size());assertNull(CaptionSessionReconciler.currentSelection());
        select(A,"zh-Hans",true,Origin.DEFAULT);assertTrue(last().contains("tlang=zh-Hans"));
    }
    @Test public void aLateDepartedVideoSelectionCannotReplaceTheForegroundLanguage(){
        enter(B);ccOn();select(B,"zh-Hans",true,Origin.DEFAULT);int count=starts.size();
        select(A,"fr",true,Origin.PREFERRED_TRACK);
        assertEquals(count,starts.size());assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aDefaultLanguageChangeReplacesAnAlreadyRunningSessionWithoutWritingPreferences(){
        select(A,"zh-Hans",true,Origin.DEFAULT);long revision=CaptionSessionIntent.load(a).revision;int before=stops;
        select(A,"fr",true,Origin.DEFAULT);
        assertTrue(last().contains("tlang=fr"));assertTrue(stops>before);
        assertEquals(revision,CaptionSessionIntent.load(a).revision);
    }
    @Test public void aDefaultSourceSelectionEndsAnEarlierTranslatedSession(){
        select(A,"zh-Hans",true,Origin.PREFERRED_TRACK);select(A,"en",false,Origin.DEFAULT);
        assertTrue(last().startsWith("source:"));assertFalse(last().contains("tlang="));
    }
    @Test public void duplicateDefaultObservationsDoNotRestartTheEngine(){
        Manager manager=new Manager(A);Track track=new Track(A,"fr",true);select(manager,track,Origin.DEFAULT);
        int count=starts.size();for(int i=0;i<5;i++){select(manager,track,Origin.DEFAULT);CaptionActions.onVideoTime(100);}
        assertEquals(count,starts.size());
    }
    @Test public void aLegacySavedTargetAndACatalogueCannotChooseALanguage(){
        a.getSharedPreferences("deepseek_caption_session",Context.MODE_PRIVATE).edit().putString("target_language","en").putBoolean("translate_target",false).apply();
        SourceCatalog.register(A,Collections.singletonList(new SourceSelection(A,"en","en",new Track(A,"en",false).url,SourceSelection.Kind.MANUAL,true,0,"")),true);
        CaptionSessionReconciler.onVideo(a,A);CaptionActions.onVideoTime(100);
        assertTrue(starts.isEmpty());assertFalse(active);
    }
    @Test public void automaticSelectionsWhileCcIsOffWaitForCcThenUseTheLatestTarget(){
        CaptionActions.deactivateByUser();select(A,"fr",true,Origin.DEFAULT);assertFalse(active);
        select(A,"ja",true,Origin.DEFAULT);assertFalse(active);ccOn();
        assertTrue(last().contains("tlang=ja"));
    }
    @Test public void anAutomaticSelectionNeverEnablesAiButEnablingAiUsesThatSelection(){
        CaptionSessionReconciler.onUserSwitched(a,false);select(A,"fr",true,Origin.DEFAULT);
        assertFalse(active);assertFalse(DeepSeekConfig.enabled(a));
        CaptionSessionReconciler.onUserSwitched(a,true);assertTrue(last().contains("tlang=fr"));
    }
    @Test public void anUnselectedPrefetchedTargetCannotStartOrChangeAi(){
        String prefetch=new Track(A,"fr",true).url;
        assertEquals(prefetch,DeepSeekCaptionHook.rewriteUrl(null,prefetch));assertTrue(starts.isEmpty());
        select(A,"zh-Hans",true,Origin.DEFAULT);int count=starts.size();
        assertEquals(prefetch,DeepSeekCaptionHook.rewriteUrl(null,prefetch));
        assertEquals(count,starts.size());assertEquals("zh-Hans",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void theTranslationTargetComesFromTheCommittedUrl(){
        Track track=new Track(A,"ja",true);track.language="en";select(new Manager(A),track,Origin.DEFAULT);
        assertTrue(last().contains("tlang=ja"));assertEquals("ja",CaptionSessionReconciler.currentSelection().target());
    }
    @Test public void aCachedTrackWhoseManagerHasMovedToAnotherVideoCannotBeHandedOff(){
        Manager manager=new Manager(B);Track track=new Track(B,"fr",true);select(manager,track,Origin.DEFAULT);
        manager.video=A;enter(B);ccOn();assertTrue(starts.isEmpty());assertNull(CaptionSessionReconciler.currentSelection());
    }
    @Test public void aFreshSameVideoDefaultBeforeReentryVideoIdIsHandedOffN73(){
        select(A,"en",false,Origin.PREFERRED_TRACK);NativeCaptionBridge.onShortsClosed();
        Manager live=new Manager(A);Track fresh=new Track(A,"fr",true);
        select(live,fresh,Origin.DEFAULT);enter(A);ccOn();
        assertNotNull("the fresh default must survive the same-id VIDEO notification",CaptionSessionReconciler.currentSelection());
        assertEquals("fr",CaptionSessionReconciler.currentSelection().target());assertTrue(last().contains("tlang=fr"));
    }
    @Test public void aPreviousManualSelectionWithoutAFreshCallbackCannotReenterN73(){
        select(A,"en",false,Origin.PREFERRED_TRACK);NativeCaptionBridge.onShortsClosed();
        starts.clear();enter(A);ccOn();
        assertNull(CaptionSessionReconciler.currentSelection());assertTrue(starts.isEmpty());
    }
}
