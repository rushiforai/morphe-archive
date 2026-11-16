package app.danielthemaniel.patches.campfire.extension;

import android.content.Context;

/**
 * Firebase Installations sends the app's signing-cert SHA-1 (X-Android-Cert) with every request,
 * read through AndroidUtilsLight.getPackageCertificateHashBytes(). Niantic's Firebase API key is
 * restricted to their cert, so the re-signed app gets 403 -> no Firebase installation -> no FCM
 * token -> no push notifications. Report the original cert for Campfire itself.
 */
@SuppressWarnings("unused")
public final class CertSpoof {
    private CertSpoof() {}

    private static final String PACKAGE = "com.nianticlabs.campfire";

    /** Niantic's release cert SHA-1 (shared with Pokémon GO). */
    private static final byte[] ORIGINAL_CERT_SHA1 = hex("321187995bc7cdc2b5fc91b11a96e2baa8602c62");

    /** Original cert hash for Campfire's own package, or null to run the real lookup. */
    public static byte[] certHash(Context context, String packageName) {
        return PACKAGE.equals(packageName) ? ORIGINAL_CERT_SHA1.clone() : null;
    }

    private static byte[] hex(String s) {
        byte[] out = new byte[s.length() / 2];
        for (int i = 0; i < out.length; i++) {
            out[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
        }
        return out;
    }
}
