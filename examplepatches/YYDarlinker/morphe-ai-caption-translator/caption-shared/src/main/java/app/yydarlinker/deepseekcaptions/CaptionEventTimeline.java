package app.yydarlinker.deepseekcaptions;

import java.util.Arrays;

/** Immutable correspondence between joined text and its original event windows, plus pause hints. */
final class CaptionEventTimeline {
    private final int[] offsets;
    private final long[] starts, ends, pauses;

    CaptionEventTimeline(int[] offsets, long[] starts, long[] ends, long[] pauses) {
        if (offsets.length != starts.length + 1 || starts.length != ends.length)
            throw new IllegalArgumentException("event_timeline");
        for (int i = 0; i < starts.length; i++)
            if (offsets[i] < 0 || offsets[i + 1] <= offsets[i] || ends[i] <= starts[i]
                    || i > 0 && starts[i] < ends[i - 1])
                throw new IllegalArgumentException("event_timeline_order");
        this.offsets = offsets.clone();
        this.starts = starts.clone();
        this.ends = ends.clone();
        this.pauses = pauses == null ? null : pauses.clone();
    }

    long[] pauses() { return pauses == null ? null : pauses.clone(); }

    boolean covers(String text) {
        return starts.length > 1 && offsets[0] == 0 && offsets[starts.length] == text.length();
    }

    long interiorEnd(int offset) {
        for (int i = 0; i < starts.length; i++)
            if (offset > offsets[i] && offset < offsets[i + 1]) return ends[i];
        return -1; // An exact source seam is fixed, never stretched for reading convenience.
    }

    /** Exact event seams; inside an event only a reading estimate, never word alignment. */
    long at(String text, int offset, CaptionRenderSpec spec) {
        for (int i = 0; i < starts.length; i++) {
            if (offset == offsets[i]) return starts[i];
            if (offset < offsets[i + 1]) {
                int total = Math.max(1, spec.readingUnits(text.substring(offsets[i], offsets[i + 1])));
                int before = spec.readingUnits(text.substring(offsets[i], offset));
                return starts[i] + (ends[i] - starts[i]) * before / total;
            }
        }
        return ends[ends.length - 1];
    }

    @Override public String toString() {
        return Arrays.toString(offsets) + Arrays.toString(starts) + Arrays.toString(ends)
                + Arrays.toString(pauses);
    }
}
