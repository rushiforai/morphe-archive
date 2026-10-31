package com.facebook.ads.redexgen.X;

import android.os.Debug;
import android.os.Handler;
import android.os.Looper;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.jO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1988jO extends Thread {
    public static byte[] A07;
    public static String[] A08 = {"22scehDHoaCOvZMprlsBZA8XDImDmfKB", "weKghC0VptQmI5ngiGaEXX", "Hf9H6", "FJiPG4ANJnN6", "MZm2fX9OE1lWAQp9g7i9e16yKVjr6LaO", "qv5p39sFFmKE2Upe5HhwzyNbLjT31UC6", "BSHanWyHkNGNXcGKwO9o06mFf", "6OihQTIk4xH7HyNYKpu4LMiaEL1fh7ec"};
    public static final String A09;
    public final int A00;
    public final Handler A01;
    public final C1990jQ A02;
    public final C0958Hi A03;
    public final Runnable A04;
    public volatile long A05;
    public volatile boolean A06;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A07 = new byte[]{97, 101, 10, 102, 105, 117, 10, 99, 66, 83, 66, 68, 83, 72, 85, 103, 101, 110, 101, 114, 105, 99};
    }

    static {
        A02();
        A09 = C1988jO.class.getName();
    }

    public C1988jO(C0958Hi c0958Hi, C1990jQ c1990jQ) {
        this(c0958Hi, c1990jQ, C2203mv.A06(c0958Hi));
    }

    public C1988jO(C0958Hi c0958Hi, C1990jQ c1990jQ, int i5) {
        this.A01 = new Handler(Looper.getMainLooper());
        this.A04 = new RunnableC1987jN(this);
        this.A05 = 0L;
        this.A06 = false;
        setName(A01(0, 15, 83));
        this.A00 = i5;
        this.A03 = c0958Hi;
        this.A02 = c1990jQ;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            long j11 = this.A00;
            while (!isInterrupted()) {
                long j12 = this.A05;
                String[] strArr = A08;
                if (strArr[1].length() != strArr[2].length()) {
                    String[] strArr2 = A08;
                    strArr2[3] = "QDJRY7exkP3l";
                    strArr2[6] = "zyOVtGNErBmKt3HrtbWcAlOC0";
                    boolean z11 = j12 == 0;
                    this.A05 = j11;
                    if (z11) {
                        this.A01.post(this.A04);
                    }
                    try {
                        Thread.sleep(j11);
                        if (this.A05 != 0 && !this.A06 && !Debug.isDebuggerConnected()) {
                            String strA03 = this.A02.A03();
                            if (strA03 != null) {
                                this.A03.A08().ABz(A01(15, 7, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), AbstractC2126lf.A1D, new C2127lg(this.A02.A04(strA03)));
                            }
                            this.A06 = true;
                        }
                    } catch (InterruptedException unused) {
                        BuildConfigApi.isDebug();
                        return;
                    }
                } else {
                    throw new RuntimeException();
                }
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
