package com.travianpatch.notifier;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;
import android.util.Log;

import java.security.KeyStore;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * Stores the Travian lobby session cookie encrypted at rest, using an
 * Android Keystore-backed AES-256-GCM key that never leaves the device's
 * keystore. Deliberately hand-rolled instead of pulling in
 * androidx.security.crypto: that library isn't already bundled in the
 * target app's dex (unlike okhttp/androidx.core, see build.gradle.kts),
 * so merging one in would risk class conflicts with whatever the host app
 * already ships. This only ever stores the session cookie — never the
 * account password, which is used once in LoginActivity and discarded.
 */
final class SecureStore {

    private static final String TAG = "TravianNotifier";
    private static final String PREFS_NAME = "travian_notifier_secure";
    private static final String KEY_ALIAS = "travian_notifier_session_key";
    private static final String KEYSTORE_PROVIDER = "AndroidKeyStore";
    private static final String PREF_IV = "session_iv";
    private static final String PREF_CIPHERTEXT = "session_ciphertext";
    private static final int GCM_TAG_BITS = 128;

    private SecureStore() {
    }

    static synchronized void saveSessionCookie(Context ctx, String cookieValue) {
        try {
            SecretKey key = getOrCreateKey();
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] iv = cipher.getIV();
            byte[] ciphertext = cipher.doFinal(cookieValue.getBytes("UTF-8"));

            prefs(ctx).edit()
                    .putString(PREF_IV, Base64.encodeToString(iv, Base64.NO_WRAP))
                    .putString(PREF_CIPHERTEXT, Base64.encodeToString(ciphertext, Base64.NO_WRAP))
                    .apply();
        } catch (Exception e) {
            Log.e(TAG, "failed to save session cookie", e);
        }
    }

    /** Returns the stored session cookie, or null if there isn't one / it can't be decrypted. */
    static synchronized String loadSessionCookie(Context ctx) {
        SharedPreferences prefs = prefs(ctx);
        String ivB64 = prefs.getString(PREF_IV, null);
        String ctB64 = prefs.getString(PREF_CIPHERTEXT, null);
        if (ivB64 == null || ctB64 == null) {
            return null;
        }
        try {
            SecretKey key = getOrCreateKey();
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            byte[] iv = Base64.decode(ivB64, Base64.NO_WRAP);
            cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(GCM_TAG_BITS, iv));
            byte[] plain = cipher.doFinal(Base64.decode(ctB64, Base64.NO_WRAP));
            return new String(plain, "UTF-8");
        } catch (Exception e) {
            Log.w(TAG, "failed to decrypt stored session, treating as logged out: " + e);
            return null;
        }
    }

    static synchronized void clear(Context ctx) {
        prefs(ctx).edit().clear().apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    private static SecretKey getOrCreateKey() throws Exception {
        KeyStore ks = KeyStore.getInstance(KEYSTORE_PROVIDER);
        ks.load(null);
        SecretKey existing = (SecretKey) ks.getKey(KEY_ALIAS, null);
        if (existing != null) {
            return existing;
        }
        KeyGenerator kg = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KEYSTORE_PROVIDER);
        KeyGenParameterSpec spec = new KeyGenParameterSpec.Builder(
                KEY_ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build();
        kg.init(spec);
        return kg.generateKey();
    }
}
