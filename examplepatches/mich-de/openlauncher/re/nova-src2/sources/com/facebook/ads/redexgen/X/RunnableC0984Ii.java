package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Bundle;

/* renamed from: com.facebook.ads.redexgen.X.Ii, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC0984Ii implements Runnable {
    public final /* synthetic */ int A00;
    public final /* synthetic */ Uri A01;
    public final /* synthetic */ Bundle A02;
    public final /* synthetic */ BinderC0989In A03;
    public final /* synthetic */ boolean A04;

    public RunnableC0984Ii(BinderC0989In binderC0989In, int i5, Uri uri, boolean z11, Bundle bundle) {
        this.A03 = binderC0989In;
        this.A00 = i5;
        this.A01 = uri;
        this.A04 = z11;
        this.A02 = bundle;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A03.A01.A02(this.A00, this.A01, this.A04, this.A02);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
