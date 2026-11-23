package app.template.extension.sofascore;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.RemoteViews;
import android.widget.Toast;

import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Spoiler-free mode" (Patch settings switch {@value #FEATURE_ID}, on by default): the user marks
 * a match on its match page or a whole competition on its page, and Sofascore then hides that
 * match's score where the user chose to (one Patch settings switch per surface, each on by default
 * and each depending on the master switch): {@value #NOTIFICATIONS} drops its pushes,
 * {@value #LISTS} blanks the score and status cells of its match list rows, {@value #WIDGET}
 * blanks the scores of its home-screen widget row and shows the kickoff time as its status.
 *
 * <p>A marked match is hidden only until full time: once its status is "finished" its score shows
 * again on its own, unless {@value #KEEP_FINAL_HIDDEN} (off by default, depending on the master
 * switch) keeps finished marked matches hidden until the user un-marks them. Every surface asks
 * {@link #hidesScore(Object)} (pushes excepted, see {@link #blocksPush}).
 *
 * <p>The marks are two Patch settings lists, {@value #MATCHES} (Sofascore event ids, "12436870")
 * and {@value #COMPETITIONS} (UniqueTournament ids, keyed like "Hide competitions": "17" is the
 * Premier League). Both depend on the master switch, so {@link HevalSettings#getHidden} answers
 * empty (stock) while it is off, and the user can un-mark entries in Patch settings. Nothing leaves
 * the phone; finished matches stay in the list until the user un-marks them (at most
 * {@link HevalSettings#MAX_HIDDEN} marks per list).
 *
 * <p>Only the display changes: the Event objects, sorting, live updates, the database and every
 * other reader of the score are stock, so un-marking shows the current score at once.
 */
@SuppressWarnings("unused")
public final class SpoilerFree {
    static final String FEATURE_ID = "sofascore.spoiler_free";
    static final String NOTIFICATIONS = "sofascore.spoiler_notifications";
    static final String LISTS = "sofascore.spoiler_lists";
    static final String WIDGET = "sofascore.spoiler_widget";
    static final String KEEP_FINAL_HIDDEN = "sofascore.spoiler_keep_final";
    static final String MATCH_PAGE = "sofascore.spoiler_match_page";
    static final String MATCHES = "sofascore.spoiler_events";
    static final String COMPETITIONS = "sofascore.spoiler_competitions";
    private static final String TAG = "Morphe-Sofascore";

    /** Outside Sofascore's own 0x7f...... resource ids, so no inflated item clashes with it. */
    private static final int ITEM_ID = 0x7e5f0001;
    /** After the inflated items (their order is 0), inside the overflow menu. */
    private static final int ITEM_ORDER = 1000;

    /** Push targets ("open" -> "target") whose "id" is the event id. */
    private static final String[] EVENT_TARGETS = {"details", "highlights", "lineups"};

    /** The widget row's score cells (layout widget_row_event); the patch checks the names exist. */
    private static final String[] WIDGET_SCORE_IDS = {
        "first_main", "second_main", "first_secondary", "second_secondary", "first_penalties", "second_penalties",
    };
    private static final String WIDGET_STATUS_ID = "status_text";

    private SpoilerFree() {
    }

    // ---------------------------------------------------------------------------------------
    // Checks
    // ---------------------------------------------------------------------------------------

    private static boolean isMatchMarked(String eventId) {
        return eventId != null && HevalSettings.isHidden(MATCHES, eventId);
    }

    private static boolean isCompetitionMarked(String competitionId) {
        return competitionId != null && HevalSettings.isHidden(COMPETITIONS, competitionId);
    }

    /** The key of a positive Integer id, else null. */
    private static String key(Object id) {
        return id instanceof Integer && (Integer) id > 0 ? Integer.toString((Integer) id) : null;
    }

    private static String eventKey(Object event) throws Exception {
        return event == null ? null : key(CountryFilter.call(event, "getId"));
    }

    /** The UniqueTournament of {@code event} (its tournament's), or null. */
    private static Object competition(Object event) throws Exception {
        Object tournament = event == null ? null : CountryFilter.call(event, "getTournament");
        return tournament == null ? null : CountryFilter.call(tournament, "getUniqueTournament");
    }

    private static String competitionKey(Object event) throws Exception {
        Object competition = competition(event);
        return competition == null ? null : key(CountryFilter.call(competition, "getId"));
    }

    /** Sofascore's status type of a match that is over; every other type (live, not started) hides. */
    static final String FINISHED = "finished";
    /** The status type of a match that has not started (no score yet). */
    static final String NOT_STARTED = "notstarted";

    /**
     * The shared decision, pure: a match's score is hidden when the match or its competition is
     * marked and the match is not over ({@code statusType} is not {@value #FINISHED}), or when
     * {@code keepFinalHidden} is on. A missing or unknown status hides (the safe side).
     */
    static boolean hidesScore(boolean matchMarked, boolean competitionMarked, String statusType, boolean keepFinalHidden) {
        if (!matchMarked && !competitionMarked) return false;
        return keepFinalHidden || !FINISHED.equals(statusType);
    }

    /** Event.getStatusType() ("inprogress", "finished", ...), or null when it cannot be read. */
    static String statusType(Object event) {
        try {
            Object type = event == null ? null : CountryFilter.call(event, "getStatusType");
            return type instanceof String ? (String) type : null;
        } catch (Throwable failure) {
            return null;
        }
    }

    /**
     * Whether a surface hides the score of Sofascore's Event {@code event} right now: marked (by id or
     * competition) and not finished, or finished with {@value #KEEP_FINAL_HIDDEN} on. Read at every
     * call, so a match shows its score again at the first redraw after full time. The one decision
     * for every score hook (lists, widget, and the match page hooks still to come).
     */
    public static boolean hidesScore(Object event) {
        try {
            if (event == null) return false;
            boolean match = isMatchMarked(eventKey(event));
            boolean competition = !match && isCompetitionMarked(competitionKey(event));
            if (!match && !competition) return false;
            return hidesScore(match, competition, statusType(event), HevalSettings.isEnabled(KEEP_FINAL_HIDDEN));
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Notifications
    // ---------------------------------------------------------------------------------------

    /** The push "icon" of the full-time result; every other icon (goal, start, half time, cards...) is live. */
    static final String FINISH_ICON = "finish";

    /** Which event ids are marked; {@link #blocksPush(String, Marks, boolean)} takes it so it stays pure. */
    interface Marks {
        boolean isMatchMarked(String eventId);
    }

    private static final Marks SETTINGS_MARKS = new Marks() {
        @Override
        public boolean isMatchMarked(String eventId) {
            return SpoilerFree.isMatchMarked(eventId);
        }
    };

    /**
     * Patched into FCMListenerService.onMessageReceived, behind {@value #NOTIFICATIONS}: true drops
     * the push before Sofascore handles it. {@code message} is the FCM message bundle; see
     * {@link #blocksPush(String, Marks, boolean)} for the rule.
     */
    public static boolean blocksPush(Bundle message) {
        try {
            if (message == null) return false;
            return blocksPush(message.getString("notification"), SETTINGS_MARKS, HevalSettings.isEnabled(KEEP_FINAL_HIDDEN));
        } catch (Throwable failure) {
            return false;
        }
    }

    /**
     * The push rule, pure. {@code json} is the push's "notification" JSON: its "open" object names the
     * target ("details", "highlights", "lineups") and the event "id", its "icon" the kind of alert
     * ("finish" is the full-time result; goals, kick-off, half time, cards and the rest are live). A
     * push of a marked match is dropped, except the full-time result while {@code keepFinalHidden} is
     * off (the score shows again at full time, like every other surface). A push of a marked match
     * without a readable icon is dropped (the safe side). Pushes carry no competition id, so only
     * marked matches are matched here, not marked competitions. Unreadable JSON passes (stock).
     */
    static boolean blocksPush(String json, Marks marks, boolean keepFinalHidden) {
        try {
            if (json == null || json.isEmpty()) return false;
            JSONObject push = new JSONObject(json);
            JSONObject open = push.optJSONObject("open");
            if (open == null) return false;
            String target = open.optString("target");
            boolean eventTarget = false;
            for (String candidate : EVENT_TARGETS) {
                if (candidate.equals(target)) eventTarget = true;
            }
            if (!eventTarget || !marks.isMatchMarked(key(open.optInt("id")))) return false;
            Object icon = push.opt("icon");
            boolean finalResult = icon instanceof String && FINISH_ICON.equals(icon);
            return keepFinalHidden || !finalResult;
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Match list rows
    // ---------------------------------------------------------------------------------------

    /** A score cell's state: the text Sofascore last set and whether its row's match is marked. */
    private static final class Cell {
        String text;
        boolean masked;
    }

    /** The score cells seen by the row hook (main thread only; views go with their rows). */
    private static final Map<View, Cell> cells = new WeakHashMap<>();
    private static volatile Method setText;

    /**
     * Patched into EventListScoreTextView.setText(String), behind {@value #LISTS}: remembers the
     * text and answers "" while the cell belongs to a marked match's row. Cells the row hook never
     * saw pass unchanged.
     */
    public static String scoreText(View view, String text) {
        try {
            Cell cell = cells.get(view);
            if (cell == null) return text;
            cell.text = text;
            return cell.masked ? "" : text;
        } catch (Throwable failure) {
            return text;
        }
    }

    /**
     * Patched at the start of the match row binder, behind {@value #LISTS}, once per score cell of
     * the row (scores, period scores, aggregate, penalties and the status cell "FT"/"67'"): marks the
     * cell for this bind with {@link #hidesScore(Object)}, so every bind re-reads the mark and the
     * match status. A cell whose state flips (marked, un-marked, or the match reached full time) is
     * redrawn with its last text, so a recycled row never keeps a hidden or a stale score.
     */
    public static void markRow(View view, Object event) {
        try {
            if (view == null) return;
            boolean masked = hidesScore(event);
            Cell cell = cells.get(view);
            if (cell == null) {
                if (!masked) return;
                cell = new Cell();
                cells.put(view, cell);
            }
            if (cell.masked == masked) return;
            cell.masked = masked;
            if (cell.text == null) return;
            Method method = setText;
            if (method == null) {
                method = view.getClass().getMethod("setText", String.class);
                setText = method;
            }
            method.invoke(view, cell.text);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Compose match rows (main Matches tab, team, league, live, favourites, match page lists).
    // Apart from the main Matches tab these screens are expected from static analysis of who
    // renders the row model, not observed on a device.
    // ---------------------------------------------------------------------------------------

    private static final int MAX_NOTED = 8192;

    /**
     * The row mapper's decision per event id, for {@link #maskRow}: TRUE = the row hides its score
     * ({@link #hidesScore(Object)} at mapping time, the status included), FALSE = the match is marked
     * but its score shows (finished). Only these exceptions are kept; an absent id falls back to the
     * match's own mark. Access-ordered, so a row still being drawn stays; the least recently used id
     * is dropped past {@link #MAX_NOTED}.
     */
    private static final Map<Integer, Boolean> rowDecisions = new LinkedHashMap<Integer, Boolean>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Integer, Boolean> eldest) {
            return size() > MAX_NOTED;
        }
    };

    /** Line class -> its score fields (home/away line objects share one class), or an empty array. */
    private static final Map<Class<?>, Field[]> scoreFields = new HashMap<>();

    /**
     * Patched into the Compose row mapper just before it builds the row model, with the Event: the
     * row model only carries the event id, so the decision (marks and status) is made here and
     * noted for {@link #maskRow}. Every mapping decides again, so a new status from Sofascore (full
     * time) or a changed mark applies to the row built from it. Behind {@value #LISTS}.
     */
    public static void noteEvent(Object event) {
        try {
            if (event == null || !HevalSettings.isEnabled(LISTS)) return;
            Object id = CountryFilter.call(event, "getId");
            if (!(id instanceof Integer)) return;
            boolean match = isMatchMarked(key(id));
            boolean competition = !match && isCompetitionMarked(competitionKey(event));
            boolean hidden = (match || competition)
                && hidesScore(match, competition, statusType(event), HevalSettings.isEnabled(KEEP_FINAL_HIDDEN));
            noteRow((Integer) id, match, hidden);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }
    }

    /** Records the mapper's decision for {@code eventId} (only the exceptions, see {@link #rowDecisions}). */
    static void noteRow(int eventId, boolean matchMarked, boolean hidden) {
        synchronized (rowDecisions) {
            if (hidden) {
                rowDecisions.put(eventId, Boolean.TRUE);
            } else if (matchMarked) {
                rowDecisions.put(eventId, Boolean.FALSE);
            } else {
                rowDecisions.remove(eventId);
            }
        }
    }

    /**
     * Whether the row model of {@code eventId} hides its score: the mapper's decision, else the
     * match's own mark (a row the mapper did not decide, such as an old row copied by the live status
     * tick, which only runs for live matches; an unknown status hides).
     */
    static boolean rowHidden(int eventId, boolean matchMarked) {
        synchronized (rowDecisions) {
            Boolean decided = rowDecisions.get(eventId);
            return decided != null ? decided : matchMarked;
        }
    }

    /**
     * Patched into the start of the Compose row model's constructor with its first five arguments
     * (event id, kickoff text, status text, home line, away line): for a row that hides its score
     * ({@link #rowHidden}) the score fields of both team lines are set to null (the row shows no
     * score) and null is returned as the status text (the live minute or "FT"); otherwise
     * {@code timeLower} comes back unchanged. The kickoff time and the team names stay. The live
     * status copy passes the lines of the row it copies, so it keeps that row's decision. Behind
     * {@value #LISTS} and its master switch.
     */
    public static Object maskRow(int eventId, Object timeUpper, Object timeLower, Object home, Object away) {
        try {
            if (!HevalSettings.isEnabled(LISTS)) return timeLower;
            if (!rowHidden(eventId, isMatchMarked(eventId > 0 ? Integer.toString(eventId) : null))) return timeLower;
            clearScores(home);
            clearScores(away);
            return null;
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
            return timeLower;
        }
    }

    private static void clearScores(Object line) throws Exception {
        if (line == null) return;
        Field[] fields = scoreFieldsOf(line.getClass());
        for (Field field : fields) {
            field.set(line, null);
        }
    }

    /**
     * The last three declared fields of the type that the line class declares four times (the name,
     * game score, set score and score cells are all RowText; the patch checked this shape), in
     * field-name order (the patch checks that this is the constructor order): game score, set score, score. Empty
     * when the shape is not as expected.
     */
    static Field[] scoreFieldsOf(Class<?> type) {
        synchronized (scoreFields) {
            Field[] cached = scoreFields.get(type);
            if (cached != null) return cached;
            Field[] found = new Field[0];
            try {
                Map<Class<?>, List<Field>> byType = new LinkedHashMap<>();
                for (Field field : type.getDeclaredFields()) {
                    Class<?> fieldType = field.getType();
                    if (Modifier.isStatic(field.getModifiers()) || fieldType.isPrimitive()) continue;
                    List<Field> same = byType.get(fieldType);
                    if (same == null) {
                        same = new ArrayList<>();
                        byType.put(fieldType, same);
                    }
                    same.add(field);
                }
                List<Field> cells = null;
                for (List<Field> same : byType.values()) {
                    if (same.size() == 4) {
                        if (cells != null) {
                            cells = null;
                            break;
                        }
                        cells = same;
                    }
                }
                if (cells != null) {
                    // The patch pins the constructor order to the name order; sort here so the result
                    // never depends on the order getDeclaredFields() happens to return.
                    Collections.sort(cells, new Comparator<Field>() {
                        @Override
                        public int compare(Field a, Field b) {
                            return a.getName().compareTo(b.getName());
                        }
                    });
                    found = new Field[] {cells.get(1), cells.get(2), cells.get(3)};
                    for (Field field : found) {
                        field.setAccessible(true);
                    }
                } else {
                    HevalSettings.reportFailure(LISTS, new IllegalStateException("EventTeamLine shape changed"));
                }
            } catch (Throwable failure) {
                found = new Field[0];
                HevalSettings.reportFailure(LISTS, failure);
            }
            scoreFields.put(type, found);
            return found;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Home-screen widget
    // ---------------------------------------------------------------------------------------

    /**
     * Patched before the widget row builder returns, behind {@value #WIDGET}: for a match whose
     * score is hidden ({@link #hidesScore(Object)}) the score cells are emptied and the status cell
     * shows the kickoff time. The widget redraws on its own schedule, so a finished match shows its
     * score at the widget's next refresh.
     */
    public static void maskWidgetRow(Context context, RemoteViews row, Object event) {
        try {
            if (context == null || row == null || !hidesScore(event)) return;
            String pkg = context.getPackageName();
            for (String name : WIDGET_SCORE_IDS) {
                int id = context.getResources().getIdentifier(name, "id", pkg);
                if (id != 0) row.setTextViewText(id, "");
            }
            int status = context.getResources().getIdentifier(WIDGET_STATUS_ID, "id", pkg);
            Object start = CountryFilter.call(event, "getStartTimestamp");
            if (status != 0 && start instanceof Long) {
                row.setTextViewText(status, DateFormat.getTimeFormat(context).format(new Date((Long) start * 1000L)));
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure(WIDGET, failure);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Match page header. Which views each sport's header uses is read from the app's code
    // (static analysis), not observed on a device.
    // ---------------------------------------------------------------------------------------

    /**
     * Header parts besides the result view that show the score, by layout id name (the patch checks
     * the names exist): the football goal scorers under the result, and the tennis and volleyball
     * scores shown in the collapsed toolbar.
     */
    static final String[] HEADER_SCORE_IDS = {
        "additional_info_container", "container_result_collapsed", "collapsed_result_first_team",
        "collapsed_result_second_team", "collapsed_result_view",
    };

    /** Each match page header's last decision (main thread only; headers go with their activity). */
    private static final Map<View, Boolean> headers = new WeakHashMap<>();
    /** The header views this class made INVISIBLE, so only those are made visible again. */
    private static final Map<View, Boolean> hiddenViews = new WeakHashMap<>();

    /**
     * Patched into the start of every match page header's setEvent(Event) (one per sport family; the
     * activity calls it with every update of the match, so a status change is seen at once), behind
     * {@value #MATCH_PAGE}: while {@link #hidesScore(Object)} holds the header's result view (score,
     * live minute, period scores) and {@link #HEADER_SCORE_IDS} are INVISIBLE (the layout keeps its
     * size, the team names and logos stay); otherwise the views this class hid are shown again. A
     * match that has not started has no score yet, so its kickoff date stays. Live ticks of the
     * minute only change text inside the hidden view.
     */
    public static void onHeader(Object header, Object event) {
        try {
            if (!(header instanceof View)) return;
            View view = (View) header;
            boolean hidden = HevalSettings.isEnabled(MATCH_PAGE) && hidesScore(event) && !NOT_STARTED.equals(statusType(event));
            headers.put(view, hidden);
            Object result = CountryFilter.call(header, "getResultView");
            if (result instanceof View) apply((View) result, hidden);
            String pkg = view.getContext().getPackageName();
            for (String name : HEADER_SCORE_IDS) {
                int id = view.getResources().getIdentifier(name, "id", pkg);
                View part = id == 0 ? null : view.findViewById(id);
                if (part != null) apply(part, hidden);
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure(MATCH_PAGE, failure);
        }
    }

    /**
     * Patched into the start of the header's setResultView(ViewGroup): a result view inflated while
     * setEvent runs (the layout changes with the match status) gets the header's current decision.
     */
    public static void onResultView(Object header, Object resultView) {
        try {
            Boolean hidden = headers.get(header);
            if (hidden != null && resultView instanceof View) apply((View) resultView, hidden);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(MATCH_PAGE, failure);
        }
    }

    /**
     * Patched into the start of the football header's setFootballGoals(List): true skips the goal
     * scorers list while the header hides its score (the list would make its container visible).
     */
    public static boolean hidesHeaderGoals(Object header) {
        try {
            Boolean hidden = headers.get(header);
            return hidden != null && hidden;
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Match page Details tab: the period score tables and the period points graph.
    // ---------------------------------------------------------------------------------------

    /** A Details module's state: whether it is masked and the visibility the app last asked for. */
    private static final class Module {
        boolean masked;
        int requested;
        boolean applying;
    }

    private static final Map<View, Module> modules = new WeakHashMap<>();

    /**
     * Patched into the start of a score module's bind method (the period score tables of the
     * Details tab and the period points graph), behind {@value #MATCH_PAGE}: while the page hides
     * the score (the rule of {@link #onHeader}) the module is GONE; when it no longer does, it gets
     * back the visibility the app last asked for.
     */
    public static void maskModule(Object module, Object event) {
        try {
            if (!(module instanceof View)) return;
            View view = (View) module;
            boolean masked = HevalSettings.isEnabled(MATCH_PAGE) && hidesScore(event) && !NOT_STARTED.equals(statusType(event));
            Module state = modules.get(view);
            if (state == null) {
                if (!masked) return;
                state = new Module();
                state.requested = view.getVisibility();
                modules.put(view, state);
            }
            if (state.masked == masked) return;
            state.masked = masked;
            state.applying = true;
            try {
                view.setVisibility(masked ? View.GONE : state.requested);
            } finally {
                state.applying = false;
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure(MATCH_PAGE, failure);
        }
    }

    /**
     * Patched into the start of the share modal's match header bind (its second argument is not the
     * Event): the header (score, status, teams) is GONE like a Details module, so a shared card of a
     * hidden match carries no score.
     */
    public static void maskShareHeader(Object header, Object unused, Object event) {
        maskModule(header, event);
    }

    /**
     * Patched into the start of the Details modules' shared setVisibility(int) (the base class of the
     * score tables, which set their own visibility while they bind): a masked module stays GONE and
     * the requested value is kept for {@link #maskModule}. Other modules pass unchanged.
     */
    public static int moduleVisibility(Object module, int visibility) {
        try {
            Module state = modules.get(module);
            if (state == null || state.applying) return visibility;
            state.requested = visibility;
            return state.masked ? View.GONE : visibility;
        } catch (Throwable failure) {
            return visibility;
        }
    }

    /** Hides a visible view, or shows again a view this class hid; views the app hid itself stay as they are. */
    private static void apply(View view, boolean hidden) {
        if (hidden) {
            if (view.getVisibility() == View.VISIBLE) {
                view.setVisibility(View.INVISIBLE);
                hiddenViews.put(view, Boolean.TRUE);
            }
        } else if (hiddenViews.remove(view) != null && view.getVisibility() == View.INVISIBLE) {
            view.setVisibility(View.VISIBLE);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Menu items
    // ---------------------------------------------------------------------------------------

    /** The item and the subject (Event or UniqueTournament) of each open match or competition page. */
    private static final class Page {
        MenuItem item;
        Object subject;
    }

    private static final Map<Activity, Page> pages = new WeakHashMap<>();

    private static Page page(Object host) {
        if (!(host instanceof Activity)) return null;
        Activity activity = (Activity) host;
        Page page = pages.get(activity);
        if (page == null) {
            page = new Page();
            pages.put(activity, page);
        }
        return page;
    }

    /**
     * Patched into EventActivity.onCreateOptionsMenu, behind the master switch: adds "Spoiler-free:
     * on/off" for this match (hidden until the match is known, see {@link #onMatch}).
     */
    public static void addMatchItem(Object activity, Menu menu) {
        addItem(activity, menu, true);
    }

    /** Patched into LeagueActivity.onCreateOptionsMenu, behind the master switch: the competition's item. */
    public static void addCompetitionItem(Object activity, Menu menu) {
        addItem(activity, menu, false);
    }

    /** Patched into EventActivity's only (Event)V method (it refreshes the menu with the match), behind the master switch. */
    public static void onMatch(Object activity, Object event) {
        setSubject(activity, event, true);
    }

    /** Patched into LeagueActivity's only (UniqueTournament)V method, behind the master switch. */
    public static void onCompetition(Object activity, Object uniqueTournament) {
        setSubject(activity, uniqueTournament, false);
    }

    private static void addItem(Object host, Menu menu, final boolean match) {
        try {
            final Page page = page(host);
            if (page == null || menu == null) return;
            final Activity activity = (Activity) host;
            menu.removeItem(ITEM_ID);
            MenuItem item = menu.add(Menu.NONE, ITEM_ID, ITEM_ORDER, "Spoiler-free");
            item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            item.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() {
                @Override
                public boolean onMenuItemClick(MenuItem clicked) {
                    try {
                        toggle(activity, page, match);
                        refresh(page, match);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Spoiler-free toggle failed: " + failure.getClass().getName());
                    }
                    return true;
                }
            });
            page.item = item;
            refresh(page, match);
        } catch (Throwable failure) {
            Log.w(TAG, "Spoiler-free item not added: " + failure.getClass().getName());
        }
    }

    private static void setSubject(Object host, Object subject, boolean match) {
        try {
            Page page = page(host);
            if (page == null || subject == null) return;
            page.subject = subject;
            refresh(page, match);
        } catch (Throwable failure) {
            Log.w(TAG, "Spoiler-free subject not set: " + failure.getClass().getName());
        }
    }

    /** The item's title for the current subject; hidden while the subject is unknown. */
    private static void refresh(Page page, boolean match) throws Exception {
        MenuItem item = page.item;
        if (item == null) return;
        Object subject = page.subject;
        String key = subjectKey(subject, match);
        item.setVisible(key != null);
        if (key == null) return;
        String title;
        if (match && isCompetitionMarked(competitionKey(subject))) {
            title = "Spoiler-free: on (competition)";
        } else {
            title = HevalSettings.isHidden(match ? MATCHES : COMPETITIONS, key) ? "Spoiler-free: on" : "Spoiler-free: off";
        }
        item.setTitle(title);
    }

    private static String subjectKey(Object subject, boolean match) throws Exception {
        if (subject == null) return null;
        return match ? eventKey(subject) : key(CountryFilter.call(subject, "getId"));
    }

    private static void toggle(Activity activity, Page page, boolean match) throws Exception {
        Object subject = page.subject;
        String key = subjectKey(subject, match);
        if (key == null) return;
        if (match && isCompetitionMarked(competitionKey(subject))) {
            toast(activity, "The whole competition is spoiler-free. Turn it off on the competition page.");
            return;
        }
        String listId = match ? MATCHES : COMPETITIONS;
        boolean mark = !HevalSettings.isHidden(listId, key);
        if (!HevalSettings.setHidden(listId, key, mark)) {
            toast(activity, "Could not save the change");
            return;
        }
        if (mark) HevalSettings.reportOptionsSeen(listId, key, match ? matchLabel(subject, key) : competitionLabel(subject, key));
        toast(activity, mark ? "Spoiler-free on: scores and alerts are hidden" : "Spoiler-free off");
    }

    /** "Home - Away", else "Match <id>". */
    private static String matchLabel(Object event, String key) {
        try {
            String home = teamName(CountryFilter.call(event, "getHomeTeam"));
            String away = teamName(CountryFilter.call(event, "getAwayTeam"));
            if (home != null && away != null) return home + " - " + away;
        } catch (Throwable ignored) {
            // Fall back to the id below.
        }
        return "Match " + key;
    }

    private static String teamName(Object team) throws Exception {
        Object name = team == null ? null : CountryFilter.call(team, "getName");
        return name instanceof String && !((String) name).trim().isEmpty() ? ((String) name).trim() : null;
    }

    /** "category · name" like "Hide competitions", else "Competition <id>". */
    private static String competitionLabel(Object uniqueTournament, String key) {
        try {
            Object category = CountryFilter.call(uniqueTournament, "getCategory");
            Object categoryName = category == null ? null : CountryFilter.call(category, "getName");
            Object name = CountryFilter.call(uniqueTournament, "getName");
            String label = CompetitionFilter.label(categoryName instanceof String ? (String) categoryName : null,
                name instanceof String ? (String) name : null);
            if (label != null) return label;
        } catch (Throwable ignored) {
            // Fall back to the id below.
        }
        return "Competition " + key;
    }

    private static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // A toast is only feedback.
        }
    }
}
