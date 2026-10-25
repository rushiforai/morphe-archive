package santodan.patches;

import app.morphe.patcher.patch.*;
import java.io.File;
import java.util.*;

/** Run with the Desktop fat JAR, without Gradle's patcher dependencies on the runtime classpath. */
public final class VerifyMorpheDesktopImport {
    public static void main(String[] args) {
        Set<String> names = new HashSet<>();
        Set<String> packages = new HashSet<>();
        var patches = PatchKt.loadPatchesFromJar(Set.of(new File(args[0])));
        if (patches.isEmpty()) throw new AssertionError("Desktop loaded no patches");
        for (var patch : patches) {
            if (patch.getName() == null || !names.add(patch.getName())) throw new AssertionError("Missing/duplicate public patch name");
            if (patch.getCompatibility() == null) throw new AssertionError("Unexpected universal public patch");
            for (var compatibility : patch.getCompatibility()) {
                packages.add(compatibility.getPackageName());
                boolean tv = Set.of("com.nuvio.tv", "com.alticelabs.meo.androidtv", "com.klevico.monet").contains(compatibility.getPackageName());
                if (compatibility.getFormFactor() != (tv ? FormFactor.TV : FormFactor.MOBILE))
                    throw new AssertionError("Wrong device family: " + patch.getName());
                if (compatibility.getTargets().isEmpty()) throw new AssertionError("Missing app targets");
            }
            // Force metadata/options access, as the desktop source importer does.
            patch.getOptions().getValues().forEach(option -> { option.getKey(); option.getDefault(); });
            if (patch.getName().equals("NuvioTV - GitHub APK updates") &&
                !PatchBundleVersion.VERSION.equals(patch.getOptions().get("releaseVersion").getDefault()))
                throw new AssertionError("Updater default does not match this bundle version");
        }
        if (!packages.equals(Set.of("com.nuvio.tv", "com.alticelabs.meo.androidtv", "com.ovz.carscanner",
            "com.nexon.tfdc", "xyz.rtrvr.pillo", "com.reddit.frontpage", "h7.hamzio.emuithemeotg", "com.klevico.monet")))
            throw new AssertionError("Unexpected supported packages: " + packages);
        System.out.println("PASS: Desktop runtime imports " + names.size() + " patches across " + packages.size() +
            " apps, with unique names, targets, options and TV/mobile metadata");
    }
}
