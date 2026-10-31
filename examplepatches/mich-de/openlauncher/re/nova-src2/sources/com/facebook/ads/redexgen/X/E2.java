package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.os.Bundle;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;

/* loaded from: assets/audience_network/classes.dex */
public final class E2 extends FrameLayout implements InterfaceC2460rA {
    public String A00;
    public final InterfaceC2459r9 A01;
    public final C1245Tb A02;

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    public E2(C0958Hi c0958Hi, InterfaceC2459r9 interfaceC2459r9, C1245Tb c1245Tb, String str) {
        super(c0958Hi);
        this.A02 = c1245Tb;
        this.A01 = interfaceC2459r9;
        this.A00 = str;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        C1245Tb.A0C().incrementAndGet();
        this.A02.A0U();
        AbstractC2426qc.A0K(this.A02.A0Q());
        addView(this.A02.A0Q(), new FrameLayout.LayoutParams(-1, -1));
        this.A01.A4V(this, new RelativeLayout.LayoutParams(-1, -1));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        this.A02.A0T();
        if (this.A02.A0P() != null) {
            this.A02.A0P().AF5();
        }
        C1245Tb.A0C().decrementAndGet();
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }
}
