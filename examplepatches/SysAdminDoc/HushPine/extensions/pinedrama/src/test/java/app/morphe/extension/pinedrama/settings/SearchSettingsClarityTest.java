package app.morphe.extension.pinedrama.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.os.Bundle;
import android.preference.Preference;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.preference.PineDramaPreferenceFragment;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.LinkedHashMap;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en-w480dp-h960dp-night-mdpi")
@SuppressWarnings("deprecation")
public class SearchSettingsClarityTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final Map<Field, Boolean> statuses = new LinkedHashMap<>();

    @Before public void enableControls() throws Exception {
        for (Field field : SettingsStatus.class.getDeclaredFields()) {
            if (field.getType() == boolean.class && Modifier.isStatic(field.getModifiers())) {
                statuses.put(field, field.getBoolean(null));
                field.setBoolean(null, true);
            }
        }
    }

    @After public void restoreControls() throws Exception {
        for (var entry : statuses.entrySet()) entry.getKey().setBoolean(null, entry.getValue());
    }

    @Test public void bottomSearchNamesItsStripAndExplainsSpaceRecovery() {
        assertRow("INTERFACE", "hide_bottom_search_bar", "Hide the search bar below videos", "space");
        assertRow("INTERFACE", "hide_bottom_search_bar", "Hide the search bar below videos", "comments");
    }

    /**
     * #186. The Turn on Thoughts row says where Thoughts show up and that posting one is still
     * PineDrama's call. It needs both Thoughts gates, which a build can leave out while the bubble
     * hider applies, so the hider's row stays without it.
     */
    @Test public void thoughtsRowSaysWhereAndThatPostingIsStillTikToksCall() {
        assertRow("BEHAVIOR", "enable_thoughts", "Turn on Thoughts", "in your inbox");
        assertRow("BEHAVIOR", "enable_thoughts", "Turn on Thoughts", "may still refuse to post one");
        assertRow("BEHAVIOR", "enable_thoughts", "Turn on Thoughts", "Restart PineDrama");

        SettingsStatus.thoughtsSwitchEnabled = false;
        onPage("BEHAVIOR", page -> {
            assertNull("the Thoughts row outlived its gates", page.findPreference("enable_thoughts"));
            assertNotNull("the bubble hider follows its own flag", page.findPreference("hide_profile_thoughts"));
        });
    }

    private void assertRow(String section, String key, String title, String detail) {
        onPage(section, page -> {
            Preference row = page.findPreference(key);
            assertNotNull("Missing independent setting: " + key, row);
            assertEquals(title, row.getTitle().toString());
            assertTrue(key + " must explain its location and behavior", row.getSummary().toString().contains(detail));
        });
    }

    private void onPage(String section, java.util.function.Consumer<PineDramaPreferenceFragment> check) {
        try (var owner = Robolectric.buildActivity(SettingsPagesTest.PageActivity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            PineDramaPreferenceFragment page = new PineDramaPreferenceFragment();
            Bundle args = new Bundle();
            args.putString("morphe_settings_section", section);
            page.setArguments(args);
            activity.getFragmentManager().beginTransaction().replace(android.R.id.content, page).commit();
            activity.getFragmentManager().executePendingTransactions();
            check.accept(page);
        }
    }
}
