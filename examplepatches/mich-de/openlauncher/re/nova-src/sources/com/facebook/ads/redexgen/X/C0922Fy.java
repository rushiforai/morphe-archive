package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.view.DisplayCutout;
import android.view.View;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Fy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0922Fy extends AbstractC2452r2 {
    public static byte[] A08;
    public static String[] A09 = {"uIXLqHhvGmjoGPJG9cBAQ", "V", "8fRs1qjLH6XqoJn", "ci1q4QA001tVQ4Bl77EpjAjT", "gnmz4UsmoKc1Cn9NoCgGi2hw8zGBmAqZ", "bulj7p0JKKQ3", "H4XX9R6gSHKjlrWA9juc7", "pLP29u1F8mwA8paWdS0YJJRl9a"};
    public static final int A0A;
    public static final int A0B;
    public static final int A0C;
    public static final Integer A0D;
    public static final Integer A0E;
    public int A00;
    public InterfaceC2456r6 A01;
    public float A02;
    public InterfaceC2451r1 A03;
    public boolean A04;
    public final C0958Hi A05;
    public final C2455r5 A06;
    public final EnumC2457r7 A07;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        byte[] bArr = {-45, -4, -1, 3, -11, -80, -47, -12};
        String[] strArr = A09;
        if (strArr[1].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A09;
        strArr2[3] = "sqYCvA8pn8g2TbloiqTXisT5";
        strArr2[2] = "WEhCQwebYdqhiJb";
        A08 = bArr;
    }

    static {
        A07();
        A0A = AbstractC2383pv.A0D;
        A0C = AbstractC2383pv.A0J;
        A0B = (int) (A0C / 2.0d);
        A0D = 855638016;
        A0E = null;
    }

    public C0922Fy(C0958Hi c0958Hi, EnumC2457r7 enumC2457r7, LA la2, int i5, InterfaceC2456r6 interfaceC2456r6) {
        super(c0958Hi);
        this.A00 = 0;
        this.A04 = true;
        this.A05 = c0958Hi;
        this.A07 = enumC2457r7;
        this.A01 = interfaceC2456r6;
        A04();
        this.A06 = new C2455r5(this.A05, la2, this.A07, i5);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 48;
        this.A06.setContentDescription(A03(0, 8, 68));
        this.A06.setOnClickListener(new ViewOnClickListenerC2454r4(this));
        addView(this.A06, layoutParams);
        A06();
    }

    private void A04() {
        View view = new View(this.A05);
        view.setLayoutParams(new LinearLayout.LayoutParams(0, 0, 1.0f));
        addView(view);
    }

    private void A05() {
        Rect requestedMargins = getRequestedMargins();
        if (this.A01 != null && requestedMargins != null) {
            this.A01.AFc(getToolbarHeight());
        }
    }

    private void A06() {
        if (Build.VERSION.SDK_INT >= 28) {
            setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() { // from class: com.facebook.ads.redexgen.X.r3
                @Override // android.view.View.OnApplyWindowInsetsListener
                public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
                    return this.A00.A0F(view, windowInsets);
                }
            });
        }
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

    public final /* synthetic */ WindowInsets A0F(View view, WindowInsets windowInsets) {
        int cutoutInsetTop;
        DisplayCutout cutout = windowInsets.getDisplayCutout();
        if (cutout != null && (cutoutInsetTop = cutout.getSafeInsetTop()) != this.A00) {
            this.A00 = cutoutInsetTop;
            A05();
        }
        return windowInsets;
    }

    public final void A0G() {
        if (this.A03 != null && this.A04) {
            this.A03.ADh(this);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public Rect getRequestedMargins() {
        if (getResources().getConfiguration().orientation == 1) {
            int i5 = AbstractC2383pv.A0x;
            int i11 = AbstractC2383pv.A0f;
            int orientation = this.A00;
            return new Rect(i5, i11 + orientation, 0, 0);
        }
        return new Rect(AbstractC2383pv.A0x, AbstractC2383pv.A0y, 0, 0);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarActionMode() {
        return this.A06.A09();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public int getToolbarHeight() {
        if (this.A07 == EnumC2457r7.A07) {
            if (getResources().getConfiguration().orientation == 1) {
                int i5 = this.A00;
                int orientation = A0C;
                int i11 = i5 + orientation;
                int orientation2 = AbstractC2383pv.A0f;
                return i11 + (orientation2 * 2);
            }
            int i12 = A0C;
            int orientation3 = AbstractC2383pv.A0y;
            int i13 = i12 + (orientation3 * 2);
            if (A09[4].charAt(1) == 'I') {
                throw new RuntimeException();
            }
            A09[5] = "CxDDHTLRgfwS";
            return i13;
        }
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public InterfaceC2451r1 getToolbarListener() {
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        A05();
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        A05();
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

    private void setClickable(float f11) {
        this.A04 = f11 <= 0.0f || C2203mv.A18(this.A05);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setFullscreen(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetails(C1756fZ c1756fZ, String str, int i5, C1765fi c1765fi) {
        this.A02 = i5 * 1000;
        setClickable(this.A02);
        this.A06.A0A(this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setPageDetailsVisible(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setProgress(float f11) {
        float f12 = (f11 / 100.0f) * this.A02;
        float remainingMs = 0.0f;
        if (this.A02 - f12 > 0.0f) {
            float remainingMs2 = this.A02;
            remainingMs = remainingMs2 - f12;
        }
        this.A06.A0B(remainingMs);
        setClickable(remainingMs);
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
        this.A06.A0C(i5);
        if (i5 == 0) {
            setProgress(100.0f);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC2452r2
    public void setToolbarListener(InterfaceC2451r1 interfaceC2451r1) {
        this.A03 = interfaceC2451r1;
    }
}
