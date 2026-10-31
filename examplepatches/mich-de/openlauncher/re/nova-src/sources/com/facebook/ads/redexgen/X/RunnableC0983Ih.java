package com.facebook.ads.redexgen.X;

import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Ih, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0983Ih implements Runnable {
    public final /* synthetic */ Bundle A00;
    public final /* synthetic */ BinderC0989In A01;
    public final /* synthetic */ String A02;

    public RunnableC0983Ih(BinderC0989In binderC0989In, String str, Bundle bundle) {
        this.A01 = binderC0989In;
        this.A02 = str;
        this.A00 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.A01.A08(this.A02, this.A00);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
