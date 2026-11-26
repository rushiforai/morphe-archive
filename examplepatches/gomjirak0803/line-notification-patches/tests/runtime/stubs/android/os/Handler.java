package android.os;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Handler {
    private static final class Entry {
        final Handler handler;
        final Runnable runnable;
        final long triggerAtMillis;

        Entry(Handler handler, Runnable runnable, long triggerAtMillis) {
            this.handler = handler;
            this.runnable = runnable;
            this.triggerAtMillis = triggerAtMillis;
        }
    }

    private static final List<Entry> QUEUE = new ArrayList<Entry>();
    private static long nowMillis = 0L;

    public Handler(Looper looper) {}

    public boolean post(Runnable r) {
        return postDelayed(r, 0L);
    }

    public boolean postDelayed(Runnable r, long delayMillis) {
        if (r == null) return false;
        synchronized (QUEUE) {
            QUEUE.add(new Entry(this, r, nowMillis + Math.max(0L, delayMillis)));
        }
        return true;
    }

    public void removeCallbacks(Runnable r) {
        if (r == null) return;
        synchronized (QUEUE) {
            Iterator<Entry> it = QUEUE.iterator();
            while (it.hasNext()) {
                Entry e = it.next();
                if (e.handler == this && e.runnable == r) {
                    it.remove();
                }
            }
        }
    }

    public static void resetForTest() {
        synchronized (QUEUE) {
            QUEUE.clear();
            nowMillis = 0L;
        }
    }

    public static long nowMillisForTest() {
        synchronized (QUEUE) {
            return nowMillis;
        }
    }

    public static int pendingCountForTest() {
        synchronized (QUEUE) {
            return QUEUE.size();
        }
    }

    public static List<Long> pendingDelaysForTest() {
        synchronized (QUEUE) {
            List<Long> delays = new ArrayList<Long>();
            for (Entry e : QUEUE) {
                delays.add(Long.valueOf(Math.max(0L, e.triggerAtMillis - nowMillis)));
            }
            return delays;
        }
    }

    public static int advanceByForTest(long millis) {
        List<Runnable> due = new ArrayList<Runnable>();
        synchronized (QUEUE) {
            nowMillis += Math.max(0L, millis);
            Iterator<Entry> it = QUEUE.iterator();
            while (it.hasNext()) {
                Entry e = it.next();
                if (e.triggerAtMillis <= nowMillis) {
                    due.add(e.runnable);
                    it.remove();
                }
            }
        }
        for (Runnable r : due) {
            r.run();
        }
        return due.size();
    }

    public static int drainImmediateForTest() {
        return advanceByForTest(0L);
    }
}
