package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import com.facebook.ads.redexgen.X.X7;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class X6<T extends X7> extends Handler implements Runnable {
    public static byte[] A0B;
    public static String[] A0C = {"BBKUisyXzhvUO55VIGD4jtjPB1nnzchc", "WPDO1Zodp6MEGTCx8kNrs49f", "HmLjjzasNjjtQc5EQHMVXrqj3dGPxOzo", "ab2ep9frCMUoZJYCr2b17C9lNcStPa7s", "IL5kivsLTos5o95Afdj7ogQ", "OrtIg2gTUbcJI9VnhkSxYICgFjhL8Woa", "WpIt9F80DUA4cbBfskhz5JbxPBEJeJcZ", "4XkZCoLSAzPOPqGq7SqAgold1QPRArHQ"};
    public boolean A00;
    public int A01;
    public X4<T> A02;
    public IOException A03;
    public Thread A04;
    public boolean A05;
    public final int A06;
    public final long A07;
    public final T A08;
    public volatile boolean A09;
    public final /* synthetic */ C1177Ql A0A;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 50);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @MetaExoPlayerCustomization
    private void A02() {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        this.A02.AFl(this.A08, jElapsedRealtime, jElapsedRealtime - this.A07, this.A01);
        this.A03 = null;
        this.A0A.A02.execute((Runnable) AbstractC1062Ln.A01(this.A0A.A00));
    }

    public static void A04() {
        A0B = new byte[]{-128, -93, -107, -104, -120, -107, -89, -97, -28, 10, 9, -28, -5, -30, -6, 2, 4, 7, 14, -75, -6, 7, 7, 4, 7, -75, 1, 4, -10, -7, -2, 3, -4, -75, 8, 9, 7, -6, -10, 2, -61, -36, -45, -26, -34, -45, -47, -30, -45, -46, -114, -45, -32, -32, -35, -32, -114, -38, -35, -49, -46, -41, -36, -43, -114, -31, -30, -32, -45, -49, -37, -29, -4, -13, 6, -2, -13, -15, 2, -13, -14, -82, -13, 6, -15, -13, -2, 2, -9, -3, -4, -82, -10, -17, -4, -14, -6, -9, -4, -11, -82, -6, -3, -17, -14, -82, -15, -3, -5, -2, -6, -13, 2, -13, -14, -69, -44, -53, -34, -42, -53, -55, -38, -53, -54, -122, -53, -34, -55, -53, -42, -38, -49, -43, -44, -122, -46, -43, -57, -54, -49, -44, -51, -122, -39, -38, -40, -53, -57, -45, -5, -2, -16, -13, -55};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // android.os.Handler
    @MetaExoPlayerCustomization
    public final void handleMessage(Message message) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
        if (this.A09) {
            return;
        }
        if (message.what == 0) {
            A02();
            this.A00 = false;
            return;
        }
        if (message.what == 3) {
            throw ((Error) message.obj);
        }
        A03();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        long j11 = jElapsedRealtime - this.A07;
        X4 x42 = (X4) AbstractC1062Ln.A01(this.A02);
        if (this.A05) {
            x42.AFf(this.A08, jElapsedRealtime, j11, false);
            return;
        }
        switch (message.what) {
            case 1:
                try {
                    x42.AFh(this.A08, jElapsedRealtime, j11);
                    return;
                } catch (RuntimeException e3) {
                    MV.A08(A01(0, 8, 2), A01(71, 44, 92), e3);
                    this.A0A.A01 = new XB(e3);
                    return;
                }
            case 2:
                this.A03 = (IOException) message.obj;
                this.A01++;
                X5 x5AFi = x42.AFi(this.A08, jElapsedRealtime, j11, this.A03, this.A01);
                if (x5AFi.A00 == 3) {
                    this.A0A.A01 = this.A03;
                    return;
                }
                if (x5AFi.A00 != 2) {
                    int i5 = x5AFi.A00;
                    if (A0C[0].charAt(0) != 'B') {
                        throw new RuntimeException();
                    }
                    A0C[3] = "pGixaBcHRYsS2LogDdpQsFMu53vEjFXJ";
                    if (i5 == 1) {
                        this.A01 = 1;
                    }
                    this.A00 = true;
                    A06(x5AFi.A01 != -9223372036854775807L ? x5AFi.A01 : A00());
                    return;
                }
                return;
            default:
                return;
        }
        AbstractC2311oi.A00(th2, this);
    }

    static {
        A04();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X4 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$Callback<T extends com.facebook.ads.redexgen.X.X7> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    public X6(C1177Ql c1177Ql, Looper looper, T loadable, X4<T> x42, int i5, long j11) {
        super(looper);
        this.A0A = c1177Ql;
        this.A08 = loadable;
        this.A02 = x42;
        this.A06 = i5;
        this.A07 = j11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    @MetaExoPlayerCustomization
    private long A00() {
        return AbstractC1360Xx.A00(this.A01, 0);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    private void A03() {
        this.A0A.A00 = null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    public final void A05(int i5) throws IOException {
        if (this.A03 == null || this.A01 <= i5) {
        } else {
            throw this.A03;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    public final void A06(long j11) {
        AbstractC1062Ln.A08(this.A0A.A00 == null);
        this.A0A.A00 = this;
        if (j11 > 0) {
            sendEmptyMessageDelayed(0, j11);
        } else {
            A02();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    public final void A07(boolean z11) {
        this.A09 = z11;
        this.A03 = null;
        if (hasMessages(0)) {
            this.A05 = true;
            removeMessages(0);
            if (!z11) {
                sendEmptyMessage(1);
            }
        } else {
            synchronized (this) {
                this.A05 = true;
                this.A08.A5N();
                Thread thread = this.A04;
                if (thread != null) {
                    thread.interrupt();
                }
            }
        }
        if (z11) {
            A03();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            ((X4) AbstractC1062Ln.A01(this.A02)).AFf(this.A08, jElapsedRealtime, jElapsedRealtime - this.A07, true);
            this.A02 = null;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.X6 != com.facebook.ads.androidx.media3.exoplayer.upstream.Loader$LoadTask<T extends com.facebook.ads.redexgen.X.X7> */
    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        boolean z11;
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            try {
                try {
                    try {
                        synchronized (this) {
                            z11 = !this.A05;
                            this.A04 = Thread.currentThread();
                        }
                        if (z11) {
                            AbstractC1093Mt.A02(A01(PerAppFeatureCatalog.MAX_TOOLS, 5, 93) + this.A08.getClass().getSimpleName());
                            try {
                                this.A08.ABZ();
                            } finally {
                                AbstractC1093Mt.A00();
                            }
                        }
                        synchronized (this) {
                            this.A04 = null;
                            Thread.interrupted();
                        }
                        if (!this.A09) {
                            sendEmptyMessage(1);
                        }
                    } catch (Throwable th2) {
                        AbstractC2311oi.A00(th2, this);
                    }
                } catch (Error e3) {
                    if (!this.A09) {
                        MV.A08(A01(0, 8, 2), A01(40, 31, 60), e3);
                        obtainMessage(3, e3).sendToTarget();
                    }
                    throw e3;
                }
            } catch (Exception e11) {
                if (!this.A09) {
                    MV.A08(A01(0, 8, 2), A01(115, 35, 52), e11);
                    obtainMessage(2, new XB(e11)).sendToTarget();
                }
            }
        } catch (IOException e12) {
            if (!this.A09) {
                obtainMessage(2, e12).sendToTarget();
            }
        } catch (OutOfMemoryError e13) {
            if (!this.A09) {
                MV.A08(A01(0, 8, 2), A01(8, 32, 99), e13);
                obtainMessage(2, new XB(e13)).sendToTarget();
            }
        }
    }
}
