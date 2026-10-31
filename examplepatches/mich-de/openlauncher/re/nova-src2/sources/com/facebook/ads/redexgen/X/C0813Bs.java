package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.RelativeLayout;

/* renamed from: com.facebook.ads.redexgen.X.Bs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0813Bs extends C2662uQ {
    public final ImageView A00;
    public final C0958Hi A01;

    public C0813Bs(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A01 = c0958Hi;
        this.A00 = new ImageView(c0958Hi);
        this.A00.setAdjustViewBounds(true);
        addView(this.A00, new RelativeLayout.LayoutParams(-2, -1));
    }

    public final void A00(String str) {
        AsyncTaskC0892Et downloadImageTask = new AsyncTaskC0892Et(this.A00, this.A01);
        downloadImageTask.A04();
        downloadImageTask.A07(str);
    }
}
