package app.morphe.extension.syncforreddit.redirects;

import android.util.Base64;

import androidx.annotation.Nullable;

import java.io.ByteArrayInputStream;
import java.net.HttpURLConnection;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

import app.morphe.extension.shared.Logger;

import okhttp3.OkHttpClient;

/**
 * A client certificate, for whatever asks us to prove who we are.
 *
 * <p>Two things do: a proxy that wants mTLS, and a Rimgo instance someone has put behind mTLS.
 * They need exactly the same thing done, so it is done here once.
 *
 * <p><b>Pasted in rather than chosen from a file.</b> Sync asks for no storage permission at all
 * and targets Android 13, so there is no path on the device it could read a file from. Either a
 * PKCS#12 keystore written out as base64, which is what most things hand you, or the PEM blocks
 * for a certificate and its key.
 *
 * <p>What is built is kept against the text it was built from, since setting up TLS is not
 * something to do per picture, and a certificate that has been changed has to take effect.
 */
public final class ClientCertificate {
    /** What was built, and what it was built from, so a change to the text rebuilds it. */
    private static final java.util.Map<String, SSLContext> built =
            new java.util.HashMap<>();

    private ClientCertificate() {}

    /**
     * @return Whether this looks like something worth trying to read. Says nothing about
     *         whether it can actually be read; that is only known once it is tried.
     */
    public static boolean looksSet(String pasted) {
        return pasted != null && !pasted.trim().isEmpty();
    }

    /**
     * @return A context that offers this certificate and goes on trusting what the device
     *         trusts, or null where the text cannot be read as a certificate and a key.
     */
    @Nullable
    public static synchronized SSLContext contextFor(String pasted, String password) {
        if (!looksSet(pasted)) {
            return null;
        }
        String key = pasted.hashCode() + ":" + password.hashCode();
        SSLContext already = built.get(key);
        if (already != null) {
            return already;
        }

        try {
            KeyManager[] mine = keyManagers(pasted.trim(), password.toCharArray());
            X509TrustManager trusting = platformTrust();
            if (mine == null || trusting == null) {
                return null;
            }
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(mine, new TrustManager[]{trusting}, null);
            // Only what was actually built is kept; a failure is worth retrying, since the
            // answer changes the moment the text is corrected.
            built.put(key, context);
            return context;
        } catch (Throwable ex) {
            // Throwable: a missing algorithm arrives as an Error, and failing to read a
            // certificate must leave everything else working rather than take the app down.
            Logger.printInfo(() -> "certificate: could not be set up: " + ex);
            return null;
        }
    }

    /** Offers the certificate on a client being built, where one is set. */
    public static void offerOn(OkHttpClient.Builder building, String pasted, String password) {
        SSLContext context = contextFor(pasted, password);
        if (context == null) {
            return;
        }
        try {
            X509TrustManager trusting = platformTrust();
            if (trusting != null) {
                building.sslSocketFactory(context.getSocketFactory(), trusting);
                Logger.printDebug(() -> "certificate: offering one on this client");
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "certificate: could not be offered: " + ex);
        }
    }

    /**
     * The same for a plain connection, which is what the instance checks and the album pages
     * are fetched with.
     */
    public static void offerOn(HttpURLConnection asking, String pasted, String password) {
        if (!(asking instanceof HttpsURLConnection)) {
            return;
        }
        SSLContext context = contextFor(pasted, password);
        if (context != null) {
            ((HttpsURLConnection) asking).setSSLSocketFactory(context.getSocketFactory());
        }
    }

    // region Reading what was pasted in.

    @Nullable
    private static KeyManager[] keyManagers(String pasted, char[] password) throws Exception {
        KeyStore holding = pasted.contains("-----BEGIN")
                ? fromPem(pasted, password) : fromPkcs12(pasted, password);
        if (holding == null) {
            return null;
        }
        KeyManagerFactory factory =
                KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
        factory.init(holding, password);
        return factory.getKeyManagers();
    }

    /** @return A keystore read from base64, which is how a .p12 is pasted in. */
    @Nullable
    private static KeyStore fromPkcs12(String pasted, char[] password) throws Exception {
        byte[] bytes;
        try {
            bytes = Base64.decode(withoutWhitespace(pasted), Base64.DEFAULT);
        } catch (IllegalArgumentException ex) {
            Logger.printInfo(() -> "certificate: this is neither PEM nor base64");
            return null;
        }
        KeyStore holding = KeyStore.getInstance("PKCS12");
        holding.load(new ByteArrayInputStream(bytes), password);
        return holding;
    }

    /**
     * @return A keystore built from the PEM blocks that were pasted in: the certificate, any
     *         that signed it, and the key. The key has to be an unencrypted PKCS#8 one — the
     *         {@code BEGIN PRIVATE KEY} kind — since an encrypted or an old PKCS#1 key would
     *         need an ASN.1 parser this has no business carrying. A PKCS#12 covers both of
     *         those, which is why it is the other thing accepted.
     */
    @Nullable
    private static KeyStore fromPem(String pasted, char[] password) throws Exception {
        List<Certificate> chain = new ArrayList<>();
        CertificateFactory certificates = CertificateFactory.getInstance("X.509");
        for (String block : blocksOf(pasted, "CERTIFICATE")) {
            byte[] bytes = Base64.decode(block, Base64.DEFAULT);
            chain.add(certificates.generateCertificate(new ByteArrayInputStream(bytes)));
        }
        if (chain.isEmpty()) {
            Logger.printInfo(() -> "certificate: no certificate in what was pasted in");
            return null;
        }

        List<String> keys = blocksOf(pasted, "PRIVATE KEY");
        if (keys.isEmpty()) {
            Logger.printInfo(() -> "certificate: no private key in what was pasted in; it needs "
                    + "the BEGIN PRIVATE KEY block as well as the certificate");
            return null;
        }
        PrivateKey key = keyFrom(Base64.decode(keys.get(0), Base64.DEFAULT));
        if (key == null) {
            return null;
        }

        KeyStore holding = KeyStore.getInstance("PKCS12");
        holding.load(null, password);
        holding.setKeyEntry("sync-up", key, password, chain.toArray(new Certificate[0]));
        return holding;
    }

    /**
     * @return The key, read as whichever kind it turns out to be. What the bytes hold is not
     *         said anywhere in them that is worth parsing, so each kind is tried in turn.
     */
    @Nullable
    private static PrivateKey keyFrom(byte[] bytes) {
        java.security.spec.PKCS8EncodedKeySpec spec =
                new java.security.spec.PKCS8EncodedKeySpec(bytes);
        for (String algorithm : new String[]{"RSA", "EC", "DSA"}) {
            try {
                return java.security.KeyFactory.getInstance(algorithm).generatePrivate(spec);
            } catch (Exception ex) {
                // Tried the next kind.
            }
        }
        Logger.printInfo(() -> "certificate: the private key is not an unencrypted PKCS#8 RSA, "
                + "EC or DSA key");
        return null;
    }

    /** @return The base64 inside each PEM block of this kind, in the order they appear. */
    private static List<String> blocksOf(String pasted, String kind) {
        List<String> found = new ArrayList<>();
        String begin = "-----BEGIN " + kind + "-----";
        String end = "-----END " + kind + "-----";
        int at = 0;
        while (true) {
            int from = pasted.indexOf(begin, at);
            if (from < 0) {
                return found;
            }
            int to = pasted.indexOf(end, from);
            if (to < 0) {
                return found;
            }
            found.add(withoutWhitespace(pasted.substring(from + begin.length(), to)));
            at = to + end.length();
        }
    }

    private static String withoutWhitespace(String what) {
        StringBuilder kept = new StringBuilder(what.length());
        for (int at = 0; at < what.length(); at++) {
            char each = what.charAt(at);
            if (!Character.isWhitespace(each)) {
                kept.append(each);
            }
        }
        return kept.toString();
    }

    /** @return What the device itself trusts, which is what we go on trusting. */
    @Nullable
    static X509TrustManager platformTrust() throws Exception {
        TrustManagerFactory factory =
                TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        factory.init((KeyStore) null);
        for (TrustManager each : factory.getTrustManagers()) {
            if (each instanceof X509TrustManager) {
                return (X509TrustManager) each;
            }
        }
        return null;
    }

    // endregion
}
