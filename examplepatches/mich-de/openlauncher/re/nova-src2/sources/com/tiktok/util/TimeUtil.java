package com.tiktok.util;

import android.annotation.SuppressLint;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes4.dex */
public class TimeUtil {

    @SuppressLint({"ConstantLocale"})
    private static final DateFormat sFormate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.getDefault());
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static String dateStr(int i5) {
        try {
            Calendar calendar = Calendar.getInstance();
            if (i5 != 0) {
                calendar.add(5, i5);
            }
            return sdf.format(calendar.getTime());
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static String getISO8601Timestamp(Date date) {
        try {
            TimeZone timeZone = TimeZone.getTimeZone("UTC");
            DateFormat dateFormat = sFormate;
            dateFormat.setTimeZone(timeZone);
            return dateFormat.format(date);
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static boolean isNowAfter(String str, int i5) {
        try {
            return dateStr(-i5).equals(str);
        } catch (Throwable unused) {
            return false;
        }
    }

    public static String getISO8601Timestamp() {
        try {
            return getISO8601Timestamp(new Date());
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }
}
