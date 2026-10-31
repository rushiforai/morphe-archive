package com.facebook.ads.redexgen.X;

import android.view.ViewGroup;
import android.widget.ImageView;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public abstract class LB extends AbstractC1948ik<C0915Fr> {
    public static final int A05 = (int) (AbstractC2385px.A02 * 4.0f);
    public InterfaceC1730f9 A00;
    public final List<GT> A01;
    public final int A02;
    public final C0958Hi A03;
    public final AbstractC1540c3 A04 = new LF(this);

    public LB(C3U c3u, List<GT> list, C0958Hi c0958Hi) {
        this.A03 = c0958Hi;
        this.A02 = c3u.getChildSpacing();
        this.A01 = list;
    }

    private ViewGroup.MarginLayoutParams A01(int i5) {
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(-2, -1);
        int i11 = this.A02;
        if (i5 == 0) {
            i11 *= 2;
        }
        marginLayoutParams.setMargins(i11, 0, i5 >= this.A01.size() + (-1) ? this.A02 * 2 : this.A02, 0);
        return marginLayoutParams;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1948ik
    public final int A0B() {
        return this.A01.size();
    }

    public final void A0Q(ImageView imageView, int i5) {
        GT gt2 = this.A01.get(i5);
        C2252ni adCoverImage = gt2.getAdCoverImage();
        if (adCoverImage != null) {
            AsyncTaskC0892Et asyncTaskC0892EtA04 = new AsyncTaskC0892Et(imageView, this.A03).A04();
            asyncTaskC0892EtA04.A06(new LD(this, i5, gt2));
            asyncTaskC0892EtA04.A07(adCoverImage.getUrl());
        }
    }

    public final void A0R(InterfaceC1730f9 interfaceC1730f9) {
        this.A00 = interfaceC1730f9;
    }

    public void A0S(C0915Fr c0915Fr, int i5) {
        c0915Fr.A0w().setLayoutParams(A01(i5));
    }
}
