package santodan.patches;

import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyMonetDisplayedCards110Apk {
    public static void main(String[] args) throws Exception {
        VerifyMonetDisplayedCards110.audit(VerifyMonet.read(args[0]),VerifyMonet.read(args[1]),Boolean.parseBoolean(args[2]));
        int unchanged = 0;
        try (var original = new ZipFile(args[0]); var apk = new ZipFile(args[1])) {
            for (var entry : Collections.list(original.entries())) {
                String name = entry.getName();
                if (entry.isDirectory() || name.startsWith("META-INF/") || name.matches("classes[0-9]*\\.dex")) continue;
                var actual = apk.getEntry(name);
                if (actual == null) throw new AssertionError("Missing file " + name);
                try (var a = original.getInputStream(entry); var b = apk.getInputStream(actual)) {
                    if (!Arrays.equals(a.readAllBytes(),b.readAllBytes())) throw new AssertionError("Unrelated file changed " + name);
                }
                unchanged++;
            }
        }
        System.out.println("PASS: actual 1.1.0 rebuild preserves " + unchanged + " non-DEX/non-signature entries, including manifest");
    }
}
