package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.view.Choreographer;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class Xs implements Choreographer.FrameCallback, Handler.Callback {
    public static byte[] A05;
    public static final Xs A06;
    public int A00;
    public Choreographer A01;
    public final Handler A02;
    public volatile long A04 = -9223372036854775807L;
    public final HandlerThread A03 = new HandlerThread(A01(0, 35, 81));

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A05 = new byte[]{122, 71, 80, 111, 83, 94, 70, 90, 77, 5, 121, 77, 94, 82, 90, 109, 90, 83, 90, 94, 76, 90, 124, 87, 80, 77, 90, 80, 88, 77, 94, 79, 87, 90, 77, 104, 87, 90, 91, 81, 120, 76, 95, 83, 91, 108, 91, 82, 91, 95, 77, 91, 118, 91, 82, 78, 91, 76, 104, 77, 71, 80, 93, 30, 77, 95, 83, 78, 82, 87, 80, 89, 30, 90, 87, 77, 95, 92, 82, 91, 90, 30, 90, 75, 91, 30, 74, 81, 30, 78, 82, 95, 74, 88, 81, 76, 83, 30, 91, 76, 76, 81, 76};
    }

    static {
        A05();
        A06 = new Xs();
    }

    public Xs() {
        this.A03.start();
        this.A02 = N1.A0c((Looper) AbstractC1062Ln.A01(this.A03.getLooper()), this);
        this.A02.sendEmptyMessage(0);
        this.A01 = null;
    }

    public static Xs A00() {
        return A06;
    }

    private void A02() {
        if (this.A01 != null) {
            this.A00++;
            if (this.A00 == 1) {
                this.A01.postFrameCallback(this);
            }
        }
    }

    private void A03() {
        try {
            this.A01 = Choreographer.getInstance();
        } catch (RuntimeException e3) {
            MV.A0A(A01(35, 23, 80), A01(58, 45, 80), e3);
        }
    }

    private void A04() {
        if (this.A01 != null) {
            this.A00--;
            if (this.A00 == 0) {
                this.A01.removeFrameCallback(this);
                this.A04 = -9223372036854775807L;
            }
        }
    }

    public final void A06() {
        this.A02.sendEmptyMessage(1);
    }

    public final void A07() {
        this.A02.sendEmptyMessage(2);
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j11) {
        this.A04 = j11;
        ((Choreographer) AbstractC1062Ln.A01(this.A01)).postFrameCallbackDelayed(this, 500L);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (message.what) {
            case 0:
                A03();
                break;
            case 1:
                A02();
                break;
            case 2:
                A04();
                break;
        }
        return true;
    }
}
