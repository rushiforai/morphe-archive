package app.morphe.extension.syncforreddit.ui.nav;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import androidx.annotation.Nullable;

import com.google.android.material.badge.BadgeDrawable;
import com.google.android.material.navigation.NavigationBarView;
import com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.ActionsBottomSheetFragment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * Choosing what the bottom navigation bar shows.
 *
 * <p>The bar is a menu of four: Posts, Actions, Explore and Inbox. Each of them can be left as
 * it is, taken off, or <i>replaced</i> — the button stays where it is and carries out one of the
 * actions from Sync's own actions sheet instead, drawn with the name and the icon Sync gives it
 * there. One further button is added beside them for the one place Material leaves spare.
 *
 * <p>Replacing rather than only hiding is what makes more than one extra button possible at all.
 * Material caps the bottom bar at five items and the rail at seven, and the count it checks is
 * {@code menu.size()}, which counts the items the bar is not drawing as well as the ones it is —
 * so taking an item off does not make room for another, and the bar, which already declares
 * four, has room for exactly one more. A replaced button needs no room: it is an item the app
 * already had.
 *
 * <p>Where a button is left alone, what the app itself decided still decides. Sync hides Actions
 * unless its own setting asks for it and hides Inbox while nobody is signed in, and a switch of
 * ours that put either back would be overruling the app rather than adding to it. So what is
 * remembered is the bar as the app left it, and showing is only ever within that. Replacing is
 * different, and deliberately so: a button carrying out an action is no longer the thing the app
 * made that decision about, so a reader who has turned Sync's own actions item off can still put
 * an action of their choosing in its place.
 *
 * <p>The unread badge follows the inbox. Sync draws it on the inbox item by id, from a method
 * this stands in for entirely, so wherever the inbox has been put — left where it was, chosen as
 * the action on another button, or on the added one — that is where the count is drawn, and no
 * other button is left wearing it.
 *
 * <p>The tablet rail is the same class of thing and is covered the same way. Its fifth item,
 * Settings, has no setting of ours and is left alone.
 */
public final class BottomNavigationItems {
    /**
     * Each item, as the name of its id in the app's resources beside the name of the setting
     * that says what to do with it.
     *
     * <p>In the order the bottom bar draws them, which is the order the settings are read in and
     * the order the last button standing is chosen from. The rail draws the same four in an order
     * of its own — Posts, Explore, Inbox, Actions — so this is not the order of either bar as
     * such, and nothing here may depend on it beyond settling a tie.
     */
    private static final String[][] OURS = {
            {"menu_posts", "sync_up_nav_posts"},
            {"menu_actions", "sync_up_nav_actions"},
            {"menu_explore", "sync_up_nav_explore"},
            {"menu_messages", "sync_up_nav_inbox"},
    };

    /** Where the inbox sits in the list above, since the badge is about that one. */
    private static final int INBOX = 3;

    /** Where the actions button sits, since Sync's own switch for it is answered from here. */
    private static final int ACTIONS = 1;

    /**
     * Sync's own switch for whether the actions button is on the bar, which the second row has
     * taken over. Its own row is hidden, and what the reader chooses here is written back to it.
     *
     * <p>Written rather than merely ignored: it is a setting of Sync's like any other, it travels
     * in a backup, and the bar's constructor is what reads it, so leaving it saying one thing
     * while the bar shows another would come back as a bug the next time the app starts.
     */
    private static final String ITS_OWN_ACTIONS = "navigation_bottom_actions";

    /** The button added beside the app's own, for the one place Material leaves spare. */
    private static final String EXTRA_KEY = "sync_up_nav_extra";

    /** What every one of those settings begins with, which is what is listened for. */
    private static final String PREFIX = "sync_up_nav_";

    /**
     * What the added button is marked with. Ours to choose, since nothing looks it up in the
     * app's resources, and well clear of the ids the app's own are given.
     */
    private static final int EXTRA_ID = 0x7E0000A1;


    /** Left as the app drew it. The default, so that the bar is Sync's until something is asked. */
    private static final int SHOW = -2;

    /** Taken off the bar. */
    private static final int HIDE = -1;

    /** What the added button holds when it holds nothing. */
    private static final int NOTHING = -1;

    /**
     * Sync's own number for the inbox among its actions, which is the one the unread count
     * follows onto a button that has been given it.
     */
    private static final int INBOX_ACTION = 21;

    /**
     * Sync's badge, as Sync builds it, so that a count drawn on a button it has moved to looks
     * like the one that moved rather than like Material's default.
     */
    private static final int BADGE_CHARACTERS = 3;
    private static final int BADGE_ACROSS_DP = 4;
    private static final int BADGE_DOWN_DP = 3;
    private static final int BADGE_GROUND = -42495;
    private static final int BADGE_TEXT = -1;

    /** The ids the names above stand for, looked up once. Zero where there is no such id. */
    @Nullable
    private static int[] ids;

    /** What is remembered about one bar. Only ever read and written on the drawing thread. */
    private static final class Its {
        /** The ids of the items the app had showing, before anything of ours touched them. */
        int[] shown = new int[0];

        /** What each of the app's own buttons was called and drawn with, to be given back. */
        final CharSequence[] titles = new CharSequence[OURS.length];
        final Drawable[] icons = new Drawable[OURS.length];

        /** Whether the items of ours have been put on this bar, which is done once. */
        boolean carriesOurs;
    }

    /**
     * Every bar on the screen, against what is remembered about it. Weakly, so that a bar
     * belonging to a screen that has gone takes its note with it.
     */
    private static final Map<NavigationBarView, Its> bars = new WeakHashMap<>();

    /** Which settings the reader is being listened to through, so as not to listen twice. */
    @Nullable
    private static SharedPreferences listeningTo;

    private BottomNavigationItems() {}

    /**
     * Called as a bar finishes dressing itself, which is once as it is built and again every
     * time the theme or the settings change.
     */
    public static void attach(View view) {
        try {
            NavigationBarView bar = barOf(view);
            if (bar == null) {
                return;
            }
            Menu menu = bar.g();
            if (menu != null) {
                addOurItems(bar, menu);
                apply(bar, menu);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "nav: could not draw the bar: " + ex);
        }
    }

    /**
     * Stands in for the method Sync draws its unread badge from, on both bars, so that the count
     * is drawn wherever the inbox has been put rather than only on the item it started on.
     *
     * <p>The whole of Sync's own is replaced rather than added to because several things call
     * it — the bar being dressed, a message arriving, the bar being attached — and a correction
     * appended to one of those paths would be undone by the next. What it does is reproduced
     * exactly, down to the colours and the offsets, for the case this is mostly in: the inbox
     * left where Sync put it.
     */
    public static void badges(View view) {
        try {
            NavigationBarView bar = barOf(view);
            if (bar == null) {
                return;
            }
            Its its = bars.get(bar);
            int wears = whereTheInboxIs(its);
            int count = z7.a.a();
            for (int at = 0; at < OURS.length; at++) {
                int id = idOf(at);
                if (id != 0 && id != wears) {
                    bar.o(id);
                }
            }
            if (wears != EXTRA_ID) {
                bar.o(EXTRA_ID);
            }
            if (wears == 0) {
                Logger.printDebug(() -> "nav: the inbox is not on the bar, so neither is its count");
                return;
            }
            if (count <= 0) {
                bar.o(wears);
                return;
            }
            BadgeDrawable badge = bar.k(wears);
            badge.L(true);
            badge.E(BADGE_CHARACTERS);
            badge.I(t7.f0.c(BADGE_ACROSS_DP));
            badge.B(t7.f0.c(BADGE_DOWN_DP));
            badge.F(count);
            badge.z(BADGE_GROUND);
            badge.A(BADGE_TEXT);
            final int on = wears;
            Logger.printDebug(() -> "nav: " + count + " unread, drawn on " + Integer.toHexString(on));
        } catch (Exception ex) {
            Logger.printInfo(() -> "nav: could not draw the unread count: " + ex);
        }
    }

    /**
     * Whether this tap was for a button of ours, and if it was, carries out what the button was
     * given. Called before Sync's own dispatch, which goes on to answer every id but ours.
     *
     * @return Whether the tap has been dealt with. Answering {@code true} is what also keeps
     *         Material from drawing the button as the one selected, since a button that carries
     *         out an action is not somewhere the app has gone.
     */
    public static boolean claimed(Context context, MenuItem item) {
        try {
            if (item == null) {
                return false;
            }
            int id = item.getItemId();
            int action = NOTHING;
            if (id == EXTRA_ID) {
                action = extra();
            } else {
                for (int at = 0; at < OURS.length; at++) {
                    if (idOf(at) == id) {
                        int chosen = choice(at);
                        action = chosen >= 0 ? chosen : NOTHING;
                        break;
                    }
                }
            }
            if (action == NOTHING) {
                return false;
            }
            carryOut(context, action);
            return true;
        } catch (Exception ex) {
            Logger.printInfo(() -> "nav: could not answer the tap: " + ex);
            return false;
        }
    }





    /** Carries out one of Sync's own actions, the way Sync's own actions sheet carries it out. */
    private static void carryOut(Context context, int action) {
        try {
            String about = t7.j.b(context);
            Logger.printDebug(() -> "nav: carrying out action " + action + " for r/" + about);
            ActionsBottomSheetFragment.w4(t7.j.a(context), t7.j.g(context), about, action, null);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "nav: action " + action + " failed: " + ex);
        }
    }

    /**
     * The bar this view is, having made a note of it as the app left it if it has not been seen
     * before.
     *
     * @return Null where the view is not a navigation bar at all.
     */
    @Nullable
    private static NavigationBarView barOf(View view) {
        if (!(view instanceof NavigationBarView)) {
            Logger.printInfo(() -> "nav: " + view + " is not a navigation bar");
            return null;
        }
        NavigationBarView bar = (NavigationBarView) view;
        Menu menu = bar.g();
        if (menu == null) {
            return bar;
        }
        if (!bars.containsKey(bar)) {
            // Taken before anything of ours has touched the bar, and kept, since afterwards
            // there is no telling what the app wanted from what a setting has done.
            Its its = new Its();
            its.shown = asTheAppLeftIt(menu);
            for (int at = 0; at < OURS.length; at++) {
                int id = idOf(at);
                MenuItem item = id == 0 ? null : menu.findItem(id);
                if (item != null) {
                    its.titles[at] = item.getTitle();
                    its.icons[at] = item.getIcon();
                }
            }
            bars.put(bar, its);
            listen();
        }
        return bar;
    }

    /** @return The ids of the items the app had showing, in the order the bar holds them. */
    private static int[] asTheAppLeftIt(Menu menu) {
        List<Integer> showing = new ArrayList<>();
        for (int at = 0; at < menu.size(); at++) {
            MenuItem item = menu.getItem(at);
            if (item != null && item.isVisible()) {
                showing.add(item.getItemId());
            }
        }
        int[] found = new int[showing.size()];
        for (int at = 0; at < found.length; at++) {
            found[at] = showing.get(at);
        }
        Logger.printDebug(() -> "nav: the app is showing " + found.length + " items");
        return found;
    }

    /**
     * Puts the added button on the bar, once, so far as Material has room for it.
     *
     * <p>Added whether or not anything has been chosen for it, and hidden while nothing has: the
     * room is taken at a moment that can be reasoned about rather than the first time a reader
     * chooses something, and nothing else in the app ever adds an item.
     */
    private static void addOurItems(NavigationBarView bar, Menu menu) {
        Its its = bars.get(bar);
        if (its == null || its.carriesOurs) {
            return;
        }
        // Marked as carried however this goes: a bar that has no room will have no room the next
        // time it is dressed either, and asking again every time would mean a refused addition on
        // every frame.
        its.carriesOurs = true;
        add(bar, menu, EXTRA_ID, "the added button");
    }

    /** Puts one item of ours on the bar, hidden, if there is room for it. */
    private static void add(NavigationBarView bar, Menu menu, int id, String what) {
        try {
            if (menu.findItem(id) != null) {
                return;
            }
            int room = bar.f();
            if (menu.size() >= room) {
                Logger.printInfo(() -> "nav: no room for " + what + ", with Material counting "
                        + menu.size() + " of the " + room + " it allows");
                return;
            }
            MenuItem added = menu.add(0, id, menu.size(), "");
            added.setCheckable(false);
            added.setVisible(false);
            Logger.printDebug(() -> "nav: room for " + what);
        } catch (Exception ex) {
            // Material answers an item too many by throwing, which is the one case worth carrying
            // on from: the bar is simply the bar without it.
            Logger.printInfo(() -> "nav: could not add " + what + ": " + ex);
        }
    }

    /** Draws the bar as the settings ask, within what the app itself was showing. */
    private static void apply(NavigationBarView bar, Menu menu) {
        Its its = bars.get(bar);
        if (its == null) {
            return;
        }

        reconcile();

        int[] wanted = new int[OURS.length];
        int keeping = 0;
        for (int at = 0; at < OURS.length; at++) {
            int id = idOf(at);
            int chosen = choice(at);
            if (id == 0 || (chosen == SHOW && !ours(at) && !holds(its.shown, id))) {
                // Not on this bar, or left alone and the app is not showing it. Either way not
                // ours to draw. A replacement is drawn whether the app was showing it or not:
                // the button is no longer the thing the app decided about.
                wanted[at] = HIDE;
                continue;
            }
            wanted[at] = chosen;
            if (chosen != HIDE) {
                keeping++;
            }
        }

        int added = extra();
        if (added != NOTHING) {
            keeping++;
        }

        // Something has to be left to tap. Where every button has been turned off, the first
        // the bar had stays as it was — an empty bar is a strip of nothing taking up room, and
        // the app's own Use bottom navigation is what takes the bar away.
        if (keeping == 0 && !anythingElse(its.shown)) {
            for (int at = 0; at < OURS.length; at++) {
                int id = idOf(at);
                if (id != 0 && holds(its.shown, id)) {
                    wanted[at] = SHOW;
                    Logger.printDebug(() -> "nav: keeping the first button, since all were off");
                    break;
                }
            }
        }

        for (int at = 0; at < OURS.length; at++) {
            int id = idOf(at);
            if (id == 0) {
                continue;
            }
            MenuItem item = menu.findItem(id);
            if (item == null) {
                continue;
            }
            dress(item, wanted[at], its.titles[at], its.icons[at]);
        }

        MenuItem extra = menu.findItem(EXTRA_ID);
        if (extra != null) {
            dress(extra, added, null, null);
        }

        final String which = bar.getClass().getSimpleName();
        Logger.printDebug(() -> "nav: " + which + " showing " + showing(menu));

        // After the items, so that a badge is put on a button that is already the shape it is
        // going to be. Material rebuilds the item views as visibility changes and hangs the
        // badges back on by id, but asking in this order means not having to rely on that.
        badges(bar);
    }

    /**
     * Draws one button as it has been asked for: left as the app had it, taken off, or carrying
     * out one of Sync's actions under that action's own name and icon.
     *
     * @param title What the app called it, where it is the app's own button.
     * @param icon  What the app drew it with, the same.
     */
    private static void dress(MenuItem item, int asked, @Nullable CharSequence title,
                              @Nullable Drawable icon) {
        if (asked == HIDE) {
            if (item.isVisible()) {
                item.setVisible(false);
            }
            return;
        }
        if (asked == SHOW) {
            if (title != null) {
                item.setTitle(title);
            }
            if (icon != null) {
                item.setIcon(icon);
            }
            if (!item.isVisible()) {
                item.setVisible(true);
            }
            return;
        }
        // One of Sync's own actions, named and drawn as its own sheet names and draws it. The
        // name carries a line break where the sheet shows it on two lines, which a button under
        // an icon has no room for.
        try {
            String called = t7.b.h(asked);
            item.setTitle(called == null ? "" : called.replace('\n', ' '));
            item.setIcon(t7.b.d(asked));
            if (!item.isVisible()) {
                item.setVisible(true);
            }
        } catch (Exception ex) {
            // Sync answers a number it does not know by throwing. Nothing offers one, so this
            // is a setting written by hand: the button goes off rather than the bar coming down.
            Logger.printInfo(() -> "nav: no action numbered " + asked + ": " + ex);
            item.setVisible(false);
        }
    }

    /**
     * Which button the unread count belongs on.
     *
     * <p>The inbox left where it was comes first, but only while it is a button the reader can
     * actually see: the app takes it off the bottom bar whenever nobody is signed in, and a count
     * put there would be attached to nothing. Where it has gone, a button that has been given the
     * inbox action is the next best thing, and those are drawn whatever the app decided.
     *
     * @param its What the bar looked like before any of this, or null where it has not been seen.
     * @return The id of the button holding the inbox, or zero where the inbox is not on the bar.
     */
    private static int whereTheInboxIs(@Nullable Its its) {
        int own = idOf(INBOX);
        if (choice(INBOX) == SHOW && own != 0 && its != null && holds(its.shown, own)) {
            return own;
        }
        for (int at = 0; at < OURS.length; at++) {
            if (choice(at) == INBOX_ACTION) {
                return idOf(at);
            }
        }
        return extra() == INBOX_ACTION ? EXTRA_ID : 0;
    }

    /**
     * Whether what this button shows is ours to decide rather than the app's.
     *
     * <p>True of the actions button alone, whose switch this has taken over. Everywhere else the
     * app keeps the last word on whether a button appears at all — it takes the inbox off while
     * nobody is signed in — and Show is only ever within what it was already drawing.
     */
    private static boolean ours(int at) {
        return at == ACTIONS;
    }

    /**
     * Keeps Sync's own switch for the actions button saying what the second row says, and, the
     * first time, makes the second row say what that switch already said.
     *
     * <p>The reader who had turned Sync's switch on keeps their actions button, and the one who
     * had not keeps it off: the row arrives holding what they already had rather than a default
     * that quietly changes it. Afterwards the row is what decides and the switch follows it.
     */
    private static void reconcile() {
        SharedPreferences store = SyncUpSettings.store();
        if (store == null) {
            return;
        }
        try {
            String key = OURS[ACTIONS][1];
            if (!store.contains(key)) {
                boolean had = store.getBoolean(ITS_OWN_ACTIONS, false);
                store.edit().putString(key, Integer.toString(had ? SHOW : HIDE)).apply();
                Logger.printDebug(() -> "nav: the actions button starts as Sync had it: " + had);
            }
            boolean asked = choice(ACTIONS) == SHOW;
            if (store.getBoolean(ITS_OWN_ACTIONS, false) != asked) {
                store.edit().putBoolean(ITS_OWN_ACTIONS, asked).apply();
                Logger.printDebug(() -> "nav: told Sync the actions button is " + asked);
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "nav: could not answer Sync's own actions switch: " + ex);
        }
    }

    /** @return What the button at this place in the list above has been asked to be. */
    private static int choice(int at) {
        return SyncUpSettings.number(OURS[at][1], SHOW);
    }

    /** @return The action the added button has been given, or nothing. */
    private static int extra() {
        int chosen = SyncUpSettings.number(EXTRA_KEY, NOTHING);
        return chosen < 0 ? NOTHING : chosen;
    }

    /** @return What the bar is left drawing, named as each button is named. */
    private static String showing(Menu menu) {
        StringBuilder said = new StringBuilder("[");
        for (int at = 0; at < menu.size(); at++) {
            MenuItem item = menu.getItem(at);
            if (item == null || !item.isVisible()) {
                continue;
            }
            if (said.length() > 1) {
                said.append(", ");
            }
            said.append(item.getTitle());
        }
        return said.append(']').toString();
    }

    /** @return Whether the bar holds anything beyond the items that have a setting of their own. */
    private static boolean anythingElse(int[] itsOwn) {
        for (int id : itsOwn) {
            boolean ours = false;
            for (int at = 0; at < OURS.length; at++) {
                if (idOf(at) == id) {
                    ours = true;
                    break;
                }
            }
            if (!ours) {
                return true;
            }
        }
        return false;
    }

    /** @return The id of the item at this place in the list above, or zero where there is none. */
    private static int idOf(int at) {
        int[] found = ids;
        if (found == null) {
            found = new int[OURS.length];
            for (int index = 0; index < OURS.length; index++) {
                found[index] = ResourceUtils.getIdentifier(ResourceType.ID, OURS[index][0]);
                if (found[index] == 0) {
                    final String name = OURS[index][0];
                    Logger.printInfo(() -> "nav: the app has no " + name);
                }
            }
            ids = found;
        }
        return found[at];
    }

    private static boolean holds(int[] ids, int id) {
        for (int held : ids) {
            if (held == id) {
                return true;
            }
        }
        return false;
    }

    /**
     * Draws every bar again when one of the settings changes, so that a setting turned over has
     * taken effect by the time the reader is back on the feed. The screen behind the settings is
     * not rebuilt on the way back, so nothing else would ask.
     */
    private static void listen() {
        SharedPreferences store = SyncUpSettings.store();
        if (store == null || store == listeningTo) {
            return;
        }
        // Changing account changes which file the settings are in, so a listener on the old one
        // would never be told. The one left behind does no harm: what it calls reads whichever
        // file is now in use.
        listeningTo = store;
        SyncUpSettings.whenChanged(PREFIX, () -> Utils.runOnMainThread(BottomNavigationItems::again));
    }

    /** Draws every bar still on the screen again. */
    private static void again() {
        try {
            for (NavigationBarView bar : new ArrayList<>(bars.keySet())) {
                if (bar == null) {
                    continue;
                }
                Menu menu = bar.g();
                if (menu != null) {
                    apply(bar, menu);
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "nav: could not draw the bar again: " + ex);
        }
    }
}
