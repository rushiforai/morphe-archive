package app.xposed.extension;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * One immutable set of filters, as X-Posed's Blocking settings hold them. Edits go through
 * {@link Builder} and produce a new snapshot, so readers never lock and caches can compare
 * snapshots by identity. Matching data (folded terms, link sets, region coverage) is
 * prepared once here instead of on every post.
 */
final class FilterRules {
    static final String PARODY = "parody", COMMENTARY = "commentary", FAN = "fan", GOVERNMENT = "government";
    /** X's account labels in the order the editor lists them. */
    static final List<String> LABELS = Collections.unmodifiableList(Arrays.asList(PARODY, COMMENTARY, FAN, GOVERNMENT));
    static final int MAX_HANDLE_DIGITS = 15, MAX_NAME_DIGITS = 50;
    private static final int MAX_ITEMS = 5000, MAX_TERM = 200;
    private static final int VERSION = 1;

    static final FilterRules EMPTY = new Builder().build();

    /** Countries and regions as saved, one spelling per canonical key. */
    final List<String> locations;
    /** Region key to the country keys it also covers. A missing region means its label only. */
    final Map<String, List<String>> regionCountries;
    /** User id to the handle last seen for it, for display; "" when unknown. */
    final Map<Long, String> accounts;
    final List<String> names, bios, affiliations;
    /** Normalized domains and exact URLs. */
    final List<String> links;
    final Set<String> labels, languages;
    final long minFollowing, minPosts;
    final int minHandleDigits, minNameDigits;
    /** Filter accounts whose location X marks as possibly inaccurate. */
    final boolean warnedAccounts;
    final boolean bioMatchesLocation, linksMatchLocation;
    /** Always Show: lowercase handles no filter applies to. Not counted as filters. */
    final Set<String> alwaysShow;
    /** No filter applies to accounts X reports the signed-in account follows. */
    final boolean alwaysShowFollowing;
    /** Matching posts are highlighted (X-Posed's default) rather than hidden. */
    final boolean highlight;
    /** In Hide mode, still highlight in curated List timelines. */
    final boolean highlightInLists;
    /** Hide replies and quotes of filtered posts, with "Show post", in either mode. */
    final boolean hideRelatedPosts;

    final Set<String> locationKeys, coveredCountries, domains, urls;
    final String[] nameTerms, bioTerms, affiliationTerms;

    private FilterRules(Builder b) {
        locations = Collections.unmodifiableList(new ArrayList<>(b.locations.values()));
        locationKeys = Collections.unmodifiableSet(new HashSet<>(b.locations.keySet()));
        Map<String, List<String>> selections = new TreeMap<>();
        Set<String> covered = new HashSet<>();
        for (Map.Entry<String, Set<String>> e : b.regionCountries.entrySet()) {
            selections.put(e.getKey(), Collections.unmodifiableList(new ArrayList<>(e.getValue())));
            if (locationKeys.contains(e.getKey())) covered.addAll(e.getValue());
        }
        regionCountries = Collections.unmodifiableMap(selections);
        coveredCountries = Collections.unmodifiableSet(covered);
        accounts = Collections.unmodifiableMap(new LinkedHashMap<>(b.accounts));
        names = Collections.unmodifiableList(new ArrayList<>(b.names.values()));
        bios = Collections.unmodifiableList(new ArrayList<>(b.bios.values()));
        affiliations = Collections.unmodifiableList(new ArrayList<>(b.affiliations.values()));
        nameTerms = b.names.keySet().toArray(new String[0]);
        bioTerms = b.bios.keySet().toArray(new String[0]);
        affiliationTerms = b.affiliations.keySet().toArray(new String[0]);
        links = Collections.unmodifiableList(new ArrayList<>(b.links));
        Set<String> d = new HashSet<>(), u = new HashSet<>();
        for (String link : b.links) (Links.isExact(link) ? u : d).add(link);
        domains = Collections.unmodifiableSet(d);
        urls = Collections.unmodifiableSet(u);
        labels = Collections.unmodifiableSet(new TreeSet<>(b.labels));
        languages = Collections.unmodifiableSet(new TreeSet<>(b.languages));
        minFollowing = b.minFollowing;
        minPosts = b.minPosts;
        minHandleDigits = b.minHandleDigits;
        minNameDigits = b.minNameDigits;
        warnedAccounts = b.warnedAccounts;
        bioMatchesLocation = b.bioMatchesLocation;
        linksMatchLocation = b.linksMatchLocation;
        alwaysShow = Collections.unmodifiableSet(new TreeSet<>(b.alwaysShow));
        alwaysShowFollowing = b.alwaysShowFollowing;
        highlight = b.highlight;
        highlightInLists = b.highlightInLists;
        hideRelatedPosts = b.hideRelatedPosts;
    }

    /** Number of separate filters, as the saved-filters list shows them; Always Show is not counted. */
    int size() {
        return locations.size() + accounts.size() + names.size() + bios.size() + affiliations.size() + links.size()
                + labels.size() + languages.size() + (minFollowing > 0 ? 1 : 0) + (minPosts > 0 ? 1 : 0)
                + (minHandleDigits > 0 ? 1 : 0) + (minNameDigits > 0 ? 1 : 0) + (warnedAccounts ? 1 : 0);
    }

    /** True when no filter is saved; Always Show alone filters nothing. */
    boolean isEmpty() {
        return size() == 0;
    }

    /**
     * True when a filter reads what only a profile carries: post counts, the website, or the
     * profile location matched by bio or link filters.
     */
    boolean needsProfileDetails() {
        return minPosts > 0 || !links.isEmpty() || bioMatchesLocation && !bios.isEmpty();
    }

    Builder toBuilder() {
        Builder b = new Builder();
        for (String location : locations) b.addLocation(location);
        for (Map.Entry<String, List<String>> e : regionCountries.entrySet()) b.setRegionCountries(e.getKey(), e.getValue());
        b.accounts.putAll(accounts);
        for (String s : names) b.addName(s);
        for (String s : bios) b.addBio(s);
        for (String s : affiliations) b.addAffiliation(s);
        b.links.addAll(links);
        b.labels.addAll(labels);
        b.languages.addAll(languages);
        b.minFollowing = minFollowing;
        b.minPosts = minPosts;
        b.minHandleDigits = minHandleDigits;
        b.minNameDigits = minNameDigits;
        b.warnedAccounts = warnedAccounts;
        b.bioMatchesLocation = bioMatchesLocation;
        b.linksMatchLocation = linksMatchLocation;
        b.alwaysShow.addAll(alwaysShow);
        b.alwaysShowFollowing = alwaysShowFollowing;
        b.highlight = highlight;
        b.highlightInLists = highlightInLists;
        b.hideRelatedPosts = hideRelatedPosts;
        return b;
    }

    String toJson() {
        try {
            JSONObject o = new JSONObject();
            o.put("v", VERSION);
            o.put("locations", new JSONArray(locations));
            JSONObject selections = new JSONObject();
            for (Map.Entry<String, List<String>> e : regionCountries.entrySet()) {
                selections.put(e.getKey(), new JSONArray(e.getValue()));
            }
            o.put("regionCountries", selections);
            JSONObject ids = new JSONObject();
            for (Map.Entry<Long, String> e : accounts.entrySet()) ids.put(String.valueOf(e.getKey()), e.getValue());
            o.put("accounts", ids);
            o.put("names", new JSONArray(names));
            o.put("bios", new JSONArray(bios));
            o.put("bioLocation", bioMatchesLocation);
            o.put("links", new JSONArray(links));
            o.put("linksLocation", linksMatchLocation);
            o.put("labels", new JSONArray(labels));
            o.put("affiliations", new JSONArray(affiliations));
            o.put("languages", new JSONArray(languages));
            o.put("minFollowing", minFollowing);
            o.put("minPosts", minPosts);
            o.put("minHandleDigits", minHandleDigits);
            o.put("minNameDigits", minNameDigits);
            o.put("warned", warnedAccounts);
            o.put("alwaysShow", new JSONArray(alwaysShow));
            o.put("alwaysShowFollowing", alwaysShowFollowing);
            o.put("highlight", highlight);
            o.put("highlightInLists", highlightInLists);
            o.put("hideRelated", hideRelatedPosts);
            return o.toString();
        } catch (JSONException e) {
            throw new IllegalStateException(e);
        }
    }

    /**
     * Reads saved filters. Entries that don't validate are dropped rather than failing the
     * whole set, so one bad value never turns every filter off.
     */
    static FilterRules fromJson(String json) {
        if (json == null) return EMPTY;
        JSONObject o;
        try {
            o = new JSONObject(json);
        } catch (JSONException e) {
            return EMPTY;
        }
        Builder b = new Builder();
        for (String s : strings(o.optJSONArray("locations"))) b.addLocation(s);
        JSONObject selections = o.optJSONObject("regionCountries");
        if (selections != null) {
            for (Iterator<String> it = selections.keys(); it.hasNext(); ) {
                String region = it.next();
                b.setRegionCountries(region, strings(selections.optJSONArray(region)));
            }
        }
        JSONObject ids = o.optJSONObject("accounts");
        if (ids != null) {
            for (Iterator<String> it = ids.keys(); it.hasNext(); ) {
                String id = it.next();
                try {
                    b.putAccount(Long.parseLong(id), ids.optString(id, ""));
                } catch (NumberFormatException ignored) {
                }
            }
        }
        for (String s : strings(o.optJSONArray("names"))) b.addName(s);
        for (String s : strings(o.optJSONArray("bios"))) b.addBio(s);
        for (String s : strings(o.optJSONArray("affiliations"))) b.addAffiliation(s);
        for (String s : strings(o.optJSONArray("links"))) b.addLink(s);
        for (String s : strings(o.optJSONArray("labels"))) b.addLabel(s);
        for (String s : strings(o.optJSONArray("languages"))) b.addLanguage(s);
        b.setMinFollowing(o.optLong("minFollowing", 0));
        b.setMinPosts(o.optLong("minPosts", 0));
        b.setMinHandleDigits(o.optInt("minHandleDigits", 0));
        b.setMinNameDigits(o.optInt("minNameDigits", 0));
        b.warnedAccounts = o.optBoolean("warned", false);
        b.bioMatchesLocation = o.optBoolean("bioLocation", false);
        b.linksMatchLocation = o.optBoolean("linksLocation", false);
        for (String s : strings(o.optJSONArray("alwaysShow"))) b.addAlwaysShow(s);
        b.alwaysShowFollowing = o.optBoolean("alwaysShowFollowing", false);
        b.highlight = o.optBoolean("highlight", true);
        b.highlightInLists = o.optBoolean("highlightInLists", false);
        b.hideRelatedPosts = o.optBoolean("hideRelated", false);
        return b.build();
    }

    private static List<String> strings(JSONArray array) {
        List<String> list = new ArrayList<>();
        if (array == null) return list;
        for (int i = 0; i < array.length() && i < MAX_ITEMS; i++) {
            Object v = array.opt(i);
            if (v instanceof String) list.add((String) v);
        }
        return list;
    }

    /** A mutable copy for edits. Every add validates and deduplicates like the saved form. */
    static final class Builder {
        /** Canonical key to the spelling saved. */
        private final Map<String, String> locations = new LinkedHashMap<>();
        private final Map<String, Set<String>> regionCountries = new TreeMap<>();
        private final Map<Long, String> accounts = new LinkedHashMap<>();
        /** Folded term to the text as entered. */
        private final Map<String, String> names = new LinkedHashMap<>(), bios = new LinkedHashMap<>(),
                affiliations = new LinkedHashMap<>();
        private final Set<String> links = new LinkedHashSet<>();
        private final Set<String> labels = new TreeSet<>(), languages = new TreeSet<>(), alwaysShow = new TreeSet<>();
        private long minFollowing, minPosts;
        private int minHandleDigits, minNameDigits;
        boolean warnedAccounts, bioMatchesLocation, linksMatchLocation, alwaysShowFollowing;
        boolean highlight = true;
        boolean highlightInLists, hideRelatedPosts;

        FilterRules build() {
            return new FilterRules(this);
        }

        /** Adds a country or region under its English name when known; false when it was already there. */
        boolean addLocation(String location) {
            if (location == null || location.trim().isEmpty() || locations.size() >= MAX_ITEMS) return false;
            String key = Countries.canonicalKey(location);
            if (locations.containsKey(key)) return false;
            locations.put(key, Countries.isKnownKey(key) ? Countries.displayName(key) : location.trim());
            return true;
        }

        /** Removes a country or region, with the country selection of a region. */
        void removeLocation(String location) {
            String key = Countries.canonicalKey(location);
            locations.remove(key);
            regionCountries.remove(key);
        }

        boolean hasLocation(String location) {
            return locations.containsKey(Countries.canonicalKey(location));
        }

        /**
         * Sets which countries a region also covers; null returns it to matching X's label only.
         * Names that aren't members of the region are dropped.
         */
        void setRegionCountries(String region, Collection<String> countries) {
            Countries.Region r = Countries.region(region);
            if (r == null) return;
            if (countries == null) {
                regionCountries.remove(r.key);
                return;
            }
            Set<String> selected = new TreeSet<>();
            for (String country : countries) {
                String key = Countries.canonicalKey(country);
                if (r.members.contains(key)) selected.add(key);
            }
            regionCountries.put(r.key, selected);
        }

        void putAccount(long userId, String handle) {
            if (userId <= 0 || accounts.size() >= MAX_ITEMS && !accounts.containsKey(userId)) return;
            String h = FilterText.handle(handle);
            accounts.put(userId, h != null ? h : "");
        }

        void removeAccount(long userId) {
            accounts.remove(userId);
        }

        boolean addName(String term) {
            return addTerm(names, term);
        }

        void removeName(String term) {
            names.remove(FilterText.term(term));
        }

        boolean addBio(String term) {
            return addTerm(bios, term);
        }

        void removeBio(String term) {
            bios.remove(FilterText.term(term));
        }

        boolean addAffiliation(String term) {
            String t = term == null ? null : term.trim();
            if (t != null && t.startsWith("@")) t = t.substring(1);
            return addTerm(affiliations, t);
        }

        void removeAffiliation(String term) {
            affiliations.remove(FilterText.term(term));
        }

        private static boolean addTerm(Map<String, String> list, String term) {
            String folded = FilterText.term(term);
            if (folded.isEmpty() || folded.length() > MAX_TERM || list.containsKey(folded) || list.size() >= MAX_ITEMS) return false;
            list.put(folded, term.trim());
            return true;
        }

        /** Adds a domain or exact URL; returns the saved form, or "" when the input is neither. */
        String addLink(String input) {
            String rule = Links.normalizeRule(input);
            if (rule.isEmpty() || links.size() >= MAX_ITEMS) return "";
            links.add(rule);
            return rule;
        }

        void removeLink(String rule) {
            links.remove(rule);
        }

        boolean addLabel(String label) {
            return LABELS.contains(label) && labels.add(label);
        }

        void removeLabel(String label) {
            labels.remove(label);
        }

        boolean addLanguage(String tag) {
            String code = FilterText.language(tag);
            if (code.isEmpty() || code.length() > 8 || code.equals("und")) return false;
            for (int i = 0; i < code.length(); i++) {
                if (code.charAt(i) < 'a' || code.charAt(i) > 'z') return false;
            }
            return languages.add(code);
        }

        void removeLanguage(String tag) {
            languages.remove(FilterText.language(tag));
        }

        /** Zero turns a threshold off; values are clamped to their valid range. */
        void setMinFollowing(long value) {
            minFollowing = Math.max(0, value);
        }

        void setMinPosts(long value) {
            minPosts = Math.max(0, value);
        }

        void setMinHandleDigits(int value) {
            minHandleDigits = Math.max(0, Math.min(MAX_HANDLE_DIGITS, value));
        }

        void setMinNameDigits(int value) {
            minNameDigits = Math.max(0, Math.min(MAX_NAME_DIGITS, value));
        }

        /** Adds a handle to Always Show; false when it isn't a handle or was already there. */
        boolean addAlwaysShow(String handle) {
            String h = FilterText.handle(handle);
            return h != null && alwaysShow.size() < MAX_ITEMS && alwaysShow.add(h);
        }

        void removeAlwaysShow(String handle) {
            String h = FilterText.handle(handle);
            if (h != null) alwaysShow.remove(h);
        }
    }
}
