package app.xposed.extension;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

/**
 * Country and region names, flags and region membership, from X-Posed's tables (see
 * {@link CountryData}). Locations are compared by canonical key: lowercase, accents stripped,
 * aliases resolved. X answers in the app's language, so localized country names are mapped
 * to the same keys through their ISO codes.
 */
final class Countries {
    /** Shown for locations without a flag. */
    static final String UNKNOWN_FLAG = "\uD83C\uDF0D";

    /** One of X's regional labels and the countries X-Posed places in it (UN M49 based). */
    static final class Region {
        final String name, key, flag, note;
        /** Canonical keys of the member countries, sorted by display name. */
        final List<String> members;

        Region(String name, String key, String flag, String note, List<String> members) {
            this.name = name;
            this.key = key;
            this.flag = flag;
            this.note = note;
            this.members = members;
        }
    }

    private static final Pattern MARKS = Pattern.compile("\\p{M}");
    private static final Pattern SPACES = Pattern.compile("\\s+");
    private static final int MEMO_LIMIT = 2000;
    private static final Map<String, String> CANONICAL = new ConcurrentHashMap<>();
    /** Connection source to the country key in it, "" for none. */
    private static final Map<String, String> SOURCE_COUNTRY = new ConcurrentHashMap<>();

    /** Canonical key to flag, for every spelling in X-Posed's table. */
    private static final Map<String, String> FLAGS = new HashMap<>();
    /** Alias key to canonical key. */
    private static final Map<String, String> ALIASES = new HashMap<>();
    /** Canonical country key to display name, sorted by key. */
    private static final Map<String, String> NAMES = new TreeMap<>();
    private static final Map<String, Region> REGIONS = new LinkedHashMap<>();
    /** Country key to the keys of the regions that contain it. */
    private static final Map<String, List<String>> COUNTRY_REGIONS = new HashMap<>();
    private static Map<String, String> localized;

    static {
        // Aliases that only differ by accents ("reunion" for "réunion") share a key already.
        for (String[] row : rows(CountryData.ALIASES)) {
            String alias = key(row[0]), canonical = key(row[1]);
            if (!alias.equals(canonical)) ALIASES.put(alias, canonical);
            NAMES.put(canonical, titleCase(row[1]));
        }
        for (String[] row : rows(CountryData.FLAGS)) {
            String k = key(row[0]);
            FLAGS.put(k, row[1]);
            if (!ALIASES.containsKey(k)) NAMES.putIfAbsent(k, titleCase(row[0]));
        }
        for (String[] row : rows(CountryData.REGIONS)) {
            String regionKey = key(row[1]);
            List<String> members = new ArrayList<>();
            for (String member : row[4].split("\\|")) {
                String k = canonical(key(member));
                members.add(k);
                List<String> regions = COUNTRY_REGIONS.get(k);
                if (regions == null) COUNTRY_REGIONS.put(k, regions = new ArrayList<>(2));
                regions.add(regionKey);
            }
            members.sort((a, b) -> displayName(a).compareToIgnoreCase(displayName(b)));
            REGIONS.put(regionKey, new Region(row[0], regionKey, row[2], row[3], Collections.unmodifiableList(members)));
        }
    }

    private Countries() {
    }

    private static List<String[]> rows(String table) {
        List<String[]> rows = new ArrayList<>();
        for (String line : table.split("\n")) {
            if (!line.isEmpty()) rows.add(line.split("\t", -1));
        }
        return rows;
    }

    private static String canonical(String k) {
        String alias = ALIASES.get(k);
        return alias != null ? alias : k;
    }

    /** Lookup key: lowercase, accents stripped, typographic apostrophes and spaces normalized. */
    static String key(String name) {
        String s = Normalizer.normalize(name.trim(), Normalizer.Form.NFKD);
        s = MARKS.matcher(s).replaceAll("")
                .replace('\u2018', '\'').replace('\u2019', '\'').replace('\u02BC', '\'');
        return SPACES.matcher(s).replaceAll(" ").toLowerCase(Locale.ROOT);
    }

    /**
     * Key that matches every spelling of a location, including X's localized country names.
     * Unknown names keep their own key. Memoized: few distinct locations occur.
     */
    static String canonicalKey(String location) {
        String cached = CANONICAL.get(location);
        if (cached != null) return cached;
        String k = resolve(location);
        if (CANONICAL.size() < MEMO_LIMIT) CANONICAL.put(location, k);
        return k;
    }

    private static String resolve(String name) {
        String k = canonical(key(name));
        if (!FLAGS.containsKey(k) && !REGIONS.containsKey(k)) {
            String fromLocale = localized().get(k);
            if (fromLocale != null) k = fromLocale;
        }
        return k;
    }

    /**
     * The country key in a connection source such as "Switzerland App Store", as X-Posed's
     * getDeviceCountry: the longest leading run of words that names a country. Null for
     * sources without one, such as "Web".
     */
    static String sourceCountry(String source) {
        if (source == null) return null;
        String cached = SOURCE_COUNTRY.get(source);
        if (cached == null) {
            cached = "";
            String[] words = SPACES.split(source.trim());
            for (int n = words.length; n > 0 && cached.isEmpty(); n--) {
                String k = resolve(String.join(" ", Arrays.asList(words).subList(0, n)));
                if (FLAGS.containsKey(k)) cached = k;
            }
            if (SOURCE_COUNTRY.size() < MEMO_LIMIT) SOURCE_COUNTRY.put(source, cached);
        }
        return cached.isEmpty() ? null : cached;
    }

    /** True when the name is one of the English country or region spellings X-Posed knows. */
    static boolean isKnownEnglish(String location) {
        if (location == null) return false;
        String k = canonical(key(location));
        return FLAGS.containsKey(k) || REGIONS.containsKey(k);
    }

    /** True for the canonical key of a country or region in X-Posed's tables. */
    static boolean isKnownKey(String canonicalKey) {
        return FLAGS.containsKey(canonicalKey) || REGIONS.containsKey(canonicalKey);
    }

    /** The flag emoji for a country, the globe for a region, or null for unknown names. */
    static String flagFor(String location) {
        if (location == null) return null;
        String k = canonicalKey(location);
        String flag = FLAGS.get(k);
        if (flag != null) return flag;
        Region region = REGIONS.get(k);
        return region != null ? region.flag : null;
    }

    /** The name the picker shows for a canonical key. */
    static String displayName(String canonicalKey) {
        String name = NAMES.get(canonicalKey);
        if (name != null) return name;
        Region region = REGIONS.get(canonicalKey);
        return region != null ? region.name : titleCase(canonicalKey);
    }

    /** Canonical keys of every country, sorted by display name. */
    static List<String> countryKeys() {
        List<String> keys = new ArrayList<>(NAMES.keySet());
        keys.removeAll(REGIONS.keySet());
        keys.sort((a, b) -> displayName(a).compareToIgnoreCase(displayName(b)));
        return keys;
    }

    static List<Region> regions() {
        return new ArrayList<>(REGIONS.values());
    }

    /** The region with this key or spelling, or null. */
    static Region region(String location) {
        return location == null ? null : REGIONS.get(canonicalKey(location));
    }

    /** Keys of the regions that contain a country key; empty for regions and unknown names. */
    static List<String> regionsOf(String countryKey) {
        List<String> regions = COUNTRY_REGIONS.get(countryKey);
        return regions != null ? regions : Collections.emptyList();
    }

    /** Same capitalisation as X-Posed's formatCountryName(). */
    private static String titleCase(String name) {
        StringBuilder sb = new StringBuilder(name.length());
        for (String word : name.split(" ")) {
            if (sb.length() > 0) sb.append(' ');
            if (!word.isEmpty()) {
                sb.appendCodePoint(Character.toUpperCase(word.codePointAt(0)))
                        .append(word.substring(Character.charCount(word.codePointAt(0))).toLowerCase(Locale.ROOT));
            }
        }
        return sb.toString();
    }

    /**
     * Localized and platform English country names to canonical keys, through the flag of
     * their ISO code. Flags shared by several canonical names (the EU's) are left out.
     */
    private static synchronized Map<String, String> localized() {
        if (localized == null) {
            Map<String, String> byFlag = new HashMap<>();
            for (Map.Entry<String, String> e : FLAGS.entrySet()) {
                String k = canonical(e.getKey());
                String previous = byFlag.putIfAbsent(e.getValue(), k);
                if (previous != null && !previous.equals(k)) byFlag.put(e.getValue(), "");
            }
            Map<String, String> map = new HashMap<>();
            Locale display = Locale.getDefault();
            for (String code : Locale.getISOCountries()) {
                String k = byFlag.get(regionalIndicators(code));
                if (k == null || k.isEmpty()) continue;
                Locale country = new Locale("", code);
                map.put(key(country.getDisplayCountry(display)), k);
                map.put(key(country.getDisplayCountry(Locale.ENGLISH)), k);
            }
            localized = map;
        }
        return localized;
    }

    private static String regionalIndicators(String isoCode) {
        StringBuilder sb = new StringBuilder(4);
        for (int i = 0; i < isoCode.length(); i++) {
            sb.appendCodePoint(0x1F1E6 + (isoCode.charAt(i) - 'A'));
        }
        return sb.toString();
    }
}
