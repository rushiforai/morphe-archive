package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Ij, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0985Ij implements Runnable {
    public final /* synthetic */ int A00;
    public final /* synthetic */ int A01;
    public final /* synthetic */ Bundle A02;
    public final /* synthetic */ BinderC0989In A03;

    public RunnableC0985Ij(BinderC0989In binderC0989In, int i5, int i11, Bundle bundle) {
        this.A03 = binderC0989In;
        this.A00 = i5;
        this.A01 = i11;
        this.A02 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A03.A01.A01(this.A00, this.A01, this.A02);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
