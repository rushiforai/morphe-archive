package app.template.extension.playfy;

import android.app.AlertDialog;
import android.content.Context;
import android.util.Log;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Playfy TV 1.7 (com.playfy.tv) - pin categories to the top of the Category section.
 *
 * Deliberately dumb and defensive: every public entry point is wrapped in try/catch and falls back
 * to stock behaviour, so a surprise in a future build degrades to "the feature does nothing"
 * instead of a crash.
 *
 * Nothing here refers to an app class by name at compile time. The patched code passes plain
 * Object/View/List values and everything app-specific is resolved reflectively:
 *
 *   kd.i     the category model      -> a:I (id), b:String (title)
 *   gd.b     the row holder          -> u:Lcom/playfy/tv/databinding/CatItemBinding;
 *   binding  CatItemBinding          -> a:MaterialCardView (root), c:TextView (title)
 *
 * Hooks installed by the patch:
 *   App.onCreate()                 -> init(Context)
 *   nd.e.S(List) before submitList -> onSubmit(adapter, list): sorted copy
 *   gd.c.d(ViewHolder,int) @134    -> bindRow(binding, item): long-press + remember row
 *   gd.c.d(ViewHolder,int) @155    -> decorate(textView): draw the pin marker
 *
 * TWO DEVICES, TWO CAPABILITIES (deliberate, and decided with the issue reporter):
 *
 *   Android TV  - pin, unpin and full reordering: left/right one place, up/down one whole row,
 *                 move to top, and an Arrange mode that keeps the remote on one card until the
 *                 user is done. Arrange is offered FIRST, move to top second: those are the two
 *                 the reporter actually uses.
 *   Android phone - pin, unpin and flat moves: left, right and to the top, one place at a time.
 *                 No up/down (a phone shows one column per row most of the time, so up is left),
 *                 no Arrange mode, no swipe path. Arrange could not be made dependable on a
 *                 phone and was dropped on purpose; moving a card with two taps of Move works.
 *
 * The split is decided by HOW THE USER IS DRIVING THE APP, not by what the device claims to be.
 * A cheap TV box often does not declare the leanback feature, and a phone with a Bluetooth
 * remote sends key events. The key listener sets a latch and a touch resets it, so the menu
 * always matches the thing in the user's hand. `leanback || television uiMode` is used as a
 * tie-breaker for the first long press, before either input has been seen.
 *
 * HOW WIDE A ROW IS (this is what the up/down entries need):
 *
 *   It is MEASURED, not looked up. The obvious way - reflect on the RecyclerView's layout
 *   manager and read its span count - was shipped once and read nothing at all in the real APK,
 *   because those field names are obfuscated away. A silent fallback then made "Move up a row"
 *   move one card, and on a TV that is indistinguishable from "the arrows are broken".
 *
 *   So at long-press time we compare the card under the finger with the grid it sits in: a row
 *   is gridWidth / cardWidth, and the pinned list may not start on the first row of the grid. If
 *   the views are not laid out yet, the app's own rule answers instead (8 columns on a TV and in
 *   landscape, 4 in portrait). Both paths are real numbers: the count is never 1, and it is never
 *   a silent step. `describeInput` says which of the two produced the number, so a report of "it
 *   moved two rows" can be settled without guessing.
 */
public final class Pins {

    private static final String PREFS = "gin_playfy_pins";
    private static final String KEY_IDS = "category_ids";
    private static final String SEP = "\u0001";
    private static final String MARK = "\uD83D\uDCCC ";          // pin marker
    private static final String ARRANGE_MARK = "\u25C0\u25B6 ";  // "<>" while a card is being moved
    /**
     * The app this copy of the extension was built into.
     *
     * The extension source is shared by every TV app in the port, and nothing else in the file may
     * know any app's class or field names. Everything that differs between apps is here, in one
     * block, so a port is a five-line edit rather than a second copy of this file drifting from
     * the first.
     *
     *   model       the app's category item class, by binary name
     *   id          the item field holding a stable identity (Playfy: I, SK Tech: String name)
     *   title       the item field holding what the row shows
     *   adapterList the adapter field that holds the item list, for adapters with no submitList
     *
     * Playfy's adapter is a ListAdapter with submitList(List); its list field never needs to be
     * named. SK Tech's adapter is a plain RecyclerView.Adapter whose list sits in a public field
     * and is re-read on every notifyDataSetChanged, so the field name is required there.
     */
    // Playfy's submit is minified: ListAdapter.submitList is `i(List)` on Lw4/e0, which
    // delegates to the AsyncListDiffer in field A. findSubmit() only knows the PLATFORM
    // spelling, so without this the adapter was registered and then no branch of resubmit()
    // could reach it - every Move left/right on a phone was dropped silently.
    private static volatile App app =
        new App("kd.i", "a", "b", null, "a", "c", "i", null, true);

    /**
     * AsyncListDiffer viewport anchor config (opt-in via enablePlayfyDifferAnchor() or
     * enableCricfyDifferAnchor()). All names are verified against app bytecode at patch time.
     * Left null on every other app so their submit path stays untouched.
     */
    private static volatile String differField;
    private static volatile String differRawListField;
    private static volatile String differListField;
    private static volatile String differGenField;
    private static volatile String differSubmitName;
    private static volatile String lmPosField;
    private static volatile String lmOffField;
    private static volatile String lmStateField;
    private static volatile String lmSpanField;
    private static volatile String decorInsetsField;
    private static volatile String rvMarkDirtyMethod;
    private static volatile String lmMeasureCacheField;
    private static volatile boolean differCallbackHooked;

    public static void enablePlayfyDifferAnchor() {
        differField = "A";
        differRawListField = "e";
        differListField = "f";
        differGenField = null;
        differSubmitName = "b";
        lmPosField = "x";
        lmOffField = "y";
        lmStateField = "z";
        lmSpanField = null;
        decorInsetsField = null;
        rvMarkDirtyMethod = null;
        lmMeasureCacheField = null;
        differCallbackHooked = false;
    }

    public static void enableCricfyDifferAnchor() {
        differField = "d";
        differRawListField = "e";
        differListField = "f";
        differGenField = "g";
        differSubmitName = "b";
        lmPosField = "x";
        lmOffField = "y";
        lmStateField = "z";
        lmSpanField = "F";
        decorInsetsField = "b";
        rvMarkDirtyMethod = "Q";
        lmMeasureCacheField = "h";
        differCallbackHooked = true;
    }

    /**
     * Diagnostic trace, for issue #52 stage 3.
     *
     * The device logs that came back for stage 2 contained zero Pins lines: this class was silent,
     * so a reorder that failed to redraw looked exactly like a reorder that never ran. Every
     * decision resubmit() makes is now written to logcat under the tag "GinArenaPins", so one
     * capture answers "which branch did it take and why".
     *
     * Logging only. No behaviour depends on it, and a failure to log is swallowed.
     */
    private static void trace(String what) {
        try { Log.i("GinArenaPins", what); } catch (Throwable ignored) { }
    }

    private static final class App {
        final String model, id, title, adapterList, rowCard, rowTitle;
        /**
         * Name of the adapter's own `(List)` setter, when it has one that is not submitList.
         *
         * Some apps keep the list in a FINAL field and mutate it in place, so writing the field
         * from outside is not an option: on such an adapter the field is reassigned by the app
         * only, and reflection on a final field is either refused or silently ineffective. PlayZ's
         * setter is the only way to hand it a new order, so its name is recorded here.
         */
        final String setter;
        /**
         * Name of the holder field that HAS to be followed before rowCard/rowTitle apply.
         *
         * Null on every app where the holder object handed to the bind is the object that has the
         * card and the title on it. CRICFy's bind is handed the view holder and the card lives one
         * hop further in, inside the view-binding object the holder keeps in `u`, so the two row
         * names are resolved against `u` instead of against the holder. Without this the card
         * lookup silently finds nothing and the row gets no long press at all - it does not crash,
         * which is exactly the kind of failure worth naming here.
         */
        final String holderStep;
        /**
         * Is `adapterList` a field that must be READ and never written?
         *
         * PlayZ keeps its rows in a final ArrayList that the app mutates in place. Naming the field
         * is how resubmit() finds the list without a weak reference; writing that field would be
         * both impossible (final) and the wrong mechanism (the setter is the app's own path).
         */
        final boolean finalList;
        /**
         * Does the setter above redraw the list on its own?
         *
         * PlayZ's `g(List)` writes the field and stops, so a redraw has to be asked for. CRICFy's
         * `t(List)` hands the list to the AsyncListDiffer, which redraws by itself - calling
         * notifyDataSetChanged on top of that is at best redundant and at worst a second pass over
         * a list the diff has already started to animate. The two apps look identical from the
         * profile (a one-letter setter on a final list) and behave differently, so the difference
         * is recorded here rather than guessed.
         */
        final boolean setterRedraws;
        App(String model, String id, String title, String adapterList,
            String rowCard, String rowTitle) {
            this(model, id, title, adapterList, rowCard, rowTitle, null, null, false);
        }
        App(String model, String id, String title, String adapterList,
            String rowCard, String rowTitle, String setter, String holderStep, boolean setterRedraws,
            boolean finalList) {
            this.model = model; this.id = id; this.title = title;
            this.adapterList = adapterList; this.rowCard = rowCard; this.rowTitle = rowTitle;
            this.setter = setter; this.holderStep = holderStep;
            this.setterRedraws = setterRedraws; this.finalList = finalList;
        }
        App(String model, String id, String title, String adapterList,
            String rowCard, String rowTitle, String setter) {
            this(model, id, title, adapterList, rowCard, rowTitle, setter, null, false);
        }
        App(String model, String id, String title, String adapterList,
            String rowCard, String rowTitle, String setter, String holderStep) {
            this(model, id, title, adapterList, rowCard, rowTitle, setter, holderStep, false);
        }
        App(String model, String id, String title, String adapterList,
            String rowCard, String rowTitle, String setter, String holderStep, boolean setterRedraws) {
            this(model, id, title, adapterList, rowCard, rowTitle, setter, holderStep,
                setterRedraws, false);
        }
    }

    /**
     * Point this copy of the extension at an app's model and adapter.
     *
     * Row field names default to Playfy's binding shape (a = card, c = title). Apps whose holder
     * uses other letters pass them with the six-argument overload.
     */
    public static void configure(String model, String idField, String titleField, String adapterListField) {
        // The four-argument form describes a ListAdapter, which has no list field to name. Storing
        // a name here would make resubmit() try to write a field the adapter does not have.
        configure(model, idField, titleField, null, "a", "c");
    }

    /**
     * The form a patched app calls, with no arguments and therefore no registers.
     *
     * A patch that builds six string constants to call configure() needs six registers it does not
     * have: on SK Tech the application's onCreate runs in two registers total, so the constants
     * overwrote `this` before the rest of onCreate used it. Rather than teach every port to widen
     * a register frame it does not own, the per-app names live in the extension as constants and
     * the patch says which set to use with one integer.
     */
    public static void useProfile(int which) {
        phoneColumns = PHONE_COLUMNS;
        tvColumns = TV_COLUMNS;
        if (which == PROFILE_SKTECH) {
            app = new App("mc.b", "a", "a", "f", "u", "v");
        } else if (which == PROFILE_PLAYZ) {
            // qc.b: `a` is the JSON "name" with the "psp_" prefix stripped, `b` is the logo URL.
            //
            // The category adapter keeps its list in field `e` - a final ArrayList that it mutates
            // in place - and `g(List)` copies into it rather than adopting its argument. So:
            //   - `e` is named here as the adapterList, READ-ONLY: it is where the rows come from,
            //     and reading it is what stops the reorder depending on a remembered list that the
            //     GC can collect out from under a long-lived activity. That was issue #52 stage 6:
            //     "sometimes works sometimes not", 8 of 15 resubmits bailing out with no list.
            //   - `finalList` says the field must never be WRITTEN. `e` is final and the app mutates
            //     it in place; resubmit() goes through `g(List)`, which is the app's own path.
            app = new App("qc.b", "a", "a", "e", "u", "v", "g", null, false, true);
        } else if (which == PROFILE_CRICZ) {
            // pc.b has one string that is both the label and the only stable value: a.
            app = new App("pc.b", "a", "a", "g", "u", "v");
        } else if (which == PROFILE_CRICFY) {
            // gt: int a is the JSON catId, String b the label, c the logo url.
            //
            // Three things are unlike the other four apps and each one is named here rather than
            // guessed at runtime:
            //   - the bind is handed the VIEW HOLDER (ht) and the card is on the binding inside
            //     it, field u, not on the holder itself  -> holderStep
            //   - the adapter is the one base shared by every list in the app (go1), and it keeps
            //     its items inside the AsyncListDiffer in d, whose list field f is what c()/s()
            //     read. e is the differ's OWN last list and is not the one on screen, so it must
            //     not be named here.
            //   - submitList is spelled `t(List)` on the adapter (Lgo1), NOT `i`. The app has an
            //     `i(List)` too, on Ln14, but that one writes a JSON snapshot into SharedPreferences
            //     - a reflection walk that picks the first `i` it can reach finds a method that is
            //     not a submit at all. `t` hands the list to the differ, which redraws by itself.
            //   - there is no notifyDataSetChanged.
            app = new App("gt", "a", "b", null, "a", "c", "t", "u", true);
            phoneColumns = 2;
            tvColumns = 4;
        } else if (which == PROFILE_CREXIFY) {
            // xr: a is the category name (the app strips a "psp_" prefix), b the logo; the row
            // draws a on a TextView, and the card is sr.u.
            //
            // The adapter base qk keeps its items in a FINAL ArrayList and hands them out through
            // g(List), which copies in and resets the spinner index: the PlayZ shape again, so the
            // setter is named and no list field is. That is not only about the final field. Naming
            // the setter is also what keeps notifyRedraw's field walk out of this adapter, and on
            // this one the walk would be actively wrong: qk's first object field is an Lcb whose
            // b() recomputes retry state from an IOException rather than redrawing anything.
            // The list field is named READ-ONLY (finalList=true): `qk.d` is where getItemCount
            // and the bind read the rows from, so naming it fixes the "no list registered" dropout
            // that PlayZ suffered in stage 6. It is never written - `g(List)` is the app's own path.
            app = new App("xr", "a", "a", "d", "u", "v", "g", null, false, true);
        }
        // Any other value keeps the Playfy profile, which is the default. That is deliberate:
        // an unknown profile in a patched app behaves exactly like an unpatched one, never like a
        // half-configured one.
    }

    /** Profile ids. One per ported app; the patch passes the number, never a string. */
    private static final int PROFILE_SKTECH = 1;
    private static final int PROFILE_PLAYZ = 2;
    private static final int PROFILE_CRICZ = 3;
    private static final int PROFILE_CRICFY = 4;
    private static final int PROFILE_CREXIFY = 5;

    /**
     * Full form: also names the row holder's card and title fields.
     *
     * Called once, from the app's onCreate hook, next to init(). Every name here was read off
     * that app's disassembly; none is a guess, and a wrong one degrades to "no long press on this
     * row" rather than to a crash or a menu for the wrong category.
     */
    public static void configure(String model, String idField, String titleField,
                                 String adapterListField, String rowCardField, String rowTitleField) {
        if (model == null || model.length() == 0) return;
        app = new App(model,
                blank(idField) ? "a" : idField,
                blank(titleField) ? "b" : titleField,
                blank(adapterListField) ? null : adapterListField,
                blank(rowCardField) ? "a" : rowCardField,
                blank(rowTitleField) ? "c" : rowTitleField);
    }

    private static boolean blank(String s) { return s == null || s.length() == 0; }

    private static String modelName() { return app.model; }
    private static String idFieldName() { return app.id; }
    private static String titleFieldName() { return app.title; }
    private static String rowCardFieldName() { return app.rowCard; }
    private static String rowTitleFieldName() { return app.rowTitle; }
    /**
     * Sanity bound for the saved list. Not a feature limit: it is only there so a corrupt pref
     * file cannot make the app build a huge set. It has to be far above any real pin count,
     * because save() does NOT refuse to write more - a smaller cap here would silently drop a
     * user's whole pinned list on the next launch (which is exactly what a 256 limit did).
     */
    private static final int MAX_IDS = 4096;
    /**
     * The grid width the app itself uses, from nd.e.B(View,Bundle): 8 on a television or in
     * landscape, 4 in phone portrait. Only consulted when the views cannot be measured; the
     * answer is then labelled as approximate in the menu rather than passed off as measured.
     */
    private static final int TV_COLUMNS = 8;
    private static final int PHONE_COLUMNS = 4;
    private static volatile int phoneColumns = PHONE_COLUMNS;
    private static volatile int tvColumns = TV_COLUMNS;

    /**
     * ids of the pinned categories, in the order they were pinned.
     * Insertion-ordered on purpose: the user picks a sequence, and Stage 5 asks the app to show
     * the pinned categories "in the order you pinned them".
     */
    private static volatile Set<String> pinned = new LinkedHashSet<String>();
    /** per-row runtime info, keyed by the row's title TextView (weak: rows get recycled) */
    private static final WeakHashMap<View, Row> rows = new WeakHashMap<View, Row>();
    /** guards {@link #rows}; the map is read on bind and iterated on toggle */
    private static final Object ROW_LOCK = new Object();
    /**
     * Id of the category currently being arranged, or null. While this is set, the card's own key
     * listener consumes LEFT/RIGHT (TV remote) and its touch listener recognises a horizontal swipe
     * (phone). Both feed the same move() so there is one behaviour, not two.
     */
    private static volatile String arrangingId;
    /** the card being arranged, so focus can be put back on it after every reorder */
    private static volatile View arrangingView;
    /** did anything actually move during this arrange session? decides whether finishing speaks */
    private static volatile boolean arrangeMoved;
    /** generation counter for pending post-layout focus restoration on non-DiffUtil adapters */
    private static volatile int pendingFocusGen;
    /** RecyclerView whose descendantFocusability is held during notifyDataSetChanged */
    private static volatile WeakReference<ViewGroup> savedFocusRv = new WeakReference<ViewGroup>(null);
    private static volatile int savedFocusDescendant;
    private static volatile boolean savedFocusFocusable;
    /** last toast text, so a held-left edge press does not queue the same message six times */
    private static volatile String lastSay;
    /**
     * Which input drove the app most recently. Null until the first key or touch is seen, which is
     * the only moment the device hints below are needed.
     */
    private static volatile Boolean lastInputWasKey;
    /** Set for the duration of one long press, so we know the finger actually produced it. */
    private static volatile boolean armTouchLongPress;
    /** the adapter + the app's own list, so a toggle can re-submit */
    /** on-screen Y of each card by id, recorded before a reorder so one anchor can be found after */
    private static volatile WeakReference<Object> lastAdapter = new WeakReference<Object>(null);
    private static volatile WeakReference<List> lastList = new WeakReference<List>(null);

    /**
     * What each adapter's list looks like with NOTHING pinned, keyed by the adapter itself.
     *
     * Issue #52 stage 5. The sort was "stable within two groups, original relative order kept",
     * and the original order was taken to be the order the list arrived in. That is wrong the
     * moment the list the app hands back is one WE already sorted:
     *
     *   - unpin a category that was pinned first  -> it keeps the front seat, because the group
     *     it rejoins is still in our sorted order, so "last pinned position" is where it lands.
     *   - reopen the screen                       -> the pinned rows fall back to wherever the
     *     decrypted list happens to put them, because there is no app-side original to go back to.
     *
     * With a baseline captured from the app BEFORE any sorting, both become the same simple
     * statement: pinned first in pin order, then the rest in the order the APP put them.
     *
     * Keyed by adapter identity, in a WeakHashMap, so a destroyed category screen takes its
     * baseline with it and a new adapter never inherits another screen's order.
     */
    private static final Map<Object, IdentityHashMap<Object, Integer>> BASE_ORDER =
        java.util.Collections.synchronizedMap(new WeakHashMap<Object, IdentityHashMap<Object, Integer>>());

    /** How many rows the app's own order has been recorded for; 0 means "never seen". */
    private static int baseSize(Object adapter) {
        try {
            IdentityHashMap<Object, Integer> base = adapter == null ? null : BASE_ORDER.get(adapter);
            return base == null ? 0 : base.size();
        } catch (Throwable ignored) { }
        return 0;
    }

    /** Where an item sits in the app's unsorted order for that adapter; -1 when unknown. */
    private static int baseRank(Object adapter, Object item) {
        if (adapter == null || item == null) return -1;
        IdentityHashMap<Object, Integer> base = BASE_ORDER.get(adapter);
        if (base == null) return -1;
        Integer r = base.get(item);
        return r == null ? -1 : r.intValue();
    }

    /**
     * Record the app's own order for this adapter, once per list it produces.
     *
     * Called from onSubmit, BEFORE sorting. A list that arrives with an object already known is
     * our own output coming back (an adapter setter that copies and re-enters, or a second pass),
     * and re-recording it would overwrite the real order with a sorted one - the exact bug this
     * baseline exists to fix. Those lists are ignored.
     */
    private static void rememberBaseOrder(Object adapter, List list) {
        try {
            if (adapter == null || list == null) return;
            IdentityHashMap<Object, Integer> base = BASE_ORDER.get(adapter);
            if (base == null) {
                base = new IdentityHashMap<Object, Integer>();
                BASE_ORDER.put(adapter, base);
            }
            boolean recapture = base.isEmpty();
            if (!recapture) {
                for (int i = 0; i < list.size(); i++) {
                    Object item = list.get(i);
                    if (item != null && base.containsKey(item)) return;   // our own output; keep the old order
                }
            }
            base.clear();
            for (int i = 0; i < list.size(); i++) {
                Object item = list.get(i);
                if (item != null && !base.containsKey(item)) {
                    base.put(item, Integer.valueOf(i));
                }
            }
        } catch (Throwable ignored) { }
    }
    private static volatile SharedPreferences prefs;

    private Pins() {}

    /** One bound row: which category it shows. */
    private static final class Row {
        final String id;
        final String title;
        /**
         * What the app itself drew on this row, before any marker went on it.
         *
         * In every app so far this is the same string as `title`, because those rows show the title
         * field and nothing else. It is recorded anyway so that decorate() puts the marker on top of
         * the app's own label instead of rewriting the row from the identity field: an app whose row
         * shows a composed label (PlayZ's other adapter mode draws "category | event") would lose
         * half of that label the moment a category was pinned. Guarding against the shape that does
         * not exist yet is cheaper than finding it from a bug report.
         */
        volatile String drawn;
        /** the focusable card the D-pad lands on; focus must go here, not to the title view */
        final View root;
        Row(String id, String title, View root) { this.id = id; this.title = title; this.root = root; }
    }

    // ---------------------------------------------------------------- lifecycle

    /** Hook 1: App.onCreate(). Loads the saved ids once, before any list is drawn. */
    public static void init(Context context) {
        try {
            if (context == null) return;
            if (prefs != null) return;
            prefs = context.getApplicationContext() != null
                    ? context.getApplicationContext().getSharedPreferences(PREFS, 0)
                    : context.getSharedPreferences(PREFS, 0);
            load();
        } catch (Throwable ignored) { }
    }

    private static synchronized void load() {
        try {
            Set<String> fresh = new LinkedHashSet<String>();   // survives -> saved -> loaded in pin order
            if (prefs == null) return;
            String s = prefs.getString(KEY_IDS, "");
            if (s != null && s.length() > 0) {
                String[] parts = s.split(SEP);
                if (parts.length > MAX_IDS) return;      // not something we wrote: leave the set empty
                for (int i = 0; i < parts.length; i++) {
                    String id = parts[i] == null ? null : parts[i].trim();
                    // "null"/"" are never real category ids: they are what an unresolved
                    // reflection lookup used to produce. Drop them instead of honouring them.
                    if (id != null && id.length() > 0 && !"null".equals(id)) fresh.add(id);
                }
            }
            pinned = fresh;                    // publish a fully built set, never a half-filled one
            // Older builds could store "null" or an empty id. Drop them from the file too, so
            // what we read next time is what we wrote this time.
            if (s != null) {
                StringBuilder clean = new StringBuilder();
                for (String id : fresh) {
                    if (id == null) continue;
                    if (clean.length() > 0) clean.append(SEP);
                    clean.append(id);
                }
                if (!clean.toString().equals(s)) save();
            }
        } catch (Throwable ignored) { }
    }

    private static synchronized void save() {
        try {
            if (prefs == null) return;
            StringBuilder sb = new StringBuilder();
            for (String id : pinned) {              // snapshot: this copy cannot change mid-loop
                if (sb.length() > 0) sb.append(SEP);
                sb.append(id);
            }
            prefs.edit().putString(KEY_IDS, sb.toString()).apply();
        } catch (Throwable ignored) { }
    }

    // ------------------------------------------------------------------- sort

    /**
     * Hook 2: nd.e.S(List) immediately before submitList.
     *
     * Returns the app's list unchanged unless it is a list of category items - that is what keeps
     * this safe, because S() is shared by the whole app. Pinned categories first, everything else
     * in the order the app produced (the sort is stable).
     */
    public static List onSubmit(Object adapter, List list) {
        try {
            if (list == null || list.isEmpty()) return list;
            if (!modelName().equals(list.get(0).getClass().getName())) return list;

            lastAdapter = new WeakReference<Object>(adapter);
            lastList = new WeakReference<List>(list);

            // A different category screen (or a filter) that does not contain the card being
            // arranged means the user has moved on: drop the mode instead of leaving it armed
            // and invisible behind the next list.
            String ar = arrangingId;
            if (ar != null && !listContains(ar, list)) endArrange(null, false);

            // The app's own order, recorded before we touch the list. Everything unpinned is
            // ordered by this, so it does not matter whether this list is the app's or ours.
            rememberBaseOrder(adapter, list);

            // A category renamed by the provider keeps its pin. This runs before the count is
            // reported, so a run of the log after this build never shows a ghost that a fold could
            // have healed - see foldRenamedPins() for why it is safe to do here and nowhere else.
            foldRenamedPins(list);

            if (current().isEmpty()) {
                trace("onSubmit: nothing pinned -> stock order, " + list.size() + " items");
                return list;                                // nothing pinned -> stock order
            }

            List sorted = sortedCopy(list, adapter);
            if (sorted == null) {
                trace("onSubmit: sortedCopy failed -> stock order kept");
                return list;
            }
            int unmatched = unmatchedPins(list);
            trace("onSubmit: " + list.size() + " items, pinned=" + current().size()
                    + (unmatched == 0 ? "" : " [of which " + unmatched + " match NO row]")
                    + ", sorted=" + (sorted != list) + ", first=" + titleOf(sorted.isEmpty() ? null : sorted.get(0)));
            return sorted;
        } catch (Throwable t) {
            return list;
        }
    }

    /**
     * Hook 0c: sort a freshly built adapter before its first row is drawn.
     *
     * Issue #52 stage 5, CricZ. On a cold open the rows appear in the app's order and only move
     * after a refresh. The app builds the adapter with the decrypted list already inside it, draws
     * from that, and does not route the first pass through the list write this patch hooks - so
     * nothing sorted it before the first bind. Priming at the end of the adapter's constructor puts
     * the pinned order in place before the RecyclerView asks for a single row.
     *
     * Non-destructive: the sorted order is written to the adapter's own field, and the list the app
     * passed in is left alone. Apps whose list field is final are not primed at all (the profile
     * names no field for them) - PlayZ already re-submits on entering the screen, which is why it
     * does not show this.
     */
    public static void primeAdapter(Object adapter) {
        try {
            if (adapter == null) return;
            if (app.finalList) { trace("prime: adapter is reordered through its own setter, not primed"); return; }
            List list = adapterList(adapter);
            if (list == null || list.isEmpty()) { trace("prime: adapter exposes no list"); return; }
            rememberBaseOrder(adapter, list);
            if (current().isEmpty()) { trace("prime: nothing pinned, " + list.size() + " items"); return; }
            List sorted = sortedCopy(list, adapter);
            if (sorted == null || sorted == list) {
                trace("prime: already in order, " + list.size() + " items, base=" + baseSize(adapter));
                return;
            }
            boolean wrote = writeListField(adapter, app.adapterList, sorted);
            trace("prime: sorted before first draw, " + list.size() + " items, wrote=" + wrote
                    + ", base=" + baseSize(adapter) + ", first=" + titleOf(sorted.get(0)));
        } catch (Throwable t) {
            trace("prime threw: " + t);
        }
    }

    /**
     * Hook 2d: the same sort, for a call site whose register is typed ArrayList.
     *
     * Issue #52 stage 7, SK Tech. The hook is injected immediately before
     * `iput-object vN, p1, Lgc/c;->f` where field `f` is declared `Ljava/util/ArrayList;`. The
     * generic onSubmitList returns `Ljava/util/List;`, so `move-result-object` leaves a value the
     * verifier types as List, and the very next instruction stores it into an ArrayList field.
     * ART rejected the whole method at class load:
     *
     *   [0x87] register v2 has type Reference: java.util.List
     *          but expected Reference: java.util.ArrayList
     *
     * Returning the app's own concrete type fixes it at the source. The sort still returns the
     * caller's list unchanged whenever nothing moves, and sortedCopy always builds an ArrayList,
     * so the cast can never fail at a call site this patch generates.
     */
    public static ArrayList onSubmitListTyped(List list) {
        return (ArrayList) onSubmitList(list);
    }

    /**
     * The same, with the adapter in hand, for a hook that runs INSIDE the adapter's own setter.
     *
     * CrexiFy's qk.g(List) is called from 9 places including its own constructor, and the two call
     * sites that used to be hooked are not on the path a phone takes into Categories - so nothing
     * registered the adapter and nothing sorted the list. Hooking the setter covers every caller.
     */
    public static ArrayList onSubmitListTyped(Object adapter, List list) {
        return (ArrayList) onSubmit(adapter, list);
    }

    /**
     * Hook 2b: the same sort, at a call site that only has the list in hand.
     *
     * SK Tech's Categories fragment builds the list and writes it into the adapter's field after
     * the adapter already exists, so the call site has the list and nothing else. The adapter was
     * registered once by seeAdapter() at its constructor, which is the moment it becomes the
     * object the app will draw from. If nothing has been registered this is a passthrough.
     */
    public static List onSubmitList(List list) {
        return onSubmit(lastAdapter.get(), list);
    }

    /**
     * Hook 2c: the same sort, at the adapter's own setter, where BOTH the adapter and the list
     * are in hand.
     *
     * This is stronger than onSubmitList(List) and is preferred whenever the app funnels every
     * submit through one method. PlayZ does: `ic.b.g(List)` is called by the category adapter's
     * constructor, by the search filter, and by a second adapter subclass that lives in the same
     * class. Naming the adapter here means the pin state is re-submitted to exactly the object
     * the user is looking at, instead of to whatever was registered last.
     */
    public static List onSubmitList(Object adapter, List list) {
        return onSubmit(adapter, list);
    }

    /**
     * Hook 0b: remember the adapter as it is constructed.
     *
     * Called from the adapter's own constructor, where `this` is the adapter, so it costs no
     * registers and cannot point at the wrong object. Playfy does not need this: its adapter is
     * passed along with the list by submitList.
     */
    public static void seeAdapter(Object adapter) {
        try {
            if (adapter == null) return;
            lastAdapter = new WeakReference<Object>(adapter);
        } catch (Throwable ignored) { }
    }

    /** Does this list still show that category? */
    /**
     * The pinned ids that a row could actually act on, in pin order.
     *
     * Issue #52 stage 11, SK Tech. Reported as "moving right don't happen, but next happens" - the
     * move that failed looked random because it was not random at all. The only orphan in the log
     * was 'ZEE FIVE', which had been pinned under that name and whose row is now 'ZEE5_WW': the
     * provider renamed the category, and SK Tech's row model has no id field, so the label IS the
     * identity.
     *
     * An orphan keeps its slot in `pinned` but no row draws it, so any swap with a real pin moves a
     * card on paper and nothing on screen. The user presses right, nothing happens, presses right
     * again, and that time the neighbour is real, so it moves. Every intermittent failure in this
     * ticket has the same shape: one bad entry sitting in the middle of the order.
     *
     * So the moves reason about the pins the user can see, and leave orphans exactly where they are.
     * A pin whose row is gone is not something the user asked to move.
     */
    private static List<String> livePins(List list) {
        List<String> live = new ArrayList<String>();
        try {
            for (String id : current()) {
                if (list == null || listContains(id, list)) live.add(id);
            }
        } catch (Throwable ignored) { }
        return live;
    }

    /**
     * The rows currently drawn, read off the remembered adapter, or null when there is none.
     *
     * A move runs from a dialog click, which has no list in hand. Reading the adapter's own field is
     * the only live answer: lastList is a WeakReference and goes stale, which is the same trap that
     * broke the resubmit path in stage 3.
     */
    private static List liveList() {
        try {
            Object adapter = lastAdapter.get();
            if (adapter == null) return null;
            return adapterList(adapter);
        } catch (Throwable ignored) { }
        return null;
    }

    /**
     * Which ids count as the same category even though the label changed.
     *
     * SK Tech is the one app here whose row model has no id: `mc/b.a` is the display name, and the
     * profile names it as both id and title. A provider rename therefore orphans the pin - the
     * reporter's ghost is 'ZEE FIVE' while the row now reads 'ZEE5_WW'.
     *
     * Two names count as one category only when they normalize to the same string (case, spaces and
     * separators ignored) AND the old name has no row of its own. The second half is required: two
     * genuinely different categories whose labels happen to normalize alike must never be merged.
     */
    private static String foldKey(String name) {
        if (name == null) return "";
        // Separators become a space instead of vanishing, so "STAR PLUS" and "STARPLUS" still meet
        // while "STAR PLUS" and "STAR PLUS HD" do not.
        StringBuilder words = new StringBuilder(name.length());
        for (int i = 0; i < name.length(); i++) {
            char c = Character.toLowerCase(name.charAt(i));
            if (c >= 'a' && c <= 'z') words.append(c);
            else if (c >= '0' && c <= '9') words.append(c);
            else words.append(' ');   // separator becomes a boundary, not a character
        }

        // Word forms of digits are dropped, not rewritten: providers rename "ZEE FIVE" to "ZEE5_WW"
        // and a number is the part that changes. Rewriting "five" to "5" alone would be worse - it
        // would make "ZEE FIVE" and "ZEE5_WW" differ on the "ww" anyway, so this has to be the rule
        // that ignores the changed part, not one that guesses what it became.
        StringBuilder key = new StringBuilder(words.length());
        int i = 0;
        while (i < words.length()) {
            int end = i;
            while (end < words.length() && words.charAt(end) != ' ') end++;
            String word = words.substring(i, end);
            if (word.length() > 0 && !isNumberWord(word)) key.append(word);   // concatenated: a
            // separator is not part of an identity, so "STAR PLUS" and "STARPLUS" must agree
            i = end + 1;
        }
        return key.toString();
    }

    /** The words a provider swaps for a digit, and back, when it renames a channel. */
    private static boolean isNumberWord(String w) {
        return "zero".equals(w) || "one".equals(w) || "two".equals(w) || "three".equals(w)
                || "four".equals(w) || "five".equals(w) || "six".equals(w) || "seven".equals(w)
                || "eight".equals(w) || "nine".equals(w) || "ten".equals(w);
    }

    /**
     * Re-point saved pins whose category was renamed, and say so.
     *
     * Only runs for profiles whose identity is their label: an app with a real id field cannot be
     * affected, because a rename does not touch the id. Rewrites the saved set only when a fold is
     * unambiguous - exactly one old pin and exactly one unmatched row sharing a key. Anything
     * ambiguous is left alone and reported, never guessed at.
     */
    private static void foldRenamedPins(List list) {
        try {
            if (list == null || list.isEmpty() || !idFieldName().equals(titleFieldName())) return;
            Set<String> pins = current();
            if (pins.isEmpty()) return;

            // Rows the app currently shows that nothing is pinned to.
            List<String> unmatchedRows = new ArrayList<String>();
            for (int i = 0; i < list.size(); i++) {
                String rowId = idOf(list.get(i));
                if (rowId != null && !pins.contains(rowId)) unmatchedRows.add(rowId);
            }

            // Orphans, and only the ones whose name no row carries any more.
            List<String> orphans = new ArrayList<String>();
            for (String id : pins) {
                if (!listContains(id, list)) orphans.add(id);
            }
            if (orphans.isEmpty() || unmatchedRows.isEmpty()) return;

            Map<String, List<String>> orphanByKey = new HashMap<String, List<String>>();
            for (String o : orphans) {
                String k = foldKey(o);
                if (k.length() == 0) continue;
                List<String> bucket = orphanByKey.get(k);
                if (bucket == null) { bucket = new ArrayList<String>(); orphanByKey.put(k, bucket); }
                bucket.add(o);
            }
            Map<String, List<String>> rowByKey = new HashMap<String, List<String>>();
            for (String r : unmatchedRows) {
                String k = foldKey(r);
                if (k.length() == 0) continue;
                List<String> bucket = rowByKey.get(k);
                if (bucket == null) { bucket = new ArrayList<String>(); rowByKey.put(k, bucket); }
                bucket.add(r);
            }

            List<String> order = new ArrayList<String>(pins);
            boolean changed = false;
            for (Map.Entry<String, List<String>> e : orphanByKey.entrySet()) {
                List<String> olds = e.getValue();
                List<String> news = rowByKey.get(e.getKey());
                if (olds == null || news == null) continue;
                if (olds.size() != 1 || news.size() != 1) {
                    trace("fold: ambiguous rename for key '" + e.getKey() + "', left alone");
                    continue;
                }
                int at = order.indexOf(olds.get(0));
                if (at < 0) continue;
                order.set(at, news.get(0));                    // same slot, same pin order
                changed = true;
                trace("fold: pin '" + olds.get(0) + "' -> '" + news.get(0) + "' (category renamed)");
            }
            if (changed) {
                pinned = new LinkedHashSet<String>(order);
                save();
            }
        } catch (Throwable ignored) { }
    }

    /**
     * How many pinned ids match no row in this list.
     *
     * Issue #52 stage 9, SK Tech. The reporter pinned what looked like six categories while the app
     * reported seven, and one of the pins could never be removed. Two things make that possible:
     *
     *   - mc/b, SK Tech's row model, has NO id field. `a` is the display name, which is what the
     *     profile names as both id and title, so identity here is the label and a rename by the
     *     provider silently orphans the pin.
     *   - until this stage, bindRow()'s null-root branch left the previous category's listener on a
     *     recycled card, so a long press could pin an id that was no longer on screen.
     *
     * Either way the pin is kept, occupies a slot in the count, and cannot be unpinned, because
     * unpinning needs a row to press and a ghost has no row. Counting them is what turns "the
     * number is one too high" into a line of log that says exactly which ids are dead.
     */
    private static int unmatchedPins(List list) {
        try {
            int miss = 0;
            for (String id : current()) {
                if (!listContains(id, list)) {
                    miss++;
                    trace("  orphan pin: '" + id + "' is pinned but no row carries it");
                }
            }
            return miss;
        } catch (Throwable ignored) { }
        return 0;
    }

    private static boolean listContains(String id, List list) {
        try {
            for (int i = 0; i < list.size(); i++) {
                Object raw = field(list.get(i), idFieldName());
                if (raw != null && id.equals(String.valueOf(raw))) return true;
            }
        } catch (Throwable ignored) { }
        return false;
    }

    /**
     * Stable sort: pinned first, original relative order preserved inside both groups.
     *
     * The ranks are worked out ONCE per list and cached by object identity, because this runs
     * before every submitList - every search keystroke, every refresh. The obvious version asked
     * for an item's rank inside the comparator, which meant two reflective field reads and a scan
     * of the whole pinned set per comparison: on a 9,000-category list with 300 pins that took
     * 75 ms on a desktop JVM, which is a visible stall on a TV. One pass over the list instead:
     * n reflective reads, no per-comparison work beyond a map hit.
     *
     * If the sort does not actually move anything, the CALLER'S list is returned, not a copy.
     * ListAdapter compares by identity before diffing, so a fresh instance forces a full DiffUtil
     * pass over data that has not changed.
     */
    private static List sortedCopy(List list) {
        return sortedCopy(list, null);
    }

    /**
     * The sort, with the app's own order as the tie-breaker for unpinned rows.
     *
     * Pinned rows first, in pin order. Unpinned rows follow in the order the APP produced, which is
     * read from the per-adapter baseline rather than from the list being sorted - the list being
     * sorted is often one we already sorted, and "the order it arrived in" then means "our last
     * answer", which is how an unpinned row ended up parked at the end of the pinned group.
     */
    private static List sortedCopy(final List list, final Object adapter) {
        try {
            final IdentityHashMap<Object, Integer> ranks = pinRanks(list);
            final boolean anyPinned = !ranks.isEmpty() && hasPinnedRank(ranks);
            if (!anyPinned && BASE_ORDER.get(adapter) == null) return list;   // nothing to do at all
            ArrayList<Object> copy = new ArrayList<Object>(list);
            Collections.sort(copy, new Comparator<Object>() {
                public int compare(Object a, Object b) {
                    int ra = rankOf(ranks, a);               // 0,1,2... = pin order; -1 = not pinned
                    int rb = rankOf(ranks, b);
                    if (ra != rb) {
                        if (ra < 0) return 1;                 // only b is pinned -> b first
                        if (rb < 0) return -1;                // only a is pinned -> a first
                        return ra < rb ? -1 : 1;              // both pinned -> whoever was pinned first
                    }
                    if (ra >= 0) return 0;                    // both pinned with equal rank: stable
                    // Both unpinned: the app's own order decides, not the order they arrive in.
                    int ba = baseRank(adapter, a);
                    int bb = baseRank(adapter, b);
                    if (ba == bb) return 0;                   // one (or both) unknown: keep as-is
                    if (ba < 0) return 1;
                    if (bb < 0) return -1;
                    return ba < bb ? -1 : 1;
                }
            });
            for (int i = 0; i < copy.size(); i++) {
                if (copy.get(i) != list.get(i)) return copy;  // something moved: hand back the new order
            }
            return list;                                      // nothing moved: hand back what we were given
        } catch (Throwable t) {
            return null;
        }
    }

    /** Rank per item, worked out in one pass. Identity-keyed so a repeated category is handled. */
    private static IdentityHashMap<Object, Integer> pinRanks(List list) {
        IdentityHashMap<Object, Integer> out = new IdentityHashMap<Object, Integer>();
        Set<String> pin = current();
        HashMap<String, Integer> rankOfId = new HashMap<String, Integer>(Math.max(16, pin.size() * 2));
        int r = 0;
        for (String p : pin) {
            if (p != null && !rankOfId.containsKey(p)) rankOfId.put(p, Integer.valueOf(r));
            r++;
        }
        if (rankOfId.isEmpty()) return out;                    // nothing pinned: every rank is -1
        for (int i = 0; i < list.size(); i++) {
            Object item = list.get(i);
            if (item == null || out.containsKey(item)) continue;
            String id = idOf(item);
            Integer rank = id == null ? null : rankOfId.get(id);
            out.put(item, rank == null ? Integer.valueOf(-1) : rank);
        }
        return out;
    }

    /** Is anything in this rank table actually pinned (rank >= 0)? */
    private static boolean hasPinnedRank(IdentityHashMap<Object, Integer> ranks) {
        for (Integer r : ranks.values()) {
            if (r != null && r.intValue() >= 0) return true;
        }
        return false;
    }

    private static int rankOf(IdentityHashMap<Object, Integer> ranks, Object item) {
        if (item == null) return -1;
        Integer r = ranks.get(item);
        return r == null ? -1 : r.intValue();
    }

    /**
     * The id of a category item, or null when it has none. The reflective Field is cached per
     * class: setAccessible() and the superclass walk are far too expensive to repeat per item on
     * every keystroke.
     */
    private static String idOf(Object item) {
        if (item == null) return null;
        try {
            Field f = idField(item.getClass());
            if (f == null) return null;
            Object raw = f.get(item);
            if (raw == null) return null;
            String id = String.valueOf(raw);
            if (id.length() == 0 || "null".equals(id)) return null;
            return id;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The row title of an item, for trace lines only. Never used for logic. */
    private static String titleOf(Object item) {
        try {
            Object raw = field(item, app.title);
            return raw == null ? "null" : String.valueOf(raw);
        } catch (Throwable ignored) { }
        return "?";
    }

    /** cached "a" field per class; a null value means "this class has no such field" */
    private static final HashMap<Class<?>, Field> ID_FIELDS = new HashMap<Class<?>, Field>();
    private static final Object ID_LOCK = new Object();

    private static Field idField(Class<?> c) {
        synchronized (ID_LOCK) {
            if (ID_FIELDS.containsKey(c)) return ID_FIELDS.get(c);
        }
        Field found = null;
        Class<?> k = c;
        while (k != null) {
            try {
                Field f = k.getDeclaredField(idFieldName());
                f.setAccessible(true);
                found = f;
                break;
            } catch (NoSuchFieldException e) {
                k = k.getSuperclass();
            } catch (Throwable t) {
                break;
            }
        }
        synchronized (ID_LOCK) { ID_FIELDS.put(c, found); }
        return found;
    }

    private static boolean isPinned(Object item) {
        try {
            Object raw = field(item, idFieldName());
            if (raw == null) return false;
            String id = String.valueOf(raw);
            if (id.length() == 0 || "null".equals(id)) return false;
            return current().contains(id);
        } catch (Throwable t) {
            return false;
        }
    }

    /** The live pin set. `pinned` is volatile and only ever replaced by a finished set. */
    private static Set<String> current() { return pinned; }

    /** Position of an item in the pin order, or -1 when it is not pinned. */
    private static int pinRank(Object item) {
        try {
            Object raw = field(item, idFieldName());
            if (raw == null) return -1;
            String id = String.valueOf(raw);
            if (id.length() == 0 || "null".equals(id)) return -1;
            int rank = 0;
            for (String p : current()) {           // LinkedHashSet: iteration order == pin order
                if (id.equals(p)) return rank;
                rank++;
            }
        } catch (Throwable ignored) { }
        return -1;
    }

    // -------------------------------------------------------------- the row

    /**
     * Hook 3: gd.c.d(...) right after the holder's binding is read, where BOTH the CatItemBinding
     * and the category item are in hand.
     */
    public static void bindRow(Object binding, Object item) {
        try {
            if (binding == null || item == null) return;
            Object idField = field(item, idFieldName());
            Object titleField = field(item, titleFieldName());
            if (idField == null || titleField == null) return;   // unknown model shape -> leave the row alone
            String id = String.valueOf(idField);
            String title = String.valueOf(titleField);
            if (id.length() == 0 || "null".equals(id)) return;    // never key a pin on a non-id

            // The object that actually carries the card and the title. On four apps that is the
            // binding handed to the bind; on CRICFy it is the view-binding one hop inside it.
            Object holder = binding;
            if (app.holderStep != null && app.holderStep.length() > 0) {
                holder = field(binding, app.holderStep);
                if (holder == null) return;      // row not built yet -> nothing to press
            }

            Object root = field(holder, rowCardFieldName());
            View rootView = root instanceof View ? (View) root : null;

            Object titleView = field(holder, rowTitleFieldName());
            // What the app just drew on this row, captured before decorate() can touch it. bindRow
            // runs after the app's own setText, so this is the app's text, not ours.
            String drawn = drawnText(titleView);
            if (titleView instanceof View) {
                // With no card there is nothing to press and nothing to move, so registering the
                // title view would only claim that category on a view the app draws itself - and a
                // claim that cannot be honoured is how a stale menu offers the wrong category.
                if (rootView != null) {
                    Row r = new Row(id, title, rootView);
                    r.drawn = drawn;
                    synchronized (ROW_LOCK) { rows.put((View) titleView, r); }
                } else {
                    synchronized (ROW_LOCK) { rows.remove((View) titleView); }
                    // Issue #52 stage 9, SK Tech: clear the closed-over id, do not just forget the row.
                    //
                    // installLongPress() captures its id in the listener it hangs on the card. When a
                    // card is recycled for a category whose row carries no card, this branch used to
                    // return without re-hanging anything - so the next long press ran the PREVIOUS
                    // category's listener and pinned that id instead of the one under the finger. The
                    // id need not exist in the list, and current().size() counts ids, so the count
                    // ends up one above the number of pinned rows: nothing can clear a pin whose row
                    // is never drawn. Re-hanging with a null id makes installLongPress remove the
                    // listeners, so a card with no row behind it cannot claim a category at all.
                    installLongPress(rootView, null, null);
                }
            }
            // The card that was being arranged has just been reused for a different category.
            //
            // This used to end the Arrange session, on the reasoning that the user had scrolled
            // the card away. That was wrong, and it is why a phone needed "Arrange" again for
            // every single swipe: moving a card re-submits the list, DiffUtil moves the rows, and
            // the RecyclerView reuses the holder that is being dragged for the neighbour that
            // takes its old place. The session ended on the user's own move.
            //
            // Scrolling away no longer needs the guard either: `ownsArrange` only lets the card
            // holding the arranging view act on a gesture, so an off-screen card cannot move.
            // The session now ends only when the user ends it (Done, OK, BACK, a tap, or unpin).
            //
            // What DOES have to follow the recycle is the long-press handler. A menu shares its
            // dialog between rows, so a row that now shows another category but still carries the
            // previous category's listener would offer to pin the wrong one - and the app's own
            // long press does nothing by design (it is ours, not the app's), so there is no
            // fallback. Re-hang the listeners whenever the id on this root changed.
            if (rootView != null) {
                installLongPress(rootView, id, title);
                if (id.equals(arrangingId)) {
                    arrangingView = rootView;
                }
            }
        } catch (Throwable ignored) { }
    }

    /**
     * Hook 4: gd.c.d(...) after the app's own setText, so our prefix survives.
     * Re-stamping the whole text (rather than prefixing) keeps this idempotent on recycled rows.
     */
    public static void decorate(View titleView) {
        try {
            if (titleView == null) return;
            Row row;
            synchronized (ROW_LOCK) { row = rows.get(titleView); }
            if (row == null) return;
            if (!(titleView instanceof TextView)) return;
            boolean isPinned = current().contains(row.id);
            boolean isArranging = row.id.equals(arrangingId);

            // The label to decorate: whatever the app drew, never the identity field.
            //
            // For a single-field row the two are the same string, which is why this went unnoticed
            // for four apps. A row that shows a composed label would be truncated by writing the
            // identity field here, so the text is taken from the view and only the marker is ours.
            String base = drawnLabel(titleView, row);

            String text;
            if (isArranging) text = ARRANGE_MARK + base;      // shows which card the D-pad moves
            else if (isPinned) text = MARK + base;
            else text = base;
            CharSequence current = ((TextView) titleView).getText();
            if (current != null && current.toString().equals(text)) return;
            ((TextView) titleView).setText(text);
        } catch (Throwable ignored) { }
    }

    /**
     * The text this row shows with no marker on it.
     *
     * Strips a marker we put there ourselves and keeps everything else verbatim, so a composed
     * label survives decoration, un-decoration and re-decoration. Falls back to the title field
     * only when the view carries no text at all, which is the state of a freshly created holder.
     */
    private static String drawnLabel(View titleView, Row row) {
        String live = drawnText(titleView);
        if (live == null || live.length() == 0) live = row.drawn;
        if (live == null || live.length() == 0) return row.title;
        if (live.startsWith(MARK)) return live.substring(MARK.length());
        if (live.startsWith(ARRANGE_MARK)) return live.substring(ARRANGE_MARK.length());
        return live;
    }

    /** A TextView's current text, or null for anything that is not a TextView. */
    private static String drawnText(Object view) {
        try {
            if (!(view instanceof TextView)) return null;
            CharSequence t = ((TextView) view).getText();
            return t == null ? null : t.toString();
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Recompute the marker on every row we already know about.
     *
     * This is needed because the list behind these cards is DiffUtil-backed: re-submitting a
     * reordered copy of the SAME item instances is a pure move as far as the diff is concerned
     * (areItemsTheSame and areContentsTheSame both stay true), so RecyclerView reuses the existing
     * views and never calls onBindViewHolder. That means the decorate hook does not run and the row
     * would keep its old text - which is why a pin/unpin only showed up after restarting the app.
     * Stamping the views directly is deterministic and does not depend on the diff's decisions.
     */
    private static void restampRows() {
        try {
            List<View> views;
            synchronized (ROW_LOCK) { views = new ArrayList<View>(rows.keySet()); }
            for (int i = 0; i < views.size(); i++) decorate(views.get(i));
        } catch (Throwable ignored) { }
    }

    // ------------------------------------------------------------ input mode

    /**
     * Is the thing in the user's hand a remote right now?
     *
     * Order matters. A real input event always wins, because it is not a guess. The device hints
     * only answer the very first long press, before either input has been seen.
     */
    private static boolean remoteInput(Context ctx) {
        final Boolean keyed = lastInputWasKey;
        if (keyed != null) return keyed.booleanValue();
        return looksLikeTv(ctx);
    }

    /**
     * Device hints, used only when no input has been observed yet.
     *
     * `android.software.leanback` is the honest signal but it is not universal: plenty of cheap
     * Android TV boxes ship without it. A television UI mode catches most of those. If neither can
     * be read the answer is "not a TV", which fails towards the phone menu - the smaller, safer one.
     */
    private static boolean looksLikeTv(Context ctx) {
        try {
            if (ctx == null) return false;
            PackageManager pm = ctx.getPackageManager();
            if (pm != null && pm.hasSystemFeature(PackageManager.FEATURE_LEANBACK)) return true;
        } catch (Throwable ignored) { }
        try {
            if (ctx == null) return false;
            Configuration c = ctx.getResources().getConfiguration();
            if (c != null) {
                final int mode = c.uiMode & Configuration.UI_MODE_TYPE_MASK;
                if (mode == Configuration.UI_MODE_TYPE_TELEVISION) return true;
            }
        } catch (Throwable ignored) { }
        return false;
    }

    /**
     * How many cards one row of the grid holds, measured from the views themselves.
     *
     * 0 means "could not measure" and callers fall back to the app's own rule, labelled. This
     * replaces an earlier version that read the RecyclerView's layout manager by field name: in
     * the real APK those fields are obfuscated, the lookups returned null, the answer became 1, and
     * every "move up a row" silently moved a single card. On a television that is the same thing
     * as an arrow key that does nothing, which is exactly how it was reported.
     *
     * The measurement needs no app classes and no field names:
     *
     *   - the card under the finger is laid out, so its width is real;
     *   - its parent (the grid) is laid out, so its children have real tops;
     *   - a row is the set of children sharing a top. Full rows are the widest, and the widest
     *     row is the column count. A single visible row may be the short last one, so it is not
     *     trusted on its own: one row is not evidence of a grid width.
     *
     * If the card sits in a wrapper that holds only itself, there is no grid to look at and the
     * answer is "unknown" rather than a guess.
     */
    private static int measuredColumns(View row) {
        try {
            if (row == null) return 0;
            final int cardWidth = row.getWidth();
            if (cardWidth <= 0) return 0;                    // not laid out yet
            Object parent = row.getParent();
            if (!(parent instanceof ViewGroup)) return 0;    // nothing to measure against
            ViewGroup grid = (ViewGroup) parent;
            final int children = grid.getChildCount();
            if (children < 4) return 0;                      // too few to be a row of a grid

            // Widest run of children sharing a top.
            HashMap<Integer, Integer> perTop = new HashMap<Integer, Integer>();
            int best = 0, rows = 0;
            for (int i = 0; i < children; i++) {
                View child = grid.getChildAt(i);
                if (child == null) continue;
                Integer top = Integer.valueOf(child.getTop());
                Integer was = perTop.get(top);
                int now = (was == null ? 0 : was.intValue()) + 1;
                perTop.put(top, Integer.valueOf(now));
                if (now == 1) rows++;
                if (now > best) best = now;
            }
            // A single row cannot tell a grid from a vertical list: 4 children in one line may be
            // 4 columns or 40 columns with only 4 on screen. Say so, and let the rule answer.
            if (rows < 2 || best < 2) return 0;

            // Cross-check against the width. They disagree when the widest visible row is itself
            // clipped by the screen edge; the smaller of the two is the one that cannot overshoot
            // a row, and overshooting is the failure the user can see.
            final int gridWidth = grid.getWidth();
            if (gridWidth > 0) {
                final int byWidth = Math.round((float) gridWidth / (float) cardWidth);
                if (byWidth >= 2) return Math.min(best, byWidth);
            }
            return best;
        } catch (Throwable ignored) { }
        return 0;
    }

    /**
     * The grid width the APP uses, for when nothing can be measured.
     *
     * nd.e.B(View,Bundle) in the shipped APK picks 8 columns on a television and in landscape, and
     * 4 in phone portrait. Copied deliberately: it is the app's own rule, not a guess of ours, but
     * it is still a rule and not a measurement, so the caller labels it as approximate in the menu
     * instead of passing it off as measured.
     */
    private static int ruleColumns(Context ctx) {
        try {
            if (looksLikeTv(ctx)) return tvColumns;
            if (ctx != null) {
                Configuration c = ctx.getResources().getConfiguration();
                if (c != null && c.orientation == Configuration.ORIENTATION_LANDSCAPE) return tvColumns;
            }
        } catch (Throwable ignored) { }
        return phoneColumns;
    }

    private static int layoutSpan(View row, Context ctx) {
        if (lmSpanField != null && row != null) {
            try {
                Object p = row.getParent();
                if (p instanceof ViewGroup) {
                    Object mgr = callNoArg(p, "getLayoutManager");
                    int s = intField(mgr, lmSpanField, 0);
                    if (s > 0) return s;
                }
            } catch (Throwable ignored) { }
        }
        int measured = measuredColumns(row);
        return measured > 1 ? measured : ruleColumns(ctx);
    }

    /** Remember how this gesture arrived. Called from the key and touch paths, never from a guess. */
    private static void noteKeyInput()   { lastInputWasKey = Boolean.TRUE;  armTouchLongPress = false; }
    private static void noteTouchInput() { lastInputWasKey = Boolean.FALSE; }

    // ---------------------------------------------------------------- gesture

    private static void installLongPress(final View root, final String id, final String title) {
        try {
            if (root == null) return;
            if (id == null || id.length() == 0 || "null".equals(id)) {
                // Issue #52 stage 9: an unclaimed card must not keep a listener that names a
                // category. See the null-root branch in bindRow() for the defect this closes.
                root.setOnLongClickListener(null);
                root.setOnKeyListener(null);
                root.setLongClickable(false);
                return;
            }
            Row existing;
            synchronized (ROW_LOCK) { existing = rows.get(root); }
            final boolean sameId = existing != null && id.equals(existing.id);
            // Refresh the remembered title even when the id matches: the app can rename a
            // category and rebind the same views, and a dialog still offering the old name is a
            // lie. The listeners below read the title at click time, not at bind time.
            synchronized (ROW_LOCK) { rows.put(root, new Row(id, title, root)); }
            if (sameId) return;                                       // listeners already wired
            root.setLongClickable(true);
            root.setOnKeyListener(new View.OnKeyListener() {
                public boolean onKey(View v, int keyCode, KeyEvent event) {
                    // Any key means a remote is in use. Recorded before the arrange check so the
                    // next menu is built for the remote even if this key did nothing.
                    try { noteKeyInput(); } catch (Throwable ignored) { }
                    return onArrangeKey(v, keyCode, event);
                }
            });
            root.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    // The swipe path is gone. The listener stays for one reason: a finger on the
                    // screen is the only reliable proof that this is not a remote, and the menu
                    // has to match what the user is holding.
                    try {
                        noteTouchInput();
                        final int action = event != null ? event.getActionMasked() : -1;
                        if (action == MotionEvent.ACTION_DOWN) armTouchLongPress = true;
                        else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                            armTouchLongPress = false;
                        }
                    } catch (Throwable ignored) { }
                    return false;                                     // never consume: taps and scrolls are the app's
                }
            });
            root.setOnLongClickListener(new View.OnLongClickListener() {
                public boolean onLongClick(View v) {
                    try {
                        // A long press on a TV is the OK key being held, and it lands here with no
                        // touch involved. Only a press we saw start on the glass clears the flag.
                        final boolean byFinger = armTouchLongPress;
                        armTouchLongPress = false;
                        ask(v.getContext(), id, currentTitle(v, title), byFinger);
                    } catch (Throwable ignored) { }
                    return true;                                      // consume: don't also open the category
                }
            });
        } catch (Throwable ignored) { }
    }

    /** The name this row carries NOW, not the one it carried when the listener was installed. */
    private static String currentTitle(View root, String fallback) {
        try {
            Row row;
            synchronized (ROW_LOCK) { row = rows.get(root); }
            if (row != null && row.title != null && row.title.length() > 0) return row.title;
        } catch (Throwable ignored) { }
        return fallback;
    }

    private static void ask(final Context ctx, final String id, final String title,
                         final boolean byFinger) {
        if (ctx == null) return;
        init(ctx);
        final boolean isPinned = current().contains(id);

        if (!isPinned) {
            new AlertDialog.Builder(ctx)
                    .setTitle("Pin \"" + title + "\" to the top?")
                    .setPositiveButton("Pin", new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            pin(ctx, id);
                        }
                    })
                    .setNegativeButton("Cancel", null)
                    .show();
            return;
        }

        // Already pinned: what the menu offers depends on what is in the user's hand.
        //
        //   remote  - Arrange first, then Move to top, then the four one-step moves, then Unpin.
        //             Arrange and Move to top are the two the reporter actually uses, so they are
        //             at the top of the list where a D-pad user reaches them first.
        //   finger  - the flat moves: left, right, move to top, unpin. No Arrange (it could not be
        //             made dependable on a phone and was dropped), and no up/down: a phone is one
        //             card per row most of the time, so up is the same thing as left.
        final boolean arrangingThis = id.equals(arrangingId);
        // A finger on the glass always gets the phone menu, whatever the device claims to be.
        // Otherwise the input latch decides, falling back to the device hints on first use.
        final boolean remote = !byFinger && remoteInput(ctx);

        if (!remote) {
            new AlertDialog.Builder(ctx)
                    .setTitle(MARK + title)
                    .setItems(new CharSequence[]{"Move left", "Move right", "Move to top", "Unpin",
                                    "Clear stranded pins"},
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {
                                    if (which == 0) move(ctx, id, -1);
                                    else if (which == 1) move(ctx, id, 1);
                                    else if (which == 2) moveToTop(ctx, id);
                                    else if (which == 3) unpin(ctx, id);
                                    else clearStrandedPins(ctx);
                                }
                            })
                    .setNegativeButton("Cancel", null)
                    .show();
            return;
        }

        // Up/down move a whole row. Measuring beats guessing, but a guess that is labelled is
        // better than a silent one: see measuredColumns() for what went wrong the other way.
        final int span = layoutSpan(findRow(id), ctx);

        new AlertDialog.Builder(ctx)
                .setTitle(MARK + title)
                .setItems(new CharSequence[]{
                                arrangingThis ? "Done" : "Arrange",
                                "Move to top",
                                "Move left", "Move right",
                                "Move up a row", "Move down a row",
                                "Unpin", "Clear stranded pins"},
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                // One place uses move(), which explains an edge press ("Already
                                // first"). A row uses moveBy(), which stops quietly at the end
                                // because the user asked for a distance, not a step.
                                if (which == 0) {
                                    if (arrangingThis) endArrange(ctx, true);
                                    else beginArrange(ctx, id);
                                }
                                else if (which == 1) moveToTop(ctx, id);
                                else if (which == 2) move(ctx, id, -1);
                                else if (which == 3) move(ctx, id, 1);
                                else if (which == 4) moveBy(ctx, id, -span);
                                else if (which == 5) moveBy(ctx, id, span);
                                else if (which == 6) unpin(ctx, id);
                                else clearStrandedPins(ctx);
                            }
                        })
                .setNegativeButton("Cancel", null)
                .show();
    }

    /**
     * Swap a pinned category with its neighbour inside the pinned group.
     * Moving past the ends is a no-op with a message, never an unpin.
     */
    private static synchronized void move(Context ctx, String id, int delta) {
        try {
            if (id == null || id.length() == 0 || "null".equals(id)) return;
            trace("move: '" + id + "' by " + delta + ", " + current().size() + " pinned");
            List<String> order = new ArrayList<String>(pinned);
            int from = order.indexOf(id);
            if (from < 0) return;                                   // not pinned

            // Where this card sits among the cards the user can actually see. An orphan occupies a
            // slot in `pinned` but draws no row, so counting it made a move land on a neighbour that
            // was not there and the screen did not change - issue #52 stage 11, "moving right don't
            // happen, but next happens".
            List<String> live = livePins(liveList());
            int liveFrom = live.indexOf(id);
            if (liveFrom < 0) return;                               // its row is not on screen
            int liveTo = liveFrom + delta;
            if (liveTo < 0 || liveTo >= live.size()) {
                say(ctx, delta < 0 ? "Already first" : "Already last");
                return;
            }
            String neighbour = live.get(liveTo);
            int to = order.indexOf(neighbour);                      // land where that card really is
            if (to < 0) {
                say(ctx, "Couldn't move past a pinned category that is no longer listed");
                return;
            }
            order.add(to, order.remove(from));       // shift, not swap: the others slide along
            pinned = new LinkedHashSet<String>(order);
            save();
            final boolean isArranging = id.equals(arrangingId);
            if (isArranging) arrangeMoved = true;
            lastSay = null;                                          // a real move earned new feedback
            final boolean postLayoutFocus = (differField == null) && (isArranging || remoteInput(ctx));
            final ViewGroup capturedRv = postLayoutFocus ? captureRecyclerFocus(id, isArranging) : null;
            resubmit();
            restampRows();
            if (postLayoutFocus) {
                schedulePostLayoutFocus(capturedRv, id, isArranging, true);
            } else {
                focusMovingRow();
            }
        } catch (Throwable ignored) { }
    }

    /**
     * Move a pinned category by several places in one go, stopping at the ends.
     *
     * Used by the TV up/down entries, which move a whole row, and by nothing else. It is
     * deliberately not a repeat of `move()` with feedback suppressed: each place is a real move,
     * so an edge simply stops the loop instead of queueing a toast the user did not ask for.
     */
    private static void moveBy(Context ctx, String id, int places) {
        try {
            if (id == null || places == 0) return;
            final int dir = places > 0 ? 1 : -1;
            final int count = Math.abs(places);
            boolean moved = false;
            final boolean isArranging = id.equals(arrangingId);
            for (int i = 0; i < count; i++) {
                List<String> order = new ArrayList<String>(pinned);
                int from = order.indexOf(id);
                if (from < 0) return;                              // unpinned mid-way
                int to = from + dir;
                if (to < 0 || to >= order.size()) break;            // the end: stop, say nothing
                order.add(to, order.remove(from));
                pinned = new LinkedHashSet<String>(order);
                moved = true;
                if (isArranging) arrangeMoved = true;
            }
            if (!moved) return;
            save();
            lastSay = null;
            final boolean postLayoutFocus = (differField == null) && (isArranging || remoteInput(ctx));
            final ViewGroup capturedRv = postLayoutFocus ? captureRecyclerFocus(id, isArranging) : null;
            resubmit();
            restampRows();
            if (postLayoutFocus) {
                schedulePostLayoutFocus(capturedRv, id, isArranging, true);
            } else {
                focusMovingRow();
            }
        } catch (Throwable ignored) { }
    }

    /** Lift a pinned category to the front of the pinned group. */
    private static synchronized void moveToTop(Context ctx, String id) {
        try {
            if (id == null || id.length() == 0 || "null".equals(id)) return;
            trace("movetotop: '" + id + "', " + current().size() + " pinned");   // proves which build ran
            List<String> order = new ArrayList<String>(pinned);
            int from = order.indexOf(id);
            if (from < 0) return;
            if (from == 0) { say(ctx, "Already first"); return; }
            // "Top" means the top of what is on screen. An orphan holding index 0 draws nothing, so
            // moving to absolute 0 would put the card above empty space and appear to do nothing.
            List<String> live = livePins(liveList());
            int liveFrom = live.indexOf(id);
            int target = 0;
            if (liveFrom > 0) {
                int firstLive = order.indexOf(live.get(0));
                if (firstLive >= 0) target = firstLive;
            }
            order.remove(from);
            if (target > order.size()) target = order.size();
            order.add(target, id);
            pinned = new LinkedHashSet<String>(order);
            save();
            final boolean isArranging = id.equals(arrangingId);
            if (isArranging) arrangeMoved = true;
            lastSay = null;
            final boolean postLayoutFocus = (differField == null) && (isArranging || remoteInput(ctx));
            final ViewGroup capturedRv = postLayoutFocus ? captureRecyclerFocus(id, isArranging) : null;
            resubmit();
            restampRows();
            if (postLayoutFocus) {
                schedulePostLayoutFocus(capturedRv, id, isArranging, true);
            } else {
                focusMovingRow();
            }
        } catch (Throwable ignored) { }
    }

    // ------------------------------------------------------------- arrange mode

    /**
     * Arrange: hand the D-pad to this one category until the user finishes. Deliberately a mode
     * rather than a dialog per step - on a remote, moving an item three places otherwise costs
     * three long-presses, three menus and three selections.
     *
     * TV only. On a phone there is nothing to hand over: the menu has no reorder entries, so this
     * is never reachable there, and it refuses to start unless the input is a remote.
     *
     * The item has to be pinned first: arranging unpinned rows would mean deciding what "position"
     * means outside the pinned group, which is the thing this patch deliberately does not touch.
     */
    static void beginArrange(Context ctx, String id) {
        try {
            if (id == null || id.length() == 0 || "null".equals(id)) return;
            if (!current().contains(id)) return;
            // TV only. The menu does not offer it on a phone, so this is the second lock on the
            // same door: without a remote there is no OK key to finish with, and a mode with no
            // exit is worse than no mode.
            if (!remoteInput(ctx)) return;
            arrangingId = id;
            arrangingView = findRow(id);
            arrangeMoved = false;
            lastSay = null;
            say(ctx, "Arranging \u00B7 arrows to move, OK when done");
            restampRows();
            focusMovingRow();
        } catch (Throwable ignored) { }
    }

    /** Leave arrange mode. `keep` distinguishes "finished" from "left it alone". */
    static void endArrange(Context ctx, boolean keep) {
        try {
            final boolean moved = arrangeMoved;
            final String prevId = arrangingId;
            final View prevView = arrangingView;
            arrangingId = null;
            arrangingView = null;
            arrangeMoved = false;
            lastSay = null;
            ViewGroup pendingRv = savedFocusRv.get();
            if (pendingRv != null && pendingRv.isAttachedToWindow() && pendingRv.isLayoutRequested()) {
                // A notifyDataSetChanged() layout pass from the last move is still pending: stop
                // forwarding arrange keys right away, but keep holding focus on the RecyclerView
                // until onLayoutChange fires so detaching children mid-layout cannot steal focus.
                pendingRv.setOnKeyListener(null);
                schedulePostLayoutFocus(pendingRv, prevId, false, true);
            } else {
                pendingFocusGen++;
                restoreRecyclerFocusAndHandoff(prevView != null ? prevView : findRow(prevId));
            }
            restampRows();
            if (keep && moved) say(ctx, "Position saved");   // silence beats a claim that is not true
        } catch (Throwable ignored) { }
    }

    /** The attached card view we know for a category id, if it is on screen. */
    private static View findRow(String id) {
        if (id == null) return null;
        try {
            View attachedFallback = null;
            synchronized (ROW_LOCK) {
                for (Map.Entry<View, Row> e : rows.entrySet()) {
                    Row r = e.getValue();
                    if (r == null || !id.equals(r.id)) continue;
                    View cand = r.root != null ? r.root : e.getKey();
                    if (cand == null || !cand.isAttachedToWindow() || cand.getParent() == null) continue;
                    // Verify the card itself has not already been rebound to a different category.
                    Row rootRow = rows.get(cand);
                    if (rootRow != null && !id.equals(rootRow.id)) continue;
                    if (cand.getWidth() > 0) return cand;
                    if (attachedFallback == null) attachedFallback = cand;
                }
            }
            return attachedFallback;
        } catch (Throwable ignored) { }
        return null;
    }

    private static boolean isRecyclerView(ViewGroup vg) {
        if (vg == null) return false;
        String name = vg.getClass().getName();
        if (name.endsWith("RecyclerView")) return true;
        try {
            vg.getClass().getMethod("getLayoutManager");
            return true;
        } catch (Throwable ignored) { }
        return false;
    }

    private static ViewGroup findRecyclerView(View v) {
        View cur = v;
        try {
            while (cur != null) {
                Object p = cur.getParent();
                if (!(p instanceof ViewGroup)) break;
                ViewGroup vg = (ViewGroup) p;
                if (isRecyclerView(vg)) return vg;
                cur = vg;
            }
        } catch (Throwable ignored) { }
        return null;
    }

    private static ViewGroup resolveRecycler(String id) {
        ViewGroup rv = findRecyclerView(arrangingView);
        if (rv != null && rv.isAttachedToWindow()) return rv;
        rv = findRecyclerView(findRow(id));
        if (rv != null && rv.isAttachedToWindow()) return rv;
        return findRecyclerForAdapter(lastAdapter.get());
    }

    /**
     * Hold focus on the RecyclerView across a notifyDataSetChanged() layout pass so detaching
     * children mid-layout cannot bounce Android TV focus up to the parent TabLayout.
     */
    private static ViewGroup captureRecyclerFocus(String id, boolean forwardKeys) {
        try {
            ViewGroup rv = resolveRecycler(id);
            if (rv == null || !rv.isAttachedToWindow()) return null;
            ViewGroup prev = savedFocusRv.get();
            if (prev != rv) {
                if (prev != null) restoreRecyclerFocusAndHandoff(null);
                savedFocusRv = new WeakReference<ViewGroup>(rv);
                savedFocusDescendant = rv.getDescendantFocusability();
                savedFocusFocusable = rv.isFocusable();
            }
            rv.setDescendantFocusability(ViewGroup.FOCUS_BEFORE_DESCENDANTS);
            rv.setFocusable(true);
            rv.requestFocus();
            if (forwardKeys) {
                rv.setOnKeyListener(new View.OnKeyListener() {
                    public boolean onKey(View v, int keyCode, KeyEvent event) {
                        try { noteKeyInput(); } catch (Throwable ignored) { }
                        return onArrangeKey(v, keyCode, event);
                    }
                });
            }
            return rv;
        } catch (Throwable ignored) { }
        return null;
    }

    /**
     * Restore descendantFocusability + clear temp key listener FIRST, transfer focus to `target`
     * (or first focusable child), and ONLY THEN restore `rv.setFocusable(savedFocusFocusable)`.
     * Calling `rv.setFocusable(false)` while `rv.isFocused()` is true triggers AOSP `clearFocus()`,
     * which bounces focus up to the parent TabLayout before `target.requestFocus()` runs.
     */
    private static void restoreRecyclerFocusAndHandoff(View target) {
        try {
            ViewGroup rv = savedFocusRv.get();
            savedFocusRv = new WeakReference<ViewGroup>(null);
            if (rv == null) {
                if (target != null && target.isAttachedToWindow() && !target.isFocused()) {
                    target.requestFocus();
                }
                return;
            }
            rv.setOnKeyListener(null);
            rv.setDescendantFocusability(savedFocusDescendant);
            boolean handedOff = false;
            if (target != null && target.isAttachedToWindow()) {
                handedOff = target.isFocused() || target.requestFocus();
            }
            if (!handedOff) {
                int n = rv.getChildCount();
                for (int i = 0; i < n; i++) {
                    View c = rv.getChildAt(i);
                    if (c != null && c.isAttachedToWindow() && (c.isFocused() || c.requestFocus())) {
                        break;
                    }
                }
            }
            rv.setFocusable(savedFocusFocusable);
        } catch (Throwable ignored) { }
    }

    private static void scrollTargetIntoView(ViewGroup rv, String targetId) {
        try {
            if (rv == null || targetId == null) return;
            List live = liveList();
            if (live == null) return;
            int targetIdx = indexOfId(live, targetId);
            if (targetIdx < 0) return;

            int firstVisIdx = -1;
            int sampleH = 0;
            View sampleView = null;
            int minTop = Integer.MAX_VALUE;
            int maxTop = Integer.MIN_VALUE;
            int minRow = Integer.MAX_VALUE;
            int maxRow = Integer.MIN_VALUE;
            int span = 0;

            int n = rv.getChildCount();
            for (int i = 0; i < n; i++) {
                View c = rv.getChildAt(i);
                if (c == null) continue;
                if (sampleH <= 0 && c.getHeight() > 0) {
                    sampleH = c.getHeight();
                    sampleView = c;
                    span = layoutSpan(sampleView, rv.getContext());
                    if (span < 1) span = 1;
                }
                Row r;
                synchronized (ROW_LOCK) { r = rows.get(c); }
                if (r != null && r.id != null) {
                    int idx = indexOfId(live, r.id);
                    if (idx >= 0) {
                        if (firstVisIdx < 0 || idx < firstVisIdx) firstVisIdx = idx;
                        if (span > 0) {
                            int row = idx / span;
                            int top = c.getTop();
                            if (row < minRow) { minRow = row; minTop = top; }
                            if (row > maxRow) { maxRow = row; maxTop = top; }
                        }
                    }
                }
            }
            if (sampleH <= 0) sampleH = 160;
            if (span < 1) span = ruleColumns(rv.getContext());
            int rowPitch = sampleH;
            if (maxRow > minRow && maxTop > minTop) {
                int measuredPitch = (maxTop - minTop) / (maxRow - minRow);
                if (measuredPitch > 0) rowPitch = measuredPitch;
            }
            if (firstVisIdx >= 0) {
                int dir = targetIdx < firstVisIdx ? -1 : 1;
                int rowDelta = (targetIdx / span) - (firstVisIdx / span);
                int initialDy = rowDelta != 0 ? rowDelta * rowPitch : dir * rowPitch;
                if (initialDy != 0 && rv.canScrollVertically(dir)) {
                    rv.scrollBy(0, initialDy);
                }
                for (int step = 0; step < 16 && findRow(targetId) == null; step++) {
                    if (!rv.canScrollVertically(dir)) break;
                    rv.scrollBy(0, dir * rowPitch);
                }
            }
        } catch (Throwable ignored) { }
    }

    private static void schedulePostLayoutFocus(final ViewGroup rv, final String targetId,
                                                final boolean isArranging, final boolean scrollIfNeeded) {
        final int gen = ++pendingFocusGen;
        if (rv == null || !rv.isAttachedToWindow()) {
            restoreRecyclerFocusAndHandoff(null);
            if (isArranging) focusMovingRow();
            return;
        }
        final boolean[] done = new boolean[1];
        final int[] retries = new int[1];
        final View.OnLayoutChangeListener[] holder = new View.OnLayoutChangeListener[1];
        final Runnable finish = new Runnable() {
            public void run() {
                if (done[0]) return;
                done[0] = true;
                try {
                    if (holder[0] != null) rv.removeOnLayoutChangeListener(holder[0]);
                } catch (Throwable ignored) { }
                try {
                    if (gen != pendingFocusGen) return;
                    if (isArranging && targetId != null && !targetId.equals(arrangingId)) {
                        restoreRecyclerFocusAndHandoff(null);
                        return;
                    }
                    View target = targetId != null ? findRow(targetId) : null;
                    if (target == null && targetId != null && scrollIfNeeded) {
                        scrollTargetIntoView(rv, targetId);
                        target = findRow(targetId);
                    }
                    if (target != null && target.isAttachedToWindow()) {
                        if (isArranging) arrangingView = target;
                        int top = target.getTop();
                        int h = target.getHeight();
                        int rvH = rv.getHeight();
                        if (top < 0 && rv.canScrollVertically(-1)) {
                            rv.scrollBy(0, top);
                        } else if (rvH > 0 && h > 0 && top + h > rvH && rv.canScrollVertically(1)) {
                            rv.scrollBy(0, (top + h) - rvH);
                        }
                        restoreRecyclerFocusAndHandoff(target);
                        final View fTarget = target;
                        target.post(new Runnable() {
                            public void run() {
                                try {
                                    if (gen != pendingFocusGen) return;
                                    if (isArranging && !targetId.equals(arrangingId)) return;
                                    if (fTarget.isAttachedToWindow() && !fTarget.isFocused()) {
                                        fTarget.requestFocus();
                                    }
                                } catch (Throwable ignored) { }
                            }
                        });
                    } else {
                        restoreRecyclerFocusAndHandoff(null);
                    }
                } catch (Throwable ignored) {
                    restoreRecyclerFocusAndHandoff(null);
                }
            }
        };
        holder[0] = new View.OnLayoutChangeListener() {
            public void onLayoutChange(View v, int left, int top, int right, int bottom,
                                       int oldLeft, int oldTop, int oldRight, int oldBottom) {
                finish.run();
            }
        };
        rv.addOnLayoutChangeListener(holder[0]);
        final Runnable fallback = new Runnable() {
            public void run() {
                if (done[0] || gen != pendingFocusGen) return;
                // Do not pre-empt Choreographer vsync: wait while layout is still pending (up to 3x48ms).
                if (rv.isAttachedToWindow() && rv.isLayoutRequested() && retries[0] < 3) {
                    retries[0]++;
                    rv.postDelayed(this, 48L);
                    return;
                }
                finish.run();
            }
        };
        rv.postDelayed(fallback, 48L);
    }

    /** After a reorder the list moves underneath us; put focus back on the card being arranged. */
    private static void focusMovingRow() {
        try {
            final View v = arrangingView != null ? arrangingView : findRow(arrangingId);
            if (v == null || !v.isAttachedToWindow() || v.getWidth() <= 0) return;

            // requestFocus() on a child the RecyclerView thinks is off screen is answered by
            // scrolling it fully into view. If the card already has focus, asking again is what
            // produced the small scroll on every single press.
            if (v.isFocused()) return;
            v.requestFocus();
            // submitList is asynchronous: DiffUtil moves the rows on a later frame, and focus taken
            // now can be dropped when that happens. Re-assert once after the update has landed -
            // on a remote, losing focus loses the mode.
            v.post(new Runnable() {
                public void run() { try { v.requestFocus(); } catch (Throwable ignored) { } }
            });
        } catch (Throwable ignored) { }
    }

    /**
     * TV path. Only LEFT/RIGHT are consumed, only while arranging, and only for this card -
     * everything else (up/down, OK when not arranging, BACK) falls through to the app untouched.
     */
    private static boolean onArrangeKey(View v, int keyCode, KeyEvent event) {
        try {
            final String id = arrangingId;
            if (id == null || event == null) return false;
            if (event.getAction() != KeyEvent.ACTION_DOWN) return false;
            if (!ownsArrange(v)) return false;                   // focus moved to another card
            final Context c = v != null ? v.getContext() : null;   // feedback needs a real Context
            if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT) { move(c, id, -1); return true; }
            if (keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) { move(c, id, 1); return true; }
            // Up/down change a whole row. Without them, moving a pin from the bottom row to the
            // top is twelve presses of LEFT. The width is measured from the card itself, with the
            // app's own 8/4 rule as the fallback - never a silent one-place step.
            if (keyCode == KeyEvent.KEYCODE_DPAD_UP || keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
                View sampleCard = v;
                if (v instanceof ViewGroup && isRecyclerView((ViewGroup) v)) {
                    ViewGroup rvg = (ViewGroup) v;
                    sampleCard = arrangingView != null && arrangingView.isAttachedToWindow()
                            ? arrangingView
                            : findRow(id);
                    if (sampleCard == null && rvg.getChildCount() > 0) {
                        sampleCard = rvg.getChildAt(0);
                    }
                }
                final int rowStep = layoutSpan(sampleCard, c);
                moveBy(c, id, keyCode == KeyEvent.KEYCODE_DPAD_UP ? -rowStep : rowStep);
                return true;
            }
            if (keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER) {
                endArrange(v != null ? v.getContext() : null, true);
                return true;
            }
            if (keyCode == KeyEvent.KEYCODE_BACK) { endArrange(v != null ? v.getContext() : null, false); return false; }
        } catch (Throwable ignored) { }
        return false;
    }

    /**
     * Is this the card being arranged? Focus can be walked off with up/down, and a LEFT pressed
     * over a different row must not silently move a card the user is no longer looking at.
     * Unknown views answer "yes": better to keep the remote working than to go dead on a view
     * whose binding we have lost.
     */
    private static boolean ownsArrange(View v) {
        try {
            if (v == null) return true;
            // No "v == arrangingView" shortcut. The same view object can be bound to a different
            // item while it stays the arranging view, so identity alone says yes to a row that is
            // now somebody else's. The paths that must accept it anyway (finishing the session,
            // the touch bookkeeping below) check it themselves.
            Row row;
            synchronized (ROW_LOCK) { row = rows.get(v); }
            return row == null || row.id == null || row.id.equals(arrangingId);
        } catch (Throwable ignored) { }
        return true;
    }

    private static void say(Context ctx, String message) {
        try {
            if (ctx == null || message == null) return;
            // While arranging, an edge press repeats: holding LEFT must not queue a pile of
            // toasts. One message per gesture is enough.
            if (message.equals(lastSay) && arrangingId != null && !message.startsWith("Move ")) return;
            lastSay = message;
            Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) { }
    }

    /**
     * Set the pinned state of one category to an EXPLICIT value.
     *
     * Not a toggle on purpose. A menu entry that says "Unpin" must never be able to pin, and a
     * remote whose OK button bounces can deliver the same click twice - with a toggle that second
     * click silently undoes the first one. Repeating a request for a state we are already in is a
     * no-op, so double-delivery is harmless.
     */
    private static synchronized void applyPin(Context ctx, String id, boolean wantPinned) {
        try {
            if (id == null || id.length() == 0 || "null".equals(id)) return;
            if (current().contains(id) == wantPinned) return;        // already there: nothing to do
            if (!wantPinned && id.equals(arrangingId)) {             // the card being moved is leaving
                arrangingId = null;
                arrangingView = null;
            }
            Set<String> copy = new LinkedHashSet<String>(pinned);    // copy-on-write, order preserved
            if (wantPinned) copy.add(id);
            else copy.remove(id);
            pinned = copy;
            save();
            say(ctx, wantPinned ? "Pinned to top" : "Unpinned");
            final boolean postLayoutFocus = (differField == null) && remoteInput(ctx);
            final ViewGroup capturedRv = postLayoutFocus ? captureRecyclerFocus(id, false) : null;
            resubmit();
            restampRows();
            if (postLayoutFocus) {
                schedulePostLayoutFocus(capturedRv, id, false, wantPinned);
            }
        } catch (Throwable ignored) { }
    }

    /**
     * Drop every pin whose category the app no longer lists, and say how many went.
     *
     * Issue #52 stage 11. The ghost in SK Tech's log is 'ZEE FIVE' against a row now called
     * 'ZEE5_WW'. foldRenamedPins() re-points a pin when the rename is reversible (case, spacing,
     * separators, a number word swapped for its digit). This one is not: the name lost the word
     * "FIVE" and gained "WW", so there is nothing left to match on. The pin can therefore never be
     * drawn and, because unpinning needs a row to press, can never be removed from the UI either.
     *
     * Offering it here is the honest way out: the user removes the dead pin deliberately, instead of
     * a number staying one too high for ever.
     */
    public static void clearStrandedPins(Context ctx) {
        try {
            List list = liveList();
            if (list == null) { say(ctx, "No category list to check against"); return; }
            List<String> order = new ArrayList<String>(pinned);
            int gone = 0;
            for (String id : new ArrayList<String>(pinned)) {
                if (listContains(id, list)) continue;
                order.remove(id);
                gone++;
                trace("cleared stranded pin: '" + id + "' is not in the " + list.size() + " rows listed");
            }
            if (gone == 0) { say(ctx, "No stranded pins"); return; }
            pinned = new LinkedHashSet<String>(order);
            save();
            lastSay = null;
            say(ctx, gone == 1 ? "Cleared 1 stranded pin" : "Cleared " + gone + " stranded pins");
            final boolean postLayoutFocus = (differField == null) && remoteInput(ctx);
            final ViewGroup capturedRv = postLayoutFocus ? captureRecyclerFocus(arrangingId, false) : null;
            resubmit();
            restampRows();
            if (postLayoutFocus) {
                schedulePostLayoutFocus(capturedRv, arrangingId, arrangingId != null, false);
            }
        } catch (Throwable ignored) { }
    }

    /**
     * What this build thinks it is talking to, for the "which menu am I getting?" question.
     *
     * Read aloud from the pin dialog when something looks wrong: it says whether the last input
     * was a key or a finger, and whether the device claims to be a TV. Guessing at that from a
     * description of symptoms has cost us rounds; one line settles it.
     */
    public static String describeInput(Context ctx) {
        try {
            final Boolean keyed = lastInputWasKey;
            final String input = keyed == null ? "no input yet" : (keyed.booleanValue() ? "remote" : "touch");
            final String device = looksLikeTv(ctx) ? "TV" : "not TV";
            final int measured = measuredColumns(findRow(arrangingId != null ? arrangingId : firstPinnedId()));
            // Say WHERE the number came from. A bare "columns=8" could not settle the question this
            // line exists to settle: measured from the grid, or taken from the app's rule?
            return "input=" + input + ", device=" + device + ", columns="
                    + (measured > 1
                        ? (measured + " (measured)")
                        : ("unknown (rule " + ruleColumns(ctx) + ")"));
        } catch (Throwable ignored) { }
        return "unknown";
    }

    /** The card to measure when nothing is being arranged: the first pinned row we know about. */
    private static String firstPinnedId() {
        try {
            Set<String> order = current();
            for (String id : order) {
                if (findRow(id) != null) return id;
            }
        } catch (Throwable ignored) { }
        return null;
    }

    static void pin(Context ctx, String id) { applyPin(ctx, id, true); }
    static void unpin(Context ctx, String id) { applyPin(ctx, id, false); }

    /**
     * Re-submit the remembered list so the rows re-order and repaint.
     *
     * Two adapter shapes exist in the apps this runs in, and neither is allowed to be guessed at:
     *
     *   ListAdapter      Playfy and anything else built on ListAdapter has submitList(List). That
     *                    is preferred when it exists, because it is the app's own path and it
     *                    keeps DiffUtil doing the animation.
     *   plain Adapter    SK Tech's category adapter is a RecyclerView.Adapter holding the list in a
     *                    public field and re-reading it on notifyDataSetChanged. There is no
     *                    submitList to find, so the configured field is written and the adapter is
     *                    told to redraw.
     *
     * If neither works the method returns quietly. That is deliberate: a reorder that cannot be
     * redrawn must not crash the app, and the pin state is already saved, so the next bind or the
     * next launch shows the truth.
     */
    private static void resubmit() {
        try {
            Object adapter = lastAdapter.get();
            if (adapter == null) { trace("resubmit: no adapter registered -> nothing redrawn"); return; }

            // The list to re-sort must come from the ADAPTER, not from a remembered reference.
            //
            // Issue #52 stage 3, CricZ: after leaving the Category screen and coming back, the
            // adapter is alive and remembered but lastList is dead - it was a WeakReference to the
            // list that the previous activity inflated. resubmit() then bailed out with
            // "no list registered", so pinning did nothing until the app itself rebuilt and
            // re-submitted the list. The adapter's own field is the authoritative copy of what the
            // rows are currently drawn from, and it cannot go stale while the adapter lives.
            List list = adapterList(adapter);
            if (list == null) {
                list = lastList.get();
                if (list == null) {
                    trace("resubmit: no list on the adapter and none registered -> nothing redrawn");
                    return;
                }
                trace("resubmit: using the remembered list (adapter exposes none)");
            }

            // PlayZ shape: a final list on the adapter cannot be re-ordered by writing a field, and
            // the adapter's own setter is the ONLY path the app redraws through. Prefer it before
            // sorting, so there is exactly one list to sort and the app and this code never hold two
            // different orders.
            Method setter = findNamed(adapter.getClass(), app.setter);
            if (setter != null) {
                List sorted = sortedCopy(list, adapter);
                if (sorted == null) { trace("resubmit: sortedCopy failed -> nothing redrawn"); return; }
                trace("resubmit: via setter '" + app.setter + "', items=" + list.size()
                        + ", moved=" + (sorted != list) + ", base=" + baseSize(adapter));
                if (differField != null && differSubmitName != null) {
                    if (sorted != list) submitWithAnchor(adapter, sorted);
                    return;
                }
                setter.setAccessible(true);
                setter.invoke(adapter, sorted);
                if (!app.setterRedraws) trace("resubmit: redraw -> " + notifyRedraw(adapter));
                return;
            }

            List sorted = sortedCopy(list, adapter);
            if (sorted == null) { trace("resubmit: sortedCopy failed -> nothing redrawn"); return; }

            Method submit = findSubmit(adapter.getClass());
            if (submit != null) {
                trace("resubmit: via submitList, moved=" + (sorted != list));
                submit.setAccessible(true);
                submit.invoke(adapter, sorted);
                return;
            }

            // No submitList and no setter: write the adapter's own list field, then ask it to redraw.
            final String listField = app.adapterList;
            if (listField == null || listField.length() == 0) {
                trace("resubmit: no submitList, no setter, no adapterList field -> cannot redraw");
                return;
            }
            if (app.finalList) {
                // The field is read-only by contract: this adapter is reordered through its own
                // setter, which did not exist on this build. Nothing safe left to do.
                trace("resubmit: field '" + listField + "' is final and no setter was found");
                return;
            }
            if (!writeListField(adapter, listField, sorted)) {
                trace("resubmit: adapter field '" + listField + "' not writable -> cannot redraw");
                return;
            }
            trace("resubmit: via field '" + listField + "', moved=" + (sorted != list)
                    + ", base=" + baseSize(adapter) + ", redraw -> " + notifyRedraw(adapter));
        } catch (Throwable t) {
            trace("resubmit threw: " + t);
        }
    }

    /**
     * The list the adapter is currently drawing from, read off the adapter itself.
     *
     * `app.adapterList` names the field for the apps whose adapter holds its items in a plain
     * field. Adapters with a submitList or a setter keep their items somewhere this profile does
     * not name, and for those this returns null and the caller falls back to the remembered list.
     */
    private static List adapterList(Object adapter) {
        try {
            final String name = app.adapterList;
            if (name == null || name.length() == 0) {
                if (differField != null && differListField != null) {
                    Object d = field(adapter, differField);
                    Object raw = field(d, differListField);
                    if (raw instanceof List) return (List) raw;
                }
                return null;
            }
            Object raw = field(adapter, name);
            return raw instanceof List ? (List) raw : null;
        } catch (Throwable ignored) { }
        return null;
    }

    /**
     * Replace an adapter's list field with a fresh ArrayList.
     *
     * A copy, not the sorted list itself: apps of this shape keep the field and hand it to
     * getItem/getCount on the next frame, and some of them sort or filter the very collection they
     * are given. Handing over a list we also hold would let them rewrite our copy.
     */
    private static boolean writeListField(Object adapter, String name, List sorted) {
        try {
            Class<?> c = adapter.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    f.set(adapter, new ArrayList(sorted));
                    return true;
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
        return false;
    }

    /**
     * Ask a plain adapter to draw its list again.
     *
     * Two shapes exist and both are tried:
     *
     *   notifyDataSetChanged   what the framework names it. SK Tech's adapter answers to this.
     *   adapter.a.b()          PlayZ and CricZ are minified to the point where the framework's own
     *                          RecyclerView.Adapter class is gone from the dex: the whole adapter
     *                          base is a local class with a final notifier in field `a`, whose `b()`
     *                          is notifyDataSetChanged inlined. `notifyDataSetChanged` does not
     *                          exist anywhere in those two dex files, so this is the only way in.
     *                          The two steps are done reflectively and the notifier is found by
     *                          walking the adapter's superclasses for the FIRST field that answers
     *                          `b()V` and is not the list itself, so a rename in a future build
     *                          degrades to "no redraw" instead of to a crash.
     *
     * If neither works the method returns quietly. The pin state is already saved, so the next
     * bind or the next launch shows the truth.
     */
    private static String notifyRedraw(Object adapter) {
        try {
            Method m = adapter.getClass().getMethod("notifyDataSetChanged");
            m.setAccessible(true);
            m.invoke(adapter);
            return "ok (notifyDataSetChanged)";
        } catch (Throwable ignored) { }
        try {
            Object notifier = null;
            Method redraw = null;
            Class<?> k = adapter.getClass();
            while (k != null && redraw == null) {
                for (Field f : k.getDeclaredFields()) {
                    if (f.getType().isPrimitive()) continue;
                    String t = f.getType().getName();
                    // The adapter's own list is not the notifier, and neither is a String bag.
                    if (t.startsWith("java.util.") || "java.lang.String".equals(t) ||
                        "android.content.Context".equals(t)) continue;
                    // A RecyclerView notifier IS an android.database.Observable: that is what the
                    // platform's AdapterDataObservable extends, and it is true of every minified
                    // copy of it met so far (PlayZ q4/c0, CRICFy cx2, CrexiFy wg2). Requiring it
                    // is what stops this walk from calling an unrelated `b()` - CrexiFy's adapter
                    // keeps an Lcb first, whose b() recomputes retry state from an IOException, and
                    // calling that in the middle of a reorder is a silent error rather than a
                    // redraw. Without this check the walk found it and called it.
                    if (!android.database.Observable.class.isAssignableFrom(f.getType())) continue;
                    // Only a field whose type really answers `b()` is a candidate. Checking the
                    // TYPE first means the first non-null object we happen to find cannot be
                    // mistaken for the notifier.
                    Method m2;
                    try {
                        m2 = f.getType().getMethod("b");
                    } catch (Throwable no) {
                        continue;
                    }
                    // getMethod("b") only finds no-argument methods, so this is already the
                    // no-argument b(). It is kept as an explicit check because the failure it
                    // guards is expensive to find: CRICFy's differ has an overload named b that
                    // takes the list and a callback, and calling that one with nothing to give it
                    // submits an empty list. A redraw hook must never be allowed to reach it.
                    if (m2.getParameterTypes().length != 0) continue;
                    try {
                        f.setAccessible(true);
                        Object o = f.get(adapter);
                        if (o != null) { notifier = o; redraw = m2; break; }
                    } catch (Throwable ignored) { }
                }
                k = k.getSuperclass();
            }
            if (notifier == null || redraw == null) {
                return "FAILED: no Observable notifier with b() found on " + adapter.getClass().getName();
            }
            redraw.setAccessible(true);
            redraw.invoke(notifier);
            return "ok (notifier " + notifier.getClass().getName() + ".b())";
        } catch (Throwable t) {
            return "FAILED: " + t;
        }
    }

    /** A named `(List)` method on the adapter, public or not, anywhere up the hierarchy. */
    private static Method findNamed(Class<?> c, String name) {
        if (name == null || name.length() == 0) return null;
        try {
            while (c != null) {
                try {
                    return c.getDeclaredMethod(name, List.class);
                } catch (NoSuchMethodException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
        return null;
    }

    /**
     * The adapter's own submitList, public or not, anywhere up the hierarchy.
     *
     * Only the PLATFORM spelling is looked for here. A minified app renames this method, and the
     * name differs per app - PlayZ and CrexiFy call it `g`, CRICFy calls it `t` - so a guessed
     * one-letter name cannot be right for all of them. This method used to also try `i`, from a
     * misreading of CRICFy: `i(List)` does exist in that dex, but on `Ln14`, where it writes a JSON
     * snapshot into SharedPreferences. It is not a submit, and it is reachable from no adapter.
     *
     * An app whose submit is renamed says so in its profile (`App.setter`), and the setter branch in
     * resubmit() is what runs it - including deciding whether it needs a redraw afterwards. When
     * nothing is found, resubmit() returns quietly, which is the intended failure: the pin is
     * already saved, so the next bind or the next launch shows the truth.
     */
    private static Method findSubmit(Class<?> c) {
        return findNamed(c, "submitList");
    }

    // ------------------------------------------------------------ differ viewport anchor

    private static final Object ADAPTER_RECYCLER_LOCK = new Object();
    private static final WeakHashMap<Object, WeakReference<ViewGroup>> ADAPTER_RECYCLER =
            new WeakHashMap<Object, WeakReference<ViewGroup>>();
    private static final WeakHashMap<Object, WeakReference<ViewGroup>> DIFFER_RECYCLER =
            new WeakHashMap<Object, WeakReference<ViewGroup>>();

    private static final class PendingAnchor {
        final WeakReference<ViewGroup> rvRef;
        final WeakReference<Object> lmRef;
        final int pos, off, preY, expectedGen;
        PendingAnchor(ViewGroup rv, Object lm, int pos, int off, int preY, int expectedGen) {
            this.rvRef = new WeakReference<ViewGroup>(rv);
            this.lmRef = new WeakReference<Object>(lm);
            this.pos = pos;
            this.off = off;
            this.preY = preY;
            this.expectedGen = expectedGen;
        }
    }

    private static final Object PENDING_LOCK = new Object();
    private static final IdentityHashMap<Object, PendingAnchor> PENDING_ANCHORS =
            new IdentityHashMap<Object, PendingAnchor>();

    public static void seeAdapterRecycler(Object rv, Object adapter) {
        if (!(rv instanceof ViewGroup) || adapter == null) return;
        ViewGroup vg = (ViewGroup) rv;
        Object d = differField != null ? field(adapter, differField) : null;
        synchronized (ADAPTER_RECYCLER_LOCK) {
            WeakReference<ViewGroup> ref = new WeakReference<ViewGroup>(vg);
            ADAPTER_RECYCLER.put(adapter, ref);
            if (d != null) DIFFER_RECYCLER.put(d, ref);
        }
        if (lmMeasureCacheField != null) {
            Object mgr = callNoArg(vg, "getLayoutManager");
            if (mgr != null) setBooleanField(mgr, lmMeasureCacheField, false);
        }
    }

    private static ViewGroup findRecyclerForDiffer(Object differ) {
        if (differ == null) return null;
        synchronized (ADAPTER_RECYCLER_LOCK) {
            WeakReference<ViewGroup> ref = DIFFER_RECYCLER.get(differ);
            if (ref != null) {
                ViewGroup rv = ref.get();
                if (rv != null && rv.isAttachedToWindow()) return rv;
            }
        }
        return null;
    }

    private static void invalidateDecorAndCache(ViewGroup g, Object mgr) {
        if (g == null) return;
        if (lmMeasureCacheField != null) {
            Object lm = mgr != null ? mgr : callNoArg(g, "getLayoutManager");
            if (lm != null) setBooleanField(lm, lmMeasureCacheField, false);
        }
        if (rvMarkDirtyMethod != null) {
            callVoidNoArg(g, rvMarkDirtyMethod);
        }
    }

    public static void onDifferCommitted(Object differ) {
        if (differ == null) return;
        PendingAnchor pa;
        synchronized (PENDING_LOCK) {
            pa = PENDING_ANCHORS.remove(differ);
        }
        if (pa == null) {
            if (rvMarkDirtyMethod != null || lmMeasureCacheField != null) {
                ViewGroup g = findRecyclerForDiffer(differ);
                if (g != null && g.isAttachedToWindow()) {
                    invalidateDecorAndCache(g, null);
                    callVoidNoArg(g, "requestLayout");
                }
            }
            return;
        }
        try {
            if (differGenField != null && pa.expectedGen >= 0) {
                int gen = intField(differ, differGenField, -1);
                if (gen != pa.expectedGen) return;
            }
            applyAnchor(pa.rvRef.get(), pa.lmRef.get(), pa.pos, pa.off, pa.preY);
        } catch (Throwable t) {
            trace("onDifferCommitted threw: " + t);
        }
    }

    private static void applyAnchor(ViewGroup g, Object mgr, int pos, int off, int preY) {
        try {
            if (g == null || mgr == null || !g.isAttachedToWindow()) return;
            if (lmStateField != null) setFieldValue(mgr, lmStateField, null);
            setIntField(mgr, lmPosField, pos);
            setIntField(mgr, lmOffField, off);
            invalidateDecorAndCache(g, mgr);
            callVoidNoArg(g, "requestLayout");
            trace("differ commit anchor: pos=" + pos + ", off=" + off + ", preY=" + preY);
        } catch (Throwable t) {
            trace("differ commit anchor threw: " + t);
        }
    }

    public static void submitWithAnchor(Object adapter, List list) {
        if (adapter == null) return;
        try {
            if (differField != null && differSubmitName != null) {
                Object differ = field(adapter, differField);
                Method sub = differ == null ? null : (differCallbackHooked
                        ? findSubmit2(differ.getClass(), differSubmitName)
                        : findMethod2(differ.getClass(), differSubmitName, List.class, Runnable.class));
                if (sub != null) {
                    lastAdapter = new WeakReference<Object>(adapter);
                    if (list != null && !list.isEmpty()) lastList = new WeakReference<List>(list);

                    Object rawCurrent = differRawListField != null
                            ? field(differ, differRawListField) : null;
                    final boolean sameRef = (list == rawCurrent);
                    int anchorPos = -1;
                    int anchorOff = 0;
                    int preYVal = 0;
                    ViewGroup rv = null;
                    Object lm = null;
                    if (list != null && !list.isEmpty() && !sameRef) {
                        rv = findRecyclerForAdapter(adapter);
                        if (rv != null && rv.getChildCount() > 0) {
                            lm = callNoArg(rv, "getLayoutManager");
                            if (lm != null && hasField(lm.getClass(), lmPosField)
                                    && hasField(lm.getClass(), lmOffField)) {
                                preYVal = intCallNoArg(rv, "computeVerticalScrollOffset", 0);
                                if (preYVal <= 0) {
                                    anchorPos = 0;
                                    anchorOff = 0;
                                } else {
                                    List oldList = adapterList(adapter);
                                    View topView = findTopVisibleLiveChild(rv, oldList);
                                    Row topRow = topView != null ? findRowByRoot(topView) : null;
                                    int oldPos = topRow != null ? indexOfId(oldList, topRow.id) : -1;
                                    if (oldPos >= 0 && oldPos < list.size()) {
                                        int span = lmSpanField != null ? intField(lm, lmSpanField, 0) : 0;
                                        if (span <= 0) span = measuredColumns(topView);
                                        if (span <= 1) span = ruleColumns(rv.getContext());
                                        if (span < 1) span = 1;
                                        if (oldPos < span) {
                                            anchorPos = 0;
                                            anchorOff = -preYVal;
                                        } else {
                                            anchorPos = oldPos - (oldPos % span);
                                            int padTop = intCallNoArg(rv, "getPaddingTop", 0);
                                            int decorTop = rectTopField(
                                                    callNoArg(topView, "getLayoutParams"), decorInsetsField);
                                            anchorOff = topView.getTop() - decorTop - padTop;
                                        }
                                    }
                                }
                            }
                        }
                    }

                    sub.setAccessible(true);
                    if (differCallbackHooked) {
                        if (anchorPos >= 0) {
                            int preGen = differGenField != null
                                    ? intField(differ, differGenField, -1) : -1;
                            int expGen = preGen >= 0 ? preGen + 1 : -1;
                            synchronized (PENDING_LOCK) {
                                PENDING_ANCHORS.put(differ,
                                        new PendingAnchor(rv, lm, anchorPos, anchorOff, preYVal, expGen));
                            }
                        } else {
                            synchronized (PENDING_LOCK) {
                                PENDING_ANCHORS.remove(differ);
                            }
                        }
                        try {
                            sub.invoke(differ, list, null);
                        } catch (Throwable invokeErr) {
                            synchronized (PENDING_LOCK) {
                                PENDING_ANCHORS.remove(differ);
                            }
                            throw invokeErr;
                        }
                        return;
                    }

                    Runnable onCommitted = null;
                    if (anchorPos >= 0) {
                        final int fPos = anchorPos;
                        final int fOff = anchorOff;
                        final int fPreY = preYVal;
                        final WeakReference<ViewGroup> rvRef = new WeakReference<ViewGroup>(rv);
                        final WeakReference<Object> lmRef = new WeakReference<Object>(lm);
                        onCommitted = new Runnable() {
                            public void run() {
                                applyAnchor(rvRef.get(), lmRef.get(), fPos, fOff, fPreY);
                            }
                        };
                    }
                    sub.invoke(differ, list, onCommitted);
                    return;
                }
            }
        } catch (Throwable t) {
            trace("submitWithAnchor fell back: " + t);
        }
        try {
            Method setter = findNamed(adapter.getClass(), app.setter);
            if (setter != null) {
                setter.setAccessible(true);
                setter.invoke(adapter, list);
            }
        } catch (Throwable ignored) { }
    }

    private static ViewGroup findRecyclerForAdapter(Object adapter) {
        if (adapter == null) return null;
        try {
            synchronized (ADAPTER_RECYCLER_LOCK) {
                WeakReference<ViewGroup> ref = ADAPTER_RECYCLER.get(adapter);
                if (ref != null) {
                    ViewGroup rv = ref.get();
                    if (rv != null && rv.isAttachedToWindow()) return rv;
                }
            }
            List<Row> snap;
            synchronized (ROW_LOCK) {
                snap = new ArrayList<Row>(rows.values());
            }
            ViewGroup fallback = null;
            for (int i = 0; i < snap.size(); i++) {
                Row r = snap.get(i);
                if (r == null || r.root == null || !r.root.isAttachedToWindow()) continue;
                Object p = r.root.getParent();
                if (!(p instanceof ViewGroup)) continue;
                ViewGroup vg = (ViewGroup) p;
                Object rvAd = callNoArg(vg, "getAdapter");
                if (rvAd == adapter) return vg;
                if (fallback == null && adapter == lastAdapter.get()
                        && (rvAd != null || vg.getClass().getName().endsWith("RecyclerView"))) {
                    fallback = vg;
                }
            }
            return fallback;
        } catch (Throwable ignored) { }
        return null;
    }

    private static View findTopVisibleLiveChild(ViewGroup rv, List oldList) {
        View best = null;
        int bestTop = Integer.MAX_VALUE;
        int bestLeft = Integer.MAX_VALUE;
        try {
            int n = rv.getChildCount();
            for (int i = 0; i < n; i++) {
                View c = rv.getChildAt(i);
                if (c == null) continue;
                int h = c.getHeight();
                if (h <= 0) continue;
                int top = c.getTop();
                if (top + h <= 0) continue;
                if (intCallNoArg(c, "getVisibility", 0) != 0) continue;
                if (oldList != null) {
                    Row r = findRowByRoot(c);
                    if (r == null || indexOfId(oldList, r.id) < 0) continue;
                }
                int left = intCallNoArg(c, "getLeft", 0);
                if (top < bestTop || (top == bestTop && left < bestLeft)) {
                    best = c;
                    bestTop = top;
                    bestLeft = left;
                }
            }
        } catch (Throwable ignored) { }
        return best;
    }

    private static Row findRowByRoot(View root) {
        if (root == null) return null;
        try {
            synchronized (ROW_LOCK) {
                for (Row r : rows.values()) {
                    if (r != null && r.root == root) return r;
                }
            }
        } catch (Throwable ignored) { }
        return null;
    }

    private static int indexOfId(List list, String id) {
        if (list == null || id == null) return -1;
        try {
            for (int i = 0; i < list.size(); i++) {
                Object item = list.get(i);
                if (item == null) continue;
                Object fid = field(item, idFieldName());
                if (fid != null && id.equals(String.valueOf(fid))) return i;
            }
        } catch (Throwable ignored) { }
        return -1;
    }

    private static Method findMethod2(Class<?> c, String name, Class<?> p1, Class<?> p2) {
        if (name == null || name.length() == 0) return null;
        while (c != null) {
            try {
                return c.getDeclaredMethod(name, p1, p2);
            } catch (NoSuchMethodException e) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static Method findSubmit2(Class<?> c, String name) {
        if (name == null || name.length() == 0) return null;
        while (c != null) {
            for (Method m : c.getDeclaredMethods()) {
                if (!name.equals(m.getName())) continue;
                Class<?>[] ps = m.getParameterTypes();
                if (ps.length == 2 && List.class.isAssignableFrom(ps[0])) return m;
            }
            c = c.getSuperclass();
        }
        return null;
    }

    private static int rectTopField(Object target, String name) {
        if (target == null || name == null || name.length() == 0) return 0;
        try {
            Object v = field(target, name);
            if (v != null) return intField(v, "top", 0);
        } catch (Throwable ignored) { }
        return 0;
    }

    private static int intField(Object target, String name, int fallback) {
        if (target == null || name == null || name.length() == 0) return fallback;
        try {
            Class<?> c = target.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    return f.getInt(target);
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
        return fallback;
    }

    private static boolean hasField(Class<?> c, String name) {
        if (name == null || name.length() == 0) return false;
        while (c != null) {
            try {
                c.getDeclaredField(name);
                return true;
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            }
        }
        return false;
    }

    private static void setIntField(Object target, String name, int val) throws Exception {
        Class<?> c = target.getClass();
        while (c != null) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                f.setInt(target, val);
                return;
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static void setFieldValue(Object target, String name, Object val) {
        try {
            Class<?> c = target.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    f.set(target, val);
                    return;
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
    }

    private static void setBooleanField(Object target, String name, boolean val) {
        if (target == null || name == null || name.length() == 0) return;
        try {
            Class<?> c = target.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    f.setBoolean(target, val);
                    return;
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
    }

    private static Object callNoArg(Object target, String name) {
        try {
            Method m = target.getClass().getMethod(name);
            return m.invoke(target);
        } catch (Throwable ignored) { }
        return null;
    }

    private static void callVoidNoArg(Object target, String name) {
        try {
            Method m = target.getClass().getMethod(name);
            m.invoke(target);
        } catch (Throwable ignored) { }
    }

    private static int intCallNoArg(Object target, String name, int fallback) {
        try {
            Object v = callNoArg(target, name);
            if (v instanceof Number) return ((Number) v).intValue();
        } catch (Throwable ignored) { }
        return fallback;
    }

    // ------------------------------------------------------------ reflection

    private static Object field(Object target, String name) {
        try {
            if (target == null) return null;
            Class<?> c = target.getClass();
            while (c != null) {
                try {
                    Field f = c.getDeclaredField(name);
                    f.setAccessible(true);
                    return f.get(target);
                } catch (NoSuchFieldException e) {
                    c = c.getSuperclass();
                }
            }
        } catch (Throwable ignored) { }
        return null;
    }
}
