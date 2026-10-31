package com.facebook.ads.redexgen.X;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;

/* renamed from: com.facebook.ads.redexgen.X.eO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1684eO extends ViewOutlineProvider {
    public final /* synthetic */ C1678eI A00;

    public C1684eO(C1678eI c1678eI) {
        this.A00 = c1678eI;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), 8.0f);
    }
}
