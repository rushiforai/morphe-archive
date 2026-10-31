package com.bytedance.sdk.openadsdk.core.jc.zb;

import android.text.TextUtils;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public class zb {
    public static long[] ycx(String str, long j11) {
        long j12;
        long j13;
        if (str == null || str.isEmpty() || j11 <= 0) {
            return new long[]{0, j11 - 1};
        }
        Matcher matcher = Pattern.compile("bytes\\s*=\\s*(\\d*)\\s*-\\s*(\\d*)", 2).matcher(str);
        if (!matcher.matches()) {
            return new long[]{0, j11 - 1};
        }
        try {
            String strGroup = matcher.group(1);
            String strGroup2 = matcher.group(2);
            boolean zIsEmpty = TextUtils.isEmpty(strGroup);
            boolean zIsEmpty2 = TextUtils.isEmpty(strGroup2);
            if (zIsEmpty || zIsEmpty2) {
                if (!zIsEmpty) {
                    j12 = Long.parseLong(strGroup);
                } else {
                    if (zIsEmpty2) {
                        return new long[]{0, j11 - 1};
                    }
                    j12 = j11 - Long.parseLong(strGroup2);
                }
                j13 = j11 - 1;
            } else {
                j12 = Long.parseLong(strGroup);
                j13 = Long.parseLong(strGroup2);
            }
            return ycx(j12, j13, j11);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "ae8jkgaUbMaET8VomBisOw==", "S+8/hgaOaMmHTw==", 56);
            return new long[]{0, j11 - 1};
        }
    }

    private static long[] ycx(long j11, long j12, long j13) {
        if (j11 < 0) {
            j11 = 0;
        }
        if (j12 >= j13) {
            j12 = j13 - 1;
        }
        if (j11 > j12 || j11 >= j13) {
            return null;
        }
        return new long[]{j11, j12};
    }
}
