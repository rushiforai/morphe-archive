package semicoloncolonel.mobilestream.extension.siriusxm;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * SiriusXM "Hide content": removes the channels, shows, podcasts, and episodes
 * that belong to, or feature, the people the user listed. The patch passes
 * every JSON string the app decodes through {@link #filter}.
 *
 * SiriusXM's catalog has no host or guest fields for talk content, so a
 * person is recognized from the text:
 *
 * - A channel, show, podcast, or person page whose title contains the name
 *   is theirs, and so is every episode of that show.
 * - A music channel that lists the name in its "talent you'll hear" lineup
 *   plays them.
 * - Anywhere else (episode titles, descriptions, rows), the name counts only
 *   in a role: "with Name", "featuring Name", "guest Name", "hosted by
 *   Name", "Name joins", "Name | Episode title", and similar. An episode
 *   that only talks about someone stays.
 *
 * With "Also hide mentions" on, any mention of a name hides the item.
 *
 * The list starts as the patch options, which the patch writes into
 * {@link #terms} and {@link #hideMentions}. Once the user saves a list in
 * {@link HiddenNamesActivity}, the saved list is used instead.
 */
@SuppressWarnings("unused")
public final class ContentFilter {
    private static final String TAG = "MSP-SXM";
    private static final String PREFS = "msp_siriusxm_hidden_names";
    private static final String KEY_NAMES = "names";
    private static final String KEY_MENTIONS = "hide_mentions";

    /** Items whose own title names their host, artist, or subject person. */
    private static final Set<String> OWNED_TYPES = new HashSet<>(Arrays.asList(
            "channel-linear", "channel-xtra", "show", "show-podcast", "talent", "artist-station"));

    // Words that put a person on an episode, before or after their name. The
    // text they are matched in is lowercase, with "&" turned into "and",
    // sentence ends turned into ".", and other punctuation, apart from
    // , : | -, turned into spaces. A bare "with" counts in titles, as in
    // "Comedy Chat with Name". In descriptions it counts only at the start
    // of a clause, since prose uses it for other things ("breaks ranks with").
    private static final String GUEST = "featuring|feat|ft|guest|guests|special guest|joined by|hosted by|"
            + "host|hosts|co host|cohost|starring|presented by|interview with|interviews|interviewing|"
            + "sits down with|sit down with|talk with|talks with|talking with|talks to|speaks with|"
            + "chat with|chats with|chatting with|catches up with|conversation with|in conversation with|"
            + "that play|that plays";
    private static final String TITLE_BEFORE = "with|w|" + GUEST;
    private static final String DESCRIPTION_BEFORE = "(?:^|[,:|-] ?)with|w|" + GUEST;
    // Verbs that mean the person is on the episode. Reporting verbs such as
    // "discusses" or "reacts" are left out: another show uses them when it
    // talks about someone.
    private static final String AFTER = "joins|joined|returns|is back|stops by|drops by|sits down|in studio";
    // Up to three other short names before this one, as in "with Ana, Bo Li and Name".
    private static final String OTHERS = "(?:[a-z0-9]+(?: [a-z0-9]+){0,2} ?(?:,|and) ?){0,3}";

    private static volatile Settings settings;

    private static final class Settings {
        final String[] names;
        final Pattern[] titleRoles;
        final Pattern[] descriptionRoles;
        final boolean mentions;

        Settings(String[] names, Pattern[] titleRoles, Pattern[] descriptionRoles, boolean mentions) {
            this.names = names;
            this.titleRoles = titleRoles;
            this.descriptionRoles = descriptionRoles;
            this.mentions = mentions;
        }
    }

    private ContentFilter() {
    }

    /** Replaced by the patch with the comma-separated list from its options. */
    private static String terms() {
        return "";
    }

    /** Replaced by the patch: true when its Also hide mentions option is on. */
    private static boolean hideMentions() {
        return false;
    }

    public static String filter(String json) {
        if (json == null || json.length() < 2) return json;
        char first = firstChar(json);
        if (first != '{' && first != '[') return json;
        Settings current = settings();
        if (current.names.length == 0) return json;
        if (!containsName(normalize(json), current)) return json;
        try {
            Object root = new JSONTokener(json).nextValue();
            int[] removed = {0};
            walk(root, current, removed);
            if (removed[0] == 0) return json;
            Log.i(TAG, "Hid " + removed[0] + " item(s)");
            return root.toString();
        } catch (Throwable t) {
            return json;
        }
    }

    // ── Saved list ────────────────────────────────────────────────────────────

    /** The list to show in the editor, one name per line. */
    static String savedNames(Context context) {
        SharedPreferences prefs = prefs(context);
        if (prefs.contains(KEY_NAMES)) return prefs.getString(KEY_NAMES, "");
        StringBuilder lines = new StringBuilder();
        for (String part : terms().split(",")) {
            String name = part.trim();
            if (name.isEmpty()) continue;
            if (lines.length() > 0) lines.append('\n');
            lines.append(name);
        }
        return lines.toString();
    }

    static boolean savedHideMentions(Context context) {
        SharedPreferences prefs = prefs(context);
        return prefs.contains(KEY_MENTIONS) ? prefs.getBoolean(KEY_MENTIONS, false) : hideMentions();
    }

    static void save(Context context, String names, boolean hideMentions) {
        // commit, not apply: the editor restarts the app right after saving.
        prefs(context).edit()
                .putString(KEY_NAMES, names.trim())
                .putBoolean(KEY_MENTIONS, hideMentions)
                .commit();
        settings = null;
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Settings settings() {
        Settings current = settings;
        if (current != null) return current;
        Application app = application();
        String raw = app != null ? savedNames(app) : terms();
        boolean mentions = app != null ? savedHideMentions(app) : hideMentions();
        List<String> names = new ArrayList<>();
        List<Pattern> titleRoles = new ArrayList<>();
        List<Pattern> descriptionRoles = new ArrayList<>();
        for (String part : raw.split("[,\\n]")) {
            String name = normalize(part).trim();
            if (name.isEmpty()) continue;
            names.add(" " + name + " ");
            titleRoles.add(rolePattern(name, TITLE_BEFORE));
            descriptionRoles.add(rolePattern(name, DESCRIPTION_BEFORE));
        }
        current = new Settings(names.toArray(new String[0]), titleRoles.toArray(new Pattern[0]),
                descriptionRoles.toArray(new Pattern[0]), mentions);
        // Before the app object exists, the patch's list is used without
        // caching it, so the saved list takes over once it can be read.
        if (app != null) settings = current;
        return current;
    }

    private static Pattern rolePattern(String name, String before) {
        String quoted = Pattern.quote(name);
        return Pattern.compile(
                // "with Name", "featuring Ana and Name", "joined by Name"
                "(?<![a-z0-9])(?:" + before + ") " + OTHERS + quoted + "(?![a-z0-9])"
                        // "Name joins", "Name stops by"
                        + "|(?<![a-z0-9])" + quoted + " (?:" + AFTER + ")(?![a-z0-9])"
                        // "Name: Title", "Name | Title", "Name - Title"
                        + "|^" + quoted + " ?[:|-]"
                        // "Title | Name", "#455 - Name"
                        + "|[|-] ?" + quoted + "$");
    }

    private static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    // ── Matching ──────────────────────────────────────────────────────────────

    private static void walk(Object node, Settings current, int[] removed) throws Exception {
        if (node instanceof JSONObject) {
            JSONObject object = (JSONObject) node;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) walk(object.get(keys.next()), current, removed);
        } else if (node instanceof JSONArray) {
            JSONArray array = (JSONArray) node;
            for (int i = array.length() - 1; i >= 0; i--) {
                Object item = array.get(i);
                if (item instanceof JSONObject && matches((JSONObject) item, current)) {
                    array.remove(i);
                    removed[0]++;
                } else {
                    walk(item, current, removed);
                }
            }
        }
    }

    /**
     * True when a catalog item (a channel, show, episode, person, or row)
     * belongs to or features one of the names. Catalog items carry an
     * "entity" or "texts" object. The live now-playing data does not, so the
     * channels keep their on-air details.
     */
    private static boolean matches(JSONObject item, Settings current) {
        JSONObject entity = item.optJSONObject("entity");
        JSONObject texts = entity != null ? entity.optJSONObject("texts") : item.optJSONObject("texts");
        if (texts == null) return false;
        String type = entity != null ? entity.optString("type") : "";

        List<String> titles = strings(texts.opt("title"));
        List<String> descriptions = strings(texts.opt("description"));
        List<String> shows = new ArrayList<>();
        JSONObject related = texts.optJSONObject("related");
        if (related != null) {
            JSONObject show = related.optJSONObject("show");
            if (show != null) shows.addAll(strings(show.opt("title")));
        }
        List<String> lineup = new ArrayList<>();
        JSONObject decorations = item.optJSONObject("decorations");
        if (decorations != null) collectLists(decorations, lineup);

        if (current.mentions) {
            List<String> all = new ArrayList<>();
            collectAll(item, all);
            return anyContains(all, current);
        }
        if (OWNED_TYPES.contains(type) && anyContains(titles, current)) return true;
        if (anyContains(shows, current)) return true;
        if (anyContains(lineup, current)) return true;
        return anyRole(titles, current.titleRoles) || anyRole(descriptions, current.descriptionRoles);
    }

    private static boolean anyContains(List<String> texts, Settings current) {
        for (String text : texts) {
            if (containsName(normalize(text), current)) return true;
        }
        return false;
    }

    private static boolean containsName(String normalized, Settings current) {
        for (String name : current.names) {
            if (normalized.contains(name)) return true;
        }
        return false;
    }

    private static boolean anyRole(List<String> texts, Pattern[] roles) {
        for (String text : texts) {
            String light = punctuated(text);
            for (Pattern role : roles) {
                if (role.matcher(light).find()) return true;
            }
        }
        return false;
    }

    /** The strings of a text object such as {"default": ..., "long": ...}, or a plain string. */
    private static List<String> strings(Object value) {
        List<String> out = new ArrayList<>();
        if (value instanceof String) {
            out.add((String) value);
        } else if (value instanceof JSONObject) {
            JSONObject object = (JSONObject) value;
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) {
                Object part = object.opt(keys.next());
                if (part instanceof String) out.add((String) part);
            }
        }
        return out;
    }

    /** The plain strings of every list in an object, such as "talent you'll hear". */
    private static void collectLists(JSONObject object, List<String> out) {
        Iterator<String> keys = object.keys();
        while (keys.hasNext()) {
            Object value = object.opt(keys.next());
            if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                for (int i = 0; i < array.length(); i++) {
                    if (array.opt(i) instanceof String) out.add((String) array.opt(i));
                }
            } else if (value instanceof JSONObject) {
                collectLists((JSONObject) value, out);
            }
        }
    }

    /**
     * Every string of the item outside its own lists of other items, for
     * Also hide mentions. Lists of plain strings, such as a lineup, count.
     */
    private static void collectAll(JSONObject object, List<String> out) {
        Iterator<String> keys = object.keys();
        while (keys.hasNext()) {
            Object value = object.opt(keys.next());
            if (value instanceof String) {
                out.add((String) value);
            } else if (value instanceof JSONObject) {
                collectAll((JSONObject) value, out);
            } else if (value instanceof JSONArray) {
                JSONArray array = (JSONArray) value;
                for (int i = 0; i < array.length(); i++) {
                    if (array.opt(i) instanceof String) out.add((String) array.opt(i));
                }
            }
        }
    }

    // ── Text ──────────────────────────────────────────────────────────────────

    /**
     * Lowercase, accents removed, every run of other characters turned into
     * one space, with a space at each end, so "Comedy Central" matches
     * "Best of Comedy Central" and "comedy-central" but not "ComedyCentral".
     */
    static String normalize(String text) {
        String decomposed = Normalizer.normalize(text, Normalizer.Form.NFD).toLowerCase(Locale.ROOT);
        StringBuilder out = new StringBuilder(decomposed.length() + 2).append(' ');
        boolean space = true;
        for (int i = 0; i < decomposed.length(); i++) {
            char c = decomposed.charAt(i);
            if (Character.getType(c) == Character.NON_SPACING_MARK) continue;
            if (Character.isLetterOrDigit(c)) {
                out.append(c);
                space = false;
            } else if (!space) {
                out.append(' ');
                space = true;
            }
        }
        if (!space) out.append(' ');
        return out.toString();
    }

    /**
     * Like {@link #normalize}, but keeps the punctuation that separates
     * names and titles (, : | -) and sentence ends (as "."), turns "&" into
     * "and", drops HTML tags, and has no padding spaces.
     */
    static String punctuated(String text) {
        String plain = text.replaceAll("<[^>]*>", " ").replace("&amp;", "&").replace('–', '-').replace('—', '-');
        String decomposed = Normalizer.normalize(plain, Normalizer.Form.NFD).toLowerCase(Locale.ROOT);
        StringBuilder out = new StringBuilder(decomposed.length());
        boolean space = true;
        for (int i = 0; i < decomposed.length(); i++) {
            char c = decomposed.charAt(i);
            if (Character.getType(c) == Character.NON_SPACING_MARK) continue;
            if (Character.isLetterOrDigit(c)) {
                out.append(c);
                space = false;
            } else if (c == '!' || c == '?' || c == ';' || (c == '.' && lastWordLength(out) > 4)) {
                // A sentence end, so a match cannot run from one sentence
                // into the next. A period after a short word is an
                // abbreviation ("Dr.", "ft.") and is a space.
                if (!space) out.append(' ');
                out.append(". ");
                space = true;
            } else if (c == '-' && i > 0 && i + 1 < decomposed.length()
                    && Character.isLetterOrDigit(decomposed.charAt(i - 1))
                    && Character.isLetterOrDigit(decomposed.charAt(i + 1))) {
                // A hyphen inside a word, as in "co-host", is a space.
                out.append(' ');
                space = true;
            } else if (c == ',' || c == ':' || c == '|' || c == '-') {
                if (!space) out.append(' ');
                out.append(c).append(' ');
                space = true;
            } else if (c == '&') {
                if (!space) out.append(' ');
                out.append("and ");
                space = true;
            } else if (!space) {
                out.append(' ');
                space = true;
            }
        }
        return out.toString().replaceAll(" +", " ").replaceAll(" ([,:|.-])", "$1").trim();
    }

    private static int lastWordLength(StringBuilder text) {
        int length = 0;
        for (int i = text.length() - 1; i >= 0 && Character.isLetterOrDigit(text.charAt(i)); i--) length++;
        return length;
    }

    private static char firstChar(String text) {
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (!Character.isWhitespace(c)) return c;
        }
        return 0;
    }
}
