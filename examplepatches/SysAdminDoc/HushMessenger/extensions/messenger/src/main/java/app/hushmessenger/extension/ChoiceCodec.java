package app.hushmessenger.extension;

import android.content.SharedPreferences;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/** Settings-only UTF-8 backups. Both clipboard and documents use this exact format. */
final class ChoiceCodec {
    static final int MAX_BYTES = 16 * 1024;
    static final String HEADER = "hushmessenger:choices:v1";
    static final String LEGACY_HEADER = "hushmessenger:choices";

    static String encode(SharedPreferences preferences, Set<String> installed) {
        StringBuilder result = new StringBuilder(HEADER).append('\n');
        result.append("paused=").append(preferences.getBoolean("paused", false)).append('\n');
        for (String[] spec : SettingsActivity.CONTROLS) {
            String key = spec[0];
            if (installed.contains(key)) result.append(key).append('=')
                .append(preferences.getBoolean(key, false)).append('\n');
        }
        if (installed.contains("bubbles")) result.append(Settings.BUBBLE_CHAT_HEADS).append('=')
            .append(preferences.getBoolean(Settings.BUBBLE_CHAT_HEADS, false)).append('\n');
        return result.toString();
    }

    static Map<String, Boolean> parse(String raw) {
        if (raw == null || raw.length() > MAX_BYTES || raw.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES)
            throw new IllegalArgumentException("Backup exceeds 16 KiB or is missing");
        String[] lines = raw.split("\r?\n", -1);
        if (!HEADER.equals(lines[0]) && !LEGACY_HEADER.equals(lines[0]))
            throw new IllegalArgumentException("Unsupported backup header");
        Map<String, Boolean> result = new LinkedHashMap<>();
        for (int index = 1; index < lines.length; index++) {
            String line = lines[index];
            if (index == lines.length - 1 && line.isEmpty()) continue;
            int equals = line.indexOf('=');
            if (equals < 1 || !line.substring(0, equals).matches("[a-z][a-z0-9_]{0,63}"))
                throw new IllegalArgumentException("Invalid backup line");
            String key = line.substring(0, equals), value = line.substring(equals + 1);
            if ((!"true".equals(value) && !"false".equals(value)) || result.containsKey(key))
                throw new IllegalArgumentException("Invalid or duplicate choice");
            result.put(key, "true".equals(value));
        }
        return result;
    }

    static String read(InputStream stream) throws IOException {
        if (stream == null) throw new IOException("No readable document");
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        byte[] bytes = new byte[4096];
        int length;
        while ((length = stream.read(bytes)) != -1) {
            if (result.size() + length > MAX_BYTES) throw new IOException("Backup exceeds 16 KiB");
            result.write(bytes, 0, length);
        }
        return result.toString(StandardCharsets.UTF_8.name());
    }

    private ChoiceCodec() { }
}
