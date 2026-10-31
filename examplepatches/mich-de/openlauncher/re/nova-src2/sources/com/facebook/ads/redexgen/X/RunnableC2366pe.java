package com.facebook.ads.redexgen.X;

import android.widget.TextView;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.pe, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class RunnableC2366pe implements Runnable {
    public final /* synthetic */ int A00;
    public final /* synthetic */ TextView A01;
    public final /* synthetic */ C2367pf A02;

    public RunnableC2366pe(C2367pf c2367pf, TextView textView, int i5) {
        this.A02 = c2367pf;
        this.A01 = textView;
        this.A00 = i5;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A02.A08(this.A01, this.A00);
            this.A02.A04 = null;
            this.A02.A03 = null;
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
