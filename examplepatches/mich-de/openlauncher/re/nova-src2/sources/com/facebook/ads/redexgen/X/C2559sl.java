package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/* renamed from: com.facebook.ads.redexgen.X.sl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2559sl extends ViewOutlineProvider {
    public final /* synthetic */ float A00;
    public final /* synthetic */ C2566ss A01;

    public C2559sl(C2566ss c2566ss, float f11) {
        this.A01 = c2566ss;
        this.A00 = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        outline.setRoundRect(AbstractC2383pv.A00, AbstractC2383pv.A00, view.getWidth(), view.getHeight(), this.A00);
    }
}
