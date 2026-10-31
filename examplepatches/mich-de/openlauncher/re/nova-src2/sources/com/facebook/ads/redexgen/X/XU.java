package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.facebook.ads.androidx.media3.exoplayer.video.DummySurface;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class XU extends HandlerThread implements Handler.Callback {
    public static byte[] A05;
    public Handler A00;
    public M5 A01;
    public DummySurface A02;
    public Error A03;
    public RuntimeException A04;

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 99);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A05 = new byte[]{6, 55, 47, 47, 59, 17, 55, 48, 36, 35, 33, 39, 34, 5, 13, 8, 1, 0, 68, 16, 11, 68, 13, 10, 13, 16, 13, 5, 8, 13, 30, 1, 68, 0, 17, 9, 9, 29, 68, 23, 17, 22, 2, 5, 7, 1, 100, 67, 75, 78, 71, 70, 2, 86, 77, 2, 80, 71, 78, 71, 67, 81, 71, 2, 70, 87, 79, 79, 91, 2, 81, 87, 80, 68, 67, 65, 71, 37, 52, 44, 44, 56, 18, 52, 51, 39, 32, 34, 36};
    }

    public XU() {
        super(A00(77, 12, 34));
    }

    private void A01() {
        AbstractC1062Ln.A01(this.A01);
        this.A01.A08();
    }

    private void A03(int i5) {
        AbstractC1062Ln.A01(this.A01);
        this.A01.A09(i5);
        this.A02 = new DummySurface(this, this.A01.A07(), i5 != 0);
    }

    public final DummySurface A04(int i5) {
        start();
        this.A00 = new Handler(getLooper(), this);
        this.A01 = new M5(this.A00);
        boolean z11 = false;
        synchronized (this) {
            this.A00.obtainMessage(1, i5, 0).sendToTarget();
            while (this.A02 == null && this.A04 == null && this.A03 == null) {
                try {
                    wait();
                } catch (InterruptedException unused) {
                    z11 = true;
                }
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
        if (this.A04 == null) {
            if (this.A03 == null) {
                return (DummySurface) AbstractC1062Ln.A01(this.A02);
            }
            throw this.A03;
        }
        throw this.A04;
    }

    public final void A05() {
        AbstractC1062Ln.A01(this.A00);
        this.A00.sendEmptyMessage(2);
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x007d A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // android.os.Handler.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean handleMessage(Message message) {
        try {
            switch (message.what) {
                case 1:
                    try {
                        A03(message.arg1);
                        synchronized (this) {
                            notify();
                        }
                    } catch (Error e3) {
                        MV.A08(A00(0, 12, 33), A00(12, 34, 7), e3);
                        this.A03 = e3;
                        synchronized (this) {
                            notify();
                        }
                    } catch (RuntimeException e11) {
                        MV.A08(A00(0, 12, 33), A00(12, 34, 7), e11);
                        this.A04 = e11;
                        synchronized (this) {
                            notify();
                        }
                    }
                    return true;
                case 2:
                    try {
                        A01();
                    } finally {
                        try {
                            return true;
                        } finally {
                        }
                    }
                    return true;
                default:
                    return true;
            }
        } catch (Throwable th2) {
            synchronized (this) {
            }
        }
        synchronized (this) {
            notify();
            throw th2;
        }
    }
}
