import app.morphe.patcher.PatcherConfig;
import app.morphe.patcher.dex.BytecodeMode;
import app.morphe.patcher.dex.DexVerifier;
import app.morphe.patcher.patch.Option;
import app.morphe.patcher.patch.ResourcePatch;
import app.morphe.patcher.patch.ResourcePatchContext;
import java.io.File;
import java.lang.reflect.Proxy;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.util.Set;

/** Exercise successive Manager-style patching runs with one loaded bundle. */
class MapsBrandingSelectionRegression {
    public static void main(String[] args) throws Exception {
        try (var loader = new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},
                MapsBrandingSelectionRegression.class.getClassLoader())) {
            ResourcePatch branding = (ResourcePatch) loader.loadClass(
                    "org.ungoogled.patches.maps.resources.ChangeAppNamePatchKt")
                .getMethod("getChangeAppNamePatch").invoke(null);
            ResourcePatch legacy = (ResourcePatch) loader.loadClass(
                    "org.ungoogled.patches.maps.resources.LegacyIconPatchKt")
                .getMethod("getLegacyIconPatch").invoke(null);
            @SuppressWarnings("unchecked")
            Option<String> icon = (Option<String>) branding.getOptions().get("appIcon");
            String[] styles = {"classic_pin_light", "automatic", "original", "automatic", "folded_map_dark"};
            for (int i = 0; i < styles.length; i++) {
                String style = styles[i];
                icon.reset();
                icon.setValue(style);
                File workspace = new File(args[2], "case-" + i);
                workspace.mkdirs();
                DexVerifier verifier = (DexVerifier) Proxy.newProxyInstance(loader, new Class[]{DexVerifier.class},
                    (proxy, method, values) -> { throw new AssertionError("Unexpected DEX validation"); });
                PatcherConfig config = new PatcherConfig(new File(args[1]), workspace, Set.of(),
                    BytecodeMode.NONE, verifier, workspace, null, false);
                config.setBehaviors$morphe_patcher(Set.of(app.morphe.patcher.PatcherBehavior.ON_REQUEST_RESOURCE_DECODING));
                try (ResourcePatchContext context = new ResourcePatchContext(config)) {
                    context.decodeResources$morphe_patcher(app.morphe.patcher.resource.ResourceMode.FULL);
                    branding.execute(context);
                    legacy.execute(context);
                    String manifest = Files.readString(context.get("AndroidManifest.xml", false).toPath());
                    String expected = style.equals("automatic") ? "@mipmap/ungoogled_legacy_icon" :
                        style.equals("original") ? "@mipmap/maps_2025" : "@mipmap/morphe_maps_launcher";
                    var document = javax.xml.parsers.DocumentBuilderFactory.newInstance().newDocumentBuilder()
                        .parse(context.get("AndroidManifest.xml", false));
                    var application = (org.w3c.dom.Element) document.getElementsByTagName("application").item(0);
                    if (!application.getAttribute("android:icon").equals(expected))
                        throw new AssertionError("Cross-run icon state leaked into " + style + ": " + manifest);
                }
            }
            System.out.println("PASS: 5 successive runs preserve explicit/automatic icon choices without state leakage");
        }
    }
}
