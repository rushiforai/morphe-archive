package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.WindowInsets;

/* renamed from: com.facebook.ads.redexgen.X.3N, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C3N extends C3P {
    @Override // com.facebook.ads.redexgen.X.C1879ha
    public final C1896hs A07(View view, C1896hs c1896hs) {
        WindowInsets result = (WindowInsets) C1896hs.A01(c1896hs);
        WindowInsets unwrapped = view.dispatchApplyWindowInsets(result);
        if (unwrapped != result) {
            result = new WindowInsets(unwrapped);
        }
        return C1896hs.A00(result);
    }

    @Override // com.facebook.ads.redexgen.X.C1879ha
    public final C1896hs A08(View view, C1896hs c1896hs) {
        WindowInsets result = (WindowInsets) C1896hs.A01(c1896hs);
        WindowInsets unwrapped = view.onApplyWindowInsets(result);
        if (unwrapped != result) {
            result = new WindowInsets(unwrapped);
        }
        return C1896hs.A00(result);
    }

    @Override // com.facebook.ads.redexgen.X.C1879ha
    public final void A0A(View view) {
        view.stopNestedScroll();
    }

    @Override // com.facebook.ads.redexgen.X.C1879ha
    public final void A0E(View view, InterfaceC1864hL interfaceC1864hL) {
        if (interfaceC1864hL == null) {
            view.setOnApplyWindowInsetsListener(null);
        } else {
            view.setOnApplyWindowInsetsListener(new ViewOnApplyWindowInsetsListenerC1878hZ(this, interfaceC1864hL));
        }
    }
}
