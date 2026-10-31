package santodan.patches;

import java.util.*;
import java.util.zip.ZipFile;

/** Audit the actual Desktop rebuild, not just Patcher's intermediate DEX. */
public final class VerifyMonetApk {
    public static void main(String[] args) throws Exception {
        var original = VerifyMonet.read(args[0]);
        var hook = MonetPremiumPatch.findUnique(original);
        var patched = VerifyMonet.read(args[1]);
        Set<String> expected = new HashSet<>(), seen = new HashSet<>();
        original.forEach(c -> expected.add(c.getType()));
        int found = 0;
        for (var c : patched) {
            if (!seen.add(c.getType())) throw new AssertionError("Duplicate class " + c.getType());
            for (var m : c.getMethods()) if (m.equals(hook)) {
                VerifyMonet.verifyBehavior(hook, m);
                found++;
            }
        }
        if (found != 1 || !seen.equals(expected)) throw new AssertionError("Class/hook set differs");
        int unchanged = 0;
        try (var a = new ZipFile(args[0]); var b = new ZipFile(args[1])) {
            for (var entry : Collections.list(a.entries())) {
                String name = entry.getName();
                if (entry.isDirectory() || name.matches("classes[0-9]*\\.dex") || name.startsWith("META-INF/")) continue;
                var other = b.getEntry(name);
                if (other == null) throw new AssertionError("Missing entry " + name);
                try (var before = a.getInputStream(entry); var after = b.getInputStream(other)) {
                    if (!Arrays.equals(before.readAllBytes(), after.readAllBytes()))
                        throw new AssertionError("Unrelated entry changed: " + name);
                }
                unchanged++;
            }
        }
        System.out.println("PASS: rebuilt APK retains " + seen.size() + " unique classes; all 16 premium states; "
            + unchanged + " unchanged non-DEX/non-signature entries (including manifest)");
    }
}
