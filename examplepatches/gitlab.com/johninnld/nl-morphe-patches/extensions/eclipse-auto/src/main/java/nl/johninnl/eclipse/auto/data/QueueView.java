package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The Up Next screen's view model: sections in playback order (the order shown is the order
 * consumed), capped at {@link #ROW_CAP} rows. Pure data, built from an {@link Model.QueueSnapshot}.
 */
public final class QueueView {
    public static final int ROW_CAP = 100;

    /** One queue row. {@code index} is the Up Next position or the absolute context index (-1: unknown). */
    public static final class Row {
        public final Model.Track track;
        public final int index;

        Row(Model.Track track, int index) {
            this.track = track;
            this.index = index;
        }
    }

    public final Model.Track nowPlaying;
    public final List<Row> upNext;
    public final List<Row> context;
    public final String originName;
    public final boolean remoteSession;

    private QueueView(Model.Track nowPlaying, List<Row> upNext, List<Row> context, String originName, boolean remote) {
        this.nowPlaying = nowPlaying;
        this.upNext = Collections.unmodifiableList(upNext);
        this.context = Collections.unmodifiableList(context);
        this.originName = originName;
        this.remoteSession = remote;
    }

    /** True when anything is queued after the current song. */
    public boolean hasUpcoming() { return !upNext.isEmpty() || !context.isEmpty(); }

    /** True when the "Clear" action applies: it only ever clears Up Next. */
    public boolean clearable() { return !upNext.isEmpty(); }

    /** The section title for the context tail. */
    public String contextTitle() { return originName.isEmpty() ? "Next up" : "Next from " + originName; }

    public static QueueView of(Model.QueueSnapshot snapshot) {
        List<Row> up = new ArrayList<>();
        for (int k = 0; k < snapshot.upNext.size() && up.size() < ROW_CAP; k++) up.add(new Row(snapshot.upNext.get(k), k));
        int[] absolute = contextIndices(snapshot.contextSongs, snapshot.currentIndex, snapshot.tail);
        List<Row> tail = new ArrayList<>();
        for (int j = 0; j < snapshot.tail.size() && up.size() + tail.size() < ROW_CAP; j++) {
            tail.add(new Row(snapshot.tail.get(j), absolute[j]));
        }
        return new QueueView(snapshot.nowPlaying, up, tail, snapshot.originName, snapshot.remoteSession);
    }

    /**
     * Absolute positions of the context tail in the app's queue. In playing order the tail is the
     * songs after the current index; when the app shuffles, the tail follows its own order, so a
     * song that is not where playing order puts it is found by identity, searching forward from the
     * current index and then from the start. A song that cannot be found gets -1 (not tappable).
     */
    static int[] contextIndices(List<Object> all, int current, List<Model.Track> tail) {
        int[] result = new int[tail.size()];
        for (int j = 0; j < result.length; j++) {
            Object song = tail.get(j).song;
            int direct = current + 1 + j;
            if (direct >= 0 && direct < all.size() && all.get(direct) == song) {
                result[j] = direct;
                continue;
            }
            int found = -1;
            for (int i = Math.max(0, current + 1); i < all.size() && found < 0; i++) if (all.get(i) == song) found = i;
            for (int i = 0; i <= current && i < all.size() && found < 0; i++) if (all.get(i) == song) found = i;
            result[j] = found;
        }
        return result;
    }
}
