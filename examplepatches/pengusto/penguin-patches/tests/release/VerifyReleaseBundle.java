/* SPDX-License-Identifier: GPL-3.0-only */
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.io.BufferedInputStream;
import java.nio.file.Path;
import java.util.*;
import java.util.zip.ZipFile;

/** Verify app runtime isolation and preservation of every previously released MPE. */
class VerifyReleaseBundle {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Pass current MPP and prior released MPP");
        Set<String> modules = Set.of("extension", "kvaesitso", "clock", "calendarreminders", "tasks", "feeder");
        try (ZipFile current = new ZipFile(Path.of(args[0]).toFile());
             ZipFile prior = new ZipFile(Path.of(args[1]).toFile())) {
            Set<String> entries = new HashSet<>();
            for (var entry : Collections.list(current.entries())) {
                if (!entry.getName().endsWith(".mpe")) continue;
                entries.add(entry.getName());
                String module = entry.getName().replace("extensions/", "").replace(".mpe", "");
                if (!modules.contains(module)) throw new AssertionError("Unexpected MPE: " + entry.getName());
                var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(),
                    new BufferedInputStream(current.getInputStream(entry)));
                int count = 0;
                for (var type : dex.getClasses()) {
                    String prefix = "Lio/github/pengusto/patches/extension/";
                    if (!module.equals("extension")) prefix += module + "/";
                    // The legacy shared MPE already includes Kotlin classes. Its complete
                    // bytes must match the published reference below; only new app MPEs
                    // must contain exclusively their own classes.
                    if (!module.equals("extension") && !type.getType().startsWith(prefix))
                        throw new AssertionError("Library/stub in " + module + ": " + type.getType());
                    count++;
                }
                if (count == 0) throw new AssertionError("Empty MPE: " + module);
                System.out.println("PASS: " + module + ", " + count + " runtime classes");
            }
            Set<String> expected = new HashSet<>();
            for (String module : modules) expected.add("extensions/" + module + ".mpe");
            if (!entries.equals(expected)) throw new AssertionError("Missing/unexpected MPE set: " + entries);
            if (prior.getEntry("extensions/extension.mpe") == null)
                throw new AssertionError("Prior release lacks the shared reference MPE");
            int unchanged = 0;
            for (var old : Collections.list(prior.entries())) {
                if (!old.getName().endsWith(".mpe")) continue;
                var now = current.getEntry(old.getName());
                if (now == null || !Arrays.equals(prior.getInputStream(old).readAllBytes(), current.getInputStream(now).readAllBytes()))
                    throw new AssertionError("Previously released runtime changed: " + old.getName());
                unchanged++;
            }
            if (unchanged == 0) throw new AssertionError("Prior release contains no runtime payloads");
            System.out.println("PASS: all " + unchanged + " previously released MPEs byte-identical");
        }
    }
}
