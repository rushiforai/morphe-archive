/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import android.content.Context;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.preference.SwitchPreference;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.Setting;
import app.hushpinterest.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushpinterest.extension.shared.settings.preference.ReopenSettingsAfterRestart;
import app.hushpinterest.extension.shared.settings.preference.SettingsSearch;

/**
 * A view of the complete preference model. Filtering never removes preferences from their
 * screen, so imports, dependencies, persistence and restart notices still reach hidden pages.
 */
@SuppressWarnings("deprecation")
final class SettingsNavigation extends BaseAdapter {
    private static final String STATE = "hushpinterest_navigation";
    /** Marks the Pause, Resume or Undo button placed under a status row's text, so a rebind replaces it. */
    private static final String STATUS_ACTION = "hushpinterest_status_action";
    /** The restart row's key. Like the other rows only this view draws, it stores nothing. */
    static final String RESTART = "action_restart_to_apply";
    static final String QUICK_SETUPS = "action_quick_setups";
    static final String REPORT = "action_report_problem";
    private final HushPinterestPreferenceFragment page;
    private final SettingsDialog host;
    private final ListView list;
    private final int normalBottomPadding;
    private final PreferenceScreen screen;
    private final ListAdapter source;
    private final List<Section> sections = new ArrayList<>();
    private final List<Preference> visible = new ArrayList<>();
    private final Map<String, String> searchAliases;
    private final Preference browse;
    /**
     * The home page's second heading, over Links, Updates, backup and the other pages that used
     * to sit on a More settings page of their own. Every page is one tap from home: Hush settings
     * go at most one level deep.
     */
    private final Preference moreHeading;
    /** The home page's last row, which opens HushPinterest's Ko-fi page in a browser. */
    private final Preference support;
    /** Just above Support: a new GitHub bug report with this install's versions filled in. */
    private final Preference report;
    /** Under the home page's status card: a set of switches in one tap. */
    private final Preference quickSetups;
    /**
     * Shown on every page while a change waits for a restart: a tap restarts Pinterest and the
     * screen comes back on the same page ({@link ReopenSettingsAfterRestart}).
     */
    private final HushPinterestPreferenceFragment.Row restart;
    /** Keeps the shared fragment's restart toast off this screen, which shows the restart row instead. */
    private final AbstractPreferenceFragment.RestartFeedbackPresenter restartFeedback;
    /** The page the last rebuild drew, so a row coming or going on that same page keeps the list's place. */
    private String rebuiltPage;
    private final Preference empty;
    /** The line a category or search page starts with while a pause applies to it. */
    private final Preference pageStatus;
    /** Whether that line is about Pause, and so carries Resume or Undo. */
    private boolean pageAction;
    /** Keep a status action from shortening this page and clamping its current scroll offset. */
    private int pageStatusHeight;
    private String route = "";
    private String query = "";
    /**
     * The row Back returns to. With a screen reader on it takes accessibility focus once it's back
     * on screen: on the S22 TalkBack otherwise held the whole screen, and the person's place in
     * the list was lost.
     */
    private Preference refocus;
    private int homePosition;
    private int homeOffset;

    private final DataSetObserver changes = new DataSetObserver() {
        @Override public void onChanged() { rebuild(); }
        @Override public void onInvalidated() { rebuild(); }
    };

    SettingsNavigation(HushPinterestPreferenceFragment page, SettingsDialog host, Bundle saved) {
        this.page = page;
        this.host = host;
        screen = page.getPreferenceScreen();
        list = page.getView().findViewById(android.R.id.list);
        normalBottomPadding = list.getPaddingBottom();
        source = screen.getRootAdapter();
        Context context = screen.getContext();
        searchAliases = localizedSearchAliases();
        // Stable English route IDs survive a locale change; the displayed names are localized.
        Set<PatchFamily> build = PatchFamily.inThisBuild();
        section("Feed", L10n.t("Feed"), feedSummary(build), SettingsIcons.FEED, true);
        section("Privacy", L10n.t("Privacy"), null, SettingsIcons.BLOCK, true);
        section("Pin actions", L10n.t("Pin actions"), null, SettingsIcons.DOWNLOADS, true);
        section("Interface", L10n.t("Interface"), null, SettingsIcons.SETTINGS, true);
        section("Links", L10n.t("Links"), null, SettingsIcons.LINKS, false);
        section("Notifications", L10n.t("Notifications"), null, SettingsIcons.BELL, false);
        section("Pinterest's own settings", L10n.t("Pinterest's own settings"), null, SettingsIcons.SETTINGS, false);
        section("Updates", L10n.t("Updates"), null, SettingsIcons.UPDATES, false);
        section("Pause, backup and diagnostics", L10n.t("Pause, backup and diagnostics"), null, SettingsIcons.TOOLS, false);
        section("About", L10n.t("About"), null, SettingsIcons.ABOUT, false);
        browse = new HushPinterestPreferenceFragment.Heading(context);
        browse.setTitle(L10n.t("Browse settings"));
        moreHeading = new HushPinterestPreferenceFragment.Heading(context);
        moreHeading.setTitle(L10n.t("More settings"));
        support = link(context, L10n.t("Support HushPinterest"), null, SettingsIcons.OPENING);
        support.setKey(HushPinterestPreferenceFragment.SUPPORT);
        support.setOnPreferenceClickListener(row -> { HushPinterestPreferenceFragment.openSupport(row.getContext()); return true; });
        report = link(context, L10n.t("Report a problem"),
                L10n.t("Opens a GitHub report with your versions and settings filled in. Add what happened."), SettingsIcons.BUG);
        report.setKey(REPORT);
        report.setOnPreferenceClickListener(row -> { ReportProblemForm.open(row.getContext(), screen); return true; });
        quickSetups = link(context, L10n.t("Quick setups"),
                L10n.t("Turn on a set of switches in one tap, or put every switch back the way it started. Press and hold to hide this row."),
                SettingsIcons.TOOLS);
        quickSetups.setKey(QUICK_SETUPS);
        quickSetups.setOnPreferenceClickListener(ignored -> { page.showQuickSetups(); return true; });
        restart = new HushPinterestPreferenceFragment.Row(context);
        restart.setKey(RESTART);
        restart.setPersistent(false);
        // A tap restarts at once, so the row goes without a chevron.
        restart.actsAtOnce = true;
        restart.setSummary(L10n.t("Pinterest closes and reopens on this page."));
        restart.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restart.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), route);
            return true;
        });
        // The row appears as the switch flips, and the screen's live status reads its count to a
        // screen reader, since the row can land above the part of the list in view. This only
        // keeps the shared fragment's toast off the screen.
        restartFeedback = (shown, message) -> { };
        AbstractPreferenceFragment.setRestartFeedbackPresenter(restartFeedback);
        empty = new HushPinterestPreferenceFragment.Row(context);
        empty.setTitle(L10n.t("No matching settings"));
        empty.setSummary(L10n.t("Try a different word or clear the search."));
        empty.setSelectable(false);
        empty.setPersistent(false);
        pageStatus = new HushPinterestPreferenceFragment.Row(context);
        pageStatus.setSelectable(false);
        pageStatus.setPersistent(false);
        Bundle state = saved == null ? null : saved.getBundle(STATE);
        if (state != null) {
            route = state.getString("route", "");
            query = state.getString("query", "");
            homePosition = state.getInt("homePosition");
            homeOffset = state.getInt("homeOffset");
            // A route that names no page, such as "more" saved before More settings joined the
            // home page, opens home.
            if (selected() == null) route = "";
        } else {
            // Nothing saved: the page the screen was asked to open on, such as the one a restart
            // from the restart row left.
            route = host.startPage();
            if (selected() == null) route = "";
        }
        source.registerDataSetObserver(changes);
        list.setAdapter(this);
        list.setOnItemClickListener((parent, view, position, id) -> {
            Preference item = getItem(position);
            int original = originalPosition(item);
            if (original >= 0) {
                // PreferenceScreen indexes its OWN adapter, not the adapter on the ListView.
                screen.onItemClick(parent, view, original, source.getItemId(original));
            } else if (item.getOnPreferenceClickListener() != null) {
                item.getOnPreferenceClickListener().onPreferenceClick(item);
            }
        });
        // A long press takes Quick setups off the home page; a row on the Pause, backup and
        // diagnostics page brings it back. Every other row keeps the list's own long press.
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            if (getItem(position) != quickSetups) return false;
            page.hideQuickSetups();
            return true;
        });
        rebuild();
        host.showPage(title(), route.isEmpty(), query);
        if (state != null) showAt(state.getInt("position"), state.getInt("offset"));
    }

    private void section(String id, String title, String detail, String icon, boolean primary) {
        for (Preference candidate : page.sections()) {
            if (!title.contentEquals(candidate.getTitle())) continue;
            Preference link = link(screen.getContext(), title, detail, icon);
            link.setKey("section_" + id);
            link.setOnPreferenceClickListener(ignored -> { navigate(id); return true; });
            sections.add(new Section(id, (PreferenceCategory) candidate, link, primary));
            return;
        }
    }

    /**
     * The Feed row's line, naming what this build takes out of the lists Pinterest shows. Null when
     * neither family covers a list, since the page then holds only switches the line would leave
     * unnamed.
     */
    @Nullable
    static String feedSummary(Set<PatchFamily> build) {
        boolean ads = build.contains(PatchFamily.HIDE_ADS)
                && PatchFamily.HIDE_ADS.installedCapabilities().contains(PatchFamily.Capability.FEED_ADS);
        boolean ai = build.contains(PatchFamily.HIDE_AI_PINS)
                && PatchFamily.HIDE_AI_PINS.installedCapabilities().contains(PatchFamily.Capability.FEED_AI_PINS);
        if (ads && ai) return L10n.t("Promoted and AI-labeled pins");
        if (ads) return L10n.t("Promoted pins");
        return ai ? L10n.t("AI-labeled pins") : null;
    }

    /** Reviewed alternate words for actual setting keys, in this screen's current language. */
    static Map<String, String> localizedSearchAliases() {
        Map<String, String> aliases = new LinkedHashMap<>();
        aliases.put(Settings.DOWNLOAD_PINS.key, L10n.t("Save media"));
        aliases.put(Settings.HIDE_SEARCH_HISTORY.key, L10n.t("Recent searches autocomplete"));
        aliases.put(Settings.HIDE_NAV_NOTIFICATIONS.key, L10n.t("Activity alerts"));
        aliases.put(Settings.HIDE_HEADER_BUTTONS.key, L10n.t("Toolbar icons"));
        // All three black surfaces answer to the same words, so a build without one still finds the others.
        aliases.put(Settings.BLACK_BOTTOM_BAR.key, L10n.t("AMOLED dark theme"));
        aliases.put(Settings.BLACK_COMMENTS.key, L10n.t("AMOLED dark theme"));
        aliases.put(Settings.BLACK_PIN_MENU.key, L10n.t("AMOLED dark theme"));
        aliases.put(Settings.HIDE_PIN_MENU_VISUAL_SEARCH.key, L10n.t("Reverse image search"));
        aliases.put(Settings.HIDE_PIN_MENU_PIN_BOOST.key, L10n.t("Boost pin"));
        return Collections.unmodifiableMap(aliases);
    }

    private static Preference link(Context context, String title, String summary, String icon) {
        Preference row = new HushPinterestPreferenceFragment.Row(context);
        row.setTitle(title);
        row.setSummary(summary);
        row.setIcon(SettingsIcons.icon(context, icon, palette().heading));
        row.setPersistent(false);
        return row;
    }

    private Section selected() {
        for (Section section : sections) if (section.id.equals(route)) return section;
        return null;
    }

    private CharSequence title() {
        Section section = selected();
        return section == null ? "HushPinterest" : section.category.getTitle();
    }

    void navigate(String destination) {
        refocus = null;
        rememberIndex();
        pageStatusHeight = 0;
        query = "";
        route = destination;
        if (selected() == null) route = "";
        rebuild();
        host.showPage(title(), route.isEmpty(), query);
        showAt(0, 0);
        list.sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
    }

    boolean open(Preference preference) {
        for (Section section : sections) {
            if (preference != section.category && preference.getParent() != section.category) continue;
            navigate(section.id);
            // A link to one setting lands on its row rather than the top of a long page.
            int row = visible.indexOf(preference);
            if (row > 0) showAt(row, 0);
            return true;
        }
        return false;
    }

    void search(String text) {
        if (query.equals(text)) return;
        refocus = null;
        if (query.isEmpty()) rememberIndex();
        pageStatusHeight = 0;
        query = text;
        route = "";
        rebuild();
        showAt(query.isEmpty() ? homePosition : 0, query.isEmpty() ? homeOffset : 0);
    }

    boolean back() {
        if (!query.isEmpty()) {
            search("");
            host.showPage(title(), true, "");
            return true;
        }
        if (route.isEmpty()) return false;
        Section section = selected();
        pageStatusHeight = 0;
        // Every page opens from home, so Back goes home, to the place the list was left.
        route = "";
        rebuild();
        host.showPage(title(), true, query);
        showAt(homePosition, homeOffset);
        refocus = section != null ? section.link : null;
        return true;
    }

    private void showAt(int position, int offset) {
        // A header resize otherwise syncs the old page's visible children back over this
        // selection in touch mode. Rebind when changing pages; normal preference updates
        // still keep their current views and scroll position through notifyDataSetChanged.
        list.setAdapter(this);
        list.setSelectionFromTop(position, offset);
    }

    private void rememberIndex() {
        View first = list.getChildAt(0);
        int offset = first == null ? 0 : first.getTop();
        if (route.isEmpty() && query.isEmpty()) {
            homePosition = list.getFirstVisiblePosition();
            homeOffset = offset;
        }
    }

    void save(Bundle out) {
        Bundle state = new Bundle();
        state.putString("route", route);
        state.putString("query", query);
        state.putInt("homePosition", homePosition);
        state.putInt("homeOffset", homeOffset);
        state.putInt("position", list.getFirstVisiblePosition());
        View first = list.getChildAt(0);
        state.putInt("offset", first == null ? 0 : first.getTop());
        out.putBundle(STATE, state);
    }

    void close() {
        source.unregisterDataSetObserver(changes);
        AbstractPreferenceFragment.clearRestartFeedbackPresenter(restartFeedback);
    }

    /** A change that waits for a restart was made or taken back: the restart row comes, goes or counts again. */
    void restartChanged() { rebuild(); }

    /** Quick setups was hidden or brought back: the home page shows it or leaves it out from now on. */
    void quickSetupsChanged() { rebuild(); }

    private void rebuild() {
        int restartWas = visible.indexOf(restart);
        boolean pageStatusWas = visible.contains(pageStatus);
        visible.clear();
        List<String> terms = SettingsSearch.terms(query);
        Section selected = selected();
        if (!terms.isEmpty()) {
            for (Section section : sections) {
                boolean headingAdded = false;
                for (int i = 0; i < section.category.getPreferenceCount(); i++) {
                    Preference row = section.category.getPreference(i);
                    // Search only rows this build shows. An alias never creates an unavailable row.
                    // Text a row doesn't have adds nothing: a row with no summary used to carry the
                    // word "null" and come up for it.
                    if (!SettingsSearch.matchesTerms(terms, section.category.getTitle(), row.getTitle(),
                            row.getSummary(), searchAliases.get(row.getKey()))) continue;
                    if (!headingAdded) visible.add(section.category);
                    headingAdded = true;
                    visible.add(row);
                }
            }
            host.showResults(visible.size() - headings());
            if (visible.isEmpty()) visible.add(empty);
            else addPageStatus();
        } else if (selected != null) {
            for (int i = 0; i < selected.category.getPreferenceCount(); i++) visible.add(selected.category.getPreference(i));
            addPageStatus();
        } else {
            visible.add(screen.getPreference(0));
            if (!BaseSettings.HIDE_QUICK_SETUPS.savedValue()) visible.add(quickSetups);
            // Each heading only over pages this build has: a build with none of the feature
            // patches shows no empty Browse settings heading.
            boolean anyPrimary = false;
            boolean anyMore = false;
            for (Section section : sections) {
                if (section.primary) anyPrimary = true;
                else anyMore = true;
            }
            if (anyPrimary) visible.add(browse);
            for (Section section : sections) if (section.primary) visible.add(section.link);
            if (anyMore) visible.add(moreHeading);
            for (Section section : sections) if (!section.primary) visible.add(section.link);
            // Report a problem sits just above Support, which stays last.
            visible.add(report);
            visible.add(support);
        }
        addRestart();
        if (terms.isEmpty()) host.showResults(-1);
        // Undo can remove the entire status card. Reserve its former scroll range at the
        // bottom until navigation, without retaining a stale status row or changing choices.
        int bottom = normalBottomPadding + (visible.contains(pageStatus) ? 0 : pageStatusHeight);
        if (list.getPaddingBottom() != bottom) {
            list.setPadding(list.getPaddingLeft(), list.getPaddingTop(), list.getPaddingRight(), bottom);
        }
        notifyDataSetChanged();
        keepPlace(restartWas, pageStatusWas);
    }

    /**
     * The restart row, on whatever page is showing, while a change waits for a restart: under the
     * home page's status card or a page's pause line, and otherwise first. Its title counts the
     * changes a restart applies, and the screen's live status holds the same words.
     */
    private void addRestart() {
        Context context = screen.getContext();
        int count = ReopenSettingsAfterRestart.changesWaiting(context);
        if (count <= 0) {
            host.showRestartStatus(null);
            return;
        }
        restart.setTitle(L10n.quantity(context, count, "Restart Pinterest to apply this change",
                "Restart Pinterest to apply %1$d changes", count));
        // Every rebuild comes through here, and only a new count is a change to read.
        host.showRestartStatus(restart.getTitle());
        boolean underStatus = !visible.isEmpty()
                && (visible.get(0) == pageStatus || visible.get(0) == screen.getPreference(0));
        visible.add(underStatus ? 1 : 0, restart);
    }

    /**
     * The restart row comes and goes above the rows in view when a switch is flipped. On the same
     * page, with nothing else above moving, the list moves with it, so the row that was tapped
     * stays where it was. A row added at the top of what's in view is left to push the list down,
     * so it's seen.
     */
    private void keepPlace(int restartWas, boolean pageStatusWas) {
        String pageWas = rebuiltPage;
        rebuiltPage = route + '\n' + query;
        int restartNow = visible.indexOf(restart);
        if (!rebuiltPage.equals(pageWas) || (restartWas < 0) == (restartNow < 0)
                || pageStatusWas != visible.contains(pageStatus) || list.getChildCount() == 0) return;
        int first = list.getFirstVisiblePosition();
        int top = list.getChildAt(0).getTop();
        if (restartNow >= 0 && restartNow < first) list.setSelectionFromTop(first + 1, top);
        else if (restartWas >= 0 && restartWas < first) list.setSelectionFromTop(first - 1, top);
    }

    private int headings() {
        int count = 0;
        for (Preference item : visible) if (item instanceof PreferenceCategory) count++;
        return count;
    }

    /**
     * Starts a category or search page with a short line while HushPinterest is paused or a pause
     * or its end waits for a restart, when the page shows a switch Pause reaches. On a paused start
     * the switches keep showing what was saved, which read as active without it. Nothing here
     * changes a saved choice. A restart owed for anything else is the restart row's to say.
     */
    private void addPageStatus() {
        Context context = screen.getContext();
        boolean paused = HushPinterestPause.isPaused();
        boolean nextPaused = HushPinterestPause.pausesNextStart(context);
        pageAction = (paused || nextPaused) && showsPausable();
        if (!pageAction) return;
        pageStatus.setTitle(paused ? L10n.t("HushPinterest is paused") : L10n.t("HushPinterest is on"));
        // Worded like the Pause switch: Debug logging and what was set when patching stay in.
        pageStatus.setSummary(paused == nextPaused
                ? L10n.t("Until you resume, every switch but Debug logging acts as if it were off. "
                + "Changes made when you patched stay in.")
                : paused ? L10n.t("HushPinterest turns back on when Pinterest restarts.")
                : L10n.t("HushPinterest pauses when Pinterest restarts."));
        pageStatus.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette().summary : palette().heading));
        visible.add(0, pageStatus);
    }

    /** Whether the page shows a setting Pause answers for, or the Pause switch itself. */
    private boolean showsPausable() {
        for (Preference row : visible) {
            Setting<?> setting = row.hasKey() ? Setting.getSettingFromPath(row.getKey()) : null;
            if (setting != null && (!setting.isKeptWhenPaused() || setting == BaseSettings.PAUSED)) return true;
        }
        return false;
    }

    private int originalPosition(Preference item) {
        for (int i = 0; i < source.getCount(); i++) if (source.getItem(i) == item) return i;
        return -1;
    }

    @Override public int getCount() { return visible.size(); }
    @Override public Preference getItem(int position) { return visible.get(position); }
    @Override public long getItemId(int position) { return System.identityHashCode(getItem(position)); }
    @Override public boolean hasStableIds() { return true; }
    @Override public boolean areAllItemsEnabled() { return false; }
    @Override public boolean isEnabled(int position) { return getItem(position).isEnabled() && getItem(position).isSelectable(); }
    // Preference creates several incompatible layouts. Never recycle one kind into another.
    @Override public int getItemViewType(int position) { return IGNORE_ITEM_VIEW_TYPE; }

    @Override public View getView(int position, View recycled, ViewGroup parent) {
        Preference item = getItem(position);
        View row = item.getView(null, parent);
        if (item == refocus) {
            refocus = null;
            // Posted from the new row, it runs after this layout has put the row in the window.
            row.post(() -> row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        }
        if (!(item instanceof PreferenceCategory)) {
            Object group = group(item);
            boolean first = position == 0 || group(getItem(position - 1)) != group;
            boolean last = position + 1 == getCount() || group(getItem(position + 1)) != group;
            palette().paintSurface(row, item, first, last);
        }
        if (item == screen.getPreference(0)) {
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) {
                title.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 18);
                title.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
            }
            palette().paintStatusSurface(row);
        }
        if (item == screen.getPreference(0)) bindStatus(row);
        if (item == restart) palette().paintStatusSurface(row);
        if (item == pageStatus) {
            palette().paintStatusSurface(row);
            row.setMinimumHeight(Math.max(row.getMinimumHeight(), pageStatusHeight));
            if (pageAction) bindAction(row, HushPinterestPause.isPaused(), HushPinterestPause.pausesNextStart(screen.getContext()), true);
        }
        return row;
    }

    private void bindStatus(View row) {
        boolean nextPaused = HushPinterestPause.pausesNextStart(screen.getContext());
        boolean paused = HushPinterestPause.isPaused();
        TextView summary = row.findViewById(android.R.id.summary);
        if (!paused && !nextPaused && ReleaseCheck.statusLine() == null) {
            summary.setText(L10n.t("Your switches are working."));
        } else if (paused && nextPaused && HushPinterestPause.reason() == HushPinterestPause.Reason.SWITCH
                && !markerLeft()) {
            // A marker Resume couldn't remove keeps the card's own line, which says what to do.
            summary.setText(L10n.t("Your choices are saved. Tap Resume, then restart Pinterest."));
        }
        bindAction(row, paused, nextPaused, false);
    }

    /**
     * Pause, Resume or Undo in [row], whichever changes the next start. The list keeps its place,
     * so the page the button is on stays where it was.
     */
    private void bindAction(View row, boolean paused, boolean nextPaused, boolean pageStatusAction) {
        ViewGroup frame = row.findViewById(android.R.id.widget_frame);
        frame.removeAllViews();
        Button action = new Button(screen.getContext());
        action.setText(paused != nextPaused ? L10n.t("Undo") : nextPaused ? L10n.t("Resume") : L10n.t("Pause"));
        action.setAllCaps(false);
        action.setTextSize(14);
        action.setTypeface(android.graphics.Typeface.create("sans-serif-medium", 0));
        action.setTextColor(palette().heading);
        android.graphics.drawable.GradientDrawable outline = new android.graphics.drawable.GradientDrawable();
        outline.setColor(android.graphics.Color.TRANSPARENT);
        outline.setStroke(dp(1), palette().heading);
        outline.setCornerRadius(dp(8));
        action.setBackground(new android.graphics.drawable.RippleDrawable(
                android.content.res.ColorStateList.valueOf(ScreenColors.half(palette().accent)), outline, null));
        action.setStateListAnimator(null);
        action.setElevation(0);
        action.setMinWidth(dp(48));
        action.setMinHeight(dp(48));
        action.setMinimumWidth(dp(48));
        action.setMinimumHeight(dp(48));
        action.setPadding(dp(12), 0, dp(12), 0);
        action.setOnClickListener(ignored -> {
            if (pageStatusAction) pageStatusHeight = Math.max(pageStatusHeight, row.getHeight());
            if (nextPaused) {
                page.resumeFromOverview();
            } else {
                Preference pause = page.findPreference(BaseSettings.PAUSED.key);
                if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(!nextPaused);
            }
            rebuild();
        });
        // The overview gives its status action a full line. At larger text sizes, category
        // notices do the same so the button never squeezes their explanation.
        TextView summary = row.findViewById(android.R.id.summary);
        if ((!pageStatusAction || screen.getContext().getResources().getConfiguration().fontScale >= 1.5f)
                && summary != null && summary.getParent() instanceof android.widget.RelativeLayout) {
            android.widget.RelativeLayout.LayoutParams place = new android.widget.RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.addRule(android.widget.RelativeLayout.BELOW, android.R.id.summary);
            place.addRule(android.widget.RelativeLayout.ALIGN_PARENT_START);
            place.topMargin = dp(10);
            ViewGroup column = (ViewGroup) summary.getParent();
            View earlier = column.findViewWithTag(STATUS_ACTION);
            if (earlier != null) column.removeView(earlier);
            action.setTag(STATUS_ACTION);
            column.addView(action, place);
            frame.setVisibility(View.GONE);
            return;
        }
        frame.addView(action, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        frame.setVisibility(View.VISIBLE);
    }

    private boolean markerLeft() {
        java.io.File marker = HushPinterestPause.markerFile(screen.getContext());
        return marker != null && marker.exists();
    }

    private int dp(int value) { return Math.round(value * screen.getContext().getResources().getDisplayMetrics().density); }

    private Object group(Preference item) {
        if (item == moreHeading || item == support || item == browse || item == screen.getPreference(0)
                || item == restart || item == quickSetups || item == report) return item;
        if (item.getParent() != null) return item.getParent();
        return sections;
    }

    private static ScreenColors palette() { return ScreenColors.DEFAULT; }

    private static final class Section {
        final String id;
        final PreferenceCategory category;
        final Preference link;
        final boolean primary;
        Section(String id, PreferenceCategory category, Preference link, boolean primary) {
            this.id = id;
            this.category = category;
            this.link = link;
            this.primary = primary;
        }
    }
}
