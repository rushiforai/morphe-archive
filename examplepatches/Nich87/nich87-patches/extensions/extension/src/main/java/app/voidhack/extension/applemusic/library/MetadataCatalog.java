package app.voidhack.extension.applemusic.library;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.IntConsumer;

final class MetadataCatalog {
    private final AtomicBoolean cancelled;
    private final Map<String, JSONObject> items = new LinkedHashMap<>();
    private final Map<String, JSONObject> japanese = new LinkedHashMap<>();

    MetadataCatalog(AtomicBoolean cancelled) { this.cancelled = cancelled; }

    void loadJapanese(Set<String> ids, LibraryDaap cloud, IntConsumer progress) throws IOException {
        List<String> requested = new ArrayList<>(ids);
        for (int start = 0; start < requested.size(); start += 100) {
            checkCancelled();
            List<String> batch = requested.subList(start, Math.min(start + 100, requested.size()));
            String joined = String.join(",", batch);
            byte[] response = cloud.requestGet("https://itunes.apple.com/lookup?id=" + joined + "&country=jp&lang=ja_jp&limit=200");
            try {
                JSONArray results = new JSONObject(new String(response, StandardCharsets.UTF_8)).getJSONArray("results");
                for (int i = 0; i < results.length(); i++) {
                    JSONObject item = results.getJSONObject(i);
                    String key = item.has("trackId") ? item.optString("trackId") : item.optString("collectionId");
                    if (batch.contains(key) && "JPN".equals(item.optString("country"))) japanese.put(key, item);
                }
            } catch (JSONException exception) { throw new IOException("Japanese catalog lookup failed", exception); }
            progress.accept(Math.min(start + 100, requested.size()));
        }
    }

    void load(Set<String> identifiers, IntConsumer progress) throws IOException {
        List<String> missing = new ArrayList<>(identifiers);
        missing.removeAll(items.keySet());
        for (int start = 0; start < missing.size(); start += 50) {
            checkCancelled();
            List<String> batch = missing.subList(start, Math.min(start + 50, missing.size()));
            for (String id : batch) if (!id.matches("[1-9][0-9]{0,18}")) throw new IOException("Invalid catalog identity");
            try {
                Object response = MusicReflection.invoke("com.apple.android.music.playback.queue.LookupHelper", "lookupMLCoreBlocking",
                        (Object) batch.toArray(new String[0]), "product", false, "metadata-repair");
                if ((Integer) MusicReflection.call(response, "getStatusCode") != 200) throw new IOException("Catalog lookup failed");
                byte[] body = (byte[]) MusicReflection.call(response, "getBody");
                if (body == null || body.length > DaapCodec.MAX_BODY) throw new IOException("Invalid catalog response");
                Map<String, JSONObject> found = decode(new JSONObject(new String(body, StandardCharsets.UTF_8)), new LinkedHashSet<>(batch));
                for (String id : batch) items.put(id, found.get(id));
            } catch (ReflectiveOperationException | JSONException exception) { throw new IOException("Catalog lookup failed", exception); }
            progress.accept(Math.min(start + 50, missing.size()));
        }
    }

    Set<String> related(Set<String> songs) {
        Set<String> related = new LinkedHashSet<>();
        for (String id : songs) {
            JSONObject song = items.get(id);
            if (song == null) continue;
            addId(related, song.optString("collectionId"));
            addId(related, song.optString("artistId"));
        }
        return related;
    }

    Set<String> albums(Set<String> songs) {
        Set<String> albums = new LinkedHashSet<>();
        for (String id : songs) {
            JSONObject song = items.get(id);
            if (song != null) addId(albums, song.optString("collectionId"));
        }
        return albums;
    }

    Map<String, String> metadata(String id) {
        JSONObject song = items.get(id);
        JSONObject jp = japanese.get(id);
        if (song == null || jp == null || !"song".equals(song.optString("kind")) || !"song".equals(jp.optString("kind"))) return Collections.emptyMap();
        JSONObject album = items.get(song.optString("collectionId"));
        JSONObject artist = items.get(song.optString("artistId"));
        JSONObject albumArtist = album == null ? null : items.get(album.optString("artistId"));
        Map<String, String> result = new LinkedHashMap<>();
        put(result, "minm", jp.optString("trackName"));
        put(result, "asar", jp.optString("artistName"));
        put(result, "asal", jp.optString("collectionName"));
        put(result, "asgn", jp.optString("primaryGenreName"));
        JSONObject jpAlbum = japanese.get(jp.optString("collectionId"));
        if (jpAlbum != null) put(result, "asaa", jpAlbum.optString("artistName"));
        boolean localized = jp.optString("trackName").equals(song.optString("name"))
                && jp.optString("artistName").equals(song.optString("artistName"))
                && jp.optString("collectionName").equals(song.optString("collectionName"));
        if (!localized) return result;
        if (album != null && "album".equals(album.optString("kind"))) {
            if (jpAlbum == null) put(result, "asaa", album.optString("artistName"));
            put(result, "assu", album.optString("nameSortValue"));
        }
        JSONObject composer = song.optJSONObject("composer");
        if (composer != null) {
            put(result, "ascp", composer.optString("name"));
            put(result, "assc", composer.optString("nameSortValue"));
        }
        JSONArray genres = song.optJSONArray("genreNames");
        if (genres != null && genres.length() > 0) put(result, "asgn", genres.optString(0));
        put(result, "assn", song.optString("nameSortValue"));
        if (artist != null) put(result, "assa", artist.optString("nameSortValue"));
        if (albumArtist != null) put(result, "assl", albumArtist.optString("nameSortValue"));
        put(result, "awrk", song.optString("workName"));
        put(result, "amvm", song.optString("movementName"));
        put(result, "agrp", song.optString("grouping"));
        put(result, "ascm", song.optString("comment"));
        String date = song.optString("releaseDate");
        if (date.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}.*")) put(result, "asyr", date.substring(0, 4));
        String[][] numbers = {{"astn", "trackNumber"}, {"astc", "trackCount"}, {"asdn", "discNumber"},
                {"asdc", "discCount"}, {"asbt", "bpm"}, {"amvn", "movementNumber"}, {"amvc", "movementCount"}};
        for (String[] field : numbers) {
            int number = song.optInt(field[1], 0);
            if (number > 0 && number <= 65535) put(result, field[0], Integer.toString(number));
        }
        return result;
    }

    static Map<String, JSONObject> decode(JSONObject response, Set<String> wanted) throws IOException {
        Map<String, JSONObject> result = new LinkedHashMap<>();
        collect(response, wanted, result, 0);
        return result;
    }

    private static void collect(Object value, Set<String> wanted, Map<String, JSONObject> result, int depth) throws IOException {
        if (depth > 16) throw new IOException("Catalog response nesting is too deep");
        if (value instanceof JSONObject) {
            JSONObject object = (JSONObject) value;
            String id = object.optString("id");
            if (wanted.contains(id) && object.has("kind") && object.has("name")) {
                if (result.put(id, object) != null) throw new IOException("Ambiguous catalog identity");
                return;
            }
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collect(object.opt(keys.next()), wanted, result, depth + 1);
        } else if (value instanceof JSONArray) {
            JSONArray array = (JSONArray) value;
            for (int i = 0; i < array.length(); i++) collect(array.opt(i), wanted, result, depth + 1);
        }
    }

    private static void put(Map<String, String> fields, String key, String value) {
        if (!value.isEmpty() && !"null".equals(value)) fields.put(key, value);
    }

    private static void addId(Set<String> ids, String id) { if (id.matches("[1-9][0-9]{0,18}")) ids.add(id); }
    private void checkCancelled() { if (cancelled.get()) throw new CancellationException(); }
}
