package app.morphe.extension.chmate;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import org.json.*;

/** The sites' public Web protocols. No challenge bypass, automatic retries or foreign cookies. */
final class MediaUploadWebClient {
    interface Cookies {
        String get(String url);
        void set(String url, String cookie);
    }
    private final MediaUploadClient.Transport transport;
    private final Cookies cookies;
    MediaUploadWebClient(Cookies cookies) { this(url -> (HttpURLConnection) url.openConnection(), cookies); }
    MediaUploadWebClient(MediaUploadClient.Transport transport, Cookies cookies) {
        this.transport = transport; this.cookies = cookies;
    }
    HttpURLConnection site(String url, String method) throws Exception {
        URI u = new URI(url);
        if (!"https".equals(u.getScheme()) || u.getHost() == null || u.getPort() != -1
                || u.getRawUserInfo() != null || u.getRawFragment() != null) throw new IOException("送信先を確認できません");
        HttpURLConnection c = connection(url, method);
        c.setRequestProperty("Origin", "https://" + u.getHost());
        c.setRequestProperty("Referer", "https://" + u.getHost() + "/");
        String cookie = cookies.get(url);
        if (cookie != null && !cookie.isEmpty() && cookie.length() <= 32768 && cookie.indexOf('\r') < 0 && cookie.indexOf('\n') < 0)
            c.setRequestProperty("Cookie", cookie);
        return c;
    }
    private HttpURLConnection connection(String url, String method) throws Exception {
        HttpURLConnection c = transport.open(new URL(url));
        c.setInstanceFollowRedirects(false); c.setConnectTimeout(30_000); c.setReadTimeout(120_000);
        c.setRequestMethod(method); c.setRequestProperty("Accept", "application/json");
        if (!method.equals("GET")) c.setDoOutput(true);
        return c;
    }
    String response(HttpURLConnection c, boolean sent) throws Exception {
        int code = c.getResponseCode();
        {
            for (Map.Entry<String, List<String>> h : c.getHeaderFields().entrySet()) {
                if (!"Set-Cookie".equalsIgnoreCase(h.getKey()) || h.getValue() == null) continue;
                for (String cookie : h.getValue()) if (cookie != null && cookie.length() <= 16384
                        && cookie.indexOf('\r') < 0 && cookie.indexOf('\n') < 0) cookies.set(c.getURL().toString(), cookie);
            }
        }
        if (code < 200 || code >= 300) throw new IOException("送信先の応答: HTTP " + code
                + ((code == 401 || code == 403) ? "。アップロード先設定のWeb画面でログイン・アクセス確認を行ってください。" : "。")
                + (sent ? "再送前にサイトの履歴を確認してください" : "ファイルは送信していません"));
        try (InputStream in = c.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] bytes = new byte[8192]; int n;
            while ((n = in.read(bytes)) != -1) {
                if (out.size() + n > 2 * 1024 * 1024) throw new IOException("送信先の応答が大きすぎます");
                out.write(bytes, 0, n);
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }
    JSONObject json(String url, JSONObject body, boolean sent) throws Exception {
        HttpURLConnection c = site(url, "POST");
        c.setRequestProperty("Content-Type", "application/json");
        byte[] bytes = body.toString().getBytes(StandardCharsets.UTF_8); c.setFixedLengthStreamingMode(bytes.length);
        try {
            try (OutputStream out = c.getOutputStream()) { out.write(bytes); }
            return parse(response(c, sent));
        } finally { c.disconnect(); }
    }
    static JSONObject parse(String text) throws IOException {
        try { return new JSONObject(text); }
        catch (JSONException ignored) { throw new IOException("送信先の応答形式を確認できません。再試行前にサイトを確認してください"); }
    }
    JSONObject upload(String provider, File file, String mime) throws Exception {
        MediaUploadPolicy.validate(provider, mime, file.length(), "");
        JSONObject result = MediaUploadPolicy.SENDVID.equals(provider) ? sendvid(file, mime) : imgpile(file, mime);
        if (!MediaUploadPolicy.mediaUrl(provider, result.optString("link")))
            throw new IOException("送信済みですがURLを確認できません。再送前にサイトを確認してください");
        return result.put("deletehash", "");
    }
    private JSONObject imgpile(File file, String mime) throws Exception {
        JSONObject root = json("https://imgpile.com/uploads/init", new JSONObject()
                .put("filename", "upload." + MediaUploadPolicy.extension(mime)).put("size", file.length()).put("type", mime), false);
        JSONObject init = root.optJSONObject("data");
        if (init == null || init.optString("token").isEmpty() || init.optString("token").length() > 16384)
            throw new IOException("imgpileの送信準備を確認できません。ファイルは送信していません");
        String uploadUrl = init.optString("uploadUrl");
        if (!signedUpload(uploadUrl)) throw new IOException("imgpileの保存先が未対応です。ファイルは送信していません");
        // Only bytes + MIME go to storage. Never forward the site's Cookie, API key or Origin.
        HttpURLConnection put = connection(uploadUrl, "PUT");
        put.setRequestProperty("Content-Type", mime); put.setRequestProperty("If-None-Match", "*");
        put.setFixedLengthStreamingMode(file.length());
        try {
            try (OutputStream out = put.getOutputStream()) { copy(file, out); }
            response(put, true);
        } finally { put.disconnect(); }
        JSONObject done = json("https://imgpile.com/uploads/confirm", new JSONObject().put("token", init.getString("token")), true);
        return MediaUploadClient.parseImgpile(done, mime);
    }
    static boolean signedUpload(String address) {
        try {
            URI u = new URI(address); String host = u.getHost();
            if (!"https".equals(u.getScheme()) || u.getRawUserInfo() != null || u.getRawFragment() != null
                    || u.getPort() != -1 || host == null || u.getRawPath() == null || u.getRawPath().equals("/")) return false;
            return !u.getRawPath().isEmpty();
        } catch (Exception ignored) { return false; }
    }
    private JSONObject sendvid(File file, String mime) throws Exception {
        HttpURLConnection home = site("https://sendvid.com/", "GET");
        String csrf;
        try { csrf = MediaUploadClient.csrf(response(home, false)); } finally { home.disconnect(); }
        String boundary = "Haiagaru" + UUID.randomUUID().toString().replace("-", "");
        String prefix = "--" + boundary + "\r\nContent-Disposition: form-data; name=\"video\"; filename=\"upload."
                + MediaUploadPolicy.extension(mime) + "\"\r\nContent-Type: " + mime + "\r\n\r\n";
        byte[] start = prefix.getBytes(StandardCharsets.US_ASCII);
        byte[] end = ("\r\n--" + boundary + "--\r\n").getBytes(StandardCharsets.US_ASCII);
        HttpURLConnection post = site("https://sendvid.com/api/v1/videos", "POST");
        post.setRequestProperty("X-CSRF-Token", csrf); post.setRequestProperty("X-Requested-With", "XMLHttpRequest");
        post.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        post.setFixedLengthStreamingMode(start.length + file.length() + end.length);
        try {
            try (OutputStream out = post.getOutputStream()) { out.write(start); copy(file, out); out.write(end); }
            JSONObject root = parse(response(post, true)), video = root.optJSONObject("video");
            if (!root.optString("status").equals("0") || video == null || !video.optString("slug").matches("[A-Za-z0-9]{4,64}"))
                throw new IOException("Sendvidの送信完了を確認できません。再送前にサイトを確認してください");
            return new JSONObject().put("id", video.getString("slug")).put("link", "https://sendvid.com/" + video.getString("slug"))
                    .put("type", mime).put("animated", true).put("haiagaruProvider", "sendvid");
        } finally { post.disconnect(); }
    }
    static void copy(File file, OutputStream out) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            byte[] bytes = new byte[32768]; int n;
            while ((n = in.read(bytes)) != -1) {
                if (Thread.currentThread().isInterrupted()) throw new InterruptedIOException("送信を中断しました。再送前にサイトを確認してください");
                out.write(bytes, 0, n);
            }
        }
    }
}
