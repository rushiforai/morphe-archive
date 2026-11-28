package com.waze.gw;

import android.content.Context;

/** AES dataset unwrap. The release certificate digest and AES operation stay in libwzaux. */
final class DatasetCrypto {
    private static final boolean LOADED;

    static {
        boolean loaded = false;
        try {
            System.loadLibrary("wzaux");
            loaded = true;
        } catch (Throwable ignored) { }
        LOADED = loaded;
    }

    private DatasetCrypto() { }

    static byte[] decrypt(Context context, byte[] ciphertext, byte[] nonce, byte[] authTag,
                          byte[] aad, String keyId) throws Exception {
        if (!LOADED) throw new SecurityException("dataset crypto unavailable");
        if (context == null || ciphertext == null || nonce == null || authTag == null
                || aad == null || keyId == null) {
            throw new SecurityException("invalid encrypted dataset");
        }
        byte[] result = d(context, ciphertext, nonce, authTag, aad, keyId);
        if (result == null || result.length == 0) {
            throw new SecurityException("dataset decryption rejected");
        }
        return result;
    }

    private static native byte[] d(Context context, byte[] ciphertext, byte[] nonce,
                                   byte[] authTag, byte[] aad, String keyId);
}
