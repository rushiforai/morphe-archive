package app.template.extension.extension;

import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import java.security.KeyStore;
import java.security.GeneralSecurityException;
import java.io.IOException;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

/** Installation-local, non-exportable key for identifying credential contexts. */
public final class ReplayKey {
    private static final String ALIAS="morphe_printer_context_hmac_v1";
    public static synchronized SecretKey getOrCreate() throws GeneralSecurityException, IOException {
        KeyStore store=KeyStore.getInstance("AndroidKeyStore");store.load(null);
        if(store.containsAlias(ALIAS)){
            java.security.Key key=store.getKey(ALIAS,null);
            if(!(key instanceof SecretKey))throw new GeneralSecurityException("Unexpected key type");
            return (SecretKey)key;
        }
        KeyGenerator generator=KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_HMAC_SHA256,"AndroidKeyStore");
        generator.init(new KeyGenParameterSpec.Builder(ALIAS,KeyProperties.PURPOSE_SIGN|KeyProperties.PURPOSE_VERIFY)
                .setDigests(KeyProperties.DIGEST_SHA256).build());
        return generator.generateKey();
    }
    private ReplayKey() {}
}
