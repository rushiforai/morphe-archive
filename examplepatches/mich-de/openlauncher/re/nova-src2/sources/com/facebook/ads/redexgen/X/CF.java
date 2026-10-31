package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class CF extends AbstractC1957it {
    public final /* synthetic */ int A00;
    public final /* synthetic */ C2190mi A01;

    public CF(C2190mi c2190mi, int i5) {
        this.A01 = c2190mi;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1957it
    public final void A02(Rect rect, View view, C7O c7o, C1975jB c1975jB) {
        int iA1C = c7o.A1C(view);
        int itemCount = c7o.getAdapter() != null ? c7o.getAdapter().A0B() : 0;
        int position = this.A00;
        if (iA1C != 0) {
            position /= 2;
        }
        rect.left = position;
        rect.right = iA1C == itemCount + (-1) ? this.A00 : this.A00 / 2;
    }
}
