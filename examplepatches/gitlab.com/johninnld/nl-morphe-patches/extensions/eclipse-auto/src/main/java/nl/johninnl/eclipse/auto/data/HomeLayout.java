package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * The phone lets users reorder, hide and rename Home sections ({@code home_layout_prefs},
 * {@code home_layout_v1}: {@code {order, hidden, titles}}); the car applies the same choices so
 * Home matches. The phone's order is: the user's order, then its default order, then whatever else
 * the server sent. Here the rows the phone knows about take that order within the slots they
 * occupy in the server's list, and rows nobody knows about (for example {@code ytmusic_mixes})
 * stay exactly where the server put them.
 */
public final class HomeLayout {
    /** The phone's default section order. */
    static final List<String> DEFAULT_ORDER = Collections.unmodifiableList(java.util.Arrays.asList(
        "recently_played", "ai_dj", "made_for_you", "daily_mixes", "new_for_you", "followed_releases", "eclipse_stations",
        "jump_back_in", "top_songs", "genre_picks", "trending", "eclipse_charts", "featured_artist", "fresh_drops",
        "new_releases", "mood_mixes", "popular_artists", "editorial_playlists", "discover_playlists", "your_playlists",
        "your_shows"));

    /** The phone's built-in label of each section: what shows when neither the user nor the server names it. */
    private static final Map<String, String> DEFAULT_LABELS;
    static {
        Map<String, String> labels = new HashMap<>();
        labels.put("recently_played", "Recent playlists");
        labels.put("ai_dj", "Umbra");
        labels.put("made_for_you", "Made For You");
        labels.put("daily_mixes", "Your daily mixes");
        labels.put("new_for_you", "New for you");
        labels.put("followed_releases", "New from artists you follow");
        labels.put("eclipse_stations", "Live stations");
        labels.put("jump_back_in", "Jump back in");
        labels.put("top_songs", "Your top songs");
        labels.put("genre_picks", "Genre picks");
        labels.put("trending", "Trending now");
        labels.put("eclipse_charts", "Trending on Eclipse");
        labels.put("featured_artist", "Artist spotlight");
        labels.put("fresh_drops", "Fresh drops");
        labels.put("new_releases", "New releases for you");
        labels.put("mood_mixes", "Mood mixes");
        labels.put("popular_artists", "Popular artists");
        labels.put("editorial_playlists", "Popular playlists");
        labels.put("discover_playlists", "Discover something new");
        labels.put("your_playlists", "Your playlists");
        labels.put("your_shows", "Your shows");
        DEFAULT_LABELS = Collections.unmodifiableMap(labels);
    }

    /** The built-in label of a section key, or null for a key the phone has no label for. */
    public static String defaultLabel(String key) { return DEFAULT_LABELS.get(key); }

    private final List<String> order;
    private final Set<String> hidden;
    private final Map<String, String> titles;

    private HomeLayout(List<String> order, Set<String> hidden, Map<String, String> titles) {
        this.order = order;
        this.hidden = hidden;
        this.titles = titles;
    }

    /** No customisation: the phone's default order, nothing hidden, the server's titles. */
    public static HomeLayout defaults() {
        return new HomeLayout(Collections.<String>emptyList(), Collections.<String>emptySet(), Collections.<String, String>emptyMap());
    }

    /** Reads the stored JSON; anything unreadable means the defaults, as on the phone. */
    public static HomeLayout parse(String json) {
        if (json == null || json.isEmpty()) return defaults();
        try {
            JSONObject root = new JSONObject(json);
            Map<String, String> titles = new HashMap<>();
            JSONObject names = root.optJSONObject("titles");
            if (names != null) {
                java.util.Iterator<String> keys = names.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    String title = names.optString(key, null);
                    if (title != null && !title.isEmpty()) titles.put(key, title);
                }
            }
            return new HomeLayout(strings(root.optJSONArray("order")), new HashSet<>(strings(root.optJSONArray("hidden"))), titles);
        } catch (Exception unreadable) {
            return defaults();
        }
    }

    private static List<String> strings(JSONArray array) {
        List<String> result = new ArrayList<>();
        if (array == null) return result;
        for (int i = 0; i < array.length(); i++) {
            String value = array.optString(i, null);
            if (value != null && !value.isEmpty()) result.add(value);
        }
        return result;
    }

    /** True when the user renamed this section on the phone. */
    public boolean hasTitle(String key) { return titles.containsKey(key); }

    /** The phone's rank of a key: the user's order first, then the defaults; -1 for keys the phone does not know. */
    private int rank(String key) {
        int custom = order.indexOf(key);
        if (custom >= 0) return custom;
        int standard = DEFAULT_ORDER.indexOf(key);
        return standard >= 0 ? order.size() + standard : -1;
    }

    /** The visible rows in the user's order, with the user's titles. */
    public List<ComposeFeed.Row> apply(List<ComposeFeed.Row> serverRows) {
        List<Integer> slots = new ArrayList<>();
        List<ComposeFeed.Row> known = new ArrayList<>();
        for (int i = 0; i < serverRows.size(); i++) {
            if (rank(serverRows.get(i).key) >= 0) {
                slots.add(i);
                known.add(serverRows.get(i));
            }
        }
        // Stable: rows with the same key keep the server's order among themselves.
        Collections.sort(known, new java.util.Comparator<ComposeFeed.Row>() {
            @Override public int compare(ComposeFeed.Row a, ComposeFeed.Row b) { return Integer.compare(rank(a.key), rank(b.key)); }
        });
        List<ComposeFeed.Row> arranged = new ArrayList<>(serverRows);
        for (int i = 0; i < slots.size(); i++) arranged.set(slots.get(i), known.get(i));
        List<ComposeFeed.Row> visible = new ArrayList<>();
        for (ComposeFeed.Row row : arranged) {
            if (hidden.contains(row.key)) continue;
            String title = titles.get(row.key);
            visible.add(title == null ? row : row.withTitle(title));
        }
        return visible;
    }
}
