package io.github.emotionbug.patches.runtime;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/** Callback-generation evidence copied before the Room executor can observe another generation. */
final class AdotApiSnapshot {
    private final int self;
    private final String title;
    private final Row[] rows;

    private AdotApiSnapshot(int self, String title, Row[] rows) {
        this.self = self;
        this.title = title;
        this.rows = rows;
    }

    static AdotApiSnapshot capture(Object apiResult) throws ReflectiveOperationException {
        Class<?> type = apiResult.getClass();
        int self = type.getField("a").getInt(apiResult);
        String title = (String) type.getField("b").get(apiResult);
        List<?> source = (List<?>) type.getField("d").get(apiResult);
        Row[] rows = new Row[source.size()];
        if (rows.length > 0) {
            Class<?> rowType = source.get(0).getClass();
            Field sequence = rowType.getField("a"), message = rowType.getField("b"),
                    talker = rowType.getField("c"), time = rowType.getField("d"), duration = rowType.getField("e");
            int index = 0;
            for (Object row : source) {
                rows[index++] = new Row(sequence.getInt(row), (String) message.get(row), talker.getInt(row),
                        time.getLong(row), duration.getLong(row));
            }
            if (index != rows.length) throw new IllegalArgumentException("API transcript changed during capture");
            Arrays.sort(rows, Comparator.comparingInt(row -> row.sequence));
            for (int i = 1; i < rows.length; i++) {
                if (rows[i - 1].sequence == rows[i].sequence)
                    throw new IllegalArgumentException("Duplicate API transcript sequence");
            }
        }
        return new AdotApiSnapshot(self, title, rows);
    }

    /** Authenticate existing rows only; never repair their metadata using detached callback values. */
    boolean matches(JSONObject canonical) {
        if (canonical == null) return false;
        try {
            JSONArray infos = canonical.getJSONArray("briefing_info");
            if (infos.length() != 1) return false;
            JSONObject info = infos.getJSONObject(0);
            if (info.getLong("my_talk_id") != self
                    || title != null && !title.equals(info.get("call_title"))) return false;
            JSONArray transcript = canonical.getJSONArray("briefing_converted_text");
            if (transcript.length() != rows.length) return false;
            boolean[] seen = new boolean[rows.length];
            for (int i = 0; i < transcript.length(); i++) {
                JSONObject actual = transcript.getJSONObject(i);
                long sequence = actual.getLong("sequence");
                int low = 0, high = rows.length - 1;
                while (low <= high) {
                    int middle = (low + high) >>> 1;
                    if (rows[middle].sequence < sequence) low = middle + 1;
                    else if (rows[middle].sequence > sequence) high = middle - 1;
                    else { low = middle; break; }
                }
                if (low >= rows.length || rows[low].sequence != sequence || seen[low]) return false;
                Row expected = rows[low];
                Object message = actual.get("message");
                if (!Objects.equals(expected.message, message == JSONObject.NULL ? null : message)
                        || actual.getLong("talker_id") != expected.talker
                        || actual.getLong("talk_time") != expected.time
                        || actual.getLong("talk_duration") != expected.duration
                        || actual.getLong("is_edited") != 0) return false;
                seen[low] = true;
            }
            return true;
        } catch (JSONException malformed) {
            return false;
        }
    }

    private static final class Row {
        final int sequence;
        final String message;
        final int talker;
        final long time;
        final long duration;

        Row(int sequence, String message, int talker, long time, long duration) {
            this.sequence = sequence;
            this.message = message;
            this.talker = talker;
            this.time = time;
            this.duration = duration;
        }
    }
}
