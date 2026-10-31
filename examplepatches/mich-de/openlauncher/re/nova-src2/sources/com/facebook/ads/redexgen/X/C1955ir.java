package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.ir, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1955ir {
    public int A00;
    public int A01;
    public int A02;
    public int A03;

    private final C1955ir A00(AbstractC1978jE abstractC1978jE, int i5) {
        View view = abstractC1978jE.A0H;
        this.A01 = view.getLeft();
        this.A03 = view.getTop();
        this.A02 = view.getRight();
        this.A00 = view.getBottom();
        return this;
    }

    public final C1955ir A01(AbstractC1978jE abstractC1978jE) {
        return A00(abstractC1978jE, 0);
    }
}
