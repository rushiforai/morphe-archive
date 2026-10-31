package com.facebook.ads.redexgen.X;

import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import java.util.Arrays;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.3q, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractViewOnTouchListenerC06203q extends C7O implements View.OnTouchListener {
    public static byte[] A07;
    public static String[] A08 = {"y4Urxqcv9RCHCbRsxOihNkmZ9cqKDFdZ", "LGqXjwU2H5uaBf0UptGCT7ZDInUwl5IV", "fkBbKznr2zH2OwfKJXQ1DdYWN1N", "HFNULQ3MobNCNeOVkX9dtbi8574Dr14V", "KPqvTm6ScHx6bbBibk9kuRT9nwj9YcDc", "WIY3Unb14PjE3ayNyWd6XWPIVw0Az9uS", "ZZL8YXP6wYj9", "tbuIO4j0iRDkkCNXzrivmX4Au5offJfR"};
    public int A00;

    @Nullable
    public J7 A01;
    public InterfaceC2334p5 A02;
    public boolean A03;
    public boolean A04;
    public int A05;
    public final int A06;

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 62);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A07 = new byte[]{-53, -26, -39, -24, -54, -35, -37, -15, -37, -28, -35, -22, -50, -31, -35, -17, -104, -25, -26, -28, -15, -104, -21, -19, -24, -24, -25, -22, -20, -21, -104, -60, -31, -26, -35, -39, -22, -60, -39, -15, -25, -19, -20, -59, -39, -26, -39, -33, -35, -22};
    }

    static {
        A0A();
    }

    public AbstractViewOnTouchListenerC06203q(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A05 = 0;
        this.A00 = 0;
        this.A03 = true;
        this.A04 = false;
        this.A06 = A05();
        setOnTouchListener(this);
    }

    public AbstractViewOnTouchListenerC06203q(C0958Hi c0958Hi, AttributeSet attributeSet) {
        super(c0958Hi, attributeSet);
        this.A05 = 0;
        this.A00 = 0;
        this.A03 = true;
        this.A04 = false;
        this.A06 = A05();
        setOnTouchListener(this);
    }

    public AbstractViewOnTouchListenerC06203q(C0958Hi c0958Hi, AttributeSet attributeSet, int i5) {
        super(c0958Hi, attributeSet, i5);
        this.A05 = 0;
        this.A00 = 0;
        this.A03 = true;
        this.A04 = false;
        this.A06 = A05();
        setOnTouchListener(this);
    }

    private int A05() {
        return ((int) getContext().getResources().getDisplayMetrics().density) * 10;
    }

    private int A06(int i5) {
        int i11 = this.A00 - i5;
        int delta = this.A02.A9R(i11);
        int scrollX = this.A06;
        if (i11 > scrollX) {
            int scrollX2 = this.A05;
            return A08(scrollX2, delta);
        }
        int scrollX3 = this.A06;
        if (i11 < (-scrollX3)) {
            int scrollX4 = this.A05;
            return A07(scrollX4, delta);
        }
        int scrollX5 = this.A05;
        return scrollX5;
    }

    private int A07(int i5, int i11) {
        return Math.max(i5 - i11, 0);
    }

    private int A08(int i5, int i11) {
        return Math.min(i5 + i11, getItemCount() - 1);
    }

    public void A27(int i5, boolean z11) {
        if (getAdapter() == null) {
            return;
        }
        this.A05 = i5;
        if (z11) {
            A1a(i5);
        } else {
            A1Z(i5);
        }
    }

    public int getCurrentPosition() {
        return this.A05;
    }

    private int getItemCount() {
        if (getAdapter() == null) {
            return 0;
        }
        return getAdapter().A0B();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        int rawX = (int) motionEvent.getRawX();
        int action = motionEvent.getActionMasked();
        if (action == 1 || action == 6 || action == 3 || action == 4) {
            if (this.A04) {
                int rawX2 = A06(rawX);
                A27(rawX2, true);
            }
            this.A03 = true;
            this.A04 = false;
            return true;
        }
        if (action == 0 || action == 5 || (this.A03 && action == 2)) {
            this.A00 = rawX;
            String[] strArr = A08;
            String str = strArr[5];
            String str2 = strArr[4];
            int action2 = str.charAt(14);
            int rawX3 = str2.charAt(14);
            if (action2 == rawX3) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[5] = "MxKeEan5PHYt2nmJnSz3xsZ38eI3mGgL";
            strArr2[4] = "utg9fSYK4sdWKYxBX5KGIJ2pCeKuK2tx";
            if (this.A03) {
                this.A03 = false;
            }
            this.A04 = true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.C7O
    public void setLayoutManager(AbstractC1960iw abstractC1960iw) {
        if (abstractC1960iw instanceof J7) {
            super.setLayoutManager(abstractC1960iw);
            this.A01 = (J7) abstractC1960iw;
            return;
        }
        throw new IllegalArgumentException(A09(0, 50, 58));
    }

    public void setSnapDelegate(InterfaceC2334p5 interfaceC2334p5) {
        this.A02 = interfaceC2334p5;
    }
}
