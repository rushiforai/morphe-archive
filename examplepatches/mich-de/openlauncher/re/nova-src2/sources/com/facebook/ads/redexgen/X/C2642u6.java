package com.facebook.ads.redexgen.X;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.u6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2642u6 extends RelativeLayout {
    public static byte[] A0E;
    public static String[] A0F = {"xsUPlRCeoLzFC37Rq9JMYM7iX3bsuHdB", "3os6lxnFhvXdiVl0rZV65lsnKU3KSEIH", "ehKf7VVuykQdHVllv8tSrtO9VjF0epQ", "VVWHKhRNuaENvRDFoieWRKQbXxG1K5", "M1KEsMQqNwIwnMwtqrKXMAaQG3BWXTOc", "sIunNAxWwMAB0c9J35TP00", "CEIZkjvXEhXRbrbOcit70U", "cg6HBKkblrHzWPkAjyZy4maowCBLS0aI"};
    public static final int A0G;
    public AnimatorSet A00;
    public AnimatorSet A01;
    public AnimatorSet A02;
    public LinearLayout A03;
    public C2595tL A04;
    public F4 A05;
    public final int A06;
    public final int A07;
    public final View A08;
    public final AbstractC1701ef A09;
    public final C1830gm A0A;
    public final C0958Hi A0B;
    public final InterfaceC2459r9 A0C;
    public final ViewOnClickListenerC0884El A0D;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
            if (A0F[6].length() != 22) {
                throw new RuntimeException();
            }
            String[] strArr = A0F;
            strArr[3] = "C1U42TeYYRv8UUijKyPrgKUlfuJFYA";
            strArr[2] = "qV7bTYhnTcwD5gFaBTDI3yjUAX8xNfo";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A0E = new byte[]{46};
    }

    static {
        A08();
        A0G = AbstractC2383pv.A02;
    }

    public C2642u6(C0958Hi c0958Hi, InterfaceC2459r9 interfaceC2459r9, int i5, AbstractC1701ef abstractC1701ef, ViewOnClickListenerC0884El viewOnClickListenerC0884El, View view) {
        super(c0958Hi);
        this.A0B = c0958Hi;
        this.A0C = interfaceC2459r9;
        this.A09 = abstractC1701ef;
        this.A0D = viewOnClickListenerC0884El;
        this.A08 = view;
        if (getResources().getConfiguration().orientation == 1) {
            this.A02 = new AnimatorSet();
            this.A01 = new AnimatorSet();
            this.A00 = new AnimatorSet();
        }
        int i11 = (int) (i5 * AbstractC2385px.A02);
        this.A07 = i11;
        this.A06 = i11 - A0G;
        this.A0A = A02();
    }

    private LinearLayout A00() {
        F4 f42;
        this.A03 = new LinearLayout(this.A0B);
        this.A03.setOrientation(1);
        this.A03.addView(A01());
        C0886En c0886En = new C0886En(this);
        if (AbstractC2204mw.A02(this.A0B) || this.A0B.A0E() == null) {
            f42 = new F4(this.A0B, c0886En);
        } else {
            f42 = new F4(this.A0B, this.A0B.A0E(), c0886En);
        }
        this.A05 = f42;
        this.A03.addView(this.A05, new LinearLayout.LayoutParams(-1, -1));
        this.A05.loadUrl(((C07297v) this.A09).A0O().toString());
        return this.A03;
    }

    private LinearLayout A01() {
        this.A04 = new C2595tL(this.A0B);
        this.A04.setGravity(17);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(AbstractC2383pv.A0H, 0, AbstractC2383pv.A0H, 0);
        this.A04.setLayoutParams(layoutParams);
        LinearLayout linearLayout = new LinearLayout(this.A0B);
        linearLayout.addView(this.A04);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.setMargins(AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X, AbstractC2383pv.A0X);
        linearLayout.setLayoutParams(layoutParams2);
        return linearLayout;
    }

    private C1830gm A02() {
        C1830gm c1830gm = new C1830gm(this.A0B);
        c1830gm.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        c1830gm.setRadius(40.0f);
        c1830gm.addView(A00());
        c1830gm.setTranslationY(getResources().getDisplayMetrics().heightPixels);
        View view = new View(this.A0B);
        view.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        view.setBackgroundColor(0);
        view.setOnClickListener(new ViewOnClickListenerC2641u5(this));
        c1830gm.addView(view);
        return c1830gm;
    }

    private void A07() {
        if (this.A02 != null) {
            this.A02.cancel();
            this.A02 = null;
        }
        if (this.A01 != null) {
            this.A01.cancel();
            this.A01 = null;
        }
        if (this.A00 != null) {
            this.A00.cancel();
            this.A00 = null;
        }
    }

    private final void A09() {
        this.A08.setTranslationY(0.0f);
    }

    public final void A0A() {
        int i5 = getResources().getDisplayMetrics().heightPixels;
        C1830gm c1830gm = this.A0A;
        int screenHeight = this.A07;
        String strA06 = A06(0, 1, 83);
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(c1830gm, strA06, i5 - screenHeight);
        objectAnimatorOfFloat.setDuration(300L);
        ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this.A08, strA06, -this.A07);
        objectAnimatorOfFloat2.setDuration(300L);
        ObjectAnimator objectAnimatorOfFloat3 = ObjectAnimator.ofFloat(this.A0A, strA06, i5 - this.A06);
        objectAnimatorOfFloat3.setDuration(300L);
        ObjectAnimator adDetailsViewDown = ObjectAnimator.ofFloat(this.A08, strA06, -this.A06);
        adDetailsViewDown.setDuration(300L);
        if (this.A02 != null && this.A01 != null && this.A00 != null) {
            this.A02.setInterpolator(new AccelerateDecelerateInterpolator());
            this.A02.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
            this.A01.playTogether(objectAnimatorOfFloat3, adDetailsViewDown);
            this.A00.playSequentially(this.A02, this.A01);
            this.A00.start();
        }
    }

    public final void A0B() {
        A07();
        this.A05.destroy();
        this.A0A.setVisibility(8);
        A09();
    }

    public final void A0C() {
        if (this.A02 != null) {
            this.A02.pause();
        }
        if (this.A01 != null) {
            this.A01.pause();
        }
        if (this.A00 != null) {
            this.A00.pause();
        }
    }

    public final void A0D(int i5) {
        if (i5 == 2) {
            this.A0A.setVisibility(8);
            this.A08.setTranslationY(0.0f);
            A07();
            A09();
            return;
        }
        if (i5 != 1) {
            return;
        }
        int i11 = getResources().getDisplayMetrics().heightPixels;
        this.A0A.setVisibility(0);
        C1830gm c1830gm = this.A0A;
        int screenHeight = this.A06;
        c1830gm.setTranslationY(i11 - screenHeight);
        View view = this.A08;
        if (A0F[5].length() == 3) {
            throw new RuntimeException();
        }
        A0F[6] = "IUUUFMkp7wD0AV6j7TnZYJ";
        int screenHeight2 = this.A06;
        view.setTranslationY(-screenHeight2);
    }

    public C1830gm getBrowserPeekView() {
        return this.A0A;
    }
}
