package app.hushmessenger.extension;

import android.app.ActivityManager;
import android.app.Application;
import android.view.View;
import android.widget.Switch;
import java.util.Arrays;
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

/**
 * #207: settings left open with Home keep their Recents card while Keep settings in Recents is on, to come back to. #54
 * still holds: with it off, and once settings are back on screen, their task stays out of Recents, so Back leaves no card.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SettingsRecentsTest {
    @Before public void reset() {
        Application app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        Settings.hookErrors.clear();
    }

    @After public void restore() {
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
    }

    /** A task as the manifest leaves it: out of Recents. */
    private static ActivityManager.AppTask excludedTask(int id) {
        ActivityManager.AppTask task = org.robolectric.shadows.ShadowAppTask.newInstance();
        ActivityManager.RecentTaskInfo info = new ActivityManager.RecentTaskInfo();
        info.persistentId = id;
        if (android.os.Build.VERSION.SDK_INT >= 29) info.taskId = id;
        Shadows.shadowOf(task).setTaskInfo(info);
        task.setExcludeFromRecents(true);
        return task;
    }

    private static boolean excluded(ActivityManager.AppTask task) {
        return Shadows.shadowOf(task).isExcludedFromRecents();
    }

    @Test public void settingsLeftOpenKeepTheirCardOnlyWithTheSwitchOn() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity settings = screen.get();
            ActivityManager.AppTask own = excludedTask(settings.getTaskId());
            // Another task of the app's, standing in for one that has to be left alone.
            ActivityManager.AppTask other = excludedTask(settings.getTaskId() + 1);
            Shadows.shadowOf(settings.getSystemService(ActivityManager.class)).setAppTasks(Arrays.asList(other, own));

            // Off, as it starts: Home leaves no card, as #54 asked.
            screen.userLeaving().pause().stop();
            assertTrue(excluded(own));
            screen.restart().resume();

            View root = settings.getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            Switch keep = root.findViewWithTag(SettingsActivity.IN_RECENTS);
            assertNotNull(keep);
            assertFalse(keep.isChecked());
            keep.performClick();
            assertTrue(Settings.preferences.getBoolean(SettingsActivity.IN_RECENTS, false));

            screen.userLeaving().pause().stop();
            assertFalse("Left open, the card stays to come back to", excluded(own));
            assertTrue("No other task changes", excluded(other));

            screen.restart().resume();
            assertTrue("Back on screen, so Back leaves no card", excluded(own));

            // Closed with Back: Android doesn't call it leaving, so the card stays out.
            screen.pause().stop().destroy();
            assertTrue(excluded(own));
            assertTrue(Settings.hookErrors.isEmpty());
        }
    }

    @Test public void aTaskThatCantBeFoundIsLeftAlone() {
        Settings.preferences.edit().putBoolean(SettingsActivity.IN_RECENTS, true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity settings = screen.get();
            ActivityManager.AppTask other = excludedTask(settings.getTaskId() + 1);
            Shadows.shadowOf(settings.getSystemService(ActivityManager.class)).setAppTasks(Arrays.asList(other));
            screen.userLeaving().pause().stop();
            assertTrue(excluded(other));
            screen.restart().resume();
            assertTrue(excluded(other));
        }
    }
}
