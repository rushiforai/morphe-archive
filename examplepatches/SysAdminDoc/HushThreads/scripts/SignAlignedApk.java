import app.morphe.patcher.apk.ApkSigner;
import com.android.apksig.ApkVerifier;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;

/** Sign an already aligned APK without converting or replacing its existing key. */
public final class SignAlignedApk {
    public static void main(String[] args) throws Exception {
        if (args.length != 4) throw new IllegalArgumentException("usage: SignAlignedApk <aligned.apk> <signed.apk> <keystore> <alias>");
        String password = System.getenv("HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD");
        if (password == null) throw new IllegalArgumentException("The signing password environment variable is unset.");
        String keyPassword = System.getenv("HUSHTHREADS_SIDELOAD_KEY_PASSWORD");
        if (keyPassword == null) keyPassword = password;
        ApkSigner signer = ApkSigner.INSTANCE;
        File keyFile = new File(args[2]);
        if (!Files.isRegularFile(keyFile.toPath())) throw new IllegalArgumentException("The existing keystore is missing.");
        KeyStore store;
        try (FileInputStream stream = new FileInputStream(keyFile)) {
            byte[] header = stream.readNBytes(4);
            boolean bks = header.length == 4 && header[0] == 0 && header[1] == 0 && header[2] == 0 &&
                    (header[3] == 1 || header[3] == 2);
            if (bks) {
                try (FileInputStream bksStream = new FileInputStream(keyFile)) {
                    store = signer.readKeyStore(bksStream, password.isEmpty() ? null : password);
                }
            } else {
                // The JDK probes JKS and PKCS12 independently of the filename extension.
                store = KeyStore.getInstance(keyFile, password.toCharArray());
            }
        }
        ApkSigner.PrivateKeyCertificatePair pair = signer.readPrivateKeyCertificatePair(store, args[3], keyPassword);
        File output = new File(args[1]);
        var config = new com.android.apksig.ApkSigner.SignerConfig.Builder("HushThreads",
                new com.android.apksig.KeyConfig.Jca(pair.getPrivateKey()), List.of(pair.getCertificate())).build();
        new com.android.apksig.ApkSigner.Builder(List.of(config))
                .setInputApk(new File(args[0])).setOutputApk(output)
                .setAlignmentPreserved(true).setLibraryPageAlignmentBytes(16384).build().sign();
        var verification = new ApkVerifier.Builder(output).build().verify();
        if (!verification.isVerified() || verification.getSignerCertificates().size() != 1 ||
                !Arrays.equals(pair.getCertificate().getEncoded(), verification.getSignerCertificates().get(0).getEncoded())) {
            throw new IllegalStateException("The signed APK failed verification or changed its signer.");
        }
        System.out.println("[sign] verified certificate SHA-256 " +
                HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(pair.getCertificate().getEncoded())));
    }
}
