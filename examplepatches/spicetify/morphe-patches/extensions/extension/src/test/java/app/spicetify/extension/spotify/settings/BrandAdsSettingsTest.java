package app.spicetify.extension.spotify.settings;

import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
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
public class BrandAdsSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean hideBrandAds() { return true; }
    }

    @Test
    @Config(shadows = Capabilities.class)
    public void settingPersistsAcrossActivityRecreation() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            Switch toggle = toggle(controller.get().getWindow().getDecorView());
            assertNotNull(toggle);
            assertTrue(toggle.isChecked());
            toggle.performClick();
            assertFalse(PatchSettings.hideBrandAdsEnabled());
        }
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            Switch toggle = toggle(controller.get().getWindow().getDecorView());
            assertFalse(toggle.isChecked());
            toggle.performClick();
            assertTrue(PatchSettings.hideBrandAdsEnabled());
        }
    }

    @Test
    @Config(shadows = Capabilities.class)
    public void tappingTheRowTogglesTheSetting() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(application, SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            Switch toggle = toggle(controller.get().getWindow().getDecorView());
            ((View) toggle.getParent()).performClick();
            assertFalse(toggle.isChecked());
            assertFalse(PatchSettings.hideBrandAdsEnabled());
        }
    }

    @Test
    public void uninstalledPatchHasNoControl() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), SpicetifySettingsActivity.PAGE_ADS)).setup()) {
            assertNull(toggle(controller.get().getWindow().getDecorView()));
        }
    }

    private Switch toggle(View view) {
        if (view instanceof Switch && view.getContentDescription() != null && view.getContentDescription().toString().startsWith("Hide Home and Browse ads. ")) return (Switch) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Switch result = toggle(group.getChildAt(i));
                if (result != null) return result;
            }
        }
        return null;
    }
}
