/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.favorites;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Keeps the Profile's History and Favorites lists where they were scrolled to.
 *
 * <p>Issue #2: PineDrama gives each of these pages one small gate object that watches the list's
 * views and, every time one comes back into view, marks the page dirty and reloads its first
 * page. The reload replaces the whole list, so a deep position lands back at the top with the
 * header still collapsed. It's the same gate on History's Dramas and Posts and on Favorites, so
 * answering it here covers all three.
 *
 * <p>The gate still runs. A list at its top refreshes the way it always did, and a change the
 * page was told about (a favorite removed, say) marks the gate dirty itself and still reloads.
 * Only the return into view of a list you scrolled stops counting as a reason to reload.
 */
public final class ListPosition {
    /** The Hook status family this reports under. */
    static final String FAMILY = "list position";
    /** How far above a watched view to look for its list, which is rarely more than a few levels. */
    private static final int MAX_PARENTS = 12;

    private static final Map<Object, List<WeakReference<View>>> WATCHED =
            Collections.synchronizedMap(new WeakHashMap<>());

    private ListPosition() {}

    /**
     * The gate is starting to watch {@code view}. Answers whether a return into view should mark
     * it dirty on its own, and takes that decision over from it when the switch is on.
     */
    public static boolean track(Object gate, View view, boolean refreshOnAppear) {
        HookStatus.bound(FAMILY, "refresh gate");
        if (!refreshOnAppear || !Settings.KEEP_LIST_POSITION.get()) return refreshOnAppear;
        synchronized (WATCHED) {
            List<WeakReference<View>> views = WATCHED.get(gate);
            if (views == null) {
                views = new ArrayList<>(2);
                WATCHED.put(gate, views);
            }
            views.add(new WeakReference<>(view));
        }
        return false;
    }

    /** The gate is deciding whether to reload: only one this class took over gets an answer. */
    public static boolean wantsRefresh(Object gate) {
        List<View> views = new ArrayList<>(2);
        synchronized (WATCHED) {
            List<WeakReference<View>> held = WATCHED.get(gate);
            if (held == null) return false;
            for (WeakReference<View> reference : held) {
                View view = reference.get();
                if (view != null) views.add(view);
            }
        }
        return !anyScrolled(views);
    }

    /** Whether any of the watched views belongs to a list that isn't at its top. */
    static boolean anyScrolled(List<View> views) {
        for (View view : views) {
            if (scrolled(view)) return true;
        }
        return false;
    }

    /**
     * Whether the list around {@code watched} has moved off its top. The watched view can be the
     * list, a child row or a wrapper, so this looks inside it first and then widens one parent at
     * a time. A pager is where it stops: past that are the neighboring tabs' lists, and their
     * position says nothing about this one.
     */
    static boolean scrolled(View watched) {
        View current = watched;
        for (int depth = 0; current != null && depth <= MAX_PARENTS; depth++) {
            Boolean state = scrollState(current);
            if (state != null) return state;
            ViewParent parent = current.getParent();
            if (!(parent instanceof View) || isPager(parent)) return false;
            current = (View) parent;
        }
        return false;
    }

    /** True for a scrolled list, false for one at its top, null when nothing shown here scrolls. */
    private static Boolean scrollState(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view.canScrollVertically(-1)) return Boolean.TRUE;
        if (view.canScrollVertically(1)) return Boolean.FALSE;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Boolean state = scrollState(group.getChildAt(i));
                if (state != null) return state;
            }
        }
        return null;
    }

    private static boolean isPager(Object view) {
        for (Class<?> type = view.getClass(); type != null && type != Object.class;
             type = type.getSuperclass()) {
            String name = type.getName();
            if (name.endsWith("ViewPager") || name.endsWith("ViewPager2")
                    || name.endsWith("RecyclerView")) {
                return true;
            }
        }
        return false;
    }
}
