package app.yydarlinker.deepseekcaptions;
import android.app.Activity;
import android.content.Context;
import java.util.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk=28,shadows={ShortsEngineSwitchTest.Flags.class,ShortsEngineSwitchTest.Keys.class,ShortsEngineSwitchTest.Access.class,ShortsEngineSwitchTest.Core.class})
public class ShortsEngineSwitchTest {
    static final String A="aaaaaaaaaaa",B="bbbbbbbbbbb",C="ccccccccccc";
    enum Origin {PREFERRED_TRACK,DEFAULT}
    static final class Track {
        final String video,language; final boolean translated; String suffix="";
        Track(String video,String language){this(video,language,true);}
        Track(String video,String language,boolean translated){this.video=video;this.language=language;this.translated=translated;}
        String url(){return "https://www.youtube.com/api/timedtext?v="+video+"&lang=en"+(translated?"&tlang="+language:"")+suffix;}
    }
    static final class Manager {List<Track> tracks=new ArrayList<>();boolean fail,failOnTrack;String switchVideo="";Manager(Track track){tracks.add(track);}}
    static final List<Object> calls=new ArrayList<>();
    static final List<Boolean> refreshModes=new ArrayList<>();
    static final List<Integer> reasons=new ArrayList<>();
    static final List<String> activations=new ArrayList<>();
    static final List<String> activationUrls=new ArrayList<>();
    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled(){return true;}
        @Implementation public static boolean memoryInstalled(){return true;}
    }
    @Implements(SecureApiKey.class) public static class Keys {@Implementation public static String load(Context c){return "test-only-key";}}
    @Implements(NativeCaptionBridge.class) public static class Access {
        @Implementation public static String language(Object t){return ((Track)t).language;}
        @Implementation public static String url(Object t){return ((Track)t).url();}
        @Implementation public static String vss(Object t){return ((Track)t).translated?"t"+((Track)t).language+".en":".en";}
        @Implementation public static List<?> nativeTracks(Object m){return ((Manager)m).tracks;}
        @Implementation public static List<?> translatedTracks(Object m){return ((Manager)m).tracks;}
        @Implementation public static void selectNative(Object m,Object t,Object o,int reason){
            calls.add(t);reasons.add(reason);if(t==null&&!((Manager)m).switchVideo.isEmpty())PageCaptionController.onVideoId(((Manager)m).switchVideo);if(((Manager)m).fail||(((Manager)m).failOnTrack&&t!=null))throw new IllegalStateException("test selector failure");
            NativeCaptionBridge.onNativeSelectionWithReason(m,t,o,reason);
        }
    }
    @Implements(DynamicCaptionController.class) public static class Core {
        @Implementation public static void activate(Context c,String url){activations.add(PageCaptionController.videoIdFromUrl(url));activationUrls.add(url);}
        @Implementation public static void refreshConfiguration(Context c){refreshModes.add(DeepSeekConfig.enabled(c));}
    }
    Activity activity;
    @Before public void setup()throws Exception{
        activity=Robolectric.buildActivity(Activity.class).setup().get();CaptionAddonSupport.initialize(activity);
        PageCaptionController.onVideoId("");java.lang.reflect.Field entries=NativeCaptionBridge.class.getDeclaredField("selections");entries.setAccessible(true);((Map<?,?>)entries.get(null)).clear();CaptionChoice.reset();RememberedCaptionSelection.reset();calls.clear();reasons.clear();refreshModes.clear();activations.clear();activationUrls.clear();DeepSeekConfig.saveEnabled(activity,false);
    }
    @After public void finish(){activity.finish();}
    void select(Manager m,Track t,Origin origin){NativeCaptionBridge.onNativeSelectionWithReason(m,t,origin,17);}
    @Test public void preloadedShortMustNotOverwriteVisibleSelection(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);select(mb,b,Origin.DEFAULT);
        assertEquals("Visible video's language must survive prefetch", "fr",CaptionChoice.language());
        assertEquals("fr",RememberedCaptionSelection.language());
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,a),calls);
    }
    @Test public void staleVideoCannotPreventDisablingFromSettings(){
        Track a=new Track(A,"fr");Manager ma=new Manager(a);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);DeepSeekConfig.saveEnabled(activity,true);
        PageCaptionController.onVideoId(C);
        DeepSeekEnabledPreference preference=new DeepSeekEnabledPreference(activity);
        preference.getOnPreferenceChangeListener().onPreferenceChange(preference,false);
        assertFalse("Global off must persist even without current native state",DeepSeekConfig.enabled(activity));
        assertFalse(preference.isChecked());assertTrue(calls.isEmpty());
    }

    @Test public void manyShortsWithPrefetchCanToggleBothDirections(){
        for(int i=1;i<=20;i++){
            String video=String.format(Locale.ROOT,"%011d",i),next=String.format(Locale.ROOT,"%011d",i+1);
            Track t=new Track(video,"fr"),prefetch=new Track(next,"de");Manager manager=new Manager(t),other=new Manager(prefetch);
            PageCaptionController.onVideoId(video);select(manager,t,Origin.PREFERRED_TRACK);
            NativeCaptionBridge.onNativeSelectionWithReason(other,prefetch,Origin.DEFAULT,99);
            calls.clear();reasons.clear();assertTrue(CaptionQuickToggle.setEngine(activity,true));
            assertEquals(Arrays.asList(null,t),calls);assertEquals(Arrays.asList(17,17),reasons);
            assertEquals("fr",RememberedCaptionSelection.language());
            calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,false));assertEquals(Arrays.asList(null,t),calls);
            assertFalse(DeepSeekConfig.enabled(activity));assertEquals("fr",CaptionChoice.language());
        }
    }
    @Test public void prefetchedSnapshotFollowsVisibleVideoNotTheLastLateCallback(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);select(mb,b,Origin.DEFAULT);
        PageCaptionController.onVideoId(B);select(ma,a,Origin.DEFAULT);
        assertEquals("de",CaptionChoice.language());assertTrue(CaptionQuickToggle.setEngine(activity,true));
        assertEquals(Arrays.asList(null,b),calls);assertEquals("fr",RememberedCaptionSelection.language());
        assertFalse(activations.contains(A));assertTrue(activations.contains(B));
    }
    private void clearWeak(String video,String field)throws Exception{
        java.lang.reflect.Field entries=NativeCaptionBridge.class.getDeclaredField("selections");entries.setAccessible(true);
        Object value=((Map<?,?>)entries.get(null)).get(video);java.lang.reflect.Field ref=value.getClass().getDeclaredField(field);ref.setAccessible(true);
        ((java.lang.ref.WeakReference<?>)ref.get(value)).clear();
    }
    @Test public void expiredTrackIsResolvedFromTheSameVideosFreshModel()throws Exception{
        Track old=new Track(A,"fr"),fresh=new Track(A,"fr");Manager manager=new Manager(old);
        PageCaptionController.onVideoId(A);select(manager,old,Origin.PREFERRED_TRACK);clearWeak(A,"track");manager.tracks=Arrays.asList(fresh);
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,fresh),calls);
    }
    @Test public void expiredManagerCannotTrapOffAndNextReadyCallbackAppliesOn()throws Exception{
        Track t=new Track(A,"fr");Manager manager=new Manager(t);PageCaptionController.onVideoId(A);select(manager,t,Origin.PREFERRED_TRACK);
        DeepSeekConfig.saveEnabled(activity,true);clearWeak(A,"manager");
        assertTrue(CaptionQuickToggle.setEngine(activity,false));assertFalse(DeepSeekConfig.enabled(activity));assertTrue(calls.isEmpty());
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue(DeepSeekConfig.enabled(activity));assertTrue(calls.isEmpty());
        assertTrue("Saved same-video descriptor starts without a native manager",activations.contains(A));
        Manager fresh=new Manager(t);select(fresh,t,Origin.DEFAULT);assertTrue(activations.contains(A));
    }
    @Test public void reusedManagerNeverReceivesAnOldVideosTrack(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager manager=new Manager(a);
        PageCaptionController.onVideoId(A);select(manager,a,Origin.PREFERRED_TRACK);DeepSeekConfig.saveEnabled(activity,true);
        manager.tracks=Arrays.asList(b);select(manager,b,Origin.DEFAULT);
        assertTrue(CaptionQuickToggle.setEngine(activity,false));assertTrue(calls.isEmpty());
        PageCaptionController.onVideoId(B);assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,b),calls);
    }
    @Test public void nativeFailureDoesNotRollbackModeOrEraseOriginalSnapshot(){
        Track a=new Track(A,"fr");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);select(manager,a,Origin.PREFERRED_TRACK);
        DeepSeekConfig.saveEnabled(activity,true);manager.fail=true;
        assertTrue(CaptionQuickToggle.setEngine(activity,false));assertFalse(DeepSeekConfig.enabled(activity));assertEquals("fr",RememberedCaptionSelection.language());
        assertFalse(refreshModes.get(refreshModes.size()-1));
        manager.fail=false;calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,a),calls);
    }
    @Test public void captionOffIsPreservedEvenWithAnotherVideoPrefetched(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);select(ma,null,Origin.PREFERRED_TRACK);select(mb,b,Origin.DEFAULT);
        assertFalse(CaptionChoice.isOn());assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue(calls.isEmpty());assertFalse(CaptionChoice.isOn());
        assertEquals(0,RememberedCaptionSelection.decision());assertTrue(CaptionQuickToggle.setEngine(activity,false));assertTrue(calls.isEmpty());
    }
    @Test public void midReselectVideoChangeStopsTheOldTrackAndKeepsSavedMode(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);select(mb,b,Origin.DEFAULT);DeepSeekConfig.saveEnabled(activity,true);
        ma.switchVideo=B;assertTrue(CaptionQuickToggle.setEngine(activity,false));assertFalse(DeepSeekConfig.enabled(activity));assertEquals(Collections.singletonList(null),calls);
        assertEquals("de",CaptionChoice.language());calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,b),calls);
    }
    @Test public void temporaryDefaultNullDoesNotLeaveCaptionsPermanentlyOff(){
        Track t=new Track(A,"fr");Manager manager=new Manager(t);PageCaptionController.onVideoId(A);
        select(manager,t,Origin.PREFERRED_TRACK);select(manager,null,Origin.DEFAULT);assertFalse(CaptionChoice.isOn());select(manager,t,Origin.DEFAULT);assertTrue(CaptionChoice.isOn());
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertEquals(Arrays.asList(null,t),calls);
    }
    @Test public void missingLanguageInChangedModelDoesNotReselectOldObject(){
        Track a=new Track(A,"fr"),other=new Track(A,"de");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);select(manager,a,Origin.PREFERRED_TRACK);
        manager.tracks=Arrays.asList(other);assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue(calls.isEmpty());
        assertEquals(CaptionStrings.get(activity,"mode_pending"),org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
    }
    @Test public void missingVisibleVideoCannotReplayTheLastPreload(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);PageCaptionController.onVideoId("");select(mb,b,Origin.DEFAULT);
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue(calls.isEmpty());
        PageCaptionController.onVideoId(A);assertEquals("fr",CaptionChoice.language());assertTrue(activations.contains(A));
    }
    @Test public void failureAfterInternalNullDoesNotLoseTheSelectedTrack(){
        Track t=new Track(A,"fr");Manager manager=new Manager(t);PageCaptionController.onVideoId(A);select(manager,t,Origin.PREFERRED_TRACK);
        manager.failOnTrack=true;assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue("Start AI before native reselect can fail",activations.contains(A));assertTrue(DeepSeekConfig.enabled(activity));
        assertEquals(Arrays.asList(null,t),calls);assertTrue(CaptionChoice.isOn());assertEquals("fr",RememberedCaptionSelection.language());
        manager.failOnTrack=false;calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,false));assertEquals(Arrays.asList(null,t),calls);
        assertFalse(DeepSeekConfig.enabled(activity));assertEquals("fr",RememberedCaptionSelection.language());
    }
    @Test public void missingNativeOriginDoesNotPreventDirectAiTakeover(){
        Track t=new Track(A,"fr");Manager manager=new Manager(t);PageCaptionController.onVideoId(A);
        select(manager,t,null);assertTrue(CaptionQuickToggle.setEngine(activity,true));
        assertTrue(activations.contains(A));assertTrue("Do not invoke native selector without its origin",calls.isEmpty());
    }
    @Test public void prefetchedDescriptorSurvivesManagerCollectionBeforeForeground()throws Exception{
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);select(ma,a,Origin.PREFERRED_TRACK);select(mb,b,Origin.DEFAULT);
        clearWeak(B,"manager");clearWeak(B,"track");DeepSeekConfig.saveEnabled(activity,true);
        PageCaptionController.onVideoId(B);assertEquals("de",CaptionChoice.language());assertTrue(activations.contains(B));
        assertEquals("fr",RememberedCaptionSelection.language());
    }
    @Test public void emptyNativeModelAndExpiredTrackCanUseSameVideoDescriptor()throws Exception{
        Track a=new Track(A,"fr");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);select(manager,a,Origin.PREFERRED_TRACK);
        clearWeak(A,"track");manager.tracks=Collections.emptyList();
        assertTrue(CaptionQuickToggle.setEngine(activity,true));assertTrue(activations.contains(A));assertTrue(calls.isEmpty());
    }

    @Test public void directStartupUsesFreshSignedUrlRatherThanCapturedExpiredDescriptor(){
        Track old=new Track(A,"fr"),fresh=new Track(A,"fr");old.suffix="&sig=old-test";fresh.suffix="&sig=fresh-test";
        Manager manager=new Manager(old);PageCaptionController.onVideoId(A);select(manager,old,Origin.PREFERRED_TRACK);
        manager.tracks=Collections.singletonList(fresh);assertTrue(CaptionQuickToggle.setEngine(activity,true));
        assertFalse(activationUrls.isEmpty());for(String url:activationUrls)assertEquals(fresh.url(),url);
    }


    @Test public void twentyDefaultAppliedTranslationsCanTakeOverWithoutAnyMenuSelection(){
        for(int i=1;i<=20;i++){
            String video=String.format(Locale.ROOT,"%011d",i);
            Track track=new Track(video,"fr");Manager manager=new Manager(track);
            PageCaptionController.onVideoId(video);
            NativeCaptionBridge.onNativeSelectionApplied(manager,track,Origin.DEFAULT,2,video);
            calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,true));
            assertEquals(Arrays.asList(null,track),calls);assertTrue(activations.contains(video));
            calls.clear();assertTrue(CaptionQuickToggle.setEngine(activity,false));
            assertEquals(Arrays.asList(null,track),calls);
        }
    }
    @Test public void appliedPrefetchThenForegroundWorksWithoutMenuAndLateOldEventCannotSteal(){
        Track a=new Track(A,"fr"),b=new Track(B,"de");Manager ma=new Manager(a),mb=new Manager(b);
        PageCaptionController.onVideoId(A);
        NativeCaptionBridge.onNativeSelectionApplied(ma,a,Origin.DEFAULT,2,A);
        NativeCaptionBridge.onNativeSelectionApplied(mb,b,Origin.DEFAULT,2,B);
        assertEquals("fr",CaptionChoice.language());DeepSeekConfig.saveEnabled(activity,true);
        PageCaptionController.onVideoId(B);
        NativeCaptionBridge.onNativeSelectionApplied(ma,a,Origin.DEFAULT,2,A);
        assertEquals("de",CaptionChoice.language());calls.clear();
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,b),calls);assertTrue(activations.contains(B));assertFalse(activations.contains(A));
    }
    @Test public void ownerlessAutomaticResetDoesNotOverwriteThePreviousSelection(){
        Track a=new Track(A,"fr");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);
        NativeCaptionBridge.onNativeSelectionApplied(manager,a,Origin.DEFAULT,2,A);
        NativeCaptionBridge.onNativeSelectionApplied(manager,null,Origin.DEFAULT,0,"");
        assertTrue(CaptionChoice.isOn());
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),calls);
    }
    @Test public void appliedOffRemainsOffAndMismatchCannotStartTranslation(){
        Track a=new Track(A,"fr");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);
        NativeCaptionBridge.onNativeSelectionApplied(manager,a,Origin.DEFAULT,2,B);
        assertFalse(CaptionChoice.known());assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
        NativeCaptionBridge.onNativeSelectionApplied(manager,a,Origin.DEFAULT,2,A);
        NativeCaptionBridge.onNativeSelectionApplied(manager,null,Origin.PREFERRED_TRACK,0,A);
        assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());assertTrue(calls.isEmpty());
    }

    @Test public void explicitOffWinsOverForcedTrackButAutomaticFallbackUsesCommittedTrack(){
        Track a=new Track(A,"fr");Manager manager=new Manager(a);PageCaptionController.onVideoId(A);
        NativeCaptionBridge.onNativeAppliedEvent(manager,a,null,Origin.DEFAULT,2,A);
        assertTrue(CaptionChoice.isOn());assertEquals("fr",CaptionChoice.language());
        NativeCaptionBridge.onNativeAppliedEvent(manager,a,null,Origin.PREFERRED_TRACK,0,A);
        assertFalse(CaptionChoice.isOn());assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(0,RememberedCaptionSelection.decision());
    }
}
