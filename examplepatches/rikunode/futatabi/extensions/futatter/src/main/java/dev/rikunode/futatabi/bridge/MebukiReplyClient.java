package dev.rikunode.futatabi.bridge;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import android.util.Base64;

/**
 * Text-only reply transport. Form fields confirmed by the public thread client;
 * server action response and full authenticated contract await owner validation.
 * Never creates threads, guesses attachment fields, or bypasses Turnstile.
 */
final class MebukiReplyClient {
    private static final String SITE = "https://mebuki.moe";
    private final SharedPreferences prefs;
    private final MebukiAdapter adapter;

    MebukiReplyClient(Context context, MebukiAdapter adapter) {
        prefs = context.getSharedPreferences("futatabi_extension_private", Context.MODE_PRIVATE);
        this.adapter = adapter;
    }

    BridgeServer.BridgeResponse reply(JSONObject payload) throws Exception {
        String id = payload.optString("threadId", "");
        if (!id.matches("[0-9]{13}")) return BridgeServer.BridgeResponse.text(400, "Select a valid thread");
        String slug = adapter.slugForThreadId(id);
        if (slug == null || !slug.matches("[A-Za-z0-9_-]{8,24}"))
            return BridgeServer.BridgeResponse.text(404, "Unknown thread");

        String content = payload.optString("content", "");
        if (content.isEmpty() || content.codePointCount(0, content.length()) > 5000 ||
                content.split("\\r?\\n", -1).length > 100)
            return BridgeServer.BridgeResponse.text(400, "Reply must contain 1-5000 characters, 100 lines max");
        if (payload.has("attachments")) return BridgeServer.BridgeResponse.text(400, "Attachments not yet verified");
        String replyToId = payload.optString("replyToId", "");
        if (!replyToId.isEmpty() && !replyToId.matches("[A-Za-z0-9_-]{1,128}"))
            return BridgeServer.BridgeResponse.text(400, "Invalid replyToId");
        String cookie = prefs.getString("mebuki_cookie_header", "");
        if (cookie.isEmpty() || cookie.length() > 8192 || cookie.indexOf('\r') >= 0 ||
                cookie.indexOf('\n') >= 0)
            return BridgeServer.BridgeResponse.text(401, "Mebuki login required");

        byte[] nonce = new byte[18];
        new SecureRandom().nextBytes(nonce);
        String boundary = "futatabi-" + Base64.encodeToString(nonce,
                Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        append(buffer, boundary, "content", content);
        if (!replyToId.isEmpty()) append(buffer, boundary, "replyToId", replyToId);
        append(buffer, boundary, "showUsername", payload.optBoolean("showUsername", false) ? "on" : "");
        append(buffer, boundary, "showThreadOwner", payload.optBoolean("showThreadOwner", false) ? "on" : "");
        buffer.write(("--" + boundary + "--\r\n").getBytes(StandardCharsets.UTF_8));

        URL url = new URL(SITE + "/t/" + slug);
        if (!("https".equals(url.getProtocol()) && "mebuki.moe".equals(url.getHost())))
            throw new IllegalArgumentException("Unexpected submission host");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(7000);
        connection.setReadTimeout(12000);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Cookie", cookie);
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        connection.setRequestProperty("Accept", "application/json, text/x-script");
        connection.setFixedLengthStreamingMode(buffer.size());
        try {
            try (java.io.OutputStream output = connection.getOutputStream()) { buffer.writeTo(output); }
            int status = connection.getResponseCode();
            InputStream stream = status < 400 ? connection.getInputStream() : connection.getErrorStream();
            if (stream != null) try (InputStream in = stream) {
                AimogeWriteClient.bounded(in, 64_000); // No logging or storage of response contents.
            }
            JSONObject result = new JSONObject();
            result.put("upstreamStatus", status);
            result.put("confirmed", false);
            result.put("note", "Submission outcome requires owner-side server contract verification");
            return BridgeServer.BridgeResponse.json(status >= 200 && status < 400 ? 202 : status,
                    result.toString());
        } finally { connection.disconnect(); }
    }

    private static void append(ByteArrayOutputStream out, String boundary, String key, String value)
            throws Exception {
        out.write(("--" + boundary + "\r\nContent-Disposition: form-data; name=\"" +
                key + "\"\r\n\r\n").getBytes(StandardCharsets.UTF_8));
        out.write(value.getBytes(StandardCharsets.UTF_8));
        out.write("\r\n".getBytes(StandardCharsets.US_ASCII));
    }
}
