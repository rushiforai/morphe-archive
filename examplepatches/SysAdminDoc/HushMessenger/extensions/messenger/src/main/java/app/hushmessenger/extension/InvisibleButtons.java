package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inspector.WindowInspector;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Invisible buttons (#191). A button picked in settings is drawn invisible, or at a quarter, half or three quarters of
 * how it looks, while it keeps its place, its size, the area that answers a tap and whatever it did before, so a screen
 * can lose the clutter of a button without losing the button. Hiding one outright takes its tap area with it, which is
 * the part people miss.
 *
 * Every Messenger screen is looked over (the chat list, a chat, the other pages) along with every menu, sheet and dialog
 * that opens over one, so HushMessenger's own buttons on those screens count too. Each button is known by the name a
 * screen reader says for it, which is the only name a drawn button keeps, and settings list the ones Messenger has shown
 * so far. HushMessenger's buttons that show their words instead of a spoken name register those words through [own],
 * since text on Messenger's own views is often a person's name and isn't kept. That name is in the language Messenger
 * is in, so switching language fills the list again. A screen's
 * scrolling lists are left alone, since those rows are chats, people and messages; a menu's list that fits without
 * scrolling is its buttons, so those are taken. HushMessenger settings are never touched.
 * Each name also keeps where it was first seen (the chat list or another screen, a chat's top bar, its message box, among
 * its messages, a menu, or HushMessenger's own), which settings groups the list by. [InvisibleButtonsPick] lets a
 * button be picked by tapping it on screen.
 * Public, since the calls come from Messenger's own chat fragment and Application in other packages.
 */
public final class InvisibleButtons {
    static final String KEY = "invisible_buttons";
    private static final String SEEN = "invisible_buttons_seen";
    static final String LEVELS = "invisible_buttons_levels";
    /** Where the first build kept its picks, every one fully invisible. Read as 0 until the next change moves them. */
    static final String HIDDEN = "invisible_buttons_hidden";
    /** The levels settings offer, in percent of how Messenger draws the button. 100 is Messenger's own. */
    static final int[] LEVELS_OFFERED = {0, 25, 50, 75, 100};
    /** More than Messenger shows across its screens, so a name from an older build drops off the list in time. */
    static final int REMEMBERED = 80;
    /** The longest spoken name kept. Anything longer is a sentence rather than a button. */
    private static final int MAX_NAME = 60;
    /** A screen lays itself out constantly, so a walk waits at least this long after the last one. */
    static final long LOOK_MS = 400;
    private static final String OURS = "app.hushmessenger.";

    /** Every view watched, true for a menu's window, whose lists that fit are its buttons. */
    private static final Map<View, Boolean> watched = new WeakHashMap<>();
    /** Every button drawn lighter: the alpha Messenger had on it, then the one it was given. */
    private static final Map<View, float[]> dimmed = new WeakHashMap<>();
    /** When each watched view was last walked. */
    private static final Map<View, Long> lastLook = new WeakHashMap<>();
    /** Bumped whenever a level changes, so the next layout walks even inside the quiet window. */
    private static volatile int generation;
    private static final Map<View, Integer> lookedAt = new WeakHashMap<>();
    /** HushMessenger's own buttons that show words rather than a spoken name, with those words (#191). */
    private static final Map<View, String> ownNames = new WeakHashMap<>();
    /** Where each button was first seen, one place, a tab and the name per line, so settings can group the list. */
    static final String PLACES = "invisible_buttons_places";
    static final String PLACE_SCREEN = "screen";
    static final String PLACE_HEADER = "header";
    static final String PLACE_COMPOSER = "composer";
    static final String PLACE_CHAT = "chat";
    static final String PLACE_MENU = "menu";
    static final String PLACE_OURS = "ours";
    /** The order settings shows the groups in. A name seen before places were kept goes last, on its own. */
    static final List<String> PLACES_SHOWN = java.util.Collections.unmodifiableList(java.util.Arrays.asList(
        PLACE_SCREEN, PLACE_HEADER, PLACE_COMPOSER, PLACE_CHAT, PLACE_MENU, PLACE_OURS));
    /** A chat with no message list in it, where every button counts as inside the chat. */
    private static final int[] NO_LIST = {Integer.MIN_VALUE, Integer.MAX_VALUE};
    /** The views Messenger's chat fragment hands over. Their buttons go by where they sit around the messages. */
    private static final Map<View, Boolean> chats = new WeakHashMap<>();
    /** The clock the walk paces itself by. Tests move it by hand. */
    static java.util.function.LongSupplier clock = android.os.SystemClock::uptimeMillis;
    private static Application watching;
    private static Application.ActivityLifecycleCallbacks screens;

    private InvisibleButtons() { }

    static void resetForTests() {
        if (watching != null) watching.unregisterActivityLifecycleCallbacks(screens);
        watching = null;
        screens = null;
        watched.clear();
        dimmed.clear();
        lastLook.clear();
        lookedAt.clear();
        ownNames.clear();
        chats.clear();
        InvisibleButtonsPick.resetForTests();
        generation = 0;
        clock = android.os.SystemClock::uptimeMillis;
    }

    /** Messenger's Application, on its way in: from here on every screen it shows is looked over. */
    static void register(Application app) {
        if (app == null || watching != null) return;
        screens = new Screens();
        watching = app;
        app.registerActivityLifecycleCallbacks(screens);
    }

    private static final class Screens implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityResumed(Activity activity) { screenShown(activity); }
        @Override public void onActivityCreated(Activity activity, Bundle state) { }
        @Override public void onActivityStarted(Activity activity) { }
        @Override public void onActivityPaused(Activity activity) { }
        @Override public void onActivityStopped(Activity activity) { }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
        @Override public void onActivityDestroyed(Activity activity) { }
    }

    /** A Messenger screen coming to the front. Called whether the switch is on or off. */
    static void screenShown(Activity activity) {
        try {
            if (activity == null || ours(activity) || activity.getWindow() == null) return;
            View screen = activity.getWindow().peekDecorView();
            if (screen == null) return;
            watch(screen, false);
            if (screen.isAttachedToWindow()) look(screen, true);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the screen's buttons", error);
        }
    }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off. */
    public static void chatShown(Object fragment, View view) {
        try {
            if (view == null) return;
            chats.put(view, true);
            watch(view, false);
            if (view.isAttachedToWindow()) look(view, true);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't look over the chat's buttons", error);
        }
    }

    /**
     * Walks [view] as it lays itself out and gives its buttons back when it goes. A window that loses focus has just had
     * a menu, sheet or dialog open over it, so that's when the menus are looked for.
     */
    private static void watch(View view, boolean menu) {
        if (watched.containsKey(view)) return;
        watched.put(view, menu);
        ViewTreeObserver.OnGlobalLayoutListener onLayout = () -> look(view, false);
        ViewTreeObserver.OnWindowFocusChangeListener onFocus = focused -> {
            if (!focused) view.post(InvisibleButtons::findMenus);
        };
        view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View attached) {
                listen(attached, onLayout, onFocus);
                look(attached, true);
            }

            @Override public void onViewDetachedFromWindow(View detached) {
                ViewTreeObserver observer = detached.getViewTreeObserver();
                observer.removeOnGlobalLayoutListener(onLayout);
                observer.removeOnWindowFocusChangeListener(onFocus);
                give(detached);
            }
        });
        if (view.isAttachedToWindow()) listen(view, onLayout, onFocus);
    }

    private static void listen(View view, ViewTreeObserver.OnGlobalLayoutListener onLayout,
            ViewTreeObserver.OnWindowFocusChangeListener onFocus) {
        ViewTreeObserver observer = view.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(onLayout);
        observer.addOnWindowFocusChangeListener(onFocus);
    }

    /** Watches every menu, sheet and dialog window open over Messenger that isn't watched yet. */
    static void findMenus() {
        try {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q || !Settings.wouldUse(KEY)) return;
            for (View window : WindowInspector.getGlobalWindowViews()) {
                if (window == null || watched.containsKey(window) || !isMenu(window) || ours(window.getContext())) continue;
                watch(window, true);
                if (window.isAttachedToWindow()) look(window, true);
            }
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over Messenger's menus", error);
        }
    }

    /**
     * A dialog, a sheet or a pop-up menu. A screen's own window comes from its activity instead, and anything else (a
     * chat head, a call's floating window) isn't a menu.
     */
    static boolean isMenu(View window) {
        ViewGroup.LayoutParams params = window.getLayoutParams();
        if (!(params instanceof WindowManager.LayoutParams)) return false;
        int type = ((WindowManager.LayoutParams) params).type;
        return type == WindowManager.LayoutParams.TYPE_APPLICATION
            || (type >= WindowManager.LayoutParams.FIRST_SUB_WINDOW && type <= WindowManager.LayoutParams.LAST_SUB_WINDOW);
    }

    /** True for HushMessenger's own pages, whose buttons are never this control's to touch. */
    static boolean ours(Context context) {
        for (int depth = 0; context != null && depth < 16; depth++) {
            if (context instanceof Activity) return context.getClass().getName().startsWith(OURS);
            if (!(context instanceof ContextWrapper)) return false;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return false;
    }

    /**
     * Walks [view] for buttons, notes the ones it hasn't seen and draws the picked ones at their level. [now] walks
     * whatever the clock says, which is how a screen opening and a change in settings are answered at once.
     */
    static void look(View view, boolean now) {
        try {
            if (view == null) return;
            InvisibleButtonsPick.sync(view);
            if (!Settings.wouldUse(KEY)) {
                give(view);
                return;
            }
            long at = clock.getAsLong();
            Long last = lastLook.get(view);
            Integer seenGeneration = lookedAt.get(view);
            boolean changed = seenGeneration == null || seenGeneration != generation;
            if (!now && !changed && last != null && at - last < LOOK_MS) return;
            lastLook.put(view, at);
            lookedAt.put(view, generation);
            Map<View, String> buttons = new LinkedHashMap<>();
            Map<String, String> places = new LinkedHashMap<>();
            collect(view, buttons, places, Boolean.TRUE.equals(watched.get(view)), null);
            remember(places);
            Map<String, Integer> levels = levels();
            boolean any = false;
            for (Map.Entry<View, String> button : buttons.entrySet()) {
                Integer level = levels.get(button.getValue());
                if (level != null) any |= dim(button.getKey(), level / 100f);
                else restore(button.getKey());
            }
            if (any) Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the buttons", error);
        }
    }

    /**
     * Every button under [view] that a tap reaches and a screen reader names, with that name, and in [places] where each
     * name sits. A list that scrolls holds chats, people or messages and is skipped; in a [menu], a list that fits is its
     * buttons. Inside a chat, [messages] is the span on screen its messages show in.
     */
    private static void collect(View view, Map<View, String> into, Map<String, String> places, boolean menu, int[] messages) {
        if (view.getVisibility() != View.VISIBLE || InvisibleButtonsPick.isOurs(view)) return;
        if (ChatJump.isList(view.getClass()) && (!menu || scrolls(view))) return;
        if (!menu && messages == null && chats.containsKey(view)) messages = messageSpan(view);
        if ((view.isClickable() || view.isLongClickable()) && view.getWidth() > 0 && view.getHeight() > 0) {
            String name = nameOf(view);
            if (name != null) {
                into.put(view, name);
                if (!places.containsKey(name)) places.put(name, placeOf(view, menu, messages));
            }
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into, places, menu, messages);
    }

    /**
     * Where [button] sits: HushMessenger's own wherever it is, a menu's, above a chat's messages (its top bar), below them
     * (the message box) or among them, and otherwise on the chat list or another screen.
     */
    private static String placeOf(View button, boolean menu, int[] messages) {
        if (ownNames.containsKey(button)) return PLACE_OURS;
        if (menu) return PLACE_MENU;
        if (messages == null) return PLACE_SCREEN;
        int[] at = new int[2];
        button.getLocationOnScreen(at);
        int middle = at[1] + button.getHeight() / 2;
        if (middle < messages[0]) return PLACE_HEADER;
        if (middle > messages[1]) return PLACE_COMPOSER;
        return PLACE_CHAT;
    }

    /**
     * The span on screen a chat's messages show in: its tallest list, less the padding Translucent chat bars gives it,
     * since the messages then scroll under the bars.
     */
    private static int[] messageSpan(View chat) {
        View list = tallestList(chat, null);
        if (list == null) return NO_LIST;
        int[] at = new int[2];
        list.getLocationOnScreen(at);
        return new int[] {at[1] + list.getPaddingTop(), at[1] + list.getHeight() - list.getPaddingBottom()};
    }

    private static View tallestList(View view, View best) {
        if (view.getVisibility() != View.VISIBLE) return best;
        if (ChatJump.isList(view.getClass())) return best == null || view.getHeight() > best.getHeight() ? view : best;
        if (!(view instanceof ViewGroup)) return best;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) best = tallestList(group.getChildAt(i), best);
        return best;
    }

    /**
     * The named button under the point [x], [y] on screen in [window], the smallest one when buttons sit inside each
     * other, or null. A button drawn invisible still counts, which is how one is brought back.
     */
    static Map.Entry<View, String> buttonAt(View window, int x, int y) {
        Map<View, String> buttons = new LinkedHashMap<>();
        collect(window, buttons, new LinkedHashMap<>(), Boolean.TRUE.equals(watched.get(window)), null);
        Map.Entry<View, String> best = null;
        long bestArea = Long.MAX_VALUE;
        int[] at = new int[2];
        for (Map.Entry<View, String> button : buttons.entrySet()) {
            View view = button.getKey();
            view.getLocationOnScreen(at);
            if (x < at[0] || y < at[1] || x >= at[0] + view.getWidth() || y >= at[1] + view.getHeight()) continue;
            long area = (long) view.getWidth() * view.getHeight();
            if (area < bestArea) {
                best = button;
                bestArea = area;
            }
        }
        return best;
    }

    /** Draws every watched view that's on screen again, after a level changed outside settings. */
    static void refresh() {
        for (View view : new ArrayList<>(watched.keySet())) if (view.isAttachedToWindow()) look(view, true);
    }

    private static boolean scrolls(View list) {
        return list.canScrollVertically(1) || list.canScrollVertically(-1)
            || list.canScrollHorizontally(1) || list.canScrollHorizontally(-1);
    }

    /**
     * Lists [button], one of HushMessenger's own that shows its words instead of a spoken name, under [name], so it can be
     * picked like Messenger's buttons. A spoken name, when the button gets one, still comes first.
     */
    static void own(View button, CharSequence name) {
        if (button == null) return;
        if (TextUtils.isEmpty(name)) ownNames.remove(button);
        else ownNames.put(button, name.toString());
    }

    /** The name a screen reader says for [view], on one line, or null when it has none worth keeping. */
    static String nameOf(View view) {
        CharSequence said = view.getContentDescription();
        if (TextUtils.isEmpty(said)) said = ownNames.get(view);
        if (TextUtils.isEmpty(said)) {
            AccessibilityNodeInfo info = view.createAccessibilityNodeInfo();
            if (info == null) return null;
            try {
                said = info.getContentDescription();
            } finally {
                info.recycle();
            }
        }
        if (TextUtils.isEmpty(said)) return null;
        String name = said.toString().replace('\n', ' ').replace('\r', ' ').trim();
        while (name.contains("  ")) name = name.replace("  ", " ");
        return name.isEmpty() || name.length() > MAX_NAME ? null : name;
    }

    /**
     * Draws [button] at [fraction] of the alpha Messenger gave it. An alpha that isn't the one this control set is
     * Messenger's own newer one (a fade, a disabled look), so that becomes the alpha to scale and to give back.
     */
    private static boolean dim(View button, float fraction) {
        float[] took = dimmed.get(button);
        if (took == null) dimmed.put(button, took = new float[] {button.getAlpha(), Float.NaN});
        else if (button.getAlpha() != took[1]) took[0] = button.getAlpha();
        took[1] = took[0] * fraction;
        if (button.getAlpha() != took[1]) button.setAlpha(took[1]);
        return true;
    }

    /** Gives [button] the alpha it had, unless Messenger has set one of its own since. */
    private static void restore(View button) {
        float[] took = dimmed.remove(button);
        if (took != null && button.getAlpha() == took[1]) button.setAlpha(took[0]);
    }

    /** Gives [view] and every button under it the alpha it had before, for the ones this control took. */
    private static void give(View view) {
        if (dimmed.isEmpty()) return;
        restore(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) give(group.getChildAt(i));
    }

    /** The buttons seen so far, in the order Messenger first showed them. */
    static List<String> seen() {
        return ChatMenuItems.split(Settings.preferences.getString(SEEN, ""));
    }

    /** What settings list: every button seen, then any picked one that has since dropped off that list. */
    static List<String> listed() {
        List<String> listed = seen();
        for (String name : levels().keySet()) if (!listed.contains(name)) listed.add(name);
        return listed;
    }

    /** Every picked button's level in percent, below 100. */
    static Map<String, Integer> levels() {
        Map<String, Integer> levels = new LinkedHashMap<>();
        for (String name : ChatMenuItems.split(Settings.preferences.getString(HIDDEN, ""))) levels.put(name, 0);
        for (String line : ChatMenuItems.split(Settings.preferences.getString(LEVELS, ""))) {
            int tab = line.indexOf('\t');
            if (tab <= 0 || tab == line.length() - 1) continue;
            Integer level = percent(line.substring(0, tab));
            if (level != null && level < 100) levels.put(line.substring(tab + 1), level);
        }
        return levels;
    }

    private static Integer percent(String digits) {
        if (digits.isEmpty() || digits.length() > 3) return null;
        for (int i = 0; i < digits.length(); i++) if (digits.charAt(i) < '0' || digits.charAt(i) > '9') return null;
        return Integer.parseInt(digits);
    }

    /** [name]'s level in percent, 100 when it isn't picked. */
    static int level(String name) {
        Integer level = levels().get(name);
        return level == null ? 100 : level;
    }

    /** Sets [name] to [level] percent. 100 or more gives it back to Messenger as it was. */
    static void setLevel(String name, int level) {
        Map<String, Integer> levels = levels();
        Integer was = levels.get(name);
        if (level >= 100) {
            if (was == null) return;
            levels.remove(name);
        } else {
            int wanted = Math.max(0, level);
            if (was != null && was == wanted) return;
            levels.put(name, wanted);
        }
        List<String> lines = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : levels.entrySet()) lines.add(entry.getValue() + "\t" + entry.getKey());
        Settings.preferences.edit().putString(LEVELS, String.join("\n", lines)).remove(HIDDEN).apply();
        generation++;
    }

    /** Where each listed button was first seen, by name. A name seen before places were kept has none. */
    static Map<String, String> places() {
        Map<String, String> places = new LinkedHashMap<>();
        for (String line : ChatMenuItems.split(Settings.preferences.getString(PLACES, ""))) {
            int tab = line.indexOf('\t');
            if (tab > 0 && tab < line.length() - 1 && !places.containsKey(line.substring(tab + 1))) {
                places.put(line.substring(tab + 1), line.substring(0, tab));
            }
        }
        return places;
    }

    /**
     * Notes any button Messenger has shown that settings hasn't listed yet, and where, in one write, and only then. A
     * listed name without a place gets the one it's seen in now. The oldest unpicked names drop off first; a picked one
     * stays, since settings is where it's taken back.
     */
    private static void remember(Map<String, String> found) {
        List<String> seen = seen();
        Map<String, String> places = places();
        boolean changed = false;
        for (Map.Entry<String, String> button : found.entrySet()) {
            if (!seen.contains(button.getKey())) {
                seen.add(button.getKey());
                changed = true;
            }
            if (!places.containsKey(button.getKey())) {
                places.put(button.getKey(), button.getValue());
                changed = true;
            }
        }
        if (!changed) return;
        Map<String, Integer> levels = levels();
        for (int i = 0; seen.size() > REMEMBERED && i < seen.size(); ) {
            if (levels.containsKey(seen.get(i))) i++;
            else seen.remove(i);
        }
        List<String> lines = new ArrayList<>();
        for (Map.Entry<String, String> place : places.entrySet()) {
            if (seen.contains(place.getKey()) || levels.containsKey(place.getKey())) lines.add(place.getValue() + "\t" + place.getKey());
        }
        SharedPreferences.Editor edit = Settings.preferences.edit();
        edit.putString(SEEN, String.join("\n", seen));
        edit.putString(PLACES, String.join("\n", lines));
        edit.apply();
    }
}
