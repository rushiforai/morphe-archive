package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.s2, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2514s2 extends View {

    @Nullable
    public InterfaceC2513s1 A00;

    public C2514s2(C0958Hi c0958Hi, InterfaceC2513s1 interfaceC2513s1) {
        super(c0958Hi);
        this.A00 = interfaceC2513s1;
        setLayoutParams(new ViewGroup.LayoutParams(0, 0));
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        InterfaceC2513s1 interfaceC2513s1 = this.A00;
    }
}
