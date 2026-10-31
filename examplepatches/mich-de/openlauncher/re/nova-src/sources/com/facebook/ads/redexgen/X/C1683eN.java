package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/* renamed from: com.facebook.ads.redexgen.X.eN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1683eN extends ViewOutlineProvider {
    public final /* synthetic */ float A00;
    public final /* synthetic */ C1678eI A01;

    public C1683eN(C1678eI c1678eI, float f11) {
        this.A01 = c1678eI;
        this.A00 = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), this.A00);
    }
}
