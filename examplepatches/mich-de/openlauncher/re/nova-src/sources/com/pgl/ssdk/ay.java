package com.pgl.ssdk;

import java.util.Calendar;

/* loaded from: classes4.dex */
public class ay {
    public static void a(long j11) {
        try {
            Thread.sleep(j11);
        } catch (Throwable unused) {
        }
    }

    public static boolean a(long j11, long j12) {
        Calendar calendar = Calendar.getInstance();
        Calendar calendar2 = Calendar.getInstance();
        calendar.setTimeInMillis(j11);
        calendar2.setTimeInMillis(j12);
        return calendar.get(1) == calendar2.get(1) && calendar.get(2) == calendar2.get(2) && calendar.get(6) == calendar2.get(6);
    }
}
