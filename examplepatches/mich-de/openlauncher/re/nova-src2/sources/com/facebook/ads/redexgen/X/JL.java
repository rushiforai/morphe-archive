package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;

/* loaded from: assets/audience_network/classes.dex */
public class JL implements InterfaceC1864hL {
    public final Rect A00 = new Rect();
    public final /* synthetic */ C1893hp A01;

    public JL(C1893hp c1893hp) {
        this.A01 = c1893hp;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1864hL
    public final C1896hs ADs(View view, C1896hs c1896hs) {
        C1896hs c1896hsA06 = AbstractC1880hb.A06(view, c1896hs);
        if (c1896hsA06.A07()) {
            return c1896hsA06;
        }
        Rect rect = this.A00;
        rect.left = c1896hsA06.A03();
        rect.top = c1896hsA06.A05();
        rect.right = c1896hsA06.A04();
        rect.bottom = c1896hsA06.A02();
        int i5 = this.A01.getChildCount();
        for (int count = 0; count < i5; count++) {
            C1896hs c1896hsA05 = AbstractC1880hb.A05(this.A01.getChildAt(count), c1896hsA06);
            rect.left = Math.min(c1896hsA05.A03(), rect.left);
            rect.top = Math.min(c1896hsA05.A05(), rect.top);
            rect.right = Math.min(c1896hsA05.A04(), rect.right);
            rect.bottom = Math.min(c1896hsA05.A02(), rect.bottom);
        }
        int count2 = rect.left;
        C1896hs applied = c1896hsA06.A06(count2, rect.top, rect.right, rect.bottom);
        return applied;
    }
}
