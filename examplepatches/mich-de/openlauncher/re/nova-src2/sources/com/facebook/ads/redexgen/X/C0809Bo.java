package com.facebook.ads.redexgen.X;

import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.Bo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0809Bo extends C2662uQ {
    public final ImageView A00;
    public final C0958Hi A01;

    public C0809Bo(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A01 = c0958Hi;
        setRadius(30);
        this.A00 = new ImageView(c0958Hi);
        this.A00.setAdjustViewBounds(true);
        addView(this.A00, new RelativeLayout.LayoutParams(-2, -1));
    }

    public final /* synthetic */ void A00(C2616tg c2616tg) {
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        layoutParams.width = -2;
        ViewGroup viewGroup = (ViewGroup) getParent();
        if (viewGroup != null) {
            viewGroup.updateViewLayout(this, layoutParams);
        }
    }

    public void setUrl(String str) {
        AsyncTaskC0892Et asyncTaskC0892Et = new AsyncTaskC0892Et(this.A00, this.A01);
        asyncTaskC0892Et.A04();
        asyncTaskC0892Et.A07(str);
        asyncTaskC0892Et.A06(new InterfaceC2617th() { // from class: com.facebook.ads.redexgen.X.Bp
            @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
            public final void AFA(C2616tg c2616tg) {
                this.A00.A00(c2616tg);
            }
        });
    }
}
