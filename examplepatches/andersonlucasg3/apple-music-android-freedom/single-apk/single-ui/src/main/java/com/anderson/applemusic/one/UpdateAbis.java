package com.anderson.applemusic.one;

import java.util.ArrayList;
import java.util.List;

/**
 * Maps the device ABI to the updater's asset key. Android-free on purpose so the mapping
 * can be exercised on a plain JVM ({@code single-apk/test-update-abis.ps1}).
 *
 * <p>Only the <b>primary</b> ABI is accepted. The updater used to fall back to
 * {@code one-arm32}/{@code one-x86} when the matching key was absent, which offers an APK
 * the device cannot run (an arm64-only phone must never receive the 32-bit build).
 */
final class UpdateAbis {

    private UpdateAbis() {
    }

    /** {@code one-*} key for one {@code Build.SUPPORTED_ABIS} entry, or null when unknown. */
    static String keyForAbi(String abi) {
        if ("arm64-v8a".equals(abi)) return "one-arm64";
        if ("armeabi-v7a".equals(abi) || "armeabi".equals(abi)) return "one-arm32";
        if ("x86".equals(abi) || "x86_64".equals(abi)) return "one-x86";
        return null;
    }

    /**
     * Candidate asset keys for {@code Build.SUPPORTED_ABIS}: either the primary ABI's key
     * or nothing. No cross-ABI fallback.
     */
    static List<String> candidateKeys(String[] supportedAbis) {
        List<String> keys = new ArrayList<String>();
        if (supportedAbis == null || supportedAbis.length == 0) return keys;
        String key = keyForAbi(supportedAbis[0]);
        if (key != null) keys.add(key);
        return keys;
    }
}
