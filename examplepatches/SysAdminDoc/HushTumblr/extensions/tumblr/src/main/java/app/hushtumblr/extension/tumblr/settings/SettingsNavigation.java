/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
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
package app.hushtumblr.extension.tumblr.settings;

import android.content.Context;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
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

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.Setting;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtumblr.extension.shared.settings.preference.ReopenSettingsAfterRestart;
import app.hushtumblr.extension.shared.settings.preference.SettingsSearch;

/**
 * A view of the complete preference model. Filtering never removes preferences from their
 * screen, so imports, dependencies, persistence and restart notices still reach hidden pages.
 */
@SuppressWarnings("deprecation")
final class SettingsNavigation extends BaseAdapter {
    private static final String STATE = "hushtumblr_navigation";
    /** Marks the Pause, Resume or Undo button placed under a status row's text, so a rebind replaces it. */
    private static final String STATUS_ACTION = "hushtumblr_status_action";
    /** The restart row's key. Like the other rows only this view draws, it stores nothing. */
    static final String RESTART = "action_restart_to_apply";
    static final String QUICK_SETUPS = "action_quick_setups";
    /** The pause line under a page's rows while HushTumblr is paused. */
    static final String PAGE_STATUS = "hushtumblr_page_status";
    /** The row on Pause, backup and diagnostics that hides or shows the Quick setups row again. Like the other rows only this view draws, it stores nothing. */
    static final String RESTORE_QUICK_SETUPS = "action_restore_quick_setups";
    /**
     * Whether a long press has taken the Quick setups row off the home page. The screen's own
     * choice: it stays out of settings files and a Quick setups preset, and a pause leaves it alone.
     */
    static final BooleanSetting HIDE_QUICK_SETUPS =
            new BooleanSetting("hushtumblr_hide_quick_setups", Boolean.FALSE, false, false);

    static {
        Setting.keepWhenPaused(HIDE_QUICK_SETUPS);
    }

    static final String REPORT = "action_report_problem";
    private final HushTumblrPreferenceFragment page;
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
    /** The home page's last row, which opens HushTumblr's Ko-fi page in a browser. A title, no summary. */
    private final Preference support;
    /** Just above Support: a new GitHub bug report with this install's versions filled in. */
    private final Preference report;
    /** Under the home page's status card: a set of switches in one tap. */
    private final Preference quickSetups;
    /**
     * Shown on every page while a change waits for a restart: a tap restarts Tumblr and the
     * screen comes back on the same page ({@link ReopenSettingsAfterRestart}).
     */
    private final HushTumblrPreferenceFragment.Row restart;
    /** Keeps the shared fragment's restart toast off this screen, which shows the restart row instead. */
    private final AbstractPreferenceFragment.RestartFeedbackPresenter restartFeedback;
    /** The page the last rebuild drew, so a row coming or going on that same page keeps the list's place. */
    private String rebuiltPage;
    /**
     * The row {@link #keepPlace} holds still, and its top, until the list next lays out. One switch
     * flip rebuilds the page dozens of times before that layout, and each rebuild's
     * notifyDataSetChanged puts the list back on the position it last laid out: after the restart
     * row came or went above, that's the row next to this one, and the page jumped a row.
     */
    private Preference held;
    private int heldTop;
    /**
     * Each row's height the last time it laid out with its own summary. A switch that's saving, or
     * a backup row waiting on saves, shows a one-line summary for a moment. At the end of a page the
     * shorter row let the list slide down to fill the space it left, and when the save finished the
     * row grew back below, so the page stayed lower by the difference.
     */
    private final Map<Preference, Integer> restingHeights = new WeakHashMap<>();
    /**
     * The rows in the list made while showing their own summary. A scroll adds rows without a
     * layout pass, so their heights are read from here before each rebuild.
     */
    private final Map<View, Preference> restingRows = new WeakHashMap<>();
    /**
     * Rows that lost the line under them (a restart note when the switch goes back, a failure when
     * the next save works) with the list at its end, and the height each keeps until navigation.
     * The shorter row let the list slide every row down to fill the space, so the tapped row moved.
     */
    private final Map<Preference, Integer> keptHeights = new WeakHashMap<>();
    /** The line regions already looked at for {@link #keptHeights}. A rebind makes new ones. */
    private final Map<View, Boolean> countedLines = new WeakHashMap<>();
    /** The row each view in the list was made for. */
    private final Map<View, Preference> madeRows = new WeakHashMap<>();
    private final View.OnLayoutChangeListener laidOut = (v, l, t, r, b, oldL, oldT, oldR, oldB) -> held = null;
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
     * The row Back returns to, or the row a screen reader was on when its page was rebuilt. With a
     * screen reader on it takes accessibility focus once it's back on screen: on the S22 TalkBack
     * otherwise held the whole screen, and the person's place in the list was lost. Cleared when
     * the row takes focus, and by another page or a search.
     */
    private Preference refocus;
    /**
     * The row whose own button, such as the status card's Pause, the screen reader was on when the
     * page was rebuilt. Rows are made anew, so the reader goes back to the new row's button.
     */
    private Preference refocusAction;
    /** Without touch, whether {@link #keepTopAfterLayout} waits on the list's next layout. */
    private boolean keepingTop;
    /**
     * Without touch, the place and top of the row kept at the top while rows above the keys' row
     * change, with the restart row's place and the keys' row, all from before the first change.
     * Held until a layout shows that row back where it was. -1 when nothing is kept.
     */
    private int keptFirst = -1;
    private int keptTop;
    private int keptRestartWas;
    private Object keptKeys;
    private int keptLayouts;
    /** Without touch, the row the keys stayed on while rows changed, and its place before; see {@link #repeatsSelection}. */
    private Object keysStayed;
    private int keysStayedAt;
    private int homePosition;
    private int homeOffset;
    /** The first row in view a key could land on when home was left, and its top; see showPlace. */
    private int homeKeyPosition = -1;
    private int homeKeyTop;

    private final DataSetObserver changes = new DataSetObserver() {
        @Override public void onChanged() { rebuild(); }
        @Override public void onInvalidated() { rebuild(); }
    };

    SettingsNavigation(HushTumblrPreferenceFragment page, SettingsDialog host, Bundle saved) {
        this.page = page;
        this.host = host;
        screen = page.getPreferenceScreen();
        list = page.getView().findViewById(android.R.id.list);
        normalBottomPadding = list.getPaddingBottom();
        // Keys coming into the list after a touch found no row selected. The list's focus event,
        // sent before the list picks a row, read nothing to a screen reader, and the row it then
        // picked went where the row it last showed was, the status card here, so the card went
        // off screen. The event goes through this delegate with or without a screen reader on.
        list.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override public void sendAccessibilityEvent(View host, int eventType) {
                if (eventType == android.view.accessibility.AccessibilityEvent.TYPE_VIEW_FOCUSED) selectKeyRowInView();
                if (eventType == android.view.accessibility.AccessibilityEvent.TYPE_VIEW_SELECTED && repeatsSelection()) return;
                super.sendAccessibilityEvent(host, eventType);
            }
        });
        source = screen.getRootAdapter();
        Context context = screen.getContext();
        searchAliases = localizedSearchAliases();
        // Stable English route IDs survive a locale change; the displayed names are localized.
        section("Feed", L10n.t("Feed"), L10n.t("Ads, reblogs and word filters"), SettingsIcons.FEED, true);
        section("Posts", L10n.t("Posts"), L10n.t("Details and post actions"), SettingsIcons.POSTS, true);
        section("Interface", L10n.t("Interface"), L10n.t("Tabs, counts and appearance"), SettingsIcons.INTERFACE, true);
        section("Privacy", L10n.t("Privacy"), L10n.t("Tracking and app permissions"), SettingsIcons.BLOCK, true);
        section("Links", L10n.t("Links"), L10n.t("Choose where Tumblr links open"), SettingsIcons.LINKS, false);
        section("Notifications", L10n.t("Notifications"), L10n.t("Activity filters and push alerts"), SettingsIcons.BELL, false);
        section("Tumblr's own settings", L10n.t("Tumblr's own settings"), L10n.t("Controls managed by Tumblr"), SettingsIcons.SETTINGS, false);
        section("Updates", L10n.t("Updates"), L10n.t("Release checks and update help"), SettingsIcons.UPDATES, false);
        section("Set when you patched", L10n.t("Set when you patched"), null, SettingsIcons.PATCHED, false);
        section("Pause, backup and diagnostics", L10n.t("Pause, backup and diagnostics"), L10n.t("Pause, save and troubleshoot"), SettingsIcons.TOOLS, false);
        section("About", L10n.t("About"), L10n.t("Version, help and project details"), SettingsIcons.ABOUT, false);
        browse = new HushTumblrPreferenceFragment.Heading(context);
        browse.setTitle(L10n.t("Browse settings"));
        moreHeading = new HushTumblrPreferenceFragment.Heading(context);
        moreHeading.setTitle(L10n.t("More settings"));
        support = link(context, L10n.t("Support HushTumblr"), null, SettingsIcons.COFFEE);
        support.setKey(HushTumblrPreferenceFragment.SUPPORT);
        support.setOnPreferenceClickListener(row -> {
            HushTumblrPreferenceFragment.openSupport(row.getContext(), ((HushTumblrPreferenceFragment.Row) row).feedback);
            return true;
        });
        report = link(context, L10n.t("Report a problem"),
                L10n.t("Opens a GitHub report with your versions and settings filled in. Add what happened."), SettingsIcons.BUG);
        report.setKey(REPORT);
        report.setOnPreferenceClickListener(row -> {
            ReportProblemForm.open(row.getContext(), screen, ((HushTumblrPreferenceFragment.Row) row).feedback);
            return true;
        });
        quickSetups = link(context, L10n.t("Quick setups"),
                L10n.t("Turn on a set of switches in one tap, or put every switch back the way it started. Press and hold to hide this row."), SettingsIcons.TOOLS);
        quickSetups.setKey(QUICK_SETUPS);
        quickSetups.setOnPreferenceClickListener(ignored -> { page.showQuickSetups(); return true; });
        restart =new HushTumblrPreferenceFragment.Row(context);
        restart.setKey(RESTART);
        restart.setPersistent(false);
        // A tap restarts at once, so the row goes without a chevron.
        restart.actsAtOnce = true;
        restart.setSummary(L10n.t("Tumblr closes and reopens on this page."));
        restart.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restart.setOnPreferenceClickListener(row -> {
            restartWhenSaved(row.getContext(), route);
            return true;
        });
        // The row appears as the switch flips, and can land above the part of the list in view, so
        // the saved message goes under the row that was changed and is read from there once.
        restartFeedback = (shown, key, message) -> page.restartOwed(key, String.valueOf(message));
        AbstractPreferenceFragment.setRestartFeedbackPresenter(restartFeedback);
        empty = new HushTumblrPreferenceFragment.Row(context);
        empty.setTitle(L10n.t("No matching settings"));
        empty.setSummary(L10n.t("Try a different word or clear the search."));
        empty.setSelectable(false);
        empty.setPersistent(false);
        pageStatus = new HushTumblrPreferenceFragment.Row(context);
        // Keyed so a Resume tapped here says what it left to do here, and keeps it on a rebuild.
        pageStatus.setKey(PAGE_STATUS);
        pageStatus.setSelectable(false);
        pageStatus.setPersistent(false);
        Bundle state = saved == null ? null : saved.getBundle(STATE);
        if (state != null) {
            route = state.getString("route", "");
            query = state.getString("query", "");
            homePosition = state.getInt("homePosition");
            homeOffset = state.getInt("homeOffset");
            homeKeyPosition = state.getInt("homeKeyPosition", -1);
            homeKeyTop = state.getInt("homeKeyTop");
            Bundle results = state.getBundle("feedback");
            for (HushTumblrPreferenceFragment.Row row : ownRows()) row.feedback.restore(results, row.getKey());
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
        list.addOnLayoutChangeListener(laidOut);
        list.setAdapter(this);
        // A long press on Quick setups takes it off the home page, and Pause, backup and diagnostics brings it back.
        list.setOnItemLongClickListener((parent, view, position, id) -> {
            if (getItem(position) != quickSetups) return false;
            HIDE_QUICK_SETUPS.save(true);
            Preference restore = page.findPreference(RESTORE_QUICK_SETUPS);
            if (restore != null) restore.setSummary(HushTumblrPreferenceFragment.restoreQuickSetupsSummary());
            // Said under the link it names, on the same page, until that link is opened or the row comes back.
            String hint = L10n.f("Quick setups hidden. Bring it back from %1$s.", L10n.t("Pause, backup and diagnostics"));
            HushTumblrPreferenceFragment.Row tools = sectionLink(TOOLS_PAGE);
            if (tools != null) tools.feedback.show(hint);
            // The restore row's summary keeps the way back written down either way.
            else Utils.showToastLong(hint);
            rebuild();
            return true;
        });
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
        rebuild();
        host.showPage(title(), route.isEmpty(), query, description());
        if (state != null) showAt(state.getInt("position"), state.getInt("offset"));
    }

    private void section(String id, String title, String detail, String icon, boolean primary) {
        for (Preference candidate : page.sections()) {
            if (!title.contentEquals(candidate.getTitle())) continue;
            // Gray under both home page headings: a row that opens a page wears gray, and blue is
            // left for the rows that do something where they are.
            Preference link = link(screen.getContext(), title, detail, icon);
            link.setKey("section_" + id);
            link.setOnPreferenceClickListener(ignored -> {
                ((HushTumblrPreferenceFragment.Row) link).feedback.clear();
                navigate(id);
                return true;
            });
            sections.add(new Section(id, (PreferenceCategory) candidate, link, primary));
            return;
        }
    }

    /** Reviewed alternate words for actual setting keys, in this screen's current language. */
    static Map<String, String> localizedSearchAliases() {
        Map<String, String> aliases = new LinkedHashMap<>();
        aliases.put(Settings.HIDE_ADVERTISING_ID.key, L10n.t("Ad tracking"));
        aliases.put(Settings.FIX_PUSH_NOTIFICATIONS.key, L10n.t("Push alerts"));
        return Collections.unmodifiableMap(aliases);
    }

    private static Preference link(Context context, String title, String summary, String icon) {
        Preference row = new HushTumblrPreferenceFragment.Row(context);
        row.setTitle(title);
        row.setSummary(summary);
        row.setIcon(SettingsIcons.icon(context, icon, palette().heading));
        row.setPersistent(false);
        return row;
    }

    /** The route of the page that holds the Quick setups restore row. */
    static final String TOOLS_PAGE = "Pause, backup and diagnostics";

    @androidx.annotation.Nullable
    HushTumblrPreferenceFragment.Row sectionLink(String id) {
        for (Section section : sections) if (section.id.equals(id)) return (HushTumblrPreferenceFragment.Row) section.link;
        return null;
    }

    /** The row with [key] that this navigation draws itself, such as Quick setups, or null. */
    HushTumblrPreferenceFragment.Row ownRow(String key) {
        for (HushTumblrPreferenceFragment.Row row : ownRows()) if (key.equals(row.getKey())) return row;
        return null;
    }

    private List<HushTumblrPreferenceFragment.Row> ownRows() {
        List<HushTumblrPreferenceFragment.Row> rows = new ArrayList<>();
        for (Preference row : new Preference[] {support, report, quickSetups, pageStatus, restart}) rows.add((HushTumblrPreferenceFragment.Row) row);
        for (Section section : sections) rows.add((HushTumblrPreferenceFragment.Row) section.link);
        return rows;
    }

    /**
     * True when the row with [key] is on the page in view. Each page's rows stay built while
     * another page shows, and a result under one of those would go unseen.
     */
    boolean shows(String key) {
        for (Preference row : visible) if (key.equals(row.getKey())) return true;
        return false;
    }

    private Section selected() {
        for (Section section : sections) if (section.id.equals(route)) return section;
        return null;
    }

    private CharSequence title() {
        Section section = selected();
        return section == null ? "HushTumblr" : section.category.getTitle();
    }

    private CharSequence description() {
        Section section = selected();
        return section == null ? L10n.t("Make Tumblr feel like yours.") : section.link.getSummary();
    }

    void navigate(String destination) {
        refocus = null;
        rememberIndex();
        pageStatusHeight = 0;
        keptHeights.clear();
        query = "";
        route = destination;
        if (selected() == null) route = "";
        rebuild();
        host.showPage(title(), route.isEmpty(), query, description());
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
        keptHeights.clear();
        query = text;
        route = "";
        rebuild();
        if (query.isEmpty()) showPlace(homePosition, homeOffset, homeKeyPosition, homeKeyTop);
        else showAt(0, 0);
    }

    boolean back() {
        if (!query.isEmpty()) {
            search("");
            host.showPage(title(), true, "", description());
            return true;
        }
        if (route.isEmpty()) return false;
        Section section = selected();
        pageStatusHeight = 0;
        keptHeights.clear();
        // Every page opens from home, so Back goes home, to the place the list was left.
        route = "";
        rebuild();
        host.showPage(title(), true, query, description());
        showPlace(homePosition, homeOffset, homeKeyPosition, homeKeyTop);
        // Keys left on the header, as when the screen was made again on that page, went on from
        // there. Asked while the new adapter has no rows drawn, so a screen reader hears nothing
        // for it: later, it read the row the keys were about to leave.
        if (section != null && !list.isInTouchMode() && !list.hasFocus()) list.requestFocus();
        refocus = section != null ? section.link : null;
        if (refocus != null && screenReaderOn()) bringIntoView(refocus);
        // Without touch the list put the keys on the first row in view, not the row Enter opened.
        else if (section != null && !list.isInTouchMode()) selectWhereItStands(section.link, visible.indexOf(section.link));
        return true;
    }

    /**
     * Gives a screen reader's focus back to the row with [key] once it's drawn, as on the way back
     * from a file picker that row opened. The picker's screen took the reader's focus with it, and
     * the rows here are rebuilt while it's up, so the reader found nothing to go back to and
     * started at the page's header.
     */
    void focusOnReturn(String key) {
        if (key == null || !screenReaderOn()) return;
        for (Preference row : visible) {
            if (!key.equals(row.getKey())) continue;
            refocus = row;
            bringIntoView(row);
            notifyDataSetChanged();
            return;
        }
    }

    /**
     * A dialog opened over the page, as the import preview does once the picked file is read.
     * Focus still waiting for a row's next draw would go to that row behind the dialog.
     */
    void dialogOpened() {
        refocus = null;
    }

    /** The row in view that holds a screen reader's focus, or null for none. */
    private View rowReaderIsOn() {
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (child.createAccessibilityNodeInfo().isAccessibilityFocused() || readerOnAction(child) != null) return child;
        }
        return null;
    }

    /** The status action in [row] (Pause, Resume or Undo) when a screen reader is on it, or null. */
    private static View readerOnAction(View row) {
        View action = row.findViewWithTag(STATUS_ACTION);
        return action != null && action.createAccessibilityNodeInfo().isAccessibilityFocused() ? action : null;
    }

    private boolean screenReaderOn() {
        android.view.accessibility.AccessibilityManager a11y = (android.view.accessibility.AccessibilityManager)
                list.getContext().getSystemService(android.content.Context.ACCESSIBILITY_SERVICE);
        return a11y != null && a11y.isEnabled() && a11y.isTouchExplorationEnabled();
    }

    /**
     * Scrolls home to [row] when the place home was left doesn't show it, as after a restart, a
     * search or Jump to a section opened its page. Screen reader focus goes to the row when it's
     * drawn, so a row left off screen took focus whenever it was scrolled to later, long after
     * Back. Only with a screen reader on: without one, home keeps exactly the place it was left.
     * Checked once the list has laid out, and posted: a layout request made during layout is dropped.
     */
    private void bringIntoView(Preference row) {
        list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom) {
                list.removeOnLayoutChangeListener(this);
                // Focused already, which cleared refocus, or another page or a search came first.
                int position = visible.indexOf(row);
                if (refocus != row || position < 0) return;
                if (position >= list.getFirstVisiblePosition() && position <= list.getLastVisiblePosition()) {
                    // In view where home was left, while the keys went to the first row in view.
                    if (!list.isInTouchMode()) selectShown(row, position);
                    return;
                }
                list.post(() -> {
                    // The row above it shows too: its heading, or the page row before it.
                    if (refocus != row || visible.indexOf(row) != position) return;
                    list.setSelectionFromTop(Math.max(0, position - 1), 0);
                    // Without touch that selected the row above, so the next key started there
                    // while the screen reader read this one.
                    if (!list.isInTouchMode()) selectWhereItStands(row, position);
                });
            }
        });
    }

    /**
     * Gives the keys to [row] where the list draws it, so nothing moves. Once the list has laid
     * out, and posted: the screen reader's focus is posted from that layout and goes first, and
     * the list keeps the rows it has, the focused one included, when only the selection moves.
     */
    private void selectWhereItStands(Preference row, int position) {
        list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom) {
                list.removeOnLayoutChangeListener(this);
                selectShown(row, position);
            }
        });
    }

    /**
     * Called from a layout: selects [row] where the list just drew it, when it drew it. Cut off at
     * an edge it comes all the way in, or the next key only scrolled the rest of it in.
     */
    private void selectShown(Preference row, int position) {
        // A row a key can't land on, like the status card while HushTumblr is on, keeps the keys
        // where they are. Asked to select it, the list put the next row at its top instead, so a
        // screen reader on the card's Pause sent the card off screen.
        if (position < 0 || position >= getCount() || !isEnabled(position)) return;
        int first = list.getFirstVisiblePosition();
        View shown = position < first ? null : list.getChildAt(position - first);
        if (shown == null || visible.indexOf(row) != position) return;
        int area = list.getHeight() - list.getListPaddingTop() - list.getListPaddingBottom();
        int at = Math.max(0, Math.min(shown.getTop() - list.getListPaddingTop(), area - shown.getHeight()));
        list.post(() -> {
            if (!list.isInTouchMode() && visible.indexOf(row) == position && list.getSelectedItemPosition() != position) {
                list.setSelectionFromTop(position, at);
            }
        });
    }

    private void showAt(int position, int offset) {
        // A header resize otherwise syncs the old page's visible children back over this
        // selection in touch mode. Rebind when changing pages; normal preference updates
        // still keep their current views and scroll position through notifyDataSetChanged.
        list.setAdapter(this);
        // Without touch (a keyboard or D-pad) the list moves a selection to the first row a key
        // can land on and puts that row at the top, so a page opened past its pause line. A new
        // adapter already fills from the top, with that row selected under the line.
        if (position == 0 && offset == 0 && !list.isInTouchMode()) return;
        list.setSelectionFromTop(position, offset);
    }

    /**
     * Puts a list back at the place it was left: [position] at [offset], where [keyPosition] was
     * the first row in view a key could land on and [keyTop] its top. Without touch,
     * setSelectionFromTop moves to the first such row at or after [position] and pins that one at
     * the offset, so a place left on a heading or the status card came back a row off. There that
     * key row goes back where it was, and the rows above it fill in above it again. Only while
     * it's still the first row a key lands on from [position], since a row can come or go while
     * home isn't showing (the restart row, Quick setups), and only while its top still fits in
     * the list, which can be shorter now than when it was left.
     */
    private void showPlace(int position, int offset, int keyPosition, int keyTop) {
        boolean byKeyRow = !list.isInTouchMode() && (position != 0 || offset != 0)
                && keyPosition > position && keyPosition < getCount() && isEnabled(keyPosition)
                && keyTop < list.getHeight() - list.getListPaddingBottom();
        for (int row = position; byKeyRow && row < keyPosition; row++) byKeyRow = !isEnabled(row);
        if (byKeyRow) showAt(keyPosition, keyTop - list.getListPaddingTop());
        else showAt(position, offset);
    }

    /**
     * Without touch and with no row selected, selects the first row in view a key can land on
     * where it stands, and lays the list out at once, so the row is selected before the list
     * picks one itself.
     */
    private void selectKeyRowInView() {
        if (list.isInTouchMode() || list.getSelectedItemPosition() != android.widget.AdapterView.INVALID_POSITION) return;
        int first = list.getFirstVisiblePosition();
        int area = list.getHeight() - list.getListPaddingTop() - list.getListPaddingBottom();
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            if (first + i >= getCount() || !isEnabled(first + i) || child.getTop() < list.getListPaddingTop()) continue;
            list.setSelectionFromTop(first + i, Math.min(child.getTop() - list.getListPaddingTop(), Math.max(0, area - child.getHeight())));
            list.measure(View.MeasureSpec.makeMeasureSpec(list.getWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(list.getHeight(), View.MeasureSpec.EXACTLY));
            list.layout(list.getLeft(), list.getTop(), list.getRight(), list.getBottom());
            return;
        }
    }

    /** The first row in view a key can land on, or -1. */
    private int keyRowInView() {
        int first = list.getFirstVisiblePosition();
        for (int i = 0; i < list.getChildCount(); i++) {
            if (first + i < getCount() && isEnabled(first + i)) return first + i;
        }
        return -1;
    }

    private int topOf(int position) {
        View row = position < 0 ? null : list.getChildAt(position - list.getFirstVisiblePosition());
        return row == null ? 0 : row.getTop();
    }

    private void rememberIndex() {
        View first = list.getChildAt(0);
        int offset = first == null ? 0 : first.getTop();
        if (route.isEmpty() && query.isEmpty()) {
            homePosition = list.getFirstVisiblePosition();
            homeOffset = offset;
            homeKeyPosition = keyRowInView();
            homeKeyTop = topOf(homeKeyPosition);
        }
    }

    void save(Bundle out) {
        Bundle state = new Bundle();
        state.putString("route", route);
        state.putString("query", query);
        state.putInt("homePosition", homePosition);
        state.putInt("homeOffset", homeOffset);
        state.putInt("homeKeyPosition", homeKeyPosition);
        state.putInt("homeKeyTop", homeKeyTop);
        state.putInt("position", list.getFirstVisiblePosition());
        View first = list.getChildAt(0);
        state.putInt("offset", first == null ? 0 : first.getTop());
        Bundle results = new Bundle();
        for (HushTumblrPreferenceFragment.Row row : ownRows()) row.feedback.save(results, row.getKey());
        state.putBundle("feedback", results);
        out.putBundle(STATE, state);
    }

    void close() {
        source.unregisterDataSetObserver(changes);
        list.removeOnLayoutChangeListener(laidOut);
        AbstractPreferenceFragment.clearRestartFeedbackPresenter(restartFeedback);
    }

    /** A change that waits for a restart was made or taken back: the restart row comes, goes or counts again. */
    void restartChanged() { rebuild(); }

    /** How often a restart waiting on saves looks again. */
    static final long RESTART_WAIT_MS = 50;
    /** A restart the row asked for is waiting on saves, so another tap doesn't queue a second. */
    private static volatile boolean restartWaiting;

    /**
     * The restart row's tap: Tumblr restarts into [page]. The edit worker runs saves on a pool, and
     * a switch or Quick setups save still running there would be cut off by the restart and come
     * back unchanged, so the restart waits until no save is left.
     */
    static void restartWhenSaved(Context context, String page) {
        if (HushTumblrPreferenceFragment.hasPendingEdits()) {
            if (restartWaiting) return;
            restartWaiting = true;
            // The screen can close while it waits, so the wait holds the application, not the page.
            Context application = context.getApplicationContext();
            Context restartFrom = application != null ? application : context;
            Utils.runOnMainThreadDelayed(() -> {
                restartWaiting = false;
                restartWhenSaved(restartFrom, page);
            }, RESTART_WAIT_MS);
            return;
        }
        ReopenSettingsAfterRestart.restartInto(context, page);
    }

    private void rebuild() {
        // Quick setups is back, so the line saying where to bring it back from is done.
        HushTumblrPreferenceFragment.Row tools = sectionLink(TOOLS_PAGE);
        if (tools != null && tools.feedback.message() != null && !HIDE_QUICK_SETUPS.get()) tools.feedback.clear();
        rememberRestingHeights();
        int restartWas = visible.indexOf(restart);
        boolean pageStatusWas = visible.contains(pageStatus);
        // On the same page, the row a screen reader is on. Rows are drawn anew for every change and
        // the list gives focus back by position, so the restart row coming in above a switch as it
        // flipped took the focus from it and read itself, then the switch's saved note.
        View readerOn = (route + '\n' + query).equals(rebuiltPage) && screenReaderOn() ? rowReaderIsOn() : null;
        View readerOnAction = readerOn == null ? null : readerOnAction(readerOn);
        Object reading = readerOn == null ? null : list.getItemAtPosition(list.getPositionForView(readerOn));
        Preference keysWas = keysRow();
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
            if (!HIDE_QUICK_SETUPS.get()) visible.add(quickSetups);
            // Each heading only over pages this build has: a build without Feed, Posts, Interface
            // or Privacy shows no empty Browse settings heading.
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
        if (reading instanceof Preference && visible.contains(reading)) {
            // Taken off the old row, so the list puts it nowhere, and given back to the same row
            // once that's drawn.
            (readerOnAction != null ? readerOnAction : readerOn)
                    .performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLEAR_ACCESSIBILITY_FOCUS, null);
            refocus = (Preference) reading;
            refocusAction = readerOnAction != null ? refocus : null;
            // A restart row put in at the top of the view can push the last row in view off it.
            bringIntoView(refocus);
        }
        notifyDataSetChanged();
        keepPlace(restartWas, pageStatusWas, keysWas);
        // A result that came back while its row's page wasn't in view shows once that page is.
        // Not from the constructor's first build, before the page knows this navigation.
        if (page.navigation == this) page.showUnseenResults();
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
        restart.setTitle(L10n.quantity(context, count, "Restart Tumblr to apply this change",
                "Restart Tumblr to apply %1$d changes", count));
        boolean underStatus = !visible.isEmpty()
                && (visible.get(0) == pageStatus || visible.get(0) == screen.getPreference(0));
        visible.add(underStatus ? 1 : 0, restart);
    }

    /**
     * The restart row comes and goes above the rows in view when a switch is flipped. On the same
     * page, with nothing else above moving, the list moves with it, so the row that was tapped
     * stays where it was. A row added at the top of what's in view is left to push the list down,
     * so it's seen. The row held stays held through every rebuild until the list lays out.
     */
    private void keepPlace(int restartWas, boolean pageStatusWas, Object keysWas) {
        String pageWas = rebuiltPage;
        rebuiltPage = route + '\n' + query;
        // Without touch the list keeps the row its keys are on in place itself, by its id. Holding
        // another row moved the keys there, since an untouched list selects the row it's told to
        // show, so a switch flipped by key under the top of scrolled results gave them to the top.
        boolean keyed = !list.isInTouchMode() && list.getSelectedItemPosition() != android.widget.AdapterView.INVALID_POSITION;
        boolean samePlace = rebuiltPage.equals(pageWas) && pageStatusWas == visible.contains(pageStatus) && list.getChildCount() > 0;
        if (keyed && samePlace) {
            keepTopWithKeys(restartWas, keysWas);
        } else {
            keptFirst = -1;
            keysStayed = null;
        }
        if (!samePlace || keyed) {
            held = null;
            return;
        }
        int restartNow = visible.indexOf(restart);
        // While a row is held the list's children still show the rows before the first change,
        // so their positions say nothing about this one.
        if (held == null && (restartWas < 0) != (restartNow < 0)) {
            int first = list.getFirstVisiblePosition();
            int at = restartNow >= 0 && restartNow < first ? first + 1
                    : restartWas >= 0 && restartWas < first ? first - 1 : -1;
            if (at < 0 || at >= visible.size()) return;
            held = visible.get(at);
            heldTop = list.getChildAt(0).getTop();
        }
        if (held == null) return;
        int at = visible.indexOf(held);
        if (at < 0) held = null;
        else list.setSelectionFromTop(at, heldTop - list.getPaddingTop());
    }

    /**
     * Without touch, a row coming, going or growing above the keys' row moved every row above it
     * instead, since the list keeps the keys' row where it was: the restart row and the paused
     * status card sent the card off screen. After each layout the keys' row moves by however far
     * the row touch keeps at the top went, until that row is back.
     */
    private void keepTopWithKeys(int restartWas, Object keysWas) {
        // Taken once, from the rows as they were drawn before the first change. A pause rebuilds
        // the page many times, and one that came between a layout and the move it asked for saw
        // the rows the change had pushed, so the next layout moved them back off.
        if (keptFirst < 0) {
            keptFirst = list.getFirstVisiblePosition();
            keptTop = list.getChildAt(0).getTop();
            keptRestartWas = restartWas;
            keptKeys = keysWas;
            keptLayouts = 0;
            // The list posts its word that the keys' row is selected at a new place, and holds it
            // for its next layout when the page rebuilds first. Undo's save rebuilt it after the
            // keep-top was done, so taking the place again here took the new one and the word got
            // through. Kept while the keys are on the same row.
            if (keysStayed != keysWas) {
                keysStayed = keysWas;
                keysStayedAt = list.getSelectedItemPosition();
            }
        }
        waitToKeepTop();
    }

    private void waitToKeepTop() {
        if (keepingTop) return;
        keepingTop = true;
        afterLayout(this::keepTopAfterLayout);
    }

    private void keepTopAfterLayout() {
        keepingTop = false;
        if (keptFirst < 0) return;
        // The row at the top stays, by its place, as with touch. A restart row that came or went
        // above it moved it a place.
        int restartNow = visible.indexOf(restart);
        int at = keptRestartWas < 0 && restartNow >= 0 && restartNow < keptFirst ? keptFirst + 1
                : keptRestartWas >= 0 && restartNow < 0 && keptRestartWas < keptFirst ? keptFirst - 1 : keptFirst;
        // Done once that row is back, when the keys went to another row, or after a few tries.
        if (++keptLayouts > 4 || at < 0 || at >= visible.size() || keysRow() != keptKeys
                || !moveKeysToKeep(visible.get(at), keptTop)) {
            keptFirst = -1;
        }
    }

    /**
     * Called from a layout: moves the keys' row by however far [row] went from [top], keeping all
     * of the keys' row in view, and says whether it's moving. Posted, since a layout request made
     * during layout is dropped. A row the layout left above the rows drawn is brought in a little,
     * and the next layout puts it in place.
     */
    private boolean moveKeysToKeep(Preference row, int top) {
        int at = visible.indexOf(row);
        int keys = list.getSelectedItemPosition();
        View keyed = list.getSelectedView();
        int first = list.getFirstVisiblePosition();
        if (list.isInTouchMode() || keyed == null || at < 0 || at > keys || list.getChildCount() == 0) return false;
        View shown = at < first ? null : list.getChildAt(at - first);
        int by = shown != null ? top - shown.getTop() : top - list.getChildAt(0).getTop() + 1;
        int area = list.getHeight() - list.getListPaddingTop() - list.getListPaddingBottom();
        int from = keyed.getTop() - list.getListPaddingTop();
        int to = Math.max(0, Math.min(from + by, area - keyed.getHeight()));
        if (to == from) return false;
        Preference keysRow = keysRow();
        list.post(() -> {
            if (keptFirst < 0) return;
            if (list.isInTouchMode() || list.getSelectedItemPosition() != keys
                    || visible.indexOf(keysRow) != keys || visible.indexOf(row) != at) {
                // Rows changed again before the move. The layout that rebuild asked for measures
                // afresh, and without one nothing is kept.
                if (!keepingTop) keptFirst = -1;
                return;
            }
            waitToKeepTop();
            list.setSelectionFromTop(keys, to);
        });
        return true;
    }

    /**
     * The row the keys are on, or null. The list's own getter reads the keys' place in the rows as
     * they are now, and a rebuild that took rows away before the list laid them out left that
     * place past the end, so it threw.
     */
    private Preference keysRow() {
        int at = list.getSelectedItemPosition();
        return at >= 0 && at < visible.size() ? visible.get(at) : null;
    }

    /**
     * Whether the list is about to say a row is selected that its keys never left. A row coming or
     * going above it gives it another place, and the list says it's selected again; TalkBack took
     * its focus there, off the card's button just pressed. Any other row the keys go to is said.
     */
    private boolean repeatsSelection() {
        Preference keys = keysRow();
        int at = list.getSelectedItemPosition();
        boolean repeat = keys != null && keys == keysStayed && at != keysStayedAt;
        keysStayed = repeat ? keys : null;
        keysStayedAt = at;
        return repeat;
    }

    /** Runs [then] once, from the list's next layout. */
    private void afterLayout(Runnable then) {
        list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View view, int left, int top, int right, int bottom,
                    int oldLeft, int oldTop, int oldRight, int oldBottom) {
                list.removeOnLayoutChangeListener(this);
                then.run();
            }
        });
    }

    private void rememberRestingHeights() {
        for (int i = 0; i < list.getChildCount(); i++) {
            View child = list.getChildAt(i);
            Preference row = restingRows.get(child);
            if (row != null && child.getHeight() > 0) restingHeights.put(row, child.getHeight());
            // A line just taken away is hidden but keeps its height until the next layout, which
            // is when its row would shrink.
            View line = child.findViewWithTag(SettingsFeedback.REGION_TAG);
            Preference item = madeRows.get(child);
            if (item != null && line != null && line.getVisibility() == View.GONE && line.getHeight() > 0
                    && countedLines.put(line, Boolean.TRUE) == null && leavesGapAtEnd(line.getHeight())) {
                Integer kept = keptHeights.get(item);
                keptHeights.put(item, Math.max(child.getHeight(), kept == null ? 0 : kept));
            }
        }
    }

    /**
     * Whether the list is scrolled to its last row and would have space under it if [shrink] went.
     * A page that fits whole doesn't scroll, so nothing above jumps when a row there shrinks.
     */
    private boolean leavesGapAtEnd(int shrink) {
        int children = list.getChildCount();
        if (children == 0 || list.getLastVisiblePosition() < list.getCount() - 1) return false;
        boolean scrolled = list.getFirstVisiblePosition() > 0 || list.getChildAt(0).getTop() < list.getPaddingTop();
        return scrolled && list.getChildAt(children - 1).getBottom() - shrink < list.getHeight() - list.getPaddingBottom();
    }

    /** Whether [row] shows a short line while saves run in place of its own summary. */
    private static boolean showsBusyLine(Preference row) {
        return row instanceof HushTumblrPreferenceFragment.Toggle && ((HushTumblrPreferenceFragment.Toggle) row).isSaving()
                || row instanceof SettingsBackupPreference && ((SettingsBackupPreference) row).isBusy();
    }

    private int headings() {
        int count = 0;
        for (Preference item : visible) if (item instanceof PreferenceCategory) count++;
        return count;
    }

    /**
     * Starts a category or search page with a short line while HushTumblr is paused or a pause
     * or its end waits for a restart, when the page shows a switch Pause reaches. On a paused start
     * the switches keep showing what was saved, which read as active without it. Nothing here
     * changes a saved choice. A restart owed for anything else is the restart row's to say.
     */
    private void addPageStatus() {
        Context context = screen.getContext();
        boolean paused = HushTumblrPause.isPaused();
        boolean nextPaused = HushTumblrPause.pausesNextStart(context);
        pageAction = (paused || nextPaused) && showsPausable();
        if (!pageAction) return;
        pageStatus.setTitle(paused ? L10n.t("HushTumblr is paused") : L10n.t("HushTumblr is on"));
        // Worded like the Pause switch: Debug logging and what was set when patching stay in.
        pageStatus.setSummary(paused == nextPaused
                ? L10n.t("Until you resume, every switch but Debug logging acts as if it were off. "
                + "Changes made when you patched stay in.")
                : paused ? L10n.t("HushTumblr turns back on when Tumblr restarts.")
                : L10n.t("HushTumblr pauses when Tumblr restarts."));
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
    // A row off only while its save or action runs keeps the keys. The list moves its selection off
    // a row that's off, so a switch flipped by key handed it to the switch under it, and the next
    // press flipped that one. The row takes no click until it's done.
    @Override public boolean isEnabled(int position) {
        Preference item = getItem(position);
        return (item.isEnabled() || showsBusyLine(item)) && item.isSelectable();
    }
    // Preference creates several incompatible layouts. Never recycle one kind into another.
    @Override public int getItemViewType(int position) { return IGNORE_ITEM_VIEW_TYPE; }

    @Override public View getView(int position, View recycled, ViewGroup parent) {
        Preference item = getItem(position);
        View row = item.getView(null, parent);
        if (item == refocus) {
            // Not this row: a measure asks for rows it throws away undrawn, so the row that gets
            // focus is the one the list shows once this pass is done. Posted to the list, it runs
            // after the layout. With a layout still to come the children are the old rows, and
            // still off screen the item waits too: the layout that draws it, as Back's scroll to it
            // makes, asks for it again.
            list.post(() -> {
                if (refocus != item || list.isLayoutRequested()) return;
                int at = visible.indexOf(item);
                int first = list.getFirstVisiblePosition();
                View shown = at < first ? null : list.getChildAt(at - first);
                if (shown == null) return;
                refocus = null;
                // Back on the button it pressed, which now says what pressing it again does.
                View action = refocusAction == item ? shown.findViewWithTag(STATUS_ACTION) : null;
                refocusAction = null;
                if (action != null && action.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null)) return;
                // Focus reads the whole row, so a note just put under it isn't read again on its own.
                if (!shown.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null)) return;
                SettingsFeedback note = item.hasKey() ? page.feedbackFor(item.getKey()) : null;
                if (note != null) note.readWithRow();
            });
        }
        if (!(item instanceof PreferenceCategory)) {
            palette().paintSurface(row, item, true, true);
        }
        if (item == screen.getPreference(0)) {
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) {
                String label = L10n.t("Status").toUpperCase(Locale.getDefault());
                SpannableString heading = new SpannableString(label + "\n" + item.getTitle());
                heading.setSpan(new AbsoluteSizeSpan(12, true), 0, label.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                heading.setSpan(new ForegroundColorSpan(palette().heading), 0, label.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                title.setText(heading);
                title.setTextSize(20);
            }
            android.widget.ImageView icon = row.findViewById(android.R.id.icon);
            if (icon != null && icon.getParent() instanceof ViewGroup) {
                ViewGroup.LayoutParams iconSize = icon.getLayoutParams();
                iconSize.width = iconSize.height = dp(56);
                icon.setLayoutParams(iconSize);
                icon.setPadding(dp(12), dp(12), dp(12), dp(12));
                ViewGroup frame = (ViewGroup) icon.getParent();
                ViewGroup.LayoutParams frameSize = frame.getLayoutParams();
                frameSize.width = dp(72);
                if (frameSize instanceof LinearLayout.LayoutParams) {
                    ((LinearLayout.LayoutParams) frameSize).gravity = android.view.Gravity.TOP;
                }
                frame.setLayoutParams(frameSize);
            }
            row.setMinimumHeight(dp(148));
        }
        if (item == screen.getPreference(0)) bindStatus(row);
        if (item == pageStatus) {
            row.setMinimumHeight(Math.max(row.getMinimumHeight(), pageStatusHeight));
            if (pageAction) bindAction(row, HushTumblrPause.isPaused(), HushTumblrPause.pausesNextStart(screen.getContext()), true);
        }
        Integer resting = restingHeights.get(item);
        if (!showsBusyLine(item)) restingRows.put(row, item);
        else if (resting != null) row.setMinimumHeight(Math.max(row.getMinimumHeight(), resting));
        Integer kept = keptHeights.get(item);
        if (kept != null) row.setMinimumHeight(Math.max(row.getMinimumHeight(), kept));
        madeRows.put(row, item);
        return row;
    }

    private void bindStatus(View row) {
        boolean nextPaused = HushTumblrPause.pausesNextStart(screen.getContext());
        boolean paused = HushTumblrPause.isPaused();
        TextView summary = row.findViewById(android.R.id.summary);
        if (!paused && !nextPaused && ReleaseCheck.statusLine() == null) {
            summary.setText(L10n.t("Your switches are working."));
        } else if (paused && nextPaused && HushTumblrPause.reason() == HushTumblrPause.Reason.SWITCH
                && !markerLeft()) {
            // A marker Resume couldn't remove keeps the card's own line, which says what to do.
            summary.setText(L10n.t("Your choices are saved. Tap Resume, then restart Tumblr."));
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
        palette().secondaryAction(action);
        action.setMinWidth(dp(48));
        action.setMinHeight(dp(48));
        action.setMinimumWidth(dp(48));
        action.setMinimumHeight(dp(48));
        action.setTag(STATUS_ACTION);
        // Not a stop for arrow keys or Tab: the list's next layout took the keys back from a
        // button inside a row to the row selected under it, so Enter on "Pause" opened that row.
        // A screen reader still reaches and presses it, a paused card resumes on Enter itself,
        // and the Pause HushTumblr switch takes keys.
        action.setFocusable(false);
        Preference pause = page.findPreference(BaseSettings.PAUSED.key);
        Preference status = pageStatusAction ? pageStatus : screen.getPreference(0);
        action.setEnabled(status.isEnabled() && pause != null && pause.isEnabled()
                && !HushTumblrPreferenceFragment.hasPendingEdits());
        action.setOnClickListener(ignored -> {
            if (!action.isEnabled() || HushTumblrPreferenceFragment.hasPendingEdits()) return;
            if (pageStatusAction) pageStatusHeight = Math.max(pageStatusHeight, row.getHeight());
            if (nextPaused) {
                page.resumeFromOverview(status);
            } else {
                // Toggle owns the durable worker save. Setting its visual check alone never saves.
                // The framework's callChangeListener is protected, so the listener is called here.
                Preference.OnPreferenceChangeListener save = pause.getOnPreferenceChangeListener();
                if (pause instanceof SwitchPreference && save != null) {
                    // What an earlier Resume left to do no longer applies once the pause changes again.
                    page.clearStatusResults();
                    save.onPreferenceChange(pause, !nextPaused);
                }
            }
            rebuild();
        });
        // Keep the action below the copy at every text size, leaving the full column for status.
        // A result under the row (what a Resume left to do) sits between the copy and the button,
        // which would otherwise cover it.
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null && summary.getParent() instanceof android.widget.RelativeLayout) {
            ViewGroup column = (ViewGroup) summary.getParent();
            View result = column.findViewWithTag(SettingsFeedback.REGION_TAG);
            android.widget.RelativeLayout.LayoutParams place = new android.widget.RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.addRule(android.widget.RelativeLayout.BELOW,
                    result != null && result.getId() != View.NO_ID ? result.getId() : android.R.id.summary);
            place.addRule(android.widget.RelativeLayout.ALIGN_PARENT_START);
            place.topMargin = dp(8);
            View earlier = column.findViewWithTag(STATUS_ACTION);
            if (earlier != null) column.removeView(earlier);
            column.addView(action, place);
            frame.setVisibility(View.GONE);
            return;
        }
        frame.addView(action, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        frame.setVisibility(View.VISIBLE);
    }

    private boolean markerLeft() {
        java.io.File marker = HushTumblrPause.markerFile(screen.getContext());
        return marker != null && marker.exists();
    }

    private int dp(int value) { return Math.round(value * screen.getContext().getResources().getDisplayMetrics().density); }

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
