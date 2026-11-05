package app.template.extension.fotmob;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.os.SystemClock;
import android.util.Log;
import android.util.Xml;

import org.json.JSONArray;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * What "Hidden countries" needs besides the picks: which country a league id belongs to, and the
 * user's favourite leagues and teams (always shown).
 *
 * <p>League countries: match lists and search name only a league id (search) or the raw "INT"
 * code, which FotMob uses for national-team and club competitions alike; only its leagues list
 * tells them apart ("INT-2" for clubs). The map is filled, lowest priority first, from the app's
 * bundled leagues file (res/raw/available_leagues, the same "nationalTeams" rule as the app's
 * parser), the copy saved from the last leagues list, and every leagues list the app loads.
 *
 * <p>Favourites are FotMob's own files FAVORITE_LEAGUES_JSON (Gson League: "Id") and
 * FAVORITE_TEAMS_JSON (Gson Team: "ID") in the app's files dir, re-read when they change.
 *
 * <p>"Hidden competitions" seeds: the same bundled file names each league, so it also gives the
 * picker's starting list of competitions (key and "country · name" label, CompetitionFilter).
 */
final class CountryData {
    private static final String TAG = "Morphe-FotMob";
    private static final String PREFS = "heval_fotmob_countries";
    private static final String KEY_CODES = "league_codes";
    private static final String KEY_HASH = "league_codes_hash";
    private static final String FAVORITE_LEAGUES = "FAVORITE_LEAGUES_JSON";
    private static final String FAVORITE_TEAMS = "FAVORITE_TEAMS_JSON";
    private static final long FAVOURITES_CHECK_MS = 2000L;

    /** League id -> country code ("INT" / "INT-2" for the International groups). */
    private static final ConcurrentHashMap<Integer, String> codes = new ConcurrentHashMap<>();
    private static volatile boolean loaded;
    private static volatile int savedHash;
    /** Competition key -> picker label of every league in the bundled leagues file. */
    private static volatile Map<String, String> bundledCompetitions = Collections.emptyMap();

    private static volatile Favourites favourites;
    private static volatile long favouritesCheckedAt;
    private static long leaguesStamp = -1L;
    private static long teamsStamp = -1L;

    static final class Favourites {
        static final Favourites NONE = new Favourites(Collections.<Integer>emptySet(), Collections.<Integer>emptySet());

        final Set<Integer> leagues;
        final Set<Integer> teams;

        Favourites(Set<Integer> leagues, Set<Integer> teams) {
            this.leagues = leagues;
            this.teams = teams;
        }

        boolean league(int id, int parentId) {
            return (id > 0 && leagues.contains(id)) || (parentId > 0 && leagues.contains(parentId));
        }

        boolean team(int id) {
            return id > 0 && teams.contains(id);
        }
    }

    private CountryData() {
    }

    // ---------------------------------------------------------------------------------------
    // League countries
    // ---------------------------------------------------------------------------------------

    /** The country code of league {@code id}, or null when unknown. */
    static String code(Context context, int id) {
        if (id <= 0) return null;
        ensureLoaded(context);
        return codes.get(id);
    }

    /** Remembers a country learnt outside the leagues list; never overrides, never a raw "INT". */
    static void learn(int id, String code) {
        if (id <= 0 || code == null || code.isEmpty() || CountrySeeds.INTERNATIONAL.equalsIgnoreCase(code)) return;
        codes.putIfAbsent(id, code);
    }

    /** A fresh leagues list (id -> code, INT-2 already applied): wins, and is saved when it changed. */
    static void remember(Context context, Map<Integer, String> fresh) {
        if (fresh == null || fresh.isEmpty()) return;
        ensureLoaded(context);
        codes.putAll(fresh);
        int hash = fresh.hashCode();
        if (hash == savedHash || context == null) return;
        savedHash = hash;
        try {
            StringBuilder text = new StringBuilder(fresh.size() * 10);
            for (Map.Entry<Integer, String> entry : fresh.entrySet()) {
                if (text.length() > 0) text.append(',');
                text.append(entry.getKey()).append('=').append(entry.getValue());
            }
            prefs(context).edit().putString(KEY_CODES, text.toString()).putInt(KEY_HASH, hash).apply();
        } catch (Throwable failure) {
            Log.w(TAG, "League countries not saved: " + failure.getClass().getName());
        }
    }

    /** The bundled leagues as "Hidden competitions" options (key -> label); empty without a context. */
    static Map<String, String> competitionSeeds(Context context) {
        ensureLoaded(context);
        return bundledCompetitions;
    }

    static void ensureLoaded(Context context) {
        if (loaded || context == null) return;
        synchronized (CountryData.class) {
            if (loaded) return;
            loadBundled(context);
            loadSaved(context);
            // Only after parsing: the unlocked fast path above must never see half-filled maps.
            loaded = true;
        }
    }

    private static void loadSaved(Context context) {
        try {
            SharedPreferences prefs = prefs(context);
            String text = prefs.getString(KEY_CODES, null);
            if (text == null || text.isEmpty()) return;
            savedHash = prefs.getInt(KEY_HASH, 0);
            for (String pair : text.split(",")) {
                int equals = pair.indexOf('=');
                if (equals <= 0 || equals == pair.length() - 1) continue;
                int id = parseInt(pair.substring(0, equals));
                if (id > 0) codes.put(id, pair.substring(equals + 1));
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Saved league countries not read: " + failure.getClass().getName());
        }
    }

    /** The app's bundled leagues file, read the way FotMobDataParser.addLeagues reads the live one. */
    private static void loadBundled(Context context) {
        InputStream in = null;
        try {
            Resources resources = context.getResources();
            int id = resources.getIdentifier("available_leagues", "raw", context.getPackageName());
            if (id == 0) return;
            in = resources.openRawResource(id);
            XmlPullParser parser = Xml.newPullParser();
            parser.setInput(in, "UTF-8");
            String group = null;
            String groupName = null;
            Map<String, String> competitions = new HashMap<>(512);
            for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
                if (event != XmlPullParser.START_TAG) continue;
                String tag = parser.getName();
                if ("group".equals(tag)) {
                    group = parser.getAttributeValue(null, "ccode");
                    groupName = parser.getAttributeValue(null, "cname");
                } else if ("league".equals(tag) && group != null && !CountryFilter.isPseudoCode(group)) {
                    int league = parseInt(parser.getAttributeValue(null, "id"));
                    if (league <= 0) continue;
                    String code = group;
                    if (CountrySeeds.INTERNATIONAL.equalsIgnoreCase(group)) {
                        code = "true".equalsIgnoreCase(parser.getAttributeValue(null, "nationalTeams"))
                                ? CountrySeeds.INTERNATIONAL : CountrySeeds.INTERNATIONAL_CLUBS;
                    }
                    codes.putIfAbsent(league, code);
                    String label = CompetitionFilter.label(CompetitionFilter.countryLabel(code, groupName),
                            parser.getAttributeValue(null, "name"));
                    if (label != null) competitions.put(Integer.toString(league), label);
                }
            }
            bundledCompetitions = Collections.unmodifiableMap(competitions);
        } catch (Throwable failure) {
            Log.w(TAG, "Bundled leagues not read: " + failure.getClass().getName());
        } finally {
            closeQuietly(in);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Favourites
    // ---------------------------------------------------------------------------------------

    /** The favourite league and team ids; re-read at most every two seconds, and only when changed. */
    static Favourites favourites(Context context) {
        Favourites current = favourites;
        long now = SystemClock.uptimeMillis();
        if (current != null && now - favouritesCheckedAt < FAVOURITES_CHECK_MS) return current;
        if (context == null) return current != null ? current : Favourites.NONE;
        synchronized (CountryData.class) {
            favouritesCheckedAt = now;
            File leaguesFile = context.getFileStreamPath(FAVORITE_LEAGUES);
            File teamsFile = context.getFileStreamPath(FAVORITE_TEAMS);
            long leagues = stamp(leaguesFile);
            long teams = stamp(teamsFile);
            if (favourites == null || leagues != leaguesStamp || teams != teamsStamp) {
                favourites = new Favourites(readIds(leaguesFile, "Id", "ParentId"), readIds(teamsFile, "ID", "Id"));
                leaguesStamp = leagues;
                teamsStamp = teams;
            }
            return favourites;
        }
    }

    private static long stamp(File file) {
        return file != null && file.isFile() ? file.lastModified() * 31L + file.length() : 0L;
    }

    private static Set<Integer> readIds(File file, String... keys) {
        Set<Integer> ids = new HashSet<>();
        if (file == null || !file.isFile()) return ids;
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream((int) Math.max(256L, file.length()));
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) != -1; ) bytes.write(buffer, 0, read);
            JSONArray array = new JSONArray(bytes.toString("UTF-8"));
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.optJSONObject(i);
                if (item == null) continue;
                for (String key : keys) {
                    int id = item.optInt(key, 0);
                    if (id > 0) ids.add(id);
                }
            }
        } catch (Throwable failure) {
            Log.w(TAG, "Favourites not read from " + file.getName() + ": " + failure.getClass().getName());
        } finally {
            closeQuietly(in);
        }
        return ids;
    }

    // ---------------------------------------------------------------------------------------

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static int parseInt(String text) {
        if (text == null) return 0;
        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (Throwable ignored) {
            // Nothing to do.
        }
    }
}
