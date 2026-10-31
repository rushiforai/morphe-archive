package com.facebook.ads.redexgen.X;

import android.animation.ValueAnimator;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.Af, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0774Af implements InterfaceC1636db {
    public static String[] A06 = {"Zp1jBMTXyTngXAjRlLP1q6RZbaUI", "nHljDkT3i8Wirocu51jroGsoJHOhv1cR", "sP6X6aS", "KZL6M4", "KoOjzqZIxieUbLbPf8D", "B1jmqrSafv9jI6Lw73IRSYcL6IlnF6YH", "FLN3m70EKIfdw8", "ppmNyXlbfQKy53gkSU0tUatt7Y3PBdXb"};
    public ValueAnimator A00;
    public EnumC1637dc A01 = EnumC1637dc.A05;
    public final int A02;
    public final int A03;
    public final int A04;
    public final View A05;

    public C0774Af(View view, int i5, int i11, int i12) {
        this.A05 = view;
        this.A02 = i5;
        this.A04 = i11;
        this.A03 = i12;
    }

    private ValueAnimator A00(View view, int i5, int i11) {
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(i5, i11);
        valueAnimatorOfInt.setDuration(this.A02);
        valueAnimatorOfInt.addUpdateListener(new C1582cj(this, view));
        return valueAnimatorOfInt;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04() {
        if (this.A00 != null) {
            ValueAnimator valueAnimator = this.A00;
            if (A06[1].charAt(28) != 'v') {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[7] = "75AaLozsvbqC7RPKNa9MBDOQqsQ1eQ5U";
            strArr[5] = "oWQ9IgFva7oIaP1s8z2NxAvwjcynmKEe";
            valueAnimator.removeAllListeners();
            this.A00 = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08(boolean z11) {
        if (z11) {
            this.A01 = EnumC1637dc.A06;
            this.A00 = A00(this.A05, this.A03, this.A04);
            this.A00.addListener(new C1596cx(this));
            this.A00.start();
            return;
        }
        this.A05.setTranslationY(this.A04);
        AbstractC2426qc.A0I(this.A05);
        this.A01 = EnumC1637dc.A05;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A09(boolean z11) {
        AbstractC2426qc.A0M(this.A05);
        if (z11) {
            this.A01 = EnumC1637dc.A04;
            this.A00 = A00(this.A05, this.A04, this.A03);
            this.A00.addListener(new C1600d1(this));
            this.A00.start();
            return;
        }
        View view = this.A05;
        if (A06[1].charAt(28) != 'v') {
            throw new RuntimeException();
        }
        A06[4] = "CRQ3If4kF9c";
        view.setTranslationY(this.A03);
        this.A01 = EnumC1637dc.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void A4b(boolean z11, boolean z12) {
        if (z12) {
            A08(z11);
        } else {
            A09(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final EnumC1637dc A9o() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void cancel() {
        if (this.A00 != null) {
            this.A00.cancel();
        }
    }
}
