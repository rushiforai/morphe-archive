package app.threadripper.extension.youtube;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Locale;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * A free Cloudflare WARP device, registered the way wgcf (github.com/ViRb3/wgcf) does it: POST the
 * WireGuard public key to the 1.1.1.1 app's API and keep the returned peer key, endpoint and
 * tunnel addresses. Registered once and kept in the app's shared preferences ("thread_ripper").
 * The request mimics the 1.1.1.1 Android app (6.38.9): its version headers, and TLS 1.2 only, which
 * that app uses and which wgcf copies.
 */
final class WarpAccount {
    private static final String API = "https://api.cloudflareclient.com/v0a5641";
    private static final String USER_AGENT = "1.1.1.1/6.38.9-5641 (Android 16.0.0)";
    private static final String CLIENT_VERSION = "a-6.38.9-5641";
    private static final int DEFAULT_PORT = 2408;
    private static final String PREFS = "thread_ripper";

    final byte[] privateKey;
    final byte[] peerPublicKey;
    final String endpointHost;
    final int endpointPort;
    final String v4;
    final String v6;

    private WarpAccount(byte[] privateKey, byte[] peerPublicKey, String endpointHost, int endpointPort, String v4, String v6) {
        this.privateKey = privateKey;
        this.peerPublicKey = peerPublicKey;
        this.endpointHost = endpointHost;
        this.endpointPort = endpointPort;
        this.v4 = v4;
        this.v6 = v6;
    }

    /** The stored device, or a newly registered one (network request; not on the main thread). */
    static synchronized WarpAccount get(Context context) throws Exception {
        SharedPreferences p = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String key = p.getString("warp_private_key", null);
        if (key != null) {
            return new WarpAccount(
                    Base64.getDecoder().decode(key),
                    Base64.getDecoder().decode(p.getString("warp_peer_key", "")),
                    p.getString("warp_endpoint_host", ""),
                    p.getInt("warp_endpoint_port", DEFAULT_PORT),
                    p.getString("warp_v4", ""),
                    p.getString("warp_v6", null));
        }
        WarpAccount a = register();
        p.edit()
                .putString("warp_private_key", Base64.getEncoder().encodeToString(a.privateKey))
                .putString("warp_peer_key", Base64.getEncoder().encodeToString(a.peerPublicKey))
                .putString("warp_endpoint_host", a.endpointHost)
                .putInt("warp_endpoint_port", a.endpointPort)
                .putString("warp_v4", a.v4)
                .putString("warp_v6", a.v6)
                .apply();
        Log.i("WARP: registered, endpoint " + a.endpointHost + ":" + a.endpointPort + ", address " + a.v4);
        return a;
    }

    private static WarpAccount register() throws Exception {
        byte[] privateKey = X25519.generatePrivateKey();
        String tos = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX", Locale.US).format(new Date());
        JSONObject body = new JSONObject()
                .put("fcm_token", "")
                .put("install_id", "")
                .put("key", Base64.getEncoder().encodeToString(X25519.publicKey(privateKey)))
                .put("locale", "en_US")
                .put("model", Build.MODEL)
                .put("tos", tos)
                .put("serial_number", "")
                .put("os_version", "16.0.0")
                .put("key_type", "curve25519")
                .put("tunnel_type", "wireguard");

        HttpsURLConnection c = (HttpsURLConnection) new URL(API + "/reg").openConnection();
        c.setSSLSocketFactory(new Tls12(c.getSSLSocketFactory()));
        c.setConnectTimeout(15_000);
        c.setReadTimeout(15_000);
        c.setRequestMethod("POST");
        c.setDoOutput(true);
        c.setRequestProperty("User-Agent", USER_AGENT);
        c.setRequestProperty("CF-Client-Version", CLIENT_VERSION);
        c.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        c.setRequestProperty("Connection", "Keep-Alive");
        try (OutputStream out = c.getOutputStream()) {
            out.write(body.toString().getBytes(StandardCharsets.UTF_8));
        }
        int status = c.getResponseCode();
        String text = read(status < 400 ? c.getInputStream() : c.getErrorStream());
        c.disconnect();
        if (status / 100 != 2) throw new IOException("WARP registration HTTP " + status + ": " + text);

        JSONObject config = new JSONObject(text).getJSONObject("config");
        JSONObject addresses = config.getJSONObject("interface").getJSONObject("addresses");
        JSONObject peer = config.getJSONArray("peers").getJSONObject(0);
        JSONObject endpoint = peer.getJSONObject("endpoint");
        // v4 is "162.159.192.x:0"; the port comes from "ports" (wgcf uses 2408 when absent).
        String host = endpoint.optString("v4", "");
        int colon = host.lastIndexOf(':');
        if (colon > 0) host = host.substring(0, colon);
        if (host.isEmpty()) host = endpoint.getString("host").split(":")[0];
        JSONArray ports = endpoint.optJSONArray("ports");
        int port = ports != null && ports.length() > 0 ? ports.getInt(0) : DEFAULT_PORT;
        String v6 = addresses.optString("v6", "");
        return new WarpAccount(
                privateKey,
                Base64.getDecoder().decode(peer.getString("public_key")),
                host,
                port,
                addresses.getString("v4"),
                v6.isEmpty() ? null : v6);
    }

    private static String read(InputStream in) throws IOException {
        if (in == null) return "";
        try (InputStream is = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = is.read(buf)) > 0) out.write(buf, 0, n);
            return out.toString("UTF-8");
        }
    }

    /** Restricts the connection to TLS 1.2, like the 1.1.1.1 app. */
    private static final class Tls12 extends SSLSocketFactory {
        private final SSLSocketFactory base;

        Tls12(SSLSocketFactory base) {
            this.base = base;
        }

        private Socket restrict(Socket s) {
            if (s instanceof SSLSocket) ((SSLSocket) s).setEnabledProtocols(new String[]{"TLSv1.2"});
            return s;
        }

        @Override
        public String[] getDefaultCipherSuites() {
            return base.getDefaultCipherSuites();
        }

        @Override
        public String[] getSupportedCipherSuites() {
            return base.getSupportedCipherSuites();
        }

        @Override
        public Socket createSocket(Socket s, String host, int port, boolean autoClose) throws IOException {
            return restrict(base.createSocket(s, host, port, autoClose));
        }

        @Override
        public Socket createSocket(String host, int port) throws IOException {
            return restrict(base.createSocket(host, port));
        }

        @Override
        public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException {
            return restrict(base.createSocket(host, port, localHost, localPort));
        }

        @Override
        public Socket createSocket(InetAddress host, int port) throws IOException {
            return restrict(base.createSocket(host, port));
        }

        @Override
        public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
            return restrict(base.createSocket(address, port, localAddress, localPort));
        }
    }
}
