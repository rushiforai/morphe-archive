package app.template.extension.fotmob;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import app.template.extension.hevalcontrols.AppContext;
import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hide countries" (Patch settings list {@code fotmob.hidden_countries}): drops the leagues of the
 * picked countries from the match lists, the leagues list and search. Keys are FotMob's league
 * country codes (FIFA three-letter codes; "INT" national-team competitions, "INT-2" club
 * competitions). Favourite leagues, and matches of favourite teams, always stay.
 *
 * <p>These are also the hooks of "Hide competitions" ({@code fotmob.hidden_competitions}, keys and
 * checks in CompetitionFilter): both patches share the hook sites, and each hook runs the list of
 * every patch that is in ({@link #patched()}, CompetitionFilter.patched()). A league goes when its
 * country or its competition is picked; favourites win over both.
 *
 * <p>Every hook returns its argument unchanged while nothing is picked, and on any failure (stock
 * behaviour, the feature shows as failed). FotMob's models keep their field names (Gson and
 * kotlinx models; their methods are R8-renamed), so they are read by field name through
 * reflection. The hooks never change the app's objects: they build new lists and holders.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class CountryFilter {
    static final String LIST_ID = "fotmob.hidden_countries";
    private static final String TAG = "Morphe-FotMob";

    private static final String LIVE_MATCHES = "com.fotmob.models.LiveMatches";
    private static final String LEAGUE_MATCHES = "com.fotmob.models.LeagueMatches";
    private static final String LEAGUE = "com.fotmob.models.League";
    private static final String MATCH = "com.fotmob.models.Match";
    private static final String TEAM = "com.fotmob.models.Team";
    private static final String SEARCH = "com.fotmob.models.search.";

    /** League.FAVORITE_LEAGUE_ID and the pseudo codes League uses for favourites and staff picks. */
    private static final int FAVOURITE_LEAGUE_ID = -99;

    private static volatile Context context;
    private static final ConcurrentHashMap<String, Field> fields = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<String, Constructor<?>> constructors = new ConcurrentHashMap<>();

    private CountryFilter() {
    }

    /**
     * Whether "Hide countries" is patched in. The patch rewrites this to return true; while it is
     * false the hooks skip countries (only "Hide competitions" is patched).
     */
    public static boolean patched() {
        return false;
    }

    /**
     * From ActivityHooks.register (FotMobApp.onCreate): the country picker's list and flags, and the
     * competition picker's logos and seeds (CompetitionFilter.init), for the patches that are in.
     */
    public static void init(Application application) {
        try {
            if (application != null) context = application.getApplicationContext();
            if (patched()) {
                HevalSettings.registerOptions(LIST_ID, CountrySeeds.NAMES);
                // The picker's flags (never saved, never used for filtering).
                HevalSettings.setOptionIconProvider(LIST_ID, CountryIcons.INSTANCE);
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Country seeds not registered: " + failure.getClass().getName());
        }
        try {
            CompetitionFilter.init(context);
        } catch (Throwable failure) {
            Log.w(TAG, "Competition seeds not registered: " + failure.getClass().getName());
        }
    }

    /** The picked countries right now; empty when "Hide countries" is not patched in. */
    private static Set<String> countries() {
        return patched() ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
    }

    // ---------------------------------------------------------------------------------------
    // Hook 1: match lists (LiveMatchesAndLeagueRank.<init>, the LiveMatches it stores)
    // ---------------------------------------------------------------------------------------

    /** A new LiveMatches without the hidden leagues; the cached original stays untouched. */
    public static Object filterLiveMatches(Object liveMatches) {
        if (liveMatches == null) return null;
        Set<String> hidden = countries();
        Set<String> competitions = CompetitionFilter.hidden();
        if (hidden.isEmpty() && competitions.isEmpty()) return liveMatches;
        try {
            List leagues = (List) field(LIVE_MATCHES, "leagueMatches").get(liveMatches);
            if (leagues == null || leagues.isEmpty()) return liveMatches;
            Context app = context();
            CountryData.Favourites favourites = CountryData.favourites(app);
            List<Object> kept = new ArrayList<>(leagues.size());
            boolean changed = false;
            for (Object leagueMatches : leagues.toArray()) {
                Object result = filterLeagueMatches(app, leagueMatches, hidden, competitions, favourites);
                if (result != leagueMatches) changed = true;
                if (result != null) kept.add(result);
            }
            if (!changed) return liveMatches;
            return constructor(LIVE_MATCHES, List.class).newInstance(kept);
        } catch (Throwable failure) {
            fail(failure);
            return liveMatches;
        }
    }

    /** The LeagueMatches itself, null to drop it, or a copy with only the favourite teams' matches. */
    private static Object filterLeagueMatches(Context app, Object leagueMatches, Set<String> hidden,
                                              Set<String> competitions, CountryData.Favourites favourites) throws Exception {
        if (leagueMatches == null) return null;
        Object league = field(LEAGUE_MATCHES, "league").get(leagueMatches);
        if (league == null) return leagueMatches;
        String code = (String) field(LEAGUE, "CountryCode").get(league);
        int id = field(LEAGUE, "Id").getInt(league);
        int parentId = field(LEAGUE, "ParentId").getInt(league);
        CountryData.learn(id, code);
        CompetitionFilter.learnParent(id, parentId);
        boolean drop = CompetitionFilter.isHidden(competitions, id, parentId) || isHidden(app, hidden, code, id, parentId);
        if (!drop || favourites.league(id, parentId)) return leagueMatches;

        Object matches = field(LEAGUE_MATCHES, "Matches").get(leagueMatches);
        if (!(matches instanceof List)) return null;
        Object[] all = ((List) matches).toArray();
        List<Object> kept = new ArrayList<>();
        for (Object match : all) {
            if (match != null && (favourites.team(teamId(field(MATCH, "HomeTeam").get(match)))
                    || favourites.team(teamId(field(MATCH, "AwayTeam").get(match))))) {
                kept.add(match);
            }
        }
        if (kept.isEmpty()) return null;
        if (kept.size() == all.length) return leagueMatches;
        Object copy = constructor(LEAGUE_MATCHES, Collator.class).newInstance(Collator.getInstance());
        field(LEAGUE_MATCHES, "league").set(copy, league);
        field(LEAGUE_MATCHES, "sortPriority").setInt(copy, field(LEAGUE_MATCHES, "sortPriority").getInt(leagueMatches));
        field(LEAGUE_MATCHES, "Matches").set(copy, new Vector<>(kept));
        return copy;
    }

    private static int teamId(Object team) throws Exception {
        return team == null ? 0 : field(TEAM, "id").getInt(team);
    }

    // ---------------------------------------------------------------------------------------
    // Hook 2: the leagues list (LeagueConverter.convert): the Leagues tab and onboarding
    // ---------------------------------------------------------------------------------------

    /**
     * Reports every country and competition of the list to the pickers and remembers each league's
     * country, then drops the hidden ones (favourites stay). If that would leave nothing, the full
     * list stays, so the Leagues tab is never empty.
     */
    public static List filterLeagues(List leagues) {
        if (leagues == null || leagues.isEmpty()) return leagues;
        boolean reportCountries = patched();
        boolean reportCompetitions = CompetitionFilter.patched();
        if (!reportCountries && !reportCompetitions) return leagues;
        try {
            Context app = context();
            Object[] all = leagues.toArray();
            Map<Integer, String> fresh = new HashMap<>(all.length * 2);
            Map<String, String> seen = new HashMap<>();
            Map<String, String> seenCompetitions = new HashMap<>(all.length * 2);
            for (Object league : all) {
                if (league == null) continue;
                String code = (String) field(LEAGUE, "CountryCode").get(league);
                // Staff picks are copies of leagues listed under their own country too, and carry the
                // picks group's name, not their country's.
                if (code == null || code.isEmpty() || isPseudoCode(code) || field(LEAGUE, "isSuggested").getBoolean(league)) continue;
                int id = field(LEAGUE, "Id").getInt(league);
                if (id > 0) fresh.put(id, code);
                String countryName = (String) field(LEAGUE, "CountryName").get(league);
                if (!seen.containsKey(code)) {
                    String label = CountrySeeds.NAMES.get(code);
                    if (label == null) label = countryName;
                    seen.put(code, label);
                }
                String key = CompetitionFilter.key(id, field(LEAGUE, "ParentId").getInt(league));
                String label = CompetitionFilter.label(CompetitionFilter.countryLabel(code, countryName),
                        (String) field(LEAGUE, "Name").get(league));
                if (key != null && label != null) seenCompetitions.put(key, label);
            }
            CountryData.remember(app, fresh);
            if (reportCountries) HevalSettings.reportOptionsSeen(LIST_ID, seen);
            if (reportCompetitions) CompetitionFilter.reportSeen(app, seenCompetitions);

            Set<String> hidden = countries();
            Set<String> competitions = CompetitionFilter.hidden();
            if (hidden.isEmpty() && competitions.isEmpty()) return leagues;
            CountryData.Favourites favourites = CountryData.favourites(app);
            List<Object> kept = new ArrayList<>(all.length);
            for (Object league : all) {
                if (league == null) continue;
                String code = (String) field(LEAGUE, "CountryCode").get(league);
                int id = field(LEAGUE, "Id").getInt(league);
                int parentId = field(LEAGUE, "ParentId").getInt(league);
                boolean drop = CompetitionFilter.isHidden(competitions, id, parentId) || isHidden(app, hidden, code, id, parentId);
                if (!drop || favourites.league(id, parentId)) kept.add(league);
            }
            if (kept.size() == all.length || kept.isEmpty()) return leagues;
            return kept;
        } catch (Throwable failure) {
            fail(failure);
            return leagues;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Hook 3: search (the Suggestion constructors' leagueSuggestions/teamSuggestions/matchesSuggestions)
    // ---------------------------------------------------------------------------------------

    private interface Keep {
        boolean keep(Object item) throws Exception;
    }

    /**
     * List<LeagueSuggestions>: drops league hits of hidden countries (their payload's countryCode)
     * and of hidden competitions (their id); every league hit is offered in the competition picker.
     */
    public static List filterLeagueSuggestions(List groups) {
        final Set<String> hidden = countries();
        final Set<String> competitions = CompetitionFilter.hidden();
        final boolean report = CompetitionFilter.patched();
        if ((hidden.isEmpty() && competitions.isEmpty() && !report) || groups == null || groups.isEmpty()) return groups;
        try {
            final Context app = context();
            final Map<String, String> seen = new HashMap<>();
            final CountryData.Favourites favourites = hidden.isEmpty() && competitions.isEmpty()
                    ? CountryData.Favourites.NONE : CountryData.favourites(app);
            List result = filterGroups(groups, "LeagueSuggestions", "leagues", new Keep() {
                @Override
                public boolean keep(Object hit) throws Exception {
                    String nameAndId = (String) field(SEARCH + "LeagueSuggestion", "nameAndId").get(hit);
                    int id = idOf(nameAndId);
                    Object payload = field(SEARCH + "LeagueSuggestion", "payload").get(hit);
                    String code = payload == null ? null : (String) field(SEARCH + "LeagueSuggestionPayload", "countryCode").get(payload);
                    CountryData.learn(id, code);
                    if (report && id > 0) {
                        String label = CompetitionFilter.label(searchCountryLabel(app, code, id), nameOf(nameAndId));
                        if (label != null) seen.put(Integer.toString(id), label);
                    }
                    boolean drop = CompetitionFilter.isHidden(competitions, id, 0) || isHidden(app, hidden, code, id, 0);
                    return !drop || favourites.league(id, 0);
                }
            });
            if (report) CompetitionFilter.reportSeen(app, seen);
            return result;
        } catch (Throwable failure) {
            fail(failure);
            return groups;
        }
    }

    /** List<TeamSuggestions>: drops teams whose league is hidden or of a hidden country (favourites stay). */
    public static List filterTeamSuggestions(List groups) {
        final Set<String> hidden = countries();
        final Set<String> competitions = CompetitionFilter.hidden();
        if ((hidden.isEmpty() && competitions.isEmpty()) || groups == null || groups.isEmpty()) return groups;
        try {
            final Context app = context();
            final CountryData.Favourites favourites = CountryData.favourites(app);
            return filterGroups(groups, "TeamSuggestions", "teams", new Keep() {
                @Override
                public boolean keep(Object hit) throws Exception {
                    if (favourites.team(idOf((String) field(SEARCH + "TeamSuggestion", "nameAndId").get(hit)))) return true;
                    Object payload = field(SEARCH + "TeamSuggestion", "payload").get(hit);
                    if (payload == null) return true;
                    int league = CountryData.parseInt((String) field(SEARCH + "TeamSuggestionPayload", "leagueId").get(payload));
                    boolean drop = CompetitionFilter.isHidden(competitions, league, 0) || isLeagueIdHidden(app, hidden, league);
                    return !drop || favourites.league(league, 0);
                }
            });
        } catch (Throwable failure) {
            fail(failure);
            return groups;
        }
    }

    /** List<MatchSuggestions>: drops matches of hidden leagues and countries unless a favourite team plays. */
    public static List filterMatchSuggestions(List groups) {
        final Set<String> hidden = countries();
        final Set<String> competitions = CompetitionFilter.hidden();
        if ((hidden.isEmpty() && competitions.isEmpty()) || groups == null || groups.isEmpty()) return groups;
        try {
            final Context app = context();
            final CountryData.Favourites favourites = CountryData.favourites(app);
            final String payloadClass = SEARCH + "MatchSuggestionPayload";
            return filterGroups(groups, "MatchSuggestions", "matches", new Keep() {
                @Override
                public boolean keep(Object hit) throws Exception {
                    Object payload = field(SEARCH + "MatchSuggestion", "payload").get(hit);
                    if (payload == null) return true;
                    int league = CountryData.parseInt((String) field(payloadClass, "leagueId").get(payload));
                    boolean drop = CompetitionFilter.isHidden(competitions, league, 0) || isLeagueIdHidden(app, hidden, league);
                    if (!drop || favourites.league(league, 0)) return true;
                    return favourites.team(CountryData.parseInt((String) field(payloadClass, "homeTeamId").get(payload)))
                            || favourites.team(CountryData.parseInt((String) field(payloadClass, "awayTeamId").get(payload)));
                }
            });
        } catch (Throwable failure) {
            fail(failure);
            return groups;
        }
    }

    /** Rebuilds each group holder (constructor(List)) whose hit list lost an item. */
    private static List filterGroups(List groups, String holder, String listField, Keep keep) throws Exception {
        String holderClass = SEARCH + holder;
        Object[] all = groups.toArray();
        List<Object> result = new ArrayList<>(all.length);
        boolean changed = false;
        for (Object group : all) {
            List hits = group == null ? null : (List) field(holderClass, listField).get(group);
            if (hits == null || hits.isEmpty()) {
                result.add(group);
                continue;
            }
            Object[] items = hits.toArray();
            List<Object> kept = new ArrayList<>(items.length);
            for (Object item : items) {
                if (item == null || keep.keep(item)) kept.add(item);
            }
            if (kept.size() == items.length) {
                result.add(group);
            } else {
                changed = true;
                result.add(constructor(holderClass, List.class).newInstance(kept));
            }
        }
        return changed ? result : groups;
    }

    /** "Name|123" -> 123. */
    private static int idOf(String nameAndId) {
        if (nameAndId == null) return 0;
        int bar = nameAndId.lastIndexOf('|');
        return bar < 0 ? 0 : CountryData.parseInt(nameAndId.substring(bar + 1));
    }

    /** "Name|123" -> "Name". */
    static String nameOf(String nameAndId) {
        if (nameAndId == null) return null;
        int bar = nameAndId.lastIndexOf('|');
        return bar < 0 ? nameAndId : nameAndId.substring(0, bar);
    }

    /**
     * The country part of a search league's label. Search calls every International league "INT",
     * so it is resolved by league id; while that is unknown it is just "International".
     */
    private static String searchCountryLabel(Context app, String code, int id) {
        if (code == null || code.isEmpty() || isPseudoCode(code)) return null;
        if (!CountrySeeds.INTERNATIONAL.equalsIgnoreCase(code)) return CompetitionFilter.countryLabel(code, null);
        String resolved = international(CountryData.code(app, id));
        return resolved == null ? CompetitionFilter.INTERNATIONAL_LABEL : CompetitionFilter.countryLabel(resolved, null);
    }

    // ---------------------------------------------------------------------------------------
    // Decisions
    // ---------------------------------------------------------------------------------------

    /** The favourites group and the staff picks group are not countries. */
    static boolean isPseudoCode(String code) {
        return "AAA".equals(code) || "SELECTED".equals(code);
    }

    /**
     * Whether a league with this raw country code is hidden. A raw "INT" is resolved to "INT" or
     * "INT-2" by league id (then parent id); while that is unknown it is hidden only when both are.
     */
    private static boolean isHidden(Context app, Set<String> hidden, String code, int id, int parentId) {
        if (code == null || code.isEmpty() || id == FAVOURITE_LEAGUE_ID || isPseudoCode(code)) return false;
        if (!CountrySeeds.INTERNATIONAL.equalsIgnoreCase(code)) return hidden.contains(code);
        String resolved = international(CountryData.code(app, id));
        if (resolved == null) resolved = international(CountryData.code(app, parentId));
        if (resolved == null) {
            return hidden.contains(CountrySeeds.INTERNATIONAL) && hidden.contains(CountrySeeds.INTERNATIONAL_CLUBS);
        }
        return hidden.contains(resolved);
    }

    private static String international(String code) {
        return CountrySeeds.INTERNATIONAL.equals(code) || CountrySeeds.INTERNATIONAL_CLUBS.equals(code) ? code : null;
    }

    /** Search names only the league id: hidden when its known country is (unknown leagues stay). */
    private static boolean isLeagueIdHidden(Context app, Set<String> hidden, int league) {
        String code = CountryData.code(app, league);
        return code != null && !isPseudoCode(code) && hidden.contains(code);
    }

    // ---------------------------------------------------------------------------------------
    // Reflection and plumbing
    // ---------------------------------------------------------------------------------------

    static Context context() {
        Context current = context;
        if (current == null) {
            current = AppContext.currentApplication();
            if (current != null) context = current;
        }
        return current;
    }

    private static Field field(String className, String name) throws Exception {
        String key = className + '#' + name;
        Field field = fields.get(key);
        if (field == null) {
            field = Class.forName(className, false, CountryFilter.class.getClassLoader()).getDeclaredField(name);
            field.setAccessible(true);
            fields.put(key, field);
        }
        return field;
    }

    private static Constructor<?> constructor(String className, Class<?> parameter) throws Exception {
        String key = className + '#' + parameter.getName();
        Constructor<?> constructor = constructors.get(key);
        if (constructor == null) {
            constructor = Class.forName(className, false, CountryFilter.class.getClassLoader()).getDeclaredConstructor(parameter);
            constructor.setAccessible(true);
            constructors.put(key, constructor);
        }
        return constructor;
    }

    /** Reports the failure for every list whose patch is in (both share these hooks). */
    private static void fail(Throwable failure) {
        if (patched()) HevalSettings.reportFailure(LIST_ID, failure);
        if (CompetitionFilter.patched()) HevalSettings.reportFailure(CompetitionFilter.LIST_ID, failure);
    }
}
