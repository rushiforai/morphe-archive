package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.6r, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06996r extends C0823Cc {
    public static String[] A00 = {"4DJOkXe9rib7uWc4nLa4kcuSPdxs7gf4", "Dyxr4XzeXsq4jjw5BU630cyoQdL32ISv", "MScpZjpz", "3XC0FNsyX3k6WX9dbHhU9IwCEOagJZ1X", "JEKgPGdFYfe9RoD8dW0t8x0Mvi1GtEmi", "N5tdloXdcly7PUtxD1ZshZXdUDk2Lr2A", "5elKCHWntj6O1Wqi1faAvLWvEV4yzp2T", "JBMx9492vmjOwkRP6"};

    public C06996r(C06243u c06243u, int i5, List<C2314ol> list, C1539c2 c1539c2, Bundle bundle) {
        super(c06243u, i5, list != null ? list.size() : 0, c1539c2, bundle, false);
        A0k(list);
        c06243u.A1o(this);
        this.A0A = new F3(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A00() {
        int iA38 = this.A0M.A38();
        if (this.A0C == null || iA38 == -1) {
            return;
        }
        int curPos = this.A0C.size();
        if (iA38 < curPos - 1) {
            int curPos2 = iA38 + 1;
            A0c(curPos2);
        }
    }

    private void A01(int i5) {
        int visibleItem = this.A0M.A39();
        int lastVisibleItem = this.A0M.A3A();
        int firstVisibleItem = this.A0M.A38();
        if (firstVisibleItem != visibleItem) {
            A0a(visibleItem);
        }
        if (firstVisibleItem != lastVisibleItem) {
            A0a(lastVisibleItem);
        }
        A0b(firstVisibleItem);
        A0d(visibleItem, lastVisibleItem, i5);
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc, com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0P(C7O c7o, int i5) {
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc, com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0Q(C7O c7o, int i5, int i11) {
        if (this.A0M.A38() != -1) {
            ED ed = (ED) this.A0M.A1z(this.A0M.A38());
            if (A00[2].length() == 4) {
                throw new RuntimeException();
            }
            String[] strArr = A00;
            strArr[3] = "IxYVUA16uQkbjXwNztolao4gyOA0tKzF";
            strArr[6] = "jcO9EzcXxFOxyF2BSjZiD0vteRj0mA5y";
            if (ed != null && ed.A1o() && !ed.A1n()) {
                ed.A1l();
            }
            A01(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc
    public final void A0g(View view, boolean z11) {
        view.setAlpha(z11 ? 1.0f : 0.8f);
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc
    public final void A0j(ED ed, boolean z11) {
        A0g(ed, z11);
        if (!z11 && ed.A1n()) {
            ed.A1k();
        }
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc
    public final void A0k(List<C2314ol> list) {
        this.A0C = list;
    }

    @Override // com.facebook.ads.redexgen.X.C0823Cc
    public final boolean A0m(View view) {
        Rect rect = new Rect();
        view.getGlobalVisibleRect(rect);
        return ((float) rect.width()) / ((float) view.getWidth()) >= 0.75f;
    }

    public final C1539c2 A0n() {
        return this.A0B;
    }

    public final void A0o(C1539c2 c1539c2) {
        this.A0B = c1539c2;
    }
}
