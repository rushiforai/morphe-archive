import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.List;

/** Preserve the 16 KiB native-library alignment when adding APK signatures. */
public class SignRelease {
    public static void main(String[] args) throws Exception {
        char[] storePassword = System.getenv("WAZE_STORE_PASSWORD").toCharArray();
        char[] keyPassword = System.getenv("WAZE_KEY_PASSWORD").toCharArray();
        try (var input = new FileInputStream(args[0])) {
            var store = KeyStore.getInstance("PKCS12");
            store.load(input, storePassword);
            var signer = new com.android.apksig.ApkSigner.SignerConfig.Builder("WazeCustomPatches",
                (PrivateKey) store.getKey(args[1], keyPassword),
                List.of((X509Certificate) store.getCertificate(args[1]))).build();
            new com.android.apksig.ApkSigner.Builder(List.of(signer))
                .setInputApk(new File(args[2])).setOutputApk(new File(args[3]))
                .setLibraryPageAlignmentBytes(16384).setAlignmentPreserved(true)
                .build().sign();
        } finally {
            Arrays.fill(storePassword, '\0');
            Arrays.fill(keyPassword, '\0');
        }
    }
}
