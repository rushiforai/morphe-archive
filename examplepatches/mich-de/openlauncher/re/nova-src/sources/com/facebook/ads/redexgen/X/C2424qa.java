package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/* renamed from: com.facebook.ads.redexgen.X.qa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2424qa extends ViewOutlineProvider {
    public final /* synthetic */ float A00;

    public C2424qa(float f11) {
        this.A00 = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        outline.setRoundRect(AbstractC2383pv.A00, AbstractC2383pv.A00, view.getWidth(), view.getHeight(), this.A00);
    }
}
