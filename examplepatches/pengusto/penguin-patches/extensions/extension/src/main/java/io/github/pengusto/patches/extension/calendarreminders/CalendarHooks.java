/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.calendarreminders;

import android.app.Activity;
import android.content.Context;

/** Bound by the patch after validating the shipped Calendar 1.12.0 DEX. */
public final class CalendarHooks {
    private CalendarHooks() {}
    public static int[] read(Activity activity) { throw new IllegalStateException("Unbound Calendar read"); }
    public static void write(Activity activity, int[] values) { throw new IllegalStateException("Unbound Calendar write"); }
    public static boolean reuse(Context context) { throw new IllegalStateException("Unbound Calendar reuse"); }
    public static String format(Context context, int minutes) { throw new IllegalStateException("Unbound Calendar format"); }
    public static void allDay(Activity activity, boolean value) { throw new IllegalStateException("Unbound Calendar all-day switch"); }
}
