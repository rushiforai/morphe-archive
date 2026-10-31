package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Id, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0979Id implements Runnable {
    public final /* synthetic */ Bundle A00;
    public final /* synthetic */ BinderC0989In A01;

    public RunnableC0979Id(BinderC0989In binderC0989In, Bundle bundle) {
        this.A01 = binderC0989In;
        this.A00 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.A01.A05(this.A00);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
