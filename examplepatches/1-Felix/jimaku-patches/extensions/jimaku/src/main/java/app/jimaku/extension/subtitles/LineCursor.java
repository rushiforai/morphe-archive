package app.jimaku.extension.subtitles;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The line on screen at a playback time, cheap to ask every frame: it walks forward, and searches
 * only after a seek back. A port of the extension's {@code lib/lookup.ts}; both run the shared
 * cases in {@code line-cursor.json}.
 */
public final class LineCursor {
    private final List<Line> lines;
    private int index = 0;

    /** The lines must be in order of their start, as subtitle documents are. */
    public LineCursor(List<Line> lines) {
        this.lines = Collections.unmodifiableList(new ArrayList<>(lines));
    }

    /** The line covering {@code t} seconds, or null in a gap, before the first or after the last. */
    public Line at(double t) {
        int size = lines.size();
        if (size == 0) return null;
        int i = index;
        if (i > 0 && t < lines.get(i - 1).end) i = firstEndingAfter(t);
        while (i < size && lines.get(i).end <= t) i++;
        index = i;
        if (i == size) return null;
        Line current = lines.get(i);
        return current.start <= t ? current : null;
    }

    private int firstEndingAfter(double t) {
        int lo = 0;
        int hi = lines.size();
        while (lo < hi) {
            int mid = (lo + hi) >>> 1;
            if (lines.get(mid).end <= t) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }
}
