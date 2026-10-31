package com.facebook.ads.redexgen.X;

import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class FC extends AbstractC2524sC {
    public static byte[] A05;
    public static final int A06;
    public static final int A07;
    public static final int A08;
    public final ImageView A00;
    public final LinearLayout A01;
    public final ScrollView A02;
    public final C1819ga A03;
    public final C0958Hi A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 55);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{53, 22, 20, 28, 105, 70, 69, 89, 79, 10, 107, 78, 10, 120, 79, 90, 69, 88, 94, 67, 68, 77};
    }

    static {
        A01();
        A08 = (int) (AbstractC2385px.A02 * 8.0f);
        A07 = (int) (AbstractC2385px.A02 * 10.0f);
        A06 = (int) (AbstractC2385px.A02 * 44.0f);
    }

    public FC(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str) {
        super(c0958Hi, interfaceC2224nG, str);
        this.A04 = c0958Hi;
        this.A03 = AbstractC1820gb.A00(this.A04.A02());
        this.A00 = new ImageView(getContext());
        this.A00.setPadding(A07, A07, A07, A07);
        this.A00.setColorFilter(-10459280);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A06, A06);
        layoutParams.gravity = 3;
        this.A00.setLayoutParams(layoutParams);
        this.A02 = new ScrollView(getContext());
        this.A02.setFillViewport(true);
        AbstractC2426qc.A0O(this.A02, -218103809);
        this.A01 = new LinearLayout(getContext());
        this.A01.setOrientation(1);
        this.A01.setPadding(A08, A08, A08, A08);
        this.A02.addView(this.A01, new FrameLayout.LayoutParams(-1, -2));
        addView(this.A02, new FrameLayout.LayoutParams(-1, -1));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0O() {
        this.A00.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.CROSS));
        this.A00.setOnClickListener(new ViewOnClickListenerC2543sV(this));
        this.A00.setContentDescription(A00(4, 18, 29));
        C2528sG c2528sG = new C2528sG(this.A04);
        c2528sG.setData(this.A03.A0H(), EnumC2437qn.HIDE_AD);
        c2528sG.setOnClickListener(new ViewOnClickListenerC2544sW(this, c2528sG));
        C2528sG c2528sG2 = new C2528sG(this.A04);
        c2528sG2.setData(this.A03.A0L(), EnumC2437qn.REPORT_AD);
        c2528sG2.setOnClickListener(new ViewOnClickListenerC2545sX(this, c2528sG2));
        C2528sG c2528sG3 = new C2528sG(this.A04);
        c2528sG3.setData(this.A03.A0M(), EnumC2437qn.AD_CHOICES_ICON);
        c2528sG3.setOnClickListener(new ViewOnClickListenerC2546sY(this, c2528sG3));
        LinearLayout.LayoutParams menuParams = new LinearLayout.LayoutParams(-2, -2);
        menuParams.setMargins(A08, A08, A08, A08);
        menuParams.gravity = 17;
        LinearLayout linearLayout = new LinearLayout(getContext());
        linearLayout.setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, 0);
        layoutParams.gravity = 17;
        layoutParams.weight = 1.0f;
        AbstractC2426qc.A0X(this.A01);
        this.A01.removeAllViews();
        this.A01.addView(this.A00);
        this.A01.addView(linearLayout, layoutParams);
        linearLayout.addView(c2528sG, menuParams);
        linearLayout.addView(c2528sG2, menuParams);
        linearLayout.addView(c2528sG3, menuParams);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0P() {
        AbstractC2426qc.A0J(this);
        AbstractC2426qc.A0K(this);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0Q(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        String strA0H;
        EnumC2437qn enumC2437qn;
        int i5;
        this.A00.setOnClickListener(null);
        if (enumC1821gc == EnumC1821gc.A05) {
            strA0H = this.A03.A0F();
            enumC2437qn = EnumC2437qn.REPORT_AD;
            i5 = -552389;
        } else {
            strA0H = this.A03.A0H();
            enumC2437qn = EnumC2437qn.HIDE_AD;
            i5 = -13272859;
        }
        C2521s9 c2521s9A0H = new C2521s9(this.A04, this.A0D).A0H(strA0H);
        String title = this.A03.A0D();
        C2521s9 c2521s9A0G = c2521s9A0H.A0G(title);
        String title2 = c1823ge.A04();
        C2522sA adHiddenView = c2521s9A0G.A0E(title2).A0J(false).A0D(enumC2437qn).A0C(i5).A0K(false).A0I(false).A0L();
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, 0);
        layoutParams.gravity = 17;
        layoutParams.weight = 1.0f;
        AbstractC2426qc.A0X(this.A01);
        this.A02.fullScroll(33);
        this.A01.removeAllViews();
        this.A01.addView(adHiddenView, layoutParams);
        super.A0Q(c1823ge, enumC1821gc);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0R(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        boolean isReportFlow = enumC1821gc == EnumC1821gc.A05;
        C2542sU c2542sU = new C2542sU(this.A04, c1823ge, this.A0D, isReportFlow ? EnumC2437qn.REPORT_AD : EnumC2437qn.HIDE_AD);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, 0);
        layoutParams.gravity = 17;
        layoutParams.weight = 1.0f;
        this.A00.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BACK_ARROW));
        this.A00.setOnClickListener(new ViewOnClickListenerC2547sZ(this));
        this.A00.setContentDescription(A00(0, 4, 64));
        AbstractC2426qc.A0X(this.A01);
        this.A02.fullScroll(33);
        this.A01.removeAllViews();
        this.A01.addView(this.A00);
        this.A01.addView(c2542sU, layoutParams);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final boolean A0S() {
        return true;
    }
}
