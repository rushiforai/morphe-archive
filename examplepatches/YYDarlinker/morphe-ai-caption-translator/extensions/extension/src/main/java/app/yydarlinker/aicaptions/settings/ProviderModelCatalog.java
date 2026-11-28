package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.ProviderEndpoint;


import org.json.JSONException;
import org.json.JSONObject;

import org.json.JSONArray;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** The model ids of an OpenAI-compatible endpoint, from its GET /models. */
public final class ProviderModelCatalog {
    private static final int MAX_RESPONSE_BYTES = 2 * 1024 * 1024;
    private static final int MAX_ID_CHARS = 300;

    private ProviderModelCatalog() {}

    public interface CredentialPort {
        String resolve();
    }

    /** The ids, sorted without regard to case; an error when the endpoint has none. */
    public static List<String> fetch(String baseUrl, CredentialPort credentials) throws Exception {
        String key = credentials.resolve().trim();
        if (key.isEmpty()) throw new IllegalArgumentException("请先填写 API Key");
        HttpURLConnection connection =
                (HttpURLConnection) new URL(ProviderEndpoint.models(baseUrl)).openConnection();
        try {
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(5_000);
            connection.setReadTimeout(10_000);
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(false);
            ProviderEndpoint.authenticate(connection, baseUrl, key);
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("User-Agent", "YYDarlinker-AICaptions/2");

            int status = connection.getResponseCode();
            if (status < 200 || status >= 300)
                throw new IllegalStateException("模型列表 HTTP " + status);
            List<String> models = parse(readBody(connection.getInputStream()));
            if (models.isEmpty()) throw new IllegalStateException("接口没有返回可选择的模型 ID");
            return models;
        } finally {
            connection.disconnect();
        }
    }

    private static String readBody(InputStream stream) throws IOException, InterruptedException {
        try (InputStream in = stream;
                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            for (int count; (count = in.read(buffer)) != -1; ) {
                if (Thread.currentThread().isInterrupted()) throw new InterruptedException();
                if (out.size() + count > MAX_RESPONSE_BYTES)
                    throw new IOException("response_too_large");
                out.write(buffer, 0, count);
            }
            return out.toString(StandardCharsets.UTF_8.name());
        }
    }

    /** The list is under "data" or "models", at the top or under "result". */
    private static List<String> parse(String response) throws JSONException {
        JSONObject root = new JSONObject(response);
        JSONArray data = list(root);
        if (data == null && root.optJSONObject("result") != null)
            data = list(root.optJSONObject("result"));
        Set<String> unique = new LinkedHashSet<>();
        for (int i = 0; data != null && i < data.length(); i++) {
            Object item = data.opt(i);
            String id = "";
            if (item instanceof JSONObject) {
                id = ((JSONObject) item).optString("id", "").trim();
                if (id.isEmpty()) id = ((JSONObject) item).optString("name", "").trim();
            } else if (item instanceof String) {
                id = ((String) item).trim();
            }
            if (!id.isEmpty()
                    && id.length() <= MAX_ID_CHARS
                    && id.indexOf('\r') < 0
                    && id.indexOf('\n') < 0) unique.add(id);
        }
        List<String> models = new ArrayList<>(unique);
        models.sort(String.CASE_INSENSITIVE_ORDER);
        return models;
    }

    private static JSONArray list(JSONObject object) {
        JSONArray data = object.optJSONArray("data");
        return data != null ? data : object.optJSONArray("models");
    }
}
