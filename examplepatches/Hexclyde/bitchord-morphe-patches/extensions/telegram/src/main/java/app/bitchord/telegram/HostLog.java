package app.bitchord.telegram;

import com.music.bitchord.data.TrackLog;

/** Lines in BitChord's own log (Player ••• → Copy log), so a report shows what Telegram did. */
final class HostLog {
    private HostLog() {}

    static void d(String message) {
        try {
            TrackLog.d("BitChord", message, null);
        } catch (Throwable ignored) {
            // Logging is never worth failing over.
        }
    }

    static String length(int seconds) {
        return seconds <= 0 ? "?" : seconds / 60 + ":" + String.format("%02d", seconds % 60);
    }
}
