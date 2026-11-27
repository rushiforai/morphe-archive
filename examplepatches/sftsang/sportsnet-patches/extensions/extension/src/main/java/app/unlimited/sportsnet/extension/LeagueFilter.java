package app.unlimited.sportsnet.extension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Keeps the Scores and Watch tabs to the leagues you follow. With leagues to show, a score group
 * is kept only for those leagues, and a Watch tab item, rail or schedule entry is hidden when it
 * names other leagues but none of yours; items that name no league stay. Leagues to hide are
 * always hidden. Names match as whole words, so hiding "MLS" does not hide "Gentlemen's Club".
 */
@SuppressWarnings("unused")
public final class LeagueFilter {
    /** Fields that can name the league of a Watch tab item, a rail or a schedule entry. */
    private static final String[] TEXT_FIELDS = {
            "label", "title", "contextualTitle", "showTitle", "seriesName",
            "categories", "genres", "sports", "customFields", "groupLabel",
    };
    /** Fields that hold a nested object worth checking, such as a score group's league. */
    private static final String[] NESTED_FIELDS = {
            "eventTypeFragment", "onGroupedLeagues", "onNonGroupedLeagues", "item",
    };
    /** Leagues and events Sportsnet covers, recognised in Watch tab items when leagues to show are set. */
    private static final String[] KNOWN_LEAGUES = {
            "NHL", "PWHL", "AHL", "CHL", "OHL", "WHL", "QMJHL", "IIHF", "World Juniors", "4 Nations",
            "NBA", "WNBA", "G League", "NCAA", "MLB", "Blue Jays", "NFL", "CFL", "Grey Cup", "Super Bowl",
            "MLS", "NWSL", "CPL", "Premier League", "EPL", "Champions League", "Europa League",
            "Bundesliga", "Serie A", "La Liga", "Ligue 1", "FIFA", "World Cup", "UEFA", "Concacaf",
            "ATP", "WTA", "Tennis", "Golf", "PGA", "LPGA", "LIV", "UFC", "MMA", "Boxing", "WWE", "AEW",
            "F1", "Formula 1", "NASCAR", "IndyCar", "Curling", "Grand Slam of Curling", "Brier",
            "Scotties", "Olympics", "Rugby", "Cricket", "Lacrosse", "NLL", "Figure Skating",
    };
    /** Score groups that are not a league, such as your favourite teams, and always stay. */
    private static final Set<String> KEEP_GROUPS = new HashSet<>(Arrays.asList(
            "my teams", "favourites", "favorites", "my favourites", "my favorites"));
    /** Labels that mean one of the leagues you can choose, such as Tennis for the ATP and WTA. */
    private static final String[][] ALIASES = {
            {"Tennis", "ATP"}, {"Tennis", "WTA"},
    };

    private static Pattern pattern;
    private static boolean configured;
    private static final Set<String> shown = new HashSet<>();
    private static final Set<String> hidden = new HashSet<>();
    private static final Map<List<?>, List<?>> filtered = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<String, Field> fields = new HashMap<>();
    private static int logged;

    private LeagueFilter() {
    }

    /** Replaced by the patch with the leagues to show, such as "NHL,ATP,WTA". */
    private static String shownLeagues() {
        return "";
    }

    /** Replaced by the patch with the leagues to hide, such as "MLS,WNBA". */
    private static String hiddenLeagues() {
        return "";
    }

    private static List<String> split(String value) {
        List<String> names = new ArrayList<>();
        for (String name : value.split(",")) {
            if (!name.trim().isEmpty()) names.add(name.trim());
        }
        return names;
    }

    private static String key(String league) {
        return league.toLowerCase(Locale.ROOT);
    }

    private static synchronized boolean configure() {
        if (!configured) {
            configured = true;
            Set<String> names = new LinkedHashSet<>();
            for (String name : split(shownLeagues())) {
                shown.add(key(name));
                names.add(name);
            }
            for (String[] alias : ALIASES) {
                if (shown.contains(key(alias[1]))) shown.add(key(alias[0]));
            }
            for (String name : split(hiddenLeagues())) {
                hidden.add(key(name));
                names.add(name);
            }
            if (!shown.isEmpty()) names.addAll(Arrays.asList(KNOWN_LEAGUES));
            if (!names.isEmpty()) {
                StringBuilder alternatives = new StringBuilder();
                for (String name : names) {
                    if (alternatives.length() > 0) alternatives.append('|');
                    alternatives.append(Pattern.quote(name));
                }
                pattern = Pattern.compile("(?<![\\p{L}\\p{N}])(" + alternatives + ")(?![\\p{L}\\p{N}])",
                        Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
                Logger.info("Leagues shown: " + shown + ", hidden: " + hidden);
            }
        }
        return pattern != null;
    }

    /** Called with a list the app is about to show; returns it without the leagues you do not follow. */
    public static List<?> filter(List<?> list) {
        if (list == null || list.isEmpty() || !configure()) return list;
        List<?> cached = filtered.get(list);
        if (cached != null) return cached;
        List<Object> result = new ArrayList<>(list.size());
        for (Object item : list) {
            String reason = hideReason(item);
            if (reason == null) {
                result.add(item);
            } else if (logged++ < 80) {
                Logger.info("Hiding " + item.getClass().getSimpleName() + ": " + reason);
            }
        }
        List<?> value = result.size() == list.size() ? list : result;
        filtered.put(list, value);
        return value;
    }

    /** Why [item] is hidden, or null to keep it. */
    private static String hideReason(Object item) {
        Set<String> mentions = new LinkedHashSet<>();
        collect(item, 0, mentions);
        for (String mention : mentions) {
            if (hidden.contains(key(mention))) return "hidden " + mention;
        }
        if (shown.isEmpty()) return null;
        boolean scoreGroup = read(item, "eventTypeFragment") != null;
        for (String mention : mentions) {
            if (shown.contains(key(mention))) return null;
        }
        if (scoreGroup) {
            String label = leagueLabel(item);
            // Your favourite teams' games are grouped under a label of their own; keep them.
            if (KEEP_GROUPS.contains(key(label))) return null;
            return "score group " + label;
        }
        return mentions.isEmpty() ? null : "only " + mentions;
    }

    private static String leagueLabel(Object scoreGroup) {
        Object fragment = read(scoreGroup, "eventTypeFragment");
        for (String name : new String[]{"onNonGroupedLeagues", "onGroupedLeagues"}) {
            Object leagues = fragment == null ? null : read(fragment, name);
            Object label = leagues == null ? null : read(leagues, "label");
            if (label != null) return String.valueOf(label);
        }
        return "(no label)";
    }

    private static void collect(Object object, int depth, Set<String> mentions) {
        if (object == null || depth > 3) return;
        for (String name : TEXT_FIELDS) collectText(read(object, name), mentions);
        for (String name : NESTED_FIELDS) collect(read(object, name), depth + 1, mentions);
    }

    private static void collectText(Object value, Set<String> mentions) {
        if (value == null) return;
        if (value instanceof CharSequence) {
            Matcher matcher = pattern.matcher((CharSequence) value);
            while (matcher.find()) mentions.add(matcher.group(1));
        } else if (value instanceof Map) {
            collectText(((Map<?, ?>) value).values(), mentions);
        } else if (value instanceof Collection) {
            for (Object element : (Collection<?>) value) {
                collectText(element instanceof CharSequence || element instanceof Collection
                        || element instanceof Map ? element : String.valueOf(element), mentions);
            }
        } else if (value instanceof Enum) {
            collectText(((Enum<?>) value).name(), mentions);
        }
    }

    private static Object read(Object object, String name) {
        Class<?> type = object.getClass();
        String key = type.getName() + '#' + name;
        Field field;
        synchronized (fields) {
            if (fields.containsKey(key)) {
                field = fields.get(key);
            } else {
                field = find(type, name);
                fields.put(key, field);
            }
        }
        if (field == null) return null;
        try {
            return field.get(object);
        } catch (Exception e) {
            return null;
        }
    }

    private static Field find(Class<?> type, String name) {
        for (Class<?> current = type; current != null && current != Object.class; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
                // Look in the superclass.
            }
        }
        return null;
    }
}
