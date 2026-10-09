package app.morphe.extension.tiktok.live;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.util.ReflectionHelpers;
import org.robolectric.util.ReflectionHelpers.ClassParameter;

import java.util.Locale;

@RunWith(RobolectricTestRunner.class)
public class LiveControlsTest {
    private Locale savedLocale;

    @Before public void setUp() {
        savedLocale = Locale.getDefault();
        Locale.setDefault(Locale.US);
        Utils.setContext(RuntimeEnvironment.getApplication());
        SettingsStatus.liveControlsEnabled = true;
    }

    @After public void tearDown() {
        setPaused(false);
        SettingsStatus.liveControlsEnabled = false;
        Settings.STOP_LIVE_AUTO_ENTER.save(Settings.STOP_LIVE_AUTO_ENTER.defaultValue);
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(Settings.SHOW_EXACT_LIVE_VIEWERS.defaultValue);
        Locale.setDefault(savedLocale);
    }

    @Test public void offByDefaultPreviewsCountDownAsBefore() {
        assertFalse(Settings.STOP_LIVE_AUTO_ENTER.defaultValue);
        assertFalse(LiveControls.skipAutoEnter());
    }

    @Test public void onTheCountdownNeverStarts() {
        Settings.STOP_LIVE_AUTO_ENTER.save(true);
        assertTrue(LiveControls.skipAutoEnter());
    }

    @Test public void pausedPreviewsCountDownAsBefore() {
        Settings.STOP_LIVE_AUTO_ENTER.save(true);
        setPaused(true);
        assertFalse(LiveControls.skipAutoEnter());
    }

    /** A switch saved on by an earlier build does nothing after a repatch without the patch. */
    @Test public void aSavedSwitchDoesNothingWithoutItsPatch() {
        Settings.STOP_LIVE_AUTO_ENTER.save(true);
        SettingsStatus.liveControlsEnabled = false;
        assertFalse(LiveControls.skipAutoEnter());
    }

    /** Read at the call, so turning it off mid-session lets the next preview count down again. */
    @Test public void turningItOffTakesEffectAtTheNextPreview() {
        Settings.STOP_LIVE_AUTO_ENTER.save(true);
        assertTrue(LiveControls.skipAutoEnter());
        Settings.STOP_LIVE_AUTO_ENTER.save(false);
        assertFalse(LiveControls.skipAutoEnter());
    }

    @Test public void exactViewersOffByDefaultKeepsTikToksText() {
        assertFalse(Settings.SHOW_EXACT_LIVE_VIEWERS.defaultValue);
        assertEquals("1.2K+", shown(1234, "1.2K+"));
    }

    @Test public void exactViewersOnShowsTheGroupedCount() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        assertEquals("1,234", shown(1234, "1.2K+"));
        assertEquals("1,234,567", shown(1234567, "1.2M+"));
        assertEquals("987", shown(987, "987"));
        assertEquals("0", shown(0, "0"));
    }

    @Test public void exactViewersGroupsTheWayTheLocaleDoes() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        Locale.setDefault(Locale.GERMANY);
        assertEquals("1.234", shown(1234, "1.2K+"));
    }

    @Test public void pausedExactViewersKeepTikToksText() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        setPaused(true);
        assertEquals("1.2K+", shown(1234, "1.2K+"));
    }

    @Test public void exactViewersDoNothingWithoutThePatch() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        SettingsStatus.liveControlsEnabled = false;
        assertEquals("1.2K+", shown(1234, "1.2K+"));
    }

    @Test public void exactViewersIsIndependentOfTheAutoEnterSwitch() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        assertFalse(LiveControls.skipAutoEnter());
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(false);
        Settings.STOP_LIVE_AUTO_ENTER.save(true);
        assertEquals("1.2K+", shown(1234, "1.2K+"));
    }

    /** A text with no count noted before it (or a negative one) is TikTok's, untouched. */
    @Test public void aTextWithoutACountIsLeftAlone() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        assertEquals("1.2K+", LiveControls.viewerCountText("1.2K+"));
        assertEquals("--", shown(-1, "--"));
        LiveControls.noteViewerCount(1234);
        assertEquals(null, LiveControls.viewerCountText(null));
    }

    /** A count is used once: a later text can't pick up an older one. */
    @Test public void aNotedCountIsUsedOnce() {
        Settings.SHOW_EXACT_LIVE_VIEWERS.save(true);
        LiveControls.noteViewerCount(5000);
        assertEquals("5,000", LiveControls.viewerCountText("5K+"));
        assertEquals("5K+", LiveControls.viewerCountText("5K+"));
    }

    private static String shown(long count, String tiktokText) {
        LiveControls.noteViewerCount(count);
        return LiveControls.viewerCountText(tiktokText);
    }

    private static void setPaused(boolean value) {
        ReflectionHelpers.callStaticMethod(Setting.class, "setPausedForProcess",
                ClassParameter.from(boolean.class, value));
    }
}
