package software.santodan.extension.nuviomerged;

import android.util.JsonReader;
import android.util.JsonToken;
import java.io.FilterReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;

/** Restore final model collections directly, without a second full JSON object tree. */
public final class NuvioWatchedSnapshot {
    public final Map<String, Set<Object>> history = new LinkedHashMap<>();
    public final Map<String, Set<String>> siblings = new LinkedHashMap<>();
    public final List<Object> items = new ArrayList<>();
    public boolean historyPresent;
    public boolean siblingsPresent;
    public long savedAt;
    private NuvioWatchedSnapshot() {}

    public static NuvioWatchedSnapshot read(String encoded, Runnable checkpoint,
            BiFunction<Integer, Integer, Object> episode, Function<Map<String, Object>, Object> item) throws IOException {
        return read(encoded, checkpoint, episode, item, true);
    }

    /** Startup needs episode membership and aliases, not thousands of WatchedItem models. */
    public static NuvioWatchedSnapshot projection(String encoded, Runnable checkpoint,
            BiFunction<Integer, Integer, Object> episode) throws IOException {
        return read(encoded, checkpoint, episode, null, false);
    }

    private static NuvioWatchedSnapshot read(String encoded, Runnable checkpoint,
            BiFunction<Integer, Integer, Object> episode, Function<Map<String, Object>, Object> item,
            boolean includeItems) throws IOException {
        checkpoint.run();
        NuvioWatchedSnapshot result = new NuvioWatchedSnapshot();
        // Even skipping an unknown/legacy section must remain cancellable.
        try (JsonReader reader = new JsonReader(new FilterReader(new StringReader(encoded)) {
            @Override public int read(char[] buffer, int offset, int length) throws IOException {
                checkpoint.run();
                return super.read(buffer, offset, Math.min(length, 1024));
            }
            @Override public int read() throws IOException { checkpoint.run(); return super.read(); }
        })) {
            reader.beginObject();
            while (reader.hasNext()) {
                checkpoint.run();
                String section = reader.nextName();
                if (reader.peek() == JsonToken.NULL) { reader.nextNull(); continue; }
                switch (section) {
                    case "savedAt": result.savedAt = reader.nextLong(); break;
                    case "watchedHistory":
                        result.historyPresent = true;
                        reader.beginObject();
                        while (reader.hasNext()) {
                            checkpoint.run();
                            String id = reader.nextName();
                            Set<Object> episodes = new LinkedHashSet<>();
                            reader.beginArray();
                            while (reader.hasNext()) {
                                checkpoint.run();
                                reader.beginArray();
                                int season = reader.nextInt(), number = reader.nextInt();
                                while (reader.hasNext()) reader.skipValue();
                                reader.endArray();
                                episodes.add(episode.apply(season, number));
                            }
                            reader.endArray();
                            result.history.put(id, episodes);
                        }
                        reader.endObject();
                        break;
                    case "siblings":
                        result.siblingsPresent = true;
                        reader.beginObject();
                        while (reader.hasNext()) {
                            checkpoint.run();
                            String id = reader.nextName();
                            Set<String> aliases = new LinkedHashSet<>();
                            reader.beginArray();
                            while (reader.hasNext()) { checkpoint.run(); aliases.add(reader.nextString()); }
                            reader.endArray();
                            result.siblings.put(id, aliases);
                        }
                        reader.endObject();
                        break;
                    case "watchedItems":
                        if (!includeItems) { reader.skipValue(); break; }
                        reader.beginArray();
                        while (reader.hasNext()) {
                            checkpoint.run();
                            Map<String, Object> values = new HashMap<>();
                            reader.beginObject();
                            while (reader.hasNext()) {
                                String name = reader.nextName();
                                if (reader.peek() == JsonToken.NULL) { reader.nextNull(); values.put(name, null); }
                                else if (name.equals("getSeason") || name.equals("getEpisode")) values.put(name, reader.nextInt());
                                else if (name.equals("getWatchedAt")) values.put(name, reader.nextLong());
                                else if (reader.peek() == JsonToken.STRING || reader.peek() == JsonToken.NUMBER)
                                    values.put(name, reader.nextString());
                                else reader.skipValue();
                            }
                            reader.endObject();
                            result.items.add(item.apply(values));
                            checkpoint.run();
                        }
                        reader.endArray();
                        break;
                    default: reader.skipValue();
                }
            }
            reader.endObject();
            if (reader.peek() != JsonToken.END_DOCUMENT) throw new IOException("Trailing snapshot data");
        }
        checkpoint.run();
        return result;
    }
}
