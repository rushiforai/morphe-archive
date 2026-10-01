package app.spicetify.extension.spotify.settings;

import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class SettingsNavigationTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class AdsAndSharing {
        @Implementation public static boolean hidePlayerAdCards() { return true; }
        @Implementation public static boolean cleanSharing() { return true; }
    }

    @Test
    @Config(shadows = AdsAndSharing.class)
    public void rootGroupsOnlyInstalledPatchesAndOpensTheirPage() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class).setup()) {
            View root = controller.get().getWindow().getDecorView();
            View ads = row(root, "Ads, Now Playing");
            assertNotNull(ads);
            assertNotNull(row(root, "Sharing, Clean sharing links"));
            assertNull(row(root, "Home and navigation, Premium tab"));
            assertNull(row(root, "Server files, WebDAV • Jellyfin"));
            ads.performClick();
            Intent next = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(SpicetifySettingsActivity.class.getName(), next.getComponent().getClassName());
            assertEquals(SpicetifySettingsActivity.PAGE_ADS, next.getStringExtra(SpicetifySettingsActivity.EXTRA_PAGE));
        }
    }

    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class ThemeAndServer {
        @Implementation public static boolean themeColors() { return true; }
        @Implementation public static boolean serverFiles() { return true; }
    }

    @Test
    @Config(shadows = ThemeAndServer.class)
    public void appearanceAndServerPagesRenderTheirContent() {
        var application = RuntimeEnvironment.getApplication();
        ServerConfig.initialize(application);
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(application, SpicetifySettingsActivity.PAGE_APPEARANCE)).setup()) {
            assertTrue(hasText(controller.get().getWindow().getDecorView(), "OLED"));
        }
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(application, SpicetifySettingsActivity.PAGE_SERVER)).setup()) {
            assertNotNull(first(controller.get().getWindow().getDecorView(), ServerFilesSettings.class));
        }
    }

    @Test
    public void unknownPageFallsBackToTheRoot() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class,
                SpicetifySettingsActivity.page(RuntimeEnvironment.getApplication(), "missing")).setup()) {
            assertTrue(hasText(controller.get().getWindow().getDecorView(), "No configurable Spicetify patches are installed."));
            assertEquals("Spicetify", controller.get().getTitle().toString());
        }
    }

    @Test
    public void rootExplainsWhenNothingIsInstalled() {
        try (var controller = Robolectric.buildActivity(SpicetifySettingsActivity.class).setup()) {
            assertTrue(hasText(controller.get().getWindow().getDecorView(), "No configurable Spicetify patches are installed."));
        }
    }

    private View row(View view, String description) {
        if (view.isClickable() && view.getContentDescription() != null && description.contentEquals(view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = row(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    private <T extends View> T first(View view, Class<T> kind) {
        if (kind.isInstance(view)) return kind.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = first(group.getChildAt(i), kind);
                if (found != null) return found;
            }
        }
        return null;
    }

    private boolean hasText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasText(group.getChildAt(i), text)) return true;
        }
        return false;
    }
}
