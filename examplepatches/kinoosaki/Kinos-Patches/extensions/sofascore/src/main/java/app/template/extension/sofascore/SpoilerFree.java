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

import java.lang.reflect.Method;
import java.util.Date;
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

    /** Whether Sofascore's Event {@code event} is marked, by its id or its competition. */
    static boolean isMarked(Object event) {
        try {
            if (event == null) return false;
            return isMatchMarked(eventKey(event)) || isCompetitionMarked(competitionKey(event));
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Notifications
    // ---------------------------------------------------------------------------------------

    /**
     * Patched into FCMListenerService.onMessageReceived, behind {@value #NOTIFICATIONS}: true drops
     * the push before Sofascore handles it. {@code message} is the FCM message bundle; match pushes
     * carry the JSON "notification" whose "open" object names the target ("details") and the event
     * "id". Pushes carry no competition id, so only marked matches are blocked here.
     */
    public static boolean blocksPush(Bundle message) {
        try {
            if (message == null) return false;
            String json = message.getString("notification");
            if (json == null || json.isEmpty()) return false;
            JSONObject open = new JSONObject(json).optJSONObject("open");
            if (open == null) return false;
            String target = open.optString("target");
            boolean eventTarget = false;
            for (String candidate : EVENT_TARGETS) {
                if (candidate.equals(target)) eventTarget = true;
            }
            return eventTarget && isMatchMarked(key(open.optInt("id")));
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
     * cell for this bind. A cell whose state flips is redrawn with its last text, so a recycled row
     * never keeps a hidden or a stale score.
     */
    public static void markRow(View view, Object event) {
        try {
            if (view == null) return;
            boolean masked = isMarked(event);
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
    // Home-screen widget
    // ---------------------------------------------------------------------------------------

    /**
     * Patched before the widget row builder returns, behind {@value #WIDGET}: for a marked match
     * the score cells are emptied and the status cell shows the kickoff time.
     */
    public static void maskWidgetRow(Context context, RemoteViews row, Object event) {
        try {
            if (context == null || row == null || !isMarked(event)) return;
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
