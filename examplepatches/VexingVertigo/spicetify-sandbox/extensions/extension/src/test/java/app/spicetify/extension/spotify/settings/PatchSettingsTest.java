package app.spicetify.extension.spotify.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import app.spicetify.extension.spotify.privacy.SharingLinks;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class PatchSettingsTest {
    private static final String LINK = "https://open.spotify.com/episode/example?si=tracking&t=42&context=album";
    private Application application;

    @Before
    public void initialize() {
        application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
    }

    @Test
    public void newInstallationCleansSharingByDefault() {
        assertTrue(PatchSettings.cleanSharingEnabled());
        assertEquals("https://open.spotify.com/episode/example?t=42&context=album",
                SharingLinks.onShareUrl(LINK));
    }

    @Test
    public void disablingPreservesTheExactLinkAndReenablingCleansIt() {
        PatchSettings.setCleanSharingEnabled(false);
        assertEquals(LINK, SharingLinks.onShareUrl(LINK));
        PatchSettings.setCleanSharingEnabled(true);
        assertEquals("https://open.spotify.com/episode/example?t=42&context=album",
                SharingLinks.onShareUrl(LINK));
    }

    @Test
    public void initializationDoesNotOverwriteASavedChoice() {
        PatchSettings.setCleanSharingEnabled(false);
        PatchSettings.initialize(application);
        assertFalse(PatchSettings.cleanSharingEnabled());
        assertEquals(LINK, SharingLinks.onShareUrl(LINK));
    }

    @Test
    public void disabledSharingPreservesNullAndMalformedInput() {
        PatchSettings.setCleanSharingEnabled(false);
        assertEquals(null, SharingLinks.onShareUrl(null));
        assertEquals("not a URL", SharingLinks.onShareUrl("not a URL"));
    }

    @Test
    public void premiumTabIsHiddenByDefaultAndNeverEnablesAnAbsentTab() {
        assertTrue(PatchSettings.hidePremiumTabEnabled());
        assertFalse(PatchSettings.showPremiumTab(true));
        assertFalse(PatchSettings.showPremiumTab(false));
        PatchSettings.setHidePremiumTabEnabled(false);
        assertTrue(PatchSettings.showPremiumTab(true));
        assertFalse(PatchSettings.showPremiumTab(false));
    }

    @Test
    public void premiumTabChoiceSurvivesInitializationAndIsIndependentOfSharing() {
        PatchSettings.setHidePremiumTabEnabled(false);
        PatchSettings.initialize(application);
        assertFalse(PatchSettings.hidePremiumTabEnabled());
        assertTrue(PatchSettings.cleanSharingEnabled());
        PatchSettings.setCleanSharingEnabled(false);
        PatchSettings.setHidePremiumTabEnabled(true);
        assertFalse(PatchSettings.cleanSharingEnabled());
        assertFalse(PatchSettings.showPremiumTab(true));
    }
}
