// SPDX-License-Identifier: GPL-3.0-only
package io.github.pengusto.patches.finamp;

import java.io.File;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.FileTime;
import java.util.Arrays;
import java.util.Set;

/** Run with the compiled patch classes and pinned Morphe Desktop 1.19.1 / Patcher 2.0.1. */
public final class VerifyNativeOutput {
    public static void main(String[] args) throws Exception {
        Path root = Files.createTempDirectory(Path.of(args[0]), "native-output-");
        Path file = root.resolve("libapp.so");
        try {
            Class<?> coderType = Class.forName("app.morphe.patcher.resource.coder.ArsclibResourceCoder");
            Object coder = coderType.getConstructor(File.class, File.class, Set.class, boolean.class)
                .newInstance(root.toFile(), new File(args[1]), Set.of(), false);
            Method snapshot = coderType.getDeclaredMethod("snapshot", File.class);
            snapshot.setAccessible(true);
            byte[] original = new byte[64];
            byte[] patched = new byte[64];
            Arrays.fill(patched, (byte) 7);
            int cases = 0;
            for (long millis : new long[] {1700000000000L, 1700000001000L, 1700000000123L}) {
                Files.write(file, original);
                FileTime before = FileTime.fromMillis(millis);
                Files.setLastModifiedTime(file, before);
                Object baseline = snapshot.invoke(coder, file.toFile());
                Method differsFrom = coderType.getDeclaredMethod("differsFrom", File.class, baseline.getClass());
                differsFrom.setAccessible(true);
                Files.write(file, patched);
                // Model Android NIO's coarse timestamp at the production post-write boundary.
                Files.setLastModifiedTime(file, before);
                if ((boolean) differsFrom.invoke(coder, file.toFile(), baseline)) {
                    throw new AssertionError("Coarse same-size edit must reproduce the missed native output");
                }
                FinampNativeOutput.INSTANCE.markWritten(file, before);
                if (!(boolean) differsFrom.invoke(coder, file.toFile(), baseline)) {
                    throw new AssertionError("Patcher missed the changed native output after markWritten");
                }
                if (!Arrays.equals(Files.readAllBytes(file), patched) || Files.size(file) != original.length) {
                    throw new AssertionError("Detection marker must preserve the exact native bytes and size");
                }
                cases++;
            }
            System.out.println("PASS: " + cases + " same-size/coarse-time cases detected by actual Patcher 2.0.1; native bytes preserved");
        } finally {
            Files.deleteIfExists(file);
            Files.delete(root);
        }
    }
}
