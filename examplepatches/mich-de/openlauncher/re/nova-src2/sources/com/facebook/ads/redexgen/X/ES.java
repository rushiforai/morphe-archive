package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.res.Configuration;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

/* loaded from: assets/audience_network/classes.dex */
public final class ES extends AbstractC2685un {
    public RelativeLayout A00;
    public RelativeLayout A01;
    public InterfaceC2409qL A02;
    public C0804Bj A03;
    public C0799Be A04;
    public C5Z A05;
    public final LinearLayout A06;
    public final LinearLayout A07;
    public final LinearLayout A08;
    public final LinearLayout A09;
    public final RelativeLayout A0A;
    public final C0958Hi A0B;
    public final C2689ur A0C;
    public final BM A0D;
    public final BE A0E;
    public static String[] A0F = {"s9nba6tcHFGP4OFZ0xBn4icOFwS7jvYl", "kktOg6f2QIHAEKumWthcUwj5E1xy5ne6", "IjcVtHpYRdXXNSWd5OMx", "jOz9iHB", "6JYIjqR9eJVKH8xFTjs9W29SzlqJw5Tu", "DQBBgeyk7HSMR4WJTfgjuLZpP1ECe9cv", "qlksgg", "SYhJ2kGhHlLlxOcVCiHXu73SejeO"};
    public static final int A0V = (int) (AbstractC2385px.A02 * 24.0f);
    public static final int A0U = (int) (AbstractC2385px.A02 * 8.0f);
    public static final int A0N = (int) (AbstractC2385px.A02 * 1.0f);
    public static final int A0O = AbstractC2383pv.A0i;
    public static final int A0T = AbstractC2383pv.A0l;
    public static final int A0I = AbstractC2383pv.A0v;
    public static final int A0W = AbstractC2383pv.A0y;
    public static final int A0J = AbstractC2383pv.A0e;
    public static final int A0L = AbstractC2383pv.A0e;
    public static final int A0K = AbstractC2383pv.A0y;
    public static final int A0M = AbstractC2383pv.A0y;
    public static final int A0P = (int) (AbstractC2385px.A02 * 12.0f);
    public static final int A0H = (int) (AbstractC2385px.A02 * 40.0f);
    public static final int A0S = AbstractC2383pv.A0e;
    public static final int A0R = AbstractC2383pv.A0i;
    public static final int A0Q = (int) (AbstractC2385px.A02 * 16.0f);
    public static final int A0G = (int) (AbstractC2385px.A02 * 6.0f);

    public ES(C2689ur c2689ur) {
        super(c2689ur, false);
        this.A0E = new BE() { // from class: com.facebook.ads.redexgen.X.6e
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (this.A00.A02 == null) {
                    return;
                }
                this.A00.A02.ALX();
            }
        };
        this.A0D = new BM() { // from class: com.facebook.ads.redexgen.X.6d
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A04.A0f(EnumC1664e4.A03, 20);
            }
        };
        this.A0B = c2689ur.A06();
        this.A0C = c2689ur;
        this.A06 = new LinearLayout(this.A0B);
        this.A09 = new LinearLayout(this.A0B);
        this.A0A = new RelativeLayout(this.A0B);
        this.A08 = new LinearLayout(this.A0B);
        this.A07 = new LinearLayout(this.A0B);
        A08();
    }

    private LinearLayout A00() {
        LinearLayout linearLayout = new LinearLayout(this.A0B);
        linearLayout.setOrientation(0);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        linearLayout.setWeightSum(3.0f);
        linearLayout.setPadding(A0U, A0U, A0U, A0U);
        String strA0D = this.A0C.A05().A32().A0J().A0D();
        String strA01 = this.A0C.A05().A32().A0J().A01();
        String rating = this.A0C.A05().A32().A0J().A05();
        if (!TextUtils.isEmpty(strA0D)) {
            LinearLayout videoMetaDataLayout = A01(EnumC2437qn.RATINGS, this.A0C.A05().A32().A0J().A0D());
            linearLayout.addView(videoMetaDataLayout);
        }
        if (!TextUtils.isEmpty(rating)) {
            LinearLayout videoMetaDataLayout2 = A01(EnumC2437qn.APP_DOWNLOAD_ICON, this.A0C.A05().A32().A0J().A05());
            linearLayout.addView(videoMetaDataLayout2);
        }
        boolean zIsEmpty = TextUtils.isEmpty(strA01);
        if (A0F[4].charAt(26) == 'B') {
            throw new RuntimeException();
        }
        A0F[2] = "p";
        if (!zIsEmpty) {
            LinearLayout videoMetaDataLayout3 = A01(EnumC2437qn.APP_SIZE_ICON, this.A0C.A05().A32().A0J().A01());
            linearLayout.addView(videoMetaDataLayout3);
        }
        layoutParams.addRule(12);
        String[] strArr = A0F;
        String str = strArr[5];
        String rating2 = strArr[1];
        if (str.charAt(4) != rating2.charAt(4)) {
            linearLayout.setLayoutParams(layoutParams);
            linearLayout.setGravity(1);
            return linearLayout;
        }
        String[] strArr2 = A0F;
        strArr2[5] = "fi4ngCqO99vukZAx8mIkB9w9ZCXNvJG5";
        strArr2[1] = "75TwgXj8mdC7k7YTuDaaVxbF7VG8aWns";
        linearLayout.setLayoutParams(layoutParams);
        linearLayout.setGravity(1);
        return linearLayout;
    }

    private LinearLayout A01(EnumC2437qn enumC2437qn, String str) {
        LinearLayout linearLayout = new LinearLayout(this.A0B);
        linearLayout.setOrientation(0);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, A0V);
        layoutParams.weight = 1.0f;
        linearLayout.setGravity(17);
        layoutParams.setMargins(A0T, A0T, A0T, A0T);
        linearLayout.setLayoutParams(layoutParams);
        AbstractC2426qc.A0W(linearLayout, AbstractC2426qc.A06(Integer.MIN_VALUE, A0Q));
        C2655uJ c2655uJ = new C2655uJ(this.A0C.A06(), 0, -1, enumC2437qn);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(A0P, A0P);
        layoutParams2.gravity = 16;
        c2655uJ.setLayoutParams(layoutParams2);
        linearLayout.addView(c2655uJ);
        TextView textView = new TextView(this.A0B);
        textView.setText(str);
        textView.setTextColor(-1);
        AbstractC2426qc.A0b(textView, false, 12);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams3.gravity = 16;
        layoutParams3.setMargins(A0W, 0, 0, 0);
        textView.setLayoutParams(layoutParams3);
        linearLayout.addView(textView);
        return linearLayout;
    }

    private final RelativeLayout A02(String str, int i5, EnumC2437qn enumC2437qn) {
        RelativeLayout relativeLayout = new RelativeLayout(this.A0B);
        ViewGroup.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0H);
        relativeLayout.setPadding(A0J, 0, A0J, 0);
        AbstractC2426qc.A0W(relativeLayout, AbstractC2426qc.A06(i5, A0G));
        relativeLayout.setLayoutParams(layoutParams);
        relativeLayout.setGravity(16);
        TextView textView = new TextView(this.A0B);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(9);
        textView.setText(str);
        textView.setTextColor(-1);
        AbstractC2426qc.A0b(textView, true, 15);
        textView.setLayoutParams(layoutParams2);
        relativeLayout.addView(textView);
        C2655uJ iconView = new C2655uJ(this.A0C.A06(), 0, -1, enumC2437qn);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(A0P, A0P);
        layoutParams3.addRule(11);
        layoutParams3.setMargins(0, A0I, 0, 0);
        iconView.setLayoutParams(layoutParams3);
        relativeLayout.addView(iconView);
        return relativeLayout;
    }

    private TextView A03(String str, boolean z11, int i5, int i11, int i12) {
        TextView textView = new TextView(this.A0B);
        textView.setText(str);
        textView.setTextColor(i11);
        AbstractC2426qc.A0b(textView, z11, i5);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(A0K, 0, A0K, i12);
        textView.setGravity(1);
        textView.setLayoutParams(layoutParams);
        return textView;
    }

    private C0799Be A05() {
        C0799Be c0799Be = new C0799Be(this.A0C.A06());
        AbstractC2426qc.A0W(c0799Be, AbstractC2426qc.A06(436207616, A0Q));
        c0799Be.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        this.A05 = new C5Z(this.A0B, getAdEventManager(), c0799Be, this.A0C.A05().A37(), 0, 0, true, null, null);
        if (C2203mv.A20(this.A0B)) {
            this.A03 = new C0804Bj(this.A0B, getAdEventManager(), c0799Be, this.A0C.A05().A37(), false, this.A05, null);
        } else {
            this.A03 = null;
        }
        return c0799Be;
    }

    private void A07() {
        this.A00 = A02(this.A0C.A05().A1j(), -14977820, EnumC2437qn.RIGHT_ARROW_ICON);
        this.A01 = A02(this.A0C.A05().A1m(), -13816531, EnumC2437qn.SKIP_ARROW);
        View divider = getDivider();
        LinearLayout linearLayout = this.A09;
        View divider2 = this.A00;
        linearLayout.addView(divider2);
        this.A09.addView(divider);
        LinearLayout linearLayout2 = this.A09;
        View divider3 = this.A01;
        linearLayout2.addView(divider3);
        this.A00.setOnClickListener(new ViewOnClickListenerC2713vF(this));
        this.A01.setOnClickListener(new ViewOnClickListenerC2714vG(this));
    }

    private void A08() {
        new C2232nO(this.A0C.A05().A37(), getAdEventManager()).A04(EnumC2231nN.A0p, null);
        AbstractC2668uW.A00(this.A0C.A06(), this, this.A0C.A05().A32().A0I().A08());
        int iA00 = this.A0C.A00();
        this.A09.setOrientation(1);
        A09();
        A0A(iA00);
        addView(this.A06);
        A0B(iA00);
        RelativeLayout relativeLayout = this.A0A;
        int orientation = A0Q;
        AbstractC2426qc.A0W(relativeLayout, AbstractC2426qc.A06(436207616, orientation));
        A0C(iA00);
        this.A04 = A05();
        this.A0A.addView(this.A04);
        this.A0A.addView(A00());
        this.A06.addView(this.A0A);
        A07();
        this.A06.addView(this.A09);
        this.A04.setVideoURI(this.A0C.A05().A32().A0I().A09());
        this.A04.A0f(EnumC1664e4.A03, 20);
        this.A04.getEventBus().A03(this.A0E, this.A0D);
    }

    private void A09() {
        this.A08.setOrientation(1);
        this.A07.setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, 0);
        this.A08.setLayoutParams(layoutParams);
        layoutParams.weight = 1.0f;
        A0D(this.A08);
        A0D(this.A07);
        this.A06.addView(this.A08);
        this.A09.addView(this.A07);
    }

    private void A0A(int i5) {
        int height;
        int width;
        this.A06.setOrientation(i5 == 1 ? 1 : 0);
        Activity activityA0E = this.A0B.A0E();
        String[] strArr = A0F;
        if (strArr[5].charAt(4) != strArr[1].charAt(4)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[3] = "sBqS2iG";
        strArr2[7] = "52Yc6YXfYsyBxyoZlg1cUOFsleHl";
        if (activityA0E == null || this.A0B.A0E().getWindowManager() == null) {
            return;
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        this.A0B.A0E().getWindowManager().getDefaultDisplay().getMetrics(displayMetrics);
        int marginHorizontal = displayMetrics.widthPixels;
        int i11 = displayMetrics.heightPixels;
        if (i5 == 1) {
            height = marginHorizontal / 6;
            width = i11 / 8;
            this.A06.setWeightSum(6.0f);
        } else {
            height = marginHorizontal / 8;
            width = i11 / 6;
            this.A06.setWeightSum(2.0f);
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.setMargins(height, width, height, width);
        layoutParams.addRule(14);
        this.A06.setLayoutParams(layoutParams);
        setRewardDescContainerVisibility(i5);
    }

    private void A0B(int i5) {
        LinearLayout.LayoutParams layoutParams;
        if (i5 == 1) {
            layoutParams = new LinearLayout.LayoutParams(-1, 0);
            layoutParams.setMargins(0, A0S, 0, 0);
            layoutParams.weight = 2.0f;
            this.A09.setGravity(0);
        } else {
            layoutParams = new LinearLayout.LayoutParams(0, -1);
            layoutParams.setMargins(A0R, 0, 0, 0);
            layoutParams.weight = 1.0f;
            this.A09.setGravity(16);
        }
        this.A09.setLayoutParams(layoutParams);
    }

    private void A0C(int i5) {
        LinearLayout.LayoutParams layoutParams;
        if (i5 == 1) {
            layoutParams = new LinearLayout.LayoutParams(-1, 0);
        } else {
            layoutParams = new LinearLayout.LayoutParams(0, -1);
        }
        layoutParams.weight = i5 == 1 ? 3.0f : 1.0f;
        this.A0A.setLayoutParams(layoutParams);
    }

    private void A0D(LinearLayout linearLayout) {
        TextView summaryView = A03(this.A0C.A05().A1l(), true, 24, -657931, A0M);
        TextView titleView = A03(this.A0C.A05().A1k(), false, 15, -1, A0L);
        linearLayout.addView(summaryView);
        linearLayout.addView(titleView);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final EnumC1698ec A1P(String str) {
        return EnumC1698ec.A08;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final void A1Q() {
        super.A1Q();
        if (this.A03 != null) {
            this.A03.A07();
        }
        if (this.A05 != null) {
            C5Z c5z = this.A05;
            String[] strArr = A0F;
            if (strArr[5].charAt(4) != strArr[1].charAt(4)) {
                throw new RuntimeException();
            }
            A0F[6] = "mxwfqv";
            c5z.A0p();
        }
        this.A04.getEventBus().A04(this.A0E, this.A0D);
        this.A00 = null;
        this.A01 = null;
        this.A02 = null;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un
    public final boolean A1g() {
        return true;
    }

    public final void A1j(C5Z c5z) {
        if (this.A05 != null) {
            C5Z c5z2 = this.A05;
            if (A0F[6].length() != 6) {
                throw new RuntimeException();
            }
            A0F[0] = "r72G0dWZupYR33KeBxyFecQ512AEwEQE";
            c5z2.A0o(c5z);
        }
    }

    private View getDivider() {
        View view = new View(this.A0B);
        view.setBackgroundColor(-10131605);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, A0N);
        layoutParams.setMargins(0, A0O, 0, A0O);
        view.setLayoutParams(layoutParams);
        return view;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2685un, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        A0A(configuration.orientation);
        A0B(configuration.orientation);
        A0C(configuration.orientation);
        requestLayout();
    }

    private void setRewardDescContainerVisibility(int i5) {
        if (i5 == 1) {
            this.A08.setVisibility(0);
            this.A07.setVisibility(8);
        } else {
            this.A08.setVisibility(8);
            this.A07.setVisibility(0);
        }
    }

    public void setVideoAdViewListener(InterfaceC2409qL interfaceC2409qL) {
        this.A02 = interfaceC2409qL;
    }
}
