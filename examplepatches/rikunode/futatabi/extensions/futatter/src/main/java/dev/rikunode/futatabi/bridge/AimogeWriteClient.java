package dev.rikunode.futatabi.bridge;

import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.UUID;

/** Authenticated Aimoge write transport. Network calls occur only on explicit user action. */
final class AimogeWriteClient {
    private final String base;
    AimogeWriteClient() { this("https://api.nijiurachan.net"); }
    AimogeWriteClient(String baseUrl) { base = baseUrl; }

    // DNS failure before the request body was written: the same PKCE exchange
    // can be retried by reloading the callback after connectivity recovers.
    static final class DnsUnavailableException extends java.io.IOException {
        DnsUnavailableException() { super("DNS unavailable for api.nijiurachan.net"); }
    }

    static final class Result {
        final int status;
        final String text;
        Result(int code, String data) { status = code; text = data; }
        JSONObject json() throws Exception { return new JSONObject(text); }
    }

    Result get(String path) throws Exception {
        return request("GET", path, null, null, null);
    }

    Result post(String path, JSONObject body, String credential) throws Exception {
        return request("POST", path, body.toString().getBytes(StandardCharsets.UTF_8),
                "application/json", credential);
    }

    private Result request(String method, String path, byte[] data, String type, String credential) throws Exception {
        if (!path.startsWith("/") || path.contains("..") || path.contains("?"))
            throw new IllegalArgumentException("Invalid API path");
        URL target = new URL(base + path);
        if (!("https".equals(target.getProtocol()) && "api.nijiurachan.net".equals(target.getHost())) &&
                !("http".equals(target.getProtocol()) &&
                        "127.0.0.1".equals(target.getHost())))
            throw new IllegalArgumentException("Untrusted API destination");
        HttpURLConnection conn = (HttpURLConnection) target.openConnection();
        conn.setInstanceFollowRedirects(false);
        conn.setConnectTimeout(7000);
        conn.setReadTimeout(16000);
        conn.setRequestMethod(method);
        conn.setRequestProperty("X-Api-Version", "2026-11-11");
        conn.setRequestProperty("X-Board-Key", "aimg");
        conn.setRequestProperty("User-Agent", "futatabi/0.3.0");
        conn.setRequestProperty("Accept", "application/json");
        if (credential != null && !credential.isEmpty())
            conn.setRequestProperty("x-aimg-token", credential);
        if (data != null) {
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", type);
            conn.setFixedLengthStreamingMode(data.length);
        }
        try {
            if (data != null) {
                OutputStream stream;
                try { stream = conn.getOutputStream(); }
                catch (java.net.UnknownHostException ex) { throw new DnsUnavailableException(); }
                try (OutputStream out = stream) { out.write(data); }
            }
            int status = conn.getResponseCode();
            if (status >= 300 && status < 400) throw new IllegalStateException("Unexpected redirect");
            try (InputStream in = status < 400 ? conn.getInputStream() : conn.getErrorStream()) {
                if (in == null) return new Result(status, "");
                byte[] dataRead = bounded(in, 256_000);
                return new Result(status, new String(dataRead, StandardCharsets.UTF_8));
            }
        } finally { conn.disconnect(); }
    }

    static byte[] bounded(InputStream in, int max) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) != -1) {
            if (out.size() + n > max) throw new IllegalArgumentException("Response too large");
            out.write(buf, 0, n);
        }
        return out.toByteArray();
    }

    /** Upload is a PUT to the exact server-issued presigned URL, never a generated URL. */
    void upload(String presignedUrl, byte[] bytes, String mime) throws Exception {
        URL url = new URL(presignedUrl);
        String host = url.getHost().toLowerCase(java.util.Locale.ROOT);
        if (!"https".equals(url.getProtocol()) ||
                !(host.equals("storage.nijiurachan.net") || host.endsWith(".r2.cloudflarestorage.com")))
            throw new IllegalArgumentException("Unexpected upload destination");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("PUT");
        conn.setInstanceFollowRedirects(false);
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(30000);
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", mime);
        conn.setFixedLengthStreamingMode(bytes.length);
        try {
            try (OutputStream out = conn.getOutputStream()) { out.write(bytes); }
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) throw new IllegalStateException("Upload rejected: HTTP " + code);
        } finally { conn.disconnect(); }
    }

    static String attachmentName(String mime) {
        String ext = mime.substring("image/".length());
        return "attachment." + ("jpeg".equals(ext) ? "jpg" : ext);
    }

    static String sha256(byte[] data) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(data);
        StringBuilder hex = new StringBuilder();
        for (byte b : digest) hex.append(String.format(java.util.Locale.ROOT, "%02x", b & 0xff));
        return hex.toString();
    }

    String presignAndUpload(byte[] data, String mime, String name, String credential) throws Exception {
        if (data.length == 0 || data.length > 20_971_520)
            throw new IllegalArgumentException("Invalid attachment size");
        if (!mime.matches("image/(jpeg|png|gif|webp|heic)"))
            throw new IllegalArgumentException("Unsupported attachment type");
        JSONObject payload = new JSONObject();
        payload.put("sha256", sha256(data));
        payload.put("mime", mime);
        payload.put("sizeBytes", data.length);
        payload.put("fileName", attachmentName(mime));
        Result result = post("/attachments/presign", payload, credential);
        if (result.status != 200) throw new IllegalStateException("Presign HTTP " + result.status + ": " + result.text);
        JSONObject reply = result.json();
        String attachmentId = UUID.fromString(reply.getString("attachmentId")).toString();
        if (!reply.optBoolean("reused", false)) {
            String uploadUrl = reply.getString("uploadUrl");
            upload(uploadUrl, data, mime);
        }
        return attachmentId;
    }
}
