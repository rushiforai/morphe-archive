package app.nogoogle.gboard;

import android.content.Context;

/**
 * How long Gboard's clipboard keeps unpinned items and how many recent copies it shows (No-Google
 * settings → Clipboard), patched in by the "Clipboard history" patch. Gboard keeps items for 1 hour and
 * shows the 5 latest copies (items copied together count once), with at most 100 items in all.
 *
 * Gboard also saves the time of the oldest recent item it shows and from then on hides every unpinned
 * item older than that. With Gboard's 1 hour those are deleted within the hour; with a longer time
 * they would stay stored, unseen, so its cleanup deletes them too.
 */
@SuppressWarnings("unused")
public final class ClipboardHistory {
    private static final long HOUR_MS = 3_600_000L;
    // "Forever" is 100 years: Gboard subtracts the time from the current time, which Long.MAX_VALUE would overflow.
    private static final long FOREVER_MS = 100L * 365 * 24 * HOUR_MS;

    private ClipboardHistory() {
    }

    /** True when the "Clipboard history" patch was applied: the patch makes this return true. */
    public static boolean patched() {
        return false;
    }

    /** Patched at the start of Gboard's time limit for unpinned items: the chosen time, or 0 for Gboard's own. */
    public static long keepMillis() {
        String v = NoGoogleSettings.str(NoGoogleSettings.CLIPBOARD_KEEP);
        if ("forever".equals(v)) return FOREVER_MS;
        try {
            long hours = Long.parseLong(v);
            return hours > 0 ? hours * HOUR_MS : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /** Patched over the number of recent copies Gboard's clipboard shows. */
    public static int recentCopies(int stock) {
        try {
            int n = Integer.parseInt(NoGoogleSettings.str(NoGoogleSettings.CLIPBOARD_RECENT));
            return n > 0 ? n : stock;
        } catch (NumberFormatException e) {
            return stock;
        }
    }

    /** Patched over the cutoff of Gboard's cleanup of expired items. */
    public static long deleteBefore(long cutoff) {
        if (keepMillis() <= 0) return cutoff;
        Context c = ContextHolder.get();
        if (c == null) return cutoff;
        try {
            return Math.max(cutoff, hiddenBefore(c));
        } catch (Throwable t) {
            return cutoff;
        }
    }

    /** The time Gboard saved, from which it hides older unpinned items (0: none): the patch puts Gboard's own read here. */
    private static long hiddenBefore(Context context) {
        return 0;
    }
}
