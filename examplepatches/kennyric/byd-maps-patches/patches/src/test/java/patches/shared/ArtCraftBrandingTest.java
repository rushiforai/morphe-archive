package patches.shared;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.Patch;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.junit.Test;
import static org.junit.Assert.*;

/** Inspect the compiled branding patches built on the shared ArtCraft helper, as consumed by Manager and the bundle generator. */
public class ArtCraftBrandingTest {
    private static final class App {
        final Patch<?> patch; final ArtCraftBrand brand; final String packageName; final String brandName; final Set<String> icons;
        App(Patch<?> patch, ArtCraftBrand brand, String packageName, String brandName, Set<String> icons) {
            this.patch = patch; this.brand = brand; this.packageName = packageName; this.brandName = brandName; this.icons = icons;
        }
        Patch<?> patch() { return patch; }
        ArtCraftBrand brand() { return brand; }
        String packageName() { return packageName; }
        String brandName() { return brandName; }
        Set<String> icons() { return icons; }
    }

    private static final List<App> APPS = List.of(
        new App(patches.pdfcraft.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.pdfcraft.CustomBrandingPatchKt.getPdfCraftBrand(),
            "io.github.artcraftandroid.pdfcraft", "Adobe Acrobat", Set.of("acrobat", "acrobat_classic")),
        new App(patches.lightcraft.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.lightcraft.CustomBrandingPatchKt.getLightCraftBrand(),
            "io.github.artcraftandroid.lightcraft", "Adobe Lightroom", Set.of("lightroom")),
        new App(patches.wordcraft.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.wordcraft.CustomBrandingPatchKt.getWordCraftBrand(),
            "io.github.artcraftandroid.wordcraft", "Microsoft Word", Set.of("word")),
        new App(patches.gridcraft.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.gridcraft.CustomBrandingPatchKt.getGridCraftBrand(),
            "io.github.artcraftandroid.gridcraft", "Microsoft Excel", Set.of("excel")),
        new App(patches.titanium.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.titanium.CustomBrandingPatchKt.getTitaniumBrand(),
            "io.github.jqssun.helium", "Chrome", Set.of("chrome")),
        new App(patches.fennec.CustomBrandingPatchKt.getCustomBrandingPatch(),
            patches.fennec.CustomBrandingPatchKt.getFennecBrand(),
            "org.mozilla.fennec_fdroid", "Firefox", Set.of("firefox")));

    @Test public void brandingFollowsEveryRelease() {
        for (App app : APPS) {
            assertEquals("Custom branding", app.patch().getName());
            assertTrue("Branding is on by default", app.patch().getDefault());
            List<Compatibility> targets = app.patch().getCompatibility();
            assertNotNull(targets);
            assertEquals(1, targets.size());
            Compatibility compatibility = targets.get(0);
            assertEquals(app.packageName(), compatibility.getPackageName());
            assertEquals(ApkFileType.APK, compatibility.getApkFileType());
            assertEquals("Declare one unrestricted version target", 1, compatibility.getTargets().size());
            AppTarget target = compatibility.getTargets().get(0);
            assertNull("Future releases must not be filtered by version name", target.getVersion());
            assertNull("Future releases must not be filtered by build code", target.getVersionCodes());
            assertFalse(target.isExperimental());
        }
    }

    @Test public void defaultsUseTheBrandNameAndTheSecondIconOption() {
        for (App app : APPS) {
            var options = app.patch().getOptions();
            assertEquals(Set.of("customName", "appIcon"), options.keySet());
            assertEquals(app.brandName(), options.get("customName").getDefault());
            var icon = options.get("appIcon");
            assertTrue(icon.getRequired());
            List<Object> values = new ArrayList<>(icon.getValues().values());
            assertEquals("Original icon is listed first", ArtCraftBrandingKt.ARTCRAFT_ORIGINAL_ICON, values.get(0));
            assertEquals("The second icon option is the default", values.get(1), icon.getDefault());
            Set<Object> branded = Set.copyOf(values.subList(1, values.size()));
            assertEquals(app.icons(), branded);
        }
    }

    @Test public void everyBundledIconResourceIsPackaged() throws Exception {
        for (App app : APPS) {
            for (String icon : app.icons()) {
                List<String> resources = app.brand().iconResources(icon);
                assertFalse(resources.isEmpty());
                for (String resource : resources) {
                    String path = "/" + app.brand().getSlug() + "/branding/" + icon + "/" + resource;
                    try (InputStream stream = getClass().getResourceAsStream(path)) {
                        assertNotNull("Missing " + path, stream);
                        assertTrue(stream.read() >= 0);
                    }
                }
            }
            assertTrue("The original icon adds no resources", app.brand().iconResources(ArtCraftBrandingKt.ARTCRAFT_ORIGINAL_ICON).isEmpty());
        }
    }

    @Test public void nameOptionTrimsAndBoundsInput() {
        assertTrue(ArtCraftBrandingKt.artCraftNameAccepted(null));
        assertTrue(ArtCraftBrandingKt.artCraftNameAccepted("Adobe Acrobat "));
        assertTrue(ArtCraftBrandingKt.artCraftNameAccepted(""));
        assertFalse(ArtCraftBrandingKt.artCraftNameAccepted("x".repeat(41)));
        assertFalse(ArtCraftBrandingKt.artCraftNameAccepted("Line\nbreak"));
    }
}
