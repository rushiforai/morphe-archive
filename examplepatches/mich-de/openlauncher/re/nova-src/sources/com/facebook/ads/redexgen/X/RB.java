package com.facebook.ads.redexgen.X;

import android.os.SystemClock;
import java.lang.Exception;

/* loaded from: assets/audience_network/classes.dex */
public final class RB<T extends Exception> {
    public static String[] A03 = {"8FywBV3Nq7ZD20BgHf3O25r", "B2JIbJxFw", "Dz3io2BnB0EVqlzDO7PK2c5dFAaKHefg", "DEslKluRK1ut1vmAXa5l8ClO7eaHe5tA", "yNEYcHYwlv9arr5PIN9bGPoBK3SG", "ylqrv0v6Wmz9dqtxiGAiuPaGqKuPsFK9", "xuHXMqi2", "xyNOqPCTCxuKxmD4K4"};
    public long A00;
    public T A01;
    public final long A02;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.RB != com.facebook.ads.androidx.media3.exoplayer.audio.DefaultAudioSink$PendingExceptionHolder<T extends java.lang.Exception> */
    public RB(long j11) {
        this.A02 = j11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.RB != com.facebook.ads.androidx.media3.exoplayer.audio.DefaultAudioSink$PendingExceptionHolder<T extends java.lang.Exception> */
    public final void A00() {
        this.A01 = null;
    }

    /* JADX INFO: Thrown type has an unknown type hierarchy: T extends java.lang.Exception */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.RB != com.facebook.ads.androidx.media3.exoplayer.audio.DefaultAudioSink$PendingExceptionHolder<T extends java.lang.Exception> */
    public final void A01(T t6) throws Exception {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (this.A01 == null) {
            this.A01 = t6;
            long j11 = this.A02 + jElapsedRealtime;
            if (A03[1].length() == 26) {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[0] = "TZEiRWWbMqr6MWKy4cH61dR";
            strArr[3] = "QegbPDxHMChvuOPnc1jETru3YY6D4Msr";
            this.A00 = j11;
        }
        if (jElapsedRealtime >= this.A00) {
            if (this.A01 != t6) {
                this.A01.addSuppressed(t6);
            }
            T t9 = this.A01;
            A00();
            throw t9;
        }
    }
}
