package com.fyber.inneractive.sdk.util;

import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public abstract class c0 {
    public static String a(int i5) {
        if (i5 <= 0) {
            return "00:00:00.000";
        }
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        long j11 = i5;
        long hours = timeUnit.toHours(j11);
        TimeUnit timeUnit2 = TimeUnit.HOURS;
        long minutes = timeUnit.toMinutes(j11 - timeUnit2.toMillis(hours));
        long millis = j11 - timeUnit2.toMillis(hours);
        TimeUnit timeUnit3 = TimeUnit.MINUTES;
        long seconds = timeUnit.toSeconds(millis - timeUnit3.toMillis(minutes));
        return String.format("%02d:%02d:%02d.%03d", Long.valueOf(hours), Long.valueOf(minutes), Long.valueOf(seconds), Long.valueOf(timeUnit.toMillis(((j11 - timeUnit2.toMillis(hours)) - timeUnit3.toMillis(minutes)) - TimeUnit.SECONDS.toMillis(seconds))));
    }

    public static String a(long j11, long j12, long j13) {
        long j14 = (j11 - j12) - j13;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        long seconds = timeUnit.toSeconds(j14);
        long millis = timeUnit.toMillis(j14 - TimeUnit.SECONDS.toMillis(seconds));
        Locale locale = Locale.US;
        return seconds + "." + millis;
    }
}
