package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.RelativeLayout;

/* loaded from: assets/audience_network/classes.dex */
public class DG implements InterfaceC2617th {
    public final /* synthetic */ C06805y A00;

    public DG(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        if (this.A00.A05 != null && c2616tg.A00() != null) {
            this.A00.A05.setImageBitmap(c2616tg.A00());
            this.A00.A05.setScaleType(ImageView.ScaleType.CENTER_CROP);
            this.A00.A05.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        }
    }
}
