/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.WeakHashMap;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.Setting;

/**
 * Keeps a feed loading when the switches took every item out of the page Tumblr just loaded.
 *
 * <p>The dashboard, a blog's posts and likes, every tab of a search and the other screens built on
 * {@code TimelineFragment} get each loaded page through one method, in Tumblr 46.5.0.109
 * {@code TimelineFragment.n4(type, items, links, extras, fromCache)}. An empty page ends there. For
 * a first page or a refresh it sets the fragment's "no more pages" flag and shows the empty view,
 * the "No results" screen. For a next page it hides the loading row and returns with the finished
 * request still in the fragment's call field, and the list asks for another page only while that
 * field is empty, so it never asks again. That's right for a page the server sent empty, since
 * the server sends one only at the end. It's wrong for a page {@link TimelineFilter} emptied, which
 * still came with the link to the page after it.
 *
 * <p>The patch asks {@link #onPage} about every page, right after Tumblr's own
 * {@code items.isEmpty()}, and acts on the answer in the fragment itself, where the members it
 * needs are in reach. {@link #NEXT} stores the page's links as the fragment's own, stops a
 * refresh's spinner and loads the next page the way the list does when you reach its end.
 * {@link #EMPTY} takes Tumblr's first-page branch, the empty view. {@link #STOCK} runs Tumblr's code
 * as it is.
 *
 * <p>This only ever answers anything but {@link #STOCK} once a switch has emptied a page in this
 * run of the app, and then only for an empty page that came with a next link. The list the
 * fragment gets is a converted copy, built on another thread and often handed over later from
 * Tumblr's cache (the dashboard's first page is read ahead of the screen), so one page can't be
 * tied to the filter call that emptied it. An empty page the server itself sent with a next link
 * goes on to that page too, which is no loss. Paused, or before the settings are ready, the filter
 * empties nothing and this answers {@link #STOCK}.
 *
 * <p>Five empty pages in a row end it, so a feed that's all filtered doesn't load without end. A run
 * that began with a first page or a refresh has nothing of its own on screen and gets the empty
 * view. One that began further down a list ends as Tumblr ends a list.
 */
public final class TimelinePaging {
    private TimelinePaging() {}

    /** Tumblr's own handling of the page. */
    static final int STOCK = 0;

    /** Load the next page instead of treating the empty one as the end. */
    static final int NEXT = 1;

    /** Show Tumblr's empty view, though the page arrived as a next page. */
    static final int EMPTY = 2;

    /** How many empty pages in a row end a run. */
    static final int LIMIT = 5;

    /** The name of the constant Tumblr's load type enum gives a next page. */
    static final String PAGINATION = "PAGINATION";

    /** What the report counts under the family that emptied the page. English, for the report. */
    static final String EMPTIED = "page emptied";
    static final String SKIPPED = "empty page skipped";
    static final String STOPPED = "empty pages stopped";

    /** The family whose switch last emptied a page, or null while none has in this run of the app. */
    @Nullable
    private static volatile String emptiedBy;

    /** Each fragment's run of empty pages. A fragment that's gone takes its entry with it. */
    private static final Map<Object, Run> RUNS = new WeakHashMap<>();

    private static final class Run {
        /** Whether the run began with a first page or a refresh, so nothing of it is on screen. */
        final boolean blank;
        int pages;

        Run(boolean blank) {
            this.blank = blank;
        }
    }

    /** Called by {@link TimelineFilter}, or a dashboard blog rule, when [family]'s switch took the last item out of a page. */
    public static void emptied(String family) {
        emptiedBy = family;
        HookStatus.counted(family, EMPTIED);
    }

    /**
     * Injected where a timeline fragment has just asked whether its loaded page is empty.
     *
     * @param fragment the fragment
     * @param type Tumblr's load type, an enum constant; a next page's is named {@link #PAGINATION}
     * @param next the page's link to the page after it, or null when it has none
     * @param empty what {@code items.isEmpty()} answered
     * @return {@link #STOCK}, {@link #NEXT} or {@link #EMPTY}. Never throws.
     */
    public static int onPage(Object fragment, Object type, Object next, boolean empty) {
        String family = emptiedBy;
        // Until a switch has emptied a page there's no run to follow and nothing to decide.
        if (family == null) return STOCK;
        try {
            if (fragment == null) return STOCK;
            if (!empty || !Utils.settingsReady() || Setting.isPaused() || !(type instanceof Enum)) {
                forget(fragment);
                return STOCK;
            }
            HookStatus.invoked(family);
            boolean paging = PAGINATION.equals(((Enum<?>) type).name());
            synchronized (RUNS) {
                // A first page or a refresh starts over, whatever came before it.
                Run run = paging ? RUNS.get(fragment) : null;
                int pages = run == null ? 1 : run.pages + 1;
                if (next == null || pages >= LIMIT) {
                    RUNS.remove(fragment);
                    // Nothing was skipped on the way here, so Tumblr's own handling is right as it is.
                    if (run == null) return STOCK;
                    HookStatus.counted(family, STOPPED);
                    return run.blank ? EMPTY : STOCK;
                }
                if (run == null) RUNS.put(fragment, run = new Run(!paging));
                run.pages = pages;
            }
            HookStatus.counted(family, SKIPPED);
            return NEXT;
        } catch (Throwable failure) {
            HookStatus.threw(family, "timeline paging", failure);
            return STOCK;
        }
    }

    private static void forget(Object fragment) {
        synchronized (RUNS) {
            RUNS.remove(fragment);
        }
    }

    /** Forgets every emptied page and every run, as a fresh start of the app would. */
    static void resetForTests() {
        emptiedBy = null;
        synchronized (RUNS) {
            RUNS.clear();
        }
    }
}
