package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Invisible buttons (#191). A button picked in settings is drawn at nothing while it keeps its place, its size, the
 * area that answers a tap and whatever it did before, so a chat can lose the clutter of a button without losing the
 * button. Hiding one outright takes its tap area with it, which is the part people miss.
 *
 * Each button is known by the name a screen reader says for it, which is the only name a drawn button keeps, and
 * settings list the ones a chat has shown so far. That name is in the language Messenger is in, so switching language
 * fills the list again. The buttons in the chat's own list of messages are left alone: those are the messages.
 * Public, since the call comes from Messenger's own chat fragment in another package.
 */
public final class InvisibleButtons {
    static final String KEY = "invisible_buttons";
    private static final String SEEN = "invisible_buttons_seen", HIDDEN = "invisible_buttons_hidden";
    /** More than a chat shows at once, so a name from an older build drops off the list in time. */
    private static final int REMEMBERED = 40;
    /** The longest spoken name kept. Anything longer is a sentence rather than a button. */
    private static final int MAX_NAME = 60;
    /** A chat lays itself out constantly, so a walk waits at least this long after the last one. */
    static final long LOOK_MS = 400;

    /** The chat views already watched, so one view gets one listener. */
    private static final Set<View> watched = Collections.newSetFromMap(new WeakHashMap<>());
    /** Every view dimmed to nothing, with the alpha it had, so giving one back doesn't invent a value. */
    private static final Map<View, Float> dimmed = new WeakHashMap<>();
    /** When each watched root was last walked. */
    private static final Map<View, Long> lastLook = new WeakHashMap<>();
    /** Bumped whenever the picked set changes, so the next layout walks even inside the quiet window. */
    private static volatile int generation;
    private static final Map<View, Integer> lookedAt = new WeakHashMap<>();
    /** The clock the walk paces itself by. Tests move it by hand. */
    static java.util.function.LongSupplier clock = android.os.SystemClock::uptimeMillis;

    private InvisibleButtons() { }

    static void resetForTests() {
        watched.clear();
        dimmed.clear();
        lastLook.clear();
        lookedAt.clear();
        generation = 0;
        clock = android.os.SystemClock::uptimeMillis;
    }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off. */
    public static void chatShown(Object fragment, View view) {
        try {
            if (view == null) return;
            if (watched.add(view)) {
                ViewTreeObserver.OnGlobalLayoutListener onLayout = () -> look(view, false);
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        attached.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
                        look(attached, true);
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                        detached.getViewTreeObserver().removeOnGlobalLayoutListener(onLayout);
                        give(detached);
                    }
                });
                if (view.isAttachedToWindow()) view.getViewTreeObserver().addOnGlobalLayoutListener(onLayout);
            }
            if (view.isAttachedToWindow()) look(view, true);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't look over the chat's buttons", error);
        }
    }

    /**
     * Walks [chat] for buttons, notes the ones it hasn't seen and dims the picked ones. [now] walks whatever the clock
     * says, which is how a chat opening and a change in settings are answered at once.
     */
    static void look(View chat, boolean now) {
        try {
            if (chat == null) return;
            if (!Settings.wouldUse(KEY)) {
                give(chat);
                return;
            }
            long at = clock.getAsLong();
            Long last = lastLook.get(chat);
            Integer seenGeneration = lookedAt.get(chat);
            boolean changed = seenGeneration == null || seenGeneration != generation;
            if (!now && !changed && last != null && at - last < LOOK_MS) return;
            lastLook.put(chat, at);
            lookedAt.put(chat, generation);
            List<View> buttons = new ArrayList<>();
            collect(chat, buttons);
            remember(buttons);
            Set<String> hidden = hidden();
            boolean any = false;
            for (View button : buttons) {
                if (hidden.contains(nameOf(button))) any |= dim(button);
                else give(button);
            }
            if (any) Settings.enabled(KEY);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't look over the chat's buttons", error);
        }
    }

    /** Every button under [view] that a tap reaches and a screen reader names, skipping the list of messages. */
    private static void collect(View view, List<View> into) {
        if (view.getVisibility() != View.VISIBLE || ChatJump.isList(view.getClass())) return;
        if ((view.isClickable() || view.isLongClickable()) && view.getWidth() > 0 && view.getHeight() > 0
                && nameOf(view) != null) into.add(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), into);
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

    /** Draws [button] at nothing, keeping the alpha it had so it can be given back as it was. */
    private static boolean dim(View button) {
        if (dimmed.containsKey(button)) return button.getAlpha() == 0f;
        dimmed.put(button, button.getAlpha());
        button.setAlpha(0f);
        return true;
    }

    /** Gives [view] and every button under it the alpha it had before, for the ones this control took. */
    private static void give(View view) {
        Float had = dimmed.remove(view);
        if (had != null) view.setAlpha(had);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) give(group.getChildAt(i));
    }

    /** The buttons seen so far, in the order a chat first showed them. */
    static List<String> seen() {
        return ChatMenuItems.split(Settings.preferences.getString(SEEN, ""));
    }

    static Set<String> hidden() {
        return new LinkedHashSet<>(ChatMenuItems.split(Settings.preferences.getString(HIDDEN, "")));
    }

    static void setHidden(String name, boolean hide) {
        Set<String> now = hidden();
        if (hide ? !now.add(name) : !now.remove(name)) return;
        Settings.preferences.edit().putString(HIDDEN, String.join("\n", now)).apply();
        generation++;
    }

    /** Notes any button this chat has that settings hasn't listed yet, in one write, and only then. */
    private static void remember(List<View> buttons) {
        List<String> seen = seen();
        boolean added = false;
        for (View button : buttons) {
            String name = nameOf(button);
            if (name == null || seen.contains(name)) continue;
            seen.add(name);
            added = true;
        }
        if (!added) return;
        while (seen.size() > REMEMBERED) seen.remove(0);
        SharedPreferences.Editor edit = Settings.preferences.edit();
        edit.putString(SEEN, String.join("\n", seen));
        edit.apply();
    }
}
