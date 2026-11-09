package com.anderson.applemusic.one;

import java.util.Arrays;
import java.util.List;

/**
 * Plain-JVM test for the updater's ABI mapping ({@link UpdateAbis}); no Android classes
 * are touched. Run it with {@code single-apk/test-update-abis.ps1}, which compiles this
 * file together with {@code UpdateAbis.java} and executes {@link #main(String[])}.
 */
public final class UpdateAbisTest {

    private static int checks;

    public static void main(String[] args) {
        keyForAbi();
        primaryAbiOnly();
        System.out.println("UpdateAbisTest: OK (" + checks + " checks)");
    }

    private static void keyForAbi() {
        expectKey("arm64-v8a", "one-arm64");
        expectKey("armeabi-v7a", "one-arm32");
        expectKey("armeabi", "one-arm32");
        expectKey("x86", "one-x86");
        expectKey("x86_64", "one-x86");
        expectKey("riscv64", null);
        expectKey("", null);
        expectKey(null, null);
    }

    private static void primaryAbiOnly() {
        // Regression: arm64 + 32-bit fallbacks used to offer one-arm32 on an arm64-only
        // phone. The primary ABI is the only accepted key.
        expectKeys(new String[]{"arm64-v8a", "armeabi-v7a", "armeabi"}, "one-arm64");
        expectKeys(new String[]{"arm64-v8a"}, "one-arm64");
        expectKeys(new String[]{"armeabi-v7a", "armeabi"}, "one-arm32");
        expectKeys(new String[]{"x86_64", "x86"}, "one-x86");
        expectKeys(new String[]{"x86"}, "one-x86");
        expectKeys(new String[]{"riscv64", "arm64-v8a"}, new String[0]);
        expectKeys(new String[0], new String[0]);
        expectKeys(null, new String[0]);
    }

    private static void expectKey(String abi, String expected) {
        String actual = UpdateAbis.keyForAbi(abi);
        check("keyForAbi(" + String.valueOf(abi) + ") = " + actual,
                expected == null ? actual == null : expected.equals(actual));
    }

    private static void expectKeys(String[] abis, String... expected) {
        List<String> actual = UpdateAbis.candidateKeys(abis);
        check("candidateKeys(" + Arrays.toString(abis) + ") = " + actual,
                actual.equals(Arrays.asList(expected)));
    }

    private static void check(String label, boolean ok) {
        checks++;
        if (!ok) throw new AssertionError("FAILED: " + label);
    }
}
