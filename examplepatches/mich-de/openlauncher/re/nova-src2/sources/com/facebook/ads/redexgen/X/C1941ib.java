package com.facebook.ads.redexgen.X;

import android.view.View;
import androidx.compose.ui.node.LayoutNode;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.ib, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1941ib {
    public int A00;
    public int A01;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public boolean A09;
    public boolean A0B = true;
    public int A02 = 0;
    public boolean A0A = false;
    public List<AbstractC1978jE> A08 = null;

    private View A00() {
        int size = this.A08.size();
        for (int i5 = 0; i5 < size; i5++) {
            View view = this.A08.get(i5).A0H;
            C1961ix c1961ix = (C1961ix) view.getLayoutParams();
            if (!c1961ix.A02()) {
                int i11 = this.A01;
                int size2 = c1961ix.A00();
                if (i11 == size2) {
                    A02(view);
                    return view;
                }
            }
        }
        return null;
    }

    private final View A01(View view) {
        int size = this.A08.size();
        View view2 = null;
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        for (int i11 = 0; i11 < size; i11++) {
            View view3 = this.A08.get(i11).A0H;
            C1961ix c1961ix = (C1961ix) view3.getLayoutParams();
            if (view3 != view && !c1961ix.A02()) {
                int iA00 = c1961ix.A00();
                int size2 = this.A01;
                int i12 = iA00 - size2;
                int size3 = this.A03;
                int i13 = i12 * size3;
                if (i13 >= 0 && i13 < i5) {
                    view2 = view3;
                    i5 = i13;
                    if (i13 == 0) {
                        break;
                    }
                }
            }
        }
        return view2;
    }

    private final void A02(View view) {
        View closest = A01(view);
        if (closest == null) {
            this.A01 = -1;
        } else {
            this.A01 = ((C1961ix) closest.getLayoutParams()).A00();
        }
    }

    public final View A03(C1968j4 c1968j4) {
        if (this.A08 != null) {
            return A00();
        }
        View viewA0H = c1968j4.A0H(this.A01);
        this.A01 += this.A03;
        return viewA0H;
    }

    public final void A04() {
        A02(null);
    }

    public final boolean A05(C1975jB c1975jB) {
        return this.A01 >= 0 && this.A01 < c1975jB.A03();
    }
}
