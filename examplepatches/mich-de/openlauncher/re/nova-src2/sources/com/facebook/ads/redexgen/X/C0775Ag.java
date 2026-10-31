package com.facebook.ads.redexgen.X;

import android.animation.ArgbEvaluator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.view.View;
import android.widget.TextView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Ag, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0775Ag implements InterfaceC1636db {
    public static byte[] A06;
    public static String[] A07 = {"A7BI5", "gKWOMBrJHuMwvM90e1kQxbLVjOWHbC33", "UYN9ptwwhG6kseDSIUjMW4tKOOJXD2Z7", "Ja75eMPfNEu2gmMNMrA6", "IMMQ3U1D8CAOequczoeO", "aOtgKGua3vuGYyvCOzm8c8DJStBVo0w", "j", "V23k2coZlnHKKs"};
    public ValueAnimator A00;
    public EnumC1637dc A01 = EnumC1637dc.A05;
    public final int A02;
    public final int A03;
    public final int A04;
    public final View A05;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A06 = new byte[]{40, 25, 44, 40, -9, 35, 32, 35, 38};
    }

    static {
        A05();
    }

    public C0775Ag(View view, int i5, int i11, int i12) {
        this.A02 = i5;
        this.A05 = view;
        this.A04 = i11;
        this.A03 = i12;
    }

    private void A06(int i5, int i11) {
        this.A01 = i5 == this.A04 ? EnumC1637dc.A04 : EnumC1637dc.A06;
        this.A00 = ObjectAnimator.ofInt((TextView) this.A05, A04(0, 9, 82), i5, i11);
        this.A00.setEvaluator(new ArgbEvaluator());
        this.A00.setDuration(this.A02);
        this.A00.addListener(new C1605d6(this, i5, i11));
        this.A00.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(int i5, int i11, boolean z11) {
        if (z11) {
            A06(i5, i11);
            return;
        }
        View view = this.A05;
        if (A07[4].length() != 20) {
            throw new RuntimeException();
        }
        String[] strArr = A07;
        strArr[7] = "Y4rCa4lywlEdVv";
        strArr[0] = "Hdg5N";
        ((TextView) view).setTextColor(i11);
        this.A01 = i11 == this.A03 ? EnumC1637dc.A03 : EnumC1637dc.A05;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void A4b(boolean z11, boolean z12) {
        int endColor = z12 ? this.A03 : this.A04;
        int startColor = z12 ? this.A04 : this.A03;
        A07(endColor, startColor, z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final EnumC1637dc A9o() {
        return this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1636db
    public final void cancel() {
        if (this.A00 != null) {
            ValueAnimator valueAnimator = this.A00;
            String[] strArr = A07;
            if (strArr[3].length() == strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[2] = "4bA6cNhsQyVGqx9OGleE21BqHw5dL3ST";
            strArr2[1] = "bAys7NO5fzoEXQ5S2GczLuZ6TdGfB58U";
            valueAnimator.cancel();
        }
    }
}
