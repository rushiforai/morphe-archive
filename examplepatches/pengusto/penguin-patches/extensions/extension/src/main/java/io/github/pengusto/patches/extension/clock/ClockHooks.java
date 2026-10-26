/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.clock;

import android.app.PendingIntent;
import android.content.Context;
import org.fossify.clock.models.Alarm;

/** Rebound to the exact verified original APK by UpcomingAlarmsPatch. */
public final class ClockHooks {
    private ClockHooks() {}
    public static PendingIntent mainIntent(Context context, Alarm alarm) { throw unbound(); }
    public static PendingIntent openIntent(Context context) { throw unbound(); }
    public static Alarm alarm(Context context, int id) { throw unbound(); }
    public static void finishOneTime(Context context, Alarm alarm) { throw unbound(); }
    public static void refresh(Context context) { throw unbound(); }
    public static boolean is24Hour(Context context) { throw unbound(); }
    public static void error(Context context, Exception error) { throw unbound(); }
    private static AssertionError unbound() { return new AssertionError("Unbound Clock 1.6.0 API"); }
}
