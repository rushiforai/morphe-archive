package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * X-Posed's Blocking settings: the saved filters, a page to add one and an editor for each
 * kind. Every change goes through {@link Filters#edit}, which saves it and updates the
 * timeline at once.
 */
final class FilterScreens {
    private static final NumberFormat NUMBERS = NumberFormat.getIntegerInstance();
    private static final long[] FOLLOWING_PRESETS = {1000, 2500, 5000, 10000};
    private static final long[] POSTS_PRESETS = {25000, 50000, 100000, 250000};
    private static final long SUGGESTED_FOLLOWING = 5000, SUGGESTED_POSTS = 100000, SUGGESTED_DIGITS = 5;
    private static final int UNDO_MILLIS = 6000;
    private static final String PROFILE_ONLY = "X's timelines leave this out, so it is known only for accounts "
            + "whose profile you opened in this session.";

    enum Kind {
        LOCATIONS(Icons.GLOBE, "Countries and regions", "Where X says an account is based, and X's region labels."),
        ACCOUNTS(Icons.USERS, "Accounts", "Specific accounts by their permanent user ID."),
        NAMES(Icons.NAME, "Display name", "Words or emoji in display names."),
        BIOS(Icons.BIO, "Bio text", "Words or phrases in profile bios."),
        LINKS(Icons.LINK, "Domains and URLs", "Whole websites or exact links in profiles."),
        LABELS(Icons.LABEL, "Account labels", "Parody, commentary, fan and government accounts."),
        AFFILIATIONS(Icons.AFFILIATION, "Organization affiliation", "Organization names or handles."),
        LANGUAGES(Icons.LANGUAGES, "Post languages", "The language X detects in a post."),
        ACTIVITY(Icons.CHART, "Activity and names", "Following, total posts and digits in account names."),
        WARNINGS(Icons.SHIELD, "Location warnings", "Accounts whose location X says may not be accurate."),
        ALWAYS_SHOW(Icons.AT_SIGN, "Always Show", "Accounts no filter hides or highlights.");

        final Glyphs.Glyph glyph;
        final String title, hint;

        Kind(Glyphs.Glyph glyph, String title, String hint) {
            this.glyph = glyph;
            this.title = title;
            this.hint = hint;
        }
    }

    /** The kinds that are filters. Always Show is the list of exceptions to them. */
    private static final Set<Kind> FILTERS = EnumSet.complementOf(EnumSet.of(Kind.ALWAYS_SHOW));

    private interface Threshold {
        void set(long value);
    }

    private FilterScreens() {
    }

    /** "3 filters" or "None", for the settings row. */
    static String summary(FilterRules rules) {
        int n = rules.size();
        return n == 0 ? "None" : NUMBERS.format(n) + (n == 1 ? " filter" : " filters");
    }

    /** "2 accounts and accounts you follow", for the settings row. */
    static String alwaysShowSummary(FilterRules rules) {
        int n = rules.alwaysShow.size();
        String accounts = n == 0 ? null : NUMBERS.format(n) + (n == 1 ? " account" : " accounts");
        if (!rules.alwaysShowFollowing) return accounts != null ? accounts : "None";
        return accounts != null ? accounts + " and accounts you follow" : "Accounts you follow";
    }

    static void showSaved(Context context, Runnable onClose) {
        new SavedPage(context, onClose);
    }

    static void showAdd(Context context, Runnable onClose) {
        new AddPage(context, onClose);
    }

    static void showAlwaysShow(Context context, Runnable onClose) {
        showEditor(context, Kind.ALWAYS_SHOW, null, onClose);
    }

    /** X-Posed's Behavior settings. Data sources are global; the rest belongs to the active profile. */
    static void showBehavior(Context context, Runnable onClose) {
        Page page = new Page(context, "Filter behavior");
        page.section("Post filtering");
        page.note("Saved in the filter profile " + Filters.active().name + ".");
        FilterRules rules = Filters.rules();
        page.toggle("Highlight matching posts in Lists", "Use Highlight in X List timelines, including Lists pinned "
                + "to Home, even when the general setting is Hide. Other timelines keep the general setting.",
                rules.highlightInLists, on -> Filters.edit(b -> b.highlightInLists = on));
        page.toggle("Hide replies and quotes of filtered posts", "Hide whole replies and quotes of posts that match a "
                + "filter, even in Highlight or Lists. Show post reveals them.",
                rules.hideRelatedPosts, on -> Filters.edit(b -> b.hideRelatedPosts = on));
        page.section("Data sources");
        page.note("These apply to every filter profile.");
        globalToggle(page, "Use device country when available", "Use the country of the app an account connects "
                + "through, such as Switzerland App Store, for flags and location filters. Otherwise use the account "
                + "location.", Settings.DEVICE_COUNTRY, false);
        globalToggle(page, "Use profile details", "Use bios, links, following counts and post counts from the data X "
                + "loads. When off, filters on them stay saved but inactive.", Settings.PROFILE_DETAILS, true);
        if (onClose != null) page.onClose(onClose);
        page.show();
    }

    private static void globalToggle(Page page, String title, String summary, String key, boolean def) {
        SharedPreferences prefs = Settings.prefs();
        page.toggle(title, summary, prefs.getBoolean(key, def), on -> {
            prefs.edit().putBoolean(key, on).apply();
            if (!on && key.equals(Settings.PROFILE_DETAILS)) Observed.clearProfiles();
            States.changedAll();
        });
    }

    /** Says that filters needing profile details are saved but inactive while that setting is off. */
    private static void profileDetailsNotice(Page page, String what) {
        if (Settings.sources().profileDetails) return;
        page.note(what + " filters are saved but inactive while Use profile details is off in Filter behavior.")
                .setTextColor(page.ui.alert);
    }

    /** Named filter sets; each X account remembers the one it uses. */
    static void showProfiles(Context context, Runnable onClose) {
        new ProfilesPage(context, onClose);
    }

    private static final class ProfilesPage {
        final Page page;

        ProfilesPage(Context context, Runnable onClose) {
            page = new Page(context, "Filter profiles");
            if (onClose != null) page.onClose(onClose);
            render();
            page.show();
        }

        void render() {
            page.clear();
            long viewer = Observed.viewer();
            String handle = viewer != 0 ? Users.handleFor(viewer) : null;
            page.note("Save different filters for different uses. " + (handle != null
                    ? "The profile you select is used for @" + handle + "; each X account remembers its own. "
                    : "Each X account remembers the profile selected while it is signed in. ")
                    + "Badge settings and cached accounts are shared.");
            page.link(Icons.PLUS, "New profile", null, v -> ask("New profile", null, "", Filters::create));
            page.section("Profiles");
            String active = Filters.active().id;
            for (Filters.Profile p : Filters.profiles()) {
                boolean selected = p.id.equals(active);
                LinearLayout widgets = new LinearLayout(page.context);
                widgets.setGravity(Gravity.CENTER_VERTICAL);
                ImageView check = page.icon(Icons.CHECK, Ui.ACCENT);
                check.setVisibility(selected ? View.VISIBLE : View.INVISIBLE);
                widgets.addView(check);
                widgets.addView(page.iconButton(Icons.MORE, page.ui.secondary, "More options for " + p.name, v -> options(p)));
                LinearLayout row = page.row(null, p.name, describe(p), widgets, v -> {
                    Filters.select(p.id);
                    render();
                });
                row.setSelected(selected);
            }
        }

        private String describe(Filters.Profile p) {
            StringBuilder s = new StringBuilder(summary(p.rules));
            s.append(p.rules.highlight ? " \u00B7 Highlight" : " \u00B7 Hide");
            List<String> handles = new ArrayList<>();
            for (long id : Filters.accountsUsing(p.id)) {
                String h = Users.handleFor(id);
                if (h != null) handles.add("@" + h);
            }
            if (!handles.isEmpty()) s.append("\nUsed by ").append(String.join(", ", handles));
            return s.toString();
        }

        private void options(Filters.Profile p) {
            List<String> labels = new ArrayList<>(), values = new ArrayList<>();
            labels.add("Rename");
            values.add("rename");
            if (!p.isDefault()) {
                labels.add("Delete");
                values.add("delete");
            }
            page.pick(p.name, labels.toArray(new String[0]), values.toArray(new String[0]), "", choice -> {
                if (choice.equals("rename")) {
                    ask("Rename profile", null, p.name, name -> Filters.rename(p.id, name));
                } else {
                    confirmDelete(p);
                }
            });
        }

        private void confirmDelete(Filters.Profile p) {
            int n = p.rules.size();
            String message = (n == 0 ? "It has no filters." : "Its " + (n == 1 ? "filter" : NUMBERS.format(n) + " filters")
                    + " will be deleted.") + " Accounts that use it switch to Default.";
            page.confirm("Delete " + p.name + "?", message, "Delete", () -> {
                Filters.delete(p.id);
                render();
            });
        }

        /** Asks for a name; shows why a name was refused and asks again. */
        private void ask(String title, String error, String initial, Page.Typed save) {
            page.ask(title, error != null ? error : "Up to " + Filters.MAX_NAME + " characters.", initial,
                    InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_CAP_SENTENCES, name -> {
                        try {
                            save.on(name);
                            render();
                        } catch (IllegalArgumentException e) {
                            ask(title, e.getMessage(), name, save);
                        }
                    });
        }
    }

    /** Opens the editor for one kind; for countries and regions, [region] starts expanded. */
    private static void showEditor(Context context, Kind kind, String region, Runnable onClose) {
        Page page;
        switch (kind) {
            case LOCATIONS:
                page = new LocationEditor(context, region).page;
                break;
            case LABELS:
                page = labels(context);
                break;
            case LANGUAGES:
                page = new LanguageEditor(context).page;
                break;
            case ACTIVITY:
                page = activity(context);
                break;
            case WARNINGS:
                page = warnings(context);
                break;
            default:
                page = new TermEditor(context, kind).page;
                break;
        }
        if (onClose != null) page.onClose(onClose);
        page.show();
    }

    private static String mode() {
        return Filters.rules().highlight ? "highlighted" : "hidden";
    }

    static int count(FilterRules r, Kind kind) {
        switch (kind) {
            case LOCATIONS:
                return r.locations.size();
            case ACCOUNTS:
                return r.accounts.size();
            case NAMES:
                return r.names.size();
            case BIOS:
                return r.bios.size();
            case LINKS:
                return r.links.size();
            case LABELS:
                return r.labels.size();
            case AFFILIATIONS:
                return r.affiliations.size();
            case LANGUAGES:
                return r.languages.size();
            case ACTIVITY:
                return (r.minFollowing > 0 ? 1 : 0) + (r.minPosts > 0 ? 1 : 0)
                        + (r.minHandleDigits > 0 ? 1 : 0) + (r.minNameDigits > 0 ? 1 : 0);
            case WARNINGS:
                return r.warnedAccounts ? 1 : 0;
            case ALWAYS_SHOW:
            default:
                return r.alwaysShow.size();
        }
    }

    /** One saved filter as the lists show it. */
    private static final class Entry {
        final Kind kind;
        /** A flag emoji, or null for the kind's icon. */
        final String flag;
        final String title, summary;
        final Filters.Edit remove;
        /** The region key to expand when the entry is opened. */
        final String region;

        Entry(Kind kind, String flag, String title, String summary, Filters.Edit remove, String region) {
            this.kind = kind;
            this.flag = flag;
            this.title = title;
            this.summary = summary;
            this.remove = remove;
            this.region = region;
        }

        boolean matches(String foldedQuery) {
            return FilterText.fold(title + "\n" + (summary != null ? summary : "") + "\n" + kind.title).contains(foldedQuery);
        }
    }

    private static List<Entry> entries(FilterRules r, Kind kind) {
        List<Entry> out = new ArrayList<>();
        switch (kind) {
            case LOCATIONS:
                for (String location : r.locations) {
                    Countries.Region region = Countries.region(location);
                    if (region != null) {
                        List<String> chosen = r.regionCountries.get(region.key);
                        String coverage = chosen == null ? "X's region label only"
                                : "X's region label and " + chosen.size() + " of " + region.members.size() + " countries";
                        out.add(new Entry(kind, region.flag, region.name, coverage, b -> b.removeLocation(location), region.key));
                    } else {
                        String flag = Countries.flagFor(location);
                        out.add(new Entry(kind, flag != null ? flag : Countries.UNKNOWN_FLAG, location, null,
                                b -> b.removeLocation(location), null));
                    }
                }
                break;
            case ACCOUNTS:
                for (Map.Entry<Long, String> e : r.accounts.entrySet()) {
                    long id = e.getKey();
                    String handle = e.getValue().isEmpty() ? Users.handleFor(id) : e.getValue();
                    boolean named = handle != null && !handle.isEmpty();
                    out.add(new Entry(kind, null, named ? "@" + handle : "User ID " + id, named ? "User ID " + id : null,
                            b -> b.removeAccount(id), null));
                }
                break;
            case NAMES:
                for (String t : r.names) out.add(new Entry(kind, null, t, null, b -> b.removeName(t), null));
                break;
            case BIOS:
                for (String t : r.bios) out.add(new Entry(kind, null, t, null, b -> b.removeBio(t), null));
                break;
            case AFFILIATIONS:
                for (String t : r.affiliations) out.add(new Entry(kind, null, t, null, b -> b.removeAffiliation(t), null));
                break;
            case LINKS:
                for (String link : r.links) {
                    out.add(new Entry(kind, null, link, Links.isExact(link) ? "Exact URL" : "Whole site, including subdomains",
                            b -> b.removeLink(link), null));
                }
                break;
            case LABELS:
                for (String label : FilterRules.LABELS) {
                    if (r.labels.contains(label)) out.add(new Entry(kind, null, labelName(label), null, b -> b.removeLabel(label), null));
                }
                break;
            case LANGUAGES:
                for (String code : r.languages) {
                    out.add(new Entry(kind, null, languageName(code), code, b -> b.removeLanguage(code), null));
                }
                break;
            case ACTIVITY:
                if (r.minFollowing > 0) {
                    out.add(new Entry(kind, null, "Following at least " + NUMBERS.format(r.minFollowing) + " accounts", null,
                            b -> b.setMinFollowing(0), null));
                }
                if (r.minPosts > 0) {
                    out.add(new Entry(kind, null, "At least " + NUMBERS.format(r.minPosts) + " total posts", null,
                            b -> b.setMinPosts(0), null));
                }
                if (r.minHandleDigits > 0) {
                    out.add(new Entry(kind, null, "At least " + r.minHandleDigits + " digits in the @handle", null,
                            b -> b.setMinHandleDigits(0), null));
                }
                if (r.minNameDigits > 0) {
                    out.add(new Entry(kind, null, "At least " + r.minNameDigits + " digits in the display name", null,
                            b -> b.setMinNameDigits(0), null));
                }
                break;
            case WARNINGS:
                if (r.warnedAccounts) {
                    out.add(new Entry(kind, null, "Accounts with a location warning", null, b -> b.warnedAccounts = false, null));
                }
                break;
            case ALWAYS_SHOW:
                for (String handle : r.alwaysShow) {
                    out.add(new Entry(kind, null, "@" + handle, null, b -> b.removeAlwaysShow(handle), null));
                }
                break;
        }
        return out;
    }

    private static String labelName(String label) {
        switch (label) {
            case FilterRules.PARODY:
                return "Parody accounts";
            case FilterRules.COMMENTARY:
                return "Commentary accounts";
            case FilterRules.FAN:
                return "Fan accounts";
            default:
                return "Government accounts";
        }
    }

    private static String labelHint(String label) {
        switch (label) {
            case FilterRules.PARODY:
                return "Accounts X labels as parody.";
            case FilterRules.COMMENTARY:
                return "Accounts X labels as commentary.";
            case FilterRules.FAN:
                return "Accounts X labels as fan accounts.";
            default:
                return "The grey checkmark X gives government and multilateral organization accounts.";
        }
    }

    /** The English name of a language code, as the rest of these screens are in English. */
    static String languageName(String code) {
        String name = Locale.forLanguageTag(code).getDisplayLanguage(Locale.ENGLISH);
        return name.isEmpty() || name.equalsIgnoreCase(code) ? code : name;
    }

    /** The language's name for itself, such as "Deutsch". */
    private static String nativeName(String code) {
        Locale locale = Locale.forLanguageTag(code);
        String name = locale.getDisplayLanguage(locale);
        if (name.isEmpty() || name.equalsIgnoreCase(code)) return "";
        return name.substring(0, 1).toUpperCase(locale) + name.substring(1);
    }

    /** X-Posed's describeTagRisk: short plain words also match inside longer words. */
    static String risk(String term) {
        String t = term.trim();
        if (t.isEmpty() || t.length() >= 4) return null;
        for (int i = 0; i < t.length(); i++) {
            char c = t.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == ' ')) return null;
        }
        return "\u201C" + t + "\u201D matches any text containing those letters, including longer words that merely contain them.";
    }

    private static TextWatcher watcher(Runnable changed) {
        return new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                changed.run();
            }
        };
    }

    /** A saved filter with a remove button; tapping the row opens [open] when set. */
    private static void entryRow(Page page, Entry e, Undo undo, Runnable changed, View.OnClickListener open) {
        View icon = e.flag != null ? page.emoji(e.flag) : page.icon(e.kind.glyph, page.ui.secondary);
        View remove = page.iconButton(Icons.CLOSE, page.ui.secondary, "Remove " + e.title, v -> {
            Filters.Profile before = Filters.active();
            Filters.edit(e.remove);
            undo.offer(e.title, before, changed);
            changed.run();
        });
        page.row(icon, e.title, e.summary, remove, open);
    }

    /** "Removed …  Undo" along the bottom of a page for a while after a removal, like a snackbar. */
    private static final class Undo {
        private final LinearLayout bar;
        private final TextView message;
        private final Runnable hide = this::dismiss;
        private final int timeout;
        private Filters.Profile before;
        private Runnable after;

        Undo(Page page) {
            Ui ui = page.ui;
            bar = new LinearLayout(page.context);
            bar.setGravity(Gravity.CENTER_VERTICAL);
            bar.setMinimumHeight(ui.dp(48));
            bar.setPaddingRelative(ui.dp(16), 0, ui.dp(4), 0);
            bar.setBackgroundColor(ui.text);
            message = ui.text("", 15, false, ui.background);
            message.setMaxLines(2);
            message.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            bar.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            TextView undo = ui.text("Undo", 15, true, ui.background);
            undo.setGravity(Gravity.CENTER);
            undo.setMinHeight(ui.dp(48));
            undo.setMinWidth(ui.dp(64));
            undo.setPadding(ui.dp(12), 0, ui.dp(12), 0);
            undo.setBackground(ui.rowBackground());
            undo.setOnClickListener(v -> {
                Filters.Profile previous = before;
                Runnable then = after;
                dismiss();
                if (previous == null) return;
                Filters.restore(previous);
                if (then != null) then.run();
            });
            bar.addView(undo);
            bar.setVisibility(View.GONE);
            page.footer(bar);
            // Users who need more time to act get it (Settings > Accessibility > Time to take action).
            AccessibilityManager am = (AccessibilityManager) page.context.getSystemService(Context.ACCESSIBILITY_SERVICE);
            timeout = am != null
                    ? am.getRecommendedTimeoutMillis(UNDO_MILLIS, AccessibilityManager.FLAG_CONTENT_TEXT | AccessibilityManager.FLAG_CONTENT_CONTROLS)
                    : UNDO_MILLIS;
        }

        void offer(String what, Filters.Profile before, Runnable after) {
            this.before = before;
            this.after = after;
            message.setText("Removed " + what);
            bar.setVisibility(View.VISIBLE);
            bar.removeCallbacks(hide);
            bar.postDelayed(hide, timeout);
        }

        private void dismiss() {
            bar.removeCallbacks(hide);
            bar.setVisibility(View.GONE);
            before = null;
            after = null;
        }
    }

    /** Every saved filter, grouped by kind, with search and removal. */
    private static final class SavedPage {
        final Page page;
        final Undo undo;
        String query = "";

        SavedPage(Context context, Runnable onClose) {
            page = new Page(context, "Saved filters");
            page.search("Search saved filters", q -> {
                query = q;
                render();
            });
            undo = new Undo(page);
            if (onClose != null) page.onClose(onClose);
            render();
            page.show();
        }

        void render() {
            page.clear();
            FilterRules rules = Filters.rules();
            if (rules.isEmpty()) {
                page.note("No filters yet. Posts from accounts that match a filter are " + mode() + ".");
                page.link(Icons.PLUS, "Add a filter", null, v -> showAdd(page.context, this::render));
                return;
            }
            page.note(summary(rules) + ". Matching posts are " + mode() + ". Tap a filter to edit it.");
            page.link(Icons.PLUS, "Add a filter", null, v -> showAdd(page.context, this::render));
            String q = FilterText.term(query);
            int shown = 0;
            for (Kind kind : FILTERS) {
                List<Entry> entries = new ArrayList<>();
                for (Entry e : entries(rules, kind)) if (q.isEmpty() || e.matches(q)) entries.add(e);
                if (entries.isEmpty()) continue;
                page.section(kind.title);
                for (Entry e : entries) {
                    entryRow(page, e, undo, this::render, v -> showEditor(page.context, kind, e.region, this::render));
                }
                shown += entries.size();
            }
            if (shown == 0) page.note("No saved filters match \u201C" + query + "\u201D.");
        }
    }

    /** The kinds of filter, each opening its editor. */
    private static final class AddPage {
        final Page page;

        AddPage(Context context, Runnable onClose) {
            page = new Page(context, "Add a filter");
            if (onClose != null) page.onClose(onClose);
            render();
            page.show();
        }

        void render() {
            page.clear();
            page.note("Choose what to match. Matching posts are " + mode() + ".");
            FilterRules rules = Filters.rules();
            for (Kind kind : FILTERS) {
                int n = count(rules, kind);
                page.link(kind.glyph, kind.title, n > 0 ? kind.hint + " " + NUMBERS.format(n) + " saved." : kind.hint,
                        v -> showEditor(page.context, kind, null, this::render));
            }
        }
    }

    /** Display names, bios, affiliations, links and accounts: a field to add one, then the saved ones. */
    private static final class TermEditor {
        final Page page;
        final Kind kind;
        final EditText field;
        final TextView feedback, add;
        final Undo undo;
        final LinearLayout saved;
        /** Saves the current input; null while it can't be added. */
        private Runnable pending;
        private String addedMessage;

        TermEditor(Context context, Kind kind) {
            this.kind = kind;
            page = new Page(context, kind.title);
            Ui ui = page.ui;
            page.note(help(kind));
            if (kind == Kind.BIOS || kind == Kind.LINKS) profileDetailsNotice(page, kind.title);
            LinearLayout input = new LinearLayout(context);
            input.setGravity(Gravity.CENTER_VERTICAL);
            input.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(4));
            field = page.field(fieldHint(kind), inputType(kind), text -> submit());
            input.addView(field, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            add = ui.pill(kind == Kind.ACCOUNTS || kind == Kind.ALWAYS_SHOW ? "Add account" : "Add", true, v -> submit());
            LinearLayout.LayoutParams addLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ui.dp(48));
            addLp.setMarginStart(ui.dp(8));
            input.addView(add, addLp);
            page.add(input);
            feedback = ui.text("", 13, false, ui.secondary);
            feedback.setPadding(ui.dp(16), ui.dp(4), ui.dp(16), ui.dp(4));
            feedback.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            page.add(feedback);
            field.addTextChangedListener(watcher(this::validate));
            FilterRules rules = Filters.rules();
            if (kind == Kind.ALWAYS_SHOW) {
                page.toggle("Always show accounts you follow", "Applies when X reports that you follow the account. "
                                + "Otherwise your filters still apply.",
                        rules.alwaysShowFollowing, on -> Filters.edit(b -> b.alwaysShowFollowing = on));
            } else if (kind == Kind.BIOS) {
                page.toggle("Also match profile location", "Applies to every bio filter. Uses the location text the account "
                                + "wrote, not the country X reports. " + PROFILE_ONLY,
                        rules.bioMatchesLocation, on -> Filters.edit(b -> b.bioMatchesLocation = on));
            } else if (kind == Kind.LINKS) {
                page.toggle("Also match links in profile location", "Uses the location text the account wrote, not the "
                                + "country X reports. " + PROFILE_ONLY,
                        rules.linksMatchLocation, on -> Filters.edit(b -> b.linksMatchLocation = on));
            }
            undo = new Undo(page);
            saved = page.group();
            renderSaved();
            validate();
        }

        private static String help(Kind kind) {
            switch (kind) {
                case ALWAYS_SHOW:
                    return "No filter hides or highlights these accounts. Add an account here by its exact @handle, or "
                            + "from its account sheet. Like X-Posed, Always Show goes by handle, so it stops applying if "
                            + "the account changes its handle. Your follows and blocks on X don't change.";
                case ACCOUNTS:
                    return "The easiest way is the account sheet: tap an account's badge, then Hide or Highlight. Here you can "
                            + "enter a numeric user ID, an x.com/i/user/ link, or the @handle of an account X has shown you "
                            + "in this session. Account filters keep working when the account changes its handle.";
                case LINKS:
                    return "A bare domain such as example.com matches the whole site and its subdomains. A link with a path "
                            + "matches only that exact URL. Links in bios work everywhere. The website field is known only "
                            + "for accounts whose profile you opened in this session, because X's timelines leave it out.";
                case AFFILIATIONS:
                    return "Matches the organization X shows next to an account's name, by name or @handle, ignoring case.";
                case BIOS:
                    return "Matches bios that contain this text, ignoring case. Emoji and punctuation work too.";
                default:
                    return "Matches display names that contain this text, ignoring case. Emoji and punctuation work too.";
            }
        }

        private static String fieldHint(Kind kind) {
            switch (kind) {
                case ALWAYS_SHOW:
                    return "@handle";
                case ACCOUNTS:
                    return "User ID, x.com/i/user/ link or @handle";
                case LINKS:
                    return "example.com or a full link";
                case AFFILIATIONS:
                    return "Organization name or @handle";
                default:
                    return "Text or emoji";
            }
        }

        private static int inputType(Kind kind) {
            switch (kind) {
                case ACCOUNTS:
                case LINKS:
                    return InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
                case AFFILIATIONS:
                case ALWAYS_SHOW:
                    return InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS;
                default:
                    return InputType.TYPE_CLASS_TEXT;
            }
        }

        private String[] terms(FilterRules rules) {
            return kind == Kind.NAMES ? rules.nameTerms : kind == Kind.BIOS ? rules.bioTerms : rules.affiliationTerms;
        }

        private void validate() {
            String raw = field.getText().toString();
            pending = null;
            String message = null;
            int color = page.ui.secondary;
            if (!raw.trim().isEmpty()) {
                addedMessage = null;
                FilterRules rules = Filters.rules();
                switch (kind) {
                    case LINKS: {
                        String rule = Links.normalizeRule(raw);
                        if (rule.isEmpty()) {
                            message = "Enter a valid domain or http(s) link, without spaces or a password.";
                            color = Page.DESTRUCTIVE;
                        } else if (rules.links.contains(rule)) {
                            message = "This filter is already saved.";
                        } else {
                            boolean exact = Links.isExact(rule);
                            message = (exact ? "Exact URL: " : "Whole site, including subdomains: ") + rule;
                            String covering = exact ? Links.match(rule, rules.domains, Collections.emptySet()) : null;
                            if (covering != null) {
                                message += "\nThe saved domain " + covering + " already matches this whole site. "
                                        + "Adding the link doesn't narrow it.";
                                color = page.ui.alert;
                            }
                            pending = () -> Filters.edit(b -> b.addLink(rule));
                            addedMessage = "Added " + rule + ".";
                        }
                        break;
                    }
                    case ALWAYS_SHOW: {
                        String handle = FilterText.handle(raw);
                        if (handle == null) {
                            message = "Enter a handle of up to 15 letters, digits or underscores.";
                            color = Page.DESTRUCTIVE;
                        } else if (rules.alwaysShow.contains(handle)) {
                            message = "@" + handle + " is already in Always Show.";
                        } else {
                            pending = () -> Filters.edit(b -> b.addAlwaysShow(handle));
                            addedMessage = "Always showing @" + handle + ".";
                        }
                        break;
                    }
                    case ACCOUNTS: {
                        AccountInput a = AccountInput.parse(raw);
                        if (a.error != null) {
                            message = a.error;
                            color = Page.DESTRUCTIVE;
                        } else if (rules.accounts.containsKey(a.id)) {
                            message = "This account is already filtered.";
                        } else {
                            String who = a.handle != null ? "@" + a.handle : "User ID " + a.id;
                            message = a.handle != null ? who + ", user ID " + a.id : who;
                            pending = () -> Filters.edit(b -> b.putAccount(a.id, a.handle));
                            addedMessage = "Added " + who + ".";
                        }
                        break;
                    }
                    default: {
                        String text = raw.trim();
                        String folded = FilterText.term(kind == Kind.AFFILIATIONS && text.startsWith("@") ? text.substring(1) : text);
                        if (folded.isEmpty()) {
                            message = "Enter some text or emoji.";
                            color = Page.DESTRUCTIVE;
                        } else if (folded.length() > 200) {
                            message = "Use 200 characters or fewer.";
                            color = Page.DESTRUCTIVE;
                        } else if (contains(terms(rules), folded)) {
                            message = "This filter is already saved.";
                        } else {
                            if (kind != Kind.AFFILIATIONS) message = risk(text);
                            if (message != null) color = page.ui.alert;
                            pending = () -> Filters.edit(b -> {
                                if (kind == Kind.NAMES) b.addName(text);
                                else if (kind == Kind.BIOS) b.addBio(text);
                                else b.addAffiliation(text);
                            });
                            addedMessage = "Added \u201C" + text + "\u201D.";
                        }
                        break;
                    }
                }
            } else if (addedMessage != null) {
                message = addedMessage;
            }
            feedback.setText(message != null ? message : "");
            feedback.setTextColor(color);
            feedback.setVisibility(message != null ? View.VISIBLE : View.GONE);
            add.setEnabled(pending != null);
            add.setAlpha(pending != null ? 1f : 0.4f);
        }

        private static boolean contains(String[] terms, String term) {
            for (String t : terms) if (t.equals(term)) return true;
            return false;
        }

        private void submit() {
            if (pending == null) return;
            pending.run();
            // Clearing re-validates; the confirmation stays until the next keystroke.
            field.setText("");
            renderSaved();
        }

        private void changed() {
            addedMessage = null;
            renderSaved();
            validate();
        }

        private void renderSaved() {
            page.into(saved, () -> {
                List<Entry> entries = entries(Filters.rules(), kind);
                if (entries.isEmpty()) return;
                page.section("Saved (" + NUMBERS.format(entries.size()) + ")");
                for (Entry e : entries) entryRow(page, e, undo, this::changed, null);
            });
        }
    }

    /** A user ID from an ID, a permanent x.com/i/user/ link, or a handle X has shown this session. */
    static final class AccountInput {
        long id;
        String handle;
        String error;

        static AccountInput parse(String raw) {
            AccountInput a = new AccountInput();
            String s = raw.trim();
            String lower = s.toLowerCase(Locale.ROOT);
            for (String prefix : new String[]{"https://", "http://", "www.", "mobile."}) {
                if (lower.startsWith(prefix)) {
                    s = s.substring(prefix.length());
                    lower = lower.substring(prefix.length());
                }
            }
            for (String path : new String[]{"x.com/i/user/", "twitter.com/i/user/"}) {
                if (lower.startsWith(path)) {
                    s = s.substring(path.length());
                    int end = s.length();
                    for (char c : new char[]{'/', '?', '#'}) {
                        int i = s.indexOf(c);
                        if (i >= 0 && i < end) end = i;
                    }
                    s = s.substring(0, end);
                    if (!isDigits(s)) {
                        a.error = "This link has no user ID. Use a link like x.com/i/user/123456789.";
                        return a;
                    }
                    break;
                }
            }
            // Digits alone are an ID; an all-digit handle needs its @.
            if (!isDigits(s)) {
                String handle = FilterText.handle(s);
                if (handle == null) {
                    a.error = "Enter a user ID, an x.com/i/user/ link or an @handle of up to 15 letters, digits or underscores.";
                    return a;
                }
                long id = Users.idFor(handle);
                if (id == 0) {
                    a.error = "X hasn't shown @" + handle + " in this session. Open their profile and add them from the "
                            + "account sheet, or enter their user ID.";
                    return a;
                }
                a.id = id;
                a.handle = handle;
                return a;
            }
            if (s.length() > 19 || s.charAt(0) == '0') {
                a.error = "A user ID has up to 19 digits and doesn't start with 0.";
                return a;
            }
            try {
                a.id = Long.parseLong(s);
            } catch (NumberFormatException e) {
                a.error = "A user ID has up to 19 digits and doesn't start with 0.";
                return a;
            }
            a.handle = Users.handleFor(a.id);
            return a;
        }

        private static boolean isDigits(String s) {
            if (s.isEmpty()) return false;
            for (int i = 0; i < s.length(); i++) if (s.charAt(i) < '0' || s.charAt(i) > '9') return false;
            return true;
        }
    }

    private static Page labels(Context context) {
        Page page = new Page(context, Kind.LABELS.title);
        page.note("X shows these labels under an account's name.");
        FilterRules rules = Filters.rules();
        for (String label : FilterRules.LABELS) {
            page.toggle(labelName(label), labelHint(label), rules.labels.contains(label), on -> Filters.edit(b -> {
                if (on) b.addLabel(label);
                else b.removeLabel(label);
            }));
        }
        return page;
    }

    private static Page warnings(Context context) {
        Page page = new Page(context, Kind.WARNINGS.title);
        page.toggle("Filter accounts with a location warning", "X warns when an account's location may not be accurate, "
                        + "for example when it connects through a VPN or proxy.",
                Filters.rules().warnedAccounts, on -> Filters.edit(b -> b.warnedAccounts = on));
        page.note("The warning is X's guess, not proof. Quoted posts are not filtered by this rule.");
        return page;
    }

    private static Page activity(Context context) {
        Page page = new Page(context, Kind.ACTIVITY.title);
        FilterRules rules = Filters.rules();
        page.section("Activity");
        profileDetailsNotice(page, "Following and total posts");
        threshold(page, "Following", "Accounts that follow at least this many accounts. This counts who they follow, "
                        + "not their followers.", rules.minFollowing, FOLLOWING_PRESETS, Long.MAX_VALUE, SUGGESTED_FOLLOWING,
                v -> Filters.edit(b -> b.setMinFollowing(v)));
        threshold(page, "Total posts", "Accounts with at least this many posts in total, as X reports. " + PROFILE_ONLY,
                rules.minPosts, POSTS_PRESETS, Long.MAX_VALUE, SUGGESTED_POSTS, v -> Filters.edit(b -> b.setMinPosts(v)));
        page.section("Name patterns");
        threshold(page, "Digits in handle", "Counts digits anywhere in the @handle. They don't need to be next to each other.",
                rules.minHandleDigits, null, FilterRules.MAX_HANDLE_DIGITS, SUGGESTED_DIGITS,
                v -> Filters.edit(b -> b.setMinHandleDigits((int) v)));
        threshold(page, "Digits in display name", "Counts digits anywhere in the display name, including styled digits. "
                        + "The @handle is counted separately.", rules.minNameDigits, null, FilterRules.MAX_NAME_DIGITS,
                SUGGESTED_DIGITS, v -> Filters.edit(b -> b.setMinNameDigits((int) v)));
        return page;
    }

    /** A threshold row: Off, presets or a custom number; inclusive, like X-Posed. */
    private static void threshold(Page page, String title, String help, long current, long[] presets, long max,
                                  long suggested, Threshold threshold) {
        long[] now = {current};
        TextView value = page.ui.text(thresholdLabel(current), 15, false, Ui.ACCENT);
        Threshold set = v -> {
            now[0] = v;
            value.setText(thresholdLabel(v));
            threshold.set(v);
        };
        Runnable custom = () -> page.ask(title, "A whole number from 1 to " + NUMBERS.format(max)
                        + ". Leave it empty to turn this off.", String.valueOf(now[0] > 0 ? now[0] : suggested),
                InputType.TYPE_CLASS_NUMBER, text -> set.set(parseThreshold(text, max)));
        page.row(title, help, value, v -> {
            if (presets == null) {
                custom.run();
                return;
            }
            List<String> labels = new ArrayList<>(), values = new ArrayList<>();
            labels.add("Off");
            values.add("0");
            String selected = now[0] == 0 ? "0" : "custom";
            for (long p : presets) {
                labels.add(thresholdLabel(p));
                values.add(String.valueOf(p));
                if (p == now[0]) selected = String.valueOf(p);
            }
            labels.add(selected.equals("custom") ? "Custom: " + thresholdLabel(now[0]) : "Custom\u2026");
            values.add("custom");
            page.pick(title, labels.toArray(new String[0]), values.toArray(new String[0]), selected, picked -> {
                if (picked.equals("custom")) custom.run();
                else set.set(Long.parseLong(picked));
            });
        });
    }

    private static String thresholdLabel(long value) {
        return value <= 0 ? "Off" : NUMBERS.format(value) + " or more";
    }

    /** Digits only, as the number keyboard gives; empty is off, and anything above max is max. */
    static long parseThreshold(String text, long max) {
        String digits = text.trim();
        if (digits.isEmpty()) return 0;
        for (int i = 0; i < digits.length(); i++) if (digits.charAt(i) < '0' || digits.charAt(i) > '9') return 0;
        if (digits.length() > 18) return max;
        return Math.min(max, Long.parseLong(digits));
    }

    /** A searchable checklist of the languages X detects, with their own names for recognition. */
    private static final class LanguageEditor {
        final Page page;
        final List<String> codes = new ArrayList<>();
        final LinearLayout rows;
        String query = "";

        LanguageEditor(Context context) {
            page = new Page(context, Kind.LANGUAGES.title);
            page.search("Search languages", q -> {
                query = q;
                render();
            });
            page.note("Matches posts by the language X detects in them. Posts X couldn't classify never match. "
                    + "Quoted posts are not filtered by language.");
            Set<String> all = new LinkedHashSet<>();
            for (String code : CountryData.LANGUAGES.split("\n")) if (!code.isEmpty()) all.add(code);
            all.addAll(Filters.rules().languages);
            codes.addAll(all);
            Collections.sort(codes, (a, b) -> languageName(a).compareToIgnoreCase(languageName(b)));
            rows = page.group();
            render();
        }

        void render() {
            String q = FilterText.term(query);
            page.into(rows, () -> {
                int shown = 0;
                for (String code : codes) {
                    String name = languageName(code), own = nativeName(code);
                    if (!q.isEmpty() && !FilterText.fold(name + "\n" + own + "\n" + code).contains(q)) continue;
                    shown++;
                    boolean[] on = {Filters.rules().languages.contains(code)};
                    ImageView check = page.checkMark(on[0]);
                    String summary = own.isEmpty() || own.equalsIgnoreCase(name) ? code : own + " \u00B7 " + code;
                    LinearLayout row = page.row(name, summary, check, v -> {
                        on[0] = !on[0];
                        Filters.edit(b -> {
                            if (on[0]) b.addLanguage(code);
                            else b.removeLanguage(code);
                        });
                        page.setChecked(check, on[0]);
                    });
                    Page.checkbox(row, () -> on[0]);
                }
                if (shown == 0) page.note("No languages match \u201C" + query + "\u201D.");
            });
        }
    }

    /**
     * Countries and X's region labels. A region can also cover its member countries, chosen
     * one by one or all at once, as in X-Posed. A ListView keeps the 270 rows cheap.
     */
    private static final class LocationEditor extends BaseAdapter {
        private static final int HEADER = 0, NOTE = 1, REGION = 2, PANEL = 3, MEMBER = 4, COUNTRY = 5;

        private static final class Item {
            final int type;
            /** Canonical key of the country or region; the text for headers and notes. */
            final String key;
            final Countries.Region region;
            /** The saved spelling of a location X reported that isn't in the country list. */
            final String unlisted;

            Item(int type, String key, Countries.Region region, String unlisted) {
                this.type = type;
                this.key = key;
                this.region = region;
                this.unlisted = unlisted;
            }
        }

        final Page page;
        private final Ui ui;
        private final ListView listView;
        private final Set<String> expanded = new HashSet<>();
        private final List<Item> items = new ArrayList<>();
        private String query = "";

        LocationEditor(Context context, String openRegion) {
            listView = new ListView(context);
            page = new Page(context, Kind.LOCATIONS.title, listView);
            ui = page.ui;
            page.search("Search countries and regions", q -> {
                query = q;
                rebuild();
            });
            listView.setDivider(null);
            listView.setSelector(new ColorDrawable(Color.TRANSPARENT));
            listView.setItemsCanFocus(true);
            listView.setClipToPadding(false);
            listView.setPadding(0, 0, 0, ui.dp(24));
            if (openRegion != null) expanded.add(openRegion);
            rebuild();
            listView.setAdapter(this);
            if (openRegion != null) {
                for (int i = 0; i < items.size(); i++) {
                    if (items.get(i).type == REGION && items.get(i).key.equals(openRegion)) {
                        listView.setSelection(i);
                        break;
                    }
                }
            }
        }

        private void rebuild() {
            items.clear();
            String q = FilterText.term(query);
            String qKey = q.isEmpty() ? "" : Countries.canonicalKey(query);
            List<Item> regions = new ArrayList<>();
            for (Countries.Region r : Countries.regions()) {
                boolean nameMatch = q.isEmpty() || FilterText.fold(r.name).contains(q) || r.key.equals(qKey);
                boolean open = expanded.contains(r.key);
                List<Item> members = new ArrayList<>();
                if (open) {
                    for (String m : r.members) if (nameMatch || matches(m, q, qKey)) members.add(new Item(MEMBER, m, r, null));
                }
                if (!nameMatch && members.isEmpty()) continue;
                regions.add(new Item(REGION, r.key, r, null));
                if (open) {
                    regions.add(new Item(PANEL, r.key, r, null));
                    regions.addAll(members);
                }
            }
            List<Item> countries = new ArrayList<>();
            for (String location : Filters.rules().locations) {
                String key = Countries.canonicalKey(location);
                if (!Countries.isKnownKey(key) && (q.isEmpty() || FilterText.fold(location).contains(q))) {
                    countries.add(new Item(COUNTRY, key, null, location));
                }
            }
            for (String key : Countries.countryKeys()) {
                if (q.isEmpty() || matches(key, q, qKey)) countries.add(new Item(COUNTRY, key, null, null));
            }
            if (!regions.isEmpty()) {
                items.add(new Item(HEADER, "Regions", null, null));
                items.addAll(regions);
            }
            if (!countries.isEmpty()) {
                items.add(new Item(HEADER, "Countries", null, null));
                items.addAll(countries);
            }
            if (items.isEmpty()) items.add(new Item(NOTE, "No countries or regions match \u201C" + query + "\u201D.", null, null));
            notifyDataSetChanged();
        }

        private static boolean matches(String key, String q, String qKey) {
            return key.equals(qKey) || key.contains(q) || FilterText.fold(Countries.displayName(key)).contains(q);
        }

        private boolean isChecked(Item item) {
            FilterRules rules = Filters.rules();
            if (item.type == MEMBER) {
                List<String> chosen = rules.regionCountries.get(item.region.key);
                return chosen != null && chosen.contains(item.key);
            }
            return rules.locationKeys.contains(item.key);
        }

        private String name(Item item) {
            if (item.unlisted != null) return item.unlisted;
            return item.type == REGION ? item.region.name : Countries.displayName(item.key);
        }

        private void toggle(Item item) {
            boolean on = !isChecked(item);
            String name = name(item);
            if (item.type == MEMBER) {
                List<String> chosen = Filters.rules().regionCountries.get(item.region.key);
                Set<String> next = chosen != null ? new TreeSet<>(chosen) : new TreeSet<>();
                if (on) next.add(item.key);
                else next.remove(item.key);
                saveRegion(item.region, next, on);
                return;
            }
            Filters.edit(b -> {
                if (on) b.addLocation(name);
                else b.removeLocation(name);
            });
            // Checking a region shows its countries, as in X-Posed.
            if (on && item.type == REGION && !item.region.members.isEmpty() && expanded.add(item.key)) {
                rebuild();
            } else {
                notifyDataSetChanged();
            }
        }

        /** Sets a region's countries (null: X's label only) and turns the region on when asked. */
        private void saveRegion(Countries.Region region, Set<String> countries, boolean activate) {
            Filters.edit(b -> {
                b.setRegionCountries(region.name, countries);
                if (activate) b.addLocation(region.name);
            });
            notifyDataSetChanged();
        }

        @Override
        public int getCount() {
            return items.size();
        }

        @Override
        public Object getItem(int position) {
            return items.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getViewTypeCount() {
            return 6;
        }

        @Override
        public int getItemViewType(int position) {
            return items.get(position).type;
        }

        /**
         * Rows handle their own taps, so the list never draws them as selected. The list clears
         * a row's accessibility delegate when it recycles the row, so getView sets ours again
         * every time; otherwise the list's own delegate would read the rows as disabled.
         */
        @Override
        public boolean areAllItemsEnabled() {
            return false;
        }

        @Override
        public boolean isEnabled(int position) {
            return false;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Item item = items.get(position);
            switch (item.type) {
                case HEADER: {
                    TextView t = plain(convertView instanceof TextView ? (TextView) convertView : ui.text("", 20, true, ui.text));
                    t.setText(item.key);
                    t.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(8));
                    t.setAccessibilityHeading(true);
                    return t;
                }
                case NOTE: {
                    TextView t = plain(convertView instanceof TextView ? (TextView) convertView : ui.text("", 13, false, ui.secondary));
                    t.setText(item.key);
                    t.setPadding(ui.dp(16), ui.dp(8), ui.dp(16), ui.dp(8));
                    return t;
                }
                case PANEL:
                    return plain(panel(item.region));
                default: {
                    CheckRow row = convertView != null ? (CheckRow) convertView.getTag() : new CheckRow();
                    row.bind(item);
                    return row.root;
                }
            }
        }

        private static <T extends View> T plain(T view) {
            view.setAccessibilityDelegate(new View.AccessibilityDelegate());
            return view;
        }

        /** A country, region or member country with its flag, a summary and a check mark. */
        private final class CheckRow {
            final LinearLayout root;
            final TextView flag, title, summary;
            final ImageView check;
            final FrameLayout expand;
            Item item;

            CheckRow() {
                root = new LinearLayout(page.context);
                root.setGravity(Gravity.CENTER_VERTICAL);
                root.setMinimumHeight(ui.dp(56));
                root.setBackground(ui.rowBackground());
                flag = page.emoji("");
                root.addView(flag, new LinearLayout.LayoutParams(ui.dp(32), ViewGroup.LayoutParams.WRAP_CONTENT));
                LinearLayout texts = new LinearLayout(page.context);
                texts.setOrientation(LinearLayout.VERTICAL);
                title = ui.text("", 15, false, ui.text);
                summary = ui.text("", 13, false, ui.secondary);
                texts.addView(title);
                texts.addView(summary);
                LinearLayout.LayoutParams textsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
                textsLp.setMarginStart(ui.dp(12));
                root.addView(texts, textsLp);
                check = page.checkMark(false);
                ((LinearLayout.LayoutParams) check.getLayoutParams()).setMarginStart(ui.dp(12));
                root.addView(check);
                expand = page.iconButton(Icons.EXPAND, ui.secondary, "", v -> {
                    if (!expanded.remove(item.key)) expanded.add(item.key);
                    rebuild();
                });
                ((LinearLayout.LayoutParams) expand.getLayoutParams()).setMarginStart(ui.dp(4));
                root.addView(expand);
                root.setOnClickListener(v -> toggle(item));
                root.setTag(this);
            }

            void bind(Item item) {
                this.item = item;
                FilterRules rules = Filters.rules();
                boolean region = item.type == REGION, member = item.type == MEMBER;
                String name = name(item);
                root.setPaddingRelative(ui.dp(member ? 44 : 16), ui.dp(8), ui.dp(region ? 4 : 16), ui.dp(8));
                String emoji = region ? item.region.flag : Countries.flagFor(name);
                flag.setText(emoji != null ? emoji : Countries.UNKNOWN_FLAG);
                title.setText(name);
                String note = region ? regionSummary(item.region, rules) : member ? null : coveredBy(item.key, rules);
                summary.setText(note != null ? note : "");
                summary.setVisibility(note != null ? View.VISIBLE : View.GONE);
                page.setChecked(check, isChecked(item));
                Page.checkbox(root, () -> isChecked(item));
                expand.setVisibility(region ? View.VISIBLE : View.GONE);
                if (region) {
                    boolean open = expanded.contains(item.key);
                    ((ImageView) expand.getChildAt(0)).setImageDrawable((open ? Icons.COLLAPSE : Icons.EXPAND).asDrawable(ui.secondary));
                    expand.setContentDescription((open ? "Hide " : "Show ") + name + " countries and options");
                }
            }
        }

        private static String regionSummary(Countries.Region region, FilterRules rules) {
            int all = region.members.size();
            List<String> chosen = rules.regionCountries.get(region.key);
            if (rules.locationKeys.contains(region.key)) {
                if (chosen != null) return "X's label and " + chosen.size() + " of " + all + " countries";
                return all > 0 ? "X's label only \u00B7 " + all + " countries available" : "X's label only";
            }
            return all > 0 ? all + (all == 1 ? " country" : " countries") : "X's label only";
        }

        /** "Included with Europe" for a country a selected region covers. */
        private static String coveredBy(String key, FilterRules rules) {
            if (!rules.coveredCountries.contains(key)) return null;
            List<String> names = new ArrayList<>();
            for (String regionKey : Countries.regionsOf(key)) {
                List<String> chosen = rules.regionCountries.get(regionKey);
                if (rules.locationKeys.contains(regionKey) && chosen != null && chosen.contains(key)) {
                    names.add(Countries.region(regionKey).name);
                }
            }
            return names.isEmpty() ? null : "Included with " + String.join(", ", names);
        }

        /** The opened region: its definition, the Include countries switch and All or None. */
        private View panel(Countries.Region region) {
            FilterRules rules = Filters.rules();
            List<String> chosen = rules.regionCountries.get(region.key);
            boolean selected = rules.locationKeys.contains(region.key), include = chosen != null;
            LinearLayout panel = new LinearLayout(page.context);
            panel.setOrientation(LinearLayout.VERTICAL);
            panel.setPaddingRelative(ui.dp(44), 0, ui.dp(16), ui.dp(8));
            if (region.note != null && !region.note.isEmpty()) {
                TextView note = ui.text(region.note, 13, false, ui.secondary);
                note.setPadding(0, 0, 0, ui.dp(8));
                panel.addView(note);
            }
            if (region.members.isEmpty()) {
                panel.addView(ui.text("X uses this label without a country list. It still matches the region X reports.",
                        13, false, ui.secondary));
                return panel;
            }
            LinearLayout switchRow = new LinearLayout(page.context);
            switchRow.setGravity(Gravity.CENTER_VERTICAL);
            switchRow.setMinimumHeight(ui.dp(48));
            switchRow.setBackground(ui.rowBackground());
            LinearLayout texts = new LinearLayout(page.context);
            texts.setOrientation(LinearLayout.VERTICAL);
            texts.addView(ui.text("Include countries", 15, false, ui.text));
            int all = region.members.size();
            texts.addView(ui.text(include ? chosen.size() + " of " + all + " included" : all + " countries and territories",
                    13, false, ui.secondary));
            switchRow.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            Toggle sw = new Toggle(page.context, ui, include);
            sw.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            switchRow.addView(sw);
            switchRow.setOnClickListener(v -> saveRegion(region, include ? null : new TreeSet<>(region.members), !include));
            Page.checkable(switchRow, Switch.class, () -> include);
            panel.addView(switchRow, Ui.matchWidth());
            String hint = !selected ? "Choosing countries also turns on this region. Include countries selects them all."
                    : !include ? "Choose countries below, or use Include countries to select them all." : null;
            if (hint != null) panel.addView(ui.text(hint, 13, false, ui.secondary));
            LinearLayout buttons = new LinearLayout(page.context);
            buttons.setPadding(0, ui.dp(8), 0, 0);
            TextView allButton = ui.pill("Select all", false, v -> saveRegion(region, new TreeSet<>(region.members), true));
            allButton.setContentDescription("Include all " + region.name + " countries");
            allButton.setMinHeight(ui.dp(48));
            buttons.addView(allButton);
            TextView noneButton = ui.pill("Select none", false, v -> saveRegion(region, new TreeSet<>(), false));
            noneButton.setContentDescription("Deselect all " + region.name + " countries");
            noneButton.setMinHeight(ui.dp(48));
            LinearLayout.LayoutParams noneLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            noneLp.setMarginStart(ui.dp(8));
            buttons.addView(noneButton, noneLp);
            panel.addView(buttons);
            return panel;
        }
    }
}
