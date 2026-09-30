/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Default playback quality as Facebook's DASH format evaluator asks it: once as the evaluator is
 * built, which leaves the chosen quality where Facebook keeps a preselected label, and again in the
 * evaluator's custom-quality setter, which its first choice of a track calls with that label and
 * Facebook's own quality menu calls with a pick.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class QualityChoiceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The rungs of a reel's manifest as Facebook labels them (meta-public-dash.mpd). */
    private static final String[] REEL = {"240p", "270p", "360p", "480p", "540p", "640p", "720p", "1080p"};

    /** Facebook's evaluator as far as the hooks see it: the label it waits to apply and its tracks. */
    private static final class Evaluator {
        String preselected;
        final Object[] formats;

        Evaluator(String... labels) {
            formats = new Object[labels.length];
            for (int i = 0; i < labels.length; i++) formats[i] = new Format(labels[i]);
        }
    }

    private static final class Format {
        final String label;

        Format(String label) {
            this.label = label;
        }
    }

    /** Reads the fakes above the way the patch's stubs read Facebook's evaluator and tracks. */
    private static final class FakeAccess implements QualityChoice.Evaluator {
        RuntimeException failure;

        @Override
        public String preselected(Object evaluator) {
            if (failure != null) throw failure;
            return ((Evaluator) evaluator).preselected;
        }

        @Override
        public void preselect(Object evaluator, String label) {
            ((Evaluator) evaluator).preselected = label;
        }

        @Override
        public Object[] formats(Object evaluator) {
            if (failure != null) throw failure;
            return ((Evaluator) evaluator).formats;
        }

        @Override
        public String label(Object format) {
            return ((Format) format).label;
        }
    }

    private FakeAccess access;

    @Before
    public void inBuild() {
        access = new FakeAccess();
        QualityChoice.access = access;
        QualityChoice.inBuildForTests = Boolean.TRUE;
        HookStatus.clear();
    }

    @After
    public void restore() {
        QualityChoice.access = QualityChoice.PATCHED;
        QualityChoice.inBuildForTests = null;
        QualityChoice.qualityForTests = null;
        QualityChoice.forget();
        PauseForTests.resume();
        Settings.DEFAULT_PLAYBACK_QUALITY.resetToDefault();
        Settings.PLAYBACK_QUALITY.resetToDefault();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.PLAYBACK_QUALITY + ":")) return line;
        }
        return null;
    }

    /**
     * What a new video plays first: the evaluator is built, then its first choice hands whatever
     * label waits in it to the custom-quality setter. Null is Facebook's own choice as it plays.
     */
    private static String firstChoice(Evaluator evaluator) {
        QualityChoice.evaluatorBuilt(evaluator);
        String waiting = evaluator.preselected;
        return waiting == null ? null : QualityChoice.customQuality(evaluator, waiting);
    }

    @Test
    public void eachChoicePicksItsRung() {
        assertNull(PlaybackQuality.AUTO.pick(Arrays.asList(REEL)));
        assertEquals("240p", PlaybackQuality.DATA_SAVER.pick(Arrays.asList(REEL)));
        assertEquals("480p", PlaybackQuality.P480.pick(Arrays.asList(REEL)));
        assertEquals("720p", PlaybackQuality.P720.pick(Arrays.asList(REEL)));
        assertEquals("1080p", PlaybackQuality.HIGHEST.pick(Arrays.asList(REEL)));

        // A ceiling takes the closest rung above when a video has nothing that low.
        assertEquals("720p", PlaybackQuality.P480.pick(Arrays.asList("1080p", "720p")));
        assertEquals("360p", PlaybackQuality.P720.pick(Arrays.asList("240p", "360p")));
        // Labels are Facebook's, whatever order its tracks come in, and one it doesn't write as a
        // quality is skipped rather than guessed.
        assertEquals("406p", PlaybackQuality.P480.pick(Arrays.asList("HD", null, "", "1080p", "406p", "720P")));
        assertEquals("720P", PlaybackQuality.HIGHEST.pick(Arrays.asList("HD", "406p", "720P")));
        assertNull(PlaybackQuality.HIGHEST.pick(Arrays.asList(null, "HD", "p", "10000p")));
        assertNull(PlaybackQuality.DATA_SAVER.pick(Collections.emptyList()));
        assertNull(PlaybackQuality.DATA_SAVER.pick(null));

        for (PlaybackQuality quality : PlaybackQuality.values()) {
            assertSame(quality, PlaybackQuality.fromFile(quality.fileValue));
        }
        assertNull(PlaybackQuality.fromFile("P720"));
        assertNull(PlaybackQuality.fromFile(720));
    }

    /** Picked in Morphe Manager, the switch is on and the quality is Facebook's, so nothing changes. */
    @Test
    public void onItsDefaultsFacebookPicksTheQuality() {
        assertTrue("picking the patch is the choice to use it", Settings.DEFAULT_PLAYBACK_QUALITY.get());
        assertSame(PlaybackQuality.AUTO, Settings.PLAYBACK_QUALITY.get());
        Evaluator video = new Evaluator(REEL);
        assertNull(firstChoice(video));
        assertNull("the evaluator was given a label to wait with", video.preselected);
        assertEquals(FamilyNames.PLAYBACK_QUALITY + ": invoked 1, 0 found, 0 missing", statusLine());
    }

    /** The acceptance: a chosen quality is what a new video plays first, where the video offers it. */
    @Test
    public void aNewVideoStartsAtTheChosenQuality() {
        String[][] expected = {
                {PlaybackQuality.DATA_SAVER.name(), "240p"},
                {PlaybackQuality.P480.name(), "480p"},
                {PlaybackQuality.P720.name(), "720p"},
                {PlaybackQuality.HIGHEST.name(), "1080p"},
        };
        for (String[] row : expected) {
            Settings.PLAYBACK_QUALITY.save(PlaybackQuality.valueOf(row[0]));
            assertEquals(row[0], row[1], firstChoice(new Evaluator(REEL)));
        }
        // A video whose lowest rung is above the ceiling plays that rung.
        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.P480);
        assertEquals("720p", firstChoice(new Evaluator("1080p", "720p")));
        assertEquals(FamilyNames.PLAYBACK_QUALITY + ": invoked 10, 1 found, 0 missing. Counted: "
                + QualityChoice.APPLIED + " 5", statusLine());
    }

    /** A track group with no quality labels, such as a video's sound, is left to Facebook. */
    @Test
    public void tracksWithoutQualitiesAreLeftToFacebook() {
        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.DATA_SAVER);
        assertNull(firstChoice(new Evaluator(null, null)));
        assertNull(firstChoice(new Evaluator()));
        assertEquals(FamilyNames.PLAYBACK_QUALITY + ": invoked 4, 0 found, 0 missing", statusLine());
    }

    /** Facebook's own preselected label and a pick in its quality menu go through untouched. */
    @Test
    public void facebooksOwnChoicesWin() {
        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.HIGHEST);
        Evaluator preselected = new Evaluator(REEL);
        preselected.preselected = "540p";
        assertEquals("540p", firstChoice(preselected));

        Evaluator playing = new Evaluator(REEL);
        assertEquals("1080p", firstChoice(playing));
        assertEquals("AUTO", QualityChoice.customQuality(playing, "AUTO"));
        assertEquals("360p", QualityChoice.customQuality(playing, "360p"));
        assertNull(QualityChoice.customQuality(playing, null));
    }

    @Test
    public void offPausedOrNotInTheBuildFacebookPicks() {
        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.DATA_SAVER);
        Settings.DEFAULT_PLAYBACK_QUALITY.save(false);
        assertNull(firstChoice(new Evaluator(REEL)));
        Settings.DEFAULT_PLAYBACK_QUALITY.save(true);

        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            assertNull(reason.name(), firstChoice(new Evaluator(REEL)));
        }
        PauseForTests.resume();

        QualityChoice.inBuildForTests = Boolean.FALSE;
        assertNull(firstChoice(new Evaluator(REEL)));
        QualityChoice.inBuildForTests = Boolean.TRUE;
        assertEquals("240p", firstChoice(new Evaluator(REEL)));
    }

    /** A label left by a build of this patch with a quality this one doesn't know is Facebook's to choose. */
    @Test
    public void aLabelNoTrackHasIsFacebooksToChoose() {
        assertNull(QualityChoice.customQuality(new Evaluator(REEL), QualityChoice.TOKEN + "4k"));
        assertNull(QualityChoice.customQuality(new Evaluator(REEL), QualityChoice.TOKEN));
    }

    @Test
    public void aFailureIsReportedAndFacebookPicks() {
        Settings.PLAYBACK_QUALITY.save(PlaybackQuality.P720);
        Evaluator video = new Evaluator(REEL);
        access.failure = new IllegalStateException("the stub failed");
        assertNull(firstChoice(video));
        assertNull(video.preselected);
        access.failure = null;
        QualityChoice.evaluatorBuilt(video);
        String waiting = video.preselected;
        access.failure = new IllegalStateException("the stub failed");
        assertNull("a failure left the evaluator a label no track has", QualityChoice.customQuality(video, waiting));
        assertTrue(HookStatus.missing(FamilyNames.PLAYBACK_QUALITY).get(0)
                .startsWith("a working 'evaluator built' hook (it threw "));
        assertFalse(HookStatus.missing(FamilyNames.PLAYBACK_QUALITY).isEmpty());
    }

    /** Until the patch fills the stubs in, no evaluator gets a label and every track has none. */
    @Test
    public void theStubsAnswerNothing() {
        assertNull(QualityChoice.preselectedLabel(new Object()));
        assertNull(QualityChoice.trackFormats(new Object()));
        assertNull(QualityChoice.formatLabel(new Object()));
    }
}
