package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.p0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2329p0 extends LinearLayout {
    public static final int A04 = (int) (AbstractC2385px.A02 * 32.0f);
    public static final int A05 = (int) (AbstractC2385px.A02 * 8.0f);
    public TextView A00;
    public TextView A01;
    public C2661uP A02;
    public final C0958Hi A03;

    public C2329p0(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A03 = c0958Hi;
        A00(c0958Hi);
    }

    private final void A00(C0958Hi c0958Hi) {
        setGravity(16);
        this.A02 = new C2661uP(c0958Hi);
        this.A02.setFullCircleCorners(true);
        LinearLayout.LayoutParams pageImageViewParams = new LinearLayout.LayoutParams(A04, A04);
        pageImageViewParams.setMargins(0, 0, A05, 0);
        addView(this.A02, pageImageViewParams);
        LinearLayout pageInfoView = new LinearLayout(c0958Hi);
        pageInfoView.setOrientation(1);
        this.A00 = new TextView(c0958Hi);
        ViewGroup.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        AbstractC2426qc.A0b(this.A00, true, 16);
        this.A00.setEllipsize(TextUtils.TruncateAt.END);
        this.A00.setSingleLine(true);
        this.A01 = new TextView(c0958Hi);
        AbstractC2426qc.A0b(this.A01, false, 14);
        pageInfoView.addView(this.A00);
        pageInfoView.addView(this.A01);
        addView(pageInfoView, layoutParams);
    }

    public final void A01() {
        this.A02.setImageBitmap(null);
        this.A00.setText(b.f42142b);
        this.A01.setText(b.f42142b);
    }

    public final void A02(int i5, int i11) {
        this.A00.setTextColor(i5);
        this.A01.setTextColor(i11);
    }

    public void setPageDetails(C1756fZ c1756fZ) {
        AsyncTaskC0892Et asyncTaskC0892Et = new AsyncTaskC0892Et(this.A02, this.A03);
        asyncTaskC0892Et.A05(A04, A04);
        asyncTaskC0892Et.A07(c1756fZ.A01());
        this.A00.setText(c1756fZ.A02());
        this.A01.setText(c1756fZ.A03());
    }
}
