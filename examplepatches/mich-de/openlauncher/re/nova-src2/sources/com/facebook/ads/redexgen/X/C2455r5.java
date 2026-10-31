package com.facebook.ads.redexgen.X;

import android.content.pm.PackageManager;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.r5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2455r5 extends LinearLayout {
    public static byte[] A09;
    public int A00;
    public ImageView A01;
    public final TextView A02;
    public final LA A03;
    public final C2086kz A04;
    public final C0958Hi A05;
    public final EnumC2457r7 A06;
    public final C2651uF A07;
    public final String A08;

    static {
        A06();
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 120);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A09 = new byte[]{23, 23, 23, 82, 88, 103, 103, 84, 40, 64, 50, 48, 64, 42, 16, 31, 31, 14, 30, 31, 20, 29, 14, 16, 19, 34};
    }

    public C2455r5(C0958Hi c0958Hi, LA la2, EnumC2457r7 enumC2457r7, int i5) {
        super(c0958Hi);
        this.A05 = c0958Hi;
        this.A04 = new C2086kz(this.A05);
        this.A03 = la2;
        this.A06 = enumC2457r7;
        this.A00 = i5;
        this.A08 = A05(A03());
        Drawable drawableA00 = A00();
        setOrientation(0);
        AbstractC2426qc.A0U(this, enumC2457r7.A00, new float[]{C0922Fy.A0B, C0922Fy.A0B, 0.0f, 0.0f, 0.0f, 0.0f, C0922Fy.A0B, C0922Fy.A0B});
        setPadding(AbstractC2383pv.A06, AbstractC2383pv.A0U, AbstractC2383pv.A06, AbstractC2383pv.A0U);
        LinearLayout.LayoutParams iconLayout = new LinearLayout.LayoutParams(C0922Fy.A0A, C0922Fy.A0A);
        iconLayout.gravity = 17;
        iconLayout.rightMargin = AbstractC2383pv.A0w;
        if (drawableA00 != null) {
            this.A01 = new C2661uP(c0958Hi);
            this.A01.setImageDrawable(drawableA00);
            this.A01.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            addView(this.A01, iconLayout);
        }
        LinearLayout.LayoutParams iconLayout2 = new LinearLayout.LayoutParams(-2, -2);
        iconLayout2.gravity = 17;
        this.A02 = new TextView(c0958Hi);
        this.A02.setSingleLine(true);
        this.A02.setTextColor(enumC2457r7.A01);
        this.A02.setEllipsize(TextUtils.TruncateAt.END);
        AbstractC2426qc.A0b(this.A02, true, 14);
        addView(this.A02, iconLayout2);
        this.A07 = new C2651uF(c0958Hi, 0, enumC2457r7.A01, EnumC2437qn.RIGHT_ARROW_ICON);
        LinearLayout.LayoutParams arrowLayout = new LinearLayout.LayoutParams(AbstractC2383pv.A06, AbstractC2383pv.A06);
        arrowLayout.gravity = 17;
        addView(this.A07, arrowLayout);
    }

    private Drawable A00() {
        Drawable drawableA02 = A02();
        Drawable clientIcon = A01();
        if ((!this.A03.A2s() || drawableA02 == null) && clientIcon != null) {
            return clientIcon;
        }
        return drawableA02;
    }

    private Drawable A01() {
        try {
            PackageManager packageManager = this.A05.getPackageManager();
            if (packageManager != null) {
                return this.A05.getApplicationInfo().loadIcon(packageManager);
            }
            return null;
        } catch (Exception e3) {
            this.A05.A08().ABz(A04(14, 12, 55), 3802, new C2127lg(e3));
            return null;
        }
    }

    private Drawable A02() {
        String strA1d = this.A03.A1d();
        if (!TextUtils.isEmpty(strA1d)) {
            try {
                return new BitmapDrawable(this.A05.getResources(), this.A04.A0O(strA1d, C0922Fy.A0A, C0922Fy.A0A));
            } catch (Exception ex2) {
                this.A05.A08().ABz(A04(14, 12, 55), 3801, new C2127lg(ex2));
                return null;
            }
        }
        return null;
    }

    private String A03() {
        String strA1e = this.A03.A1e();
        if (this.A03.A2t() && !TextUtils.isEmpty(strA1e)) {
            return strA1e;
        }
        try {
            PackageManager packageManager = this.A05.getPackageManager();
            if (packageManager != null) {
                String string = this.A05.getApplicationInfo().loadLabel(packageManager).toString();
                if (!TextUtils.isEmpty(string)) {
                    return string;
                }
            }
        } catch (Exception ex2) {
            this.A05.A08().ABz(A04(14, 12, 55), 3803, new C2127lg(ex2));
        }
        return strA1e;
    }

    public static String A05(String str) {
        if (str.length() > 10) {
            return str.substring(0, 10) + A04(0, 3, 113);
        }
        return str;
    }

    private void A07(float f11) {
        if (f11 > 0.0f) {
            this.A07.setVisibility(8);
        } else {
            this.A07.setVisibility(0);
        }
    }

    private void A08(float f11) {
        String text;
        String strA04 = A04(3, 5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        if (f11 > 0.0f) {
            int iCeil = (int) Math.ceil(f11 / 1000.0f);
            boolean zIsEmpty = TextUtils.isEmpty(this.A08);
            String strA042 = A04(8, 6, 85);
            if (zIsEmpty) {
                text = this.A03.A36().A08().replace(strA042, String.valueOf(iCeil));
            } else {
                text = this.A03.A36().A03().replace(strA04, this.A08).replace(strA042, String.valueOf(iCeil));
            }
        } else if (TextUtils.isEmpty(this.A08)) {
            text = this.A03.A36().A09();
        } else {
            text = this.A03.A36().A04().replace(strA04, this.A08);
        }
        this.A02.setText(text);
    }

    public final int A09() {
        return this.A00;
    }

    public final void A0A(float f11) {
        A07(f11);
        A08(f11);
    }

    public final void A0B(float f11) {
        A08(f11);
        A07(f11);
    }

    public final void A0C(int i5) {
        this.A05.A0F().AHK(i5);
        this.A00 = i5;
    }
}
