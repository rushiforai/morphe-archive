/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * What the last Facebook screen left was built from at its right edge, where a reel's buttons sit
 * (#18).
 *
 * <p>The reel Download button goes in through the two sidebars 577 and 580 draw a reel's buttons
 * with, and each of them counts itself in Hook status. On some accounts the Reels tab counts
 * neither, so its buttons come from something else, and nothing in the app's code says what. Each
 * time a Facebook screen pauses, this follows two points at its right edge from the window's root
 * down to the view under each, and keeps each view's class and resource name. Leave Facebook from
 * a reel and the next report says what draws its buttons. No text or description on the screen is
 * read.
 *
 * <p>It's read on the way out rather than when the settings open, because the intent that opens
 * them from the launcher makes Facebook build its screen again, and by then the reel is gone.
 */
final class LastScreen {
    /** Down the window, where a reel's Like and Share buttons sit on every reel layout seen. */
    static final float[] HEIGHTS = {0.55f, 0.70f};

    /** Across the window: inside the button column, clear of the video's middle. */
    static final float ACROSS = 0.92f;

    /** Deeper than any screen Facebook builds, so a loop in a broken tree can't hold the pause up. */
    private static final int MAX_DEPTH = 80;

    /** The children named where a walk stops, from the top. */
    private static final int MAX_CHILDREN = 6;

    /** Walks written for each point: the first, and the ones under a layer that drew nothing there. */
    private static final int MAX_WALKS = 3;

    private static final class Reading {
        final String screen;
        final List<String> paths;
        final long at;

        Reading(String screen, List<String> paths, long at) {
            this.screen = screen;
            this.paths = paths;
            this.at = at;
        }
    }

    private static volatile Reading last;

    static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override public String title() { return "LAST SCREEN LEFT"; }
        @Override public List<String> lines() { return report(SystemClock.elapsedRealtime()); }
        @Override public boolean isAppState() { return true; }
    };

    private LastScreen() {}

    /** Reads the activity's window as it pauses, on the main thread. Never throws. */
    static void read(Activity activity) {
        long now = SystemClock.elapsedRealtime();
        String screen = activity.getClass().getSimpleName();
        List<String> paths;
        try {
            paths = describe(activity.getWindow().getDecorView());
        } catch (Throwable failure) {
            paths = Collections.singletonList("could not be read: " + failure.getClass().getSimpleName());
        }
        last = new Reading(screen, paths, now);
    }

    /** The section: nothing until a screen has paused, then that screen, how long ago, and its paths. */
    static List<String> report(long now) {
        Reading reading = last;
        if (reading == null) return Collections.emptyList();
        List<String> out = new ArrayList<>();
        out.add(String.format(Locale.ROOT, "screen: %s, left %d s before this report",
                reading.screen, Math.max(0, (now - reading.at) / 1000)));
        out.addAll(reading.paths);
        return out;
    }

    static void clearForTests() {
        last = null;
    }

    static List<String> describe(View root) {
        List<String> out = new ArrayList<>();
        if (root.getWidth() <= 0 || root.getHeight() <= 0) {
            out.add("not laid out");
            return out;
        }
        for (float height : HEIGHTS) {
            int percent = Math.round(height * 100);
            List<String> walks = walks(root, root.getWidth() * ACROSS, root.getHeight() * height);
            for (int i = 0; i < walks.size(); i++) {
                out.add(String.format(Locale.ROOT, i == 0 ? "right edge %d%% down: %s"
                        : "right edge %d%% down, under that: %s", percent, walks.get(i)));
            }
        }
        return out;
    }

    /** A view on the way down, where the point falls in it, and which of its children was walked into. */
    private static final class Step {
        final View view;
        final float x, y;
        int child;

        Step(View view, float x, float y) {
            this.view = view;
            this.x = x;
            this.y = y;
            child = view instanceof ViewGroup ? ((ViewGroup) view).getChildCount() : 0;
        }
    }

    /**
     * The views from [root] down to the one drawn on top at (x, y), each by class and resource name,
     * with a run of the same one written once with its count.
     *
     * <p>A walk that ends in a group whose children all miss the point found a layer that draws
     * nothing there: 580 lays an empty full-window frame over the whole feed. Then the walk goes
     * back up to the nearest view with another child under the point and down again from it, and
     * that walk comes next, up to {@link #MAX_WALKS}. A group with no children at all ends a walk
     * for good, since it draws what's there itself.
     */
    static List<String> walks(View root, float x, float y) {
        List<String> out = new ArrayList<>();
        List<Step> steps = new ArrayList<>();
        steps.add(new Step(root, x, y));
        Rect hit = new Rect();
        while (out.size() < MAX_WALKS) {
            Step last = steps.get(steps.size() - 1);
            while (steps.size() < MAX_DEPTH && last.view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) last.view;
                int i = under(group, last.x, last.y, last.child - 1, hit);
                if (i < 0) break;
                last.child = i;
                last = new Step(group.getChildAt(i), last.x + group.getScrollX() - hit.left,
                        last.y + group.getScrollY() - hit.top);
                steps.add(last);
            }
            boolean deadEnd = steps.size() < MAX_DEPTH && last.view instanceof ViewGroup
                    && ((ViewGroup) last.view).getChildCount() > 0;
            out.add(path(steps) + (deadEnd ? children((ViewGroup) last.view,
                    last.x + last.view.getScrollX(), last.y + last.view.getScrollY()) : ""));
            if (!deadEnd) break;
            steps.remove(steps.size() - 1);
            while (!steps.isEmpty()) {
                Step back = steps.get(steps.size() - 1);
                if (under((ViewGroup) back.view, back.x, back.y, back.child - 1, hit) >= 0) break;
                steps.remove(steps.size() - 1);
            }
            if (steps.isEmpty()) break;
        }
        return out;
    }

    /**
     * The index of the top child of [group] that shows at (x, y), looking from child [from] down,
     * or -1; [hit] is left holding its box. The last child draws last, so it's the one on top.
     */
    private static int under(ViewGroup group, float x, float y, int from, Rect hit) {
        int localX = (int) (x + group.getScrollX()), localY = (int) (y + group.getScrollY());
        for (int i = Math.min(from, group.getChildCount() - 1); i >= 0; i--) {
            View child = group.getChildAt(i);
            if (child == null || child.getVisibility() != View.VISIBLE || child.getAlpha() <= 0f) continue;
            child.getHitRect(hit);
            if (hit.contains(localX, localY)) return i;
        }
        return -1;
    }

    private static String path(List<Step> steps) {
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < steps.size(); ) {
            String name = name(steps.get(i).view);
            int run = 1;
            while (i + run < steps.size() && name(steps.get(i + run).view).equals(name)) run++;
            if (text.length() > 0) text.append(" > ");
            text.append(name);
            if (run > 1) text.append(" x").append(run);
            i += run;
        }
        return text + " (" + steps.size() + " views)";
    }

    /**
     * Where the walk stopped with children left, why none of them was followed: the point, then
     * each child from the top by name, whether it shows, and the box it takes up.
     */
    private static String children(ViewGroup group, float x, float y) {
        StringBuilder text = new StringBuilder(String.format(Locale.ROOT,
                "; nothing at %d,%d among its %d children:", (int) x, (int) y, group.getChildCount()));
        Rect hit = new Rect();
        int shown = 0;
        for (int i = group.getChildCount() - 1; i >= 0 && shown < MAX_CHILDREN; i--, shown++) {
            View child = group.getChildAt(i);
            if (child == null) continue;
            child.getHitRect(hit);
            String state = child.getVisibility() == View.VISIBLE ? (child.getAlpha() <= 0f ? "clear" : "shown")
                    : child.getVisibility() == View.INVISIBLE ? "invisible" : "gone";
            text.append(String.format(Locale.ROOT, " %s %s [%d,%d %dx%d]",
                    name(child), state, hit.left, hit.top, hit.width(), hit.height()));
        }
        return text.toString();
    }

    /** A framework class by its simple name, anything else in full; then the resource name, if the id has one. */
    static String name(View view) {
        String type = view.getClass().getName();
        if (type.startsWith("android.widget.") || type.startsWith("android.view.")
                || type.startsWith("com.android.internal.policy.")) {
            type = view.getClass().getSimpleName();
        }
        int id = view.getId();
        if (id == View.NO_ID || (id >>> 24) == 0) return type;
        try {
            return type + "#" + view.getResources().getResourceEntryName(id);
        } catch (Resources.NotFoundException | NullPointerException generated) {
            return type;
        }
    }
}
