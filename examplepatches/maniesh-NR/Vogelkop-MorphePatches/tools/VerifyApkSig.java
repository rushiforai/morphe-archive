import com.android.apksig.ApkVerifier;

import java.io.File;

/** Verifies an APK's signature schemes the way a device does. */
public final class VerifyApkSig {
    public static void main(String[] args) throws Exception {
        ApkVerifier.Result r = new ApkVerifier.Builder(new File(args[0]))
                .setMinCheckedPlatformVersion(29)
                .build()
                .verify();
        System.out.println("verified: " + r.isVerified());
        System.out.println("v1: " + r.isVerifiedUsingV1Scheme());
        System.out.println("v2: " + r.isVerifiedUsingV2Scheme());
        System.out.println("v3: " + r.isVerifiedUsingV3Scheme());
        for (java.security.cert.X509Certificate c : r.getSignerCertificates()) {
            System.out.println("signer: " + c.getSubjectX500Principal().getName());
        }
        for (ApkVerifier.IssueWithParams i : r.getErrors()) System.out.println("ERROR: " + i);
        System.exit(r.isVerified() ? 0 : 1);
    }
}
