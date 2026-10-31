import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchKt;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.io.*;
import java.util.*;
import java.util.jar.*;

/** Package/metadata discovery test; does not patch an APK or claim Android execution. */
public final class BundleSmoke {
    public static void main(String[] args) throws Exception {
        File bundle = new File(args[0]);
        try (JarFile jar = new JarFile(bundle)) {
            if (!"Tracket Patches".equals(jar.getManifest().getMainAttributes().getValue("Name")))
                throw new AssertionError("Missing bundle name");
            if (!args[1].equals(jar.getManifest().getMainAttributes().getValue("Version")))
                throw new AssertionError("Wrong bundle version");
            JarEntry dex = jar.getJarEntry("classes.dex");
            if (dex == null || dex.getSize() <= 0)
                throw new AssertionError("Patch bundle is missing dex entries");
            Set<String> types = new HashSet<>();
            try (InputStream in = new BufferedInputStream(jar.getInputStream(dex))) {
                for (var c : DexBackedDexFile.fromInputStream(null, in).getClasses()) {
                    types.add(c.getType());
                    for (var method : c.getMethods()) {
                        var implementation = method.getImplementation();
                        if (implementation != null) {
                            for (var instruction : implementation.getInstructions()) {
                                instruction.getOpcode(); // Decode every instruction.
                            }
                        }
                    }
                }
            }
            // D8 also emits synthetic access-marker classes for the private nested constructors.
            if (!types.containsAll(Set.of("Ltracket/morphe/LifetimeUnlock;",
                    "Ltracket/morphe/LifetimeUnlock$Build;", "Ltracket/morphe/LifetimeUnlock$Execute;")))
                throw new AssertionError("Unexpected DEX classes: " + types);
            if (types.stream().anyMatch(t -> !t.startsWith("Ltracket/morphe/LifetimeUnlock")))
                throw new AssertionError("Dependencies must not be bundled into DEX: " + types);
        }
        var patches = PatchKt.loadPatchesFromJar(Collections.singleton(bundle));
        if (patches.size() != 1) throw new AssertionError("Expected one patch, found " + patches.size());
        Patch<?> patch = patches.iterator().next();
        if (!"Unlock lifetime".equals(patch.getName())) throw new AssertionError("Wrong patch name");
        if (patch.getCompatibility().size() != 1 ||
                !"com.tracket.app".equals(patch.getCompatibility().get(0).getPackageName()))
            throw new AssertionError("Wrong target app");
        if (patch.getCompatibility().get(0).getTargets().size() != 1 ||
                !"0.9.38".equals(patch.getCompatibility().get(0).getTargets().get(0).getVersion()))
            throw new AssertionError("Wrong target version");
        System.out.println("PASS: manifest, DEX classes/instructions, Morphe JVM discovery, patch target");
    }
}
