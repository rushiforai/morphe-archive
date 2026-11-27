// Minimal APK signer/verifier on top of apksig (com.android.tools.build:apksig).
//   MiniApkSigner sign <keystore> <storepass> <alias> <keypass> <in.apk> <out.apk>
//   MiniApkSigner verify <apk>
// Used only for the synthetic test fixture and for verify_apk.sh reports.
import com.android.apksig.ApkSigner;
import com.android.apksig.ApkVerifier;
import java.io.File;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.Collections;

public class MiniApkSigner {
  public static void main(String[] a) throws Exception {
    if (a.length == 7 && a[0].equals("sign")) {
      KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
      try (FileInputStream in = new FileInputStream(a[1])) { ks.load(in, a[2].toCharArray()); }
      PrivateKey key = (PrivateKey) ks.getKey(a[3], a[4].toCharArray());
      X509Certificate cert = (X509Certificate) ks.getCertificate(a[3]);
      ApkSigner.SignerConfig sc = new ApkSigner.SignerConfig.Builder(
          "CERT", key, Collections.singletonList(cert)).build();
      new ApkSigner.Builder(Collections.singletonList(sc))
          .setInputApk(new File(a[5])).setOutputApk(new File(a[6]))
          .setV1SigningEnabled(true).setV2SigningEnabled(true).setV3SigningEnabled(false)
          .build().sign();
      System.out.println("signed " + a[6]);
    } else if (a.length == 2 && a[0].equals("verify")) {
      ApkVerifier.Result r = new ApkVerifier.Builder(new File(a[1])).build().verify();
      System.out.println("verified=" + r.isVerified() + " v1=" + r.isVerifiedUsingV1Scheme()
          + " v2=" + r.isVerifiedUsingV2Scheme() + " v3=" + r.isVerifiedUsingV3Scheme());
      for (X509Certificate c : r.getSignerCertificates()) {
        byte[] d = MessageDigest.getInstance("SHA-256").digest(c.getEncoded());
        StringBuilder sb = new StringBuilder();
        for (byte b : d) sb.append(String.format("%02x", b));
        System.out.println("signer sha256=" + sb + " subject=" + c.getSubjectX500Principal());
      }
      for (ApkVerifier.IssueWithParams e : r.getErrors()) System.out.println("error: " + e);
      if (!r.isVerified()) System.exit(1);
    } else {
      System.err.println("usage: MiniApkSigner sign <ks> <storepass> <alias> <keypass> <in> <out> | verify <apk>");
      System.exit(2);
    }
  }
}
