package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.WindowInsets;

/* renamed from: com.facebook.ads.redexgen.X.hZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnApplyWindowInsetsListenerC1878hZ implements View.OnApplyWindowInsetsListener {
    public final /* synthetic */ InterfaceC1864hL A00;
    public final /* synthetic */ C3N A01;

    public ViewOnApplyWindowInsetsListenerC1878hZ(C3N c3n, InterfaceC1864hL interfaceC1864hL) {
        this.A01 = c3n;
        this.A00 = interfaceC1864hL;
    }

    @Override // android.view.View.OnApplyWindowInsetsListener
    public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
        C1896hs compatInsets = this.A00.ADs(view, C1896hs.A00(windowInsets));
        return (WindowInsets) C1896hs.A01(compatInsets);
    }
}
