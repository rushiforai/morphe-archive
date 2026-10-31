package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.facebook.ads.internal.api.AdNativeComponentView;

/* renamed from: com.facebook.ads.redexgen.X.rM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2472rM extends AdNativeComponentView {
    public static final int A01 = (int) (AbstractC2385px.A02 * 1.0f);
    public final ImageView A00;

    public C2472rM(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A00 = new C2502rq(c0958Hi);
        this.A00.setScaleType(ImageView.ScaleType.CENTER_CROP);
        EnumC2391q3.A04(this.A00, EnumC2391q3.A0A);
        addView(this.A00, new ViewGroup.LayoutParams(-1, -1));
        AbstractC2426qc.A0O(this.A00, -2130706433);
        setPadding(A01, A01, A01, A01);
    }

    @Override // com.facebook.ads.internal.api.AdNativeComponentView
    public View getAdContentsView() {
        return this.A00;
    }

    public ImageView getImageCardView() {
        return this.A00;
    }
}
