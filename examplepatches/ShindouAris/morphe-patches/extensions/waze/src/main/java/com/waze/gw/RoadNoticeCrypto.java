package com.waze.gw;

import android.util.Log;

/** JNI access to Monocypher's Ed25519 verifier, available on Android 10 and newer. */
final class RoadNoticeCrypto {
    private static final String TAG = "WazeGW-RoadCrypto";
    /** Current production signing key (server/worker deployment). */
    private static final byte[] PRODUCTION_PUBLIC_KEY = new byte[] {
            (byte) 0x91, 0x73, (byte) 0x93, 0x66, (byte) 0x89, (byte) 0xaa, (byte) 0xf7, (byte) 0xbe,
            0x05, (byte) 0xe2, 0x2f, 0x1a, (byte) 0xff, (byte) 0xa1, 0x04, 0x35,
            0x3f, (byte) 0xaa, 0x08, (byte) 0x86, (byte) 0xa9, (byte) 0xdf, 0x02, 0x15,
            0x70, (byte) 0x9f, (byte) 0xaa, 0x1f, (byte) 0xfa, 0x36, (byte) 0xb6, 0x1b
    };

    /** Previous signing key retained temporarily so already-published datasets remain valid. */
    private static final byte[] LEGACY_PUBLIC_KEY = new byte[] {
            0x53, (byte) 0xb0, 0x7a, 0x3a, 0x03, (byte) 0xda, (byte) 0xc2, 0x06,
            0x36, 0x05, (byte) 0x8a, 0x78, (byte) 0xd8, (byte) 0x8d, 0x35, (byte) 0x9b,
            (byte) 0xca, 0x4f, (byte) 0x8e, (byte) 0xc4, (byte) 0x84, 0x21, (byte) 0xcf, 0x40,
            0x2e, (byte) 0xcf, (byte) 0xb0, (byte) 0xa9, (byte) 0xd6, (byte) 0x90, 0x24, (byte) 0xae
    };
    private static final boolean AVAILABLE;

    static {
        boolean loaded = false;
        try {
            System.loadLibrary("wazegw");
            loaded = selfTestNative();
            if (!loaded) Log.e(TAG, "native Ed25519 self-test failed");
        } catch (Throwable error) {
            Log.w(TAG, "native Ed25519 unavailable: " + error.getClass().getSimpleName());
        }
        AVAILABLE = loaded;
    }

    private RoadNoticeCrypto() { }

    static boolean verify(byte[] message, byte[] signature) {
        if (!AVAILABLE || message == null || signature == null || signature.length != 64) return false;
        try {
            if (verifyEd25519Native(message, signature, PRODUCTION_PUBLIC_KEY)) return true;
            boolean legacy = verifyEd25519Native(message, signature, LEGACY_PUBLIC_KEY);
            if (legacy) Log.i(TAG, "accepted dataset signed by legacy rotation key");
            return legacy;
        } catch (Throwable error) {
            Log.w(TAG, "verification failed safely: " + error.getClass().getSimpleName());
            return false;
        }
    }

    static boolean available() { return AVAILABLE; }

    private static native boolean selfTestNative();
    private static native boolean verifyEd25519Native(byte[] message, byte[] signature,
                                                       byte[] publicKey);
}
