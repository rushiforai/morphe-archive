package app.template.extension.droidcam;

import android.util.Base64;

/**
 * Supplies the ORIGINAL app's signing-certificate data for the service
 * Load hand-off. MainActivity passes the service
 * signatures[0].toByteArray() and signatures[0].hashCode(); the server
 * derives the video client's expected nonce from that hash
 * (hashCode & 6138), and the Lk crypto helper is seeded with the bytes.
 * A re-signed build would pass its own (debug) certificate instead:
 * different bytes, different hash (nonce 128 instead of 5912), so the
 * server rejects every video request from the official PC client and
 * the camera never starts. Returning the stock values restores stock
 * behaviour exactly.
 *
 * Data harvested 2026-11-05 from the original DroidCam 9.0
 * (versionCode 76): signer certificate, 743 DER bytes;
 * Signature.hashCode() == -1828759779, and -1828759779 & 6138 == 5912,
 * the nonce the official client sends (verified numerically and live).
 * Version-specific: do not reuse for other versions.
 */
public final class SigSpoof {
    private static final String CERT_B64 =
        "MIIC4zCCAcugAwIBAgIEWOUv6TANBgkqhkiG9w0BAQsFADAhMQswCQYDVQQGEwJDQTESMBAGA1UEChMJREVWNDdBUFBTMCAXDTIwMDYxNTIyMjExOVoYDzIxMTkwNTIzMjIyMTE5WjAhMQswCQYDVQQGEwJDQTESMBAGA1UEChMJREVWNDdBUFBTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6H2Br7B7PJLYxQO4sltD+vf5uDE32hAObipynB4H6qsSRrkTEbVssSqgOpGOP0d1BQHRC6XUMm5xKOzzrmoA0z1cdsZgjC9QGsy08r1AoW8xCwHUW69ybG6EdTBbo4Lp3EbcTeXU32FNZvFSsUCvzcAPxhoEYw/+xAPhE8M0Z/svOOBIefCwjoIiAjbXLgeDDINdC3zVIRU4Pu3bL8LG4Yl1YS7PPeoDPOxLKRxmx895aP/ZLBWrEbEB3tGyHTNsAVDw1DjFQqmu//gI3bvl2GdQ1vcwFXpkK0qPGoUtteFYj5iaaiBTmAd/vMRGQj7KTtz8Q0ogjRxxQcboPJN/MwIDAQABoyEwHzAdBgNVHQ4EFgQUDHW2+IDy6DRidYu9PnhS+dvcxg8wDQYJKoZIhvcNAQELBQADggEBAMVGP0zny3hDXQ1T74iRDMYPWZMW8NHjziAFR0VdYGACCG6w5oxq2PwwFKNGC1VIOQRLEln1c0uBdQdhB1cWDocAjEL9l2gwBNc3zGXiO5NnQdzrh+iOq1LCzz0KLUz5dP8nETMa7kwxdKnMwJbwnWaIAwJY1l+IoLUpfhLiuxNa6kN1bO7kl29yfW7egr4+95wCgwIqMgnwJkBmA24mfHMmxCfi4pq5eEied83NXTg+bx1RkOygoH4pyVLQ5qG07ueSBUuYAl3LM8x9ct751ya5SpNvbAZcpJdUZo9KY4UkCL2Kmz/IzSvkRQH+Ec6gCyWr3XpAIl9sGALdrfxDuiE=";
    private static final int SIG_HASH = -1828759779;

    private SigSpoof() {
    }

    /** The stock signing certificate bytes (fresh copy per call). */
    public static byte[] cert() {
        return Base64.decode(CERT_B64, Base64.DEFAULT);
    }

    /** The stock Signature.hashCode() for those bytes. */
    public static int hash() {
        return SIG_HASH;
    }
}
