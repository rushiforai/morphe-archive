package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Ia, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0976Ia extends AbstractC1956is {
    public static String[] A01 = {"ufm8s7LRmOM7", "sIBwdoM05ajejE", "0NxvrnR7UZDHrBy4xVhLU5lsqzWJ5R3x", "FsILnIqpIa8iE3wffvJrO4tNlZdDmpUd", "wKnqjXSh8f61FKWyknAGi8xlXXoDdiLA", "lpMPMGmveEx5YZPPZgDkriuB4nzdouJK", "fQPzW90JHWOApVaaQbndX59CGXgCnXlm", "Pp9SKBa6RS3IfLIGXA9e4oeVKGHa5CsE"};
    public boolean A00 = true;

    public abstract boolean A0X(AbstractC1978jE abstractC1978jE);

    public abstract boolean A0Y(AbstractC1978jE abstractC1978jE);

    public abstract boolean A0Z(AbstractC1978jE abstractC1978jE, int i5, int i11, int i12, int i13);

    public abstract boolean A0a(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, int i5, int i11, int i12, int i13);

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0N(AbstractC1978jE abstractC1978jE) {
        return !this.A00 || abstractC1978jE.A0m();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0O(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        if (c1955ir != null && (c1955ir.A01 != c1955ir2.A01 || c1955ir.A03 != c1955ir2.A03)) {
            return A0Z(abstractC1978jE, c1955ir.A01, c1955ir.A03, c1955ir2.A01, c1955ir2.A03);
        }
        return A0X(abstractC1978jE);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0P(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        int i5 = c1955ir.A01;
        int i11 = c1955ir.A03;
        View view = abstractC1978jE.A0H;
        int oldLeft = c1955ir2 == null ? view.getLeft() : c1955ir2.A01;
        int oldTop = c1955ir2 == null ? view.getTop() : c1955ir2.A03;
        if (!abstractC1978jE.A0n() && (i5 != oldLeft || i11 != oldTop)) {
            view.layout(oldLeft, oldTop, view.getWidth() + oldLeft, view.getHeight() + oldTop);
            return A0Z(abstractC1978jE, i5, i11, oldLeft, oldTop);
        }
        return A0Y(abstractC1978jE);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0Q(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2) {
        if (c1955ir.A01 != c1955ir2.A01 || c1955ir.A03 != c1955ir2.A03) {
            return A0Z(abstractC1978jE, c1955ir.A01, c1955ir.A03, c1955ir2.A01, c1955ir2.A03);
        }
        A0U(abstractC1978jE);
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0R(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, C1955ir c1955ir, C1955ir c1955ir2) {
        int fromTop;
        int toLeft;
        int i5 = c1955ir.A01;
        int fromLeft = c1955ir.A03;
        if (abstractC1978jE2.A0s()) {
            fromTop = c1955ir.A01;
            toLeft = c1955ir.A03;
        } else {
            fromTop = c1955ir2.A01;
            toLeft = c1955ir2.A03;
        }
        int toTop = A01[1].length();
        if (toTop != 14) {
            throw new RuntimeException();
        }
        A01[1] = "7F8ns227Orjao7";
        return A0a(abstractC1978jE, abstractC1978jE2, i5, fromLeft, fromTop, toLeft);
    }

    public final void A0T(AbstractC1978jE abstractC1978jE) {
        A0K(abstractC1978jE);
    }

    public final void A0U(AbstractC1978jE abstractC1978jE) {
        A0K(abstractC1978jE);
    }

    public final void A0V(AbstractC1978jE abstractC1978jE) {
        A0K(abstractC1978jE);
    }

    public final void A0W(AbstractC1978jE abstractC1978jE, boolean z11) {
        A0K(abstractC1978jE);
    }
}
