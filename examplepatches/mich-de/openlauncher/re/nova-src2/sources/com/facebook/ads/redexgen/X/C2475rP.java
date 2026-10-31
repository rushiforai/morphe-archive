package com.facebook.ads.redexgen.X;

import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.rP, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2475rP extends RelativeLayout {
    public static byte[] A03;
    public static final int A04;
    public static final int A05;
    public final ImageView A00;
    public final ImageView A01;
    public final C0958Hi A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 125);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{1, 20, 31, 30, 33, 35, -49, -16, 19};
    }

    static {
        A02();
        A05 = (int) (AbstractC2385px.A02 * 4.0f);
        A04 = (int) (AbstractC2385px.A02 * 6.0f);
    }

    public C2475rP(C0958Hi c0958Hi) {
        super(c0958Hi);
        this.A02 = c0958Hi;
        AbstractC2426qc.A0W(this, AbstractC2426qc.A06(855638016, A04));
        this.A01 = A00(EnumC2437qn.DEFAULT_INFO_ICON);
        this.A00 = A00(EnumC2437qn.AD_CHOICES_ICON);
        this.A00.setContentDescription(A01(0, 9, 50));
        LinearLayout linearLayout = new LinearLayout(c0958Hi);
        linearLayout.setOrientation(0);
        linearLayout.addView(this.A01);
        linearLayout.addView(this.A00);
        addView(linearLayout, new RelativeLayout.LayoutParams(-1, -1));
        setClickable(true);
        setFocusable(true);
    }

    private ImageView A00(EnumC2437qn enumC2437qn) {
        ImageView imageView = new ImageView(this.A02);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setPadding(0, A05, 0, A05);
        imageView.setImageBitmap(AbstractC2438qo.A01(enumC2437qn));
        imageView.setColorFilter(-1);
        LinearLayout.LayoutParams iconLayoutParams = new LinearLayout.LayoutParams(0, -1);
        iconLayoutParams.weight = 1.0f;
        imageView.setLayoutParams(iconLayoutParams);
        return imageView;
    }
}
