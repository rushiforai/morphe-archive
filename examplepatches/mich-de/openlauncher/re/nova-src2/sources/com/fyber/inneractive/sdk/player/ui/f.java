package com.fyber.inneractive.sdk.player.ui;

import android.view.ViewGroup;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.util.h1;
import com.fyber.inneractive.sdk.util.n1;

/* loaded from: classes3.dex */
public final class f implements a {
    @Override // com.fyber.inneractive.sdk.player.ui.a
    public final h1 a(UnitDisplayType unitDisplayType, int i5, int i11, boolean z11, h1 h1Var, int i12, int i13, int i14, int i15) {
        h1 h1Var2;
        if (unitDisplayType == UnitDisplayType.DEFAULT && z11) {
            h1Var2 = h1Var;
            n1.a(unitDisplayType, h1Var2, i5, i11, i12, i13);
        } else {
            h1Var2 = h1Var;
        }
        h1Var2.f31191a = 0;
        h1Var2.f31192b = 0;
        return h1Var2;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.a
    public final h1 a(UnitDisplayType unitDisplayType, int i5, int i11, h1 h1Var, int i12, ViewGroup viewGroup) {
        h1 h1Var2 = new h1(0, 0);
        if (unitDisplayType == UnitDisplayType.SQUARE) {
            int iMin = Math.min(h1Var.f31191a, i12);
            if (viewGroup != null) {
                viewGroup.getLayoutParams().width = iMin;
                viewGroup.getLayoutParams().height = iMin;
            }
            n1.a(unitDisplayType, h1Var2, i5, i11, iMin, iMin);
            return h1Var2;
        }
        n1.a(unitDisplayType, h1Var2, i5, i11, h1Var.f31191a, h1Var.f31192b);
        return h1Var2;
    }
}
