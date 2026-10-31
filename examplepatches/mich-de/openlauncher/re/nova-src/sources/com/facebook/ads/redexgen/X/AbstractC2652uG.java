package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.widget.Button;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.uG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2652uG extends Button {
    public static byte[] A0A;
    public static final int A0B;
    public static final int A0C;
    public int A00;
    public int A01;
    public int A02;
    public C1744fN A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final int A07;
    public final Runnable A08;
    public final Runnable A09;

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 64);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0C() {
        A0A = new byte[]{120, 113, 94, 6};
    }

    static {
        A0C();
        A0B = (int) (AbstractC2385px.A02 * 16.0f);
        A0C = (int) (AbstractC2385px.A02 * 4.0f);
    }

    public AbstractC2652uG(C0958Hi c0958Hi, C1744fN c1744fN) {
        super(c0958Hi);
        this.A04 = false;
        this.A02 = 0;
        this.A00 = 0;
        this.A01 = A0C;
        this.A05 = true;
        this.A06 = false;
        this.A08 = new C0883Ek(this);
        this.A09 = new C0882Ej(this);
        this.A03 = c1744fN;
        this.A07 = C2203mv.A03(c0958Hi);
        AbstractC2426qc.A0b(this, false, 16);
        setGravity(17);
        if (C2203mv.A2J(c0958Hi)) {
            setAllCaps(false);
        }
        A0A();
    }

    private void A0A() {
        if (this.A03 != null) {
            this.A00 = this.A03.A09(this.A06);
            this.A02 = this.A03.A0A(this.A06);
        }
        AbstractC2426qc.A0R(this, this.A00, this.A05 ? this.A01 : 0);
        setTextColor(this.A02);
    }

    private void A0B() {
        if (this.A07 < 0 || this.A04) {
            return;
        }
        this.A04 = true;
        if (C2203mv.A2m(getContext())) {
            postDelayed(this.A08, this.A07);
        }
    }

    public void A0D() {
        String string = getText().toString();
        if (TextUtils.isEmpty(string)) {
            return;
        }
        String text = A09(1, 3, 109);
        String[] strArrSplit = string.split(text);
        for (int i5 = 0; i5 < strArrSplit.length; i5++) {
            StringBuilder sb2 = new StringBuilder();
            String text2 = strArrSplit[i5].substring(0, 1).toUpperCase(Locale.getDefault());
            StringBuilder sbAppend = sb2.append(text2);
            String text3 = strArrSplit[i5];
            strArrSplit[i5] = sbAppend.append(text3.substring(1).toLowerCase(Locale.getDefault())).toString();
        }
        String text4 = A09(0, 1, 24);
        super.setText((CharSequence) AbstractC2645u9.A01(text4, strArrSplit));
    }

    public C1744fN getColorInfo() {
        return this.A03;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        A0B();
    }

    public void setCornerRadiusPx(int i5) {
        this.A01 = i5;
    }

    public void setRoundedCornersEnabled(boolean z11) {
        this.A05 = z11;
        A0A();
    }

    public void setText(String str) {
        super.setText((CharSequence) str.toUpperCase(Locale.US));
    }

    public void setUpButtonColors(C1744fN c1744fN) {
        this.A03 = c1744fN;
        A0A();
    }

    public void setViewShowsOverMedia(boolean z11) {
        this.A06 = z11;
        A0A();
    }
}
