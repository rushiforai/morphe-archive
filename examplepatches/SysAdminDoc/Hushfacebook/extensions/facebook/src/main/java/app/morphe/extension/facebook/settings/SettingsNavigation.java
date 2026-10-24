/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

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

import androidx.annotation.Nullable;
import android.widget.Button;
import android.widget.LinearLayout;
import android.preference.SwitchPreference;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart;
import app.morphe.extension.shared.settings.preference.SettingsSearch;

/**
 * A view of the complete preference model. Filtering never removes preferences from their
 * screen, so imports, dependencies, persistence and restart notices still reach hidden pages.
 */
@SuppressWarnings("deprecation")
final class SettingsNavigation extends BaseAdapter {
    private static final String STATE = "hushfacebook_navigation";
    private static final String MORE = "more";
    /** Marks the Pause, Resume or Undo button placed under a status row's title, so a rebind replaces it. */
    private static final String STATUS_ACTION = "hushfacebook_status_action";
    /** The restart row's key. Like the other rows only this view draws, it stores nothing. */
    static final String RESTART = "action_restart_to_apply";
    static final String QUICK_SETUPS = "action_quick_setups";
    /** The page whose Quick setups on the home page row brings the home row back. */
    static final String QUICK_SETUPS_PAGE = "Pause, backup and diagnostics";
    static final String REPORT = "action_report_problem";
    /** The home page's own restart row, there whether or not a change waits. */
    static final String RESTART_NOW = "action_restart_now";
    private final HushfacebookPreferenceFragment page;
    private final SettingsDialog host;
    private final ListView list;
    private final PreferenceScreen screen;
    private final ListAdapter source;
    private final List<Section> sections = new ArrayList<>();
    private final List<Preference> visible = new ArrayList<>();
    private final Object guideLinks = new Object();
    /** Which rows the person hasn't seen yet, for the dot beside them. Null when it couldn't start. */
    @Nullable private final NewRowDots dots;
    private final Preference browse;
    private final Preference more;
    /** The home page's last row, which opens Hushfacebook's Ko-fi page in a browser. */
    private final Preference support;
    /** Just above Support: a new GitHub bug report with this install's versions filled in. */
    private final Preference report;
    /**
     * Between Report a problem and Support whenever no change waits for a restart: a tap restarts
     * Facebook and the screen comes back on the home page, for the times Facebook needs a fresh
     * start anyway (issue #155). While a change waits, {@link #restart} is the page's one restart row.
     */
    private final SettingsRows.Row restartNow;
    /** Just above Browse settings: a set of switches in one tap. */
    private final Preference quickSetups;
    /**
     * Shown on every page while a change waits for a restart: a tap restarts Facebook and the
     * screen comes back on the same page ({@link ReopenSettingsAfterRestart}).
     */
    private final SettingsRows.Row restart;
    /** Keeps the shared fragment's restart toast off this screen, which shows the restart row instead. */
    private final AbstractPreferenceFragment.RestartFeedbackPresenter restartFeedback;
    /** The page the last rebuild drew, so a row coming or going on that same page keeps the list's place. */
    private String rebuiltPage;
    private final Preference empty;
    /** The line a category or search page starts with while a pause applies to it. */
    private final Preference pageStatus;
    /** Whether that line is about Pause, and so carries Resume or Undo. */
    private boolean pageAction;
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
    private int morePosition;
    private int moreOffset;

    private final DataSetObserver changes = new DataSetObserver() {
        @Override public void onChanged() { rebuild(); }
        @Override public void onInvalidated() { rebuild(); }
    };

    SettingsNavigation(HushfacebookPreferenceFragment page, SettingsDialog host, Bundle saved) {
        this.page = page;
        this.host = host;
        screen = page.getPreferenceScreen();
        list = page.getView().findViewById(android.R.id.list);
        source = screen.getRootAdapter();
        Context context = screen.getContext();
        // Stable English route IDs survive a locale change; the displayed names are localized.
        section("Opening Facebook", L10n.t("Opening Facebook"), L10n.t("Marketplace only, Events only and your start tab"), SettingsIcons.OPENING, true);
        section("News feed", L10n.t("News feed"), L10n.t("Ads, suggestions and word filters"), SettingsIcons.FEED, true);
        section("Stories", L10n.t("Stories"), L10n.t("Suggestions, saving, auto-advance and viewing anonymously"), SettingsIcons.STORIES, true);
        section("Reels and Watch", L10n.t("Reels and Watch"), L10n.t("Cleaner reels and video controls"), SettingsIcons.REELS, true);
        section("Playback", L10n.t("Playback"), L10n.t("Tap to play, quality and resume"), SettingsIcons.PLAYBACK, true);
        section("Downloads", L10n.t("Downloads"), L10n.t("Quality, format and file names"), SettingsIcons.DOWNLOADS, true);
        section("Comments", L10n.t("Comments"), null, SettingsIcons.COMMENTS, false);
        section("Writing", L10n.t("Writing"), null, SettingsIcons.WRITING, false);
        section("Chats", L10n.t("Chats"), null, SettingsIcons.CHATS, false);
        section("Menu", L10n.t("Menu"), null, SettingsIcons.MENU, false);
        section("Meta's other products", L10n.t("Meta's other products"), null, SettingsIcons.BLOCK, false);
        section("Search", L10n.t("Search"), null, SettingsIcons.SEARCH, false);
        section("Marketplace", L10n.t("Marketplace"), null, SettingsIcons.MARKETPLACE, false);
        section("Notifications", L10n.t("Notifications"), null, SettingsIcons.NOTIFICATIONS, false);
        section("Links", L10n.t("Links"), null, SettingsIcons.LINKS, false);
        section("Privacy", L10n.t("Privacy"), null, SettingsIcons.TELEMETRY, false);
        section("Updates", L10n.t("Updates"), null, SettingsIcons.UPDATES, false);
        section("Appearance", L10n.t("Appearance"), null, SettingsIcons.APPEARANCE, false);
        section("Set when you patched", L10n.t("Set when you patched"), null, SettingsIcons.PATCHED, false);
        section("Pause, backup and diagnostics", L10n.t("Pause, backup and diagnostics"), null, SettingsIcons.TOOLS, false);
        section("About", L10n.t("About"), null, SettingsIcons.ABOUT, false);
        List<PreferenceCategory> pages = new ArrayList<>();
        for (Section section : sections) pages.add(section.category);
        dots = NewRowDots.create(context, pages);
        guideIcon(Settings.HIDE_FEED_REELS, SettingsIcons.FEED);
        guideIcon(Settings.TAP_TO_PLAY, SettingsIcons.PLAYBACK);
        guideIcon(Settings.HIDE_REELS_TAB, SettingsIcons.REELS);
        guideIcon(Settings.MARKETPLACE_ONLY, SettingsIcons.MARKETPLACE);
        browse = new SettingsRows.Heading(context);
        browse.setTitle(L10n.t("Browse settings"));
        more = link(context, L10n.t("More settings"), L10n.t("Additional Facebook preferences"), SettingsIcons.SETTINGS);
        more.setOnPreferenceClickListener(ignored -> { navigate(MORE); return true; });
        support = link(context, L10n.t("Support Hushfacebook"), null, SettingsIcons.OPENING);
        support.setKey(HushfacebookPages.SUPPORT);
        support.setOnPreferenceClickListener(row -> { HushfacebookPages.openSupport(row.getContext()); return true; });
        report = link(context, L10n.t("Report a problem"),
                L10n.t("Opens a GitHub report with your versions and settings filled in. Add what happened."), SettingsIcons.BUG);
        report.setKey(REPORT);
        report.setOnPreferenceClickListener(row -> { ReportProblemForm.open(row.getContext(), screen); return true; });
        restartNow = new SettingsRows.Row(context);
        restartNow.setKey(RESTART_NOW);
        restartNow.setPersistent(false);
        restartNow.actsAtOnce = true;
        restartNow.setTitle(L10n.t("Restart Facebook"));
        restartNow.setSummary(L10n.t("Facebook closes and reopens on this page."));
        restartNow.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restartNow.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), route);
            return true;
        });
        quickSetups = link(context, L10n.t("Quick setups"),
                L10n.t("Turn on a set of switches in one tap, or put every switch back the way it started. Press and hold to hide this row."),
                SettingsIcons.TOOLS);
        quickSetups.setKey(QUICK_SETUPS);
        quickSetups.setOnPreferenceClickListener(ignored -> { page.showQuickSetups(); return true; });
        restart = new SettingsRows.Row(context);
        restart.setKey(RESTART);
        restart.setPersistent(false);
        // A tap restarts at once, so the row goes without a chevron.
        restart.actsAtOnce = true;
        restart.setSummary(L10n.t("Facebook closes and reopens on this page."));
        restart.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restart.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), route);
            return true;
        });
        // The row appears as the switch flips. A screen reader hears the saved message as well,
        // since the row can land above the part of the list in view.
        restartFeedback = (shown, message) -> list.announceForAccessibility(message);
        AbstractPreferenceFragment.setRestartFeedbackPresenter(restartFeedback);
        empty = new SettingsRows.Row(context);
        empty.setTitle(L10n.t("No matching settings"));
        empty.setSummary(L10n.t("Try a different word or clear the search."));
        empty.setIcon(SettingsIcons.icon(context, SettingsIcons.SEARCH, palette().heading));
        empty.setSelectable(false);
        empty.setPersistent(false);
        pageStatus = new SettingsRows.Row(context);
        pageStatus.setSelectable(false);
        pageStatus.setPersistent(false);
        Bundle state = saved == null ? null : saved.getBundle(STATE);
        if (state != null) {
            route = state.getString("route", "");
            query = state.getString("query", "");
            homePosition = state.getInt("homePosition");
            homeOffset = state.getInt("homeOffset");
            morePosition = state.getInt("morePosition");
            moreOffset = state.getInt("moreOffset");
            if (!MORE.equals(route) && selected() == null) route = "";
        } else {
            // Nothing saved: the page the screen was asked to open on, such as the one a restart
            // from the restart row left.
            route = host.startPage();
            if (!MORE.equals(route) && selected() == null) route = "";
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
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            if (getItem(position) != quickSetups) return false;
            hideQuickSetups();
            return true;
        });
        rebuild();
        showPage();
        if (state != null) showAt(state.getInt("position"), state.getInt("offset"));
    }

    private void section(String id, String title, String detail, String icon, boolean primary) {
        for (Preference candidate : page.sections()) {
            if (!title.contentEquals(candidate.getTitle())) continue;
            Preference link = link(screen.getContext(), title, detail, icon);
            if (!primary) link.setIcon(SettingsIcons.icon(screen.getContext(), icon, palette().heading));
            link.setKey("section_" + id);
            link.setOnPreferenceClickListener(ignored -> { navigate(id); return true; });
            sections.add(new Section(id, (PreferenceCategory) candidate, link, primary));
            return;
        }
    }

    private static Preference link(Context context, String title, String summary, String icon) {
        Preference row = new SettingsRows.Row(context);
        row.setTitle(title);
        row.setSummary(summary);
        row.setIcon(SettingsIcons.icon(context, icon, palette().heading));
        row.setPersistent(false);
        return row;
    }

    private void guideIcon(Setting<?> setting, String icon) {
        Preference row = screen.findPreference("action_show_" + setting.key);
        if (row != null) row.setIcon(SettingsIcons.icon(screen.getContext(), icon, palette().heading));
    }

    private Section selected() {
        for (Section section : sections) if (section.id.equals(route)) return section;
        return null;
    }

    private CharSequence title() {
        if (MORE.equals(route)) return more.getTitle();
        Section section = selected();
        return section == null ? "Hushfacebook" : section.category.getTitle();
    }

    private void showPage() {
        host.showPage(title(), route.isEmpty(), query);
        String shownRoute = route;
        list.post(() -> {
            if (host.getDialog() != null && host.getDialog().isShowing() && list.isAttachedToWindow() && list.getAdapter() == this
                    && shownRoute.equals(route)) AuditMode.pageShown(list.getContext(), route, title());
        });
    }

    /** The page showing is left: what it listed is seen. A search result page isn't a page of its own. */
    private void leftPage() {
        Section section = selected();
        if (dots == null || section == null || !query.isEmpty()) return;
        try {
            dots.left(section.category);
        } catch (RuntimeException ignored) {
            // The dot stays a visit longer.
        }
    }

    /** Whether [item] gets the dot: a new row, or a home page row for a section with one. */
    private boolean fresh(Preference item) {
        if (dots == null || !query.isEmpty()) return false;
        try {
            for (Section section : sections) if (item == section.link) return dots.anyNew(section.category);
            return dots.isNew(item);
        } catch (RuntimeException failed) {
            return false;
        }
    }

    void navigate(String destination) {
        leftPage();
        refocus = null;
        rememberIndex();
        query = "";
        route = destination;
        if (!MORE.equals(route) && selected() == null) route = "";
        rebuild();
        showPage();
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
        query = text;
        route = "";
        rebuild();
        showAt(query.isEmpty() ? homePosition : 0, query.isEmpty() ? homeOffset : 0);
    }

    boolean back() {
        if (!query.isEmpty()) {
            search("");
            showPage();
            return true;
        }
        if (route.isEmpty()) return false;
        leftPage();
        Section section = selected();
        Preference left = section != null ? section.link : more;
        route = section != null && !section.primary ? MORE : "";
        rebuild();
        showPage();
        showAt(MORE.equals(route) ? morePosition : homePosition,
                MORE.equals(route) ? moreOffset : homeOffset);
        refocus = left;
        return true;
    }

    private void showAt(int position, int offset) {
        // A header resize otherwise syncs the old page's visible children back over this
        // selection in touch mode. Rebind when changing pages; normal preference updates
        // still keep their current views and scroll position through notifyDataSetChanged.
        list.setAdapter(this);
        // Outside touch mode, selection skips read-only status rows and headings. Offset the
        // next selectable row by their full heights so the requested row still starts the page.
        // No status becomes actionable, and no later animation moves the person's place.
        int selectable = position;
        int top = offset;
        if (!list.isInTouchMode()) {
            int width = list.getWidth();
            if (width == 0) width = list.getResources().getDisplayMetrics().widthPixels;
            int widthSpec = View.MeasureSpec.makeMeasureSpec(
                    width - list.getPaddingLeft() - list.getPaddingRight(), View.MeasureSpec.EXACTLY);
            while (selectable >= 0 && selectable < getCount() && !isEnabled(selectable)) {
                View row = getView(selectable++, null, list);
                row.measure(widthSpec, View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                top += row.getMeasuredHeight() + list.getDividerHeight();
            }
        }
        list.setSelectionFromTop(selectable < getCount() ? selectable : position,
                selectable < getCount() ? top : offset);
    }

    private void rememberIndex() {
        View first = list.getChildAt(0);
        int offset = first == null ? 0 : first.getTop();
        if (route.isEmpty() && query.isEmpty()) {
            homePosition = list.getFirstVisiblePosition();
            homeOffset = offset;
        } else if (MORE.equals(route)) {
            morePosition = list.getFirstVisiblePosition();
            moreOffset = offset;
        }
    }

    void save(Bundle out) {
        Bundle state = new Bundle();
        state.putString("route", route);
        state.putString("query", query);
        state.putInt("homePosition", homePosition);
        state.putInt("homeOffset", homeOffset);
        state.putInt("morePosition", morePosition);
        state.putInt("moreOffset", moreOffset);
        state.putInt("position", list.getFirstVisiblePosition());
        View first = list.getChildAt(0);
        state.putInt("offset", first == null ? 0 : first.getTop());
        out.putBundle(STATE, state);
    }

    void close() {
        leftPage();
        source.unregisterDataSetObserver(changes);
        AbstractPreferenceFragment.clearRestartFeedbackPresenter(restartFeedback);
    }

    /** The long press on the Quick setups row: it leaves the home page, and the toast says where it comes back. */
    private void hideQuickSetups() {
        BaseSettings.HIDE_QUICK_SETUPS.save(true);
        Preference restore = screen.findPreference(HushfacebookPages.QUICK_SETUPS_HOME);
        if (restore != null) restore.setSummary(HushfacebookPages.quickSetupsHomeSummary());
        rebuild();
        Utils.showToastLong(L10n.f("Quick setups hidden. Bring it back from %1$s.", L10n.t(QUICK_SETUPS_PAGE)));
    }

    /** The row on {@link #QUICK_SETUPS_PAGE} flipped the flag: the home page follows the next time it's drawn. */
    void quickSetupsChanged() { rebuild(); }

    /** A change that waits for a restart was made or taken back: the restart row comes, goes or counts again. */
    void restartChanged() { rebuild(); }

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
                    if (!SettingsSearch.matchesTerms(terms, section.category.getTitle(), row.getTitle(),
                            row.getSummary())) continue;
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
        } else if (MORE.equals(route)) {
            for (Section section : sections) if (!section.primary) visible.add(section.link);
        } else {
            visible.add(screen.getPreference(0));
            // Only after an update that turned switches off, until it's opened: its own line under the card.
            Preference startsOff = screen.findPreference(StartsOffNote.KEY);
            if (startsOff != null) visible.add(startsOff);
            // Only in a build that lacks Restore screens on a re-signed install: its own line under the card.
            Preference restore = screen.findPreference(HushfacebookPreferenceFragment.MISSING_RESTORE_TRUST);
            if (restore != null) visible.add(restore);
            // Only in a build that lacks another default patch: the card's own line under it.
            Preference missing = screen.findPreference(HushfacebookPreferenceFragment.MISSING_DEFAULTS);
            if (missing != null) visible.add(missing);
            if (!BaseSettings.HIDE_QUICK_SETUPS.get()) visible.add(quickSetups);
            visible.add(browse);
            for (Section section : sections) if (section.primary) visible.add(section.link);
            visible.add(more);
            visible.add(report);
            if (ReopenSettingsAfterRestart.changesWaiting(screen.getContext()) <= 0) visible.add(restartNow);
            visible.add(support);
        }
        addRestart();
        if (terms.isEmpty()) host.showResults(-1);
        notifyDataSetChanged();
        keepPlace(restartWas, pageStatusWas);
    }

    /**
     * The restart row, on whatever page is showing, while a change waits for a restart: under the
     * home page's status card or a page's pause line, and otherwise first. Its title counts the
     * changes a restart applies.
     */
    private void addRestart() {
        Context context = screen.getContext();
        int count = ReopenSettingsAfterRestart.changesWaiting(context);
        if (count <= 0) return;
        restart.setTitle(L10n.quantity(context, count, "Restart Facebook to apply this change",
                "Restart Facebook to apply %1$d changes", count));
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
     * Starts a category or search page with a short line while Hushfacebook is paused or a pause
     * or its end waits for a restart, when the page shows a switch Pause reaches. On a paused start
     * the switches keep showing what was saved, which read as active without it. Nothing here
     * changes a saved choice. A restart owed for anything else is the restart row's to say.
     */
    private void addPageStatus() {
        Context context = screen.getContext();
        boolean paused = HushfacebookPause.isPaused();
        boolean nextPaused = HushfacebookPause.pausesNextStart(context);
        pageAction = (paused || nextPaused) && showsPausable();
        if (!pageAction) return;
        pageStatus.setTitle(paused ? L10n.t("Hushfacebook is paused") : L10n.t("Hushfacebook is on"));
        // Worded like the Pause switch: Debug logging, Lock Facebook and what was set when patching stay in.
        pageStatus.setSummary(paused == nextPaused
                ? L10n.t("Until you resume, every switch but Debug logging and Lock Facebook acts as if it "
                + "were off. Changes made when you patched stay in.")
                : paused ? L10n.t("Hushfacebook turns back on when Facebook restarts.")
                : L10n.t("Hushfacebook pauses when Facebook restarts."));
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
            if (MORE.equals(route) && query.isEmpty()) {
                row.setMinimumHeight(dp(48));
                row.setPaddingRelative(dp(36), dp(10), dp(36), dp(10));
            }
        }
        NewRowDots.paint(row, fresh(item), palette().accent);
        if (item == screen.getPreference(0)) {
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) title.setTypeface(android.graphics.Typeface.create("sans-serif-medium", 0));
        }
        if (item == screen.getPreference(0)) bindStatus(row);
        if (item == pageStatus && pageAction) {
            bindAction(row, HushfacebookPause.isPaused(), HushfacebookPause.pausesNextStart(screen.getContext()));
        }
        if (item == screen.getPreference(0)) styleBuildDetails(row);
        return row;
    }

    /** Keep provenance visible without giving it the weight of the current running state. */
    private void styleBuildDetails(View row) {
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary == null) return;
        String value = summary.getText().toString();
        String detail = HushfacebookPreferenceFragment.overviewBuildDetails();
        int start = value.indexOf(detail);
        if (start < 0) return;
        android.text.SpannableStringBuilder styled = new android.text.SpannableStringBuilder(value);
        String caption = detail.replace('\n', ' ');
        styled.replace(start, start + detail.length(), caption);
        styled.setSpan(new android.text.style.RelativeSizeSpan(12f / 13f), start, start + caption.length(),
                android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        summary.setText(styled);
    }

    private void bindStatus(View row) {
        boolean nextPaused = HushfacebookPause.pausesNextStart(screen.getContext());
        boolean paused = HushfacebookPause.isPaused();
        TextView summary = row.findViewById(android.R.id.summary);
        String build = "\n" + HushfacebookPreferenceFragment.overviewBuildDetails();
        if (!paused && !nextPaused && ReleaseCheck.statusLine() == null) {
            summary.setText(L10n.t("Your controls are active.") + build);
        } else if (paused && nextPaused && HushfacebookPause.reason() == HushfacebookPause.Reason.SWITCH
                && !markerLeft()) {
            // A marker Resume couldn't remove keeps the card's own line, which says what to do.
            summary.setText(L10n.t("Tap Resume, then restart Facebook.") + build);
        }
        bindAction(row, paused, nextPaused);
    }

    /**
     * Pause, Resume or Undo in [row], whichever changes the next start. The list keeps its place,
     * so the page the button is on stays where it was.
     */
    private void bindAction(View row, boolean paused, boolean nextPaused) {
        ViewGroup frame = row.findViewById(android.R.id.widget_frame);
        frame.removeAllViews();
        Button action = new Button(screen.getContext());
        action.setText(paused != nextPaused ? L10n.t("Undo") : nextPaused ? L10n.t("Resume") : L10n.t("Pause"));
        action.setAllCaps(false);
        action.setTextSize(14);
        action.setTextColor(palette().heading);
        palette().outlineAction(action);
        action.setMinWidth(dp(48));
        action.setMinHeight(dp(48));
        action.setMinimumWidth(dp(48));
        action.setMinimumHeight(dp(48));
        action.setOnClickListener(ignored -> {
            if (nextPaused) {
                page.resumeFromOverview();
            } else {
                Preference pause = page.findPreference(BaseSettings.PAUSED.key);
                if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(!nextPaused);
            }
            rebuild();
        });
        // From one and a half times the text size, a button beside the text leaves the name too
        // little room and it breaks inside the word. Keep the action before long recovery advice.
        TextView summary = row.findViewById(android.R.id.summary);
        if (screen.getContext().getResources().getConfiguration().fontScale >= 1.5f
                && summary != null && summary.getParent() instanceof android.widget.RelativeLayout) {
            android.widget.RelativeLayout.LayoutParams place = new android.widget.RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.addRule(android.widget.RelativeLayout.BELOW, android.R.id.title);
            place.addRule(android.widget.RelativeLayout.ALIGN_PARENT_START);
            ViewGroup column = (ViewGroup) summary.getParent();
            View earlier = column.findViewWithTag(STATUS_ACTION);
            if (earlier != null) column.removeView(earlier);
            action.setTag(STATUS_ACTION);
            action.setId(View.generateViewId());
            column.addView(action, place);
            android.widget.RelativeLayout.LayoutParams detail = (android.widget.RelativeLayout.LayoutParams) summary.getLayoutParams();
            detail.addRule(android.widget.RelativeLayout.BELOW, action.getId());
            summary.setLayoutParams(detail);
            frame.setVisibility(View.GONE);
            return;
        }
        frame.addView(action, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        frame.setVisibility(View.VISIBLE);
    }

    private boolean markerLeft() {
        return HushfacebookPause.presentMarker(screen.getContext()) != null;
    }

    private int dp(int value) { return Math.round(value * screen.getContext().getResources().getDisplayMetrics().density); }

    Object group(Preference item) {
        if (item == more || item == support || item == browse || item == screen.getPreference(0)
                || item == restart || item == quickSetups || item == report) return item;
        for (Section section : sections) if (item == section.link) return section.primary ? sections : more;
        if (!query.trim().isEmpty() && item.getParent() != null) return item.getParent();
        String key = item.getKey();
        if (Settings.DEFAULT_COMMENT_ORDER.key.equals(key) || Settings.COMMENT_ORDER.key.equals(key)) {
            return Settings.COMMENT_ORDER;
        }
        // Guide destinations form one list; independent selectors keep their own surfaces.
        if (key != null && key.startsWith("action_show_")) return guideLinks;
        if (Settings.OPEN_ON_CHOSEN_TAB.key.equals(key) || Settings.START_TAB.key.equals(key)
                || Settings.FEEDS_SUBTAB.key.equals(key)) return Settings.OPEN_ON_CHOSEN_TAB;
        if (Settings.PLAYBACK_QUALITY.key.equals(key) || Settings.REELS_PLAYBACK_QUALITY.key.equals(key)
                || Settings.STORIES_PLAYBACK_QUALITY.key.equals(key)) return Settings.PLAYBACK_QUALITY;
        if (Settings.DOWNLOAD_QUALITY.key.equals(key)) return item;
        if (item.getParent() != null) return item.getParent();
        return sections;
    }

    private static ScreenColors palette() { return ScreenColors.current(); }

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
