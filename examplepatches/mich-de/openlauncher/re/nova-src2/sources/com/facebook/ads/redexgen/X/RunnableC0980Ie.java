package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Ie, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0980Ie implements Runnable {
    public final /* synthetic */ int A00;
    public final /* synthetic */ Bundle A01;
    public final /* synthetic */ BinderC0989In A02;

    public RunnableC0980Ie(BinderC0989In binderC0989In, int i5, Bundle bundle) {
        this.A02 = binderC0989In;
        this.A00 = i5;
        this.A01 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A02.A01.A0A(this.A00, this.A01);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
