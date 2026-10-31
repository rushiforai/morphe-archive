package com.dhuadapter.signature;

import java.security.MessageDigest;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;

/**
 * Pure, dependency-free X.509 helpers (no android / Pine imports) so they are
 * unit-testable on a bare JVM. SignatureSpoof uses these to validate and
 * fingerprint the genuine cert it reads from assets/orig-cert.der.
 */
public final class CertReader {

    private CertReader() {}

    /** Parse a raw X.509 DER certificate. Returns null if the bytes are not a cert. */
    public static X509Certificate parse(byte[] der) {
        if (der == null || der.length == 0) {
            return null;
        }
        try {
            CertificateFactory cf = CertificateFactory.getInstance("X.509");
            return (X509Certificate) cf.generateCertificate(
                    new java.io.ByteArrayInputStream(der));
        } catch (Throwable t) {
            return null;
        }
    }

    /** Lowercase hex SHA-256 of the given bytes (the APK-signer certificate digest
     *  when passed a cert's DER encoding). Returns null on failure. */
    public static String sha256Hex(byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        try {
            byte[] d = MessageDigest.getInstance("SHA-256").digest(bytes);
            StringBuilder sb = new StringBuilder(d.length * 2);
            for (byte b : d) {
                sb.append(Character.forDigit((b >> 4) & 0xf, 16));
                sb.append(Character.forDigit(b & 0xf, 16));
            }
            return sb.toString();
        } catch (Throwable t) {
            return null;
        }
    }
}
