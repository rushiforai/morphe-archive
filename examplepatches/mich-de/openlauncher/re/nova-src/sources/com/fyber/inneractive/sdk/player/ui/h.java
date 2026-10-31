package com.fyber.inneractive.sdk.player.ui;

import android.view.ViewGroup;
import androidx.recyclerview.widget.n0;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.util.h1;
import com.fyber.inneractive.sdk.util.n1;

/* loaded from: classes3.dex */
public final class h implements a {
    @Override // com.fyber.inneractive.sdk.player.ui.a
    public final h1 a(UnitDisplayType unitDisplayType, int i5, int i11, boolean z11, h1 h1Var, int i12, int i13, int i14, int i15) {
        if (h1Var == null) {
            return null;
        }
        if (unitDisplayType == UnitDisplayType.SQUARE) {
            int iMin = Math.min(i12, i14) - com.fyber.inneractive.sdk.util.o.b(i15 * 2);
            h1Var.f31191a = iMin;
            h1Var.f31192b = iMin;
            return h1Var;
        }
        if (unitDisplayType == UnitDisplayType.LANDSCAPE) {
            int iMin2 = Math.min(i12, i14) - com.fyber.inneractive.sdk.util.o.b(i15 * 2);
            h1Var.f31191a = iMin2;
            h1Var.f31192b = (iMin2 * 9) / 16;
            return h1Var;
        }
        if (unitDisplayType == UnitDisplayType.MRECT) {
            h1Var.f31191a = com.fyber.inneractive.sdk.util.o.b(300);
            h1Var.f31192b = com.fyber.inneractive.sdk.util.o.b(n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            return h1Var;
        }
        if (unitDisplayType == UnitDisplayType.DEFAULT && z11) {
            n1.a(unitDisplayType, h1Var, i5, i11, i12, i13);
            return h1Var;
        }
        h1Var.f31191a = 0;
        h1Var.f31192b = 0;
        return h1Var;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.a
    public final h1 a(UnitDisplayType unitDisplayType, int i5, int i11, h1 h1Var, int i12, ViewGroup viewGroup) {
        h1 h1Var2 = new h1(0, 0);
        if (unitDisplayType == UnitDisplayType.SQUARE) {
            int i13 = h1Var.f31191a;
            n1.a(unitDisplayType, h1Var2, i5, i11, i13, i13);
            return h1Var2;
        }
        n1.a(unitDisplayType, h1Var2, i5, i11, h1Var.f31191a, h1Var.f31192b);
        return h1Var2;
    }
}
