package app.template.extension.flashscore;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.template.extension.hevalcontrols.HevalSettings;

/**
 * "Spoiler-free mode" (Patch settings switch {@value #FEATURE_ID}, on by default): the user
 * long-presses a match row in a match list and marks it, and Flashscore then hides that match's
 * result where the user chose to (one switch per surface, each on by default and each depending on
 * the master switch): {@value #LISTS} masks its match list rows, {@value #NOTIFICATIONS} drops its
 * pushes.
 *
 * <p>The marks are the Patch settings list {@value #MATCHES} (Flashscore event ids, "Q1xbZ0M2").
 * It depends on the master switch, so {@link HevalSettings#isHidden} answers false (stock) while it
 * is off, and the user can un-mark entries or clear the list in Patch settings. Nothing leaves the
 * phone; finished matches stay in the list until the user un-marks them.
 *
 * <p>Only the display changes: the event model, sorting, live updates and every other reader of
 * the score are stock. The row binder calls {@link #unmaskRow} first (it puts back what the last
 * mask changed, so the stock binder starts from stock views) and {@link #maskRow} last.
 *
 * <p>The methods marked "patched" are stubs: the patch rewrites their bodies with the app's R8
 * names (the row's event model and its id field, the highlight view, the neutral name style).
 */
@SuppressWarnings("unused")
public final class SpoilerFree {
    static final String FEATURE_ID = "flashscore.spoiler_free";
    static final String NOTIFICATIONS = "flashscore.spoiler_notifications";
    static final String LISTS = "flashscore.spoiler_lists";
    static final String MATCHES = "flashscore.spoiler_events";
    private static final String TAG = "Morphe-Flashscore";

    /** Shown in the two main score cells of a masked row. */
    private static final String PLACEHOLDER = "–";

    /** The main score cells: they show {@link #PLACEHOLDER}. */
    private static final String[] RESULT_IDS = {"event_list_result_home", "event_list_result_away"};
    /** Further score and status cells: emptied. */
    private static final String[] BLANK_IDS = {
        "event_list_result_home_penalties", "event_list_result_away_penalties",
        "event_list_result_home_sets", "event_list_result_away_sets",
        "event_list_result_home_part", "event_list_result_away_part",
        "event_list_part_stage",
    };
    /** Winner marks: hidden (INVISIBLE, so the row keeps its layout). */
    private static final String[] WINNER_IDS = {
        "event_list_draw_winner_indicator_home", "event_list_draw_winner_indicator_away",
        "event_list_advancing_participant_home", "event_list_advancing_participant_away",
        "event_list_win_lose_icon",
    };
    /** The row background without the goal highlight. */
    private static final String PLAIN_BACKGROUND = "bg_event_list";

    private SpoilerFree() {
    }

    // ---------------------------------------------------------------------------------------
    // Patched accessors (stubs; the patch writes their bodies)
    // ---------------------------------------------------------------------------------------

    /** Patched: the event id of the match row {@code row} (its event model's id field). */
    public static String eventId(Object row) {
        return null;
    }

    /** Patched: the event model of the match row {@code row} (used by "Hide competitions"). */
    public static Object eventModel(Object row) {
        return null;
    }

    /** Patched: the view whose background the goal highlight sets ({@code holder}'s highlighter). */
    public static View highlightView(Object holder) {
        return null;
    }

    /** Patched: the text appearance the binder gives both names when neither side won. */
    public static int neutralNameStyle() {
        return 0;
    }

    // ---------------------------------------------------------------------------------------
    // Checks
    // ---------------------------------------------------------------------------------------

    static boolean isMarked(String eventId) {
        return eventId != null && !eventId.isEmpty() && HevalSettings.isHidden(MATCHES, eventId);
    }

    /**
     * Patched at the start of HandlerEventDuel/HandlerEventNoDuel/HandlerEventReport.isValid,
     * behind {@value #NOTIFICATIONS}: true makes isValid answer false, so the push is dropped.
     * {@code eventId} is the notification config's event id.
     */
    public static boolean blocksPush(String eventId) {
        try {
            return isMarked(eventId);
        } catch (Throwable failure) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Match list rows
    // ---------------------------------------------------------------------------------------

    /** What the last mask changed on one view, to put it back. */
    private static final class Undo {
        final WeakReference<View> view;
        final int kind;
        final Object original;
        final Object masked;

        Undo(View view, int kind, Object original, Object masked) {
            this.view = new WeakReference<>(view);
            this.kind = kind;
            this.original = original;
            this.masked = masked;
        }
    }

    private static final int TEXT = 0;
    private static final int VISIBILITY = 1;
    private static final int COLOR = 2;
    private static final int TYPEFACE = 3;
    private static final int BACKGROUND = 4;
    private static final int TEXT_SIZE = 5;

    /** A bound row: its current event and the holder (weak, the map keys must stay collectable). */
    static final class Row {
        String eventId;
        /** The row model of the last bind (data only, it never references the row's views). */
        Object model;
        WeakReference<Object> holder;
        List<Undo> undo;
        boolean listening;
        /** Whether {@link #ITEM_CLICK} was added because the root had no click listener of its own. */
        boolean addedClick;
        boolean wasClickable;
        boolean wasLongClickable;
    }

    /**
     * Installs the long press. A long-clickable view consumes the touch stream, so on rows whose root
     * has no click listener of its own (the bare binder path; the wrapper path sets one) the list
     * would never see the tap and the match page would not open. Those rows also get
     * {@link #ITEM_CLICK}, which hands the tap back to the list. An existing listener is never
     * replaced. A root stays on one binder path (rows are recycled within their own list).
     */
    private static void installListeners(View root, Row row) {
        row.wasClickable = root.isClickable();
        row.wasLongClickable = root.isLongClickable();
        if (!root.hasOnClickListeners()) {
            root.setOnClickListener(ITEM_CLICK);
            row.addedClick = true;
        }
        root.setOnLongClickListener(LONG_PRESS);
        row.listening = true;
    }

    /** Takes back what {@link #installListeners} added (on the row's next bind after the switch went off). */
    private static void removeListeners(View root, Row row) {
        if (!row.listening) return;
        root.setOnLongClickListener(null);
        root.setLongClickable(row.wasLongClickable);
        if (row.addedClick) {
            root.setOnClickListener(null);
            root.setClickable(row.wasClickable);
        }
        row.listening = false;
        row.addedClick = false;
    }

    /**
     * A tap on a row we made long-clickable: the list's own item click (what a tap does in stock),
     * else the parent's click.
     */
    private static final View.OnClickListener ITEM_CLICK = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            try {
                View child = view;
                ViewParent parent = view.getParent();
                while (parent instanceof View && !(parent instanceof AbsListView)) {
                    child = (View) parent;
                    parent = parent.getParent();
                }
                if (parent instanceof AbsListView) {
                    AbsListView list = (AbsListView) parent;
                    int position = list.getPositionForView(view);
                    if (position != AdapterView.INVALID_POSITION) {
                        list.performItemClick(child, position, list.getItemIdAtPosition(position));
                        return;
                    }
                }
                ViewParent direct = view.getParent();
                if (direct instanceof View) ((View) direct).performClick();
            } catch (Throwable failure) {
                Log.w(TAG, "Spoiler-free row tap failed: " + failure.getClass().getName());
            }
        }
    };

    /** Keyed by the row's root view (main thread only); values never reference the root strongly. */
    private static final Map<View, Row> rows = new WeakHashMap<>();
    private static final Map<String, Integer> ids = new HashMap<>();
    private static volatile Method getRoot;
    private static volatile Method getEventViewHolder;
    private static volatile Field homeName;
    private static volatile Field awayName;

    /** Patched at the start of the match row binder: puts back what the last mask changed. */
    public static void unmaskRow(Object holder) {
        try {
            View root = root(holder);
            if (root == null) return;
            Row row = rows.get(root);
            if (row != null) undo(row);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(rowFeature(), failure);
        }
    }

    /** Whether a long press on a row offers anything: spoiler-free mode or "Hide competitions" is on. */
    private static boolean longPressWanted() {
        return HevalSettings.isEnabled(FEATURE_ID) || HevalSettings.isEnabled(CompetitionFilter.FEATURE_ID);
    }

    /**
     * The feature a row hook failure is reported under: spoiler-free mode's list surface when its
     * master switch is on, else "Hide competitions" (the only other feature that hooks the rows).
     */
    private static String rowFeature() {
        return HevalSettings.isEnabled(FEATURE_ID) ? LISTS : CompetitionFilter.FEATURE_ID;
    }

    /**
     * Patched before the match row binder returns: masks the row when its match is marked and
     * {@value #LISTS} is on, and (while the master switch or "Hide competitions" is on) installs the
     * long press.
     */
    public static void maskRow(Object rowModel, Object holder) {
        try {
            View root = root(holder);
            if (root == null) return;
            boolean master = longPressWanted();
            Row row = rows.get(root);
            if (!master) {
                if (row != null) {
                    undo(row);
                    removeListeners(root, row);
                    rows.remove(root);
                }
                return;
            }
            if (row == null) {
                row = new Row();
                rows.put(root, row);
            }
            row.eventId = eventId(rowModel);
            row.model = rowModel;
            row.holder = new WeakReference<>(holder);
            if (!row.listening) installListeners(root, row);
            if (HevalSettings.isEnabled(FEATURE_ID) && HevalSettings.isEnabled(LISTS) && isMarked(row.eventId)) {
                mask(root, row, holder);
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure(rowFeature(), failure);
        }
    }

    private static View root(Object holder) throws Exception {
        if (holder == null) return null;
        Method method = getRoot;
        if (method == null) {
            method = holder.getClass().getMethod("getRoot");
            getRoot = method;
        }
        Object root = method.invoke(holder);
        return root instanceof View ? (View) root : null;
    }

    /** The holder's home and away name views (EventViewHolder keeps the field names). */
    private static TextView[] names(Object holder) throws Exception {
        if (holder == null) return new TextView[0];
        Method method = getEventViewHolder;
        if (method == null) {
            method = holder.getClass().getMethod("getEventViewHolder");
            getEventViewHolder = method;
        }
        Object eventView = method.invoke(holder);
        if (eventView == null) return new TextView[0];
        Field home = homeName;
        Field away = awayName;
        if (home == null || away == null) {
            home = eventView.getClass().getField("homeName");
            away = eventView.getClass().getField("awayName");
            homeName = home;
            awayName = away;
        }
        Object h = home.get(eventView);
        Object a = away.get(eventView);
        List<TextView> found = new ArrayList<>(2);
        if (h instanceof TextView) found.add((TextView) h);
        if (a instanceof TextView) found.add((TextView) a);
        return found.toArray(new TextView[0]);
    }

    private static View find(View root, String name) {
        Integer cached = ids.get(name);
        int id;
        if (cached == null) {
            Context context = root.getContext();
            id = context.getResources().getIdentifier(name, "id", context.getPackageName());
            ids.put(name, id);
        } else {
            id = cached;
        }
        return id == 0 ? null : root.findViewById(id);
    }

    /**
     * Masks a marked row. The score cells go first and every later step has its own try/catch, so a
     * failure further on never leaves the score visible.
     */
    private static void mask(View root, Row row, Object holder) throws Exception {
        if (row.undo != null) undo(row);
        List<Undo> undo = new ArrayList<>();
        row.undo = undo;

        // 1. The score, part, penalties, sets and stage cells, and the winner marks.
        List<TextView> results = new ArrayList<>(2);
        for (String name : RESULT_IDS) {
            View view = find(root, name);
            if (!(view instanceof TextView)) continue;
            results.add((TextView) view);
            setText(undo, (TextView) view, PLACEHOLDER);
        }
        for (String name : BLANK_IDS) {
            View view = find(root, name);
            if (view instanceof TextView) setText(undo, (TextView) view, "");
        }
        for (String name : WINNER_IDS) {
            hide(undo, find(root, name), View.INVISIBLE);
        }

        // 2. The extra row (aggregate or "Penalties 5-4") and the red-card counts.
        try {
            Object extra = call(holder, "getEventExtraRowHolder");
            hide(undo, (View) call(extra, "getExtraRowLayout"), View.GONE);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }
        try {
            Object indicators = call(holder, "getEventListIndicatorsHolder");
            hide(undo, (View) call(indicators, "getRedCardsHome"), View.INVISIBLE);
            hide(undo, (View) call(indicators, "getRedCardsAway"), View.INVISIBLE);
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }

        // 3. The names: the binder styles the winner; both get the no-winner appearance.
        ColorStateList plainText = null;
        try {
            TextView[] names = names(holder);
            int neutral = neutralNameStyle();
            for (TextView name : names) {
                undo.add(new Undo(name, COLOR, name.getTextColors(), null));
                undo.add(new Undo(name, TYPEFACE, name.getTypeface(), null));
                undo.add(new Undo(name, TEXT_SIZE, name.getTextSize(), null));
                if (neutral != 0) {
                    name.setTextAppearance(neutral);
                } else {
                    name.setTypeface(Typeface.create(name.getTypeface(), Typeface.NORMAL));
                }
            }
            if (names.length > 0) plainText = names[names.length - 1].getTextColors();
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }

        // 4. The goal highlight: the plain row background, and the placeholder in the name colour.
        try {
            View highlight = highlightView(holder);
            if (highlight != null) {
                Context context = highlight.getContext();
                int plain = context.getResources().getIdentifier(PLAIN_BACKGROUND, "drawable", context.getPackageName());
                if (plain != 0) {
                    undo.add(new Undo(highlight, BACKGROUND, highlight.getBackground(), null));
                    highlight.setBackgroundResource(plain);
                }
            }
            if (plainText != null) {
                for (TextView text : results) {
                    undo.add(new Undo(text, COLOR, text.getTextColors(), plainText));
                    text.setTextColor(plainText);
                }
            }
        } catch (Throwable failure) {
            HevalSettings.reportFailure(LISTS, failure);
        }
    }

    /** Hides {@code view} (if shown) with {@code visibility}, remembering it for the undo. */
    private static void hide(List<Undo> undo, View view, int visibility) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;
        undo.add(new Undo(view, VISIBILITY, View.VISIBLE, visibility));
        view.setVisibility(visibility);
    }

    private static final Map<String, Method> getters = new HashMap<>();

    /** Calls the public no-argument getter {@code name} (kept names; the patch checks they are public). */
    private static Object call(Object target, String name) throws Exception {
        if (target == null) return null;
        String key = target.getClass().getName() + "." + name;
        Method method = getters.get(key);
        if (method == null) {
            method = target.getClass().getMethod(name);
            getters.put(key, method);
        }
        return method.invoke(target);
    }

    private static void setText(List<Undo> undo, TextView view, String masked) {
        CharSequence original = view.getText();
        if (TextUtils.equals(original, masked)) return;
        undo.add(new Undo(view, TEXT, original, masked));
        view.setText(masked);
    }

    /** Puts back what the last mask changed, newest first; a view someone else changed since stays. */
    private static void undo(Row row) {
        List<Undo> undo = row.undo;
        row.undo = null;
        if (undo == null) return;
        for (int i = undo.size() - 1; i >= 0; i--) {
            Undo entry = undo.get(i);
            View view = entry.view.get();
            if (view == null) continue;
            try {
                switch (entry.kind) {
                    case TEXT: {
                        TextView text = (TextView) view;
                        if (TextUtils.equals(text.getText(), (CharSequence) entry.masked)) {
                            text.setText((CharSequence) entry.original);
                        }
                        break;
                    }
                    case VISIBILITY:
                        if (view.getVisibility() == (Integer) entry.masked) view.setVisibility((Integer) entry.original);
                        break;
                    case COLOR:
                        if (entry.original != null) ((TextView) view).setTextColor((ColorStateList) entry.original);
                        break;
                    case TYPEFACE:
                        ((TextView) view).setTypeface((Typeface) entry.original);
                        break;
                    case TEXT_SIZE:
                        ((TextView) view).setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, (Float) entry.original);
                        break;
                    case BACKGROUND:
                        view.setBackground((Drawable) entry.original);
                        break;
                    default:
                        break;
                }
            } catch (Throwable failure) {
                Log.w(TAG, "Spoiler-free undo failed: " + failure.getClass().getName());
            }
        }
    }

    // ---------------------------------------------------------------------------------------
    // Marking (long press on a row)
    // ---------------------------------------------------------------------------------------

    /** One entry of the long-press dialog (spoiler-free mode's and "Hide competitions"'). */
    interface Action {
        String title(Row row, String eventId);

        void run(Context context, View root, Row row, String eventId);
    }

    private static final Action TOGGLE_MATCH = new Action() {
        @Override
        public String title(Row row, String eventId) {
            return isMarked(eventId) ? "Show score" : "Hide score and alerts";
        }

        @Override
        public void run(Context context, View root, Row row, String eventId) {
            boolean mark = !isMarked(eventId);
            if (mark && HevalSettings.pickedHidden(MATCHES).size() >= HevalSettings.MAX_HIDDEN) {
                toast(context, "The marked matches list is full (" + HevalSettings.MAX_HIDDEN
                    + "). Remove some or clear it in Patch settings, Scores and spoilers, Marked matches.");
                return;
            }
            if (!HevalSettings.setHidden(MATCHES, eventId, mark)) {
                toast(context, "Could not save the change");
                return;
            }
            if (mark) HevalSettings.reportOptionsSeen(MATCHES, eventId, matchLabel(row, eventId));
            // The row may have been rebound to another match while the dialog was open.
            if (eventId.equals(row.eventId)) {
                try {
                    if (mark && HevalSettings.isEnabled(LISTS)) {
                        Object holder = row.holder == null ? null : row.holder.get();
                        if (holder != null) mask(root, row, holder);
                    } else if (!mark) {
                        undo(row);
                    }
                } catch (Throwable failure) {
                    HevalSettings.reportFailure(LISTS, failure);
                }
            }
            toast(context, mark ? "Score and alerts hidden for this match" : "Score shown again");
        }
    };

    /** The dialog's entries for this row, in order: only those whose switch is on. */
    private static List<Action> actions() {
        List<Action> actions = new ArrayList<>(2);
        if (HevalSettings.isEnabled(FEATURE_ID)) actions.add(TOGGLE_MATCH);
        if (HevalSettings.isEnabled(CompetitionFilter.FEATURE_ID)) actions.add(CompetitionFilter.TOGGLE);
        return actions;
    }

    private static final View.OnLongClickListener LONG_PRESS = new View.OnLongClickListener() {
        @Override
        public boolean onLongClick(View root) {
            try {
                if (!longPressWanted()) return false;
                final Row row = rows.get(root);
                final String eventId = row == null ? null : row.eventId;
                if (eventId == null || eventId.isEmpty()) return false;
                showDialog(root, row, eventId);
                return true;
            } catch (Throwable failure) {
                Log.w(TAG, "Spoiler-free long press failed: " + failure.getClass().getName());
                return false;
            }
        }
    };

    private static void showDialog(final View root, final Row row, final String eventId) {
        final Context context = root.getContext();
        final List<Action> actions = actions();
        if (actions.isEmpty()) return;
        String[] titles = new String[actions.size()];
        for (int i = 0; i < titles.length; i++) {
            titles[i] = actions.get(i).title(row, eventId);
        }
        new AlertDialog.Builder(context)
            .setTitle(matchLabel(row, eventId))
            .setItems(titles, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    try {
                        actions.get(which).run(context, root, row, eventId);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Spoiler-free action failed: " + failure.getClass().getName());
                    }
                }
            })
            .setNegativeButton(android.R.string.cancel, null)
            .show();
    }

    /** "Home - Away" from the row's name views, else "Match <id>". */
    private static String matchLabel(Row row, String eventId) {
        try {
            Object holder = row.holder == null ? null : row.holder.get();
            TextView[] names = names(holder);
            if (names.length == 2) {
                String home = names[0].getText().toString().trim();
                String away = names[1].getText().toString().trim();
                if (!home.isEmpty() && !away.isEmpty()) return home + " - " + away;
            }
        } catch (Throwable ignored) {
            // Fall back to the id below.
        }
        return "Match " + eventId;
    }

    static void toast(Context context, String text) {
        try {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
            // A toast is only feedback.
        }
    }
}
