/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import androidx.annotation.Nullable;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;

/**
 * Which tiles of Facebook's Menu a person keeps out (#153). A tile is a bookmark of the list the
 * Menu draws its shortcuts from, and {@link MenuShortcuts#kept} takes the picked ones out of that
 * list before Facebook splits off the rows above See more, so the next tile moves up.
 *
 * <p>A tile is named by where it goes, never by the label it wears, so a translated Menu still
 * matches: its key is the first word of the bookmark's deep link, {@code marketplace} for
 * {@code fb://marketplace_tab} and for {@code https://www.facebook.com/marketplace/}. A link to a
 * route that opens many screens keys by the screen it names instead, and a tile with no link,
 * whose server sends the route, by Facebook's id for what it bookmarks, {@code app_204127677323356}
 * for 584's Finds ({@link #appKey}). A key the list doesn't know is carried like any other, so a
 * newer Facebook's tile survives a settings file.
 *
 * <p>The rows of the Help and support and the Settings and privacy groups ride on the same list
 * ({@link MenuRows}). They have no deep link to key on, so each is keyed by its group and the id
 * Facebook gives the row ({@link #rowKey}), {@code help_1188...} or {@code settings_...}. Our own
 * rows have negative ids and never get a key, so the Hushfacebook settings row always stays.
 *
 * <p>The hooks write down each tile and row the Menu shows, by key and by the name Facebook gives
 * it, so the list offers this person's own tiles in Facebook's words. Before the Menu has been
 * opened the list offers the catalog.
 */
public final class MenuTiles {
    private MenuTiles() {
    }

    /** The bookmark's GraphQL link field, keyed the way the tree keys its fields. */
    static final int URL = "url".hashCode();

    /** The bookmark's GraphQL node field: the app, group or Page it opens, keyed the same way. */
    static final int BOOKMARKED_NODE = "bookmarked_node".hashCode();

    /** A node's GraphQL id field, keyed the same way. */
    static final int ID = "id".hashCode();

    /**
     * The key of 584's Finds tile, which has no link: Facebook's id for the Finds app, as its
     * bookmark named it on 2026-10-23 ({@link #appKey}).
     */
    static final String FINDS = "app_204127677323356";

    /** Facebook's id for an app, group or Page: digits, never a leading zero, short enough for a long. */
    private static final Pattern APP_ID = Pattern.compile("[1-9][0-9]{0,18}");

    /**
     * The longest the saved list gets, in chars, room for every tile in the catalog and every
     * Help and Settings row many times over, and little enough that a settings file holding it
     * beside the other lists still fits.
     */
    public static final int MAX_HIDDEN_CHARS = 1024;

    /** At most this many tiles and rows are written down, about a full Menu twice over. */
    static final int SEEN_LIMIT = 96;

    /** The group prefixes of a row's key, in the order the list offers them after the tiles. */
    static final String HELP = "help";
    static final String SETTINGS = "settings";

    /** A row's key: its group, an underscore and Facebook's id for the row. */
    private static final Pattern ROW_KEY = Pattern.compile("(help|settings)_[1-9][0-9]{0,18}");

    /** A written-down name is cut to this many chars. */
    static final int NAME_CHARS = 48;

    /** A key: lowercase words, digits and underscores, as a deep link's first word is. */
    private static final Pattern KEY = Pattern.compile("[a-z][a-z0-9_]{0,63}");

    /** One part of a screen id that can go in a key. A class name, with capitals, can't. */
    private static final Pattern SCREEN_PART = Pattern.compile("[a-z0-9_]+");

    /**
     * The tiles the list offers before the Menu has been opened, by key, in the order 583's Menu
     * shows them. Feeds opens {@code fb://recent_feed}, Reels {@code fb://watch}, Dating
     * {@code fbinternal://gemstone} and Birthdays the Bloks screen
     * {@code com.bloks.www.meta.birthday_center}.
     */
    static final List<String> CATALOG = Collections.unmodifiableList(Arrays.asList(
            "recent_feed", "marketplace", "watch", "groups", "meta_birthday_center", "saved", "memories_home",
            "gemstone", "gaming", "events", "friends", "pages", "fundraisers", "jobs"));

    /** The tiles written down so far, read once, so a Menu that shows nothing new writes nothing. */
    @Nullable
    private static volatile Map<String, String> seen;

    /**
     * What the list calls [key]: the name Facebook gave the tile on this phone, else the tile's
     * usual name, or the key read out in words. A row's name follows its group's, and a row never
     * seen on this phone shows its id.
     */
    public static String label(String key) {
        String name = seen().get(key);
        if (isRowKey(key)) {
            String row = name != null ? name : key.substring(key.indexOf('_') + 1);
            return key.startsWith(HELP + "_")
                    ? L10n.f("Help and support: %s", row)
                    : L10n.f("Settings and privacy: %s", row);
        }
        if (name != null) return name;
        switch (key) {
            case "recent_feed": return L10n.t("Feeds");
            case "marketplace": return L10n.t("Marketplace");
            case "watch": return L10n.t("Reels");
            case "groups": return L10n.t("Groups");
            case "meta_birthday_center": return L10n.t("Birthdays");
            case "saved": return L10n.t("Saved");
            case "memories_home": return L10n.t("Memories");
            case "gemstone": return L10n.t("Dating");
            case "gaming": return L10n.t("Gaming");
            case "events": return L10n.t("Events");
            case "friends": return L10n.t("Friends");
            case "pages": return L10n.t("Pages");
            case "fundraisers": return L10n.t("Fundraisers");
            case "jobs": return L10n.t("Jobs");
            case FINDS: return L10n.t("Finds");
            default:
                String words = key.replace('_', ' ');
                return Character.toUpperCase(words.charAt(0)) + words.substring(1);
        }
    }

    /**
     * The key of the tile whose deep link is [link], or null for no link or one with no word to
     * key on. The scheme, a Facebook host and a leading slash are dropped, then the first word up
     * to a slash, question mark, hash or ampersand, and a trailing {@code _tab}. A route that opens
     * many screens keys by the screen its link names ({@link #screenKey}).
     */
    @Nullable
    public static String keyOf(@Nullable String link) {
        if (link == null) return null;
        String rest = link.trim();
        int scheme = rest.indexOf("://");
        if (scheme < 0) return null;
        boolean web = rest.regionMatches(true, 0, "http", 0, 4);
        rest = rest.substring(scheme + 3);
        if (web) {
            int slash = rest.indexOf('/');
            if (slash < 0) return null;
            String host = rest.substring(0, slash).toLowerCase(Locale.ROOT);
            if (!host.equals("facebook.com") && !host.endsWith(".facebook.com")) return null;
            rest = rest.substring(slash + 1);
        }
        String route = firstWord(rest);
        String param = route == null ? null : screenParam(route);
        if (param == null) return route;
        String screen = queryValue(rest, param);
        return screen == null ? null : screenKey(screen);
    }

    /**
     * The key of a tile whose bookmark has no link and opens what it bookmarks by a route its
     * server sends, by Facebook's id [id] for that app, group or Page: 584's Finds is one
     * ({@link #FINDS}). Null for no id or one that isn't Facebook's.
     */
    @Nullable
    public static String appKey(@Nullable String id) {
        if (id == null) return null;
        String digits = id.trim();
        return APP_ID.matcher(digits).matches() ? "app_" + digits : null;
    }

    /** [path]'s first word, lowercase, without a trailing {@code _tab}, or null when it isn't a key. */
    @Nullable
    private static String firstWord(String path) {
        String rest = path.toLowerCase(Locale.ROOT);
        while (rest.startsWith("/")) rest = rest.substring(1);
        int end = rest.length();
        for (char stop : new char[] {'/', '?', '#', '&'}) {
            int at = rest.indexOf(stop);
            if (at >= 0 && at < end) end = at;
        }
        String key = rest.substring(0, end);
        if (key.endsWith("_tab")) key = key.substring(0, key.length() - 4);
        return KEY.matcher(key).matches() ? key : null;
    }

    /**
     * The query value that names the screen behind [route], for a route that opens many screens,
     * or null for any other. 583's Birthdays is {@code fb://bloks_screen/?bloks_screen_id=...},
     * Crisis response and Community Notes {@code fb://bloks_screen_query/?app_id=...}, and Pages
     * {@code fb://nt_screen/FB-SCREEN-FB?p=/pages/...}: keyed by the route, each would hide the rest.
     */
    @Nullable
    private static String screenParam(String route) {
        switch (route) {
            case "bloks_screen": return "bloks_screen_id";
            case "bloks_screen_query": return "app_id";
            case "nt_screen": return "p";
            default: return null;
        }
    }

    /** The decoded value of [name] in the query of [rest], or null when it has none. */
    @Nullable
    private static String queryValue(String rest, String name) {
        int query = rest.indexOf('?');
        if (query < 0) return null;
        int hash = rest.indexOf('#', query);
        String pairs = rest.substring(query + 1, hash < 0 ? rest.length() : hash);
        for (String pair : pairs.split("&")) {
            int equals = pair.indexOf('=');
            if (equals <= 0 || !pair.substring(0, equals).equals(name)) continue;
            try {
                return URLDecoder.decode(pair.substring(equals + 1), "UTF-8");
            } catch (UnsupportedEncodingException | IllegalArgumentException badValue) {
                return null;
            }
        }
        return null;
    }

    /**
     * The key of a screen: a path's first word, {@code pages} for {@code /pages/nt_launchpoint/},
     * or a Bloks id's lowercase parts after {@code com.bloks.www}, {@code meta_birthday_center}
     * for {@code com.bloks.www.meta.birthday_center}. A class name in the id is left out.
     */
    @Nullable
    private static String screenKey(String screen) {
        if (screen.startsWith("/")) return firstWord(screen);
        StringBuilder key = new StringBuilder();
        for (String part : screen.split("\\.")) {
            if (part.equals("com") || part.equals("bloks") || part.equals("www")) continue;
            if (!SCREEN_PART.matcher(part).matches()) continue;
            if (key.length() > 0) key.append('_');
            key.append(part);
        }
        return KEY.matcher(key).matches() ? key.toString() : null;
    }

    /**
     * The key 0.15.0's list stored for a tile that its Menu link never had, as the tile's key:
     * Feeds, Reels, Memories, Birthdays and Dating were guessed (#153). A list saved then hides
     * what was ticked.
     */
    static String current(String key) {
        switch (key) {
            case "feeds": return "recent_feed";
            case "reels": return "watch";
            case "memories": return "memories_home";
            case "birthdays": return "meta_birthday_center";
            case "dating": return "gemstone";
            default: return key;
        }
    }

    private static Set<String> current(Set<String> keys) {
        Set<String> tiles = new LinkedHashSet<>();
        for (String key : keys) tiles.add(current(key));
        return tiles;
    }

    /** The keys picked to keep out, as saved. */
    public static Set<String> hidden() {
        return current(parse(Settings.HIDDEN_MENU_TILES.savedValue()));
    }

    /** The keys the live setting holds, which the hook reads. */
    static Set<String> hiddenNow() {
        return current(parse(Settings.HIDDEN_MENU_TILES.get()));
    }

    /**
     * The key of the row Facebook gave [id] in [group] ({@link #HELP} or {@link #SETTINGS}), or
     * null for an id that isn't one of Facebook's: ours are negative.
     */
    @Nullable
    static String rowKey(String group, long id) {
        if (id <= 0) return null;
        String key = group + "_" + id;
        return ROW_KEY.matcher(key).matches() ? key : null;
    }

    /** Whether [key] names a Help and support or Settings and privacy row rather than a tile. */
    static boolean isRowKey(String key) {
        return ROW_KEY.matcher(key).matches();
    }

    /** Where [key] goes in the list: tiles first, then Help and support rows, then Settings and privacy's. */
    private static int place(String key) {
        if (!isRowKey(key)) return 0;
        return key.startsWith(HELP + "_") ? 1 : 2;
    }

    /**
     * The tiles and rows the list offers: the ones the Menu has shown, or the catalog before it
     * has, then any picked earlier that those don't name, tiles first, then Help and support's
     * rows, then Settings and privacy's, each in the order the Menu showed them.
     */
    public static List<String> choices() {
        Set<String> all = new LinkedHashSet<>(seen().keySet());
        boolean tileSeen = false;
        for (String key : all) tileSeen |= !isRowKey(key);
        if (!tileSeen) all.addAll(CATALOG);
        all.addAll(hidden());
        List<String> ordered = new ArrayList<>(all);
        // A stable sort, so each part keeps the Menu's order.
        Collections.sort(ordered, (one, other) -> Integer.compare(place(one), place(other)));
        return ordered;
    }

    /**
     * Writes down [shown], each tile's key with the name the Menu gave it, in the Menu's order:
     * tiles it hadn't yet, up to {@link #SEEN_LIMIT}, and a new name for one it had.
     */
    static void remember(Map<String, String> shown) {
        Map<String, String> known = seen();
        Map<String, String> grown = null;
        for (Map.Entry<String, String> tile : shown.entrySet()) {
            String key = tile.getKey();
            String name = cleanName(tile.getValue());
            Map<String, String> current = grown != null ? grown : known;
            if (name == null || name.equals(current.get(key))) continue;
            if (!current.containsKey(key) && current.size() >= SEEN_LIMIT) continue;
            if (grown == null) grown = new LinkedHashMap<>(known);
            grown.put(key, name);
        }
        if (grown == null) return;
        seen = Collections.unmodifiableMap(grown);
        Settings.SEEN_MENU_TILES.save(joinSeen(grown));
    }

    /** The tiles written down, by key, in the order the Menu showed them. */
    static Map<String, String> seen() {
        Map<String, String> known = seen;
        if (known == null) {
            known = Collections.unmodifiableMap(parseSeen(Settings.SEEN_MENU_TILES.savedValue()));
            seen = known;
        }
        return known;
    }

    /** Forgets the cached written-down tiles, so the next read takes the setting again. Tests only. */
    static void forgetForTests() {
        seen = null;
    }

    /** [name] on one line, trimmed and cut to {@link #NAME_CHARS}, or null when nothing's left. */
    @Nullable
    static String cleanName(@Nullable String name) {
        if (name == null) return null;
        String line = name.replace('\n', ' ').replace('\r', ' ').trim();
        if (line.length() > NAME_CHARS) line = line.substring(0, NAME_CHARS).trim();
        return line.isEmpty() ? null : line;
    }

    /** The written-down tiles as the setting holds them, a {@code key=name} line each. */
    static String joinSeen(Map<String, String> tiles) {
        StringBuilder lines = new StringBuilder();
        for (Map.Entry<String, String> tile : tiles.entrySet()) {
            if (lines.length() > 0) lines.append('\n');
            lines.append(tile.getKey()).append('=').append(tile.getValue());
        }
        return lines.toString();
    }

    /** The tiles in a written-down list, in order. A line without a key and a name is dropped. */
    static Map<String, String> parseSeen(@Nullable String saved) {
        Map<String, String> tiles = new LinkedHashMap<>();
        if (saved == null) return tiles;
        for (String line : saved.split("\n")) {
            int equals = line.indexOf('=');
            if (equals <= 0 || tiles.size() >= SEEN_LIMIT) continue;
            String key = line.substring(0, equals).trim();
            String name = cleanName(line.substring(equals + 1));
            if (KEY.matcher(key).matches() && name != null) tiles.put(key, name);
        }
        return tiles;
    }

    /** What {@link #hide} did with a pick. */
    public enum Hidden {
        SAVED,
        /** The keys need more than {@link #MAX_HIDDEN_CHARS}. Nothing was saved. */
        NO_ROOM,
        /** The phone didn't keep the write. The old list stands. */
        NOT_STORED
    }

    /** Saves [keys] as the tiles to keep out, saying so when they don't fit or aren't kept. */
    public static Hidden hide(Collection<String> keys) {
        String picked = join(keys);
        String kept = clean(picked);
        if (count(kept) < count(picked)) return Hidden.NO_ROOM;
        return Settings.HIDDEN_MENU_TILES.save(kept) ? Hidden.SAVED : Hidden.NOT_STORED;
    }

    /** [saved] as the list is stored: each key once, in order, as far as {@link #MAX_HIDDEN_CHARS} reaches. */
    public static String clean(@Nullable String saved) {
        StringBuilder list = new StringBuilder();
        for (String key : parse(saved)) {
            int length = list.length() == 0 ? key.length() : list.length() + 1 + key.length();
            if (length > MAX_HIDDEN_CHARS) break;
            if (list.length() > 0) list.append(',');
            list.append(key);
        }
        return list.toString();
    }

    /** Whether [list] is a list exactly as {@link #clean} stores it. */
    public static boolean isClean(@Nullable String list) {
        return list != null && list.equals(clean(list));
    }

    /** How many keys [list] names. */
    public static int count(@Nullable String list) {
        return parse(list).size();
    }

    static String join(Collection<String> keys) {
        return String.join(",", keys);
    }

    /** The keys in [list], each once, in order; anything that isn't a key is dropped. */
    static Set<String> parse(@Nullable String list) {
        Set<String> keys = new LinkedHashSet<>();
        if (list == null) return keys;
        for (String part : list.split(",")) {
            String key = part.trim();
            if (KEY.matcher(key).matches()) keys.add(key);
        }
        return keys;
    }
}
