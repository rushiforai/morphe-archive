package app.morphe.extension.mtmanager;

import com.android.apksig.ApkSigner;
import com.android.apksig.ApkSigner.SignerConfig;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.Collections;
import java.util.List;

/**
 * Pure-Java reimplementation of MT Manager's "Sign file" tool.
 *
 * Uses Android's official apksig library. The signing key is an embedded
 * PKCS#12 keystore (Base64, generated at build time), which re-signs APKs with
 * a stable self-signed key. This mirrors MT Manager's "Signing Key Default"
 * behaviour: a fixed key, not the stock MT key.
 */
final class MtApkSigner {

    private static final String KEYSTORE_PASSWORD = "morphemt";
    private static final String KEY_ALIAS = "mt";
    private static final String KEYSTORE_B64 =
        "MIIJwwIBAzCCCXwGCSqGSIb3DQEHAaCCCW0EgglpMIIJZTCCBWEGCSqGSIb3DQEHAaCCBVIEggVOMIIFSjCCBUYGCyqGSIb3DQEM" +
        "CgECoIIE+zCCBPcwKQYKKoZIhvcNAQwBAzAbBBQXZpi2JjCwVKEL+JJNladIstIjBgIDAMNQBIIEyNUvomHPl80cRg0dXuGX5Ra0" +
        "BKVWN9utquPrxjvoGcbyNMpUxz8wHsGOIy1VOxVEC1mGxkAkOJJfSYznqVrORmD8i0jxlp0cjFmLBXNET6l5iOg4PUrf0KeqA3SN" +
        "Pr5ObdjFC8CwyiBUxlWntI3QkHfcDFdyNgzft6MVx9FxDxlf/oFZui5AwucAZcB3yP/rsbDKge3Srq2Kj+z7t7t7sv702K9zikkQ" +
        "COEydM5/HuiaQC3CQjyAfqMPIXlCx88ET3QDYz530Dt8BNmBYkeiAn32PZWpLTk4hIn9mZk5rerz54pJx//qpH5pYRJANuTxwSOL" +
        "7uYzAuo+eU9jW0QPtaBXIN77YM0Xr/3n0yyJYO0F6nFxJsTzdRpQDA+B7RIRVLcRHozE2A40/UwFXIOTcMKQMRdzjIQjNkbldtAx" +
        "wk86Cz4DkFh6xJiUHczH8vGylaBrFTTYcMfOIE8Ykjbtcc3SjbSNqQjXC/lTAos+u0yYQSyV/rEY1avcoA3xK72z+Sc2oTs87nes" +
        "zFuzAQQBBbLUNS+1NN1aW1a+SIYNgOGxj7llwe9rEGEPqbjnt6mwFQ4c4faXO/90xjiLxKX7B6Q4L8Ev05/XC+qWB16IYMfvCG0a" +
        "bPg0dqdkk+zq+hrUOtay/1ADQcvUK4JE1YJ3LcCy8wRu3S6yPu/1t8A2UdtuXCDL4qyyT5Oeo87sOTWjMb0Oka+8oXAtNUkRaMuI" +
        "M1ypZcdmGSYd8XDIF7sEFkIZpIR/6bbwbEQAPGJ/z2rY695EemNCfs5CTQkdXQa4c5oYmuyFo6//4vT+zH0tTJqNT81hR83aXkde" +
        "bfPkrYpBllKk+faAgbVHsh9bdjp7KzSOC+zML+3hoE0yLKUzHeGQKbh712ZBYy/zWvvWMQkHrfX+OKmKHA9rwG0FBne81UucUI/Q" +
        "RqMrDYjlMp8th8e40j2Wa38mMe56ShsOWtn759g0x550KCMR+zzhAA0uQ4nl2XFcYCLKvqpJwJtqvmx2P0uUOvlkfVF8imBB/nvg" +
        "kNA9bABciJLVjln0aSozM4dg/wOWOZIOMVYl8RBtzoVaFnvl2NyWPXwRGBWnuFYSv/god0g4bLvc0HZgPvOEsO0PdoN2Sj38Mo1N" +
        "Zzg3xi6G0rtxZ3GC4iSddDW5HNWCDSJVQaBMAOmlHUnaE2wet/otWOdIUw/QxTDXWcAWr9757IPlMmdt8BlxU0PzEylyv2AvcqSf" +
        "tj95vBr8imhgF6ggmIcJLMCUasKyvI06L4IGPTMGWWCygSgXDab2eYjV7ojkoMI+LwhHWa4An1Fg8lo7XbidczptwrJ1h5GWRsun" +
        "ov7KIKt+gVDJo7TWWZIWbliI9AJlM6jcud9IKz7LammZ6KFZAWr92mVv57HCL5OI9KXKflLb1qAIhcfHavoeIt6P8Ik38C0nuRZ4" +
        "WNYMxC8WkDkTsXvCMeaeZM2hLI0Z3XSwvcviAR5Sv5WaCzoW4wTNl4R1w4HlPSajEqRwZQZ0BOX3Zbrzt4gtT3HZcqWwqvjuRogU" +
        "oo5RpOMVRcwbBhYCtZOLwSVH+rpI4+H6YKQeXEywnxaZ/fqu8kmug35QmWEuDSd0BNYtnFNKoKE35NGdGnxFyW7dYRSTOs1dW3OX" +
        "jA+bJrdrAjE4MBMGCSqGSIb3DQEJFDEGHgQAbQB0MCEGCSqGSIb3DQEJFTEUBBJUaW1lIDE3ODY1MjUwMDI4NjcwggP8BgkqhkiG" +
        "9w0BBwagggPtMIID6QIBADCCA+IGCSqGSIb3DQEHATApBgoqhkiG9w0BDAEGMBsEFGu7XDQ+fgPPZxROjJO1DZi4PZm7AgMAw1CA" +
        "ggOo9wF5kh6djiJ34BBarMb5vawCtJfA2sGhc4Rg5MGq+qFrtZl6IsEELprayubo05Bnoa5nh6+G07uEfB0MRlir9q5yUgxy4p7Q" +
        "rvI4NBDHyjU+V4YyUexstK6EeyeAIPtDN64YAKuatKF4HTXq23kx7e7pC6TjV+LMK+/YjFBGOPePsgO6Ftig8kdbG3/ZPeiLAksk" +
        "9Q5TRQ2re+P+yAFK86nsCi0qzEKJmURCmNl0tWhU2/fMRTmnQKLdr+7s1+lPBJZqAPJ3KxvG6Fl+QkRSXEiVmLvd1qShAZnYIf3z" +
        "aEM4IppO+L2PTPiNOwgX4gMaG1tp+j1w/zpr3dOExCQ3bxG3cFAHcp55S20xEm5JwQZFNBeenQA77ZrqS9eWH2XBm0EjIBAMgjDS" +
        "BrlOgttn2GQ7jKi7csP3vNGcOF3CtuGQ3YAdRg01V6oFBiT/7+VARrU7zOG0R19r6rMJAWF8jTlq9VnF+LNEq/FPgJGj09S/6qzh" +
        "JPTi0kN/TQZf5tZDfSKReW6CGH9q+k6WTwdy2w7b6lYYfYXpr8X44JXXh0vFa8H0XBd09dNcv3kZ7+EtVzB/J8zSuy70/Vrucdcp" +
        "5G2O1GBzNirKBYQOjotWaUd2hw21qIPDp19z3ojRj/f+aDwxWaozdHJuQjZ/5Fdvz+UgIJXGRA/q1yC9n7RnZYufEe3gHR4h/tkx" +
        "Vt+21Q2H3LHwYj5Tlpl/RZgnS8KkKRhBkOQ10W0MfOrgsDiYGJxensNYKh5tzKsuwzySovXwh5pnNSdwPtB53d7otMNmHKnAjk5E" +
        "LsqGnRDLG69DWTpYPY4nraYLk5sJDx2+L2wMMCDPvBsILLYVZ7uw8P0ns1XnaUzduLJSlby9C9HL2P0Vq+i4pUcIF9iwk4ktqaBg" +
        "Vh1DzWCvxo0yx8VKGgEwVtgIh/B+docQjrq8Lb/sqY85TeelReAHRIuLCqSei3UDAGnQYvf+JKxU6h5sjtNHNyyYPUdLMAnvpysI" +
        "8OnUT9vkuxOnMnh4RyNXizIo++rVOrbY+S9FPGPs2okrUZm7YtAZdlN71YuQRlKOEp3BOEiDfWR6wItoDAkSU0oPzm3VJixylU0d" +
        "nXK09TXSDmUlpXb4og20zbLgs7XtoajNp7hggluMDWwef5nLxWGq2YAcelh1KKBzYIQ8AAgqmSR2uX7xRz1ONQoReNgJ1UIA+k0C" +
        "oRaoEmUxVLJqczil1v5XdC7aCiRUeIB8z/EdqwkCfiPIO9/Oo37HMD4wITAJBgUrDgMCGgUABBQ5HAHT38P0Ug3j0uQalOaDlgKw" +
        "0QQU/NuZtDrM9R/GBn55XX0nfOy9mEsCAwGGoA==";
    private MtApkSigner() {
    }

    static boolean sign(String apkIn, String apkOut) throws Exception {
        File inFile = new File(apkIn);
        if (!inFile.isFile()) throw new IllegalArgumentException("Input is not a file: " + apkIn);

        File outFile = new File(apkOut);
        File parent = outFile.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create output dir: " + parent);
        }

        KeyStore ks = loadKeyStore();
        SignerConfig signerConfig = buildSignerConfig(ks);

        ApkSigner.Builder builder = new ApkSigner.Builder(Collections.singletonList(signerConfig));
        builder.setInputApk(inFile);
        builder.setOutputApk(outFile);
        builder.setV1SigningEnabled(true);
        builder.setV2SigningEnabled(true);
        builder.setV3SigningEnabled(true);
        builder.setMinSdkVersion(21);
        builder.build().sign();

        return outFile.isFile() && outFile.length() > 0;
    }

    private static KeyStore loadKeyStore() throws Exception {
        KeyStore ks = KeyStore.getInstance("PKCS12");
        byte[] bytes = android.util.Base64.decode(KEYSTORE_B64, android.util.Base64.DEFAULT);
        try (ByteArrayInputStream in = new ByteArrayInputStream(bytes)) {
            ks.load(in, KEYSTORE_PASSWORD.toCharArray());
        }
        return ks;
    }

    private static SignerConfig buildSignerConfig(KeyStore ks) throws Exception {
        PrivateKey privateKey = (PrivateKey) ks.getKey(KEY_ALIAS, KEYSTORE_PASSWORD.toCharArray());
        if (privateKey == null) throw new IllegalStateException("No key for alias " + KEY_ALIAS);

        // Build the certificate chain from the keystore (in signing order).
        java.security.cert.Certificate[] chain = ks.getCertificateChain(KEY_ALIAS);
        if (chain == null || chain.length == 0) {
            chain = new java.security.cert.Certificate[]{ks.getCertificate(KEY_ALIAS)};
        }
        List<X509Certificate> certs = new java.util.ArrayList<>(chain.length);
        for (java.security.cert.Certificate c : chain) {
            certs.add((X509Certificate) c);
        }

        return new SignerConfig.Builder(KEY_ALIAS, privateKey, certs).build();
    }
}
