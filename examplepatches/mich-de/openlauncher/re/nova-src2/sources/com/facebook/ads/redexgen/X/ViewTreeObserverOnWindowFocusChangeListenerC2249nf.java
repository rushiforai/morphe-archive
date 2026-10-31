package com.facebook.ads.redexgen.X;

import android.view.ViewTreeObserver;

/* renamed from: com.facebook.ads.redexgen.X.nf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewTreeObserverOnWindowFocusChangeListenerC2249nf implements ViewTreeObserver.OnWindowFocusChangeListener {
    public final /* synthetic */ GT A00;

    public ViewTreeObserverOnWindowFocusChangeListenerC2249nf(GT gt2) {
        this.A00 = gt2;
    }

    @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
    public final void onWindowFocusChanged(boolean z11) {
        if (z11) {
            InterfaceC1640df interfaceC1640dfA0F = this.A00.A0h.A0F();
            if (AbstractC2503rr.A01(interfaceC1640dfA0F.getId())) {
                interfaceC1640dfA0F.A5E(EnumC2299oW.A04.name());
            }
        }
    }
}
