package app.morphe.extension.youtube.bilibilidanmaku;

import android.content.Context;

import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.spec.OAEPParameterSpec;
import javax.crypto.spec.PSource;

/**
 * Bilibili web login for the danmaku add-on: QR authorisation by the user's own Bilibili app
 * and the official web cookie rotation, so a login stays valid without re-importing cookies.
 *
 * <p>Only HTTPS requests to Bilibili's own passport / web / API hosts are made. Credentials
 * are stored by {@link BilibiliDanmakuSession} and never leave those hosts.</p>
 */
final class BilibiliDanmakuAuth {
    static final int QR_DONE = 0;
    static final int QR_EXPIRED = 86038;
    static final int QR_SCANNED = 86090;
    static final int QR_WAITING = 86101;

    private static final String PASSPORT = "https://passport.bilibili.com";
    private static final String UA = "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36";
    /** Bilibili's published RSA key used by its web client to build the cookie refresh path. */
    private static final String REFRESH_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDLgd2OAkcGVtoE3ThUREbio0Eg"
            + "Uc/prcajMKXvkCKFCWhJYJcLkcM2DKKcSeFpD/j6Boy538YXnR6VhcuUJOhH2x71"
            + "nzPjfdTcqMz7djHum0qSZA0AyCBDABUqCrfNgCiJ00Ra7GmRj+YCK1NJEuewlb40"
            + "JNrRuoEUXpabUzGB8QIDAQAB";
    private static final long CHECK_INTERVAL_MS = 12L * 60 * 60 * 1000;
    private static final long RETRY_INTERVAL_MS = 60L * 1000;
    private static final Pattern REFRESH_CSRF = Pattern.compile("<div\\s+id=\"1-name\"\\s*>\\s*([^<\\s]+)\\s*</div>");
    private static final Object RENEW_LOCK = new Object();
    private static volatile long lastRenewAttempt;
    private static volatile boolean maintenanceRunning;

    private BilibiliDanmakuAuth() {}

    static final class QrTicket {
        final String url;
        final String key;
        QrTicket(String url, String key) { this.url = url; this.key = key; }
    }

    static final class Profile {
        final boolean loggedIn;
        final String name;
        final String face;
        final int level;
        Profile(boolean loggedIn, String name, String face, int level) {
            this.loggedIn = loggedIn; this.name = name; this.face = face; this.level = level;
        }
    }

    // ---- QR login ----

    static QrTicket createQr() throws Exception {
        Response response = request("GET", PASSPORT + "/x/passport-login/web/qrcode/generate?source=main-fe-header",
                null, false);
        JSONObject data = response.json().getJSONObject("data");
        String url = data.optString("url", "");
        String key = data.optString("qrcode_key", "");
        if (url.isEmpty() || !key.matches("[0-9a-zA-Z]{8,64}")) throw new IOException("B 站没有返回登录二维码");
        return new QrTicket(url, key);
    }

    /** Polls once. On success, the new login is saved and {@link #QR_DONE} is returned. */
    static int pollQr(String key) throws Exception {
        Response response = request("GET", PASSPORT + "/x/passport-login/web/qrcode/poll?qrcode_key="
                + URLEncoder.encode(key, "UTF-8") + "&source=main-fe-header", null, false);
        JSONObject data = response.json().getJSONObject("data");
        int code = data.optInt("code", -1);
        if (code != QR_DONE) return code;
        Map<String, String> cookies = new LinkedHashMap<>(response.cookies);
        // The redirect URL repeats the cookies as query parameters (still URL-encoded, as browsers store them).
        String redirect = data.optString("url", "");
        int query = redirect.indexOf('?');
        if (query >= 0) {
            for (String pair : redirect.substring(query + 1).split("&")) {
                int equals = pair.indexOf('=');
                if (equals <= 0) continue;
                String name = pair.substring(0, equals);
                if (!cookies.containsKey(name)) cookies.put(name, pair.substring(equals + 1));
            }
        }
        BilibiliDanmakuSession.saveLogin(cookies, data.optString("refresh_token", ""), false);
        try { fetchProfile(); } catch (Exception ignored) { /* Profile is cosmetic. */ }
        return QR_DONE;
    }

    /** {@code bilibili://browser} opens the authorisation page inside the user's Bilibili app. */
    static String appAuthorisationLink(String qrUrl) {
        try {
            return "bilibili://browser?url=" + URLEncoder.encode(qrUrl, "UTF-8");
        } catch (Exception impossible) {
            return qrUrl;
        }
    }

    // ---- Profile and logout ----

    static Profile fetchProfile() throws Exception {
        Response response = request("GET", "https://api.bilibili.com/x/web-interface/nav", null, true);
        JSONObject root = response.json();
        JSONObject data = root.optJSONObject("data");
        if (root.optInt("code", -1) != 0 || data == null || !data.optBoolean("isLogin", false)) {
            return new Profile(false, "", "", -1);
        }
        JSONObject levelInfo = data.optJSONObject("level_info");
        Profile profile = new Profile(true, data.optString("uname", ""), data.optString("face", ""),
                levelInfo == null ? -1 : levelInfo.optInt("current_level", -1));
        BilibiliDanmakuSession.saveProfile(profile.name, profile.face, profile.level);
        BilibiliDanmakuSession.setExpired(false);
        return profile;
    }

    /** Ends the session on Bilibili's side (best effort), then deletes it locally. */
    static void logout() {
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        try {
            if (state != null && !state.cookie("bili_jct").isEmpty()) {
                Map<String, String> form = new LinkedHashMap<>();
                form.put("biliCSRF", state.cookie("bili_jct"));
                request("POST", PASSPORT + "/login/exit/v2", form, true);
            }
        } catch (Exception ignored) {
            // Local deletion below is what matters to the user.
        } finally {
            BilibiliDanmakuSession.clear();
        }
    }

    // ---- Cookie rotation ----

    /** Runs a renewal check in the background at most every 12 hours. */
    static void maintainAsync(Context context) {
        if (context != null) BilibiliDanmakuSession.initialize(context);
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        if (state == null || !state.canRenew() || maintenanceRunning) return;
        if (System.currentTimeMillis() - BilibiliDanmakuSession.lastChecked() < CHECK_INTERVAL_MS) return;
        maintenanceRunning = true;
        Thread worker = new Thread(() -> {
            try { renew(false); } catch (Exception ignored) { /* Retried on the next check. */ }
            finally { maintenanceRunning = false; }
        }, "BilibiliSessionRenewal");
        worker.setDaemon(true);
        worker.start();
    }

    /**
     * Called when a Bilibili API reports "not logged in" while a login is stored.
     * @return true if the login was renewed and the request may be retried.
     */
    static boolean recoverSignedOut() {
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        if (state == null) return false;
        if (!state.canRenew()) {
            BilibiliDanmakuSession.setExpired(true);
            return false;
        }
        try {
            return renew(true);
        } catch (Exception ignored) {
            BilibiliDanmakuSession.setExpired(true);
            return false;
        }
    }

    /**
     * Asks Bilibili whether the cookies should be rotated and performs the official rotation.
     * @param recovering called after a signed-out response; repeated attempts are throttled.
     * @return true if the stored login is valid afterwards.
     */
    static boolean renew(boolean recovering) throws Exception {
        synchronized (RENEW_LOCK) {
            BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
            if (state == null || !state.canRenew()) return false;
            // Another request may have just renewed (or failed to renew) the cookies.
            if (recovering && System.currentTimeMillis() - lastRenewAttempt < RETRY_INTERVAL_MS)
                return !BilibiliDanmakuSession.isExpired();
            lastRenewAttempt = System.currentTimeMillis();
            String csrf = state.cookie("bili_jct");
            Response info = request("GET", PASSPORT + "/x/passport-login/web/cookie/info?csrf="
                    + URLEncoder.encode(csrf, "UTF-8"), null, true);
            JSONObject root = info.json();
            int code = root.optInt("code", -1);
            long timestamp = System.currentTimeMillis();
            if (code == 0) {
                JSONObject data = root.optJSONObject("data");
                if (data != null && data.optLong("timestamp", 0) > 0) timestamp = data.optLong("timestamp");
                if (data != null && !data.optBoolean("refresh", false)) {
                    BilibiliDanmakuSession.markChecked();
                    BilibiliDanmakuSession.setExpired(false);
                    return true;
                }
            } else if (code != -101) {
                throw new IOException("B 站登录状态检查失败：" + code);
            }
            rotate(state, timestamp);
            return true;
        }
    }

    private static void rotate(BilibiliDanmakuSession.State state, long timestamp) throws Exception {
        String oldToken = state.refreshToken;
        Response page = request("GET", "https://www.bilibili.com/correspond/1/" + correspondPath(timestamp), null, true);
        if (page.status != 200) throw new IOException("无法获取刷新口令（HTTP " + page.status + "）");
        Matcher matcher = REFRESH_CSRF.matcher(page.body);
        if (!matcher.find()) throw new IOException("B 站刷新口令格式已变化");
        Map<String, String> form = new LinkedHashMap<>();
        form.put("csrf", state.cookie("bili_jct"));
        form.put("refresh_csrf", matcher.group(1));
        form.put("source", "main_web");
        form.put("refresh_token", oldToken);
        Response refreshed = request("POST", PASSPORT + "/x/passport-login/web/cookie/refresh", form, true);
        JSONObject root = refreshed.json();
        int code = root.optInt("code", -1);
        if (code != 0) {
            // -101 / 86095: the refresh token no longer belongs to a live session.
            if (code == -101 || code == 86095) BilibiliDanmakuSession.setExpired(true);
            throw new IOException("B 站登录续期失败：" + code + " " + root.optString("message", ""));
        }
        JSONObject data = root.optJSONObject("data");
        String newToken = data == null ? "" : data.optString("refresh_token", "");
        if (newToken.isEmpty() || refreshed.cookies.get("SESSDATA") == null)
            throw new IOException("B 站续期响应缺少登录凭证");
        BilibiliDanmakuSession.saveLogin(refreshed.cookies, newToken, true);
        // Confirm with the new cookies so Bilibili retires the previous session.
        try {
            BilibiliDanmakuSession.State renewed = BilibiliDanmakuSession.state();
            Map<String, String> confirm = new LinkedHashMap<>();
            confirm.put("csrf", renewed == null ? "" : renewed.cookie("bili_jct"));
            confirm.put("refresh_token", oldToken);
            request("POST", PASSPORT + "/x/passport-login/web/confirm/refresh", confirm, true);
        } catch (Exception ignored) {
            // The new cookies are already valid; confirmation only invalidates the old ones.
        }
    }

    static String correspondPath(long timestamp) throws Exception {
        byte[] der = java.util.Base64.getDecoder().decode(REFRESH_KEY);
        PublicKey key = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(der));
        Cipher cipher = Cipher.getInstance("RSA/ECB/OAEPPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key, new OAEPParameterSpec("SHA-256", "MGF1",
                MGF1ParameterSpec.SHA256, PSource.PSpecified.DEFAULT));
        byte[] encrypted = cipher.doFinal(("refresh_" + timestamp).getBytes(StandardCharsets.UTF_8));
        String hex = new BigInteger(1, encrypted).toString(16);
        StringBuilder padded = new StringBuilder();
        for (int i = hex.length(); i < encrypted.length * 2; i++) padded.append('0');
        return padded.append(hex).toString();
    }

    // ---- HTTP ----

    private static final class Response {
        final int status;
        final String body;
        final Map<String, String> cookies;
        Response(int status, String body, Map<String, String> cookies) {
            this.status = status; this.body = body; this.cookies = cookies;
        }
        JSONObject json() throws Exception {
            if (status != 200) throw new IOException("HTTP " + status);
            return new JSONObject(body);
        }
    }

    private static Response request(String method, String url, Map<String, String> form, boolean withCookies)
            throws IOException {
        URL endpoint = new URL(url);
        String host = endpoint.getHost().toLowerCase(Locale.ROOT);
        if (!"https".equalsIgnoreCase(endpoint.getProtocol()) || endpoint.getPort() != -1
                || !(host.equals("passport.bilibili.com") || host.equals("www.bilibili.com")
                || host.equals("api.bilibili.com"))) {
            throw new IOException("拒绝向非 B 站官方 HTTPS 地址发送登录请求");
        }
        HttpURLConnection connection = (HttpURLConnection) endpoint.openConnection();
        try {
            connection.setConnectTimeout(10_000);
            connection.setReadTimeout(15_000);
            connection.setInstanceFollowRedirects(false);
            connection.setUseCaches(false);
            connection.setRequestMethod(method);
            connection.setRequestProperty("User-Agent", UA);
            connection.setRequestProperty("Referer", "https://www.bilibili.com/");
            connection.setRequestProperty("Accept", "*/*");
            if (withCookies) {
                String cookie = BilibiliDanmakuSession.getCookieHeader();
                if (!cookie.isEmpty()) connection.setRequestProperty("Cookie", cookie);
            }
            if (form != null) {
                StringBuilder body = new StringBuilder();
                for (Map.Entry<String, String> entry : form.entrySet()) {
                    if (body.length() > 0) body.append('&');
                    body.append(URLEncoder.encode(entry.getKey(), "UTF-8")).append('=')
                            .append(URLEncoder.encode(entry.getValue(), "UTF-8"));
                }
                byte[] bytes = body.toString().getBytes(StandardCharsets.UTF_8);
                connection.setDoOutput(true);
                connection.setRequestProperty("Origin", "https://www.bilibili.com");
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
                connection.setFixedLengthStreamingMode(bytes.length);
                try (OutputStream out = connection.getOutputStream()) { out.write(bytes); }
            }
            int status = connection.getResponseCode();
            Map<String, String> cookies = new LinkedHashMap<>();
            for (Map.Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
                if (header.getKey() == null || !"set-cookie".equalsIgnoreCase(header.getKey())) continue;
                for (String value : header.getValue()) {
                    String pair = value.split(";", 2)[0].trim();
                    int equals = pair.indexOf('=');
                    if (equals > 0) cookies.put(pair.substring(0, equals).trim(), pair.substring(equals + 1).trim());
                }
            }
            InputStream stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String text = stream == null ? "" : new String(
                    BilibiliDanmakuSource.readBounded(stream, 2 * 1024 * 1024), StandardCharsets.UTF_8);
            return new Response(status, text, cookies);
        } finally {
            connection.disconnect();
        }
    }
}
