package com.facebook.ads.redexgen.X;

import android.app.Activity;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.qy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2448qy {
    public static byte[] A00;
    public static String[] A01 = {"hdV441LwjlNtZv1709qxF0pnny4fVUPp", "ei12BejVo1CHpgyzoQPUfc", "Ngx5CnSLKehr5gInaBo3fbR58cj0cWuD", "KjX1pG4Uk1LfU8Dcrr9VX", "a0G5nH", "Lj0Juqqdj67gjngfjpTqdTQ77lTPdRGa", "RNVdSSMaTLUgDkR28FbRvDpDNW12NXcx", "b5BIPohyMmnUdzrQJ3rYHZFdjlu3USou"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[4].length() == 15) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[6] = "rGVas5AoEaq3cBsrCvDeMYMBThCVzhB5";
            strArr[5] = "o0fRmV5yhDY9KCH9v50URkZ7Eg4hKean";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 117);
            i13++;
        }
    }

    public static void A01() {
        A00 = new byte[]{43, 41, 50, 41, 54, 45, 39};
    }

    static {
        A01();
    }

    public static void A02(Activity activity, int i5, C0958Hi c0958Hi) {
        try {
            activity.setRequestedOrientation(i5);
        } catch (IllegalStateException e3) {
            c0958Hi.A08().ACp(A00(0, 7, 79), AbstractC2126lf.A0H, new C2127lg(e3));
        }
    }
}
