/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import android.content.Context;
import android.database.DataSetObserver;
import android.net.Uri;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;

import androidx.annotation.Nullable;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.IdentityHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.preference.ReopenSettingsAfterRestart;

/**
 * A view of the complete preference model. Every section sits on the one home list and opens in
 * place under its heading, several at a time. Filtering never removes preferences from their
 * screen, so imports, dependencies, persistence and restart notices still reach closed sections.
 */
@SuppressWarnings("deprecation")
final class SettingsNavigation extends BaseAdapter {
    private static final String STATE = "hushtelegram_navigation";
    /** The restart marker that carries the open sections and the list's place, not just a page. */
    static final String RESTART_STATE = "hushsettings://accordion";
    /** The page of switches that aren't the way they started. */
    static final String CHANGED_PAGE = "changed";
    /** The home page row that opens it. Like the other rows only this view draws, it stores nothing. */
    static final String CHANGED = "action_changed_switches";
    /** Marks the Pause, Resume or Undo button placed under a status row's text, so a rebind replaces it. */
    private static final String STATUS_ACTION = "hushtelegram_status_action";
    /** The restart row's key. Like the other rows only this view draws, it stores nothing. */
    static final String RESTART = "action_restart_to_apply";
    /** The Quick setups row, on the Settings backup page. It stores nothing. */
    static final String QUICK_SETUPS = "action_quick_setups";
    /** The settings lock's row, on the Pause page. The lock keeps its own state ({@link SettingsLock}). */
    static final String LOCK = "action_settings_lock";
    /** The row that switches these pages between cards and plain rows. Like the other rows only this view draws, it stores nothing. */
    static final String SETTINGS_LOOK = "action_settings_look";
    /**
     * Whether these pages draw plain rows with a thin line between them instead of cards (#18). The
     * screen's own choice: settings files and Quick setups leave it out, and a pause leaves it alone.
     */
    static final BooleanSetting PLAIN_ROWS =
            new BooleanSetting("hushtelegram_plain_rows", Boolean.FALSE, false, false);

    static {
        Setting.keepWhenPaused(PLAIN_ROWS);
    }

    static final String REPORT = "action_report_problem";
    private final HushTelegramPreferenceFragment page;
    private final SettingsDialog host;
    private final ListView list;
    private final int normalBottomPadding;
    private final PreferenceScreen screen;
    private final ListAdapter source;
    private final List<Section> sections = new ArrayList<>();
    private final List<Preference> visible = new ArrayList<>();
    /** The sections open on the home list, in the order they were opened. */
    private final Set<String> expanded = new LinkedHashSet<>();
    /** Under the sections: every switch that isn't the way it started, on one page. */
    private final Preference changed;
    /** What that page shows when every switch is the way it started. */
    private final Preference noneChanged;
    /** The home page's last row, which opens HushTelegram's Ko-fi page in a browser. */
    private final Preference support;
    /** Just above Support: a new GitHub bug report with this install's versions filled in. */
    private final Preference report;
    /**
     * Shown while a change waits for a restart, under the switch that asked for it: a tap restarts
     * Telegram and the screen comes back as it was ({@link ReopenSettingsAfterRestart}).
     */
    private final HushTelegramPreferenceFragment.Row restart;
    /** Keeps the shared fragment's restart toast off this screen, which shows the restart row instead. */
    private final AbstractPreferenceFragment.RestartFeedbackPresenter restartFeedback;
    /** The page the last rebuild drew, so a row coming or going on that same page keeps the list's place. */
    private String rebuiltPage;
    private final Preference empty;
    /** The line a search or the changed page starts with while a pause applies to it. */
    private final Preference pageStatus;
    /** Whether that line is about Pause, and so carries Resume or Undo. */
    private boolean pageAction;
    /** Keep a status action from shortening this page and clamping its current scroll offset. */
    private int pageStatusHeight;
    /** "" for the home list, or {@link #CHANGED_PAGE}. */
    private String route = "";
    private String query = "";
    /**
     * The row that takes accessibility focus once it's drawn again: the heading just opened or
     * closed, or the row Back returns to. On the S22 TalkBack otherwise held the whole screen, and
     * the person's place in the list was lost.
     */
    private Preference refocus;
    private int homePosition;
    private int homeOffset;
    private String homeAnchor = "";
    /** The headings inside a long page, made once so each keeps its place and id between rebuilds. */
    private final Map<PatchFamily.Group, Preference> groupHeadings = new EnumMap<>(PatchFamily.Group.class);
    /** The card each row of a split section is drawn in, and each of its headings. Empty elsewhere. */
    private final Map<Preference, Object> cards = new IdentityHashMap<>();

    private final DataSetObserver changes = new DataSetObserver() {
        @Override public void onChanged() { rebuild(); }
        @Override public void onInvalidated() { rebuild(); }
    };

    SettingsNavigation(HushTelegramPreferenceFragment page, SettingsDialog host, Bundle saved) {
        this.page = page;
        this.host = host;
        screen = page.getPreferenceScreen();
        list = page.getView().findViewById(android.R.id.list);
        normalBottomPadding = list.getPaddingBottom();
        source = screen.getRootAdapter();
        Context context = screen.getContext();
        // Stable English route IDs survive a locale change; the displayed names are localized.
        Set<PatchFamily> build = PatchFamily.inThisBuild();
        // The switch sections lead, in the order they're drawn; a section this build put nothing on
        // has no category, so section() leaves it out.
        for (PatchFamily.Page switches : PatchFamily.Page.values()) {
            section(switches.title, switches.label(), summary(switches, build), icon(switches));
        }
        section("Links", L10n.t("Links"), null, SettingsIcons.LINKS);
        section("Updates", L10n.t("Updates"), null, SettingsIcons.UPDATES);
        section("Pause", L10n.t("Pause"), null, SettingsIcons.PAUSE);
        section("Settings backup", L10n.t("Settings backup"), null, SettingsIcons.EXPORT);
        section("Diagnostics", L10n.t("Diagnostics"), null, SettingsIcons.BUG);
        section("About", L10n.t("About"), null, SettingsIcons.ABOUT);
        changed = link(context, L10n.t("Changed switches"), null, SettingsIcons.LIST);
        changed.setKey(CHANGED);
        changed.setOnPreferenceClickListener(ignored -> { navigate(CHANGED_PAGE); return true; });
        noneChanged = new HushTelegramPreferenceFragment.Row(context);
        noneChanged.setTitle(L10n.t("No changed switches"));
        noneChanged.setSummary(L10n.t("A switch you turn on or off shows up here until you put it back."));
        noneChanged.setSelectable(false);
        noneChanged.setPersistent(false);
        support = link(context, L10n.t("Support HushTelegram"), null, SettingsIcons.OPENING);
        support.setKey(HushTelegramPreferenceFragment.SUPPORT);
        support.setOnPreferenceClickListener(row -> { HushTelegramPreferenceFragment.openSupport(row.getContext()); return true; });
        report = link(context, L10n.t("Report a problem"),
                L10n.t("Opens a GitHub report with your versions and settings filled in. Add what happened."), SettingsIcons.BUG);
        report.setKey(REPORT);
        report.setOnPreferenceClickListener(row -> { ReportProblemForm.open(row.getContext(), screen); return true; });
        restart = new HushTelegramPreferenceFragment.Row(context);
        restart.setKey(RESTART);
        restart.setPersistent(false);
        // A tap restarts at once, so the row goes without a chevron.
        restart.actsAtOnce = true;
        restart.setSummary(L10n.t("Telegram closes and reopens on this page."));
        restart.setIcon(SettingsIcons.icon(context, SettingsIcons.UPDATES, palette().heading));
        restart.setOnPreferenceClickListener(row -> {
            ReopenSettingsAfterRestart.restartInto(row.getContext(), restartTarget());
            return true;
        });
        // The row appears as the switch flips. A screen reader hears the saved message as well,
        // since the row can land outside the part of the list in view.
        restartFeedback = (ignored, message) -> list.announceForAccessibility(message);
        AbstractPreferenceFragment.setRestartFeedbackPresenter(restartFeedback);
        empty = new HushTelegramPreferenceFragment.Row(context);
        empty.setTitle(L10n.t("No matching settings"));
        empty.setSummary(L10n.t("Try a different word or clear the search."));
        empty.setSelectable(false);
        empty.setPersistent(false);
        pageStatus = new HushTelegramPreferenceFragment.Row(context);
        pageStatus.setSelectable(false);
        pageStatus.setPersistent(false);
        Bundle state = saved == null ? null : saved.getBundle(STATE);
        if (state == null) state = restartState(host.startPage());
        if (state != null) {
            route = CHANGED_PAGE.equals(state.getString("route")) ? CHANGED_PAGE : "";
            query = state.getString("query", "");
            homePosition = state.getInt("homePosition");
            homeOffset = state.getInt("homeOffset");
            homeAnchor = state.getString("homeAnchor", "");
            ArrayList<String> opened = state.getStringArrayList("expanded");
            if (opened != null) for (String id : opened) if (header(id) != null) expanded.add(id);
        } else {
            // Nothing saved: the page the screen was asked to open on, such as the one a restart
            // from an older build's restart row left. A section's name opens that section.
            String start = host.startPage();
            if (CHANGED_PAGE.equals(start)) route = CHANGED_PAGE;
            else if (header(start) != null) expanded.add(start);
        }
        source.registerDataSetObserver(changes);
        list.setAdapter(this);
        // The list ignores Enter on a row holding a focusable view, so a status row's Enter
        // presses the button it shows, whose label says what that does.
        list.setOnKeyListener((view, key, event) -> {
            if (key != KeyEvent.KEYCODE_DPAD_CENTER && key != KeyEvent.KEYCODE_ENTER
                    && key != KeyEvent.KEYCODE_NUMPAD_ENTER) return false;
            int position = list.getSelectedItemPosition();
            if (position < 0 || position >= getCount() || !carriesAction(getItem(position))) return false;
            View row = list.getSelectedView();
            View action = row == null ? null : row.findViewWithTag(STATUS_ACTION);
            if (action == null) return false;
            if (event.getAction() == KeyEvent.ACTION_UP && !event.isCanceled()) action.performClick();
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
        if (!query.isEmpty()) host.showSearchHeading(query);
        rebuild();
        host.showPage(title(), home(), query);
        if (state != null) restoreAnchor(state.getString("anchor", ""), state.getInt("position"), state.getInt("offset"));
        else if (!expanded.isEmpty()) showAt(visible.indexOf(header(expanded.iterator().next())), 0);
    }

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

    /** A switch section's line on the home page. Only Ads and Privacy have one. */
    @Nullable
    static String summary(PatchFamily.Page page, Set<PatchFamily> build) {
        switch (page) {
            case ADS: return adsSummary(build);
            case PRIVACY: return privacySummary(build);
            default: return null;
        }
    }

    private static String icon(PatchFamily.Page page) {
        switch (page) {
            case ADS: return SettingsIcons.BLOCK;
            case CHAT_LIST: return SettingsIcons.LIST;
            case CONVERSATIONS: return SettingsIcons.FORUM;
            case PLAYBACK: return SettingsIcons.PLAY;
            case NOTIFICATIONS: return SettingsIcons.BELL;
            case LOOK: return SettingsIcons.PALETTE;
            default: return SettingsIcons.PRIVACY;
        }
    }

    /**
     * The Ads row's line, from what this build hides: the ads its hooks cover, and "and more"
     * only when another Ads switch is there too. Null when Hide ads covers nothing, since the
     * page then holds only switches the line would leave unnamed.
     */
    @Nullable
    static String adsSummary(Set<PatchFamily> build) {
        if (!build.contains(PatchFamily.HIDE_ADS)) return null;
        Set<PatchFamily.Capability> installed = PatchFamily.HIDE_ADS.installedCapabilities();
        boolean channels = installed.contains(PatchFamily.Capability.CHANNEL_ADS)
                || installed.contains(PatchFamily.Capability.VIDEO_ADS);
        boolean search = installed.contains(PatchFamily.Capability.SEARCH_ADS);
        if (!channels && !search) return null;
        String ads = channels && search ? L10n.t("Ads in channels and search")
                : channels ? L10n.t("Ads in channels") : L10n.t("Ads in search");
        for (PatchFamily family : PatchFamily.Page.ADS.families) {
            if (family != PatchFamily.HIDE_ADS && build.contains(family)) return L10n.f("%1$s, and more", ads);
        }
        return ads;
    }

    /**
     * The Privacy row's line, naming only the switches this build put on that page. The draft
     * preview, gallery camera and phone number switches are off as shipped, so they add "and more"
     * rather than names of their own. A page holding only the draft or camera switch still names
     * it; one holding only the phone number switch has no line.
     */
    @Nullable
    static String privacySummary(Set<PatchFamily> build) {
        boolean reports = build.contains(PatchFamily.DISABLE_ANALYTICS);
        boolean calls = build.contains(PatchFamily.DISABLE_CALL_DEBUG);
        boolean drafts = build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS);
        boolean camera = build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP);
        boolean others = build.contains(PatchFamily.HIDE_PHONE_NUMBER);
        String named = reports && calls ? L10n.t("Usage reports and call diagnostics")
                : reports ? L10n.t("Usage reports") : calls ? L10n.t("Call diagnostics") : null;
        if (named == null) {
            if (drafts) return camera || others ? L10n.f("%1$s, and more", L10n.t("Draft link previews")) : L10n.t("Draft link previews");
            if (camera) return others ? L10n.f("%1$s, and more", L10n.t("Gallery camera")) : L10n.t("Gallery camera");
            return null;
        }
        return drafts || camera || others ? L10n.f("%1$s, and more", named) : named;
    }

    private static Preference link(Context context, String title, String summary, String icon) {
        Preference row = new HushTelegramPreferenceFragment.Row(context);
        row.setTitle(title);
        row.setSummary(summary);
        row.setIcon(SettingsIcons.icon(context, icon, palette().heading));
        row.setPersistent(false);
        return row;
    }

    private boolean home() {
        return !CHANGED_PAGE.equals(route);
    }

    private CharSequence title() {
        return home() ? "HushTelegram" : changed.getTitle();
    }

    @Nullable
    private Preference header(String id) {
        for (Section section : sections) if (section.id.equals(id)) return section.link;
        return null;
    }

    @Nullable
    private Section sectionOf(Preference item) {
        for (Section section : sections) if (section.link == item) return section;
        return null;
    }

    /** Whether [id] is a section open on the home list. */
    boolean isExpanded(String id) {
        return expanded.contains(id);
    }

    private void toggle(String id) {
        setExpanded(id, !expanded.contains(id));
    }

    /**
     * Opens or closes a section in place. The tapped heading stays where it was on screen, and an
     * opened one near the bottom edge moves up enough to show its first row.
     */
    private void setExpanded(String id, boolean open) {
        Preference header = header(id);
        if (header == null || expanded.contains(id) == open) return;
        int before = visible.indexOf(header);
        View bound = before < 0 ? null : list.getChildAt(before - list.getFirstVisiblePosition());
        int top = bound == null ? 0 : bound.getTop();
        if (open) expanded.add(id);
        else expanded.remove(id);
        refocus = header;
        rebuild();
        if (bound != null) {
            int reveal = Math.max(0, list.getHeight() - bound.getHeight() - dp(72));
            showAt(visible.indexOf(header), open ? Math.min(top, reveal) : top);
        } else {
            showAt(visible.indexOf(header), 0);
        }
    }

    /**
     * Goes to [destination]: a section opens on the home list with its heading at the top, and
     * {@link #CHANGED_PAGE} opens that page. Anything else is the home list as it was left.
     */
    void navigate(String destination) {
        refocus = null;
        if (home() && query.isEmpty()) rememberIndex();
        pageStatusHeight = 0;
        query = "";
        boolean section = header(destination) != null;
        route = CHANGED_PAGE.equals(destination) ? CHANGED_PAGE : "";
        if (section) expanded.add(destination);
        rebuild();
        host.showPage(title(), home(), query);
        if (section) showAt(visible.indexOf(header(destination)), 0);
        else if (home()) restoreAnchor(homeAnchor, homePosition, homeOffset);
        else showAt(0, 0);
        list.sendAccessibilityEvent(android.view.accessibility.AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED);
    }

    boolean open(Preference preference) {
        for (Section section : sections) {
            if (preference != section.category && preference.getParent() != section.category) continue;
            navigate(section.id);
            // A link to one setting lands on its row rather than the section's top, with the row's
            // heading above it in a split section.
            int row = visible.indexOf(preference);
            if (row > 0 && groupHeadings.containsValue(visible.get(row - 1))) row--;
            if (row > 0) showAt(row, 0);
            return true;
        }
        return false;
    }

    void search(String text) {
        if (query.equals(text)) return;
        refocus = null;
        if (query.isEmpty() && home()) rememberIndex();
        pageStatusHeight = 0;
        query = text;
        route = "";
        host.showSearchHeading(query);
        rebuild();
        if (query.isEmpty()) restoreAnchor(homeAnchor, homePosition, homeOffset);
        else showAt(0, 0);
    }

    boolean back() {
        if (!query.isEmpty()) {
            search("");
            host.showPage(title(), true, "");
            return true;
        }
        if (home()) return false;
        pageStatusHeight = 0;
        route = "";
        rebuild();
        host.showPage(title(), true, query);
        restoreAnchor(homeAnchor, homePosition, homeOffset);
        refocus = changed;
        return true;
    }

    private void showAt(int position, int offset) {
        if (getCount() == 0) return;
        position = Math.max(0, Math.min(position, getCount() - 1));
        // A header resize otherwise syncs the old page's visible children back over this
        // selection in touch mode. Rebind when changing pages; normal preference updates
        // still keep their current views and scroll position through notifyDataSetChanged.
        list.setAdapter(this);
        // Outside touch mode, selection skips an informational row. Scroll to it without
        // turning the notice into an action: place the next selectable row below its height.
        int anchor = position;
        int top = offset;
        if (!list.isInTouchMode()) {
            int width = list.getWidth() > 0 ? list.getWidth()
                    : screen.getContext().getResources().getDisplayMetrics().widthPixels;
            width -= list.getPaddingLeft() + list.getPaddingRight();
            while (anchor >= 0 && anchor < getCount() && !isEnabled(anchor)) {
                View preceding = getView(anchor, null, list);
                preceding.measure(View.MeasureSpec.makeMeasureSpec(Math.max(0, width), View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                top += preceding.getMeasuredHeight();
                anchor++;
            }
        }
        list.setSelectionFromTop(anchor < getCount() ? anchor : position, anchor < getCount() ? top : offset);
    }

    private void rememberIndex() {
        View first = list.getChildAt(0);
        homePosition = list.getFirstVisiblePosition();
        homeOffset = first == null ? 0 : first.getTop();
        homeAnchor = homePosition < getCount() ? rowToken(getItem(homePosition)) : "";
    }

    void save(Bundle out) {
        out.putBundle(STATE, currentState());
    }

    private Bundle currentState() {
        if (home() && query.isEmpty()) rememberIndex();
        Bundle state = new Bundle();
        state.putString("route", route);
        state.putString("query", query);
        state.putInt("homePosition", homePosition);
        state.putInt("homeOffset", homeOffset);
        state.putString("homeAnchor", homeAnchor);
        state.putStringArrayList("expanded", new ArrayList<>(expanded));
        int position = list.getFirstVisiblePosition();
        state.putInt("position", position);
        state.putString("anchor", position < getCount() ? rowToken(getItem(position)) : "");
        View first = list.getChildAt(0);
        state.putInt("offset", first == null ? 0 : first.getTop());
        return state;
    }

    /** A name for [item] that stays the same across a rebuild, rotation or restart. */
    private String rowToken(Preference item) {
        Section section = sectionOf(item);
        if (section != null) return "section:" + section.id;
        for (Map.Entry<PatchFamily.Group, Preference> heading : groupHeadings.entrySet())
            if (heading.getValue() == item) return "group:" + heading.getKey().name();
        for (Section owner : sections) if (item == owner.category) return "heading:" + owner.id;
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

    /** The restart row's marker: the open sections, the search and the list's place, as one link. */
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

    /** The state a restart marker carries, or null when [value] is an older plain page name. */
    @Nullable
    static Bundle restartState(String value) {
        if (value == null || !value.startsWith(RESTART_STATE + "?")) return null;
        Bundle state = new Bundle();
        // A marker that doesn't read as one opens the home list at the top. Settings are separate.
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
                state.putInt(key, 0);
            }
        }
        return state;
    }

    void close() {
        source.unregisterDataSetObserver(changes);
        AbstractPreferenceFragment.clearRestartFeedbackPresenter(restartFeedback);
    }

    /** A change that waits for a restart was made or taken back: the restart row comes, goes or counts again. */
    void restartChanged() { rebuild(); }

    /**
     * The home list shows the status card only when something is off the usual: a pause, a pause
     * or resume waiting for a restart, or a newer release. Otherwise it's in the model, not drawn.
     */
    private static boolean statusWorthShowing(Context context) {
        return HushTelegramPause.isPaused() || HushTelegramPause.pausesNextStart(context)
                || ReleaseCheck.statusLine() != null;
    }

    private void rebuild() {
        int firstShown = list.getChildCount() == 0 ? -1 : list.getFirstVisiblePosition();
        Preference anchor = firstShown >= 0 && firstShown < visible.size() ? visible.get(firstShown) : null;
        int anchorTop = list.getChildCount() == 0 ? 0 : list.getChildAt(0).getTop();
        visible.clear();
        cards.clear();
        String terms = normalized(query).trim();
        if (!terms.isEmpty()) {
            for (Section section : sections) {
                boolean headingAdded = false;
                for (int i = 0; i < section.category.getPreferenceCount(); i++) {
                    Preference row = section.category.getPreference(i);
                    String text = normalized(searchable(section.category.getTitle()) + " " + searchable(row.getTitle())
                            + " " + searchable(row.getSummary()));
                    boolean matches = true;
                    for (String term : terms.split("\\s+")) if (!text.contains(term)) matches = false;
                    if (!matches) continue;
                    if (!headingAdded) visible.add(section.category);
                    headingAdded = true;
                    visible.add(row);
                }
            }
            host.showResults(visible.size() - headings());
            if (visible.isEmpty()) visible.add(empty);
            else addPageStatus();
        } else if (CHANGED_PAGE.equals(route)) {
            addChangedRows();
            if (visible.isEmpty()) visible.add(noneChanged);
            else addPageStatus();
        } else {
            if (statusWorthShowing(screen.getContext())) visible.add(screen.getPreference(0));
            for (Section section : sections) {
                visible.add(section.link);
                if (expanded.contains(section.id)) addPageRows(section);
            }
            changed.setSummary(changedSummary());
            visible.add(changed);
            visible.add(report);
            visible.add(support);
        }
        addRestart();
        if (terms.isEmpty()) host.showResults(-1);
        bindToolbar();
        // Undo can remove the entire status card. Reserve its former scroll range at the
        // bottom until navigation, without retaining a stale status row or changing choices.
        int bottom = normalBottomPadding + (visible.contains(pageStatus) ? 0 : pageStatusHeight);
        if (list.getPaddingBottom() != bottom) {
            list.setPadding(list.getPaddingLeft(), list.getPaddingTop(), list.getPaddingRight(), bottom);
        }
        notifyDataSetChanged();
        keepPlace(anchor, firstShown, anchorTop);
    }

    /**
     * Every switch whose saved value isn't the one it starts with, under its section's title the
     * way search shows rows. Each is the section's own row, so flipping it back goes through the
     * same save, refusal and restart as anywhere else, and the page drops it once the change is saved.
     */
    private void addChangedRows() {
        for (Section section : sections) {
            boolean headed = false;
            for (int i = 0; i < section.category.getPreferenceCount(); i++) {
                Preference row = section.category.getPreference(i);
                if (!isChanged(row)) continue;
                if (!headed) visible.add(section.category);
                headed = true;
                visible.add(row);
            }
        }
    }

    /** The Changed switches row's line: how many switches aren't the way they started. */
    private String changedSummary() {
        int count = 0;
        for (Section section : sections) {
            for (int i = 0; i < section.category.getPreferenceCount(); i++) {
                if (isChanged(section.category.getPreference(i))) count++;
            }
        }
        return count == 0 ? L10n.t("Every switch is the way it started.")
                : L10n.quantity(screen.getContext(), count, "%1$d switch differs from how it started. Open to flip it back.",
                        "%1$d switches differ from how they started. Open to flip any of them back.", count);
    }

    /** Whether a row is a switch whose saved value isn't the one it starts with. */
    private static boolean isChanged(Preference row) {
        if (!(row instanceof TwoStatePreference) || !row.hasKey()) return false;
        Setting<?> setting = Setting.getSettingFromPath(row.getKey());
        return setting instanceof BooleanSetting && !setting.isSetToDefault();
    }

    /**
     * The restart row, while a change waits for a restart. It goes right under the newest switch
     * that asked for one when that switch is in the list, where the finger that flipped it is.
     * Otherwise it goes under the status card or a page's pause line, or first. Its title counts
     * the changes a restart applies.
     */
    private void addRestart() {
        Context context = screen.getContext();
        int count = ReopenSettingsAfterRestart.changesWaiting(context);
        if (count <= 0) return;
        restart.setTitle(L10n.quantity(context, count, "Restart Telegram to apply this change",
                "Restart Telegram to apply %1$d changes", count));
        List<String> pending;
        synchronized (AbstractPreferenceFragment.restartPending) {
            pending = new ArrayList<>(AbstractPreferenceFragment.restartPending);
        }
        for (int k = pending.size() - 1; k >= 0; k--) {
            for (int i = 0; i < visible.size(); i++) {
                if (pending.get(k).equals(visible.get(i).getKey())) {
                    visible.add(i + 1, restart);
                    return;
                }
            }
        }
        boolean underStatus = !visible.isEmpty()
                && (visible.get(0) == pageStatus || visible.get(0) == screen.getPreference(0));
        visible.add(underStatus ? 1 : 0, restart);
    }

    /**
     * Keeps the row at the top of the list where it was when rows come or go above it on the same
     * page: the restart row, the status card, a pause line. At the very top a new row is left to
     * push the list down, so it's seen.
     */
    private void keepPlace(Preference anchor, int position, int offset) {
        String pageWas = rebuiltPage;
        rebuiltPage = route + '\n' + query;
        if (!rebuiltPage.equals(pageWas) || anchor == null || position < 0) return;
        int next = visible.indexOf(anchor);
        if (next >= 0 && next != position && (position > 0 || offset < 0)) list.setSelectionFromTop(next, offset);
    }

    /**
     * A section's rows. A long section is split into its groups, each under its heading in a card
     * of its own, and a row with no switch of its own, like Sticker size or Filters for groups,
     * stays with the switch above it. A row whose family no group lists leads the section rather
     * than going missing.
     */
    private void addPageRows(Section section) {
        PreferenceCategory category = section.category;
        int count = category.getPreferenceCount();
        Preference[] rows = new Preference[count];
        PatchFamily[] owners = new PatchFamily[count];
        PatchFamily owner = null;
        boolean split = false;
        for (int i = 0; i < count; i++) {
            rows[i] = category.getPreference(i);
            PatchFamily family = rows[i].hasKey() ? PatchFamily.Group.owner(rows[i].getKey()) : null;
            if (family != null) owner = family;
            owners[i] = owner;
            split |= owner != null && PatchFamily.Group.of(owner) != null;
        }
        if (!split) {
            for (Preference row : rows) {
                visible.add(row);
                cards.put(row, "local_notification_status".equals(row.getKey()) ? row : section);
            }
            return;
        }
        for (int i = 0; i < count; i++) {
            if (owners[i] == null || PatchFamily.Group.of(owners[i]) == null) {
                visible.add(rows[i]);
                cards.put(rows[i], section);
            }
        }
        for (PatchFamily.Group group : PatchFamily.Group.values()) {
            boolean headed = false;
            for (PatchFamily family : group.families) {
                for (int i = 0; i < count; i++) {
                    if (owners[i] != family) continue;
                    if (!headed) {
                        Preference heading = heading(group);
                        visible.add(heading);
                        cards.put(heading, heading);
                        headed = true;
                    }
                    visible.add(rows[i]);
                    cards.put(rows[i], group);
                }
            }
        }
    }

    private Preference heading(PatchFamily.Group group) {
        Preference heading = groupHeadings.get(group);
        if (heading == null) {
            heading = new HushTelegramPreferenceFragment.Heading(screen.getContext());
            heading.setTitle(group.label());
            groupHeadings.put(group, heading);
        }
        return heading;
    }

    private int headings() {
        int count = 0;
        for (Preference item : visible) if (item instanceof PreferenceCategory) count++;
        return count;
    }

    /**
     * Starts a search or the changed page with a short line while HushTelegram is paused or a pause
     * or its end waits for a restart, when the page shows a switch Pause reaches. On a paused start
     * the switches keep showing what was saved, which read as active without it. Nothing here
     * changes a saved choice. A restart owed for anything else is the restart row's to say. The
     * home list has the status card for this.
     */
    private void addPageStatus() {
        Context context = screen.getContext();
        boolean paused = HushTelegramPause.isPaused();
        boolean nextPaused = HushTelegramPause.pausesNextStart(context);
        pageAction = (paused || nextPaused) && showsPausable();
        if (!pageAction) return;
        pageStatus.setTitle(paused ? L10n.t("HushTelegram is paused") : L10n.t("HushTelegram is on"));
        // Worded like the Pause switch: Debug logging and what was set when patching stay in.
        pageStatus.setSummary(paused == nextPaused
                ? L10n.t("Until you resume, every switch except Debug logging acts as if it were off. Your "
                        + "choices stay saved. Edits made when you patched stay in.")
                : paused ? L10n.t("HushTelegram turns back on when Telegram restarts.")
                : L10n.t("HushTelegram pauses when Telegram restarts."));
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

    /** A title or summary as search text. A row without one adds nothing, not the word "null". */
    private static String searchable(CharSequence value) {
        return value == null ? "" : value.toString();
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
    /**
     * A row with a Pause, Resume or Undo button counts too, so a keyboard stops on it and Enter
     * presses the button (the key listener). A tap still isn't an item click: the list skips
     * those on rows holding a focusable view, and TalkBack reads that row as it did.
     */
    @Override public boolean isEnabled(int position) {
        Preference item = getItem(position);
        return (item.isEnabled() && item.isSelectable()) || carriesAction(item);
    }

    private boolean carriesAction(Preference item) {
        return item == screen.getPreference(0) || (item == pageStatus && pageAction);
    }
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
            palette().paintSurface(row, item, first, last, item == screen.getPreference(0) || item == restart,
                    item == support);
            Section section = sectionOf(item);
            if (section != null || item == changed) {
                // Keep the accurate section summaries in the searchable model, while this index
                // stays compact enough to scan every section at a glance.
                TextView summary = row.findViewById(android.R.id.summary);
                if (summary != null) summary.setVisibility(View.GONE);
                row.setMinimumHeight(dp(48));
                int side = palette().rowSide(row);
                boolean plain = ScreenColors.plainRows();
                row.setPaddingRelative(side, dp(first && !plain ? 8 : 4), side, dp(last && !plain ? 8 : 4));
                ImageView icon = row.findViewById(android.R.id.icon);
                if (icon != null && icon.getParent() instanceof View) {
                    ViewGroup.LayoutParams size = ((View) icon.getParent()).getLayoutParams();
                    if (size instanceof LinearLayout.LayoutParams) {
                        ((LinearLayout.LayoutParams) size).gravity = android.view.Gravity.CENTER_VERTICAL;
                    }
                }
                if (section != null) bindHeader(row, item, section.id);
            }
        }
        if (item == screen.getPreference(0)) {
            // The status card stays a card in either look, as a panel apart from the rows.
            int side = dp(ScreenColors.CARD_INSET + 14);
            row.setPaddingRelative(side, dp(12), side, dp(12));
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) title.setTypeface(android.graphics.Typeface.create("sans-serif-medium", 0));
        }
        if (item == screen.getPreference(0)) {
            bindStatus(row);
        }
        if (item == support) {
            row.setMinimumHeight(dp(48));
            int side = palette().rowSide(row);
            row.setPaddingRelative(side, dp(12), side, dp(12));
            View icon = row.findViewById(android.R.id.icon);
            if (icon != null && icon.getParent() instanceof View) ((View) icon.getParent()).setVisibility(View.GONE);
            TextView summary = row.findViewById(android.R.id.summary);
            if (summary != null) summary.setVisibility(View.GONE);
            TextView title = row.findViewById(android.R.id.title);
            if (title != null) title.setTextColor(palette().heading);
        }
        if (item == pageStatus) {
            row.setMinimumHeight(Math.max(row.getMinimumHeight(), pageStatusHeight));
            if (pageAction) bindAction(row, HushTelegramPause.isPaused(), HushTelegramPause.pausesNextStart(screen.getContext()), true);
        }
        return row;
    }

    /**
     * A section's heading: its chevron points down while it's closed and up while it's open, its
     * title takes the accent colour while open, and a screen reader hears it as a heading that
     * expands or collapses.
     */
    private void bindHeader(View row, Preference item, String id) {
        boolean open = expanded.contains(id);
        row.setAccessibilityHeading(true);
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R)
            row.setStateDescription(L10n.t(open ? "Expanded" : "Collapsed"));
        View arrow = row.findViewWithTag(ScreenColors.CHEVRON);
        if (arrow != null) {
            boolean rtl = row.getResources().getConfiguration().getLayoutDirection() == View.LAYOUT_DIRECTION_RTL;
            arrow.setRotation((open ? -90 : 90) * (rtl ? -1 : 1));
        }
        TextView title = row.findViewById(android.R.id.title);
        if (title != null && open) title.setTextColor(palette().heading);
        row.setAccessibilityDelegate(new HushTelegramPreferenceFragment.RowSemantics(item, Button.class) {
            @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                boolean shown = expanded.contains(id);
                info.setHeading(true);
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R)
                    info.setStateDescription(L10n.t(shown ? "Expanded" : "Collapsed"));
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
        boolean nextPaused = HushTelegramPause.pausesNextStart(screen.getContext());
        boolean paused = HushTelegramPause.isPaused();
        TextView summary = row.findViewById(android.R.id.summary);
        if (!paused && !nextPaused && ReleaseCheck.statusLine() == null) {
            summary.setText(AbstractPreferenceFragment.restartPending.isEmpty()
                    ? L10n.t("Your switches are working.")
                    : L10n.t("A change here applies after Telegram restarts."));
        } else if (paused && nextPaused && HushTelegramPause.reason() == HushTelegramPause.Reason.SWITCH
                && !markerLeft()) {
            // A marker Resume couldn't remove keeps the card's own line, which says what to do.
            summary.setText(L10n.t("Your choices are saved. Tap Resume, then restart Telegram."));
        }
        bindAction(row, paused, nextPaused, false);
    }

    /**
     * The toolbar's Pause, Resume or Undo, on the home list while no search runs. It steps aside
     * while the status card is drawn, which carries the same button beside what it means, and when
     * this build has no Pause switch to turn on.
     */
    private void bindToolbar() {
        Button action = host.pauseAction;
        if (action == null) return;
        boolean paused = HushTelegramPause.isPaused();
        boolean nextPaused = HushTelegramPause.pausesNextStart(screen.getContext());
        boolean shown = home() && query.isEmpty() && !visible.contains(screen.getPreference(0))
                && page.findPreference(BaseSettings.PAUSED.key) instanceof SwitchPreference;
        action.setVisibility(shown ? View.VISIBLE : View.GONE);
        if (!shown) return;
        action.setText(paused != nextPaused ? L10n.t("Undo") : nextPaused ? L10n.t("Resume") : L10n.t("Pause"));
        action.setOnClickListener(ignored -> act(nextPaused, null, false));
    }

    /**
     * Pause, Resume or Undo in [row], whichever changes the next start. The list keeps its place,
     * so the page the button is on stays where it was.
     */
    private void bindAction(View row, boolean paused, boolean nextPaused, boolean pageStatusAction) {
        ViewGroup frame = row.findViewById(android.R.id.widget_frame);
        frame.removeAllViews();
        // Some platform preference templates give this frame MATCH_PARENT height. That measures
        // the button against the shorter text column and clips its 48dp target on Android 13.
        ViewGroup.LayoutParams frameSize = frame.getLayoutParams();
        frameSize.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        frame.setLayoutParams(frameSize);
        Button action = new Button(screen.getContext());
        action.setText(paused != nextPaused ? L10n.t("Undo") : nextPaused ? L10n.t("Resume") : L10n.t("Pause"));
        action.setAllCaps(false);
        action.setTextSize(14);
        action.setTextColor(palette().onAccent);
        action.setBackground(new android.graphics.drawable.InsetDrawable(
                palette().control(action, palette().accent, ScreenColors.BUTTON_RADIUS, false),
                0, dp(6), 0, dp(6)));
        action.setMinWidth(dp(48));
        action.setMinHeight(dp(48));
        action.setMinimumWidth(dp(48));
        action.setMinimumHeight(dp(48));
        action.setPadding(dp(14), 0, dp(14), 0);
        action.setTag(STATUS_ACTION);
        action.setOnClickListener(ignored -> act(nextPaused, row, pageStatusAction));
        // From one and a half times the text size, a button beside the text leaves the name too
        // little room and it breaks inside the word, so the button goes under the text there.
        TextView summary = row.findViewById(android.R.id.summary);
        if (screen.getContext().getResources().getConfiguration().fontScale >= 1.5f
                && summary != null && summary.getParent() instanceof android.widget.RelativeLayout) {
            android.widget.RelativeLayout.LayoutParams place = new android.widget.RelativeLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            place.addRule(android.widget.RelativeLayout.BELOW, android.R.id.summary);
            place.addRule(android.widget.RelativeLayout.ALIGN_PARENT_START);
            ViewGroup column = (ViewGroup) summary.getParent();
            View earlier = column.findViewWithTag(STATUS_ACTION);
            if (earlier != null) column.removeView(earlier);
            column.addView(action, place);
            frame.setVisibility(View.GONE);
            return;
        }
        frame.addView(action, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        frame.setVisibility(View.VISIBLE);
    }

    /** What a Pause, Resume or Undo button does. [row] is the status row it sits in, or null for the toolbar's. */
    private void act(boolean nextPaused, @Nullable View row, boolean pageStatusAction) {
        // Resume always goes through. Pause, or Undo on a resume, waits for the settings lock.
        if (!nextPaused && SettingsLock.refuses()) return;
        if (pageStatusAction && row != null) pageStatusHeight = Math.max(pageStatusHeight, row.getHeight());
        if (nextPaused) {
            page.resumeFromOverview();
        } else {
            Preference pause = page.findPreference(BaseSettings.PAUSED.key);
            if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(!nextPaused);
        }
        rebuild();
    }

    private boolean markerLeft() {
        java.io.File marker = HushTelegramPause.markerFile(screen.getContext());
        return marker != null && marker.exists();
    }

    private int dp(int value) { return Math.round(value * screen.getContext().getResources().getDisplayMetrics().density); }

    /**
     * The card a row is drawn in. Closed headings share one card, an open section's heading starts
     * a card its rows continue, and a split section's groups each get their own.
     */
    private Object group(Preference item) {
        Object card = cards.get(item);
        if (card != null) return card;
        Section section = sectionOf(item);
        if (section != null) return expanded.contains(section.id) ? section : sections;
        if (item == support || item == screen.getPreference(0) || item == restart || item == report) return item;
        if (item == changed) return sections;
        if (item.getParent() != null) return item.getParent();
        return sections;
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
