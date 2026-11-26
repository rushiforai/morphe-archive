package app.morphe.extension.chmate;

import java.lang.reflect.Field;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

public final class NewArrivalNumbers {
    static final String KEY = "countNewArrivalResponseNumbers";
    static boolean enabled() { return FeatureSwitches.enabled(KEY, true); }
    private static final Map<Object, Snapshot> SNAPSHOTS = new WeakHashMap<>();
    private static final ThreadLocal<Object> OWNER = new ThreadLocal<>();
    public static void owner(Object owner) { OWNER.set(owner); }
    private static Object takeOwner() { Object owner = OWNER.get(); OWNER.remove(); return owner; }
    public static int before(Collection<?> rows) { return before(takeOwner(), rows); }
    public static void after(Collection<?> rows) { after(takeOwner(), rows); }
    public static int count(int previous, int current) { return count(takeOwner(), previous, current); }
    private static final class Snapshot {
        final int last;
        Set<Integer> added;
        Snapshot(int last) { this.last = last; }
    }
    /** No boxed number set for old responses; resolve reflection once per row type. */
    private static int scan(Collection<?> rows, int threshold, Set<Integer> added) throws Exception {
        int last = 0;
        Class<?> type = null;
        Field number = null;
        boolean primitive = false;
        for (Object row : PopularReplies.fullList(rows)) {
            if (row == null) continue;
            if (type != row.getClass()) {
                type = row.getClass();
                number = NativeFields.find(type, type.getName().equals("o.BouncyCastleSocketAdapterCompanion") ? "l" : "o");
                primitive = number.getType() == int.class;
            }
            int value = primitive ? number.getInt(row) : ((Number) number.get(row)).intValue();
            last = Math.max(last, value);
            if (added != null && value > threshold) added.add(value);
        }
        return last;
    }
    public static int before(Object owner, Collection<?> rows) {
        synchronized (SNAPSHOTS) { SNAPSHOTS.remove(owner); }
        if (owner == null || !enabled()) return rows.size();
        try {
            Snapshot snapshot = new Snapshot(scan(rows, 0, null));
            synchronized (SNAPSHOTS) { SNAPSHOTS.put(owner, snapshot); }
        } catch (Exception unavailable) { }
        return rows.size();
    }
    public static void after(Object owner, Collection<?> rows) {
        Snapshot snapshot;
        synchronized (SNAPSHOTS) { snapshot = SNAPSHOTS.get(owner); }
        if (snapshot == null) return;
        Set<Integer> added = new HashSet<>();
        try { scan(rows, snapshot.last, added); }
        catch (Exception unavailable) { added = null; }
        synchronized (SNAPSHOTS) {
            if (SNAPSHOTS.get(owner) == snapshot)
                snapshot.added = added != null && added.isEmpty() ? Collections.emptySet() : added;
        }
    }
    public static int count(Object owner, int previous, int current) {
        Snapshot snapshot;
        synchronized (SNAPSHOTS) { snapshot = SNAPSHOTS.remove(owner); }
        if (!enabled() || snapshot == null || snapshot.added == null) return HiddenNgUnread.newArrivalCount(previous, current);
        return HiddenNgUnread.numberedNewArrivalCount(snapshot.added);
    }
    private NewArrivalNumbers() { }
}
