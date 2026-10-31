package com.facebook.ads.redexgen.X;

import android.graphics.drawable.Drawable;

/* loaded from: assets/audience_network/classes.dex */
public class JU implements InterfaceC1831gn {
    public Drawable A00;
    public final /* synthetic */ C1830gm A01;

    public JU(C1830gm c1830gm) {
        this.A01 = c1830gm;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final Drawable A7o() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final C1830gm A7p() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final boolean A9T() {
        return this.A01.getPreventCornerOverlap();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final boolean AA4() {
        return this.A01.getUseCompatPadding();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final void AKc(Drawable drawable) {
        this.A00 = drawable;
        this.A01.setBackgroundDrawable(drawable);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1831gn
    public final void AL3(int i5, int i11, int i12, int i13) {
        this.A01.A05.set(i5, i11, i12, i13);
        super/*android.widget.FrameLayout*/.setPadding(this.A01.A04.left + i5, this.A01.A04.top + i11, this.A01.A04.right + i12, this.A01.A04.bottom + i13);
    }
}
