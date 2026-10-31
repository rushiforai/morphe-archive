package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Il, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0987Il implements Runnable {
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ int A02;
    public final /* synthetic */ int A03;
    public final /* synthetic */ int A04;
    public final /* synthetic */ Bundle A05;
    public final /* synthetic */ BinderC0989In A06;

    public RunnableC0987Il(BinderC0989In binderC0989In, int i5, int i11, int i12, int i13, int i14, Bundle bundle) {
        this.A06 = binderC0989In;
        this.A01 = i5;
        this.A04 = i11;
        this.A02 = i12;
        this.A00 = i13;
        this.A03 = i14;
        this.A05 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A06.A01.A09(this.A01, this.A04, this.A02, this.A00, this.A03, this.A05);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
