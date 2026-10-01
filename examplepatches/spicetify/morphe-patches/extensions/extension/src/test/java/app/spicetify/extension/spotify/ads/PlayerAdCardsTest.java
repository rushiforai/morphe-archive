package app.spicetify.extension.spotify.ads;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import app.spicetify.extension.spotify.settings.InstalledPatches;
import app.spicetify.extension.spotify.settings.PatchSettings;
import app.spicetify.extension.spotify.settings.SpicetifySettingsActivity;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class PlayerAdCardsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean hidePlayerAdCards() { return true; }
    }

    @Before public void initialize() {
        var app = RuntimeEnvironment.getApplication();
        app.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(app);
    }

    @Test public void suppressesOnlyPresentImageAdWhenEnabled() {
        assertFalse(PlayerAdCards.showImageBrandAd(true));
        assertFalse(PlayerAdCards.showImageBrandAd(false));
        PatchSettings.setHidePlayerAdCardsEnabled(false);
        assertTrue(PlayerAdCards.showImageBrandAd(true));
        assertFalse(PlayerAdCards.showImageBrandAd(false));
    }

    @Test public void suppressesEmbeddedAdWhenEnabled() {
        assertFalse(PlayerAdCards.showEmbeddedAd());
        PatchSettings.setHidePlayerAdCardsEnabled(false);
        assertTrue(PlayerAdCards.showEmbeddedAd());
    }

    @Test
    @Config(shadows = Capabilities.class)
    public void controlPersistsAcrossActivityRecreation() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            Switch toggle = toggle(controller.get().getWindow().getDecorView());
            assertNotNull(toggle);
            assertTrue(toggle.isChecked());
            toggle.performClick();
            assertFalse(PatchSettings.hidePlayerAdCardsEnabled());
        }
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            Switch toggle = toggle(controller.get().getWindow().getDecorView());
            assertNotNull(toggle);
            assertFalse(toggle.isChecked());
        }
    }

    @Test public void uninstalledPatchHasNoControl() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            assertNull(toggle(controller.get().getWindow().getDecorView()));
        }
    }

    private Switch toggle(View view) {
        if (view instanceof Switch && view.getContentDescription() != null && view.getContentDescription().toString().startsWith("Hide player ad cards. ")) return (Switch) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                Switch found = toggle(group.getChildAt(index));
                if (found != null) return found;
            }
        }
        return null;
    }
}
