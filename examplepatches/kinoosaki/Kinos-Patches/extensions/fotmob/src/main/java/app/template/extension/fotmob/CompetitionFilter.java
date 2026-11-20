package app.template.extension.fotmob;

import android.content.Context;
import android.util.Log;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Hide competitions" (Patch settings list {@code fotmob.hidden_competitions}): the keys, labels
 * and checks of FotMob's competitions. The hooks themselves are in CountryFilter, which runs both
 * lists over the same data.
 *
 * <p>The key of a competition is its league id as a decimal string (Premier League is "47"). A
 * league with a {@code ParentId} (a stage or group of a competition in the match lists, e.g. a
 * qualification round) is keyed by the parent, the way FotMob's own League picks a league's primary
 * id, so all stages of a competition hide together. The label is "country · name", e.g. "England ·
 * Premier League", so the alphabetical picker groups competitions by country; the picker shows
 * FotMob's own league logo ({@value #IMAGE_URL}) and the country's flag (CountryIcons) or a trophy
 * until it loads.
 *
 * <p>Options: the app's bundled leagues file is the in-memory seed (registered at app start, off
 * the main thread); the leagues list and search report only competitions the seed does not already
 * name the same way, so the picker's {@link HevalSettings#MAX_OPTIONS} saved options are spent on
 * new ones. Match lists never report (they carry hundreds of competitions a day).
 */
@SuppressWarnings("unused")
public final class CompetitionFilter {
    static final String LIST_ID = "fotmob.hidden_competitions";
    static final String SEPARATOR = " · ";
    static final String IMAGE_URL = "https://images.fotmob.com/image_resources/logo/leaguelogo/%s.png";
    /** The country part of an International league whose group (national teams or clubs) is unknown. */
    static final String INTERNATIONAL_LABEL = "International";
    private static final String TAG = "Morphe-FotMob";

    /** At most this many remembered stage -> competition links. */
    private static final int MAX_PARENTS = 4096;

    /** League.FAVORITE_LEAGUE_ID. */
    private static final int FAVOURITE_LEAGUE_ID = -99;

    /** Stage league id -> its competition (ParentId), from the match lists; bounded, oldest go first. */
    private static final Map<Integer, Integer> parents = new LinkedHashMap<Integer, Integer>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Integer, Integer> eldest) {
            return size() > MAX_PARENTS;
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

    /** From CountryFilter.init (app start): the picker's logos, then the bundled leagues as seeds. */
    static void init(final Context context) {
        if (!patched()) return;
        HevalSettings.setOptionIconProvider(LIST_ID, CompetitionIcons.INSTANCE);
        if (context == null) return;
        Thread seeds = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    HevalSettings.registerOptions(LIST_ID, CountryData.competitionSeeds(context));
                } catch (Throwable failure) {
                    Log.w(TAG, "Competition seeds not registered: " + failure.getClass().getName());
                }
            }
        }, "Morphe-FotMob-competitions");
        seeds.setDaemon(true);
        seeds.setPriority(Thread.MIN_PRIORITY);
        seeds.start();
    }

    /** The picked competitions right now; empty when the patch is not in. */
    static Set<String> hidden() {
        return patched() ? HevalSettings.getHidden(LIST_ID) : Collections.<String>emptySet();
    }

    // ---------------------------------------------------------------------------------------
    // Keys, labels, images
    // ---------------------------------------------------------------------------------------

    /** The key of a league: its parent's id when it has one, else its own; null without a positive id. */
    static String key(int id, int parentId) {
        int competition = parentId > 0 ? parentId : id;
        return competition > 0 ? Integer.toString(competition) : null;
    }

    /** "country · name", just the name without a country, null without a name. */
    static String label(String country, String name) {
        String competition = name == null ? "" : name.trim();
        if (competition.isEmpty()) return null;
        String place = country == null ? "" : country.trim();
        return place.isEmpty() ? competition : place + SEPARATOR + competition;
    }

    /**
     * The country part of a label: the picker's name of the country code (CountrySeeds, so both
     * pickers say the same), else {@code fallback} (the name FotMob sent), else the code itself.
     */
    static String countryLabel(String code, String fallback) {
        String name = code == null ? null : CountrySeeds.NAMES.get(code);
        if (name != null) return name;
        if (fallback != null && !fallback.trim().isEmpty()) return fallback;
        return code;
    }

    /** FotMob's logo of competition {@code key} (1 to 10 digits), else null. */
    static String imageUrl(String key) {
        if (key == null || key.isEmpty() || key.length() > 10) return null;
        for (int i = 0; i < key.length(); i++) {
            char c = key.charAt(i);
            if (c < '0' || c > '9') return null;
        }
        return IMAGE_URL.replace("%s", key);
    }

    // ---------------------------------------------------------------------------------------
    // Checks (called by the CountryFilter hooks; they catch every failure)
    // ---------------------------------------------------------------------------------------

    /** Remembers that stage {@code id} belongs to competition {@code parentId} (search names stages by id). */
    static void learnParent(int id, int parentId) {
        if (id <= 0 || parentId <= 0 || id == parentId) return;
        synchronized (parents) {
            parents.put(id, parentId);
        }
    }

    /**
     * Whether league {@code id} (with {@code parentId}, 0 when unknown) is a picked competition: its
     * competition key, the league itself, or the competition a match list linked it to.
     */
    static boolean isHidden(Set<String> hidden, int id, int parentId) {
        if (hidden == null || hidden.isEmpty() || id == FAVOURITE_LEAGUE_ID) return false;
        String key = key(id, parentId);
        if (key != null && hidden.contains(key)) return true;
        if (id > 0 && parentId > 0 && hidden.contains(Integer.toString(id))) return true;
        if (parentId <= 0 && id > 0) {
            Integer parent;
            synchronized (parents) {
                parent = parents.get(id);
            }
            return parent != null && hidden.contains(Integer.toString(parent));
        }
        return false;
    }

    /** Reports the competitions the bundled seeds do not already name the same way. */
    static void reportSeen(Context context, Map<String, String> seen) {
        if (seen == null || seen.isEmpty()) return;
        Map<String, String> seeds = CountryData.competitionSeeds(context);
        for (Map.Entry<String, String> entry : seen.entrySet()) {
            String label = entry.getValue();
            if (label != null && !label.equals(seeds.get(entry.getKey()))) {
                HevalSettings.reportOptionsSeen(LIST_ID, entry.getKey(), label);
            }
        }
    }
}
