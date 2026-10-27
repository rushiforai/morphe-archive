package app.hushmessenger.extension;

import android.view.View;
import android.widget.TextView;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "xxhdpi")
public class ScreenArtTest {
    @Before public void reset() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @After public void restore() {
        ScreenArt.artDpi = ScreenArt::launcherArtDpi;
    }

    @Test public void onlyArtStretchedByHalfAgainCountsAsBlurry() {
        // The 120-160 dpi builds on the reporter's 480 dpi phone, and 240 or 320 dpi builds there too.
        assertTrue(ScreenArt.blurry(160, 480));
        assertTrue(ScreenArt.blurry(240, 480));
        assertTrue(ScreenArt.blurry(320, 480));
        // A 480 dpi build on a 560 or 640 dpi phone, the full builds and builds made for the screen stay quiet.
        assertFalse(ScreenArt.blurry(480, 640));
        assertFalse(ScreenArt.blurry(480, 560));
        assertFalse(ScreenArt.blurry(480, 480));
        assertFalse(ScreenArt.blurry(640, 420));
        assertFalse(ScreenArt.blurry(321, 480));
        // Unknown, anydpi and nodpi art never warns.
        assertFalse(ScreenArt.blurry(0, 480));
        assertFalse(ScreenArt.blurry(0xfffe, 480));
        assertFalse(ScreenArt.blurry(0xffff, 480));
        assertFalse(ScreenArt.blurry(160, 0));
    }

    private View appPage() {
        var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
        View root = screen.get().getWindow().getDecorView();
        root.findViewWithTag("tab_app").performClick();
        return root;
    }

    @Test public void theAboutPanelSaysWhenThisDownloadsIconsAreForASmallerScreen() {
        ScreenArt.artDpi = context -> 160;
        View root = appPage();
        TextView note = root.findViewWithTag("screen_art_blurry");
        assertNotNull(note);
        assertTrue(note.isShown());
        assertEquals(new SettingsText(RuntimeEnvironment.getApplication()).get("screen_art_blurry", "160", "480"), note.getText().toString());
        assertTrue(note.getText().toString().contains("nodpi"));
    }

    @Test public void aBuildWithArtForThisScreenSaysNothing() {
        ScreenArt.artDpi = context -> 480;
        assertNull(appPage().findViewWithTag("screen_art_blurry"));
        ScreenArt.artDpi = context -> 0;
        assertNull(appPage().findViewWithTag("screen_art_blurry"));
    }

    @Test public void withoutMessengersArtTheRealLookupSaysItCantTell() {
        assertEquals(0, ScreenArt.launcherArtDpi(RuntimeEnvironment.getApplication()));
    }
}
