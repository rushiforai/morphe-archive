package app.morphe.extension.swiftkey;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.time.OffsetDateTime;
import java.time.format.DateTimeParseException;
import java.util.Base64;
import java.util.Locale;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.json.JSONException;
import org.json.JSONObject;

/** Talks to SyncClipboard's HTTPS endpoint and trusts only the certificate key named in the pairing. */
final class MacClipboardClient {
    /** SyncClipboard sends longer text as a file transfer, which this client does not implement. */
    static final int MAX_TEXT_LENGTH = 10240;
    private static final String PATH = "/SyncClipboard.json";

    static final class Clip {
        final String hash;
        final String text;
        /** When the Mac server stored the clip, or 0 when it did not say. */
        final long copiedAtMillis;

        Clip(String hash, String text, long copiedAtMillis) {
            this.hash = hash;
            this.text = text;
            this.copiedAtMillis = copiedAtMillis;
        }
    }

    /** The Mac answered with a 4xx status. Sending the same request again will not help. */
    static final class RejectedException extends IOException {
        RejectedException(String message) {
            super(message);
        }
    }

    private final MacClipboardPairing pairing;
    private final SSLSocketFactory sockets;
    private final String authorization;
    private int preferredHost;

    MacClipboardClient(MacClipboardPairing pairing) throws GeneralSecurityException {
        this.pairing = pairing;
        SSLContext tls = SSLContext.getInstance("TLS");
        tls.init(null, new TrustManager[]{new PinnedKeyTrustManager(pairing.pin)}, null);
        sockets = tls.getSocketFactory();
        String credentials = pairing.user + ":" + pairing.password;
        authorization = "Basic " + Base64.getEncoder().encodeToString(credentials.getBytes(StandardCharsets.UTF_8));
    }

    /** SyncClipboard identifies text by the uppercase hex SHA-256 of its UTF-8 bytes. */
    static String hash(String text) {
        StringBuilder hex = new StringBuilder(64);
        for (byte value : sha256(text.getBytes(StandardCharsets.UTF_8))) {
            hex.append(String.format(Locale.ROOT, "%02X", value));
        }
        return hex.toString();
    }

    void send(String text) throws IOException {
        String body;
        try {
            body = new JSONObject()
                .put("type", "Text")
                .put("hash", hash(text))
                .put("text", text)
                .put("hasData", false)
                .put("size", text.length())
                .toString();
        } catch (JSONException error) {
            throw new IOException(error);
        }
        request("PUT", body);
    }

    /** Returns the Mac's current text, or null for images, files and text too long to send inline. */
    Clip fetch() throws IOException {
        String body = request("GET", null);
        try {
            JSONObject profile = new JSONObject(body);
            if (!"Text".equals(profile.optString("type")) || profile.optBoolean("hasData")) return null;
            String text = profile.optString("text");
            String hash = profile.optString("hash");
            if (text.isEmpty() || hash.isEmpty()) return null;
            return new Clip(hash, text, copiedAt(profile.optString("syncedAt")));
        } catch (JSONException error) {
            throw new IOException("Unexpected answer from the Mac", error);
        }
    }

    /** SyncClipboard stamps each saved clip with an ISO 8601 time that includes the Mac's offset. */
    private static long copiedAt(String syncedAt) {
        try {
            return OffsetDateTime.parse(syncedAt).toInstant().toEpochMilli();
        } catch (DateTimeParseException error) {
            return 0;
        }
    }

    /** The address that answered the last request. */
    String currentHost() {
        return pairing.hosts.get(preferredHost);
    }

    /**
     * Tries each Mac address, starting with the one that answered last time. A 4xx status ends the
     * attempt. A network error or another status moves on to the next address.
     */
    private String request(String method, String body) throws IOException {
        IOException failure = null;
        int count = pairing.hosts.size();
        for (int attempt = 0; attempt < count; attempt++) {
            int index = (preferredHost + attempt) % count;
            try {
                String answer = request(pairing.hosts.get(index), method, body);
                preferredHost = index;
                return answer;
            } catch (RejectedException error) {
                preferredHost = index;
                throw error;
            } catch (IOException error) {
                failure = error;
            }
        }
        throw failure;
    }

    private String request(String host, String method, String body) throws IOException {
        HttpsURLConnection connection =
            (HttpsURLConnection) new URL("https", host, pairing.port, PATH).openConnection();
        connection.setSSLSocketFactory(sockets);
        // The pinned key identifies the Mac. Its addresses differ per network, so the name is not checked.
        connection.setHostnameVerifier((name, session) -> true);
        connection.setConnectTimeout(2000);
        connection.setReadTimeout(5000);
        connection.setUseCaches(false);
        connection.setRequestMethod(method);
        connection.setRequestProperty("Authorization", authorization);
        connection.setRequestProperty("Accept", "application/json");
        if (body != null) {
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            try (OutputStream out = connection.getOutputStream()) {
                out.write(body.getBytes(StandardCharsets.UTF_8));
            }
        }
        int status = connection.getResponseCode();
        if (status < 200 || status > 299) {
            InputStream error = connection.getErrorStream();
            if (error != null) error.close();
            if (status == 401) throw new RejectedException("the Mac rejected the password, so pair again");
            if (status >= 400 && status < 500) throw new RejectedException("the Mac answered HTTP " + status);
            // Other statuses, such as 503 while SyncClipboard starts, can pass on a later try.
            throw new IOException("the Mac answered HTTP " + status);
        }
        try (InputStream in = connection.getInputStream()) {
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read = in.read(buffer); read != -1; read = in.read(buffer)) bytes.write(buffer, 0, read);
            return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static byte[] sha256(byte[] data) {
        try {
            return MessageDigest.getInstance("SHA-256").digest(data);
        } catch (NoSuchAlgorithmException error) {
            throw new IllegalStateException(error);
        }
    }

    /** Accepts a server only when its certificate carries the paired Mac's public key. */
    private static final class PinnedKeyTrustManager implements X509TrustManager {
        private final byte[] pin;

        PinnedKeyTrustManager(byte[] pin) {
            this.pin = pin;
        }

        @Override public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            if (chain == null || chain.length == 0) throw new CertificateException("the server sent no certificate");
            if (!MessageDigest.isEqual(sha256(chain[0].getPublicKey().getEncoded()), pin)) {
                throw new CertificateException("this server is not the paired Mac");
            }
        }

        @Override public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
            throw new CertificateException("Client certificates are not used");
        }

        @Override public X509Certificate[] getAcceptedIssuers() {
            return new X509Certificate[0];
        }
    }
}
