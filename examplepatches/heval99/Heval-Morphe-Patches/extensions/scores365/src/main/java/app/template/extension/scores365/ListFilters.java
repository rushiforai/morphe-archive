package app.template.extension.scores365;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hidden competitions" and "Hidden countries" for 365Scores. The parsed games response
 * ({@code com.scores365.entitys.GamesObj}) has its {@code games} and {@code competitions} getters
 * patched to hand their map to {@link #filterGames(Object, Map)} and
 * {@link #filterCompetitions(Object, LinkedHashMap)}: a game of a hidden competition, or of a
 * competition whose country is hidden, is left out of the returned map, and so is the competition.
 * The response itself is never changed, so merging pages and updates keeps working, and an empty
 * pick is the stock behaviour.
 *
 * <p>Keys: a competition by its id (as in {@code GameObj.getCompetitionID()} and the
 * {@code competitions} map), a country by its id ({@code CompetitionObj.getCid()}). The picker
 * learns its options from the responses the app loads: {@link #filterCompetitions} reports every
 * competition ("country · name") and country it sees. Because this is a getter of the shared
 * response type, a hidden competition is also gone from any team or competition page's match list;
 * standings, news, search and notifications are not filtered.
 *
 * <p>Every entry point fails open (returns its input) on any error.
 */
@SuppressWarnings("unused")
public final class ListFilters {
    private static final String TAG = "Morphe-365Filters";

    public static final String COMPETITIONS = "scores365.hidden_competitions";
    public static final String COUNTRIES = "scores365.hidden_countries";

    private static final String SEPARATOR = " · ";

    private ListFilters() { }

    /** A filtered view of one source map, valid while the picks and the source size are unchanged. */
    private static final class Cached {
        final Set<String> competitions;
        final Set<String> countries;
        final int sourceSize;
        final Map<Object, Object> result;

        Cached(Set<String> competitions, Set<String> countries, int sourceSize, Map<Object, Object> result) {
            this.competitions = competitions;
            this.countries = countries;
            this.sourceSize = sourceSize;
            this.result = result;
        }
    }

    private static final Map<Object, Cached> GAMES = Collections.synchronizedMap(new WeakHashMap<Object, Cached>());
    private static final Map<Object, Cached> COMPETITION_MAPS = Collections.synchronizedMap(new WeakHashMap<Object, Cached>());
    private static final Map<Object, Boolean> REPORTED = Collections.synchronizedMap(new WeakHashMap<Object, Boolean>());

    private static volatile Method competitionIdOfGame;
    private static volatile Method countryIdOfCompetition;
    private static volatile Method nameMethod;
    private static volatile Field competitionsField;
    private static volatile Field countriesField;

    /** Patched into GamesObj.getGames()'s return: {@code games} without the hidden competitions' games. */
    public static Map filterGames(Object response, Map games) {
        try {
            if (response == null || games == null || games.isEmpty()) return games;
            Set<String> hiddenCompetitions = HevalSettings.getHidden(COMPETITIONS);
            Set<String> hiddenCountries = HevalSettings.getHidden(COUNTRIES);
            if (hiddenCompetitions.isEmpty() && hiddenCountries.isEmpty()) return games;
            Cached cached = GAMES.get(games);
            if (cached != null && cached.sourceSize == games.size()
                    && cached.competitions.equals(hiddenCompetitions) && cached.countries.equals(hiddenCountries)) {
                return cached.result;
            }
            Map<?, ?> competitions = competitionsOf(response);
            Map<Object, Object> kept = new LinkedHashMap<>();
            for (Object entry : games.entrySet()) {
                Map.Entry<?, ?> pair = (Map.Entry<?, ?>) entry;
                if (!hides(pair.getValue(), competitions, hiddenCompetitions, hiddenCountries)) kept.put(pair.getKey(), pair.getValue());
            }
            GAMES.put(games, new Cached(hiddenCompetitions, hiddenCountries, games.size(), kept));
            return kept;
        } catch (Throwable failure) {
            Log.w(TAG, "games filter failed open: " + failure.getClass().getName());
            return games;
        }
    }

    /**
     * Patched into GamesObj.getCompetitions()'s return: reports the competitions and countries the
     * app shows (for the pickers), then returns {@code competitions} without the hidden ones.
     */
    public static LinkedHashMap filterCompetitions(Object response, LinkedHashMap competitions) {
        try {
            if (response == null || competitions == null) return competitions;
            report(response, competitions);
            Set<String> hiddenCompetitions = HevalSettings.getHidden(COMPETITIONS);
            Set<String> hiddenCountries = HevalSettings.getHidden(COUNTRIES);
            if (hiddenCompetitions.isEmpty() && hiddenCountries.isEmpty() || competitions.isEmpty()) return competitions;
            Cached cached = COMPETITION_MAPS.get(competitions);
            if (cached != null && cached.sourceSize == competitions.size()
                    && cached.competitions.equals(hiddenCompetitions) && cached.countries.equals(hiddenCountries)) {
                return (LinkedHashMap) cached.result;
            }
            LinkedHashMap<Object, Object> kept = new LinkedHashMap<>();
            for (Object entry : competitions.entrySet()) {
                Map.Entry<?, ?> pair = (Map.Entry<?, ?>) entry;
                if (!hiddenCompetition(pair.getKey(), pair.getValue(), hiddenCompetitions, hiddenCountries)) kept.put(pair.getKey(), pair.getValue());
            }
            COMPETITION_MAPS.put(competitions, new Cached(hiddenCompetitions, hiddenCountries, competitions.size(), kept));
            return kept;
        } catch (Throwable failure) {
            Log.w(TAG, "competitions filter failed open: " + failure.getClass().getName());
            return competitions;
        }
    }

    private static boolean hides(Object game, Map<?, ?> competitions, Set<String> hiddenCompetitions, Set<String> hiddenCountries)
            throws Exception {
        if (game == null) return false;
        Method method = competitionIdOfGame;
        if (method == null) {
            method = game.getClass().getMethod("getCompetitionID");
            competitionIdOfGame = method;
        }
        int competitionId = (Integer) method.invoke(game);
        Object competition = competitions == null ? null : competitions.get(competitionId);
        return hiddenCompetition(competitionId, competition, hiddenCompetitions, hiddenCountries);
    }

    private static boolean hiddenCompetition(Object id, Object competition, Set<String> hiddenCompetitions, Set<String> hiddenCountries)
            throws Exception {
        if (hiddenCompetitions.contains(String.valueOf(id))) return true;
        if (hiddenCountries.isEmpty() || competition == null) return false;
        return hiddenCountries.contains(String.valueOf(countryIdOf(competition)));
    }

    private static int countryIdOf(Object competition) throws Exception {
        Method method = countryIdOfCompetition;
        if (method == null) {
            method = competition.getClass().getMethod("getCid");
            countryIdOfCompetition = method;
        }
        return (Integer) method.invoke(competition);
    }

    /** The response's raw {@code competitions} map (the getter is patched, so the field is read). */
    private static Map<?, ?> competitionsOf(Object response) throws Exception {
        Field field = competitionsField;
        if (field == null) {
            field = response.getClass().getDeclaredField("competitions");
            field.setAccessible(true);
            competitionsField = field;
        }
        return (Map<?, ?>) field.get(response);
    }

    private static Map<?, ?> countriesOf(Object response) throws Exception {
        Field field = countriesField;
        if (field == null) {
            field = response.getClass().getDeclaredField("countries");
            field.setAccessible(true);
            countriesField = field;
        }
        return (Map<?, ?>) field.get(response);
    }

    private static String nameOf(Object entity) throws Exception {
        Method method = nameMethod;
        if (method == null) {
            method = entity.getClass().getMethod("getName");
            nameMethod = method;
        }
        Object name = method.invoke(entity);
        return name == null ? "" : name.toString();
    }

    /** Tells the pickers which competitions and countries this response shows (once per response). */
    private static void report(Object response, Map<?, ?> competitions) throws Exception {
        if (REPORTED.put(competitions, Boolean.TRUE) != null) return;
        Map<?, ?> countries = countriesOf(response);
        for (Object entry : competitions.entrySet()) {
            Map.Entry<?, ?> pair = (Map.Entry<?, ?>) entry;
            Object competition = pair.getValue();
            if (competition == null) continue;
            String name = nameOf(competition);
            if (name.isEmpty()) continue;
            String country = "";
            Object countryObj = countries == null ? null : countries.get(countryIdOf(competition));
            if (countryObj != null) country = nameOf(countryObj);
            HevalSettings.reportOptionsSeen(COMPETITIONS, String.valueOf(pair.getKey()), country.isEmpty() ? name : country + SEPARATOR + name);
        }
        if (countries != null) {
            for (Object entry : countries.entrySet()) {
                Map.Entry<?, ?> pair = (Map.Entry<?, ?>) entry;
                if (pair.getValue() == null) continue;
                String name = nameOf(pair.getValue());
                if (!name.isEmpty()) HevalSettings.reportOptionsSeen(COUNTRIES, String.valueOf(pair.getKey()), name);
            }
        }
    }
}
