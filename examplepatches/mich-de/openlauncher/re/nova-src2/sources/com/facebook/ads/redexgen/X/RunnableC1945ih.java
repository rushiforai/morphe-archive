package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.ih, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1945ih implements Runnable {
    public final /* synthetic */ C7O A00;

    public RunnableC1945ih(C7O c7o) {
        this.A00 = c7o;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (!this.A00.A0D || this.A00.isLayoutRequested()) {
            return;
        }
        if (!this.A00.A0F) {
            this.A00.requestLayout();
        } else if (this.A00.A0I) {
            this.A00.A0J = true;
        } else {
            this.A00.A1M();
        }
    }
}
