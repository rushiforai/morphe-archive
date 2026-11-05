package app.template.extension.sofascore;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hide countries" (Patch settings list {@code sofascore.hidden_countries}): drops what belongs to
 * the picked countries from the leagues list, the date feed's country rows, the Live tab, the
 * chronological view and search.
 *
 * <p>These are also the hooks of "Hide competitions" ({@code sofascore.hidden_competitions}, keys
 * and checks in CompetitionFilter): both patches share the hook sites, and each hook runs the list of
 * every patch that is in ({@link #patched()}, CompetitionFilter.patched()). Competitions are also
 * dropped from an expanded country of the date feed (the category's scheduled events) and from a
 * country's competitions in Leagues.
 *
 * <p>The key of a Sofascore category is its {@code alpha2} code (Sofascore's own codes, e.g. EN
 * England, SX Scotland, WA Wales, NX Northern Ireland, XK Kosovo). Categories without one (World,
 * Europe, International, tennis tours, ...) are keyed {@code "slug:" + slug}, so they can be hidden
 * as their own entries. Favourites are not exempt: a hidden country wins.
 *
 * <p>Every hook returns its argument unchanged while nothing is picked, and on any failure (stock
 * behaviour, the feature shows as failed). The models are kotlinx-serialization classes whose names
 * and getters R8 keeps; they are read through reflection by getter name (the patch checks the
 * names exist). The hooks never change the app's objects: they build new lists and responses.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class CountryFilter {
    static final String LIST_ID = "sofascore.hidden_countries";
    private static final String TAG = "Morphe-Sofascore";
    private static final String SLUG_PREFIX = "slug:";

    private static final String EVENT_LIST_RESPONSE = "com.sofascore.model.newNetwork.EventListResponse";

    private static final ConcurrentHashMap<String, Method> methods = new ConcurrentHashMap<>();
    private static volatile Constructor<?> eventListConstructor;
    private static volatile boolean seeded;
    /** The baked country list, code to the country's own name; empty until init() ran. */
    private static volatile Map<String, String> seedLabels = Collections.emptyMap();

    /** At most this many remembered team countries (an id and a short key each). */
    private static final int MAX_TEAMS = 4096;
    /**
     * Team id to the key of the team's country, from every team the hooks see while something is
     * hidden. Search payloads carry a player's team without its category or country, so a player is
     * matched through this map. Bounded, oldest entries go first.
     */
    private static final Map<Integer, String> teamKeys = new LinkedHashMap<Integer, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Integer, String> eldest) {
            return size() > MAX_TEAMS;
        }
    };

    private CountryFilter() {
    }

    // ---------------------------------------------------------------------------------------
    // Picker options
    // ---------------------------------------------------------------------------------------

    /**
     * Whether "Hide countries" is patched in. The patch rewrites this to return true; while it is
     * false the hooks skip countries (only "Hide competitions" is patched).
     */
    public static boolean patched() {
        return false;
    }

    /**
     * The app's own country list, "code TAB name" lines. The patch rewrites this method to return
     * the list it read from the app at patch time; the source version is empty.
     */
    public static String seeds() {
        return "";
    }

    /**
     * Patched in before every return of ReleaseApp.onCreate (and called by the hooks if they run
     * first): offers the app's countries in the picker, with their flags (CountryIcons), and
     * registers the competition logos (CompetitionFilter.init).
     */
    public static void init() {
        if (seeded) return;
        seeded = true;
        try {
            CompetitionFilter.init();
        } catch (Throwable failure) {
            Log.w(TAG, "Competition icons not registered: " + failure.getClass().getName());
        }
        try {
            // The picker's flags (never saved, never used for filtering).
            HevalSettings.setOptionIconProvider(LIST_ID, CountryIcons.INSTANCE);
            String encoded = seeds();
            if (encoded == null || encoded.isEmpty()) return;
            Map<String, String> options = new HashMap<>(512);
            for (String line : encoded.split("\n")) {
                int tab = line.indexOf('\t');
                if (tab > 0 && tab < line.length() - 1) options.put(line.substring(0, tab), line.substring(tab + 1));
            }
            seedLabels = Collections.unmodifiableMap(options);
            HevalSettings.registerOptions(LIST_ID, options);
        } catch (Throwable failure) {
            Log.w(TAG, "Country seeds not registered: " + failure.getClass().getName());
        }
    }

    // ---------------------------------------------------------------------------------------
    // Hooks
    // ---------------------------------------------------------------------------------------

    /**
     * SportCategoriesResponse.getCategories (List of Category): the leagues list of a sport. Reports
     * every category to the picker. Never empty: if every category would be hidden, the full list
     * stays.
     */
    public static List filterCategories(List categories) {
        if (categories == null || categories.isEmpty() || !patched()) return categories;
        try {
            Set<String> hidden = HevalSettings.getHidden(LIST_ID);
            Object[] all = categories.toArray();
            List<Object> kept = new ArrayList<>(all.length);
            for (Object category : all) {
                if (!hiddenCategory(category, hidden)) kept.add(category);
            }
            if (kept.size() == all.length || kept.isEmpty()) return categories;
            return kept;
        } catch (Throwable failure) {
            fail(failure);
            return categories;
        }
    }

    /**
     * CategoriesForDateResponse.getCategories (List of CategoryWrapper): the date feed's country
     * rows. A row also goes when every competition it lists ({@code uniqueTournamentIds}, all
     * timezones) is a hidden competition; a row without that list stays.
     */
    public static List filterCategoryWrappers(List wrappers) {
        if (wrappers == null || wrappers.isEmpty()) return wrappers;
        try {
            boolean countries = patched();
            Set<String> hidden = countries ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
            Set<String> competitions = CompetitionFilter.hidden();
            if (!countries && competitions.isEmpty()) return wrappers;
            Object[] all = wrappers.toArray();
            List<Object> kept = new ArrayList<>(all.length);
            for (Object wrapper : all) {
                if (wrapper != null) {
                    if (countries && hiddenCategory(call(wrapper, "getCategory"), hidden)) continue;
                    if (CompetitionFilter.allHidden(call(wrapper, "getUniqueTournamentIds"), competitions)) continue;
                }
                kept.add(wrapper);
            }
            return kept.size() == all.length ? wrappers : kept;
        } catch (Throwable failure) {
            fail(failure);
            return wrappers;
        }
    }

    /**
     * SearchResponse.getResults (List of SearchEntity): drops events, competitions, teams and
     * players of hidden countries. Managers, referees, venues, sports and stages stay.
     *
     * <p>A player's team comes without its category or country in search payloads (emulator
     * 2026-11-03: Saka, Rice and Odegaard stayed with England hidden), so while something is hidden
     * a first pass remembers the country of every team in the results (and of the teams of event
     * results), and a player is matched by his team's id. A player whose team is unknown stays.
     *
     * <p>Hidden competitions: competition results and events of a hidden competition go; every
     * competition in the results is offered in the picker.
     */
    public static List filterSearchResults(List results) {
        if (results == null || results.isEmpty()) return results;
        try {
            boolean countries = patched();
            boolean competitions = CompetitionFilter.patched();
            if (!countries && !competitions) return results;
            Set<String> hidden = countries ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
            Set<String> hiddenCompetitions = CompetitionFilter.hidden();
            Object[] all = results.toArray();
            if (!hidden.isEmpty()) {
                for (Object result : all) rememberSearchTeams(result);
            }
            List<Object> kept = new ArrayList<>(all.length);
            for (Object result : all) {
                if (countries && (hiddenCategory(searchCategory(result), hidden) || hiddenPlayer(result, hidden))) continue;
                if (competitions && hiddenSearchCompetition(result, hiddenCompetitions)) continue;
                kept.add(result);
            }
            return kept.size() == all.length ? results : kept;
        } catch (Throwable failure) {
            fail(failure);
            return results;
        }
    }

    /**
     * The result of NetworkCoroutineAPI.sportLiveEvents (Live tab) and getIndexedEventsPage (the
     * chronological view), at the return of the request lambda. Anything that is not an
     * EventListResponse (the coroutine's suspend marker, null) passes through; otherwise a new
     * EventListResponse without the events of hidden countries and hidden competitions is returned
     * when any is hidden. These lists hold hundreds of competitions a day, so they offer only the
     * picked competitions in the picker (see CompetitionFilter).
     */
    public static Object filterEventList(Object response) {
        return filterEvents(response, false);
    }

    /**
     * The result of NetworkCoroutineAPI.categoryScheduledEvents: the matches of an expanded country
     * in the date feed. Filtered like {@link #filterEventList}, and every competition in it is
     * offered in the competitions picker.
     */
    public static Object filterCategoryEvents(Object response) {
        return filterEvents(response, true);
    }

    /**
     * UniqueTournamentGroupResponse.getUniqueTournaments (List of UniqueTournament): a country's
     * competitions in Leagues (one list per group; tennis has several) and the league pickers built
     * from the same request. Drops hidden competitions and offers every one in the picker. May
     * return an empty list: the app skips an empty group and shows an empty country.
     */
    public static List filterUniqueTournaments(List uniqueTournaments) {
        if (uniqueTournaments == null || uniqueTournaments.isEmpty() || !CompetitionFilter.patched()) {
            return uniqueTournaments;
        }
        try {
            Set<String> hidden = CompetitionFilter.hidden();
            Object[] all = uniqueTournaments.toArray();
            List<Object> kept = new ArrayList<>(all.length);
            for (Object uniqueTournament : all) {
                if (!CompetitionFilter.hiddenUniqueTournament(uniqueTournament, null, hidden, true)) kept.add(uniqueTournament);
            }
            return kept.size() == all.length ? uniqueTournaments : kept;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(CompetitionFilter.LIST_ID, failure);
            return uniqueTournaments;
        }
    }

    /** filterEventList and filterCategoryEvents; {@code report}: offer every competition seen. */
    private static Object filterEvents(Object response, boolean report) {
        if (response == null || !EVENT_LIST_RESPONSE.equals(response.getClass().getName())) return response;
        try {
            boolean countries = patched();
            boolean competitions = CompetitionFilter.patched();
            if (!countries && !competitions) return response;
            Object events = call(response, "getEvents");
            if (!(events instanceof List) || ((List) events).isEmpty()) return response;
            Set<String> hidden = countries ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
            Set<String> hiddenCompetitions = CompetitionFilter.hidden();
            Object[] all = ((List) events).toArray();
            if (!hidden.isEmpty()) {
                // For search: the players of these teams.
                for (Object event : all) rememberEventTeams(event);
            }
            List<Object> kept = new ArrayList<>(all.length);
            for (Object event : all) {
                if (countries && hiddenCategory(eventCategory(event), hidden)) continue;
                if (competitions && CompetitionFilter.hiddenEvent(event, hiddenCompetitions, report)) continue;
                kept.add(event);
            }
            if (kept.size() == all.length) return response;
            Constructor<?> constructor = eventListConstructor;
            if (constructor == null || constructor.getDeclaringClass() != response.getClass()) {
                constructor = response.getClass().getConstructor(List.class);
                eventListConstructor = constructor;
            }
            return constructor.newInstance(kept);
        } catch (Throwable failure) {
            fail(failure);
            return response;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Keys
    // ---------------------------------------------------------------------------------------

    /**
     * Reports {@code category} to the picker; true when its key is picked. A key of the baked
     * country list is reported with the country's name: Sofascore's "X Amateur" categories share
     * the country's alpha2 (England Amateur is EN too), and as the picker lets a seen label win,
     * the date feed's "England Amateur" used to replace "England" (emulator 2026-11-03). Reporting
     * the country's name also repairs a label saved that way.
     */
    private static boolean hiddenCategory(Object category, Set<String> hidden) throws Exception {
        if (category == null || !patched()) return false;
        String key = key(category);
        if (key == null) return false;
        String label = seedLabel(key);
        if (label == null) {
            Object name = call(category, "getName");
            label = name instanceof String ? (String) name : key;
        }
        HevalSettings.reportOptionsSeen(LIST_ID, key, label);
        return hidden.contains(key);
    }

    /** The baked country name of {@code key}, or null. */
    private static String seedLabel(String key) {
        if (!seeded) init();
        return seedLabels.get(key);
    }

    // ---------------------------------------------------------------------------------------
    // Team countries (players in search)
    // ---------------------------------------------------------------------------------------

    /** Remembers the teams of a search result: a team, or an event's home and away team. */
    private static void rememberSearchTeams(Object result) {
        try {
            if (result == null) return;
            Object type = call(result, "getType");
            Object entity = call(result, "getEntity");
            if (entity == null) return;
            if ("team".equals(type)) rememberTeam(entity, null);
            else if ("event".equals(type)) rememberEventTeams(entity);
        } catch (Throwable ignored) {
            // Only a hint for the player pass.
        }
    }

    /**
     * Remembers an event's home and away team, by their own country, else by the tournament's
     * category when it is a country (an alpha2 key; never World, Europe, ... which hold clubs of
     * every country). The tournament's country never replaces a team's own.
     */
    private static void rememberEventTeams(Object event) {
        try {
            if (event == null) return;
            Object category = eventCategory(event);
            String fallback = category == null ? null : key(category);
            if (fallback != null && fallback.startsWith(SLUG_PREFIX)) fallback = null;
            rememberTeam(call(event, "getHomeTeam"), fallback);
            rememberTeam(call(event, "getAwayTeam"), fallback);
        } catch (Throwable ignored) {
            // Only a hint for the player pass.
        }
    }

    /** teamKeys[team id] = the team's own country key, else {@code fallback} if none is known yet. */
    private static void rememberTeam(Object team, String fallback) throws Exception {
        if (team == null) return;
        Integer id = teamId(team);
        if (id == null) return;
        Object country = teamCountry(team);
        String own = country == null ? null : key(country);
        synchronized (teamKeys) {
            if (own != null) teamKeys.put(id, own);
            else if (fallback != null && !teamKeys.containsKey(id)) teamKeys.put(id, fallback);
        }
    }

    /** Whether {@code result} is a player whose team is remembered with a hidden country. */
    private static boolean hiddenPlayer(Object result, Set<String> hidden) throws Exception {
        if (hidden.isEmpty() || result == null || !"player".equals(call(result, "getType"))) return false;
        Object player = call(result, "getEntity");
        Object team = player == null ? null : call(player, "getTeam");
        Integer id = team == null ? null : teamId(team);
        if (id == null) return false;
        String key;
        synchronized (teamKeys) {
            key = teamKeys.get(id);
        }
        return key != null && hidden.contains(key);
    }

    /** Team.getId(), or null for a team without an id. */
    private static Integer teamId(Object team) throws Exception {
        Object id = call(team, "getId");
        return id instanceof Integer && (Integer) id != 0 ? (Integer) id : null;
    }

    /** The category's alpha2 code, else "slug:" + its slug, else null. */
    static String key(Object category) throws Exception {
        Object alpha2 = call(category, "getAlpha2");
        if (alpha2 instanceof String && !((String) alpha2).isEmpty()) return (String) alpha2;
        Object slug = call(category, "getSlug");
        if (slug instanceof String && !((String) slug).isEmpty()) return SLUG_PREFIX + slug;
        return null;
    }

    private static Object eventCategory(Object event) throws Exception {
        if (event == null) return null;
        Object tournament = call(event, "getTournament");
        return tournament == null ? null : call(tournament, "getCategory");
    }

    /** The category a search result belongs to, or null when it is not filtered. */
    private static Object searchCategory(Object result) throws Exception {
        if (result == null) return null;
        Object type = call(result, "getType");
        Object entity = call(result, "getEntity");
        if (!(type instanceof String) || entity == null) return null;
        switch ((String) type) {
            case "event":
                return eventCategory(entity);
            case "uniqueTournament":
            case "uniqueStage":
                return call(entity, "getCategory");
            case "team":
                return teamCountry(entity);
            case "player": {
                Object team = call(entity, "getTeam");
                return team == null ? null : teamCountry(team);
            }
            default:
                return null;
        }
    }

    /** Whether a search result is a hidden competition or an event of one; offers competitions. */
    private static boolean hiddenSearchCompetition(Object result, Set<String> hidden) throws Exception {
        if (result == null) return false;
        Object type = call(result, "getType");
        Object entity = call(result, "getEntity");
        if (entity == null) return false;
        if ("uniqueTournament".equals(type)) return CompetitionFilter.hiddenUniqueTournament(entity, null, hidden, true);
        if ("event".equals(type)) return CompetitionFilter.hiddenEvent(entity, hidden, true);
        return false;
    }

    /**
     * A team's category, or its country when search results carry no category (seen on the
     * emulator 2026-11-03: Arsenal stayed in search with England hidden). Country has the same
     * getAlpha2/getSlug/getName getters, so key() and the picker treat it like a category.
     */
    private static Object teamCountry(Object team) throws Exception {
        Object category = call(team, "getCategory");
        if (category != null && key(category) != null) return category;
        try {
            return call(team, "getCountry");
        } catch (NoSuchMethodException missing) {
            return category;
        }
    }

    /** {@code target.<name>()}, a public no-argument getter, cached per class. */
    static Object call(Object target, String name) throws Exception {
        Class<?> type = target.getClass();
        String id = type.getName() + '#' + name;
        Method method = methods.get(id);
        if (method == null) {
            method = type.getMethod(name);
            methods.put(id, method);
        }
        return method.invoke(target);
    }

    /** Marks the list of every patch that is in as failed (the hooks are shared). */
    private static void fail(Throwable failure) {
        if (patched()) HevalSettings.reportFailure(LIST_ID, failure);
        if (CompetitionFilter.patched()) HevalSettings.reportFailure(CompetitionFilter.LIST_ID, failure);
    }
}
