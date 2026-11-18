package patches.maps.gearslip;

import android.os.Bundle;
import java.util.LinkedHashMap;

/** Native saved-instance state, scoped to an authenticated host and the newest presentation. */
final class NativeUiStateStore {
    static final class Lease {
        final int uid; final long epoch; final Bundle restored;
        Lease(int uid, long epoch, Bundle restored) { this.uid = uid; this.epoch = epoch; this.restored = restored; }
    }
    private static final class Slot { long epoch; Bundle state; }
    private final int capacity;
    private final LinkedHashMap<Integer, Slot> hosts = new LinkedHashMap<>(8, .75f, true);
    private long sequence;
    NativeUiStateStore(int capacity) {
        if (capacity < 1) throw new IllegalArgumentException("Empty native state capacity");
        this.capacity = capacity;
    }
    synchronized Lease acquire(int uid) {
        Slot slot = hosts.get(uid);
        if (slot == null) { slot = new Slot(); hosts.put(uid, slot); }
        slot.epoch = ++sequence;
        while (hosts.size() > capacity) hosts.remove(hosts.keySet().iterator().next());
        return new Lease(uid, slot.epoch, copy(slot.state));
    }
    synchronized void save(Lease lease, Bundle state) {
        Slot slot = hosts.get(lease.uid);
        if (slot != null && slot.epoch == lease.epoch) slot.state = copy(state);
    }
    private static Bundle copy(Bundle state) { return state == null ? null : state.deepCopy(); }
}
