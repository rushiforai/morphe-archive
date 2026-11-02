package app.spicetify.extension.spotify.home;

import android.content.Context;
import android.content.SharedPreferences;
import app.spicetify.extension.spotify.extensions.Library;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Puts the pinned shortcuts first on Home, or shows only them, and plans a tile for a pin Spotify left out,
 * which HomeTileBridge builds. It never retains native tile objects.
 */
public final class HomePins {
    private static final int MAX_SHORTCUTS = 64;
    /** Spotify's own cap on the shortcuts grid: Lp/jne1;->u takes 10 tiles before the hook sees them. */
    private static final int MAX_TILES = 10;
    private static SharedPreferences preferences;
    private static boolean onlyPins;
    private static final LinkedHashMap<String, Pin> pins = new LinkedHashMap<>();
    private static final LinkedHashMap<String, String> observed = new LinkedHashMap<>();
    private static final LinkedHashMap<String, Pin> offered = new LinkedHashMap<>();

    private HomePins() {}

    public static final class Choice {
        public final String id;
        public final String label;
        public final boolean pinned;

        private Choice(String id, String label, boolean pinned) {
            this.id = id;
            this.label = label;
            this.pinned = pinned;
        }
    }

    /** A pin's title and cover; either is null when unknown, as a cover is for pins saved before covers were kept. */
    private static final class Pin {
        final String title;
        final String image;

        Pin(String title, String image) {
            this.title = title == null || title.trim().isEmpty() ? null : title;
            this.image = image == null || image.isEmpty() ? null : image;
        }
    }

    public static synchronized void initialize(Context context) {
        preferences = context.getApplicationContext().getSharedPreferences("spicetify_home_pins", Context.MODE_PRIVATE);
        onlyPins = preferences.getBoolean("only_pins", false);
        observed.clear();
        offered.clear();
        pins.clear();
        try {
            JSONArray saved = new JSONArray(preferences.getString("pins", "[]"));
            for (int i = 0; i < Math.min(saved.length(), MAX_SHORTCUTS); i++) {
                JSONObject pin = saved.getJSONObject(i);
                // Pins saved before covers were kept have an id and a label instead of a uri and a title.
                String id = key(pin.optString("uri", pin.optString("id")));
                if (!validId(id)) continue;
                pins.put(id, new Pin(pin.optString("title", pin.optString("label")), pin.optString("image", null)));
            }
        } catch (JSONException ignored) {
            pins.clear();
        }
    }

    /** The pins, then Home's tiles: {@link #choices(List)} before the library comes. */
    public static List<Choice> choices() {
        return choices(Collections.emptyList());
    }

    /**
     * The picker's list: the pins in pin order, then Home's tiles, then {@code library}'s playlists,
     * then its albums, each of those three alphabetically, with every uri once. Pins found in
     * {@code library} take its title and cover, and are saved with them.
     */
    public static synchronized List<Choice> choices(List<Library.Item> library) {
        Map<String, Library.Item> inLibrary = new LinkedHashMap<>();
        for (Library.Item item : library) if (validId(key(item.uri))) inLibrary.putIfAbsent(key(item.uri), item);
        boolean refreshed = false;
        for (Map.Entry<String, Pin> pin : pins.entrySet()) {
            Library.Item item = inLibrary.get(pin.getKey());
            if (item == null) continue;
            // An entry without a name or a cover keeps the stored one.
            Pin fresh = new Pin(item.title, item.image);
            pin.setValue(new Pin(fresh.title != null ? fresh.title : pin.getValue().title,
                    fresh.image != null ? fresh.image : pin.getValue().image));
            refreshed = true;
        }
        if (refreshed) save(pins);

        offered.clear();
        List<Choice> result = new ArrayList<>();
        for (Map.Entry<String, Pin> pin : pins.entrySet()) {
            String title = observed.containsKey(pin.getKey()) ? observed.get(pin.getKey()) : pin.getValue().title;
            result.add(offer(pin.getKey(), title, pin.getValue().image, true));
        }
        List<Choice> home = new ArrayList<>();
        for (Map.Entry<String, String> tile : observed.entrySet()) {
            if (pins.containsKey(tile.getKey())) continue;
            Library.Item item = inLibrary.get(tile.getKey());
            home.add(offer(tile.getKey(), tile.getValue(), item == null ? null : item.image, false));
        }
        List<Choice> playlists = new ArrayList<>();
        List<Choice> albums = new ArrayList<>();
        for (Map.Entry<String, Library.Item> entry : inLibrary.entrySet()) {
            if (pins.containsKey(entry.getKey()) || observed.containsKey(entry.getKey())) continue;
            Library.Item item = entry.getValue();
            (item.album ? albums : playlists).add(offer(entry.getKey(), item.title, item.image, false));
        }
        Collator alphabetically = Collator.getInstance();
        for (List<Choice> group : Arrays.asList(home, playlists, albums)) {
            Collections.sort(group, (a, b) -> alphabetically.compare(a.label, b.label));
            result.addAll(group);
        }
        return Collections.unmodifiableList(result);
    }

    /** A choice for {@code id}, which {@link #setPinned} then saves with this title and cover. */
    private static Choice offer(String id, String title, String image, boolean pinned) {
        offered.put(id, new Pin(title, image));
        return new Choice(id, label(title, id), pinned);
    }

    /** Selection order becomes pin order. Absent pins remain selectable until explicitly removed. */
    public static synchronized void setPinned(List<String> ids) {
        if (preferences == null) throw new IllegalStateException("Home pins are not initialized.");
        if (ids == null || ids.size() > MAX_SHORTCUTS) throw new IllegalArgumentException("Too many Home pins.");
        LinkedHashMap<String, Pin> selected = new LinkedHashMap<>();
        for (String chosen : ids) {
            String id = key(chosen);
            Pin known = offered.containsKey(id) ? offered.get(id) : pins.get(id);
            if (known == null && !observed.containsKey(id)) {
                throw new IllegalArgumentException("Choose a shortcut shown in Home pins.");
            }
            selected.put(id, new Pin(observed.containsKey(id) ? observed.get(id) : known.title,
                    known == null ? null : known.image));
        }
        save(selected);
        pins.clear();
        pins.putAll(selected);
    }

    /** Whether the shortcuts section shows only the pins, once one is placed. Off until switched on. */
    public static synchronized boolean onlyPins() {
        return onlyPins;
    }

    /** Saves "Show only my pins", which {@link #plan} reads from memory. */
    public static synchronized void setOnlyPins(boolean only) {
        if (preferences == null) throw new IllegalStateException("Home pins are not initialized.");
        preferences.edit().putBoolean("only_pins", only).apply();
        onlyPins = only;
    }

    /** Saves {@code selected} as the pins, each {uri, title, image}, leaving out a title or cover it doesn't know. */
    private static void save(Map<String, Pin> selected) {
        JSONArray saved = new JSONArray();
        try {
            for (Map.Entry<String, Pin> pin : selected.entrySet()) {
                saved.put(new JSONObject().put("uri", pin.getKey()).put("title", pin.getValue().title)
                        .put("image", pin.getValue().image));
            }
        } catch (JSONException impossible) {
            throw new IllegalStateException(impossible);
        }
        preferences.edit().putString("pins", saved.toString()).apply();
    }

    /**
     * The hook's answer, through HomeTileBridge: the rows Home's section {@code sectionId} shows, in order. Each
     * is one of {@code rows}, or, in the shortcuts section, a String[] {uri, title, image} for a pin Spotify left
     * out, which the bridge makes a tile of. Null keeps {@code rows}. Home's reducer calls this on whatever thread
     * emitted, so it only reads memory. Field names and the call site are checked against the stock DEX before
     * patching.
     */
    public static List<Object> plan(String sectionId, ArrayList<?> rows) {
        if (rows == null || rows.size() > MAX_SHORTCUTS) return null;
        String[] links = new String[rows.size()];
        String[] ids = new String[rows.size()];
        String[] titles = new String[rows.size()];
        try {
            for (int i = 0; i < rows.size(); i++) {
                Object row = rows.get(i);
                if (row == null || !row.getClass().getName().equals("p.goz0")) return null;
                Object tile = row.getClass().getField("a").get(row);
                if (tile == null || !tile.getClass().getName().equals("p.nnz0")) return null;
                links[i] = key((String) tile.getClass().getField("a").get(tile));
                ids[i] = key((String) tile.getClass().getField("d").get(tile));
                titles[i] = (String) tile.getClass().getField("b").get(tile);
            }
        } catch (ReflectiveOperationException | ClassCastException | SecurityException changedNativeModel) {
            return null;
        }
        // Spotify's own test for a shortcuts section, Lp/tve1;->t, looks for this in the id too.
        return arrange(sectionId != null && sectionId.contains("shortcuts"), rows, links, ids, titles);
    }

    /**
     * {@code rows} in {@link #captureAndOrder}'s order. With {@code shortcuts}, a pin that no row stands for gets a
     * tile in its place among the pins, unless a row already opens its uri (the grid keys rows by link) or its title
     * is unknown. Then the list is cut to Spotify's length, or the pins' if longer, and never past Spotify's cap.
     * With {@link #onlyPins}, it's cut to the pins' rows instead, unless none is placed, so the grid never empties.
     * A row that opens a pin but stands for an entity no pin names then moves into that pin's place, so it stays.
     */
    private static synchronized List<Object> arrange(
            boolean shortcuts, List<?> rows, String[] links, String[] ids, String[] titles) {
        List<Object> result = new ArrayList<>(rows.size());
        for (int index : captureAndOrder(ids, titles)) result.add(rows.get(index));
        if (!shortcuts) return result;
        List<String> keys = Arrays.asList(links);
        List<String> entities = Arrays.asList(ids);
        boolean placed = false; // whether a pin has a row of its own, or gets a tile below
        for (Map.Entry<String, Pin> pin : pins.entrySet()) {
            placed |= entities.contains(pin.getKey()) || (pin.getValue().title != null && !keys.contains(pin.getKey()));
        }
        boolean pinsAlone = onlyPins && placed;
        int place = 0; // the pins' rows lead, in pin order, so this walks through them
        for (Map.Entry<String, Pin> pin : pins.entrySet()) {
            int shown = Collections.frequency(entities, pin.getKey());
            int opens = keys.indexOf(pin.getKey());
            Pin saved = pin.getValue();
            if (shown == 0 && opens < 0 && saved.title != null) {
                // Spotify's renderers call Uri.parse on the image, which throws on null.
                result.add(place++, new String[] {pin.getKey(), saved.title, saved.image == null ? "" : saved.image});
            } else if (shown == 0 && opens >= 0 && pinsAlone && !pins.containsKey(ids[opens])) {
                // That row is among Spotify's unpinned ones, which the cut drops.
                Object row = rows.get(opens);
                if (result.remove(row)) result.add(place++, row);
            }
            place += shown;
        }
        int limit = Math.min(MAX_TILES, pinsAlone ? place : Math.max(rows.size(), place));
        return result.size() > limit ? new ArrayList<>(result.subList(0, limit)) : result;
    }

    static synchronized int[] captureAndOrder(String[] ids, String[] titles) {
        int[] result = new int[ids.length];
        if (preferences == null) {
            for (int i = 0; i < ids.length; i++) result[i] = i;
            return result;
        }
        String[] keys = new String[ids.length];
        for (int i = 0; i < ids.length; i++) keys[i] = key(ids[i]);
        observed.clear();
        for (int i = 0; i < keys.length; i++) {
            if (validId(keys[i])) observed.put(keys[i], label(titles[i], keys[i]));
        }
        int cursor = 0;
        for (String pin : pins.keySet()) {
            for (int i = 0; i < keys.length; i++) if (pin.equals(keys[i])) result[cursor++] = i;
        }
        for (int i = 0; i < keys.length; i++) if (!pins.containsKey(keys[i])) result[cursor++] = i;
        return result;
    }

    /**
     * Liked Songs has four uris, and the pins, Home's tiles and the library all name it by
     * {@link Library#LIKED_SONGS}, so it's one choice and a pin finds Home's tile whichever uri each
     * uses. Any other uri, or null, stays as it is.
     */
    private static String key(String uri) {
        return Library.isLikedSongs(uri) ? Library.LIKED_SONGS : uri;
    }

    private static boolean validId(String id) {
        return id != null && id.startsWith("spotify:") && id.length() > 8 && id.length() <= 2048
                && id.indexOf('\n') < 0 && id.indexOf('\r') < 0;
    }

    private static String label(String title, String id) {
        return title == null || title.trim().isEmpty() ? id : title;
    }
}
