package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.sw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2570sw extends LinearLayout {
    public static byte[] A05;
    public static String[] A06 = {"FW", "Q2YDePwD", "xfbhShHGMHhMT6uuDw", "jNDuW72itdlyTzjBk2QaOnS1PHN0SPjx", "eyrOuV0HzLmUIeHzn9PPT0SvWZCkSI3X", "UzcBNM02cc9yxwaMb2hj9AqVtnEe5TFq", "9pRnNEpoBgc4bxbN9ec7sR6FA3J19fD3", "47V5DVjEjo3CtUBy4aYSYkHKjLZ069Qk"};
    public Bitmap A00;
    public ImageView A01;
    public final Bitmap A02;
    public final LA A03;
    public final C0958Hi A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A06[1].length() == 29) {
                throw new RuntimeException();
            }
            A06[7] = "uaum4BHEdC5zUPmZwTShChJaSUalg3UY";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            int i14 = bArrCopyOfRange[i13] - i12;
            if (A06[7].charAt(7) != 'E') {
                throw new RuntimeException();
            }
            A06[0] = "k4dfE7WGR";
            bArrCopyOfRange[i13] = (byte) (i14 - 26);
            i13++;
        }
    }

    public static void A03() {
        A05 = new byte[]{-90, -75, -88, -89, -84, -73, -94, -81, -84, -79, -88};
    }

    static {
        A03();
    }

    public C2570sw(C0958Hi c0958Hi, EnumC2569sv enumC2569sv, LA la2) {
        super(c0958Hi);
        this.A02 = AbstractC2438qo.A01(EnumC2437qn.CREDIT_LINE_DETAIL_ICON);
        this.A04 = c0958Hi;
        this.A03 = la2;
        AbstractC2568su.A04(c0958Hi, enumC2569sv);
        A02();
    }

    private void A01() {
        this.A01 = new ImageView(getContext());
        AbstractC2426qc.A0L(this.A01);
        this.A01.setScaleType(ImageView.ScaleType.FIT_CENTER);
        this.A01.setAdjustViewBounds(true);
        int i5 = AbstractC2383pv.A02;
        int width = -2;
        if (this.A00 != null && this.A03 != null && this.A03.A1S() != null) {
            int height = this.A03.A1S().A04();
            if (height > 0) {
                int height2 = this.A03.A1S().A04();
                float f11 = height2 * AbstractC2385px.A02;
                if (A06[3].charAt(4) == 80) {
                    throw new RuntimeException();
                }
                A06[0] = "zesIMha6dMBcJF3Y7";
                width = (int) f11;
                i5 = -2;
            }
        }
        LinearLayout.LayoutParams creditLineLayoutParams = new LinearLayout.LayoutParams(width, i5);
        if (this.A00 != null) {
            this.A01.setImageBitmap(this.A00);
        } else {
            this.A01.setImageBitmap(this.A02);
        }
        addView(this.A01, creditLineLayoutParams);
    }

    private void A02() {
        setOrientation(0);
        setPadding(AbstractC2383pv.A0U, AbstractC2383pv.A0K, AbstractC2383pv.A0U, AbstractC2383pv.A0K);
        setClipToPadding(false);
        setGravity(17);
        AbstractC2426qc.A0O(this, 452984831);
        AbstractC2426qc.A0F(AbstractC2383pv.A0D, this);
        getDownloadedBitmap();
        A01();
    }

    public final void A04() {
        getDownloadedBitmap();
        if (this.A01 == null || this.A00 == null) {
            return;
        }
        LA la2 = this.A03;
        if (A06[0].length() != 8) {
            A06[7] = "pO7hpk8EIoKKbFgDFQyxUrLAO9gdDFC1";
            if (la2 == null) {
                return;
            }
            LA la3 = this.A03;
            if (A06[3].charAt(4) != 'P') {
                A06[4] = "bxlPWIizbtsJb24TU9OfYBkOV7GizHXP";
                if (la3.A1S() != null && this.A03.A1S().A04() > 0) {
                    LinearLayout.LayoutParams creditLineLayoutParams = new LinearLayout.LayoutParams((int) (this.A03.A1S().A04() * AbstractC2385px.A02), -2);
                    this.A01.setLayoutParams(creditLineLayoutParams);
                    this.A01.setImageBitmap(null);
                    this.A01.setImageBitmap(this.A00);
                    return;
                }
                return;
            }
        }
        throw new RuntimeException();
    }

    private void getDownloadedBitmap() {
        if (this.A03 != null) {
            LA la2 = this.A03;
            if (A06[6].charAt(7) == 'F') {
                throw new RuntimeException();
            }
            A06[5] = "mrmGHfZid9QyQb4Vru5FWC0VVTqxdFPj";
            if (la2.A1S() != null && this.A03.A1S().A05() != null) {
                int iA04 = this.A03.A1S().A04();
                if (A06[0].length() != 8) {
                    A06[5] = "T9CRev3OGW3Mqy1gEoyheDV2VI3qCgxp";
                    if (iA04 <= 0) {
                        return;
                    }
                } else if (iA04 <= 0) {
                    return;
                }
                if (this.A03.A1S().A03() > 0) {
                    try {
                        this.A00 = new C2086kz(this.A04).A0O(this.A03.A1S().A05(), (int) (this.A03.A1S().A03() * AbstractC2385px.A02), (int) (this.A03.A1S().A04() * AbstractC2385px.A02));
                    } catch (Exception e3) {
                        this.A04.A08().ABz(A00(0, 11, 41), 3900, new C2127lg(e3));
                    }
                }
            }
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        AbstractC2426qc.A0O(this, i5);
    }
}
