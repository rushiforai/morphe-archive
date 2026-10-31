package com.facebook.ads.redexgen.X;

import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class FD extends AbstractC2524sC {
    public static byte[] A06;
    public static final int A07;
    public static final int A08;
    public static final int A09;
    public final HorizontalScrollView A00;
    public final ImageView A01;
    public final LinearLayout A02;
    public final LinearLayout A03;
    public final C1819ga A04;
    public final C0958Hi A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{-57, -26, -24, -16, -92, -51, -48, -44, -58, -127, -94, -59, -127, -77, -58, -47, -48, -45, -43, -54, -49, -56};
    }

    static {
        A01();
        A09 = (int) (AbstractC2385px.A02 * 4.0f);
        A08 = (int) (AbstractC2385px.A02 * 10.0f);
        A07 = (int) (AbstractC2385px.A02 * 44.0f);
    }

    public FD(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str) {
        super(c0958Hi, interfaceC2224nG, str);
        this.A05 = c0958Hi;
        this.A04 = AbstractC1820gb.A00(c0958Hi.A02());
        this.A01 = new ImageView(getContext());
        this.A01.setPadding(A08, A08, A08, A08);
        this.A01.setScaleType(ImageView.ScaleType.FIT_CENTER);
        this.A01.setColorFilter(-10459280);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(A07, A07);
        layoutParams.gravity = 16;
        this.A02 = new LinearLayout(getContext());
        this.A02.setOrientation(0);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.gravity = 17;
        this.A00 = new HorizontalScrollView(getContext());
        this.A00.setHorizontalScrollBarEnabled(false);
        this.A00.setLayoutParams(layoutParams2);
        this.A00.addView(this.A02, layoutParams2);
        this.A03 = new LinearLayout(getContext());
        this.A03.setOrientation(0);
        AbstractC2426qc.A0O(this.A03, -218103809);
        this.A03.setMotionEventSplittingEnabled(false);
        this.A03.addView(this.A01, layoutParams);
        this.A03.addView(this.A00, layoutParams2);
        addView(this.A03, new FrameLayout.LayoutParams(-1, -1));
        this.A03.setClickable(true);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0O() {
        this.A01.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.CROSS));
        this.A01.setOnClickListener(new ViewOnClickListenerC2533sL(this));
        this.A01.setContentDescription(A00(4, 18, 89));
        C2528sG c2528sG = new C2528sG(this.A05);
        c2528sG.setData(this.A04.A0H(), EnumC2437qn.HIDE_AD);
        c2528sG.setOnClickListener(new ViewOnClickListenerC2534sM(this, c2528sG));
        C2528sG c2528sG2 = new C2528sG(this.A05);
        c2528sG2.setData(this.A04.A0L(), EnumC2437qn.REPORT_AD);
        c2528sG2.setOnClickListener(new ViewOnClickListenerC2535sN(this, c2528sG2));
        C2528sG c2528sG3 = new C2528sG(this.A05);
        c2528sG3.setData(this.A04.A0M(), EnumC2437qn.AD_CHOICES_ICON);
        c2528sG3.setOnClickListener(new ViewOnClickListenerC2536sO(this, c2528sG3));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, A09, A09, A09);
        AbstractC2426qc.A0X(this.A03);
        this.A02.removeAllViews();
        this.A02.addView(c2528sG, layoutParams);
        this.A02.addView(c2528sG2, layoutParams);
        this.A02.addView(c2528sG3, layoutParams);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0P() {
        AbstractC2426qc.A0J(this);
        AbstractC2426qc.A0K(this);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0Q(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        this.A01.setOnClickListener(null);
        TextView textView = new TextView(getContext());
        AbstractC2426qc.A0b(textView, true, 14);
        textView.setText(this.A04.A0D());
        textView.setGravity(17);
        AbstractC2426qc.A0X(this.A03);
        this.A03.removeAllViews();
        this.A03.addView(textView, new LinearLayout.LayoutParams(-1, -1));
        super.A0Q(c1823ge, enumC1821gc);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final void A0R(C1823ge c1823ge, EnumC1821gc enumC1821gc) {
        AbstractC2426qc.A0X(this.A03);
        this.A01.setImageBitmap(AbstractC2438qo.A01(EnumC2437qn.BACK_ARROW));
        this.A01.setOnClickListener(new ViewOnClickListenerC2537sP(this));
        this.A01.setContentDescription(A00(0, 4, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        this.A02.removeAllViews();
        this.A00.fullScroll(17);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.setMargins(0, A09, A09, A09);
        for (C1823ge c1823ge2 : c1823ge.A05()) {
            C2528sG c2528sG = new C2528sG(this.A05);
            c2528sG.setData(c1823ge2.A04(), null);
            c2528sG.setOnClickListener(new ViewOnClickListenerC2538sQ(this, c2528sG, c1823ge2));
            this.A02.addView(c2528sG, layoutParams);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2524sC
    public final boolean A0S() {
        return true;
    }
}
