package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.facebook.ads.redexgen.X.qg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ThreadFactoryC2430qg implements ThreadFactory {
    public static byte[] A03;
    public final AtomicInteger A00 = new AtomicInteger(1);
    public final /* synthetic */ ExecutorC2431qh A01;
    public final /* synthetic */ String A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 41);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{96, 103, 104, 28, 3, 85, 6, 5, 3, 66, 43, 55, 45, 58, 62, 59, 44, 0, 60, 48, 42, 49, 43, 58, 45, 0, 44, 55, 48, 45, 43, 0, 43, 62, 44, 52, 0, 58, 39, 58, 60, 42, 43, 48, 45};
    }

    public ThreadFactoryC2430qg(ExecutorC2431qh executorC2431qh, String str) {
        this.A01 = executorC2431qh;
        this.A02 = str;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        AbstractC2132ll.A00(A00(10, 35, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        return new Thread(runnable, String.format(Locale.US, A00(0, 10, 15), this.A02, Integer.valueOf(this.A00.getAndIncrement())));
    }
}
