package com.facebook.ads.redexgen.X;

import android.os.Looper;
import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;

/* renamed from: com.facebook.ads.redexgen.X.jQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1990jQ {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 3);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{13, 72, 85, 89, 39, 107, 108, 123, 108, 106, 123, 108, 107, 65, -43, -31, -33, -96, -40, -45, -43, -41, -44, -31, -31, -35, -96, -45, -42, -27};
    }

    private Map<Thread, StackTraceElement[]> A01() {
        Map<Thread, StackTraceElement[]> stackTraces = new TreeMap<>(new C1989jP(this, Looper.getMainLooper().getThread()));
        stackTraces.putAll(Thread.getAllStackTraces());
        return stackTraces;
    }

    public final String A03() {
        Thread mainThread = Looper.getMainLooper().getThread();
        for (StackTraceElement element : mainThread.getStackTrace()) {
            if (element.getClassName().startsWith(A00(14, 16, 111))) {
                return element.toString();
            }
        }
        return null;
    }

    public final String A04(String str) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(A00(1, 13, 4));
        sb2.append(str);
        String strA00 = A00(0, 1, 0);
        sb2.append(strA00);
        for (Map.Entry<Thread, StackTraceElement[]> entry : A01().entrySet()) {
            sb2.append(entry.getKey().getName());
            sb2.append(strA00);
            for (StackTraceElement stackTraceElement : entry.getValue()) {
                sb2.append('\t');
                sb2.append(stackTraceElement.toString());
                sb2.append(strA00);
            }
        }
        return sb2.toString();
    }
}
