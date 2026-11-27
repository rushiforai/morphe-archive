package app.johninnl.modelhost.api;
import java.util.Locale;
/** A release identity requires all three independent checks, including an expected digest supplied by trusted release metadata. */
public final class ApkIdentityVerifier {
    private ApkIdentityVerifier(){}
    public static void verify(String expectedPackage,String expectedDigest,String expectedSigner,String actualPackage,String actualDigest,String actualSigner,int signerCount)throws HostException {
        if(expectedPackage==null || !expectedPackage.equals(actualPackage))throw new HostException("WRONG_APK_PACKAGE");
        if(!digest(expectedDigest).equals(digest(actualDigest)))throw new HostException("WRONG_APK_DIGEST");
        if(signerCount!=1 || !digest(expectedSigner).equals(digest(actualSigner)))throw new HostException("WRONG_APK_SIGNER");
    }
    static String digest(String value)throws HostException {
        String normalized=value==null?"":value.replace(":","").toLowerCase(Locale.ROOT);
        if(!normalized.matches("[0-9a-f]{64}"))throw new HostException("INVALID_RELEASE_IDENTITY");return normalized;
    }
}
