package app.xposed.extension;

import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * The saved filters, in named profiles like X-Posed's filter profiles. Each signed-in X
 * account remembers its profile; an account without one uses Default. Readers get the
 * active profile's immutable {@link FilterRules} without locking; edits build a new
 * snapshot, save every profile as JSON and recompose every hooked post.
 */
final class Filters {
    enum Action {NONE, HIDE, HIGHLIGHT}

    interface Edit {
        void apply(FilterRules.Builder rules);
    }

    static final String DEFAULT_ID = "default";
    static final String DEFAULT_NAME = "Default";
    static final int MAX_PROFILES = 50, MAX_NAME = 40;

    /** One named set of filters. */
    static final class Profile {
        final String id, name;
        final FilterRules rules;

        Profile(String id, String name, FilterRules rules) {
            this.id = id;
            this.name = name;
            this.rules = rules;
        }

        boolean isDefault() {
            return DEFAULT_ID.equals(id);
        }
    }

    /** Every profile and which account uses which. Immutable; each change replaces it. */
    static final class State {
        /** In creation order, Default first. */
        final Map<String, Profile> profiles;
        /** X user id to the id of the profile that account uses. */
        final Map<Long, String> accounts;
        /**
         * The profile last selected on this device. Accounts that never chose one use it, as
         * does the app while it doesn't know the signed-in account yet. X-Posed learns that
         * account from the first post shown, so a choice made before then still applies.
         */
        final String editor;

        State(Map<String, Profile> profiles, Map<Long, String> accounts, String editor) {
            this.profiles = Collections.unmodifiableMap(profiles);
            this.accounts = Collections.unmodifiableMap(accounts);
            this.editor = profiles.containsKey(editor) ? editor : DEFAULT_ID;
        }

        State withProfile(Profile p) {
            Map<String, Profile> next = new LinkedHashMap<>(profiles);
            next.put(p.id, p);
            return new State(next, accounts, editor);
        }

        int size() {
            return profiles.size();
        }

        String name(String id) {
            return profiles.get(id).name;
        }

        FilterRules rules(String id) {
            return profiles.get(id).rules;
        }

        String editor() {
            return editor;
        }

        /** The profile an X account uses: its own choice, else the last one selected. 0 is an unknown account. */
        String profileFor(long account) {
            String id = account != 0 ? accounts.get(account) : null;
            return id != null && profiles.containsKey(id) ? id : editor;
        }

        String toJson() {
            try {
                JSONObject o = new JSONObject();
                o.put("v", VERSION);
                JSONArray array = new JSONArray();
                for (Profile p : profiles.values()) {
                    array.put(new JSONObject().put("id", p.id).put("name", p.name).put("rules", new JSONObject(p.rules.toJson())));
                }
                o.put("profiles", array);
                JSONObject ids = new JSONObject();
                for (Map.Entry<Long, String> e : accounts.entrySet()) ids.put(String.valueOf(e.getKey()), e.getValue());
                o.put("accounts", ids);
                o.put("editor", editor);
                return o.toString();
            } catch (JSONException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    private static final String KEY = "filter_profiles";
    private static final int VERSION = 1;
    /** Filters of a single profile, from before profiles existed (4.2.0). */
    private static final String LEGACY_RULES = "filters";
    /** Countries and regions, from before the other filter types existed. */
    private static final String LEGACY_LOCATIONS = "filter_locations";
    /** X-Posed's author, whom X-Posed adds to Always Show on first run. Once removed, he stays removed. */
    private static final String FIRST_RUN_ALWAYS_SHOW = "xaitax";
    private static final SecureRandom RANDOM = new SecureRandom();

    private static volatile State state;

    private Filters() {
    }

    /** The filters of the active profile; empty until settings are initialized. */
    static FilterRules rules() {
        return active().rules;
    }

    /** The profile of the signed-in account; see {@link State#profileFor}. */
    static Profile active() {
        State s = state();
        return s.profiles.get(activeId(s));
    }

    static List<Profile> profiles() {
        return new ArrayList<>(state().profiles.values());
    }

    /** X user ids of the accounts that chose this profile. */
    static List<Long> accountsUsing(String profileId) {
        List<Long> ids = new ArrayList<>();
        for (Map.Entry<Long, String> e : state().accounts.entrySet()) if (e.getValue().equals(profileId)) ids.add(e.getKey());
        return ids;
    }

    private static String activeId(State s) {
        return s.profileFor(Observed.viewer());
    }

    /** Applies an edit to the active profile, saves it and returns the new filters. */
    static synchronized FilterRules edit(Edit edit) {
        Profile p = active();
        FilterRules.Builder builder = p.rules.toBuilder();
        edit.apply(builder);
        FilterRules next = builder.build();
        save(state().withProfile(new Profile(p.id, p.name, next)));
        return next;
    }

    /** Puts back an earlier snapshot of a profile, for undo. Does nothing if it was deleted since. */
    static synchronized void restore(Profile previous) {
        State s = state();
        Profile current = s.profiles.get(previous.id);
        if (current != null) save(s.withProfile(new Profile(current.id, current.name, previous.rules)));
    }

    /** Uses a profile for the signed-in account, and while it is unknown. */
    static synchronized void select(String id) {
        State s = state();
        if (!s.profiles.containsKey(id)) return;
        Map<Long, String> accounts = new LinkedHashMap<>(s.accounts);
        long viewer = Observed.viewer();
        if (viewer != 0) accounts.put(viewer, id);
        save(new State(new LinkedHashMap<>(s.profiles), accounts, id));
    }

    /** Creates an empty profile and selects it. Throws with a message for the user when the name is not usable. */
    static synchronized String create(String name) {
        State s = state();
        String n = checkName(s, null, name);
        if (s.profiles.size() >= MAX_PROFILES) throw new IllegalArgumentException("You can save up to " + MAX_PROFILES + " profiles.");
        String id;
        do {
            id = "p" + Long.toString(RANDOM.nextLong() & Long.MAX_VALUE, 36);
        } while (s.profiles.containsKey(id));
        Map<String, Profile> profiles = new LinkedHashMap<>(s.profiles);
        profiles.put(id, new Profile(id, n, FilterRules.EMPTY));
        state = new State(profiles, s.accounts, s.editor);
        select(id);
        return id;
    }

    static synchronized void rename(String id, String name) {
        State s = state();
        Profile p = s.profiles.get(id);
        if (p == null) throw new IllegalArgumentException("This profile no longer exists.");
        save(s.withProfile(new Profile(p.id, checkName(s, id, name), p.rules)));
    }

    /** Deletes a profile; accounts that used it go back to Default. */
    static synchronized void delete(String id) {
        if (DEFAULT_ID.equals(id)) throw new IllegalArgumentException("The Default profile can't be deleted.");
        State s = state();
        if (!s.profiles.containsKey(id)) return;
        Map<String, Profile> profiles = new LinkedHashMap<>(s.profiles);
        profiles.remove(id);
        Map<Long, String> accounts = new LinkedHashMap<>();
        for (Map.Entry<Long, String> e : s.accounts.entrySet()) {
            accounts.put(e.getKey(), e.getValue().equals(id) ? DEFAULT_ID : e.getValue());
        }
        save(new State(profiles, accounts, id.equals(s.editor) ? DEFAULT_ID : s.editor));
    }

    /** The trimmed name, or an exception naming what is wrong with it. */
    static String checkName(String exceptId, String name) {
        return checkName(state(), exceptId, name);
    }

    private static String checkName(State s, String exceptId, String name) {
        String n = name == null ? "" : name.trim();
        int length = n.codePointCount(0, n.length());
        if (length == 0 || length > MAX_NAME) {
            throw new IllegalArgumentException("Profile names have 1 to " + MAX_NAME + " characters.");
        }
        for (int i = 0; i < n.length(); i++) {
            if (Character.isISOControl(n.charAt(i))) throw new IllegalArgumentException("Profile names can't contain control characters.");
        }
        for (Profile p : s.profiles.values()) {
            if (!p.id.equals(exceptId) && p.name.toLowerCase(Locale.ROOT).equals(n.toLowerCase(Locale.ROOT))) {
                throw new IllegalArgumentException("A profile with this name already exists.");
            }
        }
        return n;
    }

    /** What to do with a post that matched these reasons. */
    static Action action(int reasons) {
        if (reasons == 0) return Action.NONE;
        return rules().highlight ? Action.HIGHLIGHT : Action.HIDE;
    }

    private static void save(State next) {
        state = next;
        SharedPreferences prefs = Settings.prefs();
        if (prefs != null) prefs.edit().putString(KEY, next.toJson()).apply();
        States.changedAll();
    }

    private static State state() {
        State s = state;
        return s != null ? s : load();
    }

    private static synchronized State load() {
        if (state != null) return state;
        SharedPreferences prefs = Settings.prefs();
        if (prefs == null) return single(FilterRules.EMPTY);
        String json = prefs.getString(KEY, null);
        State s = json != null ? parse(json) : null;
        if (s == null) {
            s = single(migrate(prefs));
            prefs.edit().putString(KEY, s.toJson()).remove(LEGACY_RULES).remove(LEGACY_LOCATIONS)
                    .remove(Settings.LEGACY_FILTER_MODE).apply();
        }
        state = s;
        return s;
    }

    /**
     * The filters saved before profiles existed. A first run gets X-Posed's default Always
     * Show account; the hide or highlight choice moves from the global setting.
     */
    private static FilterRules migrate(SharedPreferences prefs) {
        String json = prefs.getString(LEGACY_RULES, null);
        FilterRules.Builder builder;
        if (json != null) {
            builder = FilterRules.fromJson(json).toBuilder();
        } else {
            builder = new FilterRules.Builder();
            Set<String> legacy = prefs.getStringSet(LEGACY_LOCATIONS, null);
            if (legacy != null) {
                for (String location : legacy) builder.addLocation(location);
            }
            builder.addAlwaysShow(FIRST_RUN_ALWAYS_SHOW);
        }
        builder.highlight = !"hide".equals(prefs.getString(Settings.LEGACY_FILTER_MODE, "highlight"));
        return builder.build();
    }

    private static State single(FilterRules rules) {
        Map<String, Profile> profiles = new LinkedHashMap<>();
        profiles.put(DEFAULT_ID, new Profile(DEFAULT_ID, DEFAULT_NAME, rules));
        return new State(profiles, new LinkedHashMap<>(), DEFAULT_ID);
    }

    /** Reads saved profiles, dropping entries that don't validate; null when unreadable. */
    static State parse(String json) {
        JSONObject o;
        try {
            o = new JSONObject(json);
        } catch (JSONException e) {
            return null;
        }
        JSONArray array = o.optJSONArray("profiles");
        Map<String, Profile> profiles = new LinkedHashMap<>();
        for (int i = 0; array != null && i < array.length() && profiles.size() < MAX_PROFILES; i++) {
            JSONObject p = array.optJSONObject(i);
            if (p == null) continue;
            String id = p.optString("id", "");
            JSONObject rules = p.optJSONObject("rules");
            if (!validId(id) || profiles.containsKey(id) || rules == null) continue;
            String name;
            try {
                name = checkName(new State(profiles, new LinkedHashMap<>(), DEFAULT_ID), null, p.optString("name", ""));
            } catch (IllegalArgumentException e) {
                if (!DEFAULT_ID.equals(id)) continue;
                name = DEFAULT_NAME;
            }
            profiles.put(id, new Profile(id, name, FilterRules.fromJson(rules.toString())));
        }
        if (!profiles.containsKey(DEFAULT_ID)) {
            Map<String, Profile> withDefault = new LinkedHashMap<>();
            withDefault.put(DEFAULT_ID, new Profile(DEFAULT_ID, DEFAULT_NAME, FilterRules.EMPTY));
            withDefault.putAll(profiles);
            profiles = withDefault;
        }
        Map<Long, String> accounts = new LinkedHashMap<>();
        JSONObject ids = o.optJSONObject("accounts");
        if (ids != null) {
            for (Iterator<String> it = ids.keys(); it.hasNext(); ) {
                String key = it.next();
                String id = ids.optString(key, "");
                try {
                    long account = Long.parseLong(key);
                    if (account > 0 && profiles.containsKey(id)) accounts.put(account, id);
                } catch (NumberFormatException ignored) {
                }
            }
        }
        return new State(profiles, accounts, o.optString("editor", DEFAULT_ID));
    }

    private static boolean validId(String id) {
        if (id.isEmpty() || id.length() > 64) return false;
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == '_' || c == '-')) return false;
        }
        return true;
    }
}
