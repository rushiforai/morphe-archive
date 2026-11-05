package app.template.extension.sofascore;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hide competitions" (Patch settings list {@code sofascore.hidden_competitions}): the keys, labels
 * and checks of Sofascore's competitions (UniqueTournament). The hooks themselves are in
 * CountryFilter, which runs both lists over the same data.
 *
 * <p>The key of a competition is its UniqueTournament id as a decimal string (Premier League is
 * "17"). The label is "category · name", e.g. "England · Premier League", so the alphabetical
 * picker groups competitions by country; the picker shows Sofascore's own logo of the competition
 * ({@value #IMAGE_URL}) and the country's flag (CountryIcons) or a trophy until it loads.
 *
 * <p>Options are reported only where the user looks at competitions on purpose: a country's
 * competitions in Leagues, an expanded country of the match list and search. The Live tab and the
 * chronological view list hundreds of competitions every day and the picker keeps at most
 * {@link HevalSettings#MAX_OPTIONS} seen options, so there only picked competitions are reported
 * (which keeps their label saved).
 */
@SuppressWarnings({"unused", "rawtypes"})
public final class CompetitionFilter {
    static final String LIST_ID = "sofascore.hidden_competitions";
    static final String SEPARATOR = " · ";
    static final String IMAGE_URL = "https://img.sofascore.com/api/v1/unique-tournament/%s/image";

    /** At most this many remembered competitions (key and a short country key each). */
    private static final int MAX_REMEMBERED = 4096;

    /**
     * Competition key to its category's key (CountryFilter.key), for the picker's flag; also marks
     * the competitions already reported with a country in this process. Bounded, oldest go first.
     */
    private static final Map<String, String> countryKeys = new LinkedHashMap<String, String>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > MAX_REMEMBERED;
        }
    };

    private CompetitionFilter() {
    }

    /**
     * Whether "Hide competitions" is patched in. The patch rewrites this to return true; while it
     * is false the hooks skip competitions (only "Hide countries" is patched).
     */
    public static boolean patched() {
        return false;
    }

    /** Registers the picker's logos and flags. Called by CountryFilter.init at app start. */
    static void init() {
        HevalSettings.setOptionIconProvider(LIST_ID, CompetitionIcons.INSTANCE);
    }

    /** The picked competitions right now; empty when the patch is not in. */
    static Set<String> hidden() {
        return patched() ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
    }

    // ---------------------------------------------------------------------------------------
    // Keys, labels, images
    // ---------------------------------------------------------------------------------------

    /** The key of a UniqueTournament id (a positive Integer), else null. */
    static String key(Object id) {
        return id instanceof Integer && (Integer) id > 0 ? Integer.toString((Integer) id) : null;
    }

    /** "category · name", just the name without a category, null without a name. */
    static String label(String category, String name) {
        String competition = name == null ? "" : name.trim();
        if (competition.isEmpty()) return null;
        String country = category == null ? "" : category.trim();
        return country.isEmpty() ? competition : country + SEPARATOR + competition;
    }

    /** Sofascore's logo of competition {@code key} (1 to 10 digits), else null. */
    static String imageUrl(String key) {
        if (key == null || key.isEmpty() || key.length() > 10) return null;
        for (int i = 0; i < key.length(); i++) {
            char c = key.charAt(i);
            if (c < '0' || c > '9') return null;
        }
        return IMAGE_URL.replace("%s", key);
    }

    /** The remembered category key of competition {@code key}, or null. */
    static String countryKey(String key) {
        if (key == null) return null;
        synchronized (countryKeys) {
            return countryKeys.get(key);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Checks (called by the CountryFilter hooks; they catch every failure)
    // ---------------------------------------------------------------------------------------

    /**
     * Whether {@code uniqueTournament} is picked. Reports it to the picker when {@code report} is
     * set or when it is picked; {@code fallbackCategory} names it when it carries no category.
     */
    static boolean hiddenUniqueTournament(Object uniqueTournament, Object fallbackCategory, Set<String> hidden,
                                          boolean report) throws Exception {
        if (uniqueTournament == null) return false;
        String key = key(CountryFilter.call(uniqueTournament, "getId"));
        if (key == null) return false;
        boolean picked = hidden.contains(key);
        if (report || picked) remember(key, uniqueTournament, fallbackCategory);
        return picked;
    }

    /** Whether the competition of {@code event} (its tournament's UniqueTournament) is picked. */
    static boolean hiddenEvent(Object event, Set<String> hidden, boolean report) throws Exception {
        if (event == null || (hidden.isEmpty() && !report)) return false;
        Object tournament = CountryFilter.call(event, "getTournament");
        if (tournament == null) return false;
        Object uniqueTournament = CountryFilter.call(tournament, "getUniqueTournament");
        if (uniqueTournament == null) return false;
        return hiddenUniqueTournament(uniqueTournament, CountryFilter.call(tournament, "getCategory"), hidden, report);
    }

    /**
     * Whether every id of a date feed row's {@code uniqueTournamentIds} is picked (false for an
     * empty or missing list, so a row without ids always stays).
     */
    static boolean allHidden(Object ids, Set<String> hidden) {
        if (hidden.isEmpty() || !(ids instanceof List)) return false;
        Object[] all = ((List) ids).toArray();
        if (all.length == 0) return false;
        for (Object id : all) {
            String key = key(id);
            if (key == null || !hidden.contains(key)) return false;
        }
        return true;
    }

    /**
     * Reports competition {@code key} with its "category · name" label, once per process when its
     * category is known (a label without one is reported again until a category turns up).
     */
    private static void remember(String key, Object uniqueTournament, Object fallbackCategory) throws Exception {
        synchronized (countryKeys) {
            if (countryKeys.containsKey(key)) return;
        }
        Object category = CountryFilter.call(uniqueTournament, "getCategory");
        if (category == null) category = fallbackCategory;
        Object categoryName = category == null ? null : CountryFilter.call(category, "getName");
        Object name = CountryFilter.call(uniqueTournament, "getName");
        String label = label(categoryName instanceof String ? (String) categoryName : null,
            name instanceof String ? (String) name : null);
        HevalSettings.reportOptionsSeen(LIST_ID, key, label == null ? key : label);
        if (category == null) return;
        String country = CountryFilter.key(category);
        synchronized (countryKeys) {
            countryKeys.put(key, country == null ? "" : country);
        }
    }
}
