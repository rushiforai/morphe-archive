/* SPDX-License-Identifier: GPL-3.0-only */
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.io.BufferedInputStream;
import java.io.File;
import java.util.Arrays;
import java.util.zip.ZipFile;

/** Reject bundled libraries/stubs and any unintended change to existing MPEs. */
class VerifyTasksBundle {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Pass new and prior Calendar-local MPP paths");
        try (ZipFile current = new ZipFile(new File(args[0])); ZipFile prior = new ZipFile(new File(args[1]))) {
            var entry = current.getEntry("extensions/tasks.mpe");
            var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), new BufferedInputStream(current.getInputStream(entry)));
            int count = 0;
            for (var type : dex.getClasses()) {
                if (!type.getType().startsWith("Lio/github/pengusto/patches/extension/tasks/"))
                    throw new AssertionError("Unexpected runtime class: " + type.getType());
                count++;
            }
            if (count == 0) throw new AssertionError("Empty extension");
            int unchanged = 0;
            for (var old : java.util.Collections.list(prior.entries())) {
                if (!old.getName().startsWith("extensions/") || !old.getName().endsWith(".mpe")) continue;
                var now = current.getEntry(old.getName());
                if (now == null || !Arrays.equals(prior.getInputStream(old).readAllBytes(), current.getInputStream(now).readAllBytes()))
                    throw new AssertionError("Existing extension changed: " + old.getName());
                unchanged++;
            }
            if (unchanged < 1) throw new AssertionError("Prior MPP has no runtime payloads");
            System.out.println("PASS: " + count + " Tasks-only classes, no runtime libraries/stubs; " + unchanged + " existing MPEs byte-identical");
        }
    }
}
