package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.yydarlinker.caption.contracts.CaptionContracts.*;

import static org.junit.Assert.*;

/**
 * The reconciler is the only place that applies the session intent: (video, player epoch, revision)
 * is applied once, a teardown never writes the intent, and a native observation can never turn into
 * a user command.
 */
@RunWith(RobolectricTestRunner.class)
@Config(
        sdk = 28,
        manifest = Config.NONE,
        shadows = {
            CaptionSessionReconcilerTest.Core.class,
            CaptionSessionReconcilerTest.Epoch.class,
            CaptionSessionReconcilerTest.Tracks.class
        })
public class CaptionSessionReconcilerTest {
    private static final String VIDEO = "abcdefghijk";
    private static final String SOURCE =
            "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=en";
    private static final String ZH_SOURCE =
            "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=zh-Hans";
    private static final String TRANSLATED = SOURCE + "&tlang=zh-Hans";

    enum Origin {
        PREFERRED_TRACK,
        DEFAULT
    }

    static final List<String> calls = new ArrayList<>();
    static String currentVideo = VIDEO;
    static boolean visible;
    static boolean owns;
    static long epoch = 7L;

    static final class Track {
        final String language, url, vss;

        Track(String language, String url, String vss) {
            this.language = language;
            this.url = url;
            this.vss = vss;
        }
    }

    @Implements(CaptionActions.class)
    public static class Core {
        @Implementation
        public static void activate(Context context, String url) {
            calls.add("translate:" + url);
            visible = true;
        }

        @Implementation
        public static void activateSource(Context context, String url) {
            calls.add("source:" + url);
            visible = true;
        }

        @Implementation
        public static String currentVideoIdSnapshot() {
            return currentVideo;
        }

        @Implementation
        public static boolean isVisibleActive() {
            return visible;
        }

        @Implementation
        public static boolean ownsNativeTrack() {
            return owns;
        }

        @Implementation
        public static void deactivateByUser() {
            calls.add("stop:user_off");
            visible = false;
        }

        @Implementation
        public static void deactivateAfterNativeReset() {
            calls.add("stop:native_reset");
            visible = false;
        }
    }

    @Implements(CaptionPlayerAuthority.class)
    public static class Epoch {
        @Implementation
        public static long ownerEpoch() {
            return epoch;
        }
    }

    @Implements(NativeCaptionBridge.class)
    public static class Tracks {
        @Implementation
        public static String language(Object track) {
            return ((Track) track).language;
        }

        @Implementation
        public static String url(Object track) {
            return ((Track) track).url;
        }

        @Implementation
        public static String vss(Object track) {
            return ((Track) track).vss;
        }

        @Implementation
        public static String nativeModelVideo(Object manager) {
            return VIDEO;
        }
    }

    private Activity a;

    @Before
    public void before() {
        a = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionAddonSupport.initialize(a);
        CaptionActions.install(
                new CaptionPort() {
                    public void command(Action action, String value) {}

                    public boolean active() {
                        return false;
                    }

                    public boolean ownsNativeTrack() {
                        return false;
                    }

                    public String restoreTarget(String url) {
                        return url;
                    }

                    public String videoId() {
                        return currentVideo;
                    }

                    public void playback(long time) {}
                },
                new CaptionActions.SettingsServices() {
                    public String testApi() {
                        return "fake";
                    }

                    public List<String> models(String endpoint) {
                        return Collections.emptyList();
                    }
                });
        CaptionNativeProjection.resetForTests();
        NativeCaptionBridge.resetForTests();
        CaptionNativeProjection.ccState(CaptionIntentPolicy.ON);
        CaptionSessionReconciler.resetForTests();
        CaptionSessionIntent.resetForTests(a);
        SourceCatalog.clear();
        SourceTrackPolicy.reset();
        DeepSeekConfig.saveEnabled(a, true);
        calls.clear();
        currentVideo = VIDEO;
        NativeCaptionBridge.onVideoId(VIDEO);
        visible = false;
        owns = false;
        epoch = 7L;
        // The video's own signed source track: enough to materialise a translation target without
        // any native track callback, which is what a re-entry after a teardown must be able to do.
        SourceCatalog.register(
                VIDEO,
                Collections.singletonList(
                        new SourceSelection(
                                VIDEO,
                                "en",
                                "en",
                                SOURCE,
                                SourceSelection.Kind.MANUAL,
                                true,
                                0,
                                "")),
                true);
    }

    @After
    public void after() {
        CaptionButtonController.onPlayerStable();
        CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();
        NativeCaptionBridge.resetForTests();
        CaptionSessionIntent.resetForTests(a);
        SourceCatalog.clear();
        a.finish();
    }

    private void userChoseTarget() {
        CaptionSessionIntent.userToggled(a, true);
        CaptionNativeProjection.selection(VIDEO, "zh-Hans", TRANSLATED, false, true, true, epoch);
    }

    @Test
    public void dualAiRecordsGateDifferentDecisionsAndCcOnBackfillsLegacyModeM3a() {
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",TRANSLATED,false,true,false,epoch);
        CaptionSessionReconciler.onVideo(a,VIDEO);
        assertTrue("config enabled grants the display gate",CaptionSessionReconciler.displayAllowed(a));
        assertFalse(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals("application additionally requires intent enabled",0,starts());
        CaptionSessionReconciler.onUserActivated(a);
        assertTrue("CC on backfills a legacy enabled config",CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(1,starts());
        DeepSeekConfig.saveEnabled(a,false);
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertFalse("intent alone cannot grant the display gate",CaptionSessionReconciler.displayAllowed(a));
        CaptionSessionReconciler.onUserActivated(a);
        assertEquals(1,starts());
        long selection=CaptionNativeProjection.snapshot().revision;
        CaptionSessionReconciler.onUserSwitched(a,false);
        assertFalse(DeepSeekConfig.enabled(a));assertFalse(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(CaptionIntentPolicy.ON,CaptionNativeProjection.ccState());
        assertEquals(selection,CaptionNativeProjection.snapshot().revision);
    }

    private static int starts() {
        int count = 0;
        for (String call : calls)
            if (call.startsWith("start:")
                    || call.startsWith("translate:")
                    || call.startsWith("source:")) count++;
        return count;
    }

    private static int stops(String reason) {
        int count = 0;
        for (String call : calls) if (call.equals("stop:" + reason)) count++;
        return count;
    }

    // 1
    @Test
    public void teardownNeverWritesTheIntent() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());

        CaptionSessionIntent before = CaptionSessionIntent.load(a);
        CaptionSessionReconciler.onTeardown(a);
        CaptionSessionIntent after = CaptionSessionIntent.load(a);

        assertEquals("a teardown must not advance the revision", before.revision, after.revision);
        assertEquals(before.aiEnabled, after.aiEnabled);
        assertEquals("", CaptionSessionReconciler.sessionVideo());
    }

    // 2
    @Test
    public void tenNativeOffProjectionsChangeNoIntentAndTheNextVideoStillApplies() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        CaptionSessionIntent before = CaptionSessionIntent.load(a);

        Track off = null;
        for (int i = 0; i < 10; i++)
            NativeCaptionBridge.observe(
                    new Object(),
                    NativeCaptionBridge.Event.selection(off, Origin.DEFAULT, 0, null),
                    epoch);

        CaptionSessionIntent after = CaptionSessionIntent.load(a);
        assertEquals("an observed native Off is not a user act", before.revision, after.revision);
        assertEquals(before.aiEnabled, after.aiEnabled);
        assertTrue("the projection follows the native model", CaptionNativeProjection.snapshot().off);
        assertTrue(
                "a native reset may retire the application, but only as a recoverable stop",
                stops("native_reset") > 0);
        assertEquals("no user act wrote the switch back off", 0, stops("user_off"));

        CaptionSessionReconciler.onTeardown(a);
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals("an Off model cannot donate a target", 1, starts());
        CaptionNativeProjection.selection(VIDEO, "zh-Hans", TRANSLATED, false, true, false, epoch);
        CaptionSessionReconciler.onNativeSelection(a, epoch, false);
        assertEquals("the restored native track applies", 2, starts());
    }

    // 3
    @Test
    public void theSameAppliedKeyIsAppliedOnce() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        String key = CaptionSessionReconciler.appliedKey();
        assertEquals(1, starts());

        for (int i = 0; i < 3; i++) CaptionSessionReconciler.onPlayerRegular(a);
        CaptionSessionReconciler.onVideo(a, VIDEO);

        assertEquals("the same key must not restart the engine", 1, starts());
        assertEquals(1, CaptionSessionReconciler.applications());
        assertEquals(key, CaptionSessionReconciler.appliedKey());
    }

    /**
     * The applied key records a requested application, not a running engine. A retained session
     * whose key still matches but whose engine is no longer visible must converge on the next tick;
     * this is the re-entry that announces no video id and no teardown.
     */
    @Test
    public void aTickResumesARetainedSessionWhoseEngineIsNoLongerVisible() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        String key = CaptionSessionReconciler.appliedKey();
        int applied = CaptionSessionReconciler.applications();

        visible = false;
        owns = false;
        CaptionSessionReconciler.onPlayerRegular(a);

        assertEquals("the retained session is applied once", 2, starts());
        assertEquals("one new application", applied + 1, CaptionSessionReconciler.applications());
        assertEquals("the same key is applied again", key, CaptionSessionReconciler.appliedKey());
        assertTrue("the engine is visible after the resume", visible);

        CaptionSessionReconciler.onPlayerRegular(a);
        assertEquals("a visible engine is not applied again", 2, starts());
        assertEquals(applied + 1, CaptionSessionReconciler.applications());
    }

    /**
     * A session that is still starting already owns the native track; clearing its key on every tick
     * would restart the source fetch. The ownership test is what makes the resume safe.
     */
    @Test
    public void aTickDoesNotRestartASessionThatStillOwnsTheNativeTrack() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        String key = CaptionSessionReconciler.appliedKey();

        visible = false;
        owns = true;
        for (int i = 0; i < 3; i++) CaptionSessionReconciler.onPlayerRegular(a);
        assertEquals("a starting session must not be restarted by ticks", 1, starts());
        assertEquals(key, CaptionSessionReconciler.appliedKey());

        owns = false;
        CaptionSessionReconciler.onPlayerRegular(a);
        assertEquals("once it owns nothing it converges", 2, starts());
        assertTrue("the resumed session is visible", visible);
    }

    // 4
    @Test
    public void reenteringTheSameVideoAppliesTheSameIntentAgain() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        String first = CaptionSessionReconciler.appliedKey();

        CaptionSessionReconciler.onTeardown(a);
        assertEquals("the key is retired with its session", "", CaptionSessionReconciler.appliedKey());
        CaptionSessionReconciler.onVideo(a, VIDEO);
        CaptionSessionReconciler.onPlayerRegular(a);

        assertEquals(2, starts());
        assertEquals(first, CaptionSessionReconciler.appliedKey());
        assertEquals(2, CaptionSessionReconciler.applications());
    }

    // 5
    @Test
    public void aPlayerTickRebuildsTheSessionAfterTeardownWithoutANewVideoId() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        String key = CaptionSessionReconciler.appliedKey();

        CaptionSessionReconciler.onTeardown(a);
        assertEquals("the teardown retires the session", "", CaptionSessionReconciler.sessionVideo());
        assertEquals("", CaptionSessionReconciler.appliedKey());

        // Re-entering a video does not necessarily announce its id again: only the player ticks
        // remain. The first tick must rebuild the session and apply the unchanged intent once.
        for (int i = 0; i < 3; i++) CaptionSessionReconciler.onPlayerRegular(a);

        assertEquals(VIDEO, CaptionSessionReconciler.sessionVideo());
        assertEquals("one recovery application, not one per tick", 2, starts());
        assertEquals(key, CaptionSessionReconciler.appliedKey());
        assertEquals(2, CaptionSessionReconciler.applications());
    }

    // 5
    @Test
    public void ccOffKeepsTheAiChoiceAndOnlyCcOnCanResumeIt() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());

        CaptionSessionIntent before = CaptionSessionIntent.load(a);
        CaptionSessionReconciler.onUserOff(a, "cc_button");
        assertTrue(CaptionSessionIntent.load(a).aiEnabled);
        assertEquals(before.revision, CaptionSessionIntent.load(a).revision);
        assertEquals("the reconciler writes no stop of its own", 0, stops("user_off"));
        CaptionSessionReconciler.onPlayerRegular(a);
        CaptionSessionReconciler.onTeardown(a);
        CaptionSessionReconciler.onVideo(a, VIDEO);
        CaptionSessionReconciler.onPlayerRegular(a);
        assertEquals("a user off stays authoritative", 1, starts());

        assertTrue(CaptionSessionReconciler.onUserSwitched(a, true));
        assertEquals("the AI switch cannot reopen CC", 1, starts());
        CaptionSessionReconciler.onUserActivated(a);
        assertEquals(2, starts());
        assertTrue(
                "the stored target is what starts",
                calls.get(calls.size() - 1).contains("tlang=zh-Hans"));
    }

    /**
     * The quiet window around a player transition exists to keep a transient CC state out of the
     * projection. It must not stop the reconciler from applying an intent that became ready while
     * the window is armed.
     */
    @Test
    public void aPlayerTransitionQuietWindowDoesNotBlockIntentApplication() {
        CaptionSessionIntent.userToggled(a, true);
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals("no target yet, so nothing may start", 0, starts());

        CaptionButtonController.onPlayerTransition("WATCH_WHILE_FULLSCREEN");
        CaptionNativeProjection.selection(VIDEO, "zh-Hans", TRANSLATED, false, true, true, epoch);
        CaptionSessionReconciler.onPlayerRegular(a);

        assertEquals("the intent applies during the transition quiet window", 1, starts());
        assertTrue(
                "the target reached the engine",
                calls.get(calls.size() - 1).contains("tlang=zh-Hans"));
    }

    /**
     * translateTarget means "prefer an existing target-language track", not "never translate". A
     * persisted source-language choice from another video must not leave this one deferred forever.
     */
    @Test
    public void noSelectedTrackMeansNoSynthesizedTranslation() {
        CaptionSessionIntent.userToggled(a, true);
        CaptionSessionReconciler.onVideo(a, VIDEO);
        for (int i=0;i<3;i++) CaptionSessionReconciler.onPlayerRegular(a);
        assertEquals("the source catalogue does not select a language",0,starts());
    }

    @Test
    public void aNativeSourceSelectionStaysSourceEvenWithoutACatalogueEntry() {
        CaptionSessionIntent.userToggled(a,true);
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",ZH_SOURCE,false,false,false,epoch);
        CaptionSessionReconciler.onVideo(a,VIDEO);
        assertEquals(1,starts());
        assertTrue(calls.get(0).startsWith("source:"));
    }

    @Test
    public void anotherVideosTrackCannotSupplyTheCurrentLanguage() {
        CaptionSessionReconciler.onVideo(a,VIDEO);
        CaptionNativeProjection.selection("other-video","zh-Hans",ZH_SOURCE,false,false,true,epoch);
        assertTrue(CaptionSessionReconciler.onUserSwitched(a,true));
        assertNull(CaptionSessionReconciler.currentSelection());
        assertEquals(0,starts());
    }

    @Test
    public void theCurrentNativeSourceSelectionIsAppliedWhenAiIsEnabled() {
        CaptionSessionReconciler.onVideo(a,VIDEO);
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",ZH_SOURCE,false,false,false,epoch);
        assertTrue(CaptionSessionReconciler.onUserSwitched(a,true));
        assertEquals(1,starts());
        assertTrue(calls.get(0).startsWith("source:"));
    }

    @Test
    public void aTrackWithoutALiveSessionWaitsForTheMatchingVideo() {
        CaptionNativeProjection.selection(VIDEO,"zh-Hans",ZH_SOURCE,false,false,false,epoch);
        assertTrue(CaptionSessionReconciler.onUserSwitched(a,true));
        assertEquals(0,starts());
        CaptionSessionReconciler.onVideo(a,VIDEO);
        assertEquals(1,starts());
        assertTrue(calls.get(0).startsWith("source:"));
    }

    /**
     * An explicit selection in the CC menu is a user act: after a USER_OFF it turns the session
     * back on and the next apply really starts the engine.
     */
    @Test
    public void aMenuSelectionAfterAUserOffTurnsAiBackOnAndApplies() {
        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        CaptionSessionReconciler.onUserOff(a, "cc_button");
        assertTrue("CC off preserves the AI choice", CaptionSessionIntent.load(a).aiEnabled);

        CaptionNativeProjection.selection(
                VIDEO, "zh-Hans", TRANSLATED, false, true, true, epoch);
        CaptionSessionReconciler.onNativeSelection(a, epoch, true);

        assertTrue("the menu selection is a user on act", CaptionSessionIntent.load(a).aiEnabled);
        assertEquals("the selection applies the session again", 2, starts());
    }

    // 6
    @Test
    public void anOldEpochTrackListChangesNothing() {        userChoseTarget();
        CaptionSessionReconciler.onVideo(a, VIDEO);
        assertEquals(1, starts());
        String key = CaptionSessionReconciler.appliedKey();
        int stale = staleObservations();

        List<Track> tracks =
                Collections.singletonList(new Track("en", SOURCE, ".en"));
        NativeCaptionBridge.observe(
                null, NativeCaptionBridge.Event.trackList(tracks), epoch - 1);

        assertEquals(1, starts());
        assertEquals(1, CaptionSessionReconciler.applications());
        assertEquals(key, CaptionSessionReconciler.appliedKey());
        assertEquals(
                "the old epoch is dropped before it can touch the session",
                stale + 1,
                staleObservations());

        NativeCaptionBridge.observe(null, NativeCaptionBridge.Event.trackList(tracks), epoch);
        assertEquals("the current epoch is not stale", stale + 1, staleObservations());
    }

    private static int staleObservations() {
        String history = CaptionDiagnostics.history(target());
        int count = 0, at = 0;
        while ((at = history.indexOf("NATIVE_OBSERVATION_STALE", at)) >= 0) {
            count++;
            at += "NATIVE_OBSERVATION_STALE".length();
        }
        return count;
    }

    private static Context target() {
        return CaptionAddonSupport.context();
    }
}
