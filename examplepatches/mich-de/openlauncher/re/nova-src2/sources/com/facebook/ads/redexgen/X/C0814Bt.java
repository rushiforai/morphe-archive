package com.facebook.ads.redexgen.X;

import android.view.ViewGroup;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.Bt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0814Bt extends AbstractC1948ik<C0812Br> {
    public final int A00;
    public final C0958Hi A01;
    public final ViewOnClickListenerC0884El A02;
    public final List<String> A03;

    public C0814Bt(C0958Hi c0958Hi, List<String> screenshotUrls, int i5, ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        this.A03 = screenshotUrls;
        this.A00 = i5;
        this.A01 = c0958Hi;
        this.A02 = viewOnClickListenerC0884El;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final C0812Br A0F(ViewGroup viewGroup, int i5) {
        C0813Bs c0813Bs = new C0813Bs(this.A01);
        if (C2203mv.A1C(this.A01)) {
            c0813Bs.setOnClickListener(new ViewOnClickListenerC1827gi(this));
        }
        return new C0812Br(c0813Bs);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final void A0M(C0812Br c0812Br, int i5) {
        String str = this.A03.get(i5);
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(-2, -1);
        int startSpacing = this.A00 * 4;
        if (i5 != 0) {
            startSpacing = this.A00;
        }
        marginLayoutParams.setMargins(startSpacing, 0, i5 >= A0B() + (-1) ? this.A00 * 4 : this.A00, 0);
        c0812Br.A0w().setLayoutParams(marginLayoutParams);
        c0812Br.A0w().A00(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    public final int A0B() {
        return this.A03.size();
    }
}
