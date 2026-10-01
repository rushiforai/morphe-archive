package app.spicetify.extension.spotify.theme;

import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.os.ParcelFileDescriptor;
import java.io.File;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ColorTableTest {
    @Test public void loaderResolvesTheWrittenColors() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        byte[] table = ColorTable.build(application.getPackageName(), List.of("anim", "animator", "array", "attr", "bool", "color"),
                Map.of(0x7f0604bc, 0xFF3B1F5E, 0x7f060ed1, 0x80112233));
        File file = File.createTempFile("colors", ".arsc");
        Files.write(file.toPath(), table);
        ResourcesLoader loader = new ResourcesLoader();
        try (ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY)) {
            loader.addProvider(ResourcesProvider.loadFromTable(descriptor, null));
        }
        Resources resources = application.getResources();
        resources.addLoaders(loader);
        try {
            assertEquals(0xFF3B1F5E, resources.getColor(0x7f0604bc, null));
            assertEquals(0x80112233, resources.getColor(0x7f060ed1, null));
            assertThrows(Resources.NotFoundException.class, () -> resources.getColor(0x7f0604bd, null));
        } finally {
            resources.removeLoaders(loader);
            assertTrue(file.delete());
        }
    }

    @Test public void rejectsColorsFromDifferentTypes() {
        assertThrows(IllegalArgumentException.class, () -> ColorTable.build("p", List.of("anim", "animator", "array", "attr", "bool", "color", "dimen"),
                Map.of(0x7f060001, 0xFF000000, 0x7f070001, 0xFF000000)));
    }

    @Test public void derivesPressedAccentByDarkening() {
        assertEquals(0xFF1ABB54, EncorePalette.pressed(0xFF1ED760));
    }
}
