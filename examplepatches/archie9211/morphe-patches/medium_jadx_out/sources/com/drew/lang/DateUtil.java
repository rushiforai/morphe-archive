package com.drew.lang;

import java.util.Date;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class DateUtil {
    private static final long EPOCH_1_JAN_1904 = -2082844800000L;
    private static int[] _daysInMonth365 = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    public static Date get1Jan1904EpochDate(long j) {
        return new Date((j * 1000) + EPOCH_1_JAN_1904);
    }

    public static boolean isValidDate(int i, int i2, int i3) {
        if (i >= 1 && i <= 9999 && i2 >= 0 && i2 <= 11) {
            int i4 = _daysInMonth365[i2];
            if (i2 == 1 && i % 4 == 0 && (i % 100 != 0 || i % 400 == 0)) {
                i4++;
            }
            if (i3 >= 1 && i3 <= i4) {
                return true;
            }
        }
        return false;
    }

    public static boolean isValidTime(int i, int i2, int i3) {
        return i >= 0 && i < 24 && i2 >= 0 && i2 < 60 && i3 >= 0 && i3 < 60;
    }
}
