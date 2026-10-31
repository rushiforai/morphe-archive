package com.facebook.ads.redexgen.X;

import java.util.concurrent.Callable;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.qp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2439qp implements Callable<Void> {
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int[] A06;

    public CallableC2439qp(int[] iArr, int i5, int i11, int i12, int i13, int i14, int i15) {
        this.A06 = iArr;
        this.A05 = i5;
        this.A01 = i11;
        this.A02 = i12;
        this.A04 = i13;
        this.A00 = i14;
        this.A03 = i15;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.concurrent.Callable
    @Nullable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final Void call() throws Exception {
        G1.A00(this.A06, this.A05, this.A01, this.A02, this.A04, this.A00, this.A03);
        return null;
    }
}
