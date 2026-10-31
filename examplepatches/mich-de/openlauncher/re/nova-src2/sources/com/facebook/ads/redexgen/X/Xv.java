package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.view.Choreographer;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class Xv implements Choreographer.FrameCallback, Handler.Callback {
    public static byte[] A05;
    public static String[] A06 = {"4gnm1DPIFeC", "fhlTAR", "qASII7nnscR34fgQoZ2", "Bv6ddBp0tMQFj", "K2N605CJzjul5Z3Fdn512F5R3z", "QDGJBXO2qPmT9Tn", "8SBY5jLGIONcdQ2BaD6uGK5IC7e1Mm", "iE5i5jisM4fcZg1vIEmAMwZ"};
    public static final Xv A07;
    public int A00;
    public Choreographer A01;
    public final Handler A02;
    public volatile long A04 = -9223372036854775807L;
    public final HandlerThread A03 = new HandlerThread(A01(0, 26, 120));

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            String[] strArr = A06;
            if (strArr[2].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            A06[3] = "6u6SI75SPp0WS";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A05 = new byte[]{100, 79, 72, 85, 66, 72, 64, 85, 70, 87, 79, 66, 85, 104, 80, 73, 66, 85, 29, 111, 70, 73, 67, 75, 66, 85};
    }

    static {
        A05();
        A07 = new Xv();
    }

    public Xv() {
        this.A03.start();
        this.A02 = N1.A0c(this.A03.getLooper(), this);
        this.A02.sendEmptyMessage(0);
    }

    public static Xv A00() {
        return A07;
    }

    private void A02() {
        if (this.A01 == null) {
            return;
        }
        this.A00++;
        if (this.A00 == 1) {
            this.A01.postFrameCallback(this);
        }
    }

    private void A03() {
        try {
            this.A01 = Choreographer.getInstance();
        } catch (RuntimeException unused) {
            this.A01 = null;
        }
    }

    private void A04() {
        if (this.A01 == null) {
            return;
        }
        this.A00--;
        if (this.A00 == 0) {
            this.A01.removeFrameCallback(this);
            this.A04 = -9223372036854775807L;
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
        this.A01.postFrameCallbackDelayed(this, 500L);
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
