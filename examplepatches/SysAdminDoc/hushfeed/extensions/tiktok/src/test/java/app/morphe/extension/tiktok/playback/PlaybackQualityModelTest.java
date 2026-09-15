package app.morphe.extension.tiktok.playback;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.os.Looper;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.LogBufferManager;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

/**
 * What the quality picker does with a model string it cannot pick a gear out of.
 *
 * <p>Issue #3 is a screenshot of {@code PlaybackQuality: Could not read the playback quality
 * model} sitting over the feed, once per video, on a build whose model getter hands back an
 * empty string. The message was right and the channel was wrong: it is written for whoever is
 * fixing the code, it is English on a phone set to any language, and a per-video path repeats
 * it forever. These pin the channel it moved to, and that the getter is named there.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class PlaybackQualityModelTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        // The worst case for the reader: diagnostic logging on, so the error toast that used to
        // carry this is armed. A test that left it off could not tell the two channels apart.
        BaseSettings.DEBUG.save(true);
        BaseSettings.DEBUG_LOG_FILTERS.save("errors");
        Settings.PLAYBACK_QUALITY.save("lowest");
        PlaybackQuality.resetForTests();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        ShadowToast.reset();
    }

    @After public void tearDown() {
        BaseSettings.DEBUG.resetToDefault();
        BaseSettings.DEBUG_LOG_FILTERS.resetToDefault();
        Settings.PLAYBACK_QUALITY.resetToDefault();
        PlaybackQuality.resetForTests();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
        ShadowToast.reset();
    }

    private static void settle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void aModelThatIsNotAnObjectComesBackUntouchedAndNeverReachesTheScreen() {
        for (String unusable : List.of("", "   ", "[]", "not json", "\"a string\"", "null")) {
            assertSame(unusable, PlaybackQuality.filterVideoModelJson(unusable));
        }
        settle();

        assertNull("No failure inside the bundle belongs on the feed",
                ShadowToast.getTextOfLatestToast());
        String report = LogBufferManager.buildExportText();
        assertFalse(report, report.contains("Could not read the playback quality model"));
    }

    @Test public void theGetterThatHandedBackTheUnusableModelIsNamedOnce() {
        // Six unusable strings, one getter. Hook status is a statement about the build, so it
        // says the getter once however many videos go past.
        for (String unusable : List.of("", "   ", "[]", "not json", "\"a string\"", "null")) {
            PlaybackQuality.filterVideoModelJson(unusable);
        }

        List<String> missing = HookStatus.missing(PlaybackQuality.FAMILY);
        assertEquals("Expected one miss, got " + missing, 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(
                PlaybackQuality.VIDEO_MODEL + "#" + PlaybackQuality.VIDEO_MODEL_GETTER));

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains(PlaybackQuality.FAMILY));
        assertTrue(report, report.contains(PlaybackQuality.VIDEO_MODEL_GETTER));
    }

    @Test public void eachModelGetterAnswersForItself() {
        PlaybackQuality.filterVideoModelJson("");
        PlaybackQuality.filterDashVideoModelJson("");

        List<String> missing = HookStatus.missing(PlaybackQuality.FAMILY);
        assertEquals("Expected both getters, got " + missing, 2, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains(PlaybackQuality.VIDEO_MODEL_GETTER));
        assertTrue(missing.toString(), missing.get(1).contains(PlaybackQuality.DASH_MODEL_GETTER));
    }

    @Test public void anOrdinaryVideoWithNoAdaptiveGearsIsNotAMiss() {
        // A readable model with nothing to choose from is the common case, not a broken build.
        String plain = "{\"video_id\":\"one\"}";
        assertSame(plain, PlaybackQuality.filterVideoModelJson(plain));

        assertEquals(List.of(), HookStatus.missing(PlaybackQuality.FAMILY));
        assertFalse(HookStatus.anyMissing());
        List<String> report = HookStatus.report();
        assertEquals("Expected the family to report as bound, got " + report, 1, report.size());
        assertTrue(report.get(0), report.get(0).startsWith(PlaybackQuality.FAMILY + ": 1 found"));
    }

    @Test public void aModelThatStopsPartWayThroughIsTreatedTheSameWay() {
        // Well formed enough to start, truncated in the middle: the JSON reader is the only
        // thing that can tell, so this is the branch the catch still has to cover.
        String truncated = "{\"dynamic_video\":{\"dynamic_video_list\":[";
        assertSame(truncated, PlaybackQuality.filterVideoModelJson(truncated));
        settle();

        assertNull(ShadowToast.getTextOfLatestToast());
        assertEquals(1, HookStatus.missing(PlaybackQuality.FAMILY).size());
    }
}
