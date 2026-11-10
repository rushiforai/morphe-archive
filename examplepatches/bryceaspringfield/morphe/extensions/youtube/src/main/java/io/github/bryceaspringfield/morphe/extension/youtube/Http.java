package io.github.bryceaspringfield.morphe.extension.youtube;


import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;

/** Requests to YouTube's InnerTube API from the WEB client, signed out, for facts the feed buffers lack. */
final class Http {

    private static final String WEB_VERSION = "2.20251101.00.00";

    private Http() {
    }

    /** POSTs a body to youtubei/v1/ENDPOINT with the WEB client's context added; null on any failure. */
    
    static JSONObject innertube(String endpoint, JSONObject body, Map<String, String> headers) {
        try {
            JSONObject client = new JSONObject()
                    .put("clientName", "WEB")
                    .put("clientVersion", WEB_VERSION)
                    .put("hl", Locale.getDefault().getLanguage());
            if (!body.has("context")) body.put("context", new JSONObject().put("client", client));
            HttpURLConnection c = (HttpURLConnection) new URL(
                    "https://www.youtube.com/youtubei/v1/" + endpoint + "?prettyPrint=false").openConnection();
            c.setConnectTimeout(5000);
            c.setReadTimeout(8000);
            c.setRequestMethod("POST");
            c.setDoOutput(true);
            c.setRequestProperty("Content-Type", "application/json");
            if (headers != null) for (Map.Entry<String, String> h : headers.entrySet()) c.setRequestProperty(h.getKey(), h.getValue());
            try (OutputStream o = c.getOutputStream()) {
                o.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            int code = c.getResponseCode();
            InputStream in = code < 400 ? c.getInputStream() : c.getErrorStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[16384];
            int n;
            while (in != null && (n = in.read(buf)) > 0) out.write(buf, 0, n);
            if (code >= 400) {
                Logger.printDebug(() -> "YouTube Extras: " + endpoint + " answered " + code);
                return null;
            }
            return new JSONObject(out.toString("UTF-8"));
        } catch (Exception e) {
            Logger.printDebug(() -> "YouTube Extras: " + endpoint + " failed: " + e);
            return null;
        }
    }
}
