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
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
 * its messages, a menu, or HushMessenger's own), which settings groups the list by. HushMessenger's own buttons go in
 * their group wherever they sit, older entries included. Text Messenger draws from a message (a link's preview over the
 * message box, a pinned message or a reply across the chat, a web address) is never kept, and a name not seen for
 * [STALE_DAYS] days or last seen in another language leaves the list unless it's picked. [InvisibleButtonsPick] lets a
 * button be picked by tapping it on screen.
 * Some names are a person's or a chat's name, a comma and one of Messenger's own labels ("Pat, Thread details" is the
 * chat's name in its top bar). When that label is a button's whole name too, the name in front is left out: the button
 * is kept as [SOMEONE] and the label, one row whose level holds in every chat, with nobody's name kept.
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
    /** When and in which language each name was last seen: the day, the language and the name per line. */
    static final String SEEN_ON = "invisible_buttons_seen_on";
    /** An unpicked name not seen for longer than this many days leaves the list. */
    static final int STALE_DAYS = 14;
    /**
     * What stands in for the person's or chat's name in front of one of Messenger's labels (#191): an ellipsis and a
     * comma, so the chat's name in its top bar reads as one row next to the details button's own "Thread details".
     */
    static final String SOMEONE = (char) 0x2026 + ", ";
    /** Names only HushMessenger's own buttons use, by their text keys, so one stored before its group existed lands there. */
    private static final String[] OWN_LABELS = {
        "chat_jump_first", "chat_page_up", "chat_page_down", "local_search_open", "call_recording_stop_pill"};
    /** The views Messenger's chat fragment hands over. Their buttons go by where they sit around the messages. */
    private static final Map<View, Boolean> chats = new WeakHashMap<>();
    /** HushMessenger's own views on Messenger's screens. Every button in one is HushMessenger's. */
    private static final Map<View, Boolean> ownViews = new WeakHashMap<>();
    /** The clock the walk paces itself by. Tests move it by hand. */
    static java.util.function.LongSupplier clock = android.os.SystemClock::uptimeMillis;
    /** Today, counted in days, for [SEEN_ON]. Tests move it by hand. */
    static java.util.function.LongSupplier today = () -> System.currentTimeMillis() / 86_400_000L;
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
        ownViews.clear();
        InvisibleButtonsPick.resetForTests();
        generation = 0;
        clock = android.os.SystemClock::uptimeMillis;
        today = () -> System.currentTimeMillis() / 86_400_000L;
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
            collect(view, buttons, places, Boolean.TRUE.equals(watched.get(view)), null, false);
            fold(buttons, places);
            remember(places, languageOf(view));
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
     * buttons. Inside a chat, [messages] is the span on screen its messages show in, and what Messenger draws from a
     * message is skipped with everything in it. [own] is true inside one of HushMessenger's own views.
     */
    private static void collect(View view, Map<View, String> into, Map<String, String> places, boolean menu, int[] messages,
            boolean own) {
        if (view.getVisibility() != View.VISIBLE || InvisibleButtonsPick.isOurs(view)) return;
        if (ChatJump.isList(view.getClass()) && (!menu || scrolls(view))) return;
        own |= isOwn(view);
        if (!menu && messages == null && chats.containsKey(view)) messages = messageSpan(view);
        if ((view.isClickable() || view.isLongClickable()) && view.getWidth() > 0 && view.getHeight() > 0) {
            String name = nameOf(view);
            if (name != null) {
                if (!own && fromAMessage(view, menu, messages)) return;
                if (!looksLikeLink(name)) {
                    into.put(view, name);
                    if (!places.containsKey(name)) places.put(name, own ? PLACE_OURS : placeOf(view, menu, messages));
                }
            }
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into, places, menu, messages, own);
    }

    /**
     * True for a named [view] in a chat that shows something from a message rather than a button of the chat's: one as
     * wide as the chat across its top or its messages (a pinned message, a banner about one), or anything between the
     * messages and the box you type in (a link's preview card, the message a reply answers).
     */
    private static boolean fromAMessage(View view, boolean menu, int[] messages) {
        if (menu || messages == null) return false;
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        int middle = at[1] + view.getHeight() / 2;
        if (middle <= messages[1] && messages[2] > 0 && view.getWidth() * 4 >= messages[2] * 3) return true;
        return messages[3] != Integer.MIN_VALUE && middle > messages[1] && middle < messages[3];
    }

    /** A web address, which is a link someone sent rather than the name of a button. */
    static boolean looksLikeLink(String name) {
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("http://") || lower.contains("https://") || lower.contains("www.");
    }

    /**
     * Where [button], one of Messenger's, sits: a menu's, above a chat's messages (its top bar), below them (the message
     * box) or among them, and otherwise on the chat list or another screen.
     */
    private static String placeOf(View button, boolean menu, int[] messages) {
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
     * since the messages then scroll under the bars. Then the chat's width, and the top of the box you type in below the
     * messages, or Integer.MIN_VALUE when there's none. A chat with no list counts every button as inside it.
     */
    private static int[] messageSpan(View chat) {
        View list = tallestList(chat, null);
        if (list == null) return new int[] {Integer.MIN_VALUE, Integer.MAX_VALUE, chat.getWidth(), Integer.MIN_VALUE};
        int[] at = new int[2];
        list.getLocationOnScreen(at);
        int bottom = at[1] + list.getHeight() - list.getPaddingBottom();
        return new int[] {at[1] + list.getPaddingTop(), bottom, chat.getWidth(), fieldTop(chat, bottom, Integer.MIN_VALUE)};
    }

    /** The top on screen of the highest box you type in under [view] whose middle sits below [below], or [best]. */
    private static int fieldTop(View view, int below, int best) {
        if (view.getVisibility() != View.VISIBLE) return best;
        if (view instanceof android.widget.EditText) {
            int[] at = new int[2];
            view.getLocationOnScreen(at);
            if (at[1] + view.getHeight() / 2 > below && (best == Integer.MIN_VALUE || at[1] < best)) return at[1];
            return best;
        }
        if (!(view instanceof ViewGroup)) return best;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) best = fieldTop(group.getChildAt(i), below, best);
        return best;
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
        collect(window, buttons, new LinkedHashMap<>(), Boolean.TRUE.equals(watched.get(window)), null, false);
        fold(buttons, new LinkedHashMap<>());
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

    /**
     * Marks [view], one of HushMessenger's own put on a Messenger screen, so it and every button in it are listed with
     * HushMessenger's buttons wherever they sit, rather than by the place they're seen in (#191).
     */
    static void ownView(View view) {
        if (view != null) ownViews.put(view, true);
    }

    /** True for a view [ownView] or [own] marked. */
    static boolean isOwn(View view) {
        return ownViews.containsKey(view) || ownNames.containsKey(view);
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

    /**
     * The name [name] is kept under. When what follows one of its commas is a button's whole name too ([labels]), the
     * part in front is a person's or a chat's name, so it's left out and the button is kept as [SOMEONE] and that label.
     * The shortest such label wins, since a name in front can hold a comma of its own.
     */
    static String keyOf(String name, Set<String> labels) {
        for (int comma = name.lastIndexOf(", "); comma > 0; comma = name.lastIndexOf(", ", comma - 1)) {
            String label = name.substring(comma + 2);
            if (labels.contains(label)) return SOMEONE + label;
        }
        return name;
    }

    /** Every name kept, seen or picked, which is what tells one of Messenger's own labels from a name in front of one. */
    private static Set<String> labels() {
        Set<String> labels = new HashSet<>(ChatMenuItems.split(Settings.preferences.getString(SEEN, "")));
        labels.addAll(storedLevels().keySet());
        return labels;
    }

    /** Puts every name in [buttons] and [places] under the one it's kept as, going by the names kept and these. */
    private static void fold(Map<View, String> buttons, Map<String, String> places) {
        Set<String> labels = labels();
        labels.addAll(buttons.values());
        for (Map.Entry<View, String> button : buttons.entrySet()) button.setValue(keyOf(button.getValue(), labels));
        Map<String, String> kept = new LinkedHashMap<>();
        for (Map.Entry<String, String> place : places.entrySet()) {
            String key = keyOf(place.getKey(), labels);
            if (!kept.containsKey(key)) kept.put(key, place.getValue());
        }
        places.clear();
        places.putAll(kept);
    }

    /** The buttons seen so far, in the order Messenger first showed them. */
    static List<String> seen() {
        return seenWith(labels());
    }

    private static List<String> seenWith(Set<String> labels) {
        List<String> seen = new ArrayList<>();
        for (String name : ChatMenuItems.split(Settings.preferences.getString(SEEN, ""))) {
            String key = keyOf(name, labels);
            if (!seen.contains(key)) seen.add(key);
        }
        return seen;
    }

    /** What settings list: every button seen, then any picked one that has since dropped off that list. */
    static List<String> listed() {
        List<String> listed = seen();
        for (String name : levels().keySet()) if (!listed.contains(name)) listed.add(name);
        return listed;
    }

    /**
     * Every picked button's level in percent, below 100. Picks saved under names that are now kept as one, a chat's
     * name in its top bar picked in more than one chat, are that one, at the lowest of their levels.
     */
    static Map<String, Integer> levels() {
        return levelsWith(labels());
    }

    private static Map<String, Integer> levelsWith(Set<String> labels) {
        Map<String, Integer> levels = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> picked : storedLevels().entrySet()) {
            String key = keyOf(picked.getKey(), labels);
            Integer was = levels.get(key);
            levels.put(key, was == null ? picked.getValue() : Math.min(was, picked.getValue()));
        }
        return levels;
    }

    /** The levels as saved, under the names they were saved with, the first build's picks at 0. */
    private static Map<String, Integer> storedLevels() {
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
        Set<String> labels = labels();
        Integer level = levelsWith(labels).get(keyOf(name, labels));
        return level == null ? 100 : level;
    }

    /** Sets [name] to [level] percent. 100 or more gives it back to Messenger as it was. */
    static void setLevel(String name, int level) {
        Set<String> labels = labels();
        Map<String, Integer> levels = levelsWith(labels);
        name = keyOf(name, labels);
        Integer was = levels.get(name);
        if (level >= 100) {
            if (was == null) return;
            levels.remove(name);
        } else {
            int wanted = Math.max(0, level);
            if (was != null && was == wanted) return;
            levels.put(name, wanted);
        }
        SharedPreferences.Editor edit = Settings.preferences.edit();
        saveLevels(edit, levels);
        edit.apply();
        generation++;
    }

    /** Puts [levels] in [edit] as the saved picks, which moves the first build's picks over too. */
    private static void saveLevels(SharedPreferences.Editor edit, Map<String, Integer> levels) {
        List<String> lines = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : levels.entrySet()) lines.add(entry.getValue() + "\t" + entry.getKey());
        edit.putString(LEVELS, String.join("\n", lines)).remove(HIDDEN);
    }

    /**
     * Where each listed button was first seen, by name. A name seen before places were kept has none. A name only
     * HushMessenger's own buttons use is theirs whatever was stored, since older builds filed them by where they sat.
     */
    static Map<String, String> places() {
        return placesWith(labels());
    }

    private static Map<String, String> placesWith(Set<String> labels) {
        Map<String, String> places = new LinkedHashMap<>();
        for (String line : ChatMenuItems.split(Settings.preferences.getString(PLACES, ""))) {
            int tab = line.indexOf('\t');
            if (tab <= 0 || tab == line.length() - 1) continue;
            String key = keyOf(line.substring(tab + 1), labels);
            if (!places.containsKey(key)) places.put(key, line.substring(0, tab));
        }
        if (Settings.appContext != null) {
            SettingsText text = new SettingsText(Settings.appContext);
            for (String key : OWN_LABELS) {
                String name = text.get(key);
                if (places.containsKey(name)) places.put(name, PLACE_OURS);
            }
        }
        return places;
    }

    /** The language [view] is drawn in, which is the one its buttons are named in. */
    static String languageOf(View view) {
        android.os.LocaleList locales = view.getResources().getConfiguration().getLocales();
        return locales.isEmpty() ? "" : locales.get(0).toLanguageTag();
    }

    /**
     * When and in which language each name was last seen, from [SEEN_ON]: the day as a number, then the language. Of
     * names now kept as one, the latest goes.
     */
    private static Map<String, String[]> seenOnWith(Set<String> labels) {
        Map<String, String[]> records = new LinkedHashMap<>();
        for (String line : ChatMenuItems.split(Settings.preferences.getString(SEEN_ON, ""))) {
            int first = line.indexOf('\t');
            int second = first < 0 ? -1 : line.indexOf('\t', first + 1);
            if (first <= 0 || second < 0 || second == line.length() - 1 || !digits(line.substring(0, first))) continue;
            String key = keyOf(line.substring(second + 1), labels);
            String[] record = {line.substring(0, first), line.substring(first + 1, second)};
            String[] was = records.get(key);
            if (was == null || Long.parseLong(record[0]) > Long.parseLong(was[0])) records.put(key, record);
        }
        return records;
    }

    private static boolean digits(String text) {
        if (text.isEmpty() || text.length() > 12) return false;
        for (int i = 0; i < text.length(); i++) if (text.charAt(i) < '0' || text.charAt(i) > '9') return false;
        return true;
    }

    /**
     * Notes any button Messenger has shown that settings hasn't listed yet, and where, and when and in which [language]
     * each was seen, in one write, and only when something changed. A listed name without a place gets the one it's seen
     * in now, and one of HushMessenger's own moves to their group. An unpicked name goes when it was last seen in another
     * language, more than [STALE_DAYS] days ago, or before this was kept, and when it's a web address; the oldest go
     * first past [REMEMBERED]. A picked one always stays, since settings is where it's taken back.
     */
    private static void remember(Map<String, String> found, String language) {
        Set<String> labels = labels();
        labels.addAll(found.keySet());
        List<String> seen = seenWith(labels);
        Map<String, String> places = placesWith(labels);
        Map<String, String[]> records = seenOnWith(labels);
        Map<String, Integer> levels = levelsWith(labels);
        // Names saved with a person's or chat's name in front go into the one row, and the names go from what's saved.
        boolean folded = false;
        for (String name : labels) folded |= !keyOf(name, labels).equals(name);
        String day = String.valueOf(today.getAsLong());
        boolean changed = folded;
        for (Map.Entry<String, String> button : found.entrySet()) {
            String name = button.getKey();
            if (!seen.contains(name)) {
                seen.add(name);
                changed = true;
            }
            if (!places.containsKey(name) || PLACE_OURS.equals(button.getValue()) && !PLACE_OURS.equals(places.get(name))) {
                places.put(name, button.getValue());
                changed = true;
            }
            String[] record = records.get(name);
            if (record == null || !record[0].equals(day) || !record[1].equals(language)) {
                records.put(name, new String[] {day, language});
                changed = true;
            }
        }
        long now = today.getAsLong();
        for (int i = 0; i < seen.size(); ) {
            String name = seen.get(i);
            String[] record = records.get(name);
            boolean stale = record == null || !record[1].equals(language) || now - Long.parseLong(record[0]) > STALE_DAYS
                || looksLikeLink(name);
            if (stale && !levels.containsKey(name)) {
                seen.remove(i);
                changed = true;
            } else {
                i++;
            }
        }
        if (!changed) return;
        for (int i = 0; seen.size() > REMEMBERED && i < seen.size(); ) {
            if (levels.containsKey(seen.get(i))) i++;
            else seen.remove(i);
        }
        List<String> lines = new ArrayList<>();
        for (Map.Entry<String, String> place : places.entrySet()) {
            if (seen.contains(place.getKey()) || levels.containsKey(place.getKey())) lines.add(place.getValue() + "\t" + place.getKey());
        }
        List<String> when = new ArrayList<>();
        for (Map.Entry<String, String[]> record : records.entrySet()) {
            String name = record.getKey();
            if (seen.contains(name) || levels.containsKey(name)) when.add(record.getValue()[0] + "\t" + record.getValue()[1] + "\t" + name);
        }
        SharedPreferences.Editor edit = Settings.preferences.edit();
        edit.putString(SEEN, String.join("\n", seen));
        edit.putString(PLACES, String.join("\n", lines));
        edit.putString(SEEN_ON, String.join("\n", when));
        if (folded) saveLevels(edit, levels);
        edit.apply();
    }
}
