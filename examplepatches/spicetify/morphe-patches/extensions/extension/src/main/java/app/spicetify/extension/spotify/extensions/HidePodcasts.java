package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Hide podcasts, the Android version of the desktop extension {@code hidePodcasts.js}: the filters behind
 * the extensions patch's hooks P1 to P6 on Home, Search and the Your Library chips.
 * <p>
 * While the extension is off, and on any {@code Throwable}, a filter gives Spotify back what it was
 * given: a section or search result is kept, and a list comes back as it was. A filter that drops
 * something returns a new list, because protobuf lists are frozen after parsing and throw on any change.
 * <p>
 * The hooks run on Spotify's own threads, some for every Home section or search result, so the filters
 * only read the switch, the audiobook option and the objects they're given, and look each field up once
 * per class. Home and Search objects are protobuf messages, read through the field names protobuf-lite
 * needs at runtime, which R8 kept. The chips are obfuscated classes, which the patch pins with class
 * digests.
 */
public final class HidePodcasts {
    /** "Also hide audiobooks", in SharedPreferences {@code "spicetify_extensions"}: on until turned off, as on desktop. */
    private static final String HIDE_AUDIOBOOKS = "hide_audiobooks";
    /** The app's own podcast prefixes ({@code Lp/c4c;->R}) and its show scheme, which audiobooks share. */
    private static final String[] PODCAST_PREFIXES =
            {"spotify:show:", "spotify:episode:", "spotify:podcast-chapter:", "spotify:clip:"};
    /**
     * What a Home section's items hang from: the section's oneof, a member's {@code item_}, {@code items_}
     * or {@code itemSource_}, an ItemSource's oneof, PreviewPromotionCarouselItem's {@code content_} and
     * TopStoryCarousel's {@code stories_}. Never {@code heading_}: a heading's link isn't an item.
     */
    private static final Set<String> HOME_PATH = new HashSet<>(Arrays.asList(
            "featureType_", "item_", "items_", "itemSource_", "source_", "content_", "stories_"));
    // The status line counts each hook's drops apart, so a device check shows which ones work.
    private static final String HOME_SECTIONS = "Home sections";
    private static final String HOME_ITEMS = "Home items";
    private static final String HOME_CHIPS = "Home chips";
    private static final String SEARCH_RESULTS = "Search results";
    private static final String SEARCH_CHIPS = "Search chips";
    private static final String LIBRARY_CHIPS = "Library chips";
    private static final Tally TALLY = new Tally();
    /**
     * Fields looked up once per class: reflection builds a new Field on every lookup, and these hooks run
     * per section and result. A race between two threads only repeats a lookup.
     */
    private static final Map<Class<?>, Field[]> WALKED = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Map<String, Field>> READ = new ConcurrentHashMap<>();

    private HidePodcasts() {}

    /** Whether {@code uri} is a show's, an episode's, a podcast chapter's or a clip's. Audiobooks have show URIs too. */
    static boolean isPodcastUri(String uri) {
        if (uri == null) return false;
        for (String prefix : PODCAST_PREFIXES) {
            if (uri.startsWith(prefix)) return true;
        }
        return false;
    }

    /**
     * P1, {@code Lp/mz1;->g0}: whether to drop a Home {@code Section} before Spotify maps it. True when
     * its items have at least one URI and all of them are podcasts', and, with audiobooks hidden, for the
     * audiobook InlineCard (case 34), which has no items.
     */
    public static boolean hideHomeSection(Object section) {
        try {
            Context context = on();
            if (context == null) return false;
            boolean hide = (int) read(section, "featureTypeCase_") == 34 && audiobooksHidden(context)
                    || onlyPodcasts(section);
            if (hide) countHidden(HOME_SECTIONS, 1);
            return hide;
        } catch (Throwable e) {
            failed(HOME_SECTIONS, e);
            return false;
        }
    }

    /** P2, {@code Provided.getItemsList()}: an item-source shelf's items, without the podcasts. */
    public static List<?> filterHomeItems(List<?> items) {
        try {
            if (on() == null) return items;
            return without(items, HOME_ITEMS, item -> isPodcastUri((String) read(item, "identifier_")));
        } catch (Throwable e) {
            failed(HOME_ITEMS, e);
            return items;
        }
    }

    /** P3, {@code Lp/xqw;->a}: Home's chips without Podcasts, its Following chip and, with audiobooks hidden, Audiobooks. */
    public static List<?> filterHomeChips(List<?> chips) {
        try {
            Context context = on();
            if (context == null) return chips;
            boolean audiobooks = audiobooksHidden(context);
            return without(chips, HOME_CHIPS, chip -> {
                Object id = chip.getClass().getField("a").get(chip); // Lp/ztx;->a, the server's chip id
                return "podcasts-chip".equals(id) || "podcasts-following-chip".equals(id)
                        || audiobooks && "audiobooks-chip".equals(id);
            });
        } catch (Throwable e) {
            failed(HOME_CHIPS, e);
            return chips;
        }
    }

    /**
     * P4, {@code Lp/bzw0;->b}: whether to drop a search result before Spotify maps it. Shows, episodes and
     * chapters go by their type, audiobooks only while hidden, a section when everything in it goes, and
     * anything else by its URI. The URI never decides an audiobook, since it's a show URI too.
     */
    public static boolean hideSearchEntity(Object entity) {
        try {
            Context context = on();
            if (context == null) return false;
            boolean hide = hidden(entity, audiobooksHidden(context));
            if (hide) countHidden(SEARCH_RESULTS, 1);
            return hide;
        } catch (Throwable e) {
            failed(SEARCH_RESULTS, e);
            return false;
        }
    }

    /** P5, {@code Lp/ipy;-><init>}: Search's filter chips without Podcasts and, with audiobooks hidden, Audiobooks. */
    public static ArrayList<?> filterSearchChips(ArrayList<?> chips) {
        try {
            Context context = on();
            if (context == null) return chips;
            boolean audiobooks = audiobooksHidden(context);
            return (ArrayList<?>) without(chips, SEARCH_CHIPS, chip -> {
                Object type = chip.getClass().getField("b").get(chip); // Lp/gpy;->b, an Lp/fpy;
                if (type == null) return false;
                String kind = type.getClass().getName();
                if (kind.equals("p.cpy")) return type.getClass().getField("a").getInt(type) == 2; // PODCAST_AND_EPISODES
                return audiobooks && kind.equals("p.dpy") && type.getClass().getField("a").getInt(type) == 3; // AUDIOBOOK
            });
        } catch (Throwable e) {
            failed(SEARCH_CHIPS, e);
            return chips;
        }
    }

    /**
     * P6, in {@code Lp/b90;->invoke}: the Your Library chips that {@code Lp/k770;->a} built, without
     * Podcasts and, with audiobooks hidden, Books and Authors. Downloaded podcasts and books are children
     * of the Downloaded chip, out of reach.
     */
    public static List<?> filterLibraryChips(List<?> chips) {
        try {
            Context context = on();
            if (context == null) return chips;
            boolean audiobooks = audiobooksHidden(context);
            return without(chips, LIBRARY_CHIPS, chip -> {
                Object id = chip.getClass().getMethod("getId").invoke(chip); // Lp/j770;->getId(), a kept name
                return "podcasts".equals(id) || audiobooks && ("books".equals(id) || "authors".equals(id));
            });
        } catch (Throwable e) {
            failed(LIBRARY_CHIPS, e);
            return chips;
        }
    }

    /** Counts {@code hidden} more items on {@code surface} in Hide podcasts' status. */
    private static void countHidden(String surface, int hidden) {
        synchronized (TALLY) {
            Extensions.status(Extensions.HIDE_PODCASTS, TALLY.hid(surface, hidden));
        }
    }

    /** Logs why a filter gave Spotify its input back, and counts it in the status. */
    private static void failed(String surface, Throwable e) {
        try {
            Throwable cause = e instanceof InvocationTargetException && e.getCause() != null ? e.getCause() : e;
            Log.w("Spicetify", "Hide podcasts couldn't filter " + surface, cause);
            synchronized (TALLY) {
                Extensions.status(Extensions.HIDE_PODCASTS, TALLY.failed(surface + ": " + cause));
            }
        } catch (Throwable ignored) {
            // Nothing more to do: the filter has already given Spotify its input back.
        }
    }

    /** The application context while Hide podcasts is on, else null. */
    private static Context on() {
        Context context = Extensions.appContext();
        return context != null && Extensions.isOn(context, Extensions.HIDE_PODCASTS) ? context : null;
    }

    /** Whether "Also hide audiobooks" is on: true until it's turned off, as on desktop. */
    public static boolean audiobooksHidden(Context context) {
        return Extensions.preferences(context).getBoolean(HIDE_AUDIOBOOKS, true);
    }

    /** Saves "Also hide audiobooks"; each filter reads it on its next call. */
    public static void setAudiobooksHidden(Context context, boolean hidden) {
        Extensions.preferences(context).edit().putBoolean(HIDE_AUDIOBOOKS, hidden).apply();
    }

    /** Whether the Home items under {@code section} have at least one URI, and only podcast URIs. */
    private static boolean onlyPodcasts(Object section) throws IllegalAccessException {
        List<String> uris = new ArrayList<>();
        collectIdentifiers(section, uris);
        for (String uri : uris) {
            if (!isPodcastUri(uri)) return false;
        }
        return !uris.isEmpty();
    }

    /**
     * Adds each {@code identifier_} under {@code node}, a message, a list of messages or null, following
     * only {@link #HOME_PATH}. Primitive fields are skipped, since ImageLink has an int {@code source_}.
     */
    private static void collectIdentifiers(Object node, List<String> uris) throws IllegalAccessException {
        if (node instanceof List) {
            for (Object element : (List<?>) node) collectIdentifiers(element, uris);
            return;
        }
        if (node == null) return;
        for (Field field : walked(node.getClass())) {
            Object value = field.get(node);
            if (field.getName().equals("identifier_")) uris.add((String) value); else collectIdentifiers(value, uris);
        }
    }

    /** {@code type}'s fields the walk follows: {@code identifier_} and {@link #HOME_PATH}, never a primitive. */
    private static Field[] walked(Class<?> type) {
        Field[] fields = WALKED.get(type);
        if (fields != null) return fields;
        List<Field> followed = new ArrayList<>();
        for (Field field : type.getDeclaredFields()) {
            String name = field.getName();
            if (field.getType().isPrimitive() || !name.equals("identifier_") && !HOME_PATH.contains(name)) continue;
            field.setAccessible(true);
            followed.add(field);
        }
        fields = followed.toArray(new Field[0]);
        WALKED.put(type, fields);
        return fields;
    }

    /** P4's rule for {@code entity}, a searchview {@code Entity}, by its {@code entityCase_} (the field numbers). */
    private static boolean hidden(Object entity, boolean audiobooks) throws ReflectiveOperationException {
        if (entity == null) return false;
        switch ((int) read(entity, "entityCase_")) {
            case 9: // audioShow
            case 10: // audioEpisode
            case 23: // podcastChapter
                return true;
            case 13: // audiobook
                return audiobooks;
            case 14: // section
                List<?> items = (List<?>) read(read(entity, "entity_"), "items_");
                for (Object item : items) {
                    // SectionItem's oneof: 2 GenericItem and 4 InstantMixItem hold an Entity; the others don't.
                    int kind = (int) read(item, "itemCase_");
                    if (kind != 2 && kind != 4 || !hidden(read(read(item, "item_"), "entity_"), audiobooks)) return false;
                }
                return !items.isEmpty();
            default:
                return isPodcastUri((String) read(entity, "uri_"));
        }
    }

    /** What a filter drops. It may throw, and then the filter gives Spotify its input back. */
    private interface Drop {
        boolean test(Object element) throws Exception;
    }

    /**
     * {@code list} without the elements {@code drop} matches, counted on {@code surface}: a new list, or
     * {@code list} itself when nothing matched. {@code list} never changes.
     */
    private static List<?> without(List<?> list, String surface, Drop drop) throws Exception {
        ArrayList<Object> kept = null; // made at the first drop, so a list that loses nothing costs nothing
        int index = 0;
        for (Object element : list) {
            if (drop.test(element)) {
                if (kept == null) kept = new ArrayList<>(list.subList(0, index));
            } else if (kept != null) {
                kept.add(element);
            }
            index++;
        }
        if (kept == null) return list;
        countHidden(surface, list.size() - kept.size());
        return kept;
    }

    /**
     * {@code target}'s own field {@code name}, looked up once per class. Protobuf-lite's fields are private.
     * A field that isn't there throws {@link NoSuchFieldException} on every call: nothing is cached for it.
     */
    private static Object read(Object target, String name) throws ReflectiveOperationException {
        Map<String, Field> fields = READ.computeIfAbsent(target.getClass(), type -> new ConcurrentHashMap<>());
        Field field = fields.get(name);
        if (field == null) {
            field = target.getClass().getDeclaredField(name);
            field.setAccessible(true);
            fields.put(name, field);
        }
        return field.get(target);
    }

    /** What the filters hid on each surface, and how often they failed and where last: Hide podcasts' status. */
    static final class Tally {
        private final Map<String, Integer> hidden = new LinkedHashMap<>();
        private int total;
        private int failures;
        private String lastFailure;

        /** Counts {@code count} more items hidden on {@code surface}, and returns the new line. */
        String hid(String surface, int count) {
            hidden.merge(surface, count, Integer::sum);
            total += count;
            return line();
        }

        /** Counts one more failure, {@code where} being its surface and cause, and returns the new line. */
        String failed(String where) {
            failures++;
            lastFailure = where;
            return line();
        }

        private String line() {
            StringBuilder line = new StringBuilder("Hid ").append(total).append(total == 1 ? " item" : " items");
            String separator = " (";
            for (Map.Entry<String, Integer> surface : hidden.entrySet()) {
                line.append(separator).append(surface.getKey()).append(' ').append(surface.getValue());
                separator = ", ";
            }
            if (!hidden.isEmpty()) line.append(')');
            if (failures > 0) {
                line.append("; ").append(failures).append(failures == 1 ? " failure" : " failures")
                        .append(", the last on ").append(lastFailure);
            }
            return line.toString();
        }
    }
}
