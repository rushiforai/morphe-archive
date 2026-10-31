package com.facebook.ads.redexgen.X;

import android.widget.LinearLayout;

/* renamed from: com.facebook.ads.redexgen.X.uR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2663uR extends LinearLayout {
    public static final int A06 = (int) (AbstractC2385px.A02 * 4.0f);
    public int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final C0958Hi A04;
    public final C2664uS[] A05;

    public C2663uR(C0958Hi c0958Hi, int i5, int i11, int i12, int i13) {
        super(c0958Hi);
        this.A00 = A06;
        this.A04 = c0958Hi;
        setOrientation(0);
        this.A03 = i5;
        this.A01 = i12;
        this.A02 = i13;
        this.A05 = new C2664uS[i11];
        for (int i14 = 0; i14 < i11; i14++) {
            this.A05[i14] = A00();
            addView(this.A05[i14]);
        }
        A01();
    }

    private C2664uS A00() {
        C2664uS c2664uS = new C2664uS(this.A04, this.A01, this.A02);
        LinearLayout.LayoutParams starRatingViewParams = new LinearLayout.LayoutParams(this.A03, this.A03);
        starRatingViewParams.gravity = 16;
        c2664uS.setLayoutParams(starRatingViewParams);
        return c2664uS;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A01() {
        int i5 = 0;
        while (i5 < i) {
            LinearLayout.LayoutParams layoutParams = (LinearLayout.LayoutParams) this.A05[i5].getLayoutParams();
            int i11 = i5 == 0 ? 0 : this.A00;
            layoutParams.leftMargin = i11;
            i5++;
        }
        requestLayout();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A02(float f11) {
        for (int i5 = 0; i5 < i; i5++) {
            float fillRatio = Math.min(1.0f, f11 - i5);
            if (fillRatio < 0.0f) {
                fillRatio = 0.0f;
            }
            this.A05[i5].setFillRatio(fillRatio);
        }
    }

    public void setItemSpacing(int i5) {
        this.A00 = i5;
        A01();
    }

    public void setRating(float f11) {
        A02(f11);
    }
}
