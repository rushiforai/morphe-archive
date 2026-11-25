import app.morphe.patcher.PatcherConfig;
import app.morphe.patcher.dex.BytecodeMode;
import app.morphe.patcher.patch.Option;
import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.ResourcePatch;
import app.morphe.patcher.patch.ResourcePatchContext;
import java.io.File;
import java.lang.reflect.Proxy;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.xml.parsers.DocumentBuilderFactory;
import app.morphe.patcher.dex.DexVerifier;

/** Run with the desktop JAR on the classpath; arguments: bundle, original APK, scratch directory. */
class MapsAppNameRegression {
    public static void main(String[] args) throws Exception {
        List<String> failures = new ArrayList<>();
        try (URLClassLoader loader = new URLClassLoader(new URL[]{new File(args[0]).toURI().toURL()},
                MapsAppNameRegression.class.getClassLoader())) {
            ResourcePatch patch = (ResourcePatch) loader.loadClass("org.ungoogled.patches.maps.resources.ChangeAppNamePatchKt")
                .getMethod("getChangeAppNamePatch").invoke(null);
            @SuppressWarnings("unchecked")
            Option<String> option = (Option<String>) patch.getOptions().get("appName");
            Class<?> selection = loader.loadClass("org.ungoogled.patches.maps.microg.MicrogSelection");
            Class<?> flavor = loader.loadClass("org.ungoogled.patches.maps.microg.MicrogSelection$Flavor");
            int cases = 0;
            for (String mode : new String[]{"NONE", "RE", "ORIGINAL"}) {
                for (String name : new String[]{null, "Ungoogled Maps", "My Maps & <Routes>", "microG Maps"}) {
                    option.reset();
                    if (name != null) option.setValue(name);
                    String expected = name == null ? "Ungoogled Maps" : name;
                    File workspace = new File(args[2], "case-" + cases++);
                    workspace.mkdirs();
                    DexVerifier verifier = (DexVerifier) Proxy.newProxyInstance(loader, new Class[]{DexVerifier.class},
                        (proxy, method, values) -> { throw new AssertionError("Unexpected DEX validation"); });
                    PatcherConfig config = new PatcherConfig(new File(args[1]), workspace, Set.of(),
                        BytecodeMode.NONE, verifier, workspace, null, false);
                    config.setBehaviors$morphe_patcher(Set.of(app.morphe.patcher.PatcherBehavior.ON_REQUEST_RESOURCE_DECODING));
                    try (ResourcePatchContext context = new ResourcePatchContext(config)) {
                        context.decodeResources$morphe_patcher(app.morphe.patcher.resource.ResourceMode.FULL);
                        Path manifest = context.get("AndroidManifest.xml", false).toPath();
                        Files.createDirectories(manifest.getParent());
                        Files.writeString(manifest, """
                            <manifest xmlns:android="http://schemas.android.com/apk/res/android">
                              <application android:label="@string/MAPS_APP_NAME">
                                <activity android:label="@string/MAPS_APP_NAME"/>
                                <activity-alias android:label="@string/MAPS_APP_NAME"/>
                                <activity android:label="@string/other_title"/>
                              </application>
                            </manifest>
                            """);
                        Path strings = context.get("res/values/strings.xml", false).toPath();
                        Files.createDirectories(strings.getParent());
                        Files.writeString(strings, "<resources><string name=\"MAPS_APP_NAME\">Maps</string></resources>");
                        Path localized = context.get("res/values-nl/strings.xml", false).toPath();
                        Files.createDirectories(localized.getParent());
                        String locale = "<resources><string name=\"MAPS_APP_NAME\">Kaarten</string></resources>";
                        Files.writeString(localized, locale);
                        if (!mode.equals("NONE")) {
                            Object selected = flavor.getField(mode).get(null);
                            selection.getMethod("select", Object.class, flavor)
                                .invoke(selection.getField("INSTANCE").get(null), context, selected);
                        }
                        patch.execute(context);
                        var factory = DocumentBuilderFactory.newInstance();
                        var output = factory.newDocumentBuilder().parse(strings.toFile());
                        var values = output.getElementsByTagName("string");
                        String actual = null;
                        for (int i = 0; i < values.getLength(); i++) {
                            var node = (org.w3c.dom.Element) values.item(i);
                            if (node.getAttribute("name").equals("ungoogled_app_name")) actual = node.getTextContent();
                        }
                        if (!expected.equals(actual)) failures.add(mode + ": expected " + expected + ", got " + actual);
                        String labels = Files.readString(manifest);
                        if (labels.contains("@string/MAPS_APP_NAME") ||
                            labels.split("@string/ungoogled_app_name", -1).length != 4 ||
                            !labels.contains("@string/other_title") || !Files.readString(localized).equals(locale)) {
                            failures.add(mode + ": launcher/activity labels or locale isolation changed");
                        }
                    }
                }
            }
            for (String type : new String[]{"MicrogSupportPatchKt", "OriginalMicrogSupportPatchKt"}) {
                String getter = type.startsWith("Original") ? "getOriginalMicrogSupportPatch" : "getMicrogSupportPatch";
                Patch<?> support = (Patch<?>) loader.loadClass("org.ungoogled.patches.maps.microg." + type)
                    .getMethod(getter).invoke(null);
                if (!java.util.Objects.equals(patch.getCategory(), support.getCategory()))
                    failures.add(support.getName() + " is grouped separately: " + support.getCategory());
            }
            if (!failures.isEmpty()) throw new AssertionError(String.join("\n", failures));
            System.out.println("PASS: " + cases + " app-name cases, locale isolation, and both support patch groups");
        }
    }
}
