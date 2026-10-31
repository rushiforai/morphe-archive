package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.text.TextUtils;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2667uV extends LinearLayout {
    public static byte[] A04;
    public static String[] A05 = {"lF8IVPZcS3mZAefsIaNZ6E9xMmjOqdH7", "idkW2", "HbWJiF6R60B06srsOI5ot4Pv3KsUxfPN", "7f3O1w3Qg3dv0DYXPvEPDd2nNc", "nnNATfNTHr6hSEkqMWy2MP3i9vksRg0T", "pai30RxYeYeDatKriEp6xPPXjxDmZE6E", "MhBAxeK5XElhMNsb", "N4hTYih9SgQSzhMEA04rsaAJRIerHLwS"};
    public static final float A06;
    public static final int A07;
    public static final int A08;
    public final TextView A00;
    public final TextView A01;
    public final TextView A02;
    public final boolean A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 69);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        if (A05[4].charAt(18) != 'y') {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[7] = "1IRXFHeJ8iEaedLhZkECOAxJLr3083z4";
        strArr[2] = "dqFSPFlearJtxV8PFi6iCQhpIdVpxh77";
        A04 = new byte[]{-33, -30, -30, -29, -14, -33, -25, -22, -15};
    }

    static {
        A01();
        A06 = Resources.getSystem().getDisplayMetrics().density;
        A08 = (int) (A06 * 6.0f);
        A07 = (int) (A06 * 8.0f);
    }

    public C2667uV(C0958Hi c0958Hi, C1744fN c1744fN, boolean z11, int i5, int i11, int i12) {
        super(c0958Hi);
        setOrientation(1);
        this.A02 = new TextView(c0958Hi);
        AbstractC2426qc.A0b(this.A02, true, i5);
        this.A02.setEllipsize(TextUtils.TruncateAt.END);
        this.A02.setLineSpacing(A08, 1.0f);
        this.A01 = new TextView(c0958Hi);
        this.A00 = new TextView(c0958Hi);
        AbstractC2426qc.A0b(this.A00, false, i11);
        this.A00.setEllipsize(TextUtils.TruncateAt.END);
        this.A00.setLineSpacing(A08, 1.0f);
        this.A03 = C2203mv.A16(c0958Hi);
        int i13 = this.A03 ? -2 : -1;
        addView(this.A02, new LinearLayout.LayoutParams(i13, -2));
        addView(this.A01, new LinearLayout.LayoutParams(i13, -2));
        this.A01.setVisibility(8);
        A03(c1744fN, z11);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(i13, -2);
        layoutParams.setMargins(0, i12, 0, 0);
        addView(this.A00, layoutParams);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C2667uV(C0958Hi c0958Hi, C1744fN c1744fN, boolean z11, boolean z12, boolean z13) {
        int i5 = z12 ? 18 : 22;
        int i11 = z12 ? 14 : 16;
        int i12 = A07;
        this(c0958Hi, c1744fN, z11, i5, i11, z13 ? i12 / 2 : i12);
    }

    public final void A02() {
        this.A02.setTypeface(this.A02.getTypeface(), 1);
    }

    public final void A03(C1744fN c1744fN, boolean z11) {
        this.A02.setTextColor(c1744fN.A07(z11));
        this.A01.setTextColor(c1744fN.A05(z11));
        this.A00.setTextColor(c1744fN.A06(z11));
    }

    public final void A04(String str, String str2, String str3, boolean z11, boolean z12) {
        boolean z13 = !TextUtils.isEmpty(str);
        boolean z14 = !TextUtils.isEmpty(str2);
        TextView textView = this.A02;
        if (!z13) {
            str = str2;
        }
        textView.setText(str);
        if (str3 != null) {
            this.A01.setText(str3);
        }
        TextView textView2 = this.A00;
        if (!z13) {
            str2 = A00(0, 0, 28);
        }
        textView2.setText(str2);
        if (A05[4].charAt(18) != 'y') {
            throw new RuntimeException();
        }
        A05[4] = "cGsHRNQKRzUTXMDBZCyzngEN4Bg1pclE";
        int i5 = 3;
        if (!z13 || !z14) {
            TextView textView3 = this.A02;
            if (z11) {
                i5 = 2;
            } else if (z12) {
                i5 = 4;
            }
            textView3.setMaxLines(i5);
            return;
        }
        this.A02.setMaxLines(z11 ? 1 : 2);
        this.A00.setMaxLines(z11 ? 1 : z12 ? 3 : 2);
    }

    public TextView getDescriptionTextView() {
        return this.A00;
    }

    public TextView getTitleTextView() {
        return this.A02;
    }

    public void setAlignment(int i5) {
        if (this.A03) {
            setGravity(i5);
        }
        this.A02.setGravity(i5);
        this.A00.setGravity(i5);
    }

    public void setCTAClickListener(ViewOnClickListenerC0884El viewOnClickListenerC0884El) {
        ViewOnClickListenerC2674uc viewOnClickListenerC2674ucA03 = AbstractC2675ud.A03(viewOnClickListenerC0884El, A00(0, 9, 57));
        this.A02.setOnClickListener(viewOnClickListenerC2674ucA03);
        this.A00.setOnClickListener(viewOnClickListenerC2674ucA03);
        this.A01.setOnClickListener(viewOnClickListenerC2674ucA03);
    }

    public void setDescriptionTextSize(int i5) {
        this.A00.setTextSize(i5);
    }

    public void setDescriptionVisibility(int i5) {
        this.A00.setVisibility(i5);
    }

    public void setTitleTextSize(int i5) {
        this.A02.setTextSize(i5);
    }
}
