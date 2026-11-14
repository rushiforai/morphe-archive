package app.template.extension.artwork;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.AtomicFile;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** Device-bound encryption. The ciphertext lives outside Android's automatic backups. */
public final class TmdbCredential {
    private static final String ALIAS = "morphe_artwork_tmdb_v3";
    private static final int IV_BYTES = 12;

    private TmdbCredential() {}

    public static synchronized String get(Context context) {
        try {
            byte[] data = file(context).readFully();
            if (data.length != IV_BYTES + 32 + 16) return null;
            SecretKey key = (SecretKey) keys().getKey(ALIAS, null);
            if (key == null) return null;
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, data, 0, IV_BYTES));
            byte[] plaintext = cipher.doFinal(data, IV_BYTES, data.length - IV_BYTES);
            try {
                String result = new String(plaintext, StandardCharsets.US_ASCII);
                return ArtworkRules.keyProblem(result) == null ? result : null;
            } finally {
                Arrays.fill(plaintext, (byte) 0);
            }
        } catch (Exception unavailable) {
            return null;
        }
    }

    public static synchronized void save(Context context, String value) throws Exception {
        if (ArtworkRules.keyProblem(value) != null) throw new IllegalArgumentException();
        SecretKey key = (SecretKey) keys().getKey(ALIAS, null);
        if (key == null) {
            KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
            generator.init(new KeyGenParameterSpec.Builder(ALIAS,
                    KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                    .setKeySize(256)
                    .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                    .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                    .build());
            key = generator.generateKey();
        }
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] plaintext = value.getBytes(StandardCharsets.US_ASCII);
        byte[] data;
        try {
            data = cipher.doFinal(plaintext);
        } finally {
            Arrays.fill(plaintext, (byte) 0);
        }
        byte[] iv = cipher.getIV();
        if (iv.length != IV_BYTES) throw new IllegalStateException();
        AtomicFile file = file(context);
        FileOutputStream out = file.startWrite();
        try {
            out.write(iv);
            out.write(data);
            file.finishWrite(out);
        } catch (Exception e) {
            file.failWrite(out);
            throw e;
        }
    }

    public static synchronized boolean remove(Context context) {
        file(context).delete();
        try {
            keys().deleteEntry(ALIAS);
        } catch (Exception ignored) {
            // Removing the ciphertext alone still removes the stored credential.
        }
        return get(context) == null;
    }

    private static KeyStore keys() throws Exception {
        KeyStore store = KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        return store;
    }

    private static AtomicFile file(Context context) {
        return new AtomicFile(new File(context.getNoBackupFilesDir(), ALIAS));
    }
}
