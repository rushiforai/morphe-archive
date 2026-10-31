package com.facebook.ads.redexgen.X;

import android.view.View;
import android.widget.LinearLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Fl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0910Fl extends AbstractC2452r2 {
    public static byte[] A03;
    public C0958Hi A00;
    public InterfaceC2451r1 A01;
    public final C2507rv A02;

    static {
        A05();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 5);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A03 = new byte[]{-91, -50, -47, -43, -57, -126, -93, -58};
    }

    public C0910Fl(C0958Hi c0958Hi, LA la2, int i5) {
        super(c0958Hi);
        this.A00 = c0958Hi;
        setGravity(16);
        A04();
        this.A02 = new C2507rv(this.A00, la2, i5);
        A03();
    }

    private void A03() {
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        this.A02.setContentDescription(A02(0, 8, 93));
        this.A02.setActionClickListener(new ViewOnClickListenerC2470rK(this));
        addView(this.A02, layoutParams);
    }

    private void A04() {
        View view = new View(this.A00);
        view.setLayoutParams(new LinearLayout.LayoutParams(0, 0, 1.0f));
        addView(view);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A09() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0A() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0B() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0C(float f11, int i5) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final void A0D(C1744fN c1744fN, boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public final boolean A0E() {
        return false;
    }

    public final void A0F() {
        this.A02.A08();
    }

    public final void A0G() {
        this.A02.A09();
    }

    public final void A0H(int i5, int i11) {
        this.A02.A0A(i5, i11);
    }

    public final void A0I(LA la2) {
        this.A02.A0B(la2);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarActionMode() {
        return this.A02.getToolbarActionMode();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarHeight() {
        return AbstractC2452r2.A01;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public InterfaceC2451r1 getToolbarListener() {
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setAdReportingVisible(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setCTAClickListener(View.OnClickListener onClickListener) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setCTAClickListener(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setFullscreen(boolean z11) {
    }

    public void setInitialUnskippableSeconds(int i5) {
        this.A02.setInitialUnskippableSeconds(i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetails(C1756fZ c1756fZ, String str, int i5, C1765fi c1765fi) {
        this.A02.setInitialUnskippableSeconds(i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetailsVisible(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgress(float f11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressClickListener(View.OnClickListener onClickListener) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressImage(EnumC2437qn enumC2437qn) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressImmediate(float f11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgressSpinnerInvisible(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarActionMessage(String str) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarActionMode(int i5) {
        this.A02.setToolbarActionMode(i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarListener(InterfaceC2451r1 interfaceC2451r1) {
        this.A01 = interfaceC2451r1;
    }
}
