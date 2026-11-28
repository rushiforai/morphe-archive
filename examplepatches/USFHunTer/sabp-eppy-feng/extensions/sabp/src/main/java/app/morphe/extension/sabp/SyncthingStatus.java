package app.morphe.extension.sabp;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * What Syncthing on this device is paired with, read from its REST API at 127.0.0.1:8384 with the API key the user
 * pasted from Syncthing ("Sync between devices" patch; docs/adr/0002). Only that local address is ever contacted.
 * Syncthing's web certificate is self-signed, so it is pinned on first use: a different one later means something
 * else is answering on that port, and the key isn't sent.
 */
public final class SyncthingStatus {
    private static final String[] BASES = {"https://127.0.0.1:8384", "http://127.0.0.1:8384"};
    private static final String PIN_MISMATCH = "syncthing certificate changed";

    public static final class Device {
        public String id, name;
        public boolean self, connected;
        public long lastSeen; // epoch ms, 0 = never
    }

    public static final class Folder {
        public String id, label, path, state;
        public long needFiles;
        public final List<String> devices = new ArrayList<>(); // device ids it's shared with
    }

    public static final class Status {
        public String error;
        public final List<Device> devices = new ArrayList<>();
        public final List<Folder> folders = new ArrayList<>();

        public String deviceName(String id) {
            for (Device d : devices) if (d.id.equals(id)) return d.name;
            return id.length() > 7 ? id.substring(0, 7) : id;
        }
    }

    private SyncthingStatus() {
    }

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("eppy_sync", Context.MODE_PRIVATE); // not in settings backups
    }

    public static String key(Context c) {
        return prefs(c).getString("syncthingKey", "");
    }

    /** Saves (or with "" forgets) the API key; a new key also trusts whatever certificate Syncthing shows next. */
    public static void setKey(Context c, String key) {
        prefs(c).edit().putString("syncthingKey", key.trim()).remove("syncthingCert").apply();
    }

    /** Reads Syncthing's devices and folders. Network on 127.0.0.1 only; not on the main thread. */
    public static Status fetch(Context c) {
        Status s = new Status();
        String key = key(c);
        if (key.isEmpty()) {
            s.error = "No API key yet.";
            return s;
        }
        Exception last = null;
        for (String base : BASES) {
            // Once Syncthing has answered over https, never send the key over plain http (anything could be listening).
            if (base.startsWith("http:") && prefs(c).contains("syncthingCert")) break;
            try {
                String myId = new JSONObject(get(c, base, "/rest/system/status", key)).getString("myID");
                JSONArray devices = new JSONArray(get(c, base, "/rest/config/devices", key));
                JSONObject conns = new JSONObject(get(c, base, "/rest/system/connections", key)).optJSONObject("connections");
                JSONObject stats = new JSONObject(get(c, base, "/rest/stats/device", key));
                JSONArray folders = new JSONArray(get(c, base, "/rest/config/folders", key));
                Map<String, JSONObject> db = new HashMap<>();
                for (int i = 0; i < folders.length(); i++) {
                    String id = folders.getJSONObject(i).optString("id");
                    db.put(id, new JSONObject(get(c, base, "/rest/db/status?folder=" + URLEncoder.encode(id, "UTF-8"), key)));
                }
                return parse(myId, devices, conns, stats, folders, db);
            } catch (Exception e) {
                last = e;
                if (e instanceof Refused || pinMismatch(e)) break; // a real answer: don't retry over http
            }
        }
        s.error = describe(last);
        EppyDiag.log("sync", "Syncthing status: " + s.error);
        return s;
    }

    private static boolean pinMismatch(Throwable e) {
        for (Throwable t = e; t != null; t = t.getCause()) if (String.valueOf(t.getMessage()).contains(PIN_MISMATCH)) return true;
        return false;
    }

    private static String describe(Exception e) {
        if (e instanceof Refused) return "Syncthing refused the API key. Copy it again from Syncthing.";
        if (pinMismatch(e))
            return "Something other than the Syncthing eppy saw before is answering, so the key wasn't sent. Paste the key again only if you reinstalled Syncthing.";
        if (e instanceof ConnectException) return "Syncthing isn't running. Open it, then refresh.";
        // Android blocks plain http for SABP: Syncthing's web GUI must use https.
        if (e instanceof java.net.UnknownServiceException) return "Turn on \"Use HTTPS for GUI\" in Syncthing's settings, then refresh.";
        return "Couldn't reach Syncthing on this device (" + (e != null ? e.getClass().getSimpleName() : "?") + ").";
    }

    private static final class Refused extends Exception {
    }

    private static String get(Context c, String base, String path, String key) throws Exception {
        HttpURLConnection con = (HttpURLConnection) new URL(base + path).openConnection();
        if (con instanceof HttpsURLConnection) pinned(c, (HttpsURLConnection) con);
        con.setConnectTimeout(3000);
        con.setReadTimeout(5000);
        con.setRequestProperty("X-API-Key", key);
        try {
            int code = con.getResponseCode();
            if (code == 401 || code == 403) throw new Refused();
            if (code != 200) throw new java.io.IOException("HTTP " + code);
            try (InputStream in = con.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                for (int r; (r = in.read(buf)) > 0 && out.size() < 4_000_000; ) out.write(buf, 0, r);
                return out.toString("UTF-8");
            }
        } finally {
            con.disconnect();
        }
    }

    /** Trusts only 127.0.0.1 and the certificate seen the first time (saved), refusing any other. */
    private static void pinned(Context c, HttpsURLConnection con) throws Exception {
        SharedPreferences p = prefs(c);
        X509TrustManager tm = new X509TrustManager() {
            @Override
            public void checkClientTrusted(X509Certificate[] chain, String authType) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                if (chain == null || chain.length == 0) throw new CertificateException("no certificate");
                String seen = sha256(chain[0]);
                String pin = p.getString("syncthingCert", null);
                if (pin == null) p.edit().putString("syncthingCert", seen).apply();
                else if (!pin.equals(seen)) throw new CertificateException(PIN_MISMATCH);
            }

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        };
        SSLContext ssl = SSLContext.getInstance("TLS");
        ssl.init(null, new TrustManager[]{tm}, null);
        con.setSSLSocketFactory(ssl.getSocketFactory());
        con.setHostnameVerifier((host, session) -> "127.0.0.1".equals(host));
    }

    private static String sha256(X509Certificate cert) throws CertificateException {
        try {
            StringBuilder b = new StringBuilder();
            for (byte x : MessageDigest.getInstance("SHA-256").digest(cert.getEncoded())) b.append(String.format("%02x", x));
            return b.toString();
        } catch (Exception e) {
            throw new CertificateException(e);
        }
    }

    // ---- pure parts (tested) -----------------------------------------------------------------------

    static Status parse(String myId, JSONArray devices, JSONObject conns, JSONObject stats, JSONArray folders, Map<String, JSONObject> db) {
        Status s = new Status();
        for (int i = 0; i < devices.length(); i++) {
            JSONObject o = devices.optJSONObject(i);
            if (o == null) continue;
            Device d = new Device();
            d.id = o.optString("deviceID");
            d.name = o.optString("name", d.id);
            if (d.name.isEmpty()) d.name = d.id.length() > 7 ? d.id.substring(0, 7) : d.id;
            d.self = d.id.equals(myId);
            JSONObject cn = conns != null ? conns.optJSONObject(d.id) : null;
            d.connected = cn != null && cn.optBoolean("connected");
            JSONObject st = stats != null ? stats.optJSONObject(d.id) : null;
            d.lastSeen = st != null ? time(st.optString("lastSeen")) : 0;
            s.devices.add(d);
        }
        for (int i = 0; i < folders.length(); i++) {
            JSONObject o = folders.optJSONObject(i);
            if (o == null) continue;
            Folder f = new Folder();
            f.id = o.optString("id");
            f.label = o.optString("label");
            if (f.label.isEmpty()) f.label = f.id;
            f.path = o.optString("path");
            JSONArray ds = o.optJSONArray("devices");
            for (int k = 0; ds != null && k < ds.length(); k++) {
                String id = ds.optJSONObject(k) != null ? ds.optJSONObject(k).optString("deviceID") : "";
                if (!id.isEmpty() && !id.equals(myId)) f.devices.add(id);
            }
            JSONObject st = db.get(f.id);
            f.state = st != null ? st.optString("state") : "";
            f.needFiles = st != null ? st.optLong("needFiles") + st.optLong("needDeletes") : 0;
            s.folders.add(f);
        }
        return s;
    }

    /** Syncthing's RFC 3339 time, in epoch ms; 0 for "never" (year 1970 or earlier) or unreadable. */
    static long time(String s) {
        try {
            long ms = java.time.OffsetDateTime.parse(s).toInstant().toEpochMilli();
            return ms > 86_400_000L ? ms : 0;
        } catch (Exception e) {
            return 0;
        }
    }

    /** "Up to date", "Syncing, 12 files to go", … for a folder. */
    public static String folderState(Folder f) {
        switch (f.state) {
            case "idle":
                return f.needFiles > 0 ? f.needFiles + " files waiting for the other device" : "Up to date";
            case "syncing":
            case "sync-preparing":
                return "Syncing" + (f.needFiles > 0 ? ", " + f.needFiles + " files to go" : "");
            case "scanning":
                return "Looking for changes";
            case "error":
                return "Error: open Syncthing to see it";
            default:
                return f.state.isEmpty() ? "Unknown" : f.state;
        }
    }

    /** The file-system path of a book folder SABP knows by Uri (SAF tree or file path), or null. */
    static String bookPath(String folderUri) {
        if (folderUri == null) return null;
        if (folderUri.startsWith("/")) return folderUri;
        if (folderUri.startsWith("file://")) return folderUri.substring("file://".length());
        int at = folderUri.lastIndexOf("/document/");
        int from = at >= 0 ? at + "/document/".length() : folderUri.lastIndexOf("/tree/") + "/tree/".length();
        if (from < "/tree/".length()) return null;
        String docId;
        try {
            docId = URLDecoder.decode(folderUri.substring(from), "UTF-8");
        } catch (Exception e) {
            return null;
        }
        int colon = docId.indexOf(':');
        if (colon < 0) return null;
        String volume = docId.substring(0, colon), rest = docId.substring(colon + 1);
        return ("primary".equals(volume) ? "/storage/emulated/0" : "/storage/" + volume) + (rest.isEmpty() ? "" : "/" + rest);
    }

    /** True when the book folder is inside the Syncthing folder (paths compared as directories). */
    static boolean holds(String folderPath, String bookPath) {
        if (folderPath == null || bookPath == null || folderPath.isEmpty()) return false;
        String f = strip(folderPath).replace("/sdcard", "/storage/emulated/0"), b = strip(bookPath);
        return b.equals(f) || b.startsWith(f + "/");
    }

    private static String strip(String p) {
        return p.endsWith("/") ? p.substring(0, p.length() - 1) : p;
    }

    /** The Syncthing folder holding this book, or null. */
    public static Folder folderOf(Status s, String folderUri) {
        String book = bookPath(folderUri);
        for (Folder f : s.folders) if (holds(f.path, book)) return f;
        return null;
    }
}
