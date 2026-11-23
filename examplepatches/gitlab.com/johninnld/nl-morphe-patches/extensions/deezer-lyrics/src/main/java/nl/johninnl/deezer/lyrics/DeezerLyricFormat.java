package nl.johninnl.deezer.lyrics;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.Locale;

/** The supported Deezer build's PipeLyricsSynchronizedLine JSON schema, not LRCLIB JSON. */
public final class DeezerLyricFormat {
    private DeezerLyricFormat() {}

    public static String pipeSyncJson(LyricsPayload payload) {
        if (!payload.synchronizedLines()) return null;
        JSONArray result = new JSONArray();
        try {
            for (LyricsPayload.Line line : payload.lines) {
                JSONObject item = new JSONObject();
                int ms = line.startMs;
                item.put("lrcTimestamp", String.format(Locale.ROOT, "[%02d:%02d.%03d]", ms / 60000, (ms / 1000) % 60, ms % 1000));
                item.put("line", line.text);
                item.put("lineTranslated", JSONObject.NULL);
                item.put("milliseconds", ms);
                item.put("duration", line.endMs - line.startMs);
                result.put(item);
            }
        } catch (org.json.JSONException malformed) { throw new IllegalStateException("Invalid normalized lyric line", malformed); }
        return result.toString();
    }

    public static String[] texts(LyricsPayload payload) {
        if (!payload.synchronizedLines()) return payload.plainText.split("\n", -1);
        String[] result = new String[payload.lines.size()];
        for (int i = 0; i < result.length; i++) result[i] = payload.lines.get(i).text;
        return result;
    }

    public static int[] times(LyricsPayload payload) {
        String[] texts = texts(payload);
        int[] result = new int[texts.length];
        for (int i = 0; i < result.length; i++) result[i] = payload.synchronizedLines() ? payload.lines.get(i).startMs : -1;
        return result;
    }

    public static boolean usableNativeSync(String json) {
        if (json == null) return false;
        try {
            JSONArray lines = new JSONArray(json);
            boolean knownSchema = false;
            for (int i = 0; i < lines.length(); i++) {
                JSONObject line = lines.optJSONObject(i);
                if (line == null) continue;
                if (line.has("line")) {
                    knownSchema = true;
                    if (!line.optString("line", "").trim().isEmpty()) return true;
                }
                JSONArray words = line.optJSONArray("words");
                if (words != null) {
                    knownSchema = true;
                    for (int j = 0; j < words.length(); j++) {
                        JSONObject word = words.optJSONObject(j);
                        if (word != null && !word.optString("text", "").trim().isEmpty()) return true;
                    }
                }
            }
            return !knownSchema && lines.length() > 0;
        } catch (org.json.JSONException malformed) { return false; }
    }
}
