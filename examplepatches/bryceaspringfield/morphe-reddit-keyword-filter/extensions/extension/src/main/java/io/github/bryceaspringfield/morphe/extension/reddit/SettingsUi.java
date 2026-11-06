package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.Strings.t;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.app.Dialog;
import android.content.Context;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.EditText;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Supplier;

/**
 * This bundle's rows in Settings > Morphe: the Keyword filter category after Ads, with screens for post types,
 * topics, subreddits, and profiles, and switches added to Morphe's own Navigation bar and Sidebar categories.
 */
final class SettingsUi {

    private static final String RULE_HELP = "One rule a line: r/name, u/name, flair:Meme, !flair:Meme, "
            + "\"whole phrase\", or any text.";
    private static final String COMMENT_HELP = "One rule a line: u/name, \"whole phrase\", or any text.";

    /** The three settings of a post type or flair: Off hides it, On shows it, Only shows it and hides the rest. */
    private static final String[] MODES = {MODE_HIDE, MODE_SHOW, MODE_ONLY};
    private static final String[] MODE_LABELS = {"Off", "On", "Only"};

    private interface Summary {
        String get();
    }

    private interface Click {
        void on(Preference preference);
    }

    private interface Getter {
        boolean get();
    }

    private interface Setter {
        void set(boolean on);
    }

    private interface Text {
        void on(String text);
    }

    /**
     * Stored post-type modes and range bounds, global or of one scope.
     */
    private interface Store {
        String get(String key);

        void set(String key, String value);
    }

    private static final Store GLOBAL_MODES = new Store() {
        public String get(String key) {
            return mode(key);
        }

        public void set(String key, String value) {
            putString(key, value);
        }
    };

    private static final Store GLOBAL_BOUNDS = new Store() {
        public String get(String key) {
            return getString(key, "");
        }

        public void set(String key, String value) {
            putString(key, value);
        }
    };

    private static Store scopeModes(String scope) {
        return new Store() {
            public String get(String key) {
                Scopes.Entry entry = Scopes.all().get(scope);
                return entry == null ? MODE_SHOW : entry.mode(key);
            }

            public void set(String key, String value) {
                Scopes.Entry entry = Scopes.edit(scope);
                Scopes.Entry.setMode(entry.types, key, value);
                Scopes.save(scope, entry);
            }
        };
    }

    private static Store scopeBounds(String scope) {
        return new Store() {
            public String get(String key) {
                Scopes.Entry entry = Scopes.all().get(scope);
                String value = entry == null ? null : entry.bounds.get(key);
                return value == null ? "" : value;
            }

            public void set(String key, String value) {
                Scopes.Entry entry = Scopes.edit(scope);
                entry.setBound(key, value);
                Scopes.save(scope, entry);
            }
        };
    }

    private SettingsUi() {
    }

    static void add(PreferenceFragment fragment) {
        PreferenceScreen screen = fragment.getPreferenceScreen();
        Context context = fragment.getActivity();
        PreferenceManager manager = fragment.getPreferenceManager();
        if (screen == null || context == null || manager == null) return;
        SCREENS.clear();
        SCREENS.add(screen);
        Profiles.morpheFile(manager.getSharedPreferencesName());
        Profiles.checkAccount();

        PreferenceScreen filterScreen = screen(context, manager, screen, "Keyword filter");
        placeAfter(screen, filterScreen, categoryHolding(screen, "morphe_hide_post_ads"));
        PreferenceCategory filter = newCategory(context, filterScreen, "Posts");
        item(context, filter, "Keywords to hide", () -> rulesSummary(Scopes.rulesOf(POST_RULES, "")),
                p -> editRules(context, p, POST_RULES, "", "Keywords to hide", RULE_HELP, null));
        addChecks(context, manager, filter, "Keywords apply to", FIELDS, FIELD_KEYS, FIELD_LABELS,
                FilterSettings::fields, "Nothing");
        PreferenceScreen types = screen(context, manager, filter, "Post types");
        types.setSummary(typesSummary(GLOBAL_MODES));
        addTypes(context, types, GLOBAL_MODES, () -> types.setSummary(typesSummary(GLOBAL_MODES)));
        addRanges(context, filter, GLOBAL_BOUNDS, null);
        toggle(context, filter, "Hide duplicate posts", () -> getBoolean(HIDE_DUPLICATES),
                on -> putBoolean(HIDE_DUPLICATES, on))
                .setSummary(t("Hides a post with the same title, text, or media as one already shown since Reddit started, such as the same post shared to several communities."));
        addTopics(context, manager, filter);
        addChecks(context, manager, filter, "Where post filters apply", PLACES, PLACE_KEYS, PLACE_LABELS,
                FilterSettings::places, "Nowhere");
        PreferenceCategory sources = newCategory(context, filterScreen, "Subreddits and profiles");
        addScopeList(context, manager, sources, "r/");
        addScopeList(context, manager, sources, "u/");
        toggle(context, sources, "Hide posts and comments by deleted accounts", () -> getBoolean(HIDE_DELETED),
                on -> putBoolean(HIDE_DELETED, on));
        PreferenceCategory comments = newCategory(context, filterScreen, "Comments");
        item(context, comments, "Comment keywords to hide", () -> rulesSummary(Scopes.rulesOf(COMMENT_RULES, "")),
                p -> editRules(context, p, COMMENT_RULES, "", "Comment keywords to hide", COMMENT_HELP, null));
        item(context, comments, "Comment score",
                () -> rangeSummary(GLOBAL_BOUNDS, COMMENT_SCORE_MIN, COMMENT_SCORE_MAX),
                p -> editRange(context, p, "Comment score", GLOBAL_BOUNDS, COMMENT_SCORE_MIN, COMMENT_SCORE_MAX,
                        null));

        PreferenceCategory navigation = morpheCategory(context, screen, "morphe_hide_chat_button",
                "morphe_screen_navigation_bar_title", "Navigation bar");
        toggle(context, navigation, "Hide Inbox button", () -> getBoolean(HIDE_INBOX_TAB), on -> {
            putBoolean(HIDE_INBOX_TAB, on);
            restartNeeded();
        });
        toggle(context, navigation, "Keep bars shown while scrolling", () -> getBoolean(KEEP_BARS),
                on -> putBoolean(KEEP_BARS, on));

        PreferenceCategory videos = newCategory(context, screen, "Media");
        toggle(context, videos, "Play media links inside Reddit", () -> getBoolean(MEDIA_LINKS),
                on -> putBoolean(MEDIA_LINKS, on))
                .setSummary(t("Opens imgur, Streamable, RedGIFs, Gfycat, Giphy, and direct image or video links in a player, for older posts Reddit shows as plain links."));
        toggle(context, videos, "Hide the 18+ caution", () -> getBoolean(NO_NSFW_BLUR), on -> {
            putBoolean(NO_NSFW_BLUR, on);
            restartNeeded();
        }).setSummary(t("Shows 18+ posts' images and videos without the blur and the tap to view."));
        adopt(screen, videos, "morphe_remove_nsfw_dialog");
        toggle(context, videos, "Captions on by default", () -> getBoolean(CAPTIONS_ON),
                on -> putBoolean(CAPTIONS_ON, on))
                .setSummary(t("Turns captions on each time Reddit starts; turning them off holds until Reddit restarts."));

        // Morphe's own search switches (the Ask button, the Trending shelves) move into a Search screen of their own.
        if (Branding.available()) {
            PreferenceCategory branding = newCategory(context, screen, "Branding");
            toggle(context, branding, "Morphe loading animation", () -> getBoolean(MORPHE_LOADER), on -> {
                putBoolean(MORPHE_LOADER, on);
                restartNeeded();
            }).setSummary(t("Shows Morphe's animation in place of Reddit's while pages load."));
            toggle(context, branding, "Morphe logo", () -> getBoolean(MORPHE_LOGO), on -> {
                putBoolean(MORPHE_LOGO, on);
                restartNeeded();
            }).setSummary(t("Shows the Morphe logo in place of Reddit's Snoo, as in the search bar."));
        }

        PreferenceCategory search = newCategory(context, screen, "Search");
        adopt(screen, search, "morphe_hide_ask_button");
        adopt(screen, search, "morphe_hide_trending_shelves");

        PreferenceCategory sidebar = morpheCategory(context, screen, "morphe_hide_recently_visited_shelf",
                "morphe_screen_sidebar_title", "Sidebar");
        // Morphe's own Recently Visited switch replaces ours; a row hidden with ours stays hidden through it.
        Preference morpheRecent = screen.findPreference("morphe_hide_recently_visited_shelf");
        Set<String> hiddenRows = getSet(SIDEBAR_HIDDEN, Collections.emptySet());
        if (morpheRecent instanceof SwitchPreference && hiddenRows.contains(SIDEBAR_RECENT)) {
            ((SwitchPreference) morpheRecent).setChecked(true);
            Set<String> rest = new HashSet<>(hiddenRows);
            rest.remove(SIDEBAR_RECENT);
            putSet(SIDEBAR_HIDDEN, rest);
        }
        for (int i = 0; i < SIDEBAR_KEYS.length; i++) {
            String row = SIDEBAR_KEYS[i];
            if (row.equals(SIDEBAR_RECENT) && morpheRecent != null) continue;
            String label = row.equals(SIDEBAR_RECENT) ? null : morpheString(context, row);
            toggle(context, sidebar, label == null ? SIDEBAR_SWITCH_TITLES[i] : Strings.f("Hide %s", label),
                    () -> getSet(SIDEBAR_HIDDEN, Collections.emptySet()).contains(row),
                    on -> {
                        Set<String> rows = new HashSet<>(getSet(SIDEBAR_HIDDEN, Collections.emptySet()));
                        if (on) rows.add(row);
                        else rows.remove(row);
                        putSet(SIDEBAR_HIDDEN, rows);
                    });
        }
        toggle(context, sidebar, "Hide sidebar button badge", () -> getBoolean(HIDE_MENU_BADGE), on -> {
            putBoolean(HIDE_MENU_BADGE, on);
            restartNeeded();
        });

        addProfiles(context, screen);

        nestCategories(context, manager, screen);
    }

    // region Profiles

    /**
     * Named copies of every setting: the profile in use, a new one from the settings in force, renaming, deleting,
     * and the profile each signed-in account switches to.
     */
    private static void addProfiles(Context context, PreferenceScreen screen) {
        PreferenceCategory profiles = newCategory(context, screen, "Profiles");
        placeAfter(screen, profiles, null);
        item(context, profiles, "Profile in use", () -> profileLabel(Profiles.active()), p -> {
            List<String> names = Profiles.names();
            Dialogs.choose(context, t("Profile in use"), profileLabels(names), names.indexOf(Profiles.active()),
                    which -> reopen(context, Profiles.switchTo(names.get(which))));
        });
        item(context, profiles, "New profile from these settings", () -> t("Copies the settings in force and switches to the copy."),
                p -> askText(context, t("New profile from these settings"), "Name", name -> {
                    if (Profiles.create(name)) reopen(context, false);
                    else Dialogs.toast(context, t("That name is empty or taken"));
                }));
        item(context, profiles, "Rename this profile", () -> null, p -> {
            String from = Profiles.active();
            if (from.equals(Profiles.DEFAULT)) {
                Dialogs.toast(context, t("The Default profile keeps its name"));
                return;
            }
            askText(context, t("Rename this profile"), from, name -> {
                if (Profiles.rename(from, name)) reopen(context, false);
                else Dialogs.toast(context, t("That name is empty or taken"));
            });
        });
        item(context, profiles, "Delete a profile", () -> null, p -> {
            List<String> names = new ArrayList<>(Profiles.names());
            names.remove(Profiles.DEFAULT);
            names.remove(Profiles.active());
            if (names.isEmpty()) {
                Dialogs.toast(context, t("No profile to delete; the one in use and Default stay"));
                return;
            }
            Dialogs.choose(context, t("Delete a profile"), names.toArray(new String[0]), -1,
                    which -> {
                        Profiles.delete(names.get(which));
                        redraw();
                    });
        });
        item(context, profiles, "Profile for each account", SettingsUi::assignedSummary, p -> {
            Set<String> signedIn = new java.util.TreeSet<>(Accounts.names());
            signedIn.addAll(Profiles.assigned().keySet());
            String current = Profiles.currentAccount();
            if (current != null) signedIn.add(current);
            if (signedIn.isEmpty()) {
                Dialogs.toast(context, t("No Reddit account is signed in"));
                return;
            }
            List<String> accounts = new ArrayList<>(signedIn);
            String[] labels = new String[accounts.size()];
            for (int i = 0; i < labels.length; i++) {
                String profile = Profiles.assigned().get(accounts.get(i));
                labels[i] = "u/" + accounts.get(i) + " · " + (profile == null ? t("No profile") : profileLabel(profile));
            }
            Dialogs.choose(context, t("Profile for each account"), labels, -1, which -> {
                String account = accounts.get(which);
                List<String> names = Profiles.names();
                String[] choices = new String[names.size() + 1];
                choices[0] = t("No profile");
                System.arraycopy(profileLabels(names), 0, choices, 1, names.size());
                String profile = Profiles.assigned().get(account);
                Dialogs.choose(context, "u/" + account, choices, profile == null ? 0 : names.indexOf(profile) + 1,
                        pick -> {
                            Profiles.assign(account, pick == 0 ? null : names.get(pick - 1));
                            p.setSummary(assignedSummary());
                            redraw();
                        });
            });
        }).setSummary(assignedSummary());
    }

    private static String profileLabel(String name) {
        return name.equals(Profiles.DEFAULT) ? t(Profiles.DEFAULT) : name;
    }

    private static String[] profileLabels(List<String> names) {
        String[] labels = new String[names.size()];
        for (int i = 0; i < labels.length; i++) labels[i] = profileLabel(names.get(i));
        return labels;
    }

    private static String assignedSummary() {
        Map<String, String> assigned = Profiles.assigned();
        if (assigned.isEmpty()) return t("Each account keeps the profile in use.");
        List<String> parts = new ArrayList<>();
        for (Map.Entry<String, String> entry : assigned.entrySet()) {
            parts.add("u/" + entry.getKey() + ": " + profileLabel(entry.getValue()));
        }
        return String.join(", ", parts);
    }

    /** Reloads the settings page with the profile's settings, and asks for a restart when Morphe's changed. */
    private static void reopen(Context context, boolean morpheChanged) {
        if (morpheChanged) restartNeeded();
        if (context instanceof android.app.Activity) ((android.app.Activity) context).recreate();
        else redraw();
    }

    // endregion

    // region Groups of rows

    /**
     * A row for each post type, set Off, On, or Only.
     */
    private static void addTypes(Context context, PreferenceGroup group, Store modes, Runnable changed) {
        for (int i = 0; i < TYPE_KEYS.length; i++) {
            String key = TYPE_KEYS[i];
            threeWay(context, group, null, TYPE_LABELS[i], () -> modes.get(key), mode -> {
                modes.set(key, mode);
                run(changed);
            });
        }
    }

    private static void addRanges(Context context, PreferenceGroup group, Store bounds, Runnable changed) {
        item(context, group, "Score", () -> rangeSummary(bounds, POST_SCORE_MIN, POST_SCORE_MAX),
                p -> editRange(context, p, "Score", bounds, POST_SCORE_MIN, POST_SCORE_MAX, changed));
        item(context, group, "Number of comments",
                () -> rangeSummary(bounds, POST_COMMENTS_MIN, POST_COMMENTS_MAX),
                p -> editRange(context, p, "Number of comments", bounds, POST_COMMENTS_MIN, POST_COMMENTS_MAX,
                        changed));
    }

    /**
     * A screen of checkboxes choosing a set of keys.
     */
    private static void addChecks(Context context, PreferenceManager manager, PreferenceGroup parent, String title,
                                  String setKey, String[] keys, String[] labels, Supplier<Set<String>> current,
                                  String none) {
        PreferenceScreen checks = screen(context, manager, parent, title);
        checks.setSummary(labelsOf(current.get(), keys, labels, none));
        for (int i = 0; i < keys.length; i++) {
            String key = keys[i];
            check(context, checks, labels[i], current.get().contains(key), on -> {
                Set<String> chosen = new HashSet<>(current.get());
                if (on) chosen.add(key);
                else chosen.remove(key);
                putSet(setKey, chosen);
                checks.setSummary(labelsOf(chosen, keys, labels, none));
                redraw();
            });
        }
    }

    private static void addTopics(Context context, PreferenceManager manager, PreferenceGroup parent) {
        PreferenceScreen topics = screen(context, manager, parent, "Hide communities by topic");
        topics.setSummary(topicsSummary());
        Runnable changed = () -> topics.setSummary(topicsSummary());
        for (int i = 0; i < Topics.KEYS.length; i++) {
            String key = Topics.KEYS[i];
            check(context, topics, Topics.LABELS[i], Topics.chosen(getSet(TOPICS, Collections.emptySet()), key),
                    on -> {
                        Set<String> chosen = new HashSet<>(getSet(TOPICS, Collections.emptySet()));
                        chosen.remove(key);
                        if (key.equals("fascism")) chosen.remove(Topics.LEGACY_NAZISM);
                        if (on) chosen.add(key);
                        putSet(TOPICS, chosen);
                        run(changed);
                    });
        }
        item(context, topics, "Your own list", SettingsUi::topicExtraSummary,
                p -> editTopicExtra(context, p, changed));
    }

    /**
     * The screen listing every subreddit ("r/") or profile ("u/") with filters, each opening its own screen.
     */
    private static void addScopeList(Context context, PreferenceManager manager, PreferenceGroup parent, String kind) {
        boolean community = kind.equals("r/");
        PreferenceScreen list = screen(context, manager, parent, community ? "Subreddit filters" : "Profile filters");
        list.setSummary(listSummary(kind));
        Runnable listChanged = () -> list.setSummary(listSummary(kind));
        String addTitle = community ? "Add a subreddit" : "Add a profile";
        item(context, list, addTitle, () -> null, p -> askText(context, addTitle, kind + "name", text -> {
            String name = text.trim().toLowerCase(Locale.ROOT);
            if (name.startsWith(kind)) name = name.substring(2);
            if (name.isEmpty() || name.contains(" ") || name.contains("/")) return;
            String scope = Rules.scopeKey(kind + name);
            if (list.findPreference(scope) != null) return;
            Scopes.save(scope, Scopes.edit(scope));
            addScope(context, manager, list, scope, listChanged);
            run(listChanged);
        }));
        for (String scope : Scopes.scopes(kind)) addScope(context, manager, list, scope, listChanged);
    }

    private static void addScope(Context context, PreferenceManager manager, PreferenceGroup parent, String scope,
                                 Runnable listChanged) {
        boolean community = scope.startsWith("r/");
        PreferenceScreen screen = screen(context, manager, parent, scope);
        screen.setKey(scope);
        screen.setSummary(scopeSummary(scope));
        Runnable changed = () -> {
            screen.setSummary(scopeSummary(scope));
            run(listChanged);
        };

        toggle(context, screen, community ? "Hide all posts" : "Hide all posts and comments",
                () -> Scopes.hiddenWhole(scope), on -> {
                    Scopes.setHiddenWhole(scope, on);
                    run(changed);
                });
        item(context, screen, "Keywords to hide", () -> rulesSummary(Scopes.rulesOf(POST_RULES, scope)),
                p -> editRules(context, p, POST_RULES, scope, "Keywords to hide", RULE_HELP, changed));
        item(context, screen, "Comment keywords to hide", () -> rulesSummary(Scopes.rulesOf(COMMENT_RULES, scope)),
                p -> editRules(context, p, COMMENT_RULES, scope, "Comment keywords to hide", COMMENT_HELP, changed));
        addRanges(context, screen, scopeBounds(scope), changed);

        PreferenceCategory types = newCategory(context, screen, "Post types");
        addTypes(context, types, scopeModes(scope), changed);

        if (community) {
            PreferenceCategory flairs = newCategory(context, screen, "Flairs");
            for (String flair : Scopes.flairsOf(scope.substring(2), Scopes.edit(scope))) {
                addFlair(context, flairs, scope, flair, changed);
            }
            item(context, flairs, "Add a flair", () -> null, p -> askText(context, "Add a flair", "Flair", text -> {
                String flair = Rules.flairKey(text);
                if (flair.isEmpty() || flairs.findPreference("flair:" + flair) != null) return;
                addFlair(context, flairs, scope, flair, changed).getOnPreferenceClickListener()
                        .onPreferenceClick(flairs.findPreference("flair:" + flair));
            }));
        }

        Preference remove = item(context, screen, "Remove all filters", () -> null, p ->
                Dialogs.show(context, Strings.f("Remove all filters for %s?", scope), null, Collections.emptyList(), () -> {
                    Scopes.clear(scope);
                    Dialog open = screen.getDialog();
                    if (open != null) open.dismiss();
                    parent.removePreference(screen);
                    run(listChanged);
                }, null, null));
        remove.setOrder(Integer.MAX_VALUE);
    }

    private static Preference addFlair(Context context, PreferenceGroup group, String scope, String flair,
                                       Runnable changed) {
        return threeWay(context, group, "flair:" + flair, flair, () -> Scopes.edit(scope).flairMode(flair), mode -> {
            Scopes.Entry entry = Scopes.edit(scope);
            Scopes.Entry.setMode(entry.flairs, flair, mode);
            Scopes.save(scope, entry);
            run(changed);
        });
    }

    // endregion

    // region Summaries

    private static String modeLabel(String mode) {
        int index = Arrays.asList(MODES).indexOf(mode);
        return t(MODE_LABELS[index < 0 ? 1 : index]);
    }

    private static String rulesSummary(List<String> lines) {
        int count = lines.size();
        return count == 0 ? t("None") : Strings.count(count, "rule", "rules");
    }

    private static String typesSummary(Store modes) {
        List<String> parts = new ArrayList<>();
        for (int i = 0; i < TYPE_KEYS.length; i++) {
            String mode = modes.get(TYPE_KEYS[i]);
            if (!MODE_SHOW.equals(mode)) parts.add(t(TYPE_LABELS[i]) + ": " + modeLabel(mode));
        }
        return parts.isEmpty() ? t("All on") : String.join(", ", parts);
    }

    private static String labelsOf(Set<String> chosen, String[] keys, String[] labels, String none) {
        List<String> names = new ArrayList<>();
        for (int i = 0; i < keys.length; i++) {
            if (chosen.contains(keys[i])) names.add(t(labels[i]));
        }
        if (names.size() == keys.length) return t("All");
        return names.isEmpty() ? t(none) : String.join(", ", names);
    }

    private static String topicsSummary() {
        Set<String> topics = getSet(TOPICS, Collections.emptySet());
        List<String> names = new ArrayList<>();
        for (int i = 0; i < Topics.KEYS.length; i++) {
            if (Topics.chosen(topics, Topics.KEYS[i])) names.add(t(Topics.LABELS[i]));
        }
        int extra = Filter.topicExtra().size();
        if (extra > 0) names.add(t("your list"));
        return names.isEmpty() ? t("None") : String.join("; ", names);
    }

    private static String topicExtraSummary() {
        int count = Filter.topicExtra().size();
        return count == 0 ? t("None") : Strings.count(count, "community", "communities");
    }

    private static Long parseBound(String value) {
        value = value == null ? "" : value.trim().replace(",", "");
        if (value.isEmpty()) return null;
        try {
            return Long.parseLong(value);
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    /**
     * The range of values shown: "Any", "50 or more", "10 or fewer", or "5 to 50".
     */
    private static String rangeSummary(Store bounds, String minKey, String maxKey) {
        Long min = parseBound(bounds.get(minKey));
        Long max = parseBound(bounds.get(maxKey));
        if (min == null && max == null) return t("Any");
        if (max == null) return Strings.f("%s or more", min);
        if (min == null) return Strings.f("%s or fewer", max);
        return Strings.f("%s to %s", min, max);
    }

    private static String listSummary(String kind) {
        List<String> scopes = new ArrayList<>(Scopes.scopes(kind));
        if (scopes.isEmpty()) return t("None");
        String first = String.join(", ", scopes.subList(0, Math.min(3, scopes.size())));
        return scopes.size() <= 3 ? first : Strings.f("%s, and %s more", first, scopes.size() - 3);
    }

    /**
     * One short line naming the filters of a subreddit or profile.
     */
    static String scopeSummary(String scope) {
        List<String> parts = new ArrayList<>();
        if (Scopes.hiddenWhole(scope)) parts.add(t("all hidden"));
        int posts = Scopes.rulesOf(POST_RULES, scope).size() + Scopes.rulesOf(COMMENT_RULES, scope).size();
        if (posts > 0) parts.add(Strings.count(posts, "rule", "rules"));
        Scopes.Entry entry = Scopes.all().get(scope);
        if (entry != null) {
            int types = 0;
            for (String key : TYPE_KEYS) if (!MODE_SHOW.equals(entry.mode(key))) types++;
            if (types > 0) parts.add(Strings.count(types, "post type", "post types"));
            int flairs = 0;
            for (Map.Entry<String, String> flair : entry.flairs.entrySet()) {
                if (!MODE_SHOW.equals(flair.getValue())) flairs++;
            }
            if (flairs > 0) parts.add(Strings.count(flairs, "flair", "flairs"));
            Store bounds = scopeBounds(scope);
            if (!rangeSummary(bounds, POST_SCORE_MIN, POST_SCORE_MAX).equals(t("Any"))) parts.add(t("score"));
            if (!rangeSummary(bounds, POST_COMMENTS_MIN, POST_COMMENTS_MAX).equals(t("Any"))) parts.add(t("comments"));
        }
        if (parts.isEmpty()) return t("No filters");
        String text = String.join(", ", parts);
        return Character.toUpperCase(text.charAt(0)) + text.substring(1);
    }

    // endregion

    // region Rows and dialogs

    /**
     * Asks Morphe's settings screen for its restart dialog when the screen closes, as Morphe's own switches
     * needing a restart do.
     */
    private static void restartNeeded() {
        try {
            Class.forName("app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment")
                    .getMethod("setRestartNeeded").invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "Could not ask for Morphe's restart dialog", ex);
        }
    }

    /**
     * Every screen of these settings: the Morphe page and each nested screen. Android redraws a nested screen's
     * summary in its parent list only when the parent's adapter is told the data changed.
     */
    private static final List<PreferenceScreen> SCREENS = new ArrayList<>();

    private static void redraw() {
        for (PreferenceScreen screen : SCREENS) {
            if (screen.getRootAdapter() instanceof BaseAdapter) ((BaseAdapter) screen.getRootAdapter()).notifyDataSetChanged();
        }
    }

    private static void run(Runnable runnable) {
        if (runnable != null) runnable.run();
        redraw();
    }

    private static PreferenceCategory newCategory(Context context, PreferenceGroup group, String title) {
        PreferenceCategory category = new PreferenceCategory(context);
        category.setTitle(t(title));
        group.addPreference(category);
        return category;
    }

    /**
     * A nested screen, opened with a toolbar like Morphe's settings page.
     */
    private static PreferenceScreen screen(Context context, PreferenceManager manager, PreferenceGroup parent,
                                           String title) {
        PreferenceScreen screen = manager.createPreferenceScreen(context);
        screen.setTitle(t(title));
        screen.setPersistent(false);
        parent.addPreference(screen);
        Dialogs.screen(screen);
        SCREENS.add(screen);
        return screen;
    }

    /**
     * The screen's category holding the preference {@code key}, or null.
     */
    private static PreferenceCategory categoryHolding(PreferenceScreen screen, String key) {
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            Preference child = screen.getPreference(i);
            if (child instanceof PreferenceCategory && ((PreferenceCategory) child).findPreference(key) != null) {
                return (PreferenceCategory) child;
            }
        }
        return null;
    }

    /**
     * The app's string resource {@code name} (one Morphe Patches adds), or null.
     */
    private static String morpheString(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
        return id == 0 ? null : context.getString(id);
    }

    /** Moves Morphe's preference {@code key}, wherever its category holds it, into {@code target}. */
    private static void adopt(PreferenceScreen screen, PreferenceCategory target, String key) {
        PreferenceCategory holder = categoryHolding(screen, key);
        if (holder == null || holder == target) return;
        Preference preference = holder.findPreference(key);
        holder.removePreference(preference);
        target.addPreference(preference);
    }

    private static PreferenceCategory categoryTitled(Context context, PreferenceScreen screen, String titleName) {
        String title = morpheString(context, titleName);
        if (title == null) return null;
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            Preference child = screen.getPreference(i);
            if (child instanceof PreferenceCategory && child.getTitle() != null
                    && title.contentEquals(child.getTitle())) {
                return (PreferenceCategory) child;
            }
        }
        return null;
    }

    /**
     * Morphe's category holding {@code key}, else a new category with Morphe's title (or {@code fallback}).
     */
    private static PreferenceCategory morpheCategory(Context context, PreferenceScreen screen, String key,
                                                     String titleName, String fallback) {
        PreferenceCategory category = categoryHolding(screen, key);
        if (category != null) return category;
        category = categoryTitled(context, screen, titleName);
        if (category != null) return category;
        String title = morpheString(context, titleName);
        return newCategory(context, screen, title == null ? t(fallback) : title);
    }

    /**
     * Moves {@code category} right after {@code anchor} (to the top when anchor is null); the screen sorts its
     * categories by order when the list is drawn.
     */
    private static void placeAfter(PreferenceScreen screen, Preference category, Preference anchor) {
        int base = anchor == null ? -1 : anchor.getOrder();
        for (int i = 0; i < screen.getPreferenceCount(); i++) {
            Preference child = screen.getPreference(i);
            if (child != category && child.getOrder() > base) child.setOrder(child.getOrder() + 1);
        }
        category.setOrder(base + 1);
    }

    /**
     * Turns each category of the main list into a row opening a screen of its own, holding the category's rows, the
     * layout of Morphe's YouTube settings.
     */
    private static void nestCategories(Context context, PreferenceManager manager, PreferenceScreen root) {
        List<PreferenceCategory> categories = new ArrayList<>();
        for (int i = 0; i < root.getPreferenceCount(); i++) {
            Preference child = root.getPreference(i);
            if (child instanceof PreferenceCategory) categories.add((PreferenceCategory) child);
        }
        for (PreferenceCategory category : categories) {
            int order = category.getOrder();
            CharSequence title = category.getTitle();
            List<Preference> rows = new ArrayList<>();
            for (int i = 0; i < category.getPreferenceCount(); i++) rows.add(category.getPreference(i));
            root.removePreference(category);
            if (rows.isEmpty()) continue;
            PreferenceScreen nested = screen(context, manager, root, title == null ? "" : title.toString());
            nested.setOrder(order);
            if (category.getKey() != null) nested.setKey(category.getKey() + "_screen");
            for (Preference row : rows) {
                category.removePreference(row);
                nested.addPreference(row);
            }
        }
    }

    private static Preference item(Context context, PreferenceGroup group, String title, Summary summary, Click click) {
        Preference preference = new Preference(context);
        preference.setTitle(t(title));
        preference.setPersistent(false);
        group.addPreference(preference);
        preference.setSummary(summary.get());
        preference.setOnPreferenceClickListener(p -> {
            try {
                click.on(p);
            } catch (Exception ex) {
                Log.e(TAG, "Settings dialog failure", ex);
            }
            return true;
        });
        return preference;
    }

    /**
     * A row set Off, On, or Only from Morphe's list dialog, its summary the setting chosen.
     */
    private static Preference threeWay(Context context, PreferenceGroup group, String key, String title,
                                       Supplier<String> get, java.util.function.Consumer<String> set) {
        Preference row = new Preference(context);
        if (key != null) row.setKey(key);
        row.setPersistent(false);
        row.setTitle(t(title));
        group.addPreference(row);
        row.setSummary(modeLabel(get.get()));
        row.setOnPreferenceClickListener(p -> {
            Dialogs.choose(context, t(title), t(MODE_LABELS), Arrays.asList(MODES).indexOf(get.get()), which -> {
                set.accept(MODES[which]);
                row.setSummary(t(MODE_LABELS[which]));
            });
            return true;
        });
        return row;
    }

    /**
     * A switch like Morphe's own, stored in this bundle's settings file.
     */
    private static SwitchPreference toggle(Context context, PreferenceGroup group, String title, Getter getter,
                                           Setter setter) {
        SwitchPreference preference = new SwitchPreference(context);
        preference.setPersistent(false);
        preference.setTitle(t(title));
        group.addPreference(preference);
        preference.setChecked(getter.get());
        preference.setOnPreferenceChangeListener((p, value) -> {
            try {
                setter.set((Boolean) value);
            } catch (Exception ex) {
                Log.e(TAG, "Settings switch failure", ex);
            }
            return true;
        });
        return preference;
    }

    private static CheckBoxPreference check(Context context, PreferenceGroup group, String title, boolean checked,
                                            Setter setter) {
        CheckBoxPreference box = new CheckBoxPreference(context);
        box.setPersistent(false);
        box.setTitle(t(title));
        group.addPreference(box);
        box.setChecked(checked);
        box.setOnPreferenceChangeListener((p, value) -> {
            try {
                setter.set((Boolean) value);
            } catch (Exception ex) {
                Log.e(TAG, "Settings checkbox failure", ex);
            }
            return true;
        });
        return box;
    }

    private static EditText multiLine(Context context, String text, String hint) {
        EditText editor = Dialogs.editText(context);
        editor.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        editor.setSingleLine(false);
        editor.setMinLines(4);
        editor.setText(text);
        editor.setHint(t(hint));
        return editor;
    }

    private static void askText(Context context, String title, String hint, Text done) {
        EditText editor = Dialogs.editText(context);
        editor.setSingleLine(true);
        editor.setHint(t(hint));
        Dialogs.show(context, title, null, Collections.singletonList(editor),
                () -> done.on(editor.getText().toString()), null, null);
    }

    private static void editRules(Context context, Preference preference, String listKey, String scope, String title,
                                  String help, Runnable changed) {
        EditText editor = multiLine(context, String.join("\n", Scopes.rulesOf(listKey, scope)), "");
        Dialogs.show(context, title, help, Collections.singletonList(editor), () -> {
            Scopes.setRulesOf(listKey, scope, editor.getText().toString());
            preference.setSummary(rulesSummary(Scopes.rulesOf(listKey, scope)));
            run(changed);
        }, null, null);
    }

    private static void editRange(Context context, Preference preference, String title, Store bounds, String minKey,
                                  String maxKey, Runnable changed) {
        EditText min = Dialogs.editText(context);
        min.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
        min.setHint(t("Lowest shown"));
        min.setText(bounds.get(minKey));
        EditText max = Dialogs.editText(context);
        max.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_SIGNED);
        max.setHint(t("Highest shown"));
        max.setText(bounds.get(maxKey));
        Runnable save = () -> {
            preference.setSummary(rangeSummary(bounds, minKey, maxKey));
            run(changed);
        };
        Dialogs.show(context, title, null, Arrays.<View>asList(min, max), () -> {
            bounds.set(minKey, min.getText().toString().trim());
            bounds.set(maxKey, max.getText().toString().trim());
            save.run();
        }, "Clear", () -> {
            bounds.set(minKey, "");
            bounds.set(maxKey, "");
            save.run();
        });
    }

    private static void editTopicExtra(Context context, Preference preference, Runnable changed) {
        EditText editor = multiLine(context, getString(TOPIC_EXTRA, ""), "r/name");
        List<View> views = new ArrayList<>();
        views.add(editor);
        // The communities opened lately and not on the list yet, each a box to tick.
        Set<String> listed = Filter.topicExtra();
        List<android.widget.CheckBox> boxes = new ArrayList<>();
        for (String name : RecentCommunities.list()) {
            if (boxes.size() >= 12 || listed.contains(name.toLowerCase(Locale.ROOT).replace("_", ""))) continue;
            android.widget.CheckBox box = new android.widget.CheckBox(context);
            box.setText("r/" + name);
            boxes.add(box);
        }
        if (!boxes.isEmpty()) {
            android.widget.TextView header = new android.widget.TextView(context);
            header.setText(t("Recently visited"));
            header.setPadding(0, (int) (12 * context.getResources().getDisplayMetrics().density), 0, 0);
            views.add(header);
            views.addAll(boxes);
        }
        Dialogs.show(context, "Your own list", "Communities to hide, one a line.",
                views, () -> {
                    StringBuilder text = new StringBuilder(editor.getText().toString().trim());
                    for (android.widget.CheckBox box : boxes) {
                        if (!box.isChecked()) continue;
                        if (text.length() > 0) text.append('\n');
                        text.append(box.getText());
                    }
                    putString(TOPIC_EXTRA, text.toString().trim());
                    preference.setSummary(topicExtraSummary());
                    run(changed);
                }, null, null);
    }

    // endregion
}
