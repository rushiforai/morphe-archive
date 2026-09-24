package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import static org.junit.Assert.*;

/** JVM contract for revision126. Only host accessors and controller I/O are shadowed;
 * applied-event filtering, owner checks, snapshots and memory use production code.
 * This mirrors the bound dispatcher, but does not claim to execute patched ART bytecode. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, shadows={NativeApplied126Test.Flags.class, NativeApplied126Test.Access.class,
        NativeApplied126Test.Core.class, SourceMode124Test.NoPaidApi.class})
public class NativeApplied126Test {
    private static final String A="aaaaaaaaaaa", B="bbbbbbbbbbb";
    private static final int REASON=17;
    private static boolean aiInstalled;
    private static final List<Track> nativeCalls=new ArrayList<>();
    private static final List<Object> nativeOrigins=new ArrayList<>();
    private static final List<Integer> nativeReasons=new ArrayList<>();
    private static final List<String> activations=new ArrayList<>();
    private static String activeUrl="";
    private static int stops;
    private Activity activity;

    enum Origin { DEFAULT, PREFERRED_TRACK }

    static final class Track {
        final String video, language;
        final boolean translated, asr;
        Track(String video,String language,boolean translated,boolean asr) {
            this.video=video;this.language=language;this.translated=translated;this.asr=asr;
        }
        String url() {
            return "https://www.youtube.com/api/timedtext?v="+video+"&lang="+(translated?"en":language)
                    +(translated?"&tlang="+language:"")+(asr?"&kind=asr":"");
        }
    }

    static final class Manager {
        String modelOwner;
        List<Track> tracks;
        Manager(String owner,Track... tracks) { modelOwner=owner;this.tracks=Arrays.asList(tracks); }
        void apply(Track committed,Track requested,Origin origin) {
            dispatch(new AppliedEvent(committed,requested,origin,"unrelated-playback-token"));
        }
        void dispatch(AppliedEvent event) {
            // event.playbackId is deliberately NOT the video ID. The patched call reads anyi.d.
            NativeCaptionBridge.onNativeAppliedEvent(this,event.committed,event.requested,event.origin,
                    REASON,NativeCaptionBridge.nativeModelVideo(this));
        }
    }

    static final class AppliedEvent {
        final Track committed,requested;
        final Origin origin;
        final String playbackId;
        AppliedEvent(Track committed,Track requested,Origin origin,String playbackId) {
            this.committed=committed;this.requested=requested;this.origin=origin;this.playbackId=playbackId;
        }
    }

    @Implements(CaptionAddonSupport.class) public static class Flags {
        @Implementation public static boolean aiInstalled() { return aiInstalled; }
        @Implementation public static boolean memoryInstalled() { return true; }
    }
    @Implements(NativeCaptionBridge.class) public static class Access {
        @Implementation public static String nativeModelVideo(Object manager) { return ((Manager)manager).modelOwner; }
        @Implementation public static List<?> nativeTracks(Object manager) { return ((Manager)manager).tracks; }
        @Implementation public static List<?> translatedTracks(Object manager) { return ((Manager)manager).tracks; }
        @Implementation public static String language(Object track) { return ((Track)track).language; }
        @Implementation public static String url(Object track) { return ((Track)track).url(); }
        @Implementation public static String vss(Object track) {
            Track t=(Track)track;return (t.asr?"a.":".")+t.language;
        }
        @Implementation public static void selectNative(Object manager,Object track,Object origin,int reason) {
            nativeCalls.add((Track)track);nativeOrigins.add(origin);nativeReasons.add(reason);
            // Internal null/reselect goes through the same applied-event path as the initial selection.
            NativeCaptionBridge.onNativeAppliedEvent(manager,track,track,origin,reason,
                    NativeCaptionBridge.nativeModelVideo(manager));
        }
    }
    @Implements(ContextualUnitCaptionController.class) public static class Core {
        @Implementation public static void activateSource(Context context,String url) { activate(context,url); }
        @Implementation public static void activate(Context context,String url) { activations.add(url);activeUrl=url; }
        @Implementation public static boolean isVisibleActive() { return !activeUrl.isEmpty(); }
        @Implementation public static void deactivateFromNativeCaptionState() { stops++;activeUrl=""; }
        @Implementation public static void onVideoId(String video) { activeUrl=""; }
    }

    @Before public void setup() throws Exception {
        aiInstalled=true;activity=Robolectric.buildActivity(Activity.class).setup().get();
        CaptionAddonSupport.initialize(activity);DeepSeekConfig.saveEnabled(activity,false);
        PageCaptionController.onVideoId("");
        Field selections=NativeCaptionBridge.class.getDeclaredField("selections");selections.setAccessible(true);
        ((Map<?,?>)selections.get(null)).clear();
        CaptionChoice.reset();RememberedCaptionSelection.reset();
        nativeCalls.clear();nativeOrigins.clear();nativeReasons.clear();activations.clear();activeUrl="";stops=0;
        SourceMode124Test.paidCalls.set(0);
    }
    @After public void finish() {
        try { assertEquals("No paid translation I/O",0,SourceMode124Test.paidCalls.get()); }
        finally { activity.finish(); }
    }

    private static Track source(String video,String language) { return new Track(video,language,false,false); }
    private static void assertMemory(String language,boolean translated,boolean asr) {
        assertEquals(1,NativeCaptionBridge.restoreDecision());
        assertEquals(language,RememberedCaptionSelection.language());
        assertEquals(translated,RememberedCaptionSelection.translated());
        assertEquals(asr,RememberedCaptionSelection.asr());
    }
    private static void assertChoice(String language) {
        assertTrue(CaptionChoice.known());assertTrue(CaptionChoice.isOn());assertEquals(language,CaptionChoice.language());
    }

    @Test public void explicitSelectionWithAiOffUsesModelOwnerNotPlaybackIdentifier() {
        Track selected=new Track(A,"fr",false,true);Manager manager=new Manager(A,selected);
        PageCaptionController.onVideoId(A);
        AppliedEvent event=new AppliedEvent(selected,selected,Origin.PREFERRED_TRACK,"playback-987-not-a-video");
        assertNotEquals(manager.modelOwner,event.playbackId);manager.dispatch(event);
        assertMemory("fr",false,true);assertChoice("fr");assertTrue(CaptionChoice.asr());
        assertTrue(activations.isEmpty());assertFalse(NativeCaptionBridge.suppressNativeDraw());
        Track fresh=new Track(B,"fr",false,true);
        assertSame(fresh,NativeCaptionBridge.resolveRemembered(new Manager(B,fresh)));
    }

    @Test public void memoryOnlyInstallRemembersTranslatedSelectionWithoutAiChoiceOrActivation() {
        aiInstalled=false;DeepSeekConfig.saveEnabled(activity,true);
        Track selected=new Track(A,"fr",true,false);Manager manager=new Manager(A,selected);
        PageCaptionController.onVideoId(A);manager.apply(selected,selected,Origin.PREFERRED_TRACK);
        assertMemory("fr",true,false);assertFalse(CaptionChoice.known());
        assertTrue(activations.isEmpty());assertFalse(NativeCaptionBridge.suppressNativeDraw());
        Track fresh=new Track(B,"fr",true,false);
        assertSame(fresh,NativeCaptionBridge.resolveRemembered(new Manager(B,fresh)));
    }

    @Test public void memoryOnlyWithoutVideoHookRestoresOnOffAndFreshModel() {
        aiInstalled=false;
        assertEquals("",PageCaptionController.currentVideoIdSnapshot());
        Track a=source(A,"en"),b=source(B,"en");Manager ma=new Manager(A,a),mb=new Manager(B,b);
        ma.apply(a,a,Origin.PREFERRED_TRACK);assertMemory("en",false,false);
        assertSame(b,NativeCaptionBridge.resolveRemembered(mb));
        mb.apply(b,b,Origin.DEFAULT);assertMemory("en",false,false);
        mb.apply(null,null,Origin.PREFERRED_TRACK);assertEquals(0,NativeCaptionBridge.restoreDecision());
        assertNull(NativeCaptionBridge.resolveRemembered(ma));
        ma.modelOwner="";ma.apply(null,null,Origin.DEFAULT);
        assertEquals(0,NativeCaptionBridge.restoreDecision());
        mb.apply(b,b,Origin.PREFERRED_TRACK);assertMemory("en",false,false);
        assertFalse(CaptionChoice.known());assertTrue(activations.isEmpty());
    }

    @Test public void automaticRequestedNullUsesCommittedTrackWithoutChangingExplicitMemory() {
        RememberedCaptionSelection.select("ja",true,false);
        Track track=source(A,"en");Manager manager=new Manager(A,track);
        PageCaptionController.onVideoId(A);manager.apply(track,null,Origin.DEFAULT);
        assertChoice("en");assertFalse(CaptionChoice.translates());assertMemory("ja",true,false);
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,track),nativeCalls);assertChoice("en");assertMemory("ja",true,false);
    }

    @Test public void automaticApplyUsesCommittedRatherThanRequestedLanguage() {
        Track requested=source(A,"de"),committed=source(A,"en");Manager manager=new Manager(A,committed);
        PageCaptionController.onVideoId(A);manager.apply(committed,requested,Origin.DEFAULT);
        assertChoice("en");assertEquals(-1,NativeCaptionBridge.restoreDecision());
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,committed),nativeCalls);
    }

    @Test public void backgroundAutomaticThenLateManualEventsCannotStealVisibleChoiceMemoryOrRenderer() {
        DeepSeekConfig.saveEnabled(activity,true);
        Track a=source(A,"fr"),b=source(B,"de");Manager ma=new Manager(A,a),mb=new Manager(B,b);
        PageCaptionController.onVideoId(A);ma.apply(a,a,Origin.PREFERRED_TRACK);
        assertEquals(Collections.singletonList(a.url()),activations);
        mb.apply(b,null,Origin.DEFAULT);
        assertChoice("fr");assertMemory("fr",false,false);assertEquals(a.url(),activeUrl);
        assertEquals(1,activations.size());assertEquals(0,stops);
        PageCaptionController.onVideoId(B);
        assertChoice("de");assertEquals(b.url(),activeUrl);assertEquals(2,activations.size());
        // A delayed manual callback, including Off, belongs to the departed model A.
        ma.apply(a,a,Origin.PREFERRED_TRACK);ma.apply(null,null,Origin.PREFERRED_TRACK);
        assertChoice("de");assertMemory("fr",false,false);assertEquals(b.url(),activeUrl);
        assertEquals(2,activations.size());assertEquals(0,stops);assertTrue(NativeCaptionBridge.suppressNativeDraw());
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,b),nativeCalls);assertMemory("fr",false,false);
    }

    @Test public void backgroundManualSelectionDoesNotBecomeGlobalMemoryWhenItLaterBecomesVisible() {
        Track a=source(A,"fr"),b=new Track(B,"de",false,true);
        Manager ma=new Manager(A,a),mb=new Manager(B,b);
        PageCaptionController.onVideoId(A);ma.apply(a,a,Origin.PREFERRED_TRACK);
        mb.apply(b,b,Origin.PREFERRED_TRACK);
        assertChoice("fr");assertMemory("fr",false,false);
        PageCaptionController.onVideoId(B);assertChoice("de");assertTrue(CaptionChoice.asr());
        assertMemory("fr",false,false);
    }

    @Test public void modelTrackMismatchIsRejectedForBothAutomaticAndExplicitOrigins() {
        DeepSeekConfig.saveEnabled(activity,true);RememberedCaptionSelection.select("ja",true,false);
        Track track=source(A,"en");Manager manager=new Manager(B,track);PageCaptionController.onVideoId(A);
        for(Origin origin:Origin.values()) {
            manager.apply(track,track,origin);
            assertFalse(CaptionChoice.known());assertMemory("ja",true,false);
            assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
        }
        assertTrue(activations.isEmpty());assertTrue(nativeCalls.isEmpty());
        assertTrue(CaptionDiagnostics.uiText(activity).contains("NATIVE_APPLIED_OWNER_REJECTED"));
        PageCaptionController.onVideoId(B);assertFalse(CaptionChoice.known());
    }

    @Test public void mismatchCannotReplaceAnExistingValidSnapshot() {
        Track valid=source(A,"fr"),wrong=source(A,"de");Manager manager=new Manager(A,valid);
        PageCaptionController.onVideoId(A);manager.apply(valid,valid,Origin.PREFERRED_TRACK);
        new Manager(B,wrong).apply(wrong,wrong,Origin.PREFERRED_TRACK);
        assertChoice("fr");assertMemory("fr",false,false);
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,valid),nativeCalls);
    }

    @Test public void explicitNullOffWinsOverForcedCommittedTrackAndStopsVisibleRenderer() {
        DeepSeekConfig.saveEnabled(activity,true);
        Track forced=source(A,"en");Manager manager=new Manager(A,forced);
        PageCaptionController.onVideoId(A);manager.apply(forced,null,Origin.DEFAULT);
        assertTrue(NativeCaptionBridge.suppressNativeDraw());
        manager.apply(forced,null,Origin.PREFERRED_TRACK);
        assertTrue(CaptionChoice.known());assertFalse(CaptionChoice.isOn());
        assertEquals(0,NativeCaptionBridge.restoreDecision());assertEquals(1,stops);
        assertEquals(1,activations.size());assertFalse(NativeCaptionBridge.suppressNativeDraw());
        assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());
        assertTrue(nativeCalls.isEmpty());
    }

    @Test public void explicitDisableOptionWinsOverForcedTrackInMemoryOnlyInstall() {
        aiInstalled=false;RememberedCaptionSelection.select("fr",true,false);
        Track forced=source(A,"en"),off=source("","DISABLE_CAPTIONS_OPTION");
        Manager manager=new Manager(A,forced);
        PageCaptionController.onVideoId(A);manager.apply(forced,off,Origin.PREFERRED_TRACK);
        assertEquals(0,NativeCaptionBridge.restoreDecision());assertEquals("fr",RememberedCaptionSelection.language());
        assertFalse(CaptionChoice.known());assertTrue(activations.isEmpty());
        assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());
        assertTrue(nativeCalls.isEmpty());
    }

    @Test public void automaticOwnedOffUpdatesVisibleChoiceButNotExplicitMemory() {
        RememberedCaptionSelection.select("fr",true,false);
        // No track URL exists for Off; only the actual caption model can provide ownership.
        PageCaptionController.onVideoId(A);new Manager(A).apply(null,null,Origin.DEFAULT);
        assertTrue(CaptionChoice.known());assertFalse(CaptionChoice.isOn());assertMemory("fr",true,false);
        assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());
    }

    @Test public void ownedBackgroundOffDoesNotTurnOffVisibleVideoOrOverwriteMemory() {
        Track a=source(A,"fr");Manager manager=new Manager(A,a);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        new Manager(B).apply(null,null,Origin.PREFERRED_TRACK);
        assertChoice("fr");assertMemory("fr",false,false);
        PageCaptionController.onVideoId(B);assertTrue(CaptionChoice.known());assertFalse(CaptionChoice.isOn());
        assertMemory("fr",false,false);
        assertEquals(NativeCaptionBridge.Refresh.CAPTIONS_OFF,NativeCaptionBridge.refreshNativeTrack());
    }

    @Test public void ownerlessResetDoesNotInferOffFromReusedManagersPreviousTrack() {
        Track a=source(A,"fr");Manager manager=new Manager(A,a);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        for(String missingOwner:Arrays.asList("",null,"   ")) {
            manager.modelOwner=missingOwner;
            // Keep stale tracks: falling back to them for this applied reset would incorrectly turn A off.
            manager.apply(null,null,Origin.DEFAULT);manager.apply(null,null,Origin.PREFERRED_TRACK);
            assertChoice("fr");assertMemory("fr",false,false);
        }
        manager.modelOwner=A;
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),nativeCalls);assertChoice("fr");
    }

    @Test public void ownerlessResetWithNoVisibleVideoDoesNotCreateAnOffSnapshot() {
        new Manager("").apply(null,null,Origin.DEFAULT);
        assertFalse(CaptionChoice.known());assertEquals(-1,NativeCaptionBridge.restoreDecision());
        PageCaptionController.onVideoId(A);
        assertFalse(CaptionChoice.known());
        assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
    }

    @Test public void boundModelOwnerOverridesStaleTracksWhenRefreshingReusedManager() {
        Track a=source(A,"fr");Manager manager=new Manager(A,a);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        // The same host manager now has model B, but its old track list still points to A.
        manager.modelOwner=B;DeepSeekConfig.saveEnabled(activity,true);
        assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
        assertTrue(nativeCalls.isEmpty());assertTrue(activations.isEmpty());
        assertChoice("fr");assertMemory("fr",false,false);
    }

    @Test public void emptyBoundAccessorRetainsLegacyTrackOwnershipFallback() {
        Track a=source(A,"fr");Manager manager=new Manager(A,a);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        manager.modelOwner="";
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),nativeCalls);assertChoice("fr");assertMemory("fr",false,false);
        nativeCalls.clear();manager.tracks=Collections.singletonList(source(B,"fr"));
        assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
        assertTrue(nativeCalls.isEmpty());
    }

    @Test public void nonemptyBoundOwnerTakesPrecedenceOverMixedLegacyTrackList() {
        Track a=source(A,"fr"),b=source(B,"de");Manager manager=new Manager(A,a,b);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),nativeCalls);
        nativeCalls.clear();manager.modelOwner="";
        assertEquals(NativeCaptionBridge.Refresh.DEFERRED,NativeCaptionBridge.refreshNativeTrack());
        assertTrue(nativeCalls.isEmpty());
    }

    @Test public void internalNullReselectPreservesMemoryChoiceOriginAndReasonThroughAppliedEvent() {
        Track a=new Track(A,"fr",false,true);Manager manager=new Manager(A,a);
        PageCaptionController.onVideoId(A);manager.apply(a,a,Origin.PREFERRED_TRACK);
        // A reselect must not write either its temporary Off or its old language to global memory.
        RememberedCaptionSelection.select("ja",true,false);
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),nativeCalls);
        assertEquals(Arrays.asList(Origin.PREFERRED_TRACK,Origin.PREFERRED_TRACK),nativeOrigins);
        assertEquals(Arrays.asList(REASON,REASON),nativeReasons);
        assertChoice("fr");assertTrue(CaptionChoice.asr());assertMemory("ja",true,false);
        nativeCalls.clear();
        assertEquals(NativeCaptionBridge.Refresh.APPLIED,NativeCaptionBridge.refreshNativeTrack());
        assertEquals(Arrays.asList(null,a),nativeCalls);assertMemory("ja",true,false);
    }
}
