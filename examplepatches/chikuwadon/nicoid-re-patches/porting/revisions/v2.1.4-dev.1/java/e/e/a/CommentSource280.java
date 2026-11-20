package e.e.a;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.ConcurrentModificationException;

/** One index per native renderer channel. Native lists can be replaced or edited in place. */
final class CommentSource280 {
    private static final Comparator<Item> BY_TIME = Comparator.comparingInt(item -> item.timestamp);
    private static final Comparator<Item> BY_SOURCE = Comparator.comparingInt(item -> item.index);

    static final class Item {
        final q comment;
        final int timestamp;
        final int index;

        Item(q comment, int index) {
            this.comment = comment;
            this.timestamp = value(comment.d, 0);
            this.index = index;
        }
    }

    private Object[] snapshot = new Object[0];
    private ArrayList<?> source;
    private Item[] scrolling = new Item[0];
    final ArrayList<q> fixed = new ArrayList<>();
    final ArrayList<Item> due = new ArrayList<>();
    private int cursor;
    private long generation = Long.MIN_VALUE;
    private int fixedDuration;

    private boolean sameEntries(ArrayList<?> input) {
        if (source != input || snapshot.length != input.size()) return false;
        for (q comment : fixed) {
            if (value(comment.j, 0) == 0 && value(comment.l, 0) == 0) return false;
        }
        try {
            for (int i = 0; i < snapshot.length; i++) {
                if (snapshot[i] != input.get(i)) return false;
            }
        } catch (IndexOutOfBoundsException changedDuringRead) {
            return false;
        }
        return snapshot.length == input.size();
    }

    boolean update(ArrayList<?> input) {
        if (sameEntries(input)) return false;

        // Native updates normally hold the renderer monitor. A handoff can briefly share
        // the list between two renderers. Reject an unstable copy and retry next frame.
        Object[] copy;
        try {
            copy = input.toArray();
            if (copy.length != input.size()) throw new ConcurrentModificationException();
            for (int i = 0; i < copy.length; i++) {
                if (copy[i] != input.get(i)) throw new ConcurrentModificationException();
            }
        } catch (IndexOutOfBoundsException | ConcurrentModificationException changedDuringCopy) {
            return false;
        }
        boolean sorted = true;
        int last = Integer.MIN_VALUE;
        ArrayList<Item> moving = new ArrayList<>();
        fixed.clear();
        for (int index = 0; index < copy.length; index++) {
            Object object = copy[index];
            if (!(object instanceof q)) continue;
            q comment = (q) object;
            if (value(comment.j, 0) != 0 || value(comment.l, 0) != 0) {
                fixed.add(comment);
            } else {
                Item item = new Item(comment, index);
                sorted &= item.timestamp >= last;
                last = item.timestamp;
                moving.add(item);
            }
        }
        scrolling = moving.toArray(new Item[0]);
        if (!sorted) Arrays.sort(scrolling, BY_TIME);
        snapshot = copy;
        source = input;
        generation = Long.MIN_VALUE;
        fixedDuration = 0;
        return true;
    }

    void fixedDuration(int duration) {
        if (fixedDuration == duration) return;
        Integer boxed = duration;
        for (q comment : fixed) comment.k = boxed;
        fixedDuration = duration;
    }

    void due(long epoch, boolean changed, float earliest, float video) {
        if (changed || generation != epoch) {
            generation = epoch;
            cursor = lowerBound(earliest);
        }
        due.clear();
        while (cursor < scrolling.length && scrolling[cursor].timestamp <= video) {
            due.add(scrolling[cursor++]);
        }
        if (due.size() > 1) due.sort(BY_SOURCE);
    }

    private int lowerBound(float time) {
        int low = 0;
        int high = scrolling.length;
        while (low < high) {
            int mid = (low + high) >>> 1;
            if (scrolling[mid].timestamp < time) low = mid + 1;
            else high = mid;
        }
        return low;
    }

    static int value(Integer value, int fallback) {
        return value == null ? fallback : value;
    }
}
