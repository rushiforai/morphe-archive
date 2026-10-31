package com.facebook.ads.redexgen.X;

import android.animation.LayoutTransition;
import android.graphics.Bitmap;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;

/* renamed from: com.facebook.ads.redexgen.X.ss, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2566ss extends LinearLayout {
    public static String[] A0I = {"kYky", "Ytyb6EqPolkd3IBPRyelkKTSOwPpDK", "T7mJgPxrQO7oXK5", "ntUdAWqKDjSpARXDvSYNWruqLRNJVSnQ", "EUE8AWSPEnh2CCxvEJvcwP9LMDnlI69H", "1sRbwp1vEOWpoihmxUd6HSpJGtNrEdLQ", "KMlCf6mmSTXsWQ", "wQ59sdNYsDWf07oSSS0IvkK4b2nAfpeC"};
    public ImageView A00;
    public ImageView A01;
    public InterfaceC2567st A02;
    public Runnable A03;
    public boolean A04;
    public final int A05;
    public final Bitmap A06;
    public final Bitmap A07;
    public final Bitmap A08;
    public final Bitmap A09;
    public final Bitmap A0A;
    public final Bitmap A0B;
    public final LA A0C;
    public final C0958Hi A0D;
    public final C2232nO A0E;
    public final InterfaceC2459r9 A0F;
    public final EnumC2569sv A0G;
    public final EnumC2572sy A0H;

    public C2566ss(C0958Hi c0958Hi, boolean z11, LA la2, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9, EnumC2569sv enumC2569sv, InterfaceC2567st interfaceC2567st, EnumC2572sy enumC2572sy) {
        this(c0958Hi, z11, la2, c2232nO, interfaceC2459r9, enumC2569sv, enumC2572sy);
        this.A02 = interfaceC2567st;
    }

    public C2566ss(C0958Hi c0958Hi, boolean z11, LA la2, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9, EnumC2569sv enumC2569sv, EnumC2572sy enumC2572sy) {
        super(c0958Hi);
        this.A07 = AbstractC2438qo.A01(EnumC2437qn.CREDIT_LINE_INFO_ICON);
        this.A06 = AbstractC2438qo.A01(EnumC2437qn.CREDIT_LINE_DETAIL_ICON);
        this.A04 = false;
        this.A08 = AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_ICON);
        this.A09 = AbstractC2438qo.A01(EnumC2437qn.AD_CHOICE_TEXT);
        this.A0A = AbstractC2438qo.A01(EnumC2437qn.AD_CREDIT_LINE_COLLAPSE_TEXT);
        this.A0B = AbstractC2438qo.A01(EnumC2437qn.CREDIT_LINE_TEXT);
        this.A05 = la2.A2z();
        this.A0E = c2232nO;
        this.A0F = interfaceC2459r9;
        this.A0G = enumC2569sv;
        this.A0D = c0958Hi;
        this.A0C = la2;
        this.A0H = enumC2572sy;
        A05();
        A0K(z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A02() {
        AbstractC2426qc.A0N(this.A00, 1.0f, 0.0f, 100);
        A0E(3, 300, new InterfaceC2553sf() { // from class: com.facebook.ads.redexgen.X.FA
            @Override // com.facebook.ads.redexgen.X.InterfaceC2553sf
            public final void ALQ(Object obj, long j11) {
                this.A00.A0U(obj, j11);
            }
        }, new C2562so(this));
        postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.sj
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A0R();
            }
        }, 100L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03() {
        A0E(2, 300, new InterfaceC2553sf() { // from class: com.facebook.ads.redexgen.X.FB
            @Override // com.facebook.ads.redexgen.X.InterfaceC2553sf
            public final void ALQ(Object obj, long j11) {
                this.A00.A0V(obj, j11);
            }
        }, new C2560sm(this));
        AbstractC2426qc.A0N(this.A00, 0.0f, 1.0f, 0);
        AbstractC2426qc.A0P(this.A00, 0);
    }

    private void A04() {
        if (this.A04 && this.A03 != null) {
            A06();
            A02();
        }
    }

    private void A05() {
        switch (this.A0H) {
            case A03:
                AbstractC2568su.A03(this.A0D, this.A0G);
                break;
            case A02:
                AbstractC2568su.A02(this.A0D, this.A0G);
                break;
        }
    }

    private void A06() {
        if (this.A04 && this.A03 != null) {
            removeCallbacks(this.A03);
            this.A03 = null;
        }
        this.A04 = false;
    }

    private void A07() {
        switch (this.A0H) {
            case A02:
                AbstractC2426qc.A0O(this, -859190839);
                break;
            default:
                AbstractC2426qc.A0O(this, -870569165);
                break;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08() {
        switch (this.A0H) {
            case A02:
                this.A01.setPadding(AbstractC2383pv.A0U, AbstractC2383pv.A00, AbstractC2383pv.A0B, AbstractC2383pv.A00);
                break;
            case A04:
                this.A01.setPadding(AbstractC2383pv.A0U, AbstractC2383pv.A00, AbstractC2383pv.A0U, AbstractC2383pv.A00);
                this.A01.setVisibility(8);
                break;
            default:
                this.A01.setPadding(AbstractC2383pv.A0K, AbstractC2383pv.A00, AbstractC2383pv.A0B, AbstractC2383pv.A00);
                break;
        }
    }

    private void A09() {
        switch (this.A0H) {
            case A02:
                A0F(this.A00, this.A09, AbstractC2383pv.A00, AbstractC2383pv.A01, AbstractC2383pv.A0U, AbstractC2383pv.A01, AbstractC2383pv.A0X, 1123);
                break;
            case A04:
                A0F(this.A00, this.A0B, AbstractC2383pv.A02, AbstractC2383pv.A00, AbstractC2383pv.A02, AbstractC2383pv.A00, -2, 1126);
                break;
            default:
                A0F(this.A00, this.A06, AbstractC2383pv.A00, AbstractC2383pv.A0B, AbstractC2383pv.A0U, AbstractC2383pv.A0B, -2, 1125);
                break;
        }
    }

    private void A0A() {
        switch (this.A0H) {
            case A02:
                ImageView imageView = this.A01;
                Bitmap bitmap = this.A08;
                int i5 = AbstractC2383pv.A0K;
                int i11 = AbstractC2383pv.A00;
                int i12 = AbstractC2383pv.A0K;
                if (A0I[6].length() != 14) {
                    A0F(imageView, bitmap, i5, i11, i12, AbstractC2383pv.A00, AbstractC2383pv.A0X, 1122);
                    return;
                } else {
                    A0I[1] = "3V7eP7xG7WTZc9MDvH5LSGfpfKaqXB";
                    A0F(imageView, bitmap, i5, i11, i12, AbstractC2383pv.A00, AbstractC2383pv.A0X, 1122);
                    return;
                }
            case A04:
                ImageView imageView2 = this.A01;
                Bitmap bitmap2 = this.A0A;
                int i13 = AbstractC2383pv.A0U;
                if (A0I[6].length() != 14) {
                    throw new RuntimeException();
                }
                String[] strArr = A0I;
                strArr[4] = "BfuGKUtJXOjLFO9TkfLBBgMAfanlH5m0";
                strArr[7] = "PCZaCPjK2uAoJJ2LfmWPR1QmBonTi8PG";
                A0F(imageView2, bitmap2, i13, AbstractC2383pv.A00, AbstractC2383pv.A0U, AbstractC2383pv.A00, -2, 1127);
                return;
            default:
                A0F(this.A01, this.A07, AbstractC2383pv.A0K, AbstractC2383pv.A00, AbstractC2383pv.A0K, AbstractC2383pv.A00, -2, 1124);
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0B() {
        this.A03 = new Runnable() { // from class: com.facebook.ads.redexgen.X.si
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A02();
            }
        };
        postDelayed(this.A03, this.A05);
    }

    private void A0C() {
        this.A04 = true;
        AbstractC2426qc.A0P(this.A00, 0);
        A0B();
    }

    private final void A0D() {
        AbstractC2426qc.A0P(this.A00, 8);
        AbstractC2426qc.A0P(this.A01, 0);
        if (this.A0H == EnumC2572sy.A04) {
            this.A01.setPadding(AbstractC2383pv.A0U, AbstractC2383pv.A00, AbstractC2383pv.A0U, AbstractC2383pv.A00);
        } else {
            this.A01.setPadding(AbstractC2383pv.A0K, AbstractC2383pv.A00, AbstractC2383pv.A0K, AbstractC2383pv.A00);
        }
    }

    private void A0E(int i5, int i11, InterfaceC2553sf interfaceC2553sf, LayoutTransition.TransitionListener transitionListener) {
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.setAnimator(i5, new C2564sq(this, i11, interfaceC2553sf));
        layoutTransition.addTransitionListener(transitionListener);
        setLayoutTransition(layoutTransition);
    }

    private void A0F(ImageView imageView, Bitmap bitmap, int i5, int i11, int i12, int i13, int i14, int i15) {
        AbstractC2426qc.A0H(i15, imageView);
        imageView.setImageBitmap(bitmap);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setAdjustViewBounds(true);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, i14);
        imageView.setPadding(i5, i11, i12, i13);
        imageView.setLayoutParams(layoutParams);
    }

    private void A0K(boolean z11) {
        setOrientation(0);
        setPadding(AbstractC2383pv.A00, AbstractC2383pv.A0K, AbstractC2383pv.A00, AbstractC2383pv.A0K);
        setClipToPadding(false);
        setGravity(17);
        A07();
        setCornerRadius(AbstractC2383pv.A0D);
        this.A01 = new ImageView(getContext());
        A0A();
        addView(this.A01);
        if (this.A0H == EnumC2572sy.A04) {
            this.A01.setVisibility(8);
        }
        this.A00 = new ImageView(getContext());
        A09();
        addView(this.A00);
        A0L(z11);
        setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.sh
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0T(view);
            }
        });
    }

    private void A0L(boolean z11) {
        if (z11 && (this.A0H == EnumC2572sy.A03 || this.A0H == EnumC2572sy.A04)) {
            A0C();
        } else {
            AbstractC2426qc.A0P(this.A00, 8);
            AbstractC2426qc.A0P(this.A01, 0);
        }
    }

    public final void A0O() {
        A06();
    }

    public final void A0P() {
        A06();
        A0D();
    }

    public final void A0Q() {
        this.A04 = true;
        post(new Runnable() { // from class: com.facebook.ads.redexgen.X.sk
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A0S();
            }
        });
    }

    public final /* synthetic */ void A0R() {
        AbstractC2426qc.A0P(this.A00, 8);
    }

    public final /* synthetic */ void A0S() {
        postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.sg
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A03();
            }
        }, 300L);
    }

    public final /* synthetic */ void A0T(View view) {
        if (this.A04) {
            if (this.A0H == EnumC2572sy.A04) {
                return;
            }
            A04();
            if (this.A02 != null) {
                this.A02.AEX(view);
                return;
            } else {
                AbstractC2568su.A08(this.A0E, this.A0D, this.A0F, this.A0C, this.A0G);
                return;
            }
        }
        AbstractC2568su.A01(this.A0C, this.A0G, this.A0D);
        A0Q();
    }

    public final /* synthetic */ void A0U(Object obj, long j11) {
        ((View) obj).animate().translationX(getWidth()).setDuration(j11).setInterpolator(new InterpolatorC2348pL(1.5f)).setListener(new C2563sp(this)).start();
    }

    public final /* synthetic */ void A0V(Object obj, long j11) {
        View view = (View) obj;
        view.setTranslationX(getWidth());
        view.animate().translationX(0.0f).setDuration(j11).setListener(new C2561sn(this)).setInterpolator(new pM(1.5f)).start();
    }

    private void setCornerRadius(float f11) {
        setOutlineProvider(new C2559sl(this, f11));
        setClipToOutline(true);
    }
}
