package app.danielthemaniel.patches.memoryeditor.extension;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Saved ("favorite") addresses, with freezing.
 *
 * Addresses inside a library (.data/.bss) are stored as module+offset, so they survive
 * relaunches (ASLR moves the base, not the offset). Heap addresses are session-only and
 * get marked stale on the next launch.
 */
final class SavedStore {
    private static final String TAG = "MemoryEditor";

    static final class Entry {
        String label;
        ValueType type;
        long addr;
        String module;      // null = session-only
        long offset;
        volatile boolean frozen;
        volatile long xFreeze; // ^ KEY
        boolean stale;
    }

    final List<Entry> entries = new CopyOnWriteArrayList<>();
    private final File file;

    SavedStore(File file) {
        this.file = file;
        load();
        ScheduledExecutorService freezer = Executors.newSingleThreadScheduledExecutor(r -> {
            Thread t = new Thread(r, "memeditor-freeze");
            t.setDaemon(true);
            return t;
        });
        freezer.scheduleWithFixedDelay(this::tick, 100, 50, TimeUnit.MILLISECONDS);
    }

    private void tick() {
        try {
            for (Entry e : entries) {
                if (e.frozen && !e.stale) MemIO.write(e.addr, e.type, e.xFreeze ^ MemIO.KEY);
            }
        } catch (Throwable t) {
            Log.w(TAG, "freeze tick", t); // never let the scheduled task die
        }
    }

    /** Adds an entry without saving; call {@link #save()} afterwards. */
    Entry add(List<MemMaps.Region> maps, long addr, ValueType type, String label) {
        Entry e = new Entry();
        e.addr = addr;
        e.type = type;
        e.label = label;
        MemMaps.Region r = MemMaps.find(maps, addr);
        if (r != null && r.module != null) {
            long base = MemMaps.moduleBase(maps, r.module);
            if (base >= 0) {
                e.module = r.module;
                e.offset = addr - base;
            }
        }
        entries.add(e);
        return e;
    }

    boolean setFrozen(Entry e, boolean on) {
        if (on) {
            long x = MemIO.readX(e.addr, e.type);
            if (x == MemIO.FAIL) return false;
            e.xFreeze = x;
        }
        e.frozen = on;
        save();
        return true;
    }

    boolean setValue(Entry e, long bits) {
        if (e.frozen) e.xFreeze = bits ^ MemIO.KEY;
        boolean ok = MemIO.write(e.addr, e.type, bits);
        if (e.frozen) save();
        return ok;
    }

    void remove(Entry e) {
        entries.remove(e);
        save();
    }

    void removeStale() {
        for (Entry e : entries) if (e.stale) entries.remove(e);
        save();
    }

    synchronized void save() {
        try {
            JSONArray arr = new JSONArray();
            for (Entry e : entries) {
                JSONObject o = new JSONObject();
                o.put("label", e.label);
                o.put("type", e.type.name());
                o.put("addr", e.addr);
                if (e.module != null) {
                    o.put("module", e.module);
                    o.put("offset", e.offset);
                }
                o.put("frozen", e.frozen);
                o.put("freeze", e.xFreeze ^ MemIO.KEY);
                arr.put(o);
            }
            File tmp = new File(file.getPath() + ".tmp");
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(arr.toString().getBytes(StandardCharsets.UTF_8));
            }
            //noinspection ResultOfMethodCallIgnored
            tmp.renameTo(file);
        } catch (Exception ex) {
            Log.w(TAG, "save", ex);
        }
    }

    private void load() {
        if (!file.exists()) return;
        try {
            JSONArray arr = new JSONArray(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
            List<MemMaps.Region> maps = MemMaps.read();
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.getJSONObject(i);
                Entry e = new Entry();
                e.label = o.optString("label", "Saved");
                e.type = ValueType.valueOf(o.optString("type", "DWORD"));
                e.addr = o.optLong("addr");
                e.module = o.has("module") ? o.getString("module") : null;
                e.offset = o.optLong("offset");
                e.xFreeze = o.optLong("freeze") ^ MemIO.KEY;
                if (e.module != null) {
                    // Library may not be loaded yet at startup (e.g. libil2cpp.so); resolved later.
                    long base = MemMaps.moduleBase(maps, e.module);
                    if (base >= 0) e.addr = base + e.offset;
                    else e.stale = true;
                } else {
                    e.stale = true; // heap address from a previous launch
                }
                e.frozen = o.optBoolean("frozen"); // the freezer skips stale entries
                entries.add(e);
            }
        } catch (Exception ex) {
            Log.w(TAG, "load", ex);
        }
    }

    /** Re-resolves module entries whose library wasn't loaded yet. Returns true if any changed. */
    boolean resolvePending(List<MemMaps.Region> maps) {
        boolean changed = false;
        for (Entry e : entries) {
            if (!e.stale || e.module == null) continue;
            long base = MemMaps.moduleBase(maps, e.module);
            if (base >= 0) {
                e.addr = base + e.offset;
                e.stale = false;
                changed = true;
            }
        }
        return changed;
    }
}
