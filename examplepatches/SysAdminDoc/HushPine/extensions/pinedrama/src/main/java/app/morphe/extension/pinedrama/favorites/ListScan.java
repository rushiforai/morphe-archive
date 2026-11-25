/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.favorites;

import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import app.morphe.extension.shared.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

/**
 * Reads every row of a profile list for {@link ListSearch}, the way you would: from the top,
 * a screen at a time, waiting at the end for PineDrama to load the next page.
 *
 * <p>PineDrama keeps what each row shows in classes that are renamed on every build, so the rows
 * are read from the text they put on screen instead, which also means a result says exactly
 * what the grid says. Scrolling is how the list asks for its next page, so this scrolls the list
 * itself, under the search page, and puts it back where it was if nothing is chosen.
 */
final class ListScan {
    /** Between steps while there is more list to scroll through. */
    private static final long STEP_MILLIS = 48;
    /** Between checks at the end, while the next page may still be on its way. */
    private static final long WAIT_MILLIS = 150;
    /** How long the end has to stay the end before the list counts as read. */
    private static final long SETTLE_MILLIS = 3_000;
    /** A list this long is read no further. */
    private static final int MAX_ROWS = 5_000;
    /** And a list that takes this long, in case its pages never stop coming. */
    private static final long MAX_MILLIS = 120_000;

    private final View list;
    private final Runnable changed;
    private final TreeMap<Integer, ListSearch.Item> rows = new TreeMap<>();
    private final Runnable step = this::step;
    private int startedAt = -1;
    private long startedMillis;
    private long endSince;
    /** Where the list was at the last step, before that step's scroll. */
    private String placed;
    private boolean running;
    private boolean done;

    ListScan(View list, Runnable changed) {
        this.list = list;
        this.changed = changed;
    }

    View list() {
        return list;
    }

    /** Remembers where the list is, then goes to its top and starts reading. */
    void start() {
        if (running || done) return;
        startedAt = firstShown();
        startedMillis = SystemClock.uptimeMillis();
        running = true;
        collect();
        ListTools.call(list, "stopScroll");
        ListTools.call(list, "scrollToPosition", 0);
        list.postDelayed(step, STEP_MILLIS);
    }

    boolean done() {
        return done;
    }

    /** What has been read so far, in the list's order. */
    List<ListSearch.Item> items() {
        return new ArrayList<>(rows.values());
    }

    /** Stops reading and leaves the list where it is. */
    void stop() {
        running = false;
        list.removeCallbacks(step);
    }

    /** Stops reading and puts the list back on the row it showed before the search. */
    void cancel() {
        stop();
        if (startedAt >= 0) {
            ListTools.call(list, "stopScroll");
            ListTools.call(list, "scrollToPosition", startedAt);
        }
    }

    /** Brings the row at {@code position} on screen and opens it the way a tap does. */
    void open(int position) {
        stop();
        ListTools.call(list, "stopScroll");
        ListTools.call(list, "scrollToPosition", position);
        // The row is laid out on the next pass, so it's looked for after that, twice at most.
        list.post(() -> list.post(() -> {
            if (!tap(position)) list.postDelayed(() -> tap(position), 200);
        }));
    }

    private boolean tap(int position) {
        View row = rowAt(position);
        if (row == null) return false;
        row.performClick();
        return true;
    }

    private View rowAt(int position) {
        if (!(list instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) list;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (ListTools.positionOf(list, child) == position) return child;
        }
        return null;
    }

    private int firstShown() {
        if (!(list instanceof ViewGroup)) return -1;
        ViewGroup group = (ViewGroup) list;
        int first = -1;
        for (int index = 0; index < group.getChildCount(); index++) {
            int position = ListTools.positionOf(list, group.getChildAt(index));
            if (position >= 0 && (first < 0 || position < first)) first = position;
        }
        return first;
    }

    private void step() {
        if (!running) return;
        try {
            boolean grew = collect();
            long now = SystemClock.uptimeMillis();
            if (rows.size() >= MAX_ROWS || now - startedMillis > MAX_MILLIS || !list.isAttachedToWindow()) {
                finish();
                return;
            }
            // A grid whose last row isn't full goes on answering that there's more below it, so
            // the end is where a scroll stops moving the list, not where the list says it is.
            // The scroll is still tried at the end: a page that just loaded gives it somewhere to go.
            String here = place();
            boolean moved = !here.equals(placed);
            placed = here;
            boolean more = list.canScrollVertically(1);
            if (more) {
                int height = list.getHeight() - list.getPaddingTop() - list.getPaddingBottom();
                list.scrollBy(0, Math.max(1, height * 3 / 4));
            }
            if (more && moved) {
                endSince = 0;
                list.postDelayed(step, STEP_MILLIS);
            } else {
                if (grew || endSince == 0) endSince = now;
                if (now - endSince >= SETTLE_MILLIS) {
                    finish();
                } else {
                    list.postDelayed(step, WAIT_MILLIS);
                }
            }
        } catch (Throwable error) {
            Logger.printException(() -> "List search stopped reading the list", error);
            finish();
        }
    }

    private void finish() {
        stop();
        done = true;
        changed.run();
    }

    /** Where the list is: its first row on screen and how far that row has gone up. */
    private String place() {
        if (!(list instanceof ViewGroup)) return "";
        ViewGroup group = (ViewGroup) list;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            int position = ListTools.positionOf(list, child);
            if (position >= 0) return position + ":" + child.getTop();
        }
        return "";
    }

    /** Reads the rows on screen. True when one of them is new. */
    private boolean collect() {
        if (!(list instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) list;
        boolean grew = false;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            int position = ListTools.positionOf(list, child);
            if (position < 0 || rows.containsKey(position)) continue;
            List<String> texts = new ArrayList<>(3);
            texts(child, texts);
            if (texts.isEmpty()) continue;
            rows.put(position, ListSearch.Item.of(position, texts));
            grew = true;
        }
        if (grew) changed.run();
        return grew;
    }

    private static void texts(View view, List<String> into) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            String value = text == null ? "" : text.toString().trim();
            if (!value.isEmpty() && !into.contains(value)) into.add(value);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                texts(group.getChildAt(index), into);
            }
        }
    }
}
