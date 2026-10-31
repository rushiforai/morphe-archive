package app.bitchord.telegram;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;

import java.io.File;
import java.security.KeyStore;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

/** Private no-backup storage; application credentials are encrypted with Android Keystore. */
final class CredentialStore {
    private final Context context;
    private final File file;

    CredentialStore(Context context, File home) {
        this.context = context;
        file = new File(home, "application.sealed.json");
    }

    boolean exists() {
        return file.exists();
    }

    ApplicationCredentials load() throws Exception {
        return exists()
                ? CredentialCipher.open(TelegramBridge.readJson(file), key())
                : ApplicationCredentials.empty();
    }

    void save(ApplicationCredentials value) throws Exception {
        TelegramBridge.writeJson(file, CredentialCipher.seal(value, key()));
    }

    private SecretKey key() throws Exception {
        String alias = context.getPackageName() + ".telegram.application";
        KeyStore store = KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        if (!store.containsAlias(alias)) {
            KeyGenerator generator = KeyGenerator.getInstance("AES", "AndroidKeyStore");
            generator.init(
                    new KeyGenParameterSpec.Builder(
                                    alias,
                                    KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                            .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                            .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                            .build());
            generator.generateKey();
        }
        return (SecretKey) store.getKey(alias, null);
    }
}
