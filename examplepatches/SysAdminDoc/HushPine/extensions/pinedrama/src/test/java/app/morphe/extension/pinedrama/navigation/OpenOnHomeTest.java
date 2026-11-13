package app.morphe.extension.pinedrama.navigation;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

/** Issue #6: a start PineDrama would land on Discover lands on Home. */
@RunWith(RobolectricTestRunner.class)
public class OpenOnHomeTest {
    /** Stands in for PineDrama's landing tab enum, whose class name is obfuscated. */
    enum LandingTab { DRAMA_TAB, FYP_TAB, DISCOVER_TAB }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        SettingsStatus.openOnHomeEnabled = true;
    }

    @After public void tearDown() {
        SettingsStatus.openOnHomeEnabled = false;
        Settings.OPEN_ON_HOME.save(Settings.OPEN_ON_HOME.defaultValue);
    }

    @Test public void discoverLandsOnHome() {
        assertSame(LandingTab.DRAMA_TAB, OpenOnHome.landingTab(LandingTab.DISCOVER_TAB));
    }

    @Test public void homeAndForYouStayAsPineDramaPicked() {
        assertSame(LandingTab.DRAMA_TAB, OpenOnHome.landingTab(LandingTab.DRAMA_TAB));
        assertSame(LandingTab.FYP_TAB, OpenOnHome.landingTab(LandingTab.FYP_TAB));
    }

    @Test public void offDiscoverStays() {
        Settings.OPEN_ON_HOME.save(false);
        assertSame(LandingTab.DISCOVER_TAB, OpenOnHome.landingTab(LandingTab.DISCOVER_TAB));
    }

    @Test public void withoutThePatchDiscoverStays() {
        SettingsStatus.openOnHomeEnabled = false;
        assertSame(LandingTab.DISCOVER_TAB, OpenOnHome.landingTab(LandingTab.DISCOVER_TAB));
    }

    /** An enum from a later build without a Drama constant keeps PineDrama's own answer. */
    @Test public void anEnumWithoutDramaKeepsItsTab() {
        assertSame(Other.DISCOVER_TAB, OpenOnHome.landingTab(Other.DISCOVER_TAB));
        assertNull(OpenOnHome.landingTab(null));
    }

    enum Other { DISCOVER_TAB }
}
