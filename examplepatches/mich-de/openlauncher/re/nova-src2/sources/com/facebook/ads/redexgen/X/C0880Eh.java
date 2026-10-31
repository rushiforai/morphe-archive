package com.facebook.ads.redexgen.X;

import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.text.NumberFormat;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Eh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0880Eh extends AbstractC2624to {
    public static byte[] A0J;
    public static String[] A0K = {"ZYFZvgakVe", "Z9juamcNffZ", "L6NhnuluGVbfOuIZp07EBLc1k7rVfOba", "poGipFcmqzgO1AN9d1VwktKUuwbeuE2x", "1MA0bi3k", "zUZ", "l0mlyabDLiJh1QvHe0VixDkOpEP8aZzg", "KStQaqdBmF0CfboN9Wjc4"};
    public static final int A0L;
    public static final int A0M;
    public static final int A0N;
    public static final int A0O;
    public static final int A0P;
    public static final int A0Q;
    public static final int A0R;
    public static final int A0S;
    public static final int A0T;
    public static final int A0U;
    public static final int A0V;
    public int A00;
    public int A01;
    public LinearLayout A02;
    public TextView A03;
    public TextView A04;
    public TextView A05;
    public C1742fL A06;
    public C1744fN A07;
    public C1746fP A08;
    public C2663uR A09;
    public boolean A0A;
    public boolean A0B;
    public final LinearLayout A0C;
    public final RelativeLayout A0D;
    public final RelativeLayout A0E;
    public final TextView A0F;
    public final C0958Hi A0G;
    public final String A0H;
    public final boolean A0I;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0J, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 99);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A04() {
        this.A0D.removeAllViews();
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.bottomMargin = A0O;
        this.A0D.setLayoutParams(layoutParams);
        AbstractC2426qc.A0L(this.A0D);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(super.A04, super.A04);
        layoutParams2.addRule(15);
        layoutParams2.addRule(9);
        this.A0D.addView(super.A09, layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.leftMargin = A0P;
        layoutParams3.addRule(1, super.A09.getId());
        layoutParams3.addRule(15);
        this.A0D.addView(this.A0E, layoutParams3);
        this.A0E.removeAllViews();
        AbstractC2426qc.A0L(this.A05);
        this.A05.setLayoutParams(AbstractC2624to.A0C);
        this.A05.setTextColor(this.A0B ? this.A07.A07(true) : -1);
        AbstractC2426qc.A0b(this.A05, true, 18);
        this.A0E.addView(this.A05);
        this.A02.setOrientation(0);
        this.A02.setGravity(16);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, A0Q);
        layoutParams4.topMargin = A0P / 2;
        layoutParams4.addRule(3, this.A05.getId());
        this.A0E.addView(this.A02, layoutParams4);
        this.A02.removeAllViews();
        this.A09.setGravity(16);
        this.A02.addView(this.A09, new LinearLayout.LayoutParams(-2, -1));
        this.A04.setTextColor(this.A0B ? this.A07.A07(true) : -1);
        this.A04.setGravity(16);
        this.A04.setIncludeFontPadding(false);
        AbstractC2426qc.A0b(this.A04, false, 14);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-2, -1);
        layoutParams5.leftMargin = A0P;
        this.A02.addView(this.A04, layoutParams5);
    }

    public static void A09() {
        A0J = new byte[]{-111, -20};
    }

    static {
        A09();
        A0U = AbstractC1841gx.A02(-1, 77);
        A0O = AbstractC2383pv.A0c;
        A0P = AbstractC2383pv.A0y;
        A0L = AbstractC2383pv.A0j;
        A0N = (int) (AbstractC2385px.A02 * 144.0f);
        A0M = (int) (AbstractC2385px.A02 * 48.0f);
        A0Q = (int) (AbstractC2385px.A02 * 16.0f);
        A0V = (int) (AbstractC2385px.A02 * 14.0f);
        A0R = (int) (C1830gm.A08 * 21.0f);
        A0S = (int) (C1830gm.A08 * 12.0f);
        A0T = (int) (C1830gm.A08 * 10.0f);
    }

    public C0880Eh(C0958Hi c0958Hi, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i5, boolean z11, C1744fN c1744fN, boolean z12, String str, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, LA la2) {
        this(c0958Hi, viewOnClickListenerC0884El, i5, z11, c1744fN, false, str, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, la2.A33(), la2.A2W(), la2.A1f(), la2.A2g(), la2.A1n());
    }

    public C0880Eh(C0958Hi c0958Hi, ViewOnClickListenerC0884El viewOnClickListenerC0884El, int i5, boolean z11, C1744fN c1744fN, boolean z12, String str, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, C1539c2 c1539c2, C2417qT c2417qT, C1750fT c1750fT, boolean z13, String str2, boolean z14, String str3) {
        super(c0958Hi, viewOnClickListenerC0884El, i5, c1744fN, z12, str, interfaceC2224nG, interfaceC2459r9, c1539c2, c2417qT, c1750fT, z13, str2);
        this.A00 = 0;
        this.A01 = 0;
        this.A0A = true;
        this.A0G = c0958Hi;
        this.A0H = str3;
        super.A09.setFullCircleCorners(z11);
        setPadding(A0O, A0O, A0O, A0L);
        this.A0D = new RelativeLayout(getContext());
        this.A05 = new TextView(getContext());
        this.A02 = new LinearLayout(getContext());
        this.A09 = new C2663uR(this.A0G, A0V, 5, A0U, -1);
        this.A0E = new RelativeLayout(getContext());
        this.A0C = new LinearLayout(getContext());
        this.A04 = new TextView(getContext());
        this.A03 = new TextView(getContext());
        super.A06.addView(this.A0D);
        super.A06.addView(this.A0C);
        this.A0F = new TextView(getContext());
        this.A07 = c1744fN;
        this.A0I = C2203mv.A16(c0958Hi);
        AbstractC2426qc.A0V(this, c0958Hi);
        this.A0B = C2203mv.A2e(this.A0G);
        A0A();
        if (z14) {
            this.A03.setVisibility(8);
            this.A0C.setVisibility(8);
        }
    }

    private GradientDrawable A00(int i5, float f11) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setCornerRadius(f11);
        drawable.setColor(i5);
        return drawable;
    }

    private void A02() {
        super.A08.setPadding(0, 0, 0, 0);
        super.A08.setLayoutParams(new LinearLayout.LayoutParams(-1, A0M));
    }

    private void A03() {
        LinearLayout.LayoutParams layoutParams;
        this.A0C.setOrientation(1);
        this.A0C.setPadding(0, 0, 0, A0O);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, this.A0D.getId());
        this.A0C.setLayoutParams(layoutParams2);
        this.A0C.removeAllViews();
        this.A03.setMaxLines(2);
        this.A03.setEllipsize(TextUtils.TruncateAt.END);
        this.A03.setGravity(16);
        this.A03.setTextColor(this.A0B ? this.A07.A06(true) : -1);
        if (A0K[3].charAt(12) != '1') {
            throw new RuntimeException();
        }
        A0K[3] = "GrwjTtxURhrO1EQl6RsuguGKXpAC8Gmx";
        AbstractC2426qc.A0b(this.A03, false, 16);
        if (this.A0I) {
            layoutParams = new LinearLayout.LayoutParams(-2, -2);
        } else {
            layoutParams = new LinearLayout.LayoutParams(-1, -2);
        }
        LinearLayout linearLayout = this.A0C;
        String[] strArr = A0K;
        if (strArr[2].charAt(17) != strArr[6].charAt(17)) {
            throw new RuntimeException();
        }
        A0K[1] = "ewlwa2SJNlK21mEN5Hlfw30tD2ecrw";
        linearLayout.addView(this.A03, layoutParams);
    }

    private void A05() {
        if (super.A01 != null) {
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            super.A01.setPadding(0, 0, 0, A0S);
            super.A01.setText(super.A02);
            super.A01.setTextColor(-1);
            AbstractC2426qc.A0b(super.A01, false, 15);
            super.A01.setLayoutParams(layoutParams);
        }
    }

    private void A06() {
        if (super.A00 != null) {
            super.A00.removeAllViews();
            super.A00.setOrientation(1);
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -1);
            layoutParams.setMargins(0, A0R, 0, A0R);
            super.A00.setGravity(17);
            super.A00.setPadding(A0S, A0S, A0S, A0S);
            super.A00.setLayoutParams(layoutParams);
            AbstractC2426qc.A0W(super.A00, A00(-1121112787, A0T));
            A05();
            A02();
            if (super.A01 != null) {
                LinearLayout linearLayout = super.A00;
                TextView textView = super.A01;
                String[] strArr = A0K;
                if (strArr[2].charAt(17) != strArr[6].charAt(17)) {
                    throw new RuntimeException();
                }
                A0K[5] = "ATO";
                linearLayout.addView(textView);
            }
            super.A00.addView(super.A08);
        }
    }

    private void A07() {
        LinearLayout.LayoutParams layoutParams;
        this.A0F.setMaxLines(1);
        this.A0F.setEllipsize(TextUtils.TruncateAt.END);
        this.A0F.setGravity(17);
        this.A0F.setTextColor(this.A0B ? this.A07.A07(true) : -1);
        this.A0F.setAllCaps(true);
        AbstractC2426qc.A0b(this.A0F, false, 12);
        new LinearLayout.LayoutParams(-1, -2);
        if (this.A0I) {
            layoutParams = new LinearLayout.LayoutParams(-2, -2);
        } else {
            layoutParams = new LinearLayout.LayoutParams(-1, -2);
        }
        layoutParams.topMargin = A0O;
        this.A0F.setLayoutParams(layoutParams);
    }

    private void A08() {
        if (this.A06 == null) {
            return;
        }
        this.A05.setText(this.A06.A0H());
        this.A03.setText(this.A06.A04());
        String str = this.A0H;
        boolean z11 = (str == null || str.isEmpty()) ? false : true;
        if (z11) {
            this.A0F.setAllCaps(false);
            this.A0F.setText(str);
        } else {
            TextView textView = this.A0F;
            if (A0K[3].charAt(12) != '1') {
                A0K[4] = "PRqEppX5";
                textView.setAllCaps(true);
                TextView textView2 = this.A0F;
                String promoCodeTitle = this.A06.A0F();
                textView2.setText(promoCodeTitle);
            } else {
                A0K[5] = "U7U";
                textView.setAllCaps(true);
                TextView textView3 = this.A0F;
                String promoCodeTitle2 = this.A06.A0F();
                textView3.setText(promoCodeTitle2);
            }
        }
        String promoCodeTitle3 = this.A08.A05();
        if (TextUtils.isEmpty(promoCodeTitle3)) {
            AbstractC2426qc.A0I(super.A08);
        }
        if (!z11) {
            String promoCodeTitle4 = this.A06.A0F();
            if (TextUtils.isEmpty(promoCodeTitle4)) {
                AbstractC2426qc.A0I(this.A0F);
            }
        }
        String strA0D = this.A06.A0D();
        String promoCodeTitle5 = A0K[4];
        if (promoCodeTitle5.length() != 8) {
            throw new RuntimeException();
        }
        A0K[4] = "KlO90K15";
        if (TextUtils.isEmpty(strA0D)) {
            this.A02.setVisibility(8);
            return;
        }
        this.A02.setVisibility(0);
        C2663uR c2663uR = this.A09;
        String promoCodeTitle6 = this.A06.A0D();
        c2663uR.setRating(Float.parseFloat(promoCodeTitle6));
        String promoCodeTitle7 = this.A06.A0A();
        if (promoCodeTitle7 == null) {
            return;
        }
        TextView textView4 = this.A04;
        StringBuilder sb2 = new StringBuilder();
        String promoCodeTitle8 = A01(0, 1, 6);
        StringBuilder sbAppend = sb2.append(promoCodeTitle8);
        NumberFormat numberInstance = NumberFormat.getNumberInstance();
        String promoCodeTitle9 = this.A06.A0A();
        StringBuilder sbAppend2 = sbAppend.append(numberInstance.format(Integer.parseInt(promoCodeTitle9)));
        String promoCodeTitle10 = A01(1, 1, 96);
        textView4.setText(sbAppend2.append(promoCodeTitle10).toString());
    }

    private final void A0A() {
        removeAllViews();
        if (this.A0A) {
            A0C();
        } else {
            A0B();
        }
    }

    private final void A0B() {
        setWeightSum(5.0f);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2);
        layoutParams.weight = !super.A03 ? 4.0f : 3.0f;
        layoutParams.bottomMargin = A0L - A0O;
        super.A06.setLayoutParams(layoutParams);
        AbstractC2426qc.A0K(super.A06);
        addView(super.A06);
        if (!super.A03) {
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(0, A0M);
            layoutParams2.bottomMargin = A0L / 2;
            layoutParams2.weight = 1.0f;
            layoutParams2.gravity = 80;
            super.A08.setLayoutParams(layoutParams2);
            super.A08.setMinWidth(A0N);
            AbstractC2426qc.A0K(super.A08);
            addView(super.A08);
        } else if (super.A00 != null) {
            LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(0, -2);
            layoutParams3.weight = 2.0f;
            super.A00.setLayoutParams(layoutParams3);
            super.A00.requestLayout();
        }
        AbstractC2426qc.A0K(this.A0F);
        LinearLayout.LayoutParams socialContextParams = new LinearLayout.LayoutParams(-1, -1);
        socialContextParams.topMargin = 0;
        socialContextParams.bottomMargin = A0P;
        this.A0C.addView(this.A0F, socialContextParams);
        this.A0C.setPadding(0, 0, 0, 0);
        this.A0F.setGravity(3);
    }

    private final void A0C() {
        super.A06.setLayoutParams(AbstractC2624to.A0C);
        A04();
        A03();
        if (!super.A03) {
            A02();
        } else {
            A06();
        }
        A07();
        A08();
        AbstractC2426qc.A0K(super.A06);
        if (!super.A03) {
            ViewOnClickListenerC0884El viewOnClickListenerC0884El = super.A08;
            if (A0K[4].length() != 8) {
                throw new RuntimeException();
            }
            A0K[4] = "zaXcM54b";
            AbstractC2426qc.A0K(viewOnClickListenerC0884El);
        }
        addView(super.A06);
        if (!super.A03) {
            ViewOnClickListenerC0884El viewOnClickListenerC0884El2 = super.A08;
            if (A0K[0].length() == 17) {
                throw new RuntimeException();
            }
            String[] strArr = A0K;
            strArr[2] = "NZcjAgexlZrKuNflL0XnKw9N6dxGExbL";
            strArr[6] = "FeYbzRWfRAUsD40JO0HontMqMj3Ps5Kr";
            addView(viewOnClickListenerC0884El2);
        } else if (super.A00 != null) {
            addView(super.A00);
        }
        AbstractC2426qc.A0K(this.A0F);
        addView(this.A0F);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0k() {
        super.A0k();
        this.A09.setOnClickListener(super.A05);
        this.A0F.setOnClickListener(super.A05);
        this.A04.setOnClickListener(super.A05);
        this.A03.setOnClickListener(super.A05);
        this.A05.setOnClickListener(super.A05);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final void A0l(int i5) {
        boolean z11 = true;
        if (i5 != 1) {
            z11 = false;
        }
        this.A0A = z11;
        setOrientation(this.A0A ? 1 : 0);
        A0A();
        bringToFront();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public final View getExpandableLayout() {
        return this.A0C;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        if (this.A00 == 0) {
            this.A00 = this.A03.getHeight();
            this.A01 = this.A0F.getHeight();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public void setInfo(C1742fL c1742fL, C1746fP c1746fP, String str, String str2, InterfaceC2396q8 interfaceC2396q8, InterfaceC2643u7 interfaceC2643u7) {
        super.setInfo(c1742fL, c1746fP, str, str2, interfaceC2396q8, interfaceC2643u7);
        this.A06 = c1742fL;
        this.A08 = c1746fP;
        A08();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2624to
    public void setTitleMaxLines(int i5) {
        this.A05.setMaxLines(i5);
        this.A05.setEllipsize(TextUtils.TruncateAt.END);
    }
}
