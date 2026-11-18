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
import java.util.Collection;
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
 * so far. That name is in the language Messenger is in, so switching language fills the list again. A screen's
 * scrolling lists are left alone, since those rows are chats, people and messages; a menu's list that fits without
 * scrolling is its buttons, so those are taken. HushMessenger settings are never touched.
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
            collect(view, buttons, Boolean.TRUE.equals(watched.get(view)));
            remember(buttons.values());
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
     * Every button under [view] that a tap reaches and a screen reader names, with that name. A list that scrolls holds
     * chats, people or messages and is skipped; in a [menu], a list that fits is its buttons.
     */
    private static void collect(View view, Map<View, String> into, boolean menu) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (ChatJump.isList(view.getClass()) && (!menu || scrolls(view))) return;
        if ((view.isClickable() || view.isLongClickable()) && view.getWidth() > 0 && view.getHeight() > 0) {
            String name = nameOf(view);
            if (name != null) into.put(view, name);
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into, menu);
    }

    private static boolean scrolls(View list) {
        return list.canScrollVertically(1) || list.canScrollVertically(-1)
            || list.canScrollHorizontally(1) || list.canScrollHorizontally(-1);
    }

    /** The name a screen reader says for [view], on one line, or null when it has none worth keeping. */
    static String nameOf(View view) {
        CharSequence said = view.getContentDescription();
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

    /**
     * Notes any button Messenger has shown that settings hasn't listed yet, in one write, and only then. The oldest
     * unpicked names drop off first; a picked one stays, since settings is where it's taken back.
     */
    private static void remember(Collection<String> names) {
        List<String> seen = seen();
        boolean added = false;
        for (String name : names) {
            if (seen.contains(name)) continue;
            seen.add(name);
            added = true;
        }
        if (!added) return;
        Map<String, Integer> levels = levels();
        for (int i = 0; seen.size() > REMEMBERED && i < seen.size(); ) {
            if (levels.containsKey(seen.get(i))) i++;
            else seen.remove(i);
        }
        SharedPreferences.Editor edit = Settings.preferences.edit();
        edit.putString(SEEN, String.join("\n", seen));
        edit.apply();
    }
}
