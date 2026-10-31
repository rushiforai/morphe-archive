package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class TU implements MM {
    public static final List<TV> A01 = new ArrayList(50);
    public final Handler A00;

    public TU(Handler handler) {
        this.A00 = handler;
    }

    public static TV A00() {
        TV tv2;
        synchronized (A01) {
            tv2 = A01.isEmpty() ? new TV() : A01.remove(A01.size() - 1);
        }
        return tv2;
    }

    public static void A01(TV tv2) {
        synchronized (A01) {
            if (A01.size() < 50) {
                A01.add(tv2);
            }
        }
    }

    public final boolean A03(Runnable runnable) {
        return this.A00.post(runnable);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final Looper A93() {
        return this.A00.getLooper();
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final boolean AAR(int i5) {
        return this.A00.hasMessages(i5);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final TV ADX(int i5) {
        return A00().A01(this.A00.obtainMessage(i5), this);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final TV ADY(int i5, int i11, int i12) {
        return A00().A01(this.A00.obtainMessage(i5, i11, i12), this);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final TV ADZ(int i5, int i11, int i12, Object obj) {
        return A00().A01(this.A00.obtainMessage(i5, i11, i12, obj), this);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final TV ADa(int i5, Object obj) {
        return A00().A01(this.A00.obtainMessage(i5, obj), this);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final void AJk(int i5) {
        this.A00.removeMessages(i5);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final boolean AKS(int i5) {
        return this.A00.sendEmptyMessage(i5);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final boolean AKT(int i5, long j11) {
        return this.A00.sendEmptyMessageAtTime(i5, j11);
    }

    @Override // com.facebook.ads.redexgen.X.MM
    public final boolean AKV(ML ml2) {
        return ((TV) ml2).A03(this.A00);
    }
}
