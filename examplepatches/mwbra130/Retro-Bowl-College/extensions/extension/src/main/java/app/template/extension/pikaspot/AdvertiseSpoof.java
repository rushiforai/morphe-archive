package app.template.extension.pikaspot;

import android.content.Context;
import android.util.Base64;

import java.nio.charset.StandardCharsets;
import java.util.Random;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/**
 * Recomputes the "advertise" token that the device-param builder
 * (xf/b.a) attaches to every API request, most importantly the
 * startup device login (POST /auth/android/device).
 *
 * The stock value comes from the native
 * SignatureUtils.getSignature(Context, String) in libnative-lib.so.
 * Reverse-engineered from the 1.4.5 (versionCode 49) arm64 library,
 * the token is:
 *
 *   ts + "#" + Base64(AES-128-CBC/PKCS7(part1)) + "#" + SHA1(cert)
 *
 *   ts    = current time in MICROseconds (system_clock::now / 1000)
 *   part1 = androidId + ":" + ts + ":" + random, where random is
 *           uniform_int_distribution<int>(0, 1000) — a SMALL number,
 *           not a full-range int (the distribution's param block in
 *           .rodata is literally {0, 1000}). The v1.69.0/v1.69.1
 *           builds used a full-range Random.nextInt() here and were
 *           still rejected at the 30% stop.
 *   key   = first 16 chars of (ts + androidId)
 *   IV    = the literal "A-16-Byte-String"
 *   cert  = the APK signing certificate's DER bytes, read by the
 *           native code through PackageManager signatures[0], and
 *           formatted by hashByteArray as an UPPERCASE hex string
 *           with ":" between byte pairs (the classic certificate
 *           fingerprint format, e.g. "28:4E:FD:...:88") — NOT plain
 *           lowercase hex. The v1.69.0 build shipped the plain form
 *           and was still rejected at the 30% loading stop; the
 *           colon format is what the native code actually emits
 *           (the case-flip and separator insertion live in
 *           hashByteArray's output loop).
 *
 * The server validates the trailing SHA1 against the stock signing
 * certificate. A re-signed build computes it over its own signer
 * instead, the device login is rejected, and the loading screen
 * stops at 30% behind the generic "Can not connect to server"
 * dialog (the app maps every login failure to that dialog).
 *
 * This reimplementation runs the identical algorithm with the
 * stock certificate's SHA1 pinned, so the produced token is
 * indistinguishable from a genuine install's. The stock SHA1 is a
 * public value (it is printed by every APK signature tool); the
 * certificate is the Play App Signing key for
 * com.pika.dynamicisland, harvested 2026-11-11 from the stock
 * 1.4.5 XAPK's APK Signature Scheme v2 block (base and split
 * signers identical, 1420 DER bytes).
 *
 * Version-specific: do not reuse for other versions.
 */
public final class AdvertiseSpoof {
    /** SHA1 of the stock signing certificate (DER), in the native
     *  hashByteArray format: uppercase hex, ":" between byte pairs. */
    private static final String OFFICIAL_CERT_SHA1 =
        "28:4E:FD:AD:F1:11:56:56:81:7A:5B:2C:FD:AD:DF:69:6F:20:30:88";
    private static final byte[] AES_IV =
        "A-16-Byte-String".getBytes(StandardCharsets.UTF_8);

    private AdvertiseSpoof() {
    }

    /** Drop-in replacement for the native SignatureUtils.getSignature. */
    public static String getSignature(Context context, String androidId) {
        try {
            long ts = System.currentTimeMillis() * 1000L;
            int rand = new Random().nextInt(1001);
            String part1 = androidId + ":" + ts + ":" + rand;
            String key = (ts + androidId).substring(0, 16);
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(
                Cipher.ENCRYPT_MODE,
                new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES"),
                new IvParameterSpec(AES_IV)
            );
            String enc = Base64.encodeToString(
                cipher.doFinal(part1.getBytes(StandardCharsets.UTF_8)),
                Base64.NO_WRAP
            );
            return ts + "#" + enc + "#" + OFFICIAL_CERT_SHA1;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
