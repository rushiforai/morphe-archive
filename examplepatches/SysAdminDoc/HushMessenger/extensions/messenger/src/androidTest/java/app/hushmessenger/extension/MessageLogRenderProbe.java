package app.hushmessenger.extension;

import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.os.Debug;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import java.lang.reflect.Field;
import java.util.Locale;

/**
 * Measures the message log viewer with a small log and one at its retention limit, on the UI preview only. The log is
 * filled through MessageLog's own queue and write, so it's encrypted with the preview's keystore key like a real one,
 * and every entry is made-up text. The viewer is opened from its button. The longest gap between two frames while it
 * opens and while its list scrolls is what a person sees as a freeze. The log is cleared and the switch put back after.
 */
final class MessageLogRenderProbe {
    /**
     * The longest frame gap opening or scrolling may take. Past it reads as a freeze. The S25 scrolled the full log with
     * 100 ms at most (2026-11-03) and the S22 also stayed near 100 ms, so this leaves headroom.
     */
    static final double MAX_GAP_MS = 700;

    private final Instrumentation instrumentation;
    private final Context target;
    /** A main-thread stall put in on purpose while the viewer opens, to show the probe fails on a freeze. */
    private final long stallMs;

    MessageLogRenderProbe(Instrumentation instrumentation, long stallMs) {
        this.instrumentation = instrumentation;
        this.target = instrumentation.getTargetContext();
        this.stallMs = stallMs;
    }

    /** One line per log size, for the instrumentation result. */
    String run() throws Exception {
        if (!"app.hushmessenger.extension".equals(target.getPackageName())) throw new AssertionError("Run this probe against the UI preview only");
        Settings.initialize(target);
        if (CrashGuard.isSafeMode()) throw new AssertionError("The preview is in safe mode, so its log keeps nothing");
        // A paused preview keeps nothing either, so the run unpauses it and puts it back after.
        boolean wasOn = Settings.preferences.getBoolean(MessageLog.KEY, false);
        boolean wasPaused = Settings.preferences.getBoolean("paused", false);
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean("paused", false).commit();
        try {
            return measure("small", 10, 120) + "\n" + measure("limit", MessageLog.MAX_ENTRIES, 4_000);
        } finally {
            try {
                MessageLog.clear();
            } finally {
                Settings.preferences.edit().putBoolean(MessageLog.KEY, wasOn).putBoolean("paused", wasPaused).commit();
            }
        }
    }

    private String measure(String name, int count, int chars) throws Exception {
        if (!MessageLog.clear()) throw new AssertionError("Couldn't clear the preview's log");
        // The ids repeat between sizes, and a remembered one would be taken for a second copy and dropped.
        MessageLog.forgetCaptures();
        long seeded = SystemClock.elapsedRealtime();
        seed(count, chars);
        MessageLog.LoadResult stored = MessageLog.loadResult();
        if (stored.failed) throw new AssertionError("The seeded log doesn't load");
        // The size cap may drop the oldest of a big seed, but an empty or short log would measure nothing.
        int least = Math.min(count, 2 * MessageLogSheet.MESSAGE_LOG_PAGE);
        if (stored.entries.size() < least) throw new AssertionError(name + ": the seeded log holds " + stored.entries.size() + " of " + count + " entries");
        long plainBytes = 0;
        for (MessageLog.Entry entry : stored.entries) plainBytes += entry.text.length() + entry.sender.length() + entry.chat.length() + entry.thread.length();
        seeded = SystemClock.elapsedRealtime() - seeded;

        SettingsActivity settings = (SettingsActivity) instrumentation.startActivitySync(new Intent(Intent.ACTION_MAIN)
            .setClassName(target, SettingsActivity.class.getName()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK));
        try {
            instrumentation.waitForIdleSync();
            View open = find(settings, "message_log_view");
            if (open == null) {
                instrumentation.runOnMainSync(() -> { View tab = settings.getWindow().getDecorView().findViewWithTag("tab_controls"); if (tab != null) tab.performClick(); });
                instrumentation.waitForIdleSync();
                open = find(settings, "message_log_view");
            }
            if (open == null) throw new AssertionError("No message log button in the preview's settings");
            long pssBefore = pss();
            FrameGaps opening = new FrameGaps();
            instrumentation.runOnMainSync(opening::start);
            long clicked = SystemClock.elapsedRealtime();
            final View button = open;
            instrumentation.runOnMainSync(button::performClick);
            if (stallMs > 0) settings.runOnUiThread(() -> SystemClock.sleep(stallMs));
            // The cards go in the results column, under the search box, the filters and the save buttons.
            int total = stored.entries.size(), firstPage = Math.min(total, MessageLogSheet.MESSAGE_LOG_PAGE);
            LinearLayout list = null;
            long shownAt = -1;
            while (SystemClock.elapsedRealtime() - clicked < 60_000) {
                list = resultsOf(settings);
                if (children(list) >= firstPage) { shownAt = SystemClock.elapsedRealtime(); break; }
                SystemClock.sleep(5);
            }
            if (shownAt < 0) throw new AssertionError("The viewer didn't show its first " + firstPage + " entries within 60 s");
            SystemClock.sleep(1_000);
            instrumentation.runOnMainSync(opening::stop);
            long pssOpen = pss();

            // A steady scroll to the very end at half a screen a frame, faster than a hard fling, building every page on the way.
            FrameGaps scrolling = new FrameGaps();
            ScrollView scroll = scrollOf(list);
            if (scroll == null) throw new AssertionError("The viewer's list isn't in a ScrollView");
            final LinearLayout cards = list;
            int[] height = {0};
            instrumentation.runOnMainSync(() -> height[0] = scroll.getHeight());
            int step = Math.max(60, height[0] / 2);
            int[] travelled = {0};
            instrumentation.runOnMainSync(scrolling::start);
            Object done = new Object();
            boolean[] finished = {false};
            long scrollStart = SystemClock.elapsedRealtime();
            instrumentation.runOnMainSync(() -> Choreographer.getInstance().postFrameCallback(new Choreographer.FrameCallback() {
                @Override public void doFrame(long frameTimeNanos) {
                    int before = scroll.getScrollY();
                    scroll.scrollBy(0, step);
                    travelled[0] += scroll.getScrollY() - before;
                    boolean atEnd = scroll.getScrollY() >= scroll.getChildAt(0).getHeight() - scroll.getHeight();
                    if (!(atEnd && cards.getChildCount() >= total) && SystemClock.elapsedRealtime() - scrollStart < 120_000) {
                        Choreographer.getInstance().postFrameCallback(this);
                        return;
                    }
                    synchronized (done) { finished[0] = true; done.notifyAll(); }
                }
            }));
            synchronized (done) { long until = SystemClock.elapsedRealtime() + 125_000; while (!finished[0] && SystemClock.elapsedRealtime() < until) done.wait(1_000); }
            long scrolledMs = SystemClock.elapsedRealtime() - scrollStart;
            instrumentation.waitForIdleSync();
            instrumentation.runOnMainSync(scrolling::stop);
            int reached = children(list);
            if (reached < total) throw new AssertionError("Scrolling reached " + reached + " of " + total + " entries");
            long pssAll = pss();
            String report = String.format(Locale.US,"%s: entries=%d chars=%d seeded_ms=%d first_page_ms=%d open_max_gap_ms=%.1f open_frames_over_700ms=%d "
                    + "scroll_px=%d scroll_ms=%d scroll_max_gap_ms=%.1f scroll_frames_over_32ms=%d scroll_frames_over_700ms=%d of %d pss_kb=%d->%d->%d",
                name, total, plainBytes, seeded, shownAt - clicked, opening.maxMs(), opening.over(700), travelled[0], scrolledMs,
                scrolling.maxMs(), scrolling.over(32), scrolling.over(700), scrolling.frames, pssBefore, pssOpen, pssAll);
            if (opening.maxMs() > MAX_GAP_MS || scrolling.maxMs() > MAX_GAP_MS)
                throw new AssertionError("A frame gap passed " + MAX_GAP_MS + " ms. " + report);
            return report;
        } finally {
            instrumentation.runOnMainSync(settings::finish);
            instrumentation.waitForIdleSync();
        }
    }

    /** Fills the log through its own queue and write. Names go in through the notes Auto reply leaves, like a capture's. */
    private static void seed(int count, int chars) {
        StringBuilder words = new StringBuilder();
        String[] pool = {"lorem", "ipsum", "dolor", "sit", "amet", "message", "probe", "text", "chat", "later", "today", "maybe"};
        for (int i = 0; words.length() < chars; i++) words.append(pool[i % pool.length]).append(i % 17 == 16 ? "\n" : " ");
        String text = words.substring(0, chars);
        for (int start = 0; start < count; start += 50) {
            for (int i = start; i < Math.min(count, start + 50); i++) {
                String thread = "probe-thread-" + (i % 25);
                String id = "probe-" + i;
                synchronized (MessageLog.NOTED) {
                    MessageLog.NOTED.put(thread + '\u0000' + id, new String[] {"Probe sender " + (i % 25), i % 3 == 0 ? "Probe group " + (i % 25) : ""});
                }
                MessageLog.queue(i + " " + text, thread, id);
            }
            MessageLog.drain();
        }
    }

    private View find(SettingsActivity settings, String tag) {
        View[] found = {null};
        instrumentation.runOnMainSync(() -> found[0] = settings.getWindow().getDecorView().findViewWithTag(tag));
        return found[0];
    }

    private static LinearLayout resultsOf(SettingsActivity settings) throws Exception {
        Field sheet = SettingsActivity.class.getDeclaredField("messageLog");
        sheet.setAccessible(true);
        Field field = MessageLogSheet.class.getDeclaredField("messageLogResults");
        field.setAccessible(true);
        return (LinearLayout) field.get(sheet.get(settings));
    }

    private int children(LinearLayout list) {
        int[] count = {0};
        instrumentation.runOnMainSync(() -> count[0] = list == null ? 0 : list.getChildCount());
        return count[0];
    }

    private static ScrollView scrollOf(View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof ScrollView) return (ScrollView) parent;
        }
        return null;
    }

    private static long pss() {
        Debug.MemoryInfo memory = new Debug.MemoryInfo();
        Debug.getMemoryInfo(memory);
        return memory.getTotalPss();
    }

    /** The gaps between frames, read from the main thread's frame callbacks. */
    private static final class FrameGaps implements Choreographer.FrameCallback {
        private boolean running;
        private long last = -1, max;
        private final java.util.List<Long> gaps = new java.util.ArrayList<>();
        int frames;

        void start() { running = true; last = -1; Choreographer.getInstance().postFrameCallback(this); }

        void stop() { running = false; }

        @Override public void doFrame(long frameTimeNanos) {
            if (!running) return;
            if (last >= 0) {
                long gap = frameTimeNanos - last;
                gaps.add(gap);
                max = Math.max(max, gap);
                frames++;
            }
            last = frameTimeNanos;
            Choreographer.getInstance().postFrameCallback(this);
        }

        double maxMs() { return max / 1_000_000.0; }

        int over(long ms) {
            int n = 0;
            for (long gap : gaps) if (gap > ms * 1_000_000L) n++;
            return n;
        }
    }
}
