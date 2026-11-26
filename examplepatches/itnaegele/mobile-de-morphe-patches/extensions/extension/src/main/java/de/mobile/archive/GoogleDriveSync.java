package de.mobile.archive;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.Base64;
import android.util.Log;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public final class GoogleDriveSync {
    private static final String TAG = "MobileArchiveDrive";
    private static final String DRIVE_API = "https://www.googleapis.com/drive/v3/files";
    private static final String DRIVE_UPLOAD_API = "https://www.googleapis.com/upload/drive/v3/files";
    private static final String TOKEN_URL = "https://oauth2.googleapis.com/token";
    private static final int TIMEOUT_MS = 20000;

    private final ArchiveConfig config;

    public static final class RemoteListing {
        public String vipJson;
        public String contactJson;
        public String metaJson;
    }

    public interface OAuthCallback {
        void onResult(boolean success, String message);
    }

    public GoogleDriveSync(ArchiveConfig config) {
        this.config = config;
    }

    public String testConnection() {
        String mode = config.getDriveMode();
        try {
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                String url = config.getScriptUrl()
                        + (config.getScriptUrl().contains("?") ? "&" : "?")
                        + "action=ping&secret=" + enc(config.getScriptSecret());
                String resp = httpGetFollowRedirects(url, null);
                JSONObject json = new JSONObject(resp);
                if (json.optBoolean("ok", false)) {
                    String folder = json.optString("folder", "mobile.de Archiv");
                    config.setLastStatus("Verbunden (Apps Script: " + folder + ")");
                    return "OK: Verbunden mit Google Drive Ordner \"" + folder + "\"";
                }
                String err = json.optString("error", "Unbekannter Fehler");
                config.setLastStatus("Fehler: " + err);
                return "Fehler: " + err;
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) {
                    config.setLastStatus("Fehler: OAuth Token fehlt/abgelaufen");
                    return "Fehler: Bitte zuerst mit Google anmelden.";
                }
                String folderId = ensureDriveRootFolder(token);
                if (folderId != null && !folderId.isEmpty()) {
                    config.setLastStatus("Verbunden (Drive API: " + config.getDriveFolderName() + ")");
                    return "OK: Verbunden mit Google Drive Ordner \"" + config.getDriveFolderName() + "\"";
                }
                return "Fehler: Ordner konnte nicht in Google Drive erstellt werden.";
            }
            return "Google Drive ist deaktiviert (nur lokales Archiv).";
        } catch (Exception e) {
            config.setLastStatus("Fehler: " + e.getMessage());
            return "Fehler: " + e.getMessage();
        }
    }

    public boolean uploadListing(String adId, LocalArchiveStore.ListingMeta meta, String vipJson, String contactJson) {
        if (!config.isDriveConfigured() || vipJson == null || vipJson.isEmpty()) return false;
        String mode = config.getDriveMode();
        try {
            String infoTxt = LocalArchiveStore.buildReadableInfoText(adId, vipJson, contactJson);
            String metaJson = meta != null ? meta.toJson().toString() : "{}";
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                JSONObject payload = new JSONObject();
                payload.put("secret", config.getScriptSecret());
                payload.put("action", "putListing");
                payload.put("adId", adId);
                payload.put("title", meta != null ? meta.title : "");
                payload.put("price", meta != null ? meta.price : "");
                payload.put("vipJson", vipJson);
                if (contactJson != null) payload.put("contactJson", contactJson);
                payload.put("metaJson", metaJson);
                payload.put("infoTxt", infoTxt);
                String resp = httpPostJsonFollowRedirects(config.getScriptUrl(), payload.toString());
                JSONObject json = new JSONObject(resp);
                boolean ok = json.optBoolean("ok", false);
                config.setLastStatus(ok ? ("Zuletzt archiviert: #" + adId) : ("Drive Fehler: " + json.optString("error")));
                return ok;
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) return false;
                String rootId = ensureDriveRootFolder(token);
                if (rootId == null) return false;
                String title = meta != null ? meta.title : "";
                String listingFolderId = ensureListingFolderOAuth(token, rootId, adId, title);
                if (listingFolderId == null) return false;
                upsertDriveFile(token, listingFolderId, "listing.json", "application/json", vipJson.getBytes(StandardCharsets.UTF_8), adId, "listing");
                upsertDriveFile(token, listingFolderId, "meta.json", "application/json", metaJson.getBytes(StandardCharsets.UTF_8), adId, "meta");
                upsertDriveFile(token, listingFolderId, "info.txt", "text/plain", infoTxt.getBytes(StandardCharsets.UTF_8), adId, "info");
                if (contactJson != null && !contactJson.isEmpty()) {
                    upsertDriveFile(token, listingFolderId, "contact.json", "application/json", contactJson.getBytes(StandardCharsets.UTF_8), adId, "contact");
                }
                config.setLastStatus("Zuletzt archiviert: #" + adId);
                return true;
            }
        } catch (Exception e) {
            Log.e(TAG, "Drive uploadListing failed for " + adId, e);
            config.setLastStatus("Sync-Fehler #" + adId + ": " + e.getMessage());
        }
        return false;
    }

    public boolean uploadImage(String adId, String imageKey, int index, byte[] bytes) {
        if (!config.isDriveConfigured() || bytes == null || bytes.length == 0) return false;
        String mode = config.getDriveMode();
        try {
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                JSONObject payload = new JSONObject();
                payload.put("secret", config.getScriptSecret());
                payload.put("action", "putImage");
                payload.put("adId", adId);
                payload.put("imageKey", imageKey);
                payload.put("index", index);
                payload.put("base64", Base64.encodeToString(bytes, Base64.NO_WRAP));
                String resp = httpPostJsonFollowRedirects(config.getScriptUrl(), payload.toString());
                JSONObject json = new JSONObject(resp);
                return json.optBoolean("ok", false);
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) return false;
                String rootId = ensureDriveRootFolder(token);
                if (rootId == null) return false;
                String listingFolderId = ensureListingFolderOAuth(token, rootId, adId, "");
                if (listingFolderId == null) return false;
                String filename = "img_" + imageKey + ".jpg";
                String existing = findFileInFolderOAuth(token, listingFolderId, filename);
                if (existing != null) return true;
                upsertDriveFile(token, listingFolderId, filename, "image/jpeg", bytes, adId, "image");
                return true;
            }
        } catch (Exception e) {
            Log.e(TAG, "Drive uploadImage failed " + imageKey, e);
        }
        return false;
    }

    public RemoteListing downloadListing(String adId) {
        if (!config.isDriveConfigured() || adId == null || adId.isEmpty()) return null;
        String mode = config.getDriveMode();
        try {
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                String url = config.getScriptUrl()
                        + (config.getScriptUrl().contains("?") ? "&" : "?")
                        + "action=getListing&adId=" + enc(adId)
                        + "&secret=" + enc(config.getScriptSecret());
                String resp = httpGetFollowRedirects(url, null);
                JSONObject json = new JSONObject(resp);
                if (json.optBoolean("ok", false) && json.optBoolean("found", false)) {
                    RemoteListing r = new RemoteListing();
                    r.vipJson = json.isNull("vipJson") ? null : json.optString("vipJson", null);
                    r.contactJson = json.isNull("contactJson") ? null : json.optString("contactJson", null);
                    r.metaJson = json.isNull("metaJson") ? null : json.optString("metaJson", null);
                    return r;
                }
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) return null;
                String rootId = ensureDriveRootFolder(token);
                if (rootId == null) return null;
                String folderId = findListingFolderOAuth(token, rootId, adId);
                if (folderId == null) return null;
                String listingFileId = findFileInFolderOAuth(token, folderId, "listing.json");
                if (listingFileId == null) return null;
                RemoteListing r = new RemoteListing();
                byte[] vipBytes = downloadDriveFileBytes(token, listingFileId);
                if (vipBytes != null) r.vipJson = new String(vipBytes, StandardCharsets.UTF_8);
                String contactFileId = findFileInFolderOAuth(token, folderId, "contact.json");
                if (contactFileId != null) {
                    byte[] cb = downloadDriveFileBytes(token, contactFileId);
                    if (cb != null) r.contactJson = new String(cb, StandardCharsets.UTF_8);
                }
                String metaFileId = findFileInFolderOAuth(token, folderId, "meta.json");
                if (metaFileId != null) {
                    byte[] mb = downloadDriveFileBytes(token, metaFileId);
                    if (mb != null) r.metaJson = new String(mb, StandardCharsets.UTF_8);
                }
                return r.vipJson != null ? r : null;
            }
        } catch (Exception e) {
            Log.e(TAG, "Drive downloadListing failed " + adId, e);
        }
        return null;
    }

    public byte[] downloadImage(String imageKey) {
        if (!config.isDriveConfigured() || imageKey == null || imageKey.isEmpty()) return null;
        String mode = config.getDriveMode();
        try {
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                String url = config.getScriptUrl()
                        + (config.getScriptUrl().contains("?") ? "&" : "?")
                        + "action=getImage&imageKey=" + enc(imageKey)
                        + "&secret=" + enc(config.getScriptSecret());
                String resp = httpGetFollowRedirects(url, null);
                JSONObject json = new JSONObject(resp);
                if (json.optBoolean("ok", false) && json.optBoolean("found", false)) {
                    String b64 = json.optString("base64", "");
                    if (!b64.isEmpty()) return Base64.decode(b64, Base64.DEFAULT);
                }
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) return null;
                String filename = "img_" + imageKey + ".jpg";
                String q = "name = '" + escapeQuery(filename) + "' and trashed = false";
                String fileId = findFirstFileIdOAuth(token, q);
                if (fileId != null) {
                    return downloadDriveFileBytes(token, fileId);
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "Drive downloadImage failed " + imageKey, e);
        }
        return null;
    }

    public List<LocalArchiveStore.ListingMeta> listRemoteListings() {
        List<LocalArchiveStore.ListingMeta> list = new ArrayList<>();
        if (!config.isDriveConfigured()) return list;
        String mode = config.getDriveMode();
        try {
            if (ArchiveConfig.MODE_APPS_SCRIPT.equals(mode)) {
                String url = config.getScriptUrl()
                        + (config.getScriptUrl().contains("?") ? "&" : "?")
                        + "action=listListings&secret=" + enc(config.getScriptSecret());
                String resp = httpGetFollowRedirects(url, null);
                JSONObject json = new JSONObject(resp);
                JSONArray items = json.optJSONArray("items");
                if (items != null) {
                    for (int i = 0; i < items.length(); i++) {
                        LocalArchiveStore.ListingMeta m = LocalArchiveStore.ListingMeta.fromJson(items.optJSONObject(i));
                        if (m != null && !m.adId.isEmpty()) {
                            m.syncedToDrive = true;
                            m.fromDriveOnly = true;
                            list.add(m);
                        }
                    }
                }
            } else if (ArchiveConfig.MODE_OAUTH.equals(mode)) {
                String token = ensureOAuthAccessToken();
                if (token == null) return list;
                String rootId = ensureDriveRootFolder(token);
                if (rootId == null) return list;
                String q = "'" + escapeQuery(rootId) + "' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
                String url = DRIVE_API + "?q=" + enc(q) + "&fields=files(id,name,modifiedTime)&pageSize=200";
                String resp = httpGetFollowRedirects(url, token);
                JSONObject obj = new JSONObject(resp);
                JSONArray files = obj.optJSONArray("files");
                if (files != null) {
                    for (int i = 0; i < files.length(); i++) {
                        JSONObject f = files.optJSONObject(i);
                        if (f == null) continue;
                        String name = f.optString("name", "");
                        if (name.isEmpty() || "_images".equals(name)) continue;
                        String adId = name.split(" ")[0];
                        String title = name.contains(" - ") ? name.substring(name.indexOf(" - ") + 3) : name;
                        LocalArchiveStore.ListingMeta m = new LocalArchiveStore.ListingMeta();
                        m.adId = adId;
                        m.title = title;
                        m.price = "";
                        m.syncedToDrive = true;
                        m.fromDriveOnly = true;
                        list.add(m);
                    }
                }
            }
        } catch (Exception e) {
            Log.e(TAG, "Drive listRemoteListings failed", e);
        }
        return list;
    }

    // ==================== OAuth2 Loopback Login ====================

    public void startOAuthLoopbackLogin(final Activity activity, final OAuthCallback callback) {
        final String clientId = config.getOAuthClientId();
        final String clientSecret = config.getOAuthClientSecret();
        if (clientId.isEmpty()) {
            callback.onResult(false, "Bitte zuerst die Google OAuth Client-ID eintragen.");
            return;
        }

        new Thread(new Runnable() {
            @Override
            public void run() {
                ServerSocket serverSocket = null;
                try {
                    serverSocket = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"));
                    serverSocket.setSoTimeout(180000);
                    int port = serverSocket.getLocalPort();
                    String redirectUri = "http://127.0.0.1:" + port + "/callback";

                    byte[] verifierBytes = new byte[32];
                    new SecureRandom().nextBytes(verifierBytes);
                    String codeVerifier = Base64.encodeToString(verifierBytes, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    byte[] challengeBytes = md.digest(codeVerifier.getBytes(StandardCharsets.US_ASCII));
                    String codeChallenge = Base64.encodeToString(challengeBytes, Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);

                    final String authUrl = "https://accounts.google.com/o/oauth2/v2/auth"
                            + "?client_id=" + enc(clientId)
                            + "&redirect_uri=" + enc(redirectUri)
                            + "&response_type=code"
                            + "&scope=" + enc("https://www.googleapis.com/auth/drive.file")
                            + "&access_type=offline"
                            + "&prompt=consent"
                            + "&code_challenge=" + enc(codeChallenge)
                            + "&code_challenge_method=S256";

                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            if (activity.isFinishing() || activity.isDestroyed()) return;
                            try {
                                Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(authUrl));
                                activity.startActivity(browserIntent);
                            } catch (Throwable t) {
                                callback.onResult(false, "Browser konnte nicht geöffnet werden: " + t.getMessage());
                            }
                        }
                    });

                    Socket client = serverSocket.accept();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(client.getInputStream(), StandardCharsets.UTF_8));
                    String requestLine = reader.readLine();
                    String code = null;
                    String error = null;
                    if (requestLine != null && requestLine.contains("?")) {
                        String path = requestLine.split(" ")[1];
                        Uri parsed = Uri.parse("http://127.0.0.1" + path);
                        code = parsed.getQueryParameter("code");
                        error = parsed.getQueryParameter("error");
                    }

                    String html = (code != null)
                            ? "<html><body style='font-family:sans-serif;padding:24px'><h2>Google Drive verbunden!</h2><p>Du kannst dieses Fenster schliessen und zur mobile.de App zurueckkehren.</p></body></html>"
                            : "<html><body style='font-family:sans-serif;padding:24px'><h2>Anmeldung abgebrochen</h2><p>Fehler: " + (error != null ? error : "kein Code erhalten") + "</p></body></html>";
                    String httpResp = "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-8\r\nConnection: close\r\n\r\n" + html;
                    OutputStream os = client.getOutputStream();
                    os.write(httpResp.getBytes(StandardCharsets.UTF_8));
                    os.flush();
                    client.close();

                    if (code == null || code.isEmpty()) {
                        callback.onResult(false, "Anmeldung abgebrochen (" + error + ")");
                        return;
                    }

                    String form = "client_id=" + enc(clientId)
                            + (clientSecret.isEmpty() ? "" : "&client_secret=" + enc(clientSecret))
                            + "&code=" + enc(code)
                            + "&code_verifier=" + enc(codeVerifier)
                            + "&grant_type=authorization_code"
                            + "&redirect_uri=" + enc(redirectUri);

                    String tokenResp = httpPostForm(TOKEN_URL, form);
                    JSONObject tokenJson = new JSONObject(tokenResp);
                    String accessToken = tokenJson.optString("access_token", "");
                    String refreshToken = tokenJson.optString("refresh_token", "");
                    long expiresIn = tokenJson.optLong("expires_in", 3600L);
                    if (accessToken.isEmpty()) {
                        callback.onResult(false, "Token-Austausch fehlgeschlagen: " + tokenJson.optString("error_description", tokenResp));
                        return;
                    }
                    config.setOAuthAccessToken(accessToken, System.currentTimeMillis() + (expiresIn - 60) * 1000L);
                    if (!refreshToken.isEmpty()) {
                        config.setOAuthRefreshToken(refreshToken);
                    }
                    config.setDriveMode(ArchiveConfig.MODE_OAUTH);
                    ensureDriveRootFolder(accessToken);
                    config.setLastStatus("Verbunden (Google Drive OAuth)");
                    callback.onResult(true, "Erfolgreich mit Google Drive verbunden!");
                } catch (Exception e) {
                    callback.onResult(false, "OAuth Fehler: " + e.getMessage());
                } finally {
                    if (serverSocket != null) {
                        try {
                            serverSocket.close();
                        } catch (IOException ignored) {
                        }
                    }
                }
            }
        }, "ArchiveOAuth").start();
    }

    private synchronized String ensureOAuthAccessToken() {
        String existing = config.getOAuthAccessToken();
        if (!existing.isEmpty() && System.currentTimeMillis() < config.getOAuthAccessTokenExpiry()) {
            return existing;
        }
        String refresh = config.getOAuthRefreshToken();
        String clientId = config.getOAuthClientId();
        String clientSecret = config.getOAuthClientSecret();
        if (refresh.isEmpty() || clientId.isEmpty()) return null;
        try {
            String form = "client_id=" + enc(clientId)
                    + (clientSecret.isEmpty() ? "" : "&client_secret=" + enc(clientSecret))
                    + "&refresh_token=" + enc(refresh)
                    + "&grant_type=refresh_token";
            String resp = httpPostForm(TOKEN_URL, form);
            JSONObject obj = new JSONObject(resp);
            String token = obj.optString("access_token", "");
            long expiresIn = obj.optLong("expires_in", 3600L);
            if (!token.isEmpty()) {
                config.setOAuthAccessToken(token, System.currentTimeMillis() + (expiresIn - 60) * 1000L);
                return token;
            }
        } catch (Exception e) {
            Log.e(TAG, "OAuth token refresh failed", e);
        }
        return null;
    }

    private String ensureDriveRootFolder(String token) throws Exception {
        String cached = config.getDriveFolderId();
        if (!cached.isEmpty()) return cached;
        String folderName = config.getDriveFolderName();
        String q = "name = '" + escapeQuery(folderName) + "' and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
        String id = findFirstFileIdOAuth(token, q);
        if (id == null) {
            JSONObject meta = new JSONObject();
            meta.put("name", folderName);
            meta.put("mimeType", "application/vnd.google-apps.folder");
            String resp = httpPostJson(DRIVE_API, token, meta.toString());
            id = new JSONObject(resp).optString("id", "");
        }
        if (id != null && !id.isEmpty()) {
            config.setDriveFolderId(id);
            return id;
        }
        return null;
    }

    private String findListingFolderOAuth(String token, String rootId, String adId) throws Exception {
        String q = "'" + escapeQuery(rootId) + "' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false and name contains '" + escapeQuery(adId) + "'";
        return findFirstFileIdOAuth(token, q);
    }

    private String ensureListingFolderOAuth(String token, String rootId, String adId, String title) throws Exception {
        String id = findListingFolderOAuth(token, rootId, adId);
        if (id != null) return id;
        String safeTitle = title == null ? "" : title.replaceAll("[\\\\/:*?\"<>|\\r\\n]+", " ").trim();
        if (safeTitle.length() > 60) safeTitle = safeTitle.substring(0, 60);
        String name = safeTitle.isEmpty() ? adId : (adId + " - " + safeTitle);
        JSONObject meta = new JSONObject();
        meta.put("name", name);
        meta.put("mimeType", "application/vnd.google-apps.folder");
        JSONArray parents = new JSONArray();
        parents.put(rootId);
        meta.put("parents", parents);
        String resp = httpPostJson(DRIVE_API, token, meta.toString());
        return new JSONObject(resp).optString("id", null);
    }

    private String findFileInFolderOAuth(String token, String folderId, String filename) throws Exception {
        String q = "'" + escapeQuery(folderId) + "' in parents and name = '" + escapeQuery(filename) + "' and trashed = false";
        return findFirstFileIdOAuth(token, q);
    }

    private String findFirstFileIdOAuth(String token, String query) throws Exception {
        String url = DRIVE_API + "?q=" + enc(query) + "&fields=files(id,name)&pageSize=1";
        String resp = httpGetFollowRedirects(url, token);
        JSONObject obj = new JSONObject(resp);
        JSONArray files = obj.optJSONArray("files");
        if (files != null && files.length() > 0) {
            return files.optJSONObject(0).optString("id", null);
        }
        return null;
    }

    private void upsertDriveFile(String token, String folderId, String filename, String mimeType, byte[] data, String adId, String kind) throws Exception {
        String existingId = findFileInFolderOAuth(token, folderId, filename);
        String boundary = "----MobileDeArchiveBoundary" + System.currentTimeMillis();
        JSONObject meta = new JSONObject();
        meta.put("name", filename);
        if (existingId == null) {
            JSONArray parents = new JSONArray();
            parents.put(folderId);
            meta.put("parents", parents);
        }
        JSONObject props = new JSONObject();
        props.put("adId", adId);
        props.put("kind", kind);
        meta.put("appProperties", props);

        ByteArrayOutputStream body = new ByteArrayOutputStream();
        body.write(("--" + boundary + "\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n").getBytes(StandardCharsets.UTF_8));
        body.write(meta.toString().getBytes(StandardCharsets.UTF_8));
        body.write(("\r\n--" + boundary + "\r\nContent-Type: " + mimeType + "\r\n\r\n").getBytes(StandardCharsets.UTF_8));
        body.write(data);
        body.write(("\r\n--" + boundary + "--\r\n").getBytes(StandardCharsets.UTF_8));

        String urlStr = (existingId == null)
                ? (DRIVE_UPLOAD_API + "?uploadType=multipart")
                : (DRIVE_UPLOAD_API + "/" + existingId + "?uploadType=multipart");
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestMethod("POST");
        if (existingId != null) {
            conn.setRequestProperty("X-HTTP-Method-Override", "PATCH");
        }
        conn.setRequestProperty("Authorization", "Bearer " + token);
        conn.setRequestProperty("Content-Type", "multipart/related; boundary=" + boundary);
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(body.toByteArray());
        os.flush();
        os.close();
        int code = conn.getResponseCode();
        readStreamFully(code >= 400 ? conn.getErrorStream() : conn.getInputStream());
        conn.disconnect();
        if (code >= 400) {
            throw new IOException("Drive upload HTTP " + code);
        }
    }

    private byte[] downloadDriveFileBytes(String token, String fileId) throws Exception {
        String urlStr = DRIVE_API + "/" + fileId + "?alt=media";
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + token);
        int code = conn.getResponseCode();
        if (code >= 200 && code < 300) {
            byte[] data = readStreamFully(conn.getInputStream());
            conn.disconnect();
            return data;
        }
        conn.disconnect();
        return null;
    }

    // ==================== HTTP Helpers ====================

    private static String httpGetFollowRedirects(String urlStr, String bearerToken) throws IOException {
        String current = urlStr;
        for (int hops = 0; hops < 6; hops++) {
            HttpURLConnection conn = (HttpURLConnection) new URL(current).openConnection();
            conn.setInstanceFollowRedirects(false);
            conn.setConnectTimeout(TIMEOUT_MS);
            conn.setReadTimeout(TIMEOUT_MS);
            conn.setRequestMethod("GET");
            if (bearerToken != null && !bearerToken.isEmpty()) {
                conn.setRequestProperty("Authorization", "Bearer " + bearerToken);
            }
            int code = conn.getResponseCode();
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String loc = conn.getHeaderField("Location");
                conn.disconnect();
                if (loc == null) throw new IOException("Redirect without Location");
                current = loc;
                continue;
            }
            byte[] bytes = readStreamFully(code >= 400 ? conn.getErrorStream() : conn.getInputStream());
            conn.disconnect();
            return new String(bytes, StandardCharsets.UTF_8);
        }
        throw new IOException("Too many redirects");
    }

    private static String httpPostJsonFollowRedirects(String urlStr, String jsonBody) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setInstanceFollowRedirects(false);
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(jsonBody.getBytes(StandardCharsets.UTF_8));
        os.flush();
        os.close();

        int code = conn.getResponseCode();
        if (code == 301 || code == 302 || code == 303) {
            String loc = conn.getHeaderField("Location");
            conn.disconnect();
            if (loc != null) {
                return httpGetFollowRedirects(loc, null);
            }
        }
        byte[] bytes = readStreamFully(code >= 400 ? conn.getErrorStream() : conn.getInputStream());
        conn.disconnect();
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static String httpPostJson(String urlStr, String bearerToken, String jsonBody) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestMethod("POST");
        if (bearerToken != null && !bearerToken.isEmpty()) {
            conn.setRequestProperty("Authorization", "Bearer " + bearerToken);
        }
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(jsonBody.getBytes(StandardCharsets.UTF_8));
        os.flush();
        os.close();
        int code = conn.getResponseCode();
        byte[] bytes = readStreamFully(code >= 400 ? conn.getErrorStream() : conn.getInputStream());
        conn.disconnect();
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static String httpPostForm(String urlStr, String formBody) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(TIMEOUT_MS);
        conn.setReadTimeout(TIMEOUT_MS);
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(formBody.getBytes(StandardCharsets.UTF_8));
        os.flush();
        os.close();
        int code = conn.getResponseCode();
        byte[] bytes = readStreamFully(code >= 400 ? conn.getErrorStream() : conn.getInputStream());
        conn.disconnect();
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static byte[] readStreamFully(InputStream is) throws IOException {
        if (is == null) return new byte[0];
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = is.read(buf)) != -1) {
            bos.write(buf, 0, n);
        }
        is.close();
        return bos.toByteArray();
    }

    private static String enc(String s) {
        try {
            return URLEncoder.encode(s == null ? "" : s, "UTF-8");
        } catch (Exception e) {
            return "";
        }
    }

    private static String escapeQuery(String s) {
        return s == null ? "" : s.replace("\\", "\\\\").replace("'", "\\'");
    }
}
