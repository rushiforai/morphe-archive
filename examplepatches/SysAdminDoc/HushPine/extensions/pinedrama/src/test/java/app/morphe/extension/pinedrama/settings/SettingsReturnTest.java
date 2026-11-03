/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.preference.PineDramaPreferenceFragment;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** A restart pressed on a settings page lands back on that page, once, and only soon after. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class SettingsReturnTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private SharedPreferences preferences;
    private final List<String> opened = new ArrayList<>();

    @Before public void freshPreferences() {
        preferences = RuntimeEnvironment.getApplication()
                .getSharedPreferences("settings-return-test", Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
    }

    @Test public void theMarkerRoundTripsAndIsClearedBeforeThePageOpens() {
        assertTrue(SettingsReturn.remember(preferences, "section:PRIVACY", 1_000L));
        boolean[] markerGoneWhenOpened = {false};

        String page = SettingsReturn.consume(preferences, 31_000L, name -> {
            markerGoneWhenOpened[0] = !preferences.contains(SettingsReturn.PAGE_KEY)
                    && !preferences.contains(SettingsReturn.AT_KEY);
            opened.add(name);
        });

        assertEquals("section:PRIVACY", page);
        assertEquals(Collections.singletonList("section:PRIVACY"), opened);
        assertTrue("the page opened while its marker could still open it a second time",
                markerGoneWhenOpened[0]);
        assertNull("the next start opened the page again",
                SettingsReturn.consume(preferences, 32_000L, opened::add));
        assertEquals(1, opened.size());
    }

    @Test public void aMarkerOlderThanNinetySecondsIsDroppedUnopened() {
        SettingsReturn.remember(preferences, "hub:ABOUT", 1_000L);

        assertNull(SettingsReturn.consume(preferences, 1_000L + SettingsReturn.WINDOW_MS + 1, opened::add));

        assertTrue(opened.isEmpty());
        assertFalse("a stale marker was left to open later", preferences.contains(SettingsReturn.PAGE_KEY));
        assertFalse(preferences.contains(SettingsReturn.AT_KEY));
    }

    @Test public void aMarkerFromBeforeThePhoneRestartedIsDropped() {
        // The clock counts from boot, so a marker written before a reboot reads as being ahead.
        SettingsReturn.remember(preferences, "search", 500_000L);

        assertNull(SettingsReturn.consume(preferences, 10_000L, opened::add));
        assertTrue(opened.isEmpty());
        assertFalse(preferences.contains(SettingsReturn.PAGE_KEY));
    }

    @Test public void legacyCategoryMarkersRemainAcceptedByTheMainListFactory() {
        assertNotNull(PineDramaPreferenceFragment.forPage("section:PRIVACY"));
        assertNotNull(PineDramaPreferenceFragment.forPage("hub:ABOUT"));
        assertNotNull(PineDramaPreferenceFragment.forPage("search"));
        assertNotNull(PineDramaPreferenceFragment.home(PineDramaPreferenceFragment.PAGE_HOME));
        assertNull("the legacy factory duplicated the main page",
                PineDramaPreferenceFragment.forPage(PineDramaPreferenceFragment.PAGE_HOME));
        assertNull("a page this build doesn't have opened something",
                PineDramaPreferenceFragment.forPage("section:NO_SUCH_PAGE"));
    }

    /**
     * The marker carries the row that was at the top of the screen after a #, and the page it
     * opens comes back scrolled there. Legacy section markers configure that same main list.
     * A marker with nothing after the # has no saved row.
     */
    @Test public void aMarkerCarriesTheRowItWasScrolledTo() {
        PineDramaPreferenceFragment privacy = PineDramaPreferenceFragment.forPage("section:PRIVACY#hide_root");
        assertEquals("PRIVACY", privacy.getArguments().getString("morphe_settings_section"));
        assertEquals("hide_root", privacy.getArguments().getString("morphe_settings_return_row"));
        assertNull(PineDramaPreferenceFragment.forPage("section:PRIVACY#").getArguments()
                .getString("morphe_settings_return_row"));
        assertNull("the legacy factory duplicated a scrolled main page",
                PineDramaPreferenceFragment.forPage("home#paused"));
        assertEquals("paused", PineDramaPreferenceFragment.home("home#paused").getArguments()
                .getString("morphe_settings_return_row"));
        PineDramaPreferenceFragment main = PineDramaPreferenceFragment.home("section:PRIVACY#hide_root");
        assertEquals("PRIVACY", main.getArguments().getString("morphe_settings_section"));
        assertEquals("hide_root", main.getArguments().getString("morphe_settings_return_row"));
        assertEquals("ABOUT", PineDramaPreferenceFragment.home("hub:ABOUT").getArguments()
                .getString("morphe_settings_hub"));
        assertTrue(PineDramaPreferenceFragment.home("search").getArguments()
                .getBoolean("morphe_settings_search"));
        for (String marker : new String[]{null, "home", "home#"}) {
            android.os.Bundle arguments = PineDramaPreferenceFragment.home(marker).getArguments();
            assertTrue(marker + " invented a saved row", arguments == null
                    || arguments.getString("morphe_settings_return_row") == null);
        }
    }

    @Test public void inlineMarkersCarryExpandedCategoriesAlongsideTheSavedRow() {
        for (String prefix : new String[]{"home", "search"}) {
            PineDramaPreferenceFragment main = PineDramaPreferenceFragment.home(prefix + ":PLAYBACK,COMMENTS#auto_advance");
            assertEquals(java.util.Arrays.asList("PLAYBACK", "COMMENTS"),
                    main.getArguments().getStringArrayList("morphe_initial_expanded_settings"));
            assertEquals("auto_advance", main.getArguments().getString("morphe_settings_return_row"));
            assertEquals("search".equals(prefix), main.getArguments().getBoolean("morphe_settings_search"));
            assertNotNull(PineDramaPreferenceFragment.forPage(prefix + ":PLAYBACK,COMMENTS#auto_advance"));
        }
    }

    /**
     * A marker written by the build before the home page listed every page names one of the four
     * groups that sat in between. Those are gone, so the start keeps the main list.
     */
    @Test public void aMarkerNamingARemovedGroupOpensTheHomePage() {
        for (String group : new String[]{"hub:FEED_LAYOUT", "hub:COMMENTS_INBOX",
                "hub:DOWNLOADS_SHARING", "hub:APP_ADVANCED"}) {
            assertNull(group + " opened a page over the home page", PineDramaPreferenceFragment.forPage(group));
        }
    }
}
