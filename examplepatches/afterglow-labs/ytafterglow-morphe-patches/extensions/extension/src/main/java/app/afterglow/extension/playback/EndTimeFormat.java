package app.afterglow.extension.playback;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/** iOS addEndTime: round each media time to seconds, then account for playback rate. */
public final class EndTimeFormat {
    private EndTimeFormat() {}

    public static String format(long nowMs, long durationMs, long positionMs, float speed,
                                boolean twentyFourHour, TimeZone zone) {
        if (durationMs <= 0 || positionMs < 0) return "";
        double rate = speed > 0 && Float.isFinite(speed) ? speed : 1.0;
        long remainingSeconds = Math.round(durationMs / 1000.0) - Math.round(positionMs / 1000.0);
        long finishMs = nowMs + Math.round(remainingSeconds * 1000.0 / rate);
        SimpleDateFormat clock = new SimpleDateFormat(twentyFourHour ? "HH:mm" : "h:mm a", Locale.US);
        clock.setTimeZone(zone);
        return clock.format(new Date(finishMs));
    }
}
