package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Correct a zero count-delta toast when deleted rows offset newly received replies. */
public final class NewArrivalCountFallback {
    private static final long MAX_AGE_MS = 30_000L;
    private static final int MAX_THREADS = 32;
    private static final Map<String, Snapshot> SNAPSHOTS = new LinkedHashMap<String, Snapshot>(16, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Snapshot> entry) {
            return size() > MAX_THREADS;
        }
    };

    private static final class Snapshot {
        final long startedAt = android.os.SystemClock.uptimeMillis();
        final int previousMaximum;
        int fallbackCount;
        boolean fallbackReady;
        Snapshot(int previousMaximum) { this.previousMaximum = previousMaximum; }
    }

    /** Called immediately before ChMate starts applying the update response. */
    public static void begin(Collection<?> rows) {
        String key = visibleThreadKey();
        if (key == null || rows == null) return;
        try {
            Snapshot snapshot = new Snapshot(maximumResponseNumber(rows));
            synchronized (SNAPSHOTS) {
                prune();
                SNAPSHOTS.put(key, snapshot);
            }
        } catch (Exception ignored) {
            clear(key);
        }
    }

    /** Called after ChMate has merged the fetched responses into its model. */
    public static void after(Collection<?> rows) {
        String key = visibleThreadKey();
        if (key == null || rows == null) return;
        Snapshot snapshot;
        synchronized (SNAPSHOTS) {
            prune();
            snapshot = SNAPSHOTS.get(key);
        }
        calculateFallback(key, snapshot, rows);
    }

    /** Keep ChMate's regular count for normal updates; inspect IDs only when it says zero. */
    public static int count(int previousTotal, int currentTotal) {
        int standard = HiddenNgUnread.newArrivalCount(previousTotal, currentTotal);
        return countForKey(visibleThreadKey(), previousTotal, currentTotal, standard);
    }

    static void beginForKey(String key, Collection<?> rows) throws Exception {
        if (key == null || rows == null) return;
        synchronized (SNAPSHOTS) {
            prune();
            SNAPSHOTS.put(key, new Snapshot(maximumResponseNumber(rows)));
        }
    }

    static void afterForKey(String key, Collection<?> rows) {
        if (key == null || rows == null) return;
        Snapshot snapshot;
        synchronized (SNAPSHOTS) {
            prune();
            snapshot = SNAPSHOTS.get(key);
        }
        calculateFallback(key, snapshot, rows);
    }

    private static void calculateFallback(String key, Snapshot snapshot, Collection<?> rows) {
        if (snapshot == null) return;
        int count;
        try { count = countNewResponseNumbers(key, snapshot.previousMaximum, rows); }
        catch (Exception ignored) {
            synchronized (SNAPSHOTS) { if (SNAPSHOTS.get(key) == snapshot) snapshot.fallbackReady = false; }
            return;
        }
        synchronized (SNAPSHOTS) {
            if (SNAPSHOTS.get(key) == snapshot) {
                snapshot.fallbackCount = count;
                snapshot.fallbackReady = true;
            }
        }
    }

    static int countForKey(String key, int previousTotal, int currentTotal) throws Exception {
        return countForKey(key, previousTotal, currentTotal,
                HiddenNgUnread.newArrivalCount(previousTotal, currentTotal));
    }

    private static int countForKey(String key, int previousTotal, int currentTotal, int standard) {
        if (key == null) return standard;
        Snapshot snapshot;
        synchronized (SNAPSHOTS) {
            prune();
            snapshot = SNAPSHOTS.remove(key);
        }
        return standard != 0 || snapshot == null || !snapshot.fallbackReady ? standard : snapshot.fallbackCount;
    }

    static int countNewResponseNumbers(String key, int previousMaximum, Collection<?> rows) throws Exception {
        List<?> list = PopularReplies.fullList(rows);
        int direction = direction(list);
        int count = 0;
        if (direction > 0) {
            int last = Integer.MIN_VALUE;
            for (int i = list.size() - 1; i >= 0; i--) {
                int number = number(list.get(i));
                if (number <= previousMaximum) break;
                if (number > 0 && number != last && !HiddenNgUnread.isHiddenNewArrival(key, number)) count++;
                if (last != Integer.MIN_VALUE && number > last) return countUnordered(key, previousMaximum, list);
                last = number;
            }
            return count;
        }
        if (direction < 0) {
            int last = Integer.MIN_VALUE;
            for (Object row : list) {
                int number = number(row);
                if (number <= previousMaximum) break;
                if (number > 0 && number != last && !HiddenNgUnread.isHiddenNewArrival(key, number)) count++;
                if (last != Integer.MIN_VALUE && number > last) return countUnordered(key, previousMaximum, list);
                last = number;
            }
            return count;
        }
        return countUnordered(key, previousMaximum, list);
    }

    private static int countUnordered(String key, int previousMaximum, List<?> rows) throws Exception {
        Set<Integer> seen = new HashSet<>();
        int count = 0;
        for (Object row : rows) {
            int number = number(row);
            if (number > previousMaximum && number > 0 && seen.add(number)
                    && !HiddenNgUnread.isHiddenNewArrival(key, number)) count++;
        }
        return count;
    }

    private static int maximumResponseNumber(Collection<?> rows) throws Exception {
        List<?> list = PopularReplies.fullList(rows);
        if (list.isEmpty()) return 0;
        int direction = direction(list);
        if (direction > 0) return number(list.get(list.size() - 1));
        if (direction < 0) return number(list.get(0));
        int maximum = 0;
        for (Object row : list) maximum = Math.max(maximum, number(row));
        return maximum;
    }

    /** Natural response order is verified at the first, middle and last rows. */
    private static int direction(List<?> rows) throws Exception {
        if (rows.size() < 2) return 1;
        int first = number(rows.get(0));
        int middle = number(rows.get(rows.size() / 2));
        int last = number(rows.get(rows.size() - 1));
        if (first <= middle && middle <= last) return 1;
        if (first >= middle && middle >= last) return -1;
        return 0;
    }

    private static int number(Object row) throws Exception {
        if (row == null) return 0;
        Field field = NativeFields.find(row.getClass(),
                row.getClass().getName().equals("o.BouncyCastleSocketAdapterCompanion") ? "l" : "o");
        Object value = field.get(row);
        return value instanceof Number ? ((Number) value).intValue() : 0;
    }

    private static String visibleThreadKey() {
        FilterPosition.ThreadTarget target = FilterPosition.currentVisibleThread();
        return target == null ? null : target.ngKey;
    }

    private static void clear(String key) {
        synchronized (SNAPSHOTS) { SNAPSHOTS.remove(key); }
    }

    private static void prune() {
        long now = android.os.SystemClock.uptimeMillis();
        for (Iterator<Map.Entry<String, Snapshot>> iterator = SNAPSHOTS.entrySet().iterator(); iterator.hasNext();) {
            if (now - iterator.next().getValue().startedAt > MAX_AGE_MS) iterator.remove();
        }
    }

    private NewArrivalCountFallback() { }
}
