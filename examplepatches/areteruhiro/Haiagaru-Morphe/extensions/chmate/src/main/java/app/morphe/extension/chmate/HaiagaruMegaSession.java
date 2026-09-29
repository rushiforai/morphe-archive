package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** Stores only the MEGA session, encrypted with an app-private Android Keystore key. */
final class HaiagaruMegaSession {
    private static final String PREFS = "haiagaru.mega-sync.private";
    private static final String KEY_ALIAS = "haiagaru.mega-sync.v1";
    private static final String BLOB = "session";

    private HaiagaruMegaSession() {}

    static boolean hasSession(Context context) {
        return preferences(context).contains(BLOB);
    }

    static void saveSession(Context context, String session) throws Exception {
        if (Build.VERSION.SDK_INT < 24) throw new IOException("MEGA同期にはAndroid 7以降が必要です");
        if (session == null || session.isEmpty() || session.length() > 8192) {
            throw new IOException("MEGAセッションが不正です");
        }
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key());
        byte[] encrypted = cipher.doFinal(session.getBytes(StandardCharsets.UTF_8));
        JSONObject blob = new JSONObject();
        blob.put("iv", Base64.encodeToString(cipher.getIV(), Base64.NO_WRAP));
        blob.put("data", Base64.encodeToString(encrypted, Base64.NO_WRAP));
        if (!preferences(context).edit().putString(BLOB, blob.toString()).commit()) {
            throw new IOException("MEGAセッションを保存できませんでした");
        }
    }

    static String readSession(Context context) throws Exception {
        if (Build.VERSION.SDK_INT < 24) throw new IOException("MEGA同期にはAndroid 7以降が必要です");
        String stored = preferences(context).getString(BLOB, null);
        if (stored == null) throw new IOException("MEGAにログインしてください");
        JSONObject blob = new JSONObject(stored);
        byte[] iv = Base64.decode(blob.getString("iv"), Base64.DEFAULT);
        byte[] data = Base64.decode(blob.getString("data"), Base64.DEFAULT);
        if (iv.length != 12 || data.length < 17 || data.length > 8192) {
            throw new IOException("保存済みMEGAセッションが不正です。再ログインしてください");
        }
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, key(), new GCMParameterSpec(128, iv));
        return new String(cipher.doFinal(data), StandardCharsets.UTF_8);
    }

    static void removeSession(Context context) {
        preferences(context).edit().remove(BLOB).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static SecretKey key() throws Exception {
        KeyStore store = KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        KeyStore.Entry entry = store.getEntry(KEY_ALIAS, null);
        if (entry instanceof KeyStore.SecretKeyEntry) {
            return ((KeyStore.SecretKeyEntry) entry).getSecretKey();
        }
        KeyGenerator generator = KeyGenerator.getInstance(
                KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        generator.init(new KeyGenParameterSpec.Builder(KEY_ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build());
        return generator.generateKey();
    }
}
