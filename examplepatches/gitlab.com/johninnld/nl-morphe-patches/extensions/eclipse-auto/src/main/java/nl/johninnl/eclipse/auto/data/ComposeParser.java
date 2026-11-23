package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Reads the compose wire JSON. Home is {@code {day, storefront, policyVersion, rows[]}} with rows
 * {@code {key, kind, title, provenance, items[]}}; Discover is a different shape,
 * {@code {sections[]}} with sections {@code {key, title, layout, cards[]}} and cards
 * {@code {id, title, subtitle, artworkUrl, signals[], tracks[]}}. Feed text is only ever text.
 */
public final class ComposeParser {
    /** Reads one string; a missing, null or empty value is null (org.json would turn JSON null into "null"). */
    static String text(JSONObject object, String key) {
        if (object == null || !object.has(key) || object.isNull(key)) return null;
        String value = object.optString(key, null);
        return value == null || value.isEmpty() ? null : value;
    }

    private static Integer number(JSONObject object, String key) {
        return object.has(key) && !object.isNull(key) ? Integer.valueOf(object.optInt(key)) : null;
    }

    private static Boolean flag(JSONObject object, String key) {
        return object.has(key) && !object.isNull(key) ? Boolean.valueOf(object.optBoolean(key)) : null;
    }

    private static String first(String... candidates) {
        for (String candidate : candidates) if (candidate != null) return candidate;
        return null;
    }

    public static ComposeFeed.Home parseHome(String json) throws JSONException {
        JSONObject root = new JSONObject(json);
        JSONArray rows = root.optJSONArray("rows");
        List<ComposeFeed.Row> result = new ArrayList<>();
        if (rows != null) {
            for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.optJSONObject(i);
                if (row == null) continue;
                String key = text(row, "key");
                String kind = text(row, "kind");
                if (key == null || kind == null) continue;
                List<ComposeFeed.Item> items = new ArrayList<>();
                JSONArray array = row.optJSONArray("items");
                if (array != null) {
                    for (int j = 0; j < array.length(); j++) {
                        JSONObject item = array.optJSONObject(j);
                        if (item != null) items.add(item(kind, item));
                    }
                }
                result.add(new ComposeFeed.Row(key, kind, text(row, "title"), text(row, "provenance"), items, art(row.optJSONObject("art"))));
            }
        }
        return new ComposeFeed.Home(result);
    }

    /** A native row's artwork map ({@code {"replay": url, ...}}); only string values count. */
    private static Map<String, String> art(JSONObject object) {
        Map<String, String> result = new LinkedHashMap<>();
        if (object == null) return result;
        Iterator<String> keys = object.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            String url = text(object, key);
            if (url != null) result.put(key, url);
        }
        return result;
    }

    /** {@code ytmusic-} or {@code spotify-} and twenty hex digits: the id of a linked list the app can load. */
    public static final Pattern LINKED_LIST_ID = Pattern.compile("^(spotify|ytmusic)-[0-9a-f]{20}$");
    /** The id the app plays a linked service's song under. */
    public static final Pattern LINKED_TRACK_ID = Pattern.compile("^linked_(spotify|ytmusic)_[A-Za-z0-9_-]{1,64}$");

    public static ComposeFeed.Discover parseDiscover(String json) throws JSONException {
        JSONObject root = new JSONObject(json);
        JSONArray sections = root.optJSONArray("sections");
        List<ComposeFeed.Section> result = new ArrayList<>();
        if (sections != null) {
            for (int i = 0; i < sections.length(); i++) {
                JSONObject section = sections.optJSONObject(i);
                if (section == null) continue;
                List<ComposeFeed.Card> cards = new ArrayList<>();
                JSONArray array = section.optJSONArray("cards");
                if (array != null) {
                    for (int j = 0; j < array.length(); j++) {
                        JSONObject card = array.optJSONObject(j);
                        if (card != null) cards.add(card(card));
                    }
                }
                result.add(new ComposeFeed.Section(text(section, "key"), text(section, "title"), text(section, "layout"), cards));
            }
        }
        return new ComposeFeed.Discover(result);
    }

    private static ComposeFeed.Card card(JSONObject card) {
        List<String> signals = new ArrayList<>();
        JSONArray array = card.optJSONArray("signals");
        if (array != null) {
            for (int i = 0; i < array.length(); i++) {
                String signal = array.optString(i, null);
                if (signal != null && !signal.isEmpty()) signals.add(signal);
            }
        }
        return new ComposeFeed.Card(text(card, "id"), text(card, "title"), text(card, "subtitle"), text(card, "artworkUrl"),
            signals, tracks(card.optJSONArray("tracks")));
    }

    private static List<ComposeFeed.Item> tracks(JSONArray array) {
        List<ComposeFeed.Item> result = new ArrayList<>();
        if (array == null) return result;
        for (int i = 0; i < array.length(); i++) {
            JSONObject track = array.optJSONObject(i);
            if (track != null) result.add(item("tracks", track));
        }
        return result;
    }

    /** One item, read by the kind of the row that holds it. */
    static ComposeFeed.Item item(String kind, JSONObject object) {
        ComposeFeed.Item.Builder b = new ComposeFeed.Item.Builder();
        switch (kind) {
            case "tracks":
                b.title = text(object, "title");
                b.subtitle = text(object, "artist");
                b.artUrl = text(object, "artworkUrl");
                b.json = object.toString();
                b.explicit = flag(object, "explicit");
                // A linked service's song plays under the id the server names for it.
                String linkedTrack = text(object, "addonTrackId");
                if ("default".equals(text(object, "addonId")) && linkedTrack != null && LINKED_TRACK_ID.matcher(linkedTrack).matches()) {
                    b.linkedTrackId = linkedTrack;
                }
                break;
            case "playlists":
                b.title = text(object, "name");
                b.subtitle = first(text(object, "curator"), text(object, "subtitle"), text(object, "description"), text(object, "creator"));
                b.artUrl = text(object, "artworkUrl");
                b.playlistId = text(object, "playlistId");
                b.appleMusicPlaylistId = text(object, "appleMusicPlaylistId");
                b.favorites = Boolean.TRUE.equals(flag(object, "isFavorites"));
                b.trackCount = number(object, "trackCount");
                // A linked service's playlist card ({id: "ytmusic-<20 hex>"}) or a linked-library playlist in the recents.
                String listId = text(object, "id");
                if (listId != null && LINKED_LIST_ID.matcher(listId).matches()) b.linkedListId = listId;
                if ("linked_playlist".equals(text(object, "type"))) {
                    b.provider = text(object, "provider");
                    b.providerPlaylistId = text(object, "providerPlaylistId");
                }
                break;
            case "albums":
                b.title = text(object, "title");
                b.subtitle = text(object, "artist");
                b.artUrl = text(object, "artworkUrl");
                b.appleMusicAlbumId = text(object, "appleMusicAlbumId");
                b.releaseDate = text(object, "releaseDate");
                b.trackCount = number(object, "trackCount");
                b.genre = text(object, "genre");
                b.explicit = flag(object, "explicit");
                break;
            case "artists":
                b.title = text(object, "name");
                b.subtitle = text(object, "genre");
                b.artUrl = text(object, "imageUrl");
                b.appleMusicArtistId = text(object, "appleMusicArtistId");
                b.genre = text(object, "genre");
                break;
            case "mixes":
                b.title = text(object, "name");
                b.mixId = text(object, "mixId");
                b.artUrl = text(object, "artworkUrl");
                b.tracks = tracks(object.optJSONArray("tracks"));
                JSONArray artists = object.optJSONArray("artists");
                if (artists != null) {
                    StringBuilder names = new StringBuilder();
                    for (int i = 0; i < artists.length(); i++) {
                        String name = artists.optString(i, null);
                        if (name == null || name.isEmpty()) continue;
                        if (names.length() > 0) names.append(", ");
                        names.append(name);
                    }
                    b.subtitle = names.length() == 0 ? null : names.toString();
                }
                // A mix without its own art wears its first song's.
                if (b.artUrl == null && !b.tracks.isEmpty()) b.artUrl = b.tracks.get(0).artUrl;
                break;
            case "stations":
                b.title = text(object, "name");
                b.subtitle = text(object, "description");
                b.stationId = text(object, "id");
                JSONObject now = object.optJSONObject("nowPlaying");
                if (now != null) {
                    b.nowTitle = text(now, "title");
                    b.nowArtist = text(now, "artist");
                    b.nowCover = text(now, "coverUrl");
                }
                b.artUrl = b.nowCover;
                break;
            default:
                b.title = first(text(object, "title"), text(object, "name"));
        }
        return new ComposeFeed.Item(b);
    }

    private ComposeParser() { }
}
