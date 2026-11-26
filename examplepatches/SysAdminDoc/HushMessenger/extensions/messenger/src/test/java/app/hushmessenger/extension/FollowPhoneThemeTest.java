package app.hushmessenger.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/** #232: Follow your phone's dark mode, and every HushMessenger screen that reads the Light theme agreeing with it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class FollowPhoneThemeTest {
    private boolean answered;

    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
        answered = ReflectionHelpers.getStaticField(MaterialYouTheme.class, "answered");
        // Before Messenger says its theme, chat bars go by these settings' look.
        ReflectionHelpers.setStaticField(MaterialYouTheme.class, "answered", false);
    }

    @After public void restore() {
        ReflectionHelpers.setStaticField(MaterialYouTheme.class, "answered", answered);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
    }

    private static void phone(boolean night) {
        RuntimeEnvironment.setQualifiers(night ? "+night" : "+notnight");
    }

    private static void choose(boolean follow, boolean light) {
        Settings.preferences.edit().putBoolean(SettingsTheme.FOLLOW_PHONE, follow).putBoolean(SettingsTheme.LIGHT, light)
            .putBoolean(LocalChatSearch.KEY, true).commit();
    }

    private static int background(View view) {
        return ((ColorDrawable) view.getBackground()).getColor();
    }

    private static View settingsRoot(Activity activity) {
        return ((ViewGroup) activity.findViewById(android.R.id.content)).getChildAt(0);
    }

    @Test public void theChoiceResolvesForEveryMixOfSwitchesAndPhone() {
        for (boolean follow : new boolean[] {false, true}) for (boolean light : new boolean[] {false, true})
            for (boolean night : new boolean[] {false, true}) {
                phone(night);
                choose(follow, light);
                boolean expected = follow ? !night : light;
                String mix = "follow " + follow + ", light " + light + ", night " + night;
                assertEquals(mix, expected, SettingsTheme.light(RuntimeEnvironment.getApplication()));
                assertEquals(mix + ", no context", expected, SettingsTheme.light(null));
            }
    }

    @Test public void aPhoneWithNoSaidModeReadsAsLight() {
        Configuration configuration = new Configuration();
        configuration.uiMode = Configuration.UI_MODE_TYPE_NORMAL | Configuration.UI_MODE_NIGHT_UNDEFINED;
        assertFalse(SettingsTheme.nightMode(configuration));
        configuration.uiMode = Configuration.UI_MODE_TYPE_NORMAL | Configuration.UI_MODE_NIGHT_NO;
        assertFalse(SettingsTheme.nightMode(configuration));
        configuration.uiMode = Configuration.UI_MODE_TYPE_NORMAL | Configuration.UI_MODE_NIGHT_YES;
        assertTrue(SettingsTheme.nightMode(configuration));
    }

    @Test public void everyScreenThatReadsTheThemeAgrees() {
        Intent search = new Intent(RuntimeEnvironment.getApplication(), LocalSearchActivity.class)
            .putExtra(LocalSearchActivity.EXTRA_CHAT_KEY, "ONE_TO_ONE:111:42");
        int light = new SettingsUi(RuntimeEnvironment.getApplication(), true).background;
        int dark = new SettingsUi(RuntimeEnvironment.getApplication(), false).background;
        assertNotEquals(light, dark);
        for (boolean follow : new boolean[] {false, true}) for (boolean lightChoice : new boolean[] {false, true})
            for (boolean night : new boolean[] {false, true}) {
                phone(night);
                choose(follow, lightChoice);
                int expected = (follow ? !night : lightChoice) ? light : dark;
                String mix = "follow " + follow + ", light " + lightChoice + ", night " + night;
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    assertEquals(mix + ": settings", expected, background(settingsRoot(screen.get())));
                }
                try (var screen = Robolectric.buildActivity(RestartActivity.class).setup()) {
                    assertEquals(mix + ": restart", expected,
                        background(screen.get().findViewById(android.R.id.content).findViewWithTag("restart_page")));
                }
                try (var screen = Robolectric.buildActivity(LocalSearchActivity.class, search).setup()) {
                    assertFalse(mix, screen.get().isFinishing());
                    assertEquals(mix + ": search", expected, background(settingsRoot(screen.get())));
                }
                assertEquals(mix + ": chat bars", expected == light, MaterialYouTheme.chatIsLight());
            }
    }

    /** Nobody has touched the new switch: dark, as before, in either phone mode, with Light theme still usable. */
    @Test public void anExistingInstallLooksTheSame() {
        int dark = new SettingsUi(RuntimeEnvironment.getApplication(), false).background;
        for (boolean night : new boolean[] {false, true}) {
            phone(night);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                assertEquals(dark, background(settingsRoot(screen.get())));
                Switch follow = root.findViewWithTag(SettingsTheme.FOLLOW_PHONE);
                assertNotNull(follow);
                assertFalse(follow.isChecked());
                assertTrue(((Switch) root.findViewWithTag(SettingsTheme.LIGHT)).isEnabled());
                assertNull(root.findViewWithTag("unavailable_light"));
                // The new switch sits right under Light theme, in the same panel.
                View lightRow = (View) root.findViewWithTag(SettingsTheme.LIGHT).getParent();
                View followRow = (View) follow.getParent();
                ViewGroup panel = (ViewGroup) lightRow.getParent();
                assertSame(panel, followRow.getParent());
                assertEquals(panel.indexOfChild(lightRow) + 1, panel.indexOfChild(followRow));
            }
            assertFalse(MaterialYouTheme.chatIsLight());
        }
    }

    /** While the phone decides, Light theme is dimmed with why, and keeps its choice; nothing else on the page moves. */
    @Test public void lightThemeWaitsInPlaceWhileThePhoneDecides() {
        phone(false);
        choose(false, true);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Activity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            View lightRow = (View) root.findViewWithTag(SettingsTheme.LIGHT).getParent();
            ViewGroup panel = (ViewGroup) lightRow.getParent();
            int at = panel.indexOfChild(lightRow);
            ((Switch) root.findViewWithTag(SettingsTheme.FOLLOW_PHONE)).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(Settings.preferences.getBoolean(SettingsTheme.FOLLOW_PHONE, false));
            // Still light, so the page stays and only the row is rebuilt.
            assertSame(activity, screen.get());
            assertFalse(activity.isFinishing());
            assertFalse((boolean) ReflectionHelpers.getField(activity, "recreatingTheme"));
            Switch waiting = root.findViewWithTag(SettingsTheme.LIGHT);
            assertFalse(waiting.isEnabled());
            assertTrue("the choice is kept", waiting.isChecked());
            assertSame(panel, waiting.getParent().getParent());
            assertEquals(at, panel.indexOfChild((View) waiting.getParent()));
            View why = root.findViewWithTag("unavailable_light");
            assertNotNull(why);
            assertEquals(new SettingsText(activity).get("light_follows_phone"),
                ((android.widget.TextView) why).getText().toString());
            ((Switch) root.findViewWithTag(SettingsTheme.FOLLOW_PHONE)).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Switch back = root.findViewWithTag(SettingsTheme.LIGHT);
            assertTrue(back.isEnabled());
            assertTrue(back.isChecked());
            assertNull(root.findViewWithTag("unavailable_light"));
            assertEquals(at, panel.indexOfChild((View) back.getParent()));
            assertTrue(Settings.preferences.getBoolean(SettingsTheme.LIGHT, false));
        }
    }

    /** Turning it on when the phone's look differs remakes the page in that look. */
    @Test public void turningItOnRemakesThePageWhenThePhoneDiffers() {
        phone(false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Activity activity = screen.get();
            ((Switch) activity.getWindow().getDecorView().findViewWithTag(SettingsTheme.FOLLOW_PHONE)).performClick();
            assertTrue((boolean) ReflectionHelpers.getField(activity, "recreatingTheme"));
            // The remake runs from the main looper, before the screen closes.
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals(new SettingsUi(screen.get(), true).background, background(settingsRoot(screen.get())));
        }
    }

    /** The phone switching modes while settings are open: Android remakes the page, and it comes back in the new look. */
    @Test public void aLiveChangeOfThePhonesModeRemakesSettingsInTheNewLook() {
        int light = new SettingsUi(RuntimeEnvironment.getApplication(), true).background;
        int dark = new SettingsUi(RuntimeEnvironment.getApplication(), false).background;
        phone(false);
        choose(true, false);
        ActivityController<SettingsActivity> screen = Robolectric.buildActivity(SettingsActivity.class).setup();
        try {
            assertEquals(light, background(settingsRoot(screen.get())));
            SettingsActivity before = screen.get();
            phone(true);
            screen.configurationChange(RuntimeEnvironment.getApplication().getResources().getConfiguration());
            assertNotEquals("remade", before, screen.get());
            assertEquals(dark, background(settingsRoot(screen.get())));
            phone(false);
            screen.configurationChange(RuntimeEnvironment.getApplication().getResources().getConfiguration());
            assertEquals(light, background(settingsRoot(screen.get())));
        } finally {
            screen.close();
        }
    }

    /** A Root Mount host screen can take the change itself; settings remake themselves only when the look changes. */
    @Test public void aHostScreenThatKeepsTheChangeStillFollows() {
        phone(false);
        choose(true, false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            phone(true);
            activity.onConfigurationChanged(RuntimeEnvironment.getApplication().getResources().getConfiguration());
            assertTrue((boolean) ReflectionHelpers.getField(activity, "recreatingTheme"));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        // With the Light theme switch deciding, the phone's mode changes nothing.
        phone(false);
        choose(false, false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            phone(true);
            activity.onConfigurationChanged(RuntimeEnvironment.getApplication().getResources().getConfiguration());
            assertFalse((boolean) ReflectionHelpers.getField(activity, "recreatingTheme"));
        }
    }
}
