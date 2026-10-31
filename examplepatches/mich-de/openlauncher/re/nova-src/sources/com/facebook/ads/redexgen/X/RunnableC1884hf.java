package com.facebook.ads.redexgen.X;

import android.content.res.Resources;

/* renamed from: com.facebook.ads.redexgen.X.hf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1884hf implements Runnable {
    public final /* synthetic */ C1893hp A00;

    public RunnableC1884hf(C1893hp c1893hp) {
        this.A00 = c1893hp;
    }

    @Override // java.lang.Runnable
    public final void run() throws Resources.NotFoundException {
        this.A00.setScrollState(0);
        this.A00.A0h();
    }
}
