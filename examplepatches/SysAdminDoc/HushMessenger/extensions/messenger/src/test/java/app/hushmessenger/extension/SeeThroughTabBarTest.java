package app.hushmessenger.extension;

import android.view.View;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/** #194: the floating tab bar's pill keeps part of its alpha, by the level picked under See-through tab bar. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class SeeThroughTabBarTest {
    /** 588's dark pill fill, its hairline and its shadow. */
    private static final int FILL = 0xFF242526, EDGE = 0x1FFFFFFF, SHADOW = 0x33000000;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void offThePillKeepsMessengersColors() {
        for (int color : new int[] {FILL, EDGE, SHADOW}) assertEquals(color, SeeThroughTabBar.color(color));
    }

    @Test public void onEachColorKeepsTheLevelsShareOfItsOwnAlpha() {
        Settings.preferences.edit().putBoolean(SeeThroughTabBar.KEY, true).commit();
        // Nothing picked is Standard, 70%: 255 to 179, 0x1F to 22 and 0x33 to 36, the color itself untouched.
        assertEquals(0xB3242526, SeeThroughTabBar.color(FILL));
        assertEquals(0x16FFFFFF, SeeThroughTabBar.color(EDGE));
        assertEquals(0x24000000, SeeThroughTabBar.color(SHADOW));
        int[] fills = {0xD9242526, 0xB3242526, 0x80242526, 0x4D242526};
        for (int i = 0; i < SeeThroughTabBar.LEVELS.length; i++) {
            Settings.preferences.edit().putString(SeeThroughTabBar.LEVEL, SeeThroughTabBar.LEVELS[i]).commit();
            assertEquals(SeeThroughTabBar.LEVELS[i], fills[i], SeeThroughTabBar.color(FILL));
        }
        // A level this build doesn't know reads as Standard.
        Settings.preferences.edit().putString(SeeThroughTabBar.LEVEL, "glass").commit();
        assertEquals(0xB3242526, SeeThroughTabBar.color(FILL));
        assertEquals("a clear color stays clear", 0x00FFFFFF, SeeThroughTabBar.color(0x00FFFFFF));
    }

    @Test public void pausedOrInSafeModeThePillIsMessengers() {
        Settings.preferences.edit().putBoolean(SeeThroughTabBar.KEY, true).putBoolean("paused", true).commit();
        assertEquals(FILL, SeeThroughTabBar.color(FILL));
    }

    @Test public void theLevelsSitUnderTheSwitchAndATapSavesOne() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (SeeThroughTabBar.KEY.equals(control[0])) spec = control;
        assertNotNull(spec);
        assertEquals("tab_bar", spec[3]);
        assertTrue(spec[2].contains("Restart Messenger to see the change."));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            RadioGroup group = root.findViewWithTag("see_through_tab_bar_choices");
            assertNotNull(group);
            View row = root.findViewWithTag(SeeThroughTabBar.KEY);
            assertSame("inside the switch's block", ((View) row.getParent()).getParent(), group.getParent());
            assertEquals(SeeThroughTabBar.LEVELS.length, group.getChildCount());
            RadioButton standard = root.findViewWithTag(SeeThroughTabBar.LEVEL + "_standard");
            assertTrue("Standard shows until one is picked", standard.isChecked());
            RadioButton clear = root.findViewWithTag(SeeThroughTabBar.LEVEL + "_clear");
            assertEquals("Most see-through", clear.getText().toString());
            clear.performClick();
            assertEquals("clear", Settings.preferences.getString(SeeThroughTabBar.LEVEL, null));
            assertTrue(clear.isChecked());
            assertFalse(standard.isChecked());
            assertEquals("Most see-through shows once Messenger restarts", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void aBackupCarriesTheLevelOnlyWithTheSwitch() {
        Settings.preferences.edit().putBoolean(SeeThroughTabBar.KEY, true).putString(SeeThroughTabBar.LEVEL, "frosted").commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(SeeThroughTabBar.KEY));
        assertEquals(Map.of("paused", false, SeeThroughTabBar.KEY, true, SeeThroughTabBar.LEVEL, "frosted"), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(SeeThroughTabBar.LEVEL));
    }
}
