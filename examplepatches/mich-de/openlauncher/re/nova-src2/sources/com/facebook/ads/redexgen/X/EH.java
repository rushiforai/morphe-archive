package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.RelativeLayout;

/* loaded from: assets/audience_network/classes.dex */
public class EH implements InterfaceC2617th {
    public final /* synthetic */ EE A00;

    public EH(EE ee2) {
        this.A00 = ee2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        if (this.A00.A06 != null && c2616tg.A00() != null) {
            this.A00.A06.setImageBitmap(c2616tg.A00());
            this.A00.A06.setScaleType(ImageView.ScaleType.CENTER_CROP);
            this.A00.A06.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        }
    }
}
