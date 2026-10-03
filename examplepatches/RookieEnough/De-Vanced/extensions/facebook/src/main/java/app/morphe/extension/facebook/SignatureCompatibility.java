/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.os.Build;
import android.util.Base64;
import android.util.Log;

import java.security.MessageDigest;
import java.util.concurrent.atomic.AtomicBoolean;

/** Substitutes Facebook's public signing certificate for the De-Vanced signer. */
public final class SignatureCompatibility {
    private static final String TAG = "DeVancedSignature";
    private static final String PATCH_SIGNER_SHA256_BASE64_URL =
            "ULkRam2zE7ILtPS41oP9tS64PKZgMC9QTp3PXoWM9AQ";
    private static final String MORPHE_SIGNER_SHA256_BASE64_URL =
            "Iu9BsdzR-Gl6uDxc5Ikj1JTG5yHP85puwCpFjZPZefw";
    private static final String OFFICIAL_CURRENT_CERTIFICATE_BASE64 =
            "MIIFxTCCA62gAwIBAgIUKpiwwU/C9IjsDQEIGVFPXf0QAhYwDQYJKoZIhvcNAQELBQAwgYkxHDAaBgNVBAMME01ldGEgUGxh" +
            "dGZvcm1zIEluYy4xFDASBgNVBAsMC01ldGEgTW9iaWxlMRwwGgYDVQQKDBNNZXRhIFBsYXRmb3JtcyBJbmMuMRMwEQYDVQQH" +
            "DApNZW5sbyBQYXJrMRMwEQYDVQQIDApDYWxpZm9ybmlhMQswCQYDVQQGEwJVUzAgFw0yNTAyMTkyMjMwMjNaGA8yMDU1MDIx" +
            "OTIyMzAyM1owgYkxHDAaBgNVBAMME01ldGEgUGxhdGZvcm1zIEluYy4xFDASBgNVBAsMC01ldGEgTW9iaWxlMRwwGgYDVQQK" +
            "DBNNZXRhIFBsYXRmb3JtcyBJbmMuMRMwEQYDVQQHDApNZW5sbyBQYXJrMRMwEQYDVQQIDApDYWxpZm9ybmlhMQswCQYDVQQG" +
            "EwJVUzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOygKFAhRzEpVinDGE0D3jC7E7wvAK9aVG8RnHyK2nWV++d9" +
            "Al3QeRiN6XcCQGFaCT4VqkD5PlGFO+qWsArLpuN9M57MmcfZw4dSXlr7jpGVF8/tn4msXjmJh6GIUuTeA06st8WzVukpmoR8" +
            "wpCRDXxEPVmF2XSUu1hxlDQ0R0aodFBXlx03qpxT159iif2MHSUJ4Llc6SqigwcaY0p37CXjJBwxgtza8SLEp95S9sgKamPw" +
            "jc0C4ESodZuMUbdRDSpj7M0ctO3sEukwlRIR9038C+pz/yPFhQ2QHHK/HeKYyiCcQ6X+FItDadEe3GzebuSXg2LPSDzPrVkY" +
            "TMxRbgVhi872/gWJRVk87NzAypOEYlhk3r94xAavKWp5iq821WPDrvkoxLqQI1hlpI/OrPGHgSpuHo4ekWx5Ms4MwJMGn/PE" +
            "WN1CkyjaDvHppVwnOCzbKuxCCpp4gxyOTH35BdDTRfAHU6kngNKxT+a/wJRZZJ4NY4lBG7KxZXCS3KIT7HToowFcNmqX0GTf" +
            "YN1MGC5+0I6gRWZ6q9gHaKwFVsRpdbSKlzPKHUM7zw+vnc3sIt3/6vht3DHVZxEj201sN/D4MNQs+kiHQZNcYRKfmwcc4biy" +
            "wWGm6+XiCIMez9j8iOQt0ByWyzz7BpD7hcA2EKSjBdHiHF1BC3ztN3tn+5sxAgMBAAGjITAfMB0GA1UdDgQWBBSF2JaBLt3v" +
            "6w3ce+pl73080a/ZozANBgkqhkiG9w0BAQsFAAOCAgEAIxAkjxx4CS5oTTFyl4UJPL4B5rV2CAn9LFYX2LagXtJBAPeJeiHG" +
            "zcyzjHU1UDc414PSJYAuTL7d2PuOb75/GZPpD55sOXVfriG7pIMCX/hWknllkY1VvDbjnCLmVYkANQeo14bF4913iP/GFYYJ" +
            "FJIDpDFnDgmO2AQsMlUDpkyKc3W8AFaI7A2VQZmJPbzEdam8NEi9DzIPA8uuaFLNtHc8FD13hDQ6NfQSK7ucMtIt8R+PHywQ" +
            "a513IXeH3PBIPDA9H+YytwPlOLjegkA9cD+pS74f46Y4bSb6iew3tc8ornp9ptIOmdWM7paQhy1xggaJAKl1MTgXcFaCcd1u" +
            "+pmU3P9CVmvwQ34xI2ys0hfzjDvTpl8F4pYnRmVl6pGQX+r5yY0UmIp3pQRi5ZRnoGrdB2q7dJFw9XyYxtyT7kaQU2FTykO0" +
            "sSCqCkn+e4L6fsOmh6r0QbtM2y/BY33FTjF45di/0Cqv2tuvWBIwaacRr26tm2d36cQeughj7ouBG/+sx/zTv7jqZKY80Hll" +
            "Ep/T4rleg0rzW19VidJ1xPxoaZdDIH2p75ZeaUpN26UL1YMkBZCtWobUObUuPJlmdlwmH7md30cykXElCCn29rMMHAq9fSzs" +
            "AK/bSZWS6xGwslF+qB7dkNGf7s9mCsUzvZo66eZaS5Ga0OL6Yh0P7NY=";
    private static final String OFFICIAL_LEGACY_CERTIFICATE_BASE64 =
            "MIICaDCCAdECBEqcRhAwDQYJKoZIhvcNAQEEBQAwejELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRIwEAYDVQQHEwlQYWxv" +
            "IEFsdG8xGDAWBgNVBAoTD0ZhY2Vib29rIE1vYmlsZTERMA8GA1UECxMIRmFjZWJvb2sxHTAbBgNVBAMTFEZhY2Vib29rIENv" +
            "cnBvcmF0aW9uMCAXDTA5MDgzMTIxNTIxNloYDzIwNTAwOTI1MjE1MjE2WjB6MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0Ex" +
            "EjAQBgNVBAcTCVBhbG8gQWx0bzEYMBYGA1UEChMPRmFjZWJvb2sgTW9iaWxlMREwDwYDVQQLEwhGYWNlYm9vazEdMBsGA1UE" +
            "AxMURmFjZWJvb2sgQ29ycG9yYXRpb24wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMIH1R3464yX2TugyMEALJKPqwDc" +
            "G0L8peZumcwwI+0tIU2CK8WejjXdz19Ex66K3lDX4MQ09QDmwTH0ooNPmH/EZAYRXeIBjruw1aPCYb2XWBzP73avxxNabVno" +
            "hV7NfqzI+HN+eUxgp2HFNrcrEfrI5gP12hotVKoQO4oTwNvBAgMBAAEwDQYJKoZIhvcNAQEEBQADgYEAXum+i8uyUGSNO3QS" +
            "kKgqHJ3C52oK8vIijx2fnEAHUpxEanAXXFqQDVFBgShm20a+ZVniFBYWSDmYIR9KZzFJ+yIyoQ0kdmOyapAx4V+EvBx00UH/" +
            "mKAtdvhbLIqyVxtkabIy2Odop/fKBPer5Kd1YVkWwHlAZWtYcXRXtCvZKKI=";
    private static final byte[] OFFICIAL_CURRENT_CERTIFICATE =
            Base64.decode(OFFICIAL_CURRENT_CERTIFICATE_BASE64, Base64.DEFAULT);
    private static final byte[] OFFICIAL_LEGACY_CERTIFICATE =
            Base64.decode(OFFICIAL_LEGACY_CERTIFICATE_BASE64, Base64.DEFAULT);
    private static final AtomicBoolean SPOOF_LOGGED = new AtomicBoolean();

    private SignatureCompatibility() {
    }

    public static byte[] spoofSignatureBytes(byte[] value) {
        if (value == null) return null;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value);
            String hash = Base64.encodeToString(
                    digest,
                    Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP
            );
            if (!PATCH_SIGNER_SHA256_BASE64_URL.equals(hash)
                    && !MORPHE_SIGNER_SHA256_BASE64_URL.equals(hash)) {
                return value;
            }

            if (SPOOF_LOGGED.compareAndSet(false, true)) {
                Log.i(
                        TAG,
                        "Substituted official Facebook signing certificate"
                );
            }
            byte[] certificate = Build.VERSION.SDK_INT >= 33
                    ? OFFICIAL_CURRENT_CERTIFICATE
                    : OFFICIAL_LEGACY_CERTIFICATE;
            return certificate.clone();
        } catch (Throwable ignored) {
            return value;
        }
    }
}
