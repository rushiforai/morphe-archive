import com.android.apksig.ApkVerifier;
import java.io.File;
import java.security.MessageDigest;
import java.util.HexFormat;

/** Verify the supported clean APK's pre-rotation and current platform identities.
 * Compile/run with the Morphe Desktop jar on the classpath. No account or token is needed.
 */
public final class VerifyCalendarOAuthIdentity {
    private static final String INPUT_SHA256 =
        "d7f155c7ecad7ecc5c57f2c6af15edd6a0a6444ce93b9d08c69623c18e4b1cf3";
    private static final String OAUTH_SIGNER = "38918a453d07199354f8b19af05ec6562ced5788";
    private static final String ROTATED_SIGNER = "bd32424203e0fb25f36b57e5aa356f9bdd1da998";

    private static String digest(String algorithm, byte[] data) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance(algorithm).digest(data));
    }

    private static void verify(File apk, int api, String expected) throws Exception {
        ApkVerifier.Result result = new ApkVerifier.Builder(apk)
            .setMinCheckedPlatformVersion(api).setMaxCheckedPlatformVersion(api).build().verify();
        if (!result.isVerified() || result.getSignerCertificates().size() != 1) {
            throw new AssertionError("APK signature verification failed at API " + api);
        }
        String actual = digest("SHA-1", result.getSignerCertificates().get(0).getEncoded());
        if (!expected.equals(actual)) throw new AssertionError("Unexpected signer at API " + api + ": " + actual);
        System.out.println("PASS API " + api + " signer " + actual);
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new IllegalArgumentException("Supply the clean 2026.37.0 base APK");
        File apk = new File(args[0]);
        if (!INPUT_SHA256.equals(digest("SHA-256", java.nio.file.Files.readAllBytes(apk.toPath())))) {
            throw new AssertionError("Clean input hash changed");
        }
        verify(apk, 32, OAUTH_SIGNER);
        verify(apk, 36, ROTATED_SIGNER);
    }
}
