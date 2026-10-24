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
 * The addon must follow YouTube's native caption selection without ever turning an observation into
 * a user command. A native track or a native Off only updates the projection; the AI session is
 * started by the session intent, which only a user act writes.
 */
@RunWith(RobolectricTestRunner.class)
@Config(
        sdk = 28,
        manifest = Config.NONE,
        shadows = {
            NativeOnlyCaptionTest.Flags.class,
            NativeOnlyCaptionTest.Tracks.class,
            NativeOnlyCaptionTest.Core.class
        })
public class NativeOnlyCaptionTest {
    enum Origin {
        PREFERRED_TRACK,
        DEFAULT
    }

    private static final String VIDEO = "abcdefghijk";
    private static final String SOURCE =
            "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=en";
    private static final String TRANSLATED =
            "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=en&tlang=zh-Hans";

    static final List<Track> translated = new ArrayList<>();
    static final List<Track> nativeTracks = new ArrayList<>();
    static final List<String> activations = new ArrayList<>();
    static final List<String> sources = new ArrayList<>();
    static String currentVideo = "";

    static final class Track {
        final String language, url, vss;

        Track(String language, String url, String vss) {
            this.language = language;
            this.url = url;
            this.vss = vss;
        }
    }

    @Implements(CaptionAddonSupport.class)
    public static class Flags {
        @Implementation
        public static boolean aiInstalled() {
            return true;
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
        public static List<?> translatedTracks(Object manager) {
            return translated;
        }

        @Implementation
        public static List<?> nativeTracks(Object manager) {
            return nativeTracks;
        }
    }

    @Implements(CaptionActions.class)
    public static class Core {
        @Implementation
        public static void activate(Context context, String url) {
            activations.add(url);
        }

        @Implementation
        public static void activate(Context context, String url, boolean original, boolean show) {
            // Invisible prewarm is not the visible session under test.
        }

        @Implementation
        public static void activateSource(Context context, String url) {
            sources.add(url);
        }

        @Implementation
        public static String currentVideoIdSnapshot() {
            return currentVideo;
        }

        @Implementation
        public static boolean isVisibleActive() {
            return false;
        }

        @Implementation
        public static boolean ownsNativeTrack() {
            return false;
        }

        @Implementation
        public static void refreshConfiguration(Context context) {}
    }

    private Activity activity;

    @Before
    public void before() throws Exception {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionAddonSupport.initialize(activity);
        java.lang.reflect.Field context = NativeCaptionBridge.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, activity.getApplicationContext());
        CaptionActions.install(
                new CaptionPort() {
                    public void command(Action action, String value) {
                        if (action == Action.VIDEO) currentVideo = value == null ? "" : value;
                    }

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
        CaptionSessionReconciler.resetForTests();
        CaptionSessionIntent.resetForTests(activity);
        SourceCatalog.clear();
        translated.clear();
        nativeTracks.clear();
        activations.clear();
        sources.clear();
        currentVideo = VIDEO;
        DeepSeekConfig.saveEnabled(activity, true);
        CaptionSessionReconciler.onVideo(activity, VIDEO);
    }

    @After
    public void after() {
        CaptionSessionReconciler.resetForTests();
        CaptionNativeProjection.resetForTests();
        CaptionSessionIntent.resetForTests(activity);
        activity.finish();
    }

    @Test
    public void sourceRequestsAreNeverGivenAFabricatedTarget() {
        CaptionSessionIntent.userToggled(activity, true);
        CaptionSessionIntent.userSelected(activity, "ja", true);
        assertEquals(SOURCE, DeepSeekCaptionHook.rewriteUrl(null, SOURCE));
    }

    @Test
    public void anAutomaticNativeTranslationOnlyUpdatesTheProjection() {
        Track zh = new Track("zh-Hans", TRANSLATED, "t.zh-Hans");
        translated.add(zh);

        NativeCaptionBridge.onNativeSelection(new Object(), zh, Origin.DEFAULT);

        CaptionNativeProjection.Snapshot projection = CaptionNativeProjection.snapshot();
        assertEquals("zh-Hans", projection.language);
        assertTrue(projection.translated);
        CaptionSessionIntent intent = CaptionSessionIntent.load(activity);
        assertFalse("an observation must not switch AI captions on", intent.aiEnabled);
        assertFalse(intent.hasTarget());
        assertEquals(0L, intent.revision);
        assertTrue("an observation must not start a session", activations.isEmpty());
    }

    @Test
    public void anExplicitCaptionMenuSelectionIsTheUserActThatStartsTheTarget() {
        CaptionSessionIntent.userToggled(activity, true);
        // The CC control reading off is an observation; it is not a reason to refuse the user's
        // own menu selection (the removed N64 gate).
        CaptionNativeProjection.ccState(CaptionNativeProjection.OFF);
        Track zh = new Track("zh-Hans", TRANSLATED, "t.zh-Hans");
        translated.add(zh);

        NativeCaptionBridge.onNativeSelection(new Object(), zh, Origin.PREFERRED_TRACK);

        assertTrue(CaptionSessionIntent.load(activity).translateTarget);
        assertEquals("zh-Hans", CaptionSessionIntent.load(activity).targetLanguage);
        assertEquals("native translated selection starts the AI overlay", 1, activations.size());
        assertTrue(activations.get(0), activations.get(0).contains("tlang=zh-Hans"));
    }

    @Test
    public void nativeSourceSelectionDoesNotStartTranslation() {
        CaptionSessionIntent.userToggled(activity, true);
        Track en = new Track("en", SOURCE, ".en");
        nativeTracks.add(en);

        NativeCaptionBridge.onNativeSelection(new Object(), en, Origin.PREFERRED_TRACK);

        assertFalse(CaptionSessionIntent.load(activity).translateTarget);
        assertEquals("en", CaptionSessionIntent.load(activity).targetLanguage);
        assertTrue(activations.isEmpty());
        assertEquals(1, sources.size());
    }

    @Test
    public void anAutomaticallySelectedTrackWhileTheCcControlReadsOffStartsNothing() {
        CaptionNativeProjection.ccState(CaptionNativeProjection.OFF);
        Track zh = new Track("zh-Hans", TRANSLATED, "t.zh-Hans");
        translated.add(zh);

        NativeCaptionBridge.onNativeSelection(new Object(), zh, Origin.DEFAULT);

        assertTrue("an observation must not start the overlay", activations.isEmpty());
        assertEquals("zh-Hans", CaptionNativeProjection.snapshot().language);
    }
}
