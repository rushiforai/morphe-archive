package app.waze.elevenlabs.extension;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * ElevenLabs REST calls. Synthesized audio is cached on disk by voice, model, settings and text:
 * navigation repeats the same phrases constantly, so most prompts never reach the network twice.
 */
final class ElevenLabsClient {
    private static final String API = "https://api.elevenlabs.io";
    private static final long CACHE_BYTES = 64L * 1024 * 1024;

    private ElevenLabsClient() {}

    static final class ApiException extends IOException {
        ApiException(String message) { super(message); }
    }

    static final class Choice {
        final String id, name;
        Choice(String id, String name) { this.id = id; this.name = name; }
    }

    /** Identifies how audio sounds under these settings: voice, model and voice settings. */
    static String voiceIdentity(ElevenLabsSettings.Config config) {
        return sha256(config.voiceId + '\n' + config.modelId + '\n' + config.stability + '\n'
                + config.similarity + '\n' + config.speed);
    }

    /** Cache file for this text under the given settings; it exists only once fully written. */
    static File cacheFile(File cacheDir, ElevenLabsSettings.Config config, String text) {
        String identity = config.voiceId + '\n' + config.modelId + '\n' + config.stability + '\n'
                + config.similarity + '\n' + config.speed + '\n' + text;
        return new File(new File(cacheDir, "elevenlabs"), sha256(identity) + ".mp3");
    }

    /** Returns the cached MP3 for text, synthesizing it first if needed. */
    static File speech(File cacheDir, ElevenLabsSettings.Config config, String text) throws IOException {
        File target = cacheFile(cacheDir, config, text);
        if (target.length() > 0) {
            target.setLastModified(System.currentTimeMillis());
            return target;
        }
        File dir = target.getParentFile();
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir);
        JSONObject body = new JSONObject();
        try {
            body.put("text", text);
            body.put("model_id", config.modelId);
            body.put("voice_settings", new JSONObject()
                    .put("stability", config.stability)
                    .put("similarity_boost", config.similarity)
                    .put("speed", config.speed));
        } catch (JSONException impossible) { throw new IOException(impossible); }

        HttpURLConnection connection = open("/v1/text-to-speech/" + URLEncoder.encode(config.voiceId, "UTF-8")
                + "?output_format=mp3_44100_128", config.apiKey);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Accept", "audio/mpeg");
        connection.setDoOutput(true);
        try {
            try (OutputStream out = connection.getOutputStream()) {
                out.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            check(connection);
            File partial = new File(dir, target.getName() + ".part");
            try (InputStream in = connection.getInputStream(); OutputStream out = new FileOutputStream(partial)) {
                byte[] buffer = new byte[16 * 1024];
                for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
            }
            if (partial.length() == 0 || !partial.renameTo(target)) {
                partial.delete();
                throw new IOException("ElevenLabs returned no audio");
            }
        } finally {
            connection.disconnect();
        }
        trim(dir);
        return target;
    }

    static List<Choice> voices(String apiKey) throws IOException {
        JSONArray voices = optArray(getJson("/v1/voices", apiKey), "voices");
        List<Choice> result = new ArrayList<>();
        for (int i = 0; i < voices.length(); i++) {
            JSONObject voice = voices.optJSONObject(i);
            if (voice == null) continue;
            String category = voice.optString("category", "");
            String name = voice.optString("name", voice.optString("voice_id"));
            result.add(new Choice(voice.optString("voice_id"), category.isEmpty() ? name : name + " (" + category + ")"));
        }
        return result;
    }

    static List<Choice> models(String apiKey) throws IOException {
        JSONArray models;
        try { models = new JSONArray(get("/v1/models", apiKey)); }
        catch (JSONException error) { throw new ApiException("Unexpected response from ElevenLabs"); }
        List<Choice> result = new ArrayList<>();
        for (int i = 0; i < models.length(); i++) {
            JSONObject model = models.optJSONObject(i);
            if (model == null || !model.optBoolean("can_do_text_to_speech", true)) continue;
            result.add(new Choice(model.optString("model_id"), model.optString("name", model.optString("model_id"))));
        }
        return result;
    }

    static long cacheSize(File cacheDir) {
        File[] files = new File(cacheDir, "elevenlabs").listFiles();
        long total = 0;
        if (files != null) for (File file : files) total += file.length();
        return total;
    }

    static void clearCache(File cacheDir) {
        File[] files = new File(cacheDir, "elevenlabs").listFiles();
        if (files != null) for (File file : files) file.delete();
    }

    private static void trim(File dir) {
        File[] files = dir.listFiles();
        if (files == null) return;
        long total = 0;
        for (File file : files) total += file.length();
        if (total <= CACHE_BYTES) return;
        Arrays.sort(files, (a, b) -> Long.compare(a.lastModified(), b.lastModified()));
        for (File file : files) {
            if (total <= CACHE_BYTES * 3 / 4) break;
            total -= file.length();
            file.delete();
        }
    }

    private static JSONObject getJson(String path, String apiKey) throws IOException {
        try { return new JSONObject(get(path, apiKey)); }
        catch (JSONException error) { throw new ApiException("Unexpected response from ElevenLabs"); }
    }

    private static JSONArray optArray(JSONObject object, String name) {
        JSONArray array = object.optJSONArray(name);
        return array == null ? new JSONArray() : array;
    }

    private static String get(String path, String apiKey) throws IOException {
        HttpURLConnection connection = open(path, apiKey);
        try {
            check(connection);
            return read(connection.getInputStream());
        } finally {
            connection.disconnect();
        }
    }

    private static HttpURLConnection open(String path, String apiKey) throws IOException {
        if (apiKey == null || apiKey.isEmpty()) throw new ApiException("Enter your ElevenLabs API key");
        HttpURLConnection connection = (HttpURLConnection) new URL(API + path).openConnection();
        connection.setConnectTimeout(4000);
        connection.setReadTimeout(8000);
        connection.setRequestProperty("xi-api-key", apiKey);
        return connection;
    }

    /** Throws with ElevenLabs' own error message for any non-2xx response. */
    private static void check(HttpURLConnection connection) throws IOException {
        int code = connection.getResponseCode();
        if (code / 100 == 2) return;
        String message = null;
        InputStream error = connection.getErrorStream();
        if (error != null) {
            try {
                JSONObject body = new JSONObject(read(error));
                Object detail = body.opt("detail");
                if (detail instanceof JSONObject) message = ((JSONObject) detail).optString("message", null);
                else if (detail != null) message = detail.toString();
            } catch (JSONException | IOException ignored) { }
        }
        if (message == null || message.isEmpty()) {
            message = code == 401 ? "Invalid API key" : "HTTP " + code;
        }
        throw new ApiException("ElevenLabs: " + message);
    }

    private static String read(InputStream in) throws IOException {
        try (InputStream stream = in) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int n; (n = stream.read(buffer)) > 0; ) out.write(buffer, 0, n);
            return out.toString("UTF-8");
        }
    }

    private static String sha256(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (int i = 0; i < 16; i++) hex.append(String.format(Locale.ROOT, "%02x", digest[i]));
            return hex.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }
}
