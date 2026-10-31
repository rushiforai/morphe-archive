package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Ff, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0904Ff extends AbstractC2624to {
    public final TextView A00;
    public final TextView A01;
    public static final int A02 = (int) (AbstractC2385px.A02 * 36.0f);
    public static final int A05 = (int) (AbstractC2385px.A02 * 4.0f);
    public static final int A03 = (int) (AbstractC2385px.A02 * 8.0f);
    public static final int A04 = (int) (AbstractC2385px.A02 * 4.0f);

    public C0904Ff(C0958Hi c0958Hi, int i5, C1744fN c1744fN, boolean z11, String str, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT) {
        super(c0958Hi, null, i5, c1744fN, z11, str, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, c1750fT, false, b.f42142b);
        setOrientation(0);
        setPadding(A05, A05, A05, A05);
        this.A01 = A01(-16448251, 13, true);
        this.A00 = A01(-10131605, 12, false);
        this.A06.addView(A00(i5), new LinearLayout.LayoutParams(-1, -2));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2);
        layoutParams.weight = 1.0f;
        addView(this.A06, layoutParams);
        this.A08.setPadding(A03, 0, A03, 0);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, A02);
        layoutParams2.gravity = 17;
        addView(this.A08, layoutParams2);
    }

    private LinearLayout A00(int i5) {
        LinearLayout linearLayout = new LinearLayout(this.A07);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(A04, 0, A04, 0);
        linearLayout.addView(this.A01, AbstractC2624to.A0C);
        linearLayout.addView(this.A00, AbstractC2624to.A0C);
        LinearLayout linearLayout2 = new LinearLayout(this.A07);
        linearLayout2.setOrientation(0);
        linearLayout2.addView(this.A09, new LinearLayout.LayoutParams(i5, i5));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 16;
        linearLayout2.addView(linearLayout, layoutParams);
        return linearLayout2;
    }

    private TextView A01(int i5, int i11, boolean z11) {
        TextView textView = new TextView(this.A07);
        textView.setTextColor(i5);
        textView.setSingleLine(true);
        textView.setEllipsize(TextUtils.TruncateAt.END);
        AbstractC2426qc.A0b(textView, z11, i11);
        return textView;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0k() {
        super.A0k();
        setOnClickListener(this.A05);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0l(int i5) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public void setInfo(C1742fL c1742fL, C1746fP c1746fP, String str, String str2, InterfaceC2396q8 interfaceC2396q8, InterfaceC2643u7 interfaceC2643u7) {
        super.setInfo(c1742fL, c1746fP, str, str2, interfaceC2396q8, interfaceC2643u7);
        this.A01.setText(c1742fL.A0H());
        this.A00.setText(c1742fL.A0G());
        if (TextUtils.isEmpty(c1746fP.A05())) {
            AbstractC2426qc.A0I(this.A08);
        }
    }
}
