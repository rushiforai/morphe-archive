package app.hushmessenger.extension;

import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.view.View;
import android.widget.Switch;
import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ShareStoryTest {
    private static final Object RUN = new Object();
    private static final Object SKIP = new Object();

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.storyTargetWanted = null;
        CrashGuard.resetForTests();
    }

    @After public void restore() {
        Settings.storyTargetWanted = null;
        Settings.initialize(RuntimeEnvironment.getApplication());
    }

    @Test public void theSwitchDropsYourStoryFromBothLoaders() {
        assertTrue(Settings.keepShareStory(true));
        assertSame(RUN, Settings.shareStorySection(RUN, SKIP));
        assertEquals(0, Settings.lastActive("share_story"));
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        assertFalse(Settings.keepShareStory(true));
        assertTrue(Settings.lastActive("share_story") > 0);
        Settings.activeAt.clear();
        assertSame(SKIP, Settings.shareStorySection(RUN, SKIP));
        assertTrue(Settings.lastActive("share_story") > 0);
        Settings.preferences.edit().putBoolean("share_story", false).commit();
        assertTrue("The next share after switching off offers the story again", Settings.keepShareStory(true));
        assertSame(RUN, Settings.shareStorySection(RUN, SKIP));
    }

    @Test public void messengersOwnNoStaysNoAndIsntCountedAsAUse() {
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        assertFalse(Settings.keepShareStory(false));
        assertSame(SKIP, Settings.shareStorySection(SKIP, SKIP));
        assertEquals(0, Settings.lastActive("share_story"));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepTheStory() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("share_story", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertTrue(state, Settings.keepShareStory(true));
            assertSame(state, RUN, Settings.shareStorySection(RUN, SKIP));
            assertEquals(state, 0, Settings.lastActive("share_story"));
        }
    }

    private static ComponentName storyTarget() {
        var app = RuntimeEnvironment.getApplication();
        var target = new ComponentName(app, Settings.STORY_SHARE_ACTIVITY);
        Shadows.shadowOf(app.getPackageManager()).addActivityIfNotPresent(target);
        return target;
    }

    private static int state(ComponentName target) {
        return RuntimeEnvironment.getApplication().getPackageManager().getComponentEnabledSetting(target);
    }

    /** #147: the chat list's own answer for Your story in other apps' share sheets reads as off while the switch is on. */
    @Test public void theChatListsYourStoryShareTargetAnswerReadsOffWhileTheSwitchIsOn() {
        assertTrue(Settings.storyShareTarget(1));
        assertFalse(Settings.storyShareTarget(0));
        assertEquals(0, Settings.lastActive("share_story"));
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        assertFalse(Settings.storyShareTarget(1));
        assertTrue(Settings.lastActive("share_story") > 0);
        Settings.activeAt.clear();
        assertFalse("Messenger's own no stays no", Settings.storyShareTarget(0));
        assertEquals(0, Settings.lastActive("share_story"));
        Settings.preferences.edit().putBoolean("share_story", false).commit();
        assertTrue("The next chat list after switching off offers the story again", Settings.storyShareTarget(1));
    }

    @Test public void offPauseSafeModeAndAMissingControlHandMessengersShareTargetAnswerBack() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("share_story", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertTrue(state, Settings.storyShareTarget(1));
            assertFalse(state, Settings.storyShareTarget(0));
            assertEquals(state, 0, Settings.lastActive("share_story"));
        }
    }

    /** The share sheet reads the target as it opens, so the switch and Pause move it now, not at the next chat list. */
    @Test public void theSwitchAndPauseMoveTheShareTargetRightAway() {
        ComponentName target = storyTarget();
        Settings.storyShareTarget(1);
        OpenSections.only("photos_videos");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_controls").performClick();
            Switch story = root.findViewWithTag("share_story");
            story.setChecked(true);
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, state(target));
            Switch pause = root.findViewWithTag("paused");
            pause.setChecked(true);
            assertEquals("Pause gives Messenger's answer back", PackageManager.COMPONENT_ENABLED_STATE_ENABLED, state(target));
            pause.setChecked(false);
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, state(target));
            story.setChecked(false);
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_ENABLED, state(target));
            // Messenger said no last time, so switching on and off again leaves it off.
            Settings.storyShareTarget(0);
            story.setChecked(true);
            story.setChecked(false);
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, state(target));
        }
    }

    @Test public void beforeMessengerAnswersOnlyTheSwitchMovesTheShareTarget() {
        ComponentName target = storyTarget();
        Settings.storyTargetWanted = null;
        Settings.syncStoryShareTarget(RuntimeEnvironment.getApplication());
        assertEquals("Off with no answer yet leaves the target to Messenger", PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, state(target));
        Settings.preferences.edit().putBoolean("share_story", true).commit();
        Settings.syncStoryShareTarget(RuntimeEnvironment.getApplication());
        assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, state(target));
        Settings.installed = Collections.emptySet();
        Settings.preferences.edit().putBoolean("share_story", false).commit();
        Settings.storyShareTarget(1);
        Settings.syncStoryShareTarget(RuntimeEnvironment.getApplication());
        assertEquals("A build without the switch never touches the target", PackageManager.COMPONENT_ENABLED_STATE_DISABLED, state(target));
    }

    @Test public void theSwitchSitsUnderPhotosAndVideosAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("share_story")) spec = control;
        assertNotNull(spec);
        assertEquals("Hide Your story when sharing", spec[1]);
        assertEquals("photos_videos", spec[3]);
        assertTrue(Settings.installed.contains("share_story"));
        assertFalse(Settings.preferences.getBoolean("share_story", false));
        assertFalse("Checked on a phone, so it carries no Experimental tag", SettingsActivity.EXPERIMENTAL.contains("share_story"));
    }
}
