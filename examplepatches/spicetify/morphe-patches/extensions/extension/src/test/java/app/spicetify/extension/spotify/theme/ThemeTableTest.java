package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import android.content.res.Resources;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, manifest = Config.NONE)
public class ThemeTableTest {
    private static final int COLOR = 0x7f0604bc;

    @Test
    public void laysColorsOverResourcesAlreadyLoadedThenTakesThemAway() throws IOException {
        Application context = RuntimeEnvironment.getApplication();
        Resources resources = context.getResources();
        // As at startup: the loader goes on first, and the theme follows.
        ThemeTable.applyTo(resources);

        ThemeTable.loadIds(context, Collections.singletonMap(COLOR, 0xFF3B1F5E));
        assertEquals(0xFF3B1F5E, resources.getColor(COLOR, null));
        File table = new File(context.getNoBackupFilesDir(), "spicetify_theme.arsc");
        assertTrue(table.isFile());

        // Another theme replaces the table.
        ThemeTable.loadIds(context, Collections.singletonMap(COLOR, 0x80112233));
        assertEquals(0x80112233, resources.getColor(COLOR, null));

        // No colors: Spotify's own again, which this test app doesn't have, and no table file.
        ThemeTable.loadIds(context, Collections.emptyMap());
        assertThrows(Resources.NotFoundException.class, () -> resources.getColor(COLOR, null));
        assertFalse(table.exists());
    }

    @Test
    public void namesTheAppDoesntHaveAreLeftOut() throws IOException {
        Application context = RuntimeEnvironment.getApplication();
        Resources resources = context.getResources();
        ThemeTable.applyTo(resources);
        ThemeTable.loadIds(context, Collections.singletonMap(COLOR, 0xFF3B1F5E));

        // This test app has no color named gray_7, so nothing is left to lay over its resources.
        ThemeTable.load(context, Collections.singletonMap("gray_7", 0xFF000000));

        assertThrows(Resources.NotFoundException.class, () -> resources.getColor(COLOR, null));
    }
}
