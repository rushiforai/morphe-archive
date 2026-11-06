/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 837bac40e (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import android.content.Context;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ReopenSettingsAfterRestart;

/**
 * A view of the complete preference model: every section is a button on the one page that folds
 * its rows open under it. Filtering never removes preferences from their screen, so imports,
 * dependencies, persistence and restart notices still reach folded sections.
 */
@SuppressWarnings("deprecation")
final class SettingsNavigation extends BaseAdapter {
    private static final String STATE = "hushthreads_navigation";
    /** What a restart from the screen keeps of it: the open sections, the search and the list's place. */
    private static final String RESTART_STATE = "hushsettings://accordion";
    /** The Support section's id and the key of its button. */
    static final String SUPPORT = "support";
    /** Marks the Pause, Resume or Undo button placed under a status row's title, so a rebind replaces it. */
    private static final String STATUS_ACTION = "hushthreads_status_action";
    /** The restart row's key. Like the other rows only this view draws, it stores nothing. */
    static final String RESTART = "action_restart_to_apply";
    /** Support's own restart row, there whenever no change waits for one. */
    static final String RESTART_NOW = "action_restart_now";
    /** The main page's Quick setups row: Quiet, Privacy or Back to defaults in one tap ({@link QuickSetupKeys}). */
    static final String QUICK_SETUPS = "action_quick_setups";
    /** In Support: a new GitHub bug report with this install's versions filled in ({@link ReportProblemForm}). */
    static final String REPORT = "action_report_problem";
    /** Where the list or category choice is kept: a way of looking, so no backup carries it. */
    static final String VIEW_STORE = "hushthreads_settings_view";
    static final String LIST_VIEW = "list";
    private final HushThreadsPreferenceFragment page;
    private final SettingsDialog host;
    private final ListView list;
    private final PreferenceScreen screen;
    private final ListAdapter source;
    private final List<Section> sections = new ArrayList<>();
    private final List<Preference> visible = new ArrayList<>();
    /** The sections folded open, at most one at a time. */
    private final Set<String> expanded = new LinkedHashSet<>();
    /** Every section's rows on the one page under their headings, instead of a button per section. */
    private boolean listMode;
    private final Preference quickSetups;
    /** Report, restart and the project link fold open in the same list as the settings. */
    private final Preference support;
    private final PreferenceCategory supportHeading;
    /** Over Report a problem and Restart Threads, and over Support HushThreads, so help reads apart from donating. */
    private final Preference helpHeading;
    private final Preference projectHeading;
    /** The last row of Support, and so of the settings: HushThreads' Ko-fi page, in a browser. */
    private final Preference supportProject;
    private final Preference report;
    /**
     * Between Report a problem and Support HushThreads whenever no change waits for a restart: a
     * tap restarts Threads and the screen comes back as it was, for the times Threads needs a fresh
     * start anyway. While a change waits, {@link #restart} is the page's one restart row.
     */
    private final HushThreadsPreferenceFragment.Row restartNow;
    /** The build this is, in small type under everything else. */
    private final Preference buildDetails;
    private final Preference empty;
    /** The line search results start with while a pause applies to them. */
    private final Preference pageStatus;
    /** Whether that line is showing, with its Resume or Undo. */
    private boolean pageAction;
    /**
     * Shown at the top of the list while a change waits for a restart: a tap restarts Threads,
     * which opens this screen again as it was ({@link ReopenSettingsAfterRestart}).
     */
    private final HushThreadsPreferenceFragment.Row restart;
    /** Keeps the shared fragment's restart toast off this screen, which shows the restart row instead. */
    private final AbstractPreferenceFragment.RestartFeedbackPresenter restartFeedback;
    /** The navigation state at the last rebuild, so live row updates keep the list's place. */
    private String rebuiltPage;
    /** The section last opened or closed, or "" for none. */
    private String route = "";
    private String query = "";
    /**
     * The row that takes accessibility focus once it's back on screen: the button of a section
     * that was just opened or closed. On the S22 TalkBack otherwise held the whole screen, and the
     * person's place in the list was lost.
     */
    private Preference refocus;
    private int homePosition;
    private int homeOffset;
    private String homeAnchor = "";
    private Preference pendingAnchor;
    private int pendingOffset;

    /**
     * Row changes rebuild once, on the next main-thread turn. An import flips every changed switch
     * in one message, and a rebuild per switch re-ran search over every row each time.
     */
    private final Handler main = new Handler(Looper.getMainLooper());
    private boolean rebuildPosted;
    private final Runnable postedRebuild = this::rebuild;
    /** True once a restart change has rebuilt the list in this main-thread turn. */
    private boolean restartShownThisTurn;
    private final Runnable endOfRestartTurn = () -> restartShownThisTurn = false;
    private final DataSetObserver changes = new DataSetObserver() {
        @Override public void onChanged() { rebuildSoon(); }
        @Override public void onInvalidated() { rebuildSoon(); }
    };

    SettingsNavigation(HushThreadsPreferenceFragment page, SettingsDialog host, Bundle saved) {
        this.page = page;
        this.host = host;
        screen = page.getPreferenceScreen();
        list = page.getView().findViewById(android.R.id.list);
        source = screen.getRootAdapter();
        Context context = screen.getContext();
        listMode = context.getSharedPreferences(VIEW_STORE, Context.MODE_PRIVATE).getBoolean(LIST_VIEW, false);
        // Stable English route IDs survive a locale change; the displayed names are localized.
        String feedDetail = PatchFamily.HIDE_SUGGESTED_USERS.inBuild()
                ? (PatchFamily.HIDE_ADS.inBuild() ? L10n.t("Ads and suggested accounts in your feed")
                : L10n.t("Suggested accounts in your feed"))
                : PatchFamily.HIDE_ADS.inBuild() ? L10n.t("Sponsored posts in For you and Following")
                : PatchFamily.RETURN_REFRESH.inBuild() ? L10n.t("Where you left off in your feed")
                : PatchFamily.VIDEO_AUTOPLAY.inBuild() ? L10n.t("Videos in your feed")
                : L10n.t("Sponsored posts in For you and Following");
        // What Threads users change most comes first.
        section("Feed", L10n.t("Feed"), feedDetail, SettingsIcons.FEED);
        section("Privacy", L10n.t("Privacy"), L10n.t("Tracking in links and analytics uploads"), SettingsIcons.BLOCK);
        section("Comments", L10n.t("Comments"), L10n.t("Spam replies by words or links"), SettingsIcons.CHAT);
        section("Downloads", L10n.t("Downloads"), L10n.t("Photos and videos you save from posts"), SettingsIcons.DOWNLOADS);
        section("Posts", L10n.t("Posts"), PatchFamily.EXACT_POST_TIMES.inBuild()
                ? L10n.t("Copy text and exact post times") : L10n.t("Copy text when you hold a post"), SettingsIcons.CHAT);
        section("Appearance", L10n.t("Appearance"), null, SettingsIcons.APPEARANCE);
        section("Links", L10n.t("Links"), null, SettingsIcons.LINKS);
        section("Updates", L10n.t("Updates"), null, SettingsIcons.UPDATES);
        section("Set when you patched", L10n.t("Set when you patched"), null, SettingsIcons.CALENDAR);
        section("Pause, backup and diagnostics", L10n.t("Pause, backup and diagnostics"), null, SettingsIcons.STORAGE);
        section("About", L10n.t("About"), null, SettingsIcons.ABOUT);
        quickSetups = link(context, L10n.t("Quick setups"),
                L10n.t("Turn on a set of switches in one tap, or put every switch back the way it started. Press and hold to hide this row."),
                SettingsIcons.BUILD);
        quickSetups.setKey(QUICK_SETUPS);
        quickSetups.setOnPreferenceClickListener(ignored -> { page.showQuickSetups(); return true; });
        ((HushThreadsPreferenceFragment.Row) quickSetups).longPress = page::hideQuickSetups;
        // Its own mark, so it isn't read as a second About.
        support = link(context, L10n.t("Support"), L10n.t("Reports, restart and app information"), SettingsIcons.HELP);
        support.setKey(SUPPORT);
        support.setOnPreferenceClickListener(ignored -> { toggle(SUPPORT); return true; });
        supportHeading = new HushThreadsPreferenceFragment.Heading(context);
        supportHeading.setTitle(support.getTitle());
        helpHeading = new HushThreadsPreferenceFragment.Subheading(context);
        helpHeading.setTitle(L10n.t("Help and restart"));
        projectHeading = new HushThreadsPreferenceFragment.Subheading(context);
        projectHeading.setTitle(L10n.t("Support the project"));
        report = link(context, L10n.t("Report a problem"),
                L10n.t("Opens a GitHub report with your versions and settings filled in. Add what happened."), SettingsIcons.BUG);
        report.setKey(REPORT);
        report.setOnPreferenceClickListener(row -> { ReportProblemForm.open(row.getContext(), screen); return true; });
        restartNow = new HushThreadsPreferenceFragment.Row(context);
        restartNow.setKey(RESTART_NOW);
        restartNow.setPersistent(false);
        restartNow.actsAtOnce = true;
        restartNow.setTitle(L10n.t("Restart Threads"));
        restartNow.setSummary(L10n.t("Threads closes and reopens on this page."));
        restartNow.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restartNow.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), restartTarget());
            return true;
        });
        supportProject = link(context, L10n.t("Support HushThreads"), null, SettingsIcons.HEART);
        supportProject.setKey(HushThreadsPreferenceFragment.SUPPORT);
        supportProject.setOnPreferenceClickListener(row -> { HushThreadsPreferenceFragment.openSupport(row.getContext()); return true; });
        buildDetails = new HushThreadsPreferenceFragment.Row(context);
        buildDetails.setSummary(HushThreadsPreferenceFragment.overviewBuildDetails());
        buildDetails.setSelectable(false);
        buildDetails.setPersistent(false);
        empty = new HushThreadsPreferenceFragment.Row(context);
        empty.setTitle(L10n.t("No matching settings"));
        empty.setSummary(L10n.t("Try a different word or clear the search."));
        empty.setIcon(SettingsIcons.icon(context, SettingsIcons.SEARCH, palette().heading));
        empty.setSelectable(false);
        empty.setPersistent(false);
        pageStatus = new HushThreadsPreferenceFragment.Row(context);
        pageStatus.setSelectable(false);
        pageStatus.setPersistent(false);
        restart = new HushThreadsPreferenceFragment.Row(context);
        restart.setKey(RESTART);
        restart.setPersistent(false);
        // A tap restarts at once, so the row goes without a chevron.
        restart.actsAtOnce = true;
        restart.setSummary(L10n.t("Threads closes and reopens on this page."));
        restart.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restart.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), restartTarget());
            return true;
        });
        // The row appears as the switch flips, and the screen's live status reads its count to a
        // screen reader, since the row can land above the part of the list in view. This only
        // keeps the shared fragment's toast off the screen.
        restartFeedback = (shown, message) -> { };
        AbstractPreferenceFragment.setRestartFeedbackPresenter(restartFeedback);
        Bundle state = saved == null ? null : saved.getBundle(STATE);
        if (state == null) state = restartState(host.startPage());
        if (state != null) {
            route = state.getString("route", "");
            query = state.getString("query", "");
            homePosition = state.getInt("homePosition");
            homeOffset = state.getInt("homeOffset");
            homeAnchor = state.getString("homeAnchor", "");
            ArrayList<String> opened = state.getStringArrayList("expanded");
            if (opened != null) {
                for (String id : opened) if (header(id) != null) expanded.add(id);
            } else if (header(route) != null) {
                // State saved by the earlier page-per-section screen still opens its page's section.
                expanded.add(route);
            }
            if (header(route) == null) route = "";
        } else {
            // Nothing saved: the section the screen was asked to open on, such as the one a
            // restart marker from before this screen folded open names.
            route = host.startPage();
            if (header(route) != null) expanded.add(route);
            else route = "";
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
        // A long press takes Quick setups off the main page; a row in Pause, backup and
        // diagnostics brings it back. A row with no long press of its own leaves it alone.
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            Runnable longPress = HushThreadsPreferenceFragment.RowSemantics.longPressOf(getItem(position));
            if (longPress == null) return false;
            longPress.run();
            return true;
        });
        // That listener makes the list itself long-clickable, and a screen reader then stops on the
        // whole list to offer a long press. The list keeps it for touch, and RowSemantics offers it
        // on the one row that has one.
        list.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.setLongClickable(false);
                info.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
            }
        });
        rebuild();
        showPage();
        if (state != null) restoreAnchor(state.getString("anchor", ""), state.getInt("position"), state.getInt("offset"));
        else if (header(route) != null) showAt(visible.indexOf(anchorOf(route)), 0);
    }

    boolean listMode() {
        return listMode;
    }

    /**
     * Shows every section's rows on the one page under their headings ([list]), or a button per
     * section that folds it open, and keeps the choice for the next time the screen opens. The
     * list goes back to its top, under the toggle that was tapped.
     */
    void showAsList(boolean list) {
        if (listMode == list) return;
        listMode = list;
        screen.getContext().getSharedPreferences(VIEW_STORE, Context.MODE_PRIVATE).edit().putBoolean(LIST_VIEW, list).apply();
        refocus = null;
        rebuild();
        showPage();
        showAt(0, 0);
    }

    /** The row a jump to section [id] scrolls to: its button, or its heading in the list view. */
    @Nullable
    private Preference anchorOf(String id) {
        if (!listMode) return header(id);
        if (SUPPORT.equals(id)) return supportHeading;
        for (Section section : sections) if (section.id.equals(id)) return section.category;
        return null;
    }

    /** A section, found by the title its category was given, so a renamed category needs its title changed here too. */
    private void section(String id, String title, String detail, String icon) {
        for (Preference candidate : page.sections()) {
            if (!title.contentEquals(candidate.getTitle())) continue;
            Preference link = link(screen.getContext(), title, detail, icon);
            link.setKey("section_" + id);
            link.setOnPreferenceClickListener(ignored -> { toggle(id); return true; });
            sections.add(new Section(id, (PreferenceCategory) candidate, link));
            return;
        }
    }

    private static Preference link(Context context, String title, String summary, String icon) {
        Preference row = new HushThreadsPreferenceFragment.Row(context);
        row.setTitle(title);
        row.setSummary(summary);
        row.setIcon(SettingsIcons.icon(context, icon, palette().heading));
        row.setPersistent(false);
        return row;
    }

    private void showPage() {
        host.showPage("HushThreads", true, query);
        host.showViewToggle(listMode);
    }

    /** Opens section [destination] alone and scrolls it to the top, or folds every section for "". */
    void navigate(String destination) {
        refocus = null;
        query = "";
        route = header(destination) == null ? "" : destination;
        if (route.isEmpty()) expanded.clear();
        else openAlone(route);
        rebuild();
        showPage();
        showAt(route.isEmpty() ? 0 : visible.indexOf(anchorOf(route)), 0);
    }

    /** Opens [id] and folds every other open section, so the list never grows into several sections at once. */
    private void openAlone(String id) {
        for (Iterator<String> open = expanded.iterator(); open.hasNext(); ) {
            if (!open.next().equals(id)) open.remove();
        }
        expanded.add(id);
    }

    boolean isExpanded(String id) {
        return expanded.contains(id);
    }

    @Nullable
    private Preference header(String id) {
        if (SUPPORT.equals(id)) return support;
        for (Section section : sections) if (section.id.equals(id)) return section.link;
        return null;
    }

    @Nullable
    private String headerId(Preference item) {
        if (item == support) return SUPPORT;
        for (Section section : sections) if (section.link == item) return section.id;
        return null;
    }

    /** The route id of [category]'s section, which stays the same when its title is renamed. */
    @Nullable
    String sectionId(Preference category) {
        for (Section section : sections) if (section.category == category) return section.id;
        return null;
    }

    private void toggle(String id) {
        setExpanded(id, !expanded.contains(id));
    }

    private void setExpanded(String id, boolean open) {
        Preference header = header(id);
        if (header == null || expanded.contains(id) == open) return;
        int before = visible.indexOf(header);
        View bound = list.getChildAt(before - list.getFirstVisiblePosition());
        int top = bound == null ? 0 : bound.getTop();
        int position = list.getFirstVisiblePosition();
        String anchor = position < visible.size() ? rowToken(getItem(position)) : "";
        View first = list.getChildAt(0);
        int offset = first == null ? 0 : first.getTop();
        if (open) openAlone(id);
        else expanded.remove(id);
        route = id;
        query = "";
        refocus = header;
        rebuild();
        showPage();
        if (bound != null) {
            // Keep the tapped header in place, revealing at least one child near the bottom edge.
            // Until the top has scrolled away the list runs past the bottom of the screen by what's
            // left of it, so a header down there takes the top up first, as far as the child needs.
            HeaderColumn column = column();
            if (open && column != null) {
                int hidden = column.hiddenBelow();
                int lift = Math.min(hidden, Math.max(0, top + bound.getHeight() + dp(72) - (list.getHeight() - hidden)));
                column.setOffset(column.getScrollY() + lift);
            }
            int reveal = Math.max(0, list.getHeight() - bound.getHeight() - dp(72));
            showAt(visible.indexOf(header), open ? Math.min(top, reveal) : top);
        } else restoreAnchor(anchor, visible.indexOf(header), offset);
    }

    /** The column the list sits in, whose top scrolls away over it, or null outside the settings screen. */
    @Nullable
    private HeaderColumn column() {
        for (android.view.ViewParent parent = list.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof HeaderColumn) return (HeaderColumn) parent;
        }
        return null;
    }

    /** Opens the section [preference] belongs to, or is, and lands on its row. */
    boolean open(Preference preference) {
        for (Section section : sections) {
            if (preference != section.category && preference.getParent() != section.category) continue;
            navigate(section.id);
            // A link to one setting lands on its row rather than the top of a long section.
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
        rebuild();
        if (query.isEmpty()) restoreAnchor(homeAnchor, homePosition, homeOffset);
        else showAt(0, 0);
    }

    /** Back clears a search, back to where the list was; with no search the screen closes. */
    boolean back() {
        if (!query.isEmpty()) {
            search("");
            showPage();
            return true;
        }
        return false;
    }

    private void showAt(int position, int offset) {
        if (getCount() == 0) return;
        position = Math.max(0, Math.min(position, getCount() - 1));
        pendingAnchor = getItem(position);
        pendingOffset = offset;
        // A header resize otherwise syncs the old visible children back over this selection in
        // touch mode. Rebind when revealing a section; normal preference updates still keep their
        // current views and scroll position through notifyDataSetChanged.
        list.setAdapter(this);
        // Outside touch mode, selection skips read-only status rows and headings. Offset the next
        // selectable row by their full heights so the requested row still starts the page.
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
        if (query.isEmpty()) {
            homePosition = list.getFirstVisiblePosition();
            homeOffset = offset;
            homeAnchor = homePosition < getCount() ? rowToken(getItem(homePosition)) : "";
        }
    }

    /** The section last opened or closed, or "" for none. */
    String route() {
        return route;
    }

    void save(Bundle out) {
        out.putBundle(STATE, currentState());
    }

    private Bundle currentState() {
        rememberIndex();
        Bundle state = new Bundle();
        state.putString("route", route);
        state.putString("query", query);
        state.putInt("homePosition", homePosition);
        state.putInt("homeOffset", homeOffset);
        state.putString("homeAnchor", homeAnchor);
        state.putStringArrayList("expanded", new ArrayList<>(expanded));
        state.putInt("position", list.getFirstVisiblePosition());
        state.putString("anchor", list.getFirstVisiblePosition() < getCount()
                ? rowToken(getItem(list.getFirstVisiblePosition())) : "");
        View first = list.getChildAt(0);
        state.putInt("offset", first == null ? 0 : first.getTop());
        return state;
    }

    /** A name for [item] that finds it again after a restart, when every row is a new object. */
    private String rowToken(Preference item) {
        String id = headerId(item);
        if (id != null) return "section:" + id;
        for (Section section : sections) if (item == section.category) return "heading:" + section.id;
        if (item == supportHeading) return "heading:" + SUPPORT;
        if (item == buildDetails) return "build";
        if (item == screen.getPreference(0)) return "status";
        return item.hasKey() ? "key:" + item.getKey() : "";
    }

    private void restoreAnchor(String anchor, int fallback, int offset) {
        if (anchor != null && !anchor.isEmpty()) {
            for (int i = 0; i < getCount(); i++) if (anchor.equals(rowToken(getItem(i)))) {
                showAt(i, offset);
                return;
            }
        }
        showAt(fallback, offset);
    }

    /** The screen as it is, in the expiring, one-shot restart marker, which holds nothing but where to look. */
    private String restartTarget() {
        Bundle state = currentState();
        Uri.Builder uri = Uri.parse(RESTART_STATE).buildUpon();
        for (String id : expanded) uri.appendQueryParameter("open", id);
        for (String key : new String[]{"route", "query", "anchor", "homeAnchor"})
            uri.appendQueryParameter(key, state.getString(key, ""));
        for (String key : new String[]{"position", "offset", "homePosition", "homeOffset"})
            uri.appendQueryParameter(key, Integer.toString(state.getInt(key)));
        return uri.build().toString();
    }

    @Nullable
    private static Bundle restartState(String value) {
        if (value == null || !value.startsWith(RESTART_STATE + "?")) return null;
        Bundle state = new Bundle();
        if (value.length() > 32768) return state;
        Uri uri = Uri.parse(value);
        if (!"hushsettings".equals(uri.getScheme()) || !"accordion".equals(uri.getAuthority())) return state;
        state.putStringArrayList("expanded", new ArrayList<>(uri.getQueryParameters("open")));
        for (String key : new String[]{"route", "query", "anchor", "homeAnchor"}) {
            String text = uri.getQueryParameter(key);
            state.putString(key, text == null ? "" : text);
        }
        for (String key : new String[]{"position", "offset", "homePosition", "homeOffset"}) {
            try {
                int number = Integer.parseInt(uri.getQueryParameter(key));
                state.putInt(key, Math.max(-10000, Math.min(10000, number)));
            } catch (NumberFormatException malformed) {
                // A malformed marker opens at the top; it holds no settings, only where to look.
                state.putInt(key, 0);
            }
        }
        return state;
    }

    void close() {
        source.unregisterDataSetObserver(changes);
        main.removeCallbacks(postedRebuild);
        rebuildPosted = false;
        main.removeCallbacks(endOfRestartTurn);
        restartShownThisTurn = false;
        AbstractPreferenceFragment.clearRestartFeedbackPresenter(restartFeedback);
    }

    /**
     * A change that waits for a restart was made or taken back: the restart row comes, goes or
     * counts again. The first change in a main-thread turn shows at once; an import's other
     * changes in that turn share one rebuild on the next.
     */
    void restartChanged() {
        if (restartShownThisTurn) {
            rebuildSoon();
            return;
        }
        restartShownThisTurn = true;
        main.post(endOfRestartTurn);
        rebuild();
    }

    /** Quick setups was hidden or brought back: the main page shows it or leaves it out from now on. */
    void quickSetupsChanged() { rebuild(); }

    private void rebuildSoon() {
        if (rebuildPosted) return;
        rebuildPosted = true;
        main.post(postedRebuild);
    }

    private void rebuild() {
        if (rebuildPosted) {
            main.removeCallbacks(postedRebuild);
            rebuildPosted = false;
        }
        View first = list.getChildAt(0);
        Preference anchor = first != null && first.getTag() instanceof Preference
                ? (Preference) first.getTag() : pendingAnchor;
        int position = visible.indexOf(anchor);
        int offset = first == null ? pendingOffset : first.getTop();
        visible.clear();
        String terms = normalized(query).trim();
        boolean waiting = ReopenSettingsAfterRestart.changesWaiting(screen.getContext()) > 0;
        if (!terms.isEmpty()) {
            for (Section section : sections) {
                boolean headingAdded = false;
                for (int i = 0; i < section.category.getPreferenceCount(); i++) {
                    Preference row = section.category.getPreference(i);
                    if ("hushthreads_saves_heading".equals(row.getKey())) continue;
                    if (!matches(terms, section.category.getTitle(), row.getTitle(), row.getSummary())) continue;
                    if (!headingAdded) visible.add(section.category);
                    headingAdded = true;
                    visible.add(row);
                }
            }
            boolean supportAdded = false;
            for (Preference row : new Preference[]{report, restartNow, supportProject}) {
                if (row == restartNow && waiting) continue;
                if (!matches(terms, support.getTitle(), row.getTitle(), row.getSummary())) continue;
                if (!supportAdded) visible.add(supportHeading);
                supportAdded = true;
                visible.add(row);
            }
            host.showResults(visible.size() - headings());
            if (visible.isEmpty()) visible.add(empty);
            else addPageStatus();
        } else {
            // The card says why HushThreads is paused, or that a pause waits for a restart, and
            // shows a newer release the release check found. Otherwise the header says it all.
            if (HushThreadsPause.isPaused() || HushThreadsPause.pausesNextStart(screen.getContext())
                    || ReleaseCheck.statusLine() != null) visible.add(screen.getPreference(0));
            // Only in a build that lacks a default patch: its own line under the card.
            Preference missing = screen.findPreference(HushThreadsPreferenceFragment.MISSING_DEFAULTS);
            if (missing != null) visible.add(missing);
            if (!BaseSettings.HIDE_QUICK_SETUPS.savedValue()) visible.add(quickSetups);
            for (Section section : sections) {
                // The list view names each section over its rows, as search does, with no button to open.
                if (listMode && section.category.getPreferenceCount() == 0) continue;
                visible.add(listMode ? section.category : section.link);
                if (listMode || expanded.contains(section.id)) {
                    for (int i = 0; i < section.category.getPreferenceCount(); i++) visible.add(section.category.getPreference(i));
                }
            }
            visible.add(listMode ? supportHeading : support);
            if (listMode || expanded.contains(SUPPORT)) {
                visible.add(helpHeading);
                visible.add(report);
                if (!waiting) visible.add(restartNow);
                visible.add(projectHeading);
                visible.add(supportProject);
            }
            visible.add(buildDetails);
        }
        addRestart();
        bindAction(host.pauseAction, HushThreadsPause.isPaused(), HushThreadsPause.pausesNextStart(screen.getContext()));
        host.pauseAction.setVisibility(query.isEmpty() ? View.VISIBLE : View.GONE);
        if (terms.isEmpty()) host.showResults(-1);
        notifyDataSetChanged();
        keepPlace(anchor, position, offset);
    }

    /** Whether every one of [terms] is in one of [texts], accents and case aside. */
    private static boolean matches(String terms, CharSequence... texts) {
        StringBuilder all = new StringBuilder();
        for (CharSequence text : texts) if (text != null) all.append(text).append(' ');
        String haystack = normalized(all.toString());
        for (String term : terms.split("\\s+")) if (!haystack.contains(term)) return false;
        return true;
    }

    /**
     * The restart row, at the top of the list while a change waits for a restart, under the
     * status card or the search's pause line when one shows. Its title counts the changes a
     * restart applies, and the screen's live status holds the same words.
     */
    private void addRestart() {
        Context context = screen.getContext();
        int count = ReopenSettingsAfterRestart.changesWaiting(context);
        if (count <= 0) {
            host.showRestartStatus(null);
            return;
        }
        restart.setTitle(L10n.quantity(context, count, "Restart Threads to apply this change",
                "Restart Threads to apply %1$d changes", count));
        // Every rebuild comes through here, and only a new count is a change to read.
        host.showRestartStatus(restart.getTitle());
        boolean underStatus = !visible.isEmpty()
                && (visible.get(0) == pageStatus || visible.get(0) == screen.getPreference(0));
        visible.add(underStatus ? 1 : 0, restart);
    }

    /** Keeps the same row in view when notices or live rows change above it. */
    private void keepPlace(Preference anchor, int position, int offset) {
        String pageWas = rebuiltPage;
        rebuiltPage = route + '\n' + query + '\n' + listMode + '\n' + expanded;
        if (!rebuiltPage.equals(pageWas) || anchor == null || position < 0) return;
        int next = visible.indexOf(anchor);
        // At the very top, a new notice is allowed to appear. A scrolled list keeps its row and offset.
        if (next >= 0 && next != position && (position > 0 || offset < 0)) showAt(next, offset);
    }

    private int headings() {
        int count = 0;
        for (Preference item : visible) if (item instanceof PreferenceCategory) count++;
        return count;
    }

    /**
     * Starts search results with a short line while HushThreads is paused or a pause or its end
     * waits for a restart, when they show a switch Pause reaches. On a paused start the switches
     * keep showing what was saved, which read as active without it. Nothing here changes a saved
     * choice. A restart owed for anything else is the restart row's to say.
     */
    private void addPageStatus() {
        Context context = screen.getContext();
        boolean paused = HushThreadsPause.isPaused();
        boolean nextPaused = HushThreadsPause.pausesNextStart(context);
        pageAction = (paused || nextPaused) && showsPausable();
        if (!pageAction) return;
        pageStatus.setTitle(paused ? L10n.t("HushThreads is paused") : L10n.t("HushThreads is on"));
        // Worded like the Pause switch: Debug logging and what was set when patching stay in.
        pageStatus.setSummary(paused == nextPaused
                ? L10n.t("Until you resume, every switch but Debug logging acts as if it were off. "
                + "Changes made when you patched stay in.")
                : paused ? L10n.t("HushThreads turns back on when Threads restarts.")
                : L10n.t("HushThreads pauses when Threads restarts."));
        pageStatus.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette().summary : palette().heading));
        visible.add(0, pageStatus);
    }

    /** Whether the list shows a setting Pause answers for, or the Pause switch itself. */
    private boolean showsPausable() {
        for (Preference row : visible) {
            Setting<?> setting = row.hasKey() ? Setting.getSettingFromPath(row.getKey()) : null;
            if (setting != null && (!setting.isKeptWhenPaused() || setting == BaseSettings.PAUSED)) return true;
        }
        return false;
    }

    private static String normalized(String value) {
        return Normalizer.normalize(value, Normalizer.Form.NFD).replaceAll("\\p{M}+", "").toLowerCase(Locale.ROOT);
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
        row.setTag(item);
        if (item == buildDetails) {
            row.setBackgroundColor(palette().background);
            row.setPaddingRelative(dp(16), dp(10), dp(16), dp(10));
            row.setMinimumHeight(0);
            TextView detail = row.findViewById(android.R.id.summary);
            detail.setTag(SettingsDialog.BUILD_DETAILS);
            detail.setTextSize(11);
            return row;
        }
        if (item == refocus) {
            refocus = null;
            // Posted from the new row, it runs after this layout has put the row in the window.
            row.post(() -> row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
        }
        // A heading is drawn on the page itself, over the cards it names.
        if (!(item instanceof HushThreadsPreferenceFragment.Subheading) && !(item instanceof PreferenceCategory)) {
            Object group = group(item);
            boolean first = position == 0 || group(getItem(position - 1)) != group;
            boolean last = position + 1 == getCount() || group(getItem(position + 1)) != group;
            palette().paintSurface(row, item, first, last, overview(item));
        }
        if (item == restart) palette().paintRestartBar(row);
        String sectionId = headerId(item);
        if (sectionId != null) bindHeader(row, item, sectionId);
        if (item == screen.getPreference(0)) {
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) title.setTypeface(android.graphics.Typeface.create("sans-serif-medium", 0));
            bindStatus(row);
        }
        if (item == pageStatus && pageAction) {
            bindAction(row, HushThreadsPause.isPaused(), HushThreadsPause.pausesNextStart(screen.getContext()));
        }
        return row;
    }

    /** A section's button says whether it's open, and a screen reader can open or fold it. */
    private void bindHeader(View row, Preference item, String id) {
        boolean open = expanded.contains(id);
        row.setAccessibilityHeading(true);
        // Android 9 and 10 have no state description; the expand or collapse action says it there.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) row.setStateDescription(L10n.t(open ? "Expanded" : "Collapsed"));
        View arrow = row.findViewWithTag(ScreenColors.CHEVRON);
        if (arrow != null) {
            boolean rtl = row.getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            arrow.setRotation((open ? -90 : 90) * (rtl ? -1 : 1));
        }
        TextView title = row.findViewById(android.R.id.title);
        if (title != null && open) title.setTextColor(palette().heading);
        row.setAccessibilityDelegate(new HushThreadsPreferenceFragment.RowSemantics(item, Button.class) {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                boolean shown = expanded.contains(id);
                info.setHeading(true);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) info.setStateDescription(L10n.t(shown ? "Expanded" : "Collapsed"));
                info.addAction(shown ? AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE
                        : AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND);
            }

            @Override public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
                if (action == AccessibilityNodeInfo.ACTION_EXPAND || action == AccessibilityNodeInfo.ACTION_COLLAPSE) {
                    setExpanded(id, action == AccessibilityNodeInfo.ACTION_EXPAND);
                    return true;
                }
                return super.performAccessibilityAction(host, action, arguments);
            }
        });
    }

    private void bindStatus(View row) {
        boolean nextPaused = HushThreadsPause.pausesNextStart(screen.getContext());
        boolean paused = HushThreadsPause.isPaused();
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null && paused && nextPaused && HushThreadsPause.reason() == HushThreadsPause.Reason.SWITCH
                && !markerLeft()) {
            // A marker Resume couldn't remove keeps the card's own line, which says what to do.
            summary.setText(L10n.t("Your choices are saved. Tap Resume, then restart Threads."));
        }
        bindAction(row, paused, nextPaused);
    }

    /**
     * Pause, Resume or Undo, whichever changes the next start: in the toolbar's [row] button, or
     * in [row]'s widget frame. The list keeps its place, so the row the button is on stays where
     * it was.
     */
    private void bindAction(View row, boolean paused, boolean nextPaused) {
        ViewGroup frame = row.findViewById(android.R.id.widget_frame);
        if (frame != null) {
            frame.removeAllViews();
            // A frame that matches the row's height never adds to it, so the row was as tall as its
            // two lines of text and the button inside was held under its 48dp floor (39.5dp on a
            // Galaxy S22).
            ViewGroup.LayoutParams frameSize = frame.getLayoutParams();
            if (frameSize != null && frameSize.height == ViewGroup.LayoutParams.MATCH_PARENT) {
                frameSize.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                frame.setLayoutParams(frameSize);
            }
        }
        Button action = row instanceof Button ? (Button) row : new Button(screen.getContext());
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
                if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(true);
            }
            rebuild();
        });
        if (row == action || frame == null) return;
        // From one and a half times the text size, a button beside the text leaves the name too
        // little room and it breaks inside the word. Keep the action above the summary, which can
        // hold a long recovery line, so it stays in view before scrolling.
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
        java.io.File marker = HushThreadsPause.markerFile(screen.getContext());
        return marker != null && marker.exists();
    }

    private int dp(int value) { return Math.round(value * screen.getContext().getResources().getDisplayMetrics().density); }

    /** The rows that share one card: a section's, or Support's. Anything else stands alone. */
    Object group(Preference item) {
        if (item == screen.getPreference(0) || item == restart || item == buildDetails) return item;
        if (headerId(item) != null || item instanceof HushThreadsPreferenceFragment.Subheading) return item;
        if (item == report || item == restartNow || item == supportProject) return support;
        if (item.getParent() != null) return item.getParent();
        return sections;
    }

    /**
     * Whether [item] is drawn edge to edge as a row of the page itself (a section's button, the
     * status card, a notice) rather than in a section's inset card. Support's own rows belong to
     * no section and still sit in its card.
     */
    private boolean overview(Preference item) {
        return !(item.getParent() instanceof PreferenceCategory)
                && item != report && item != restartNow && item != supportProject;
    }

    private static ScreenColors palette() { return ScreenColors.DEFAULT; }

    private static final class Section {
        final String id;
        final PreferenceCategory category;
        final Preference link;
        Section(String id, PreferenceCategory category, Preference link) {
            this.id = id;
            this.category = category;
            this.link = link;
        }
    }
}
