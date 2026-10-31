package com.facebook.ads.redexgen.X;

import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.76, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass76 extends J7 {
    public static String[] A08 = {"bHvO3zM", "7z8VpEP", "iw2Y0c", "LME8njBPiXs011hhslbtp", "9K0lNzbR5X2b0vS5", "Pt0EnZUFnGQLsNks8pQcEgn0FivkNzUh", "t6anbflpJj2CGicCnIMdWTRCydsD", "D9TL9YTSSd0lWzGeUvgWfvwaUF0YdAOx"};
    public float A00;
    public int A01;
    public int A02;
    public AnonymousClass77 A03;
    public int[] A04;
    public final C0958Hi A05;
    public final C2368pg A06;
    public final C2349pN A07;

    public AnonymousClass76(C0958Hi c0958Hi, C2349pN c2349pN, C2368pg c2368pg) {
        super(c0958Hi);
        this.A02 = 0;
        this.A00 = 50.0f;
        this.A05 = c0958Hi;
        this.A07 = c2349pN;
        this.A06 = c2368pg;
        this.A01 = -1;
        this.A03 = new AnonymousClass77(this, this.A05);
    }

    @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2B(int i5) {
        A3G(i5, this.A02);
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00fb  */
    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A2a(C1968j4 c1968j4, C1975jB c1975jB, int i5, int widthMode) {
        int[] iArrA02;
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(widthMode);
        if ((mode == 1073741824 && A3B() == 1) || (mode2 == 1073741824 && A3B() == 0)) {
            super.A2a(c1968j4, c1975jB, i5, widthMode);
            return;
        }
        int size = View.MeasureSpec.getSize(i5);
        int size2 = View.MeasureSpec.getSize(widthMode);
        if (this.A06.A01(this.A01)) {
            iArrA02 = this.A06.A02(this.A01);
        } else {
            iArrA02 = new int[]{0, 0};
            if (c1975jB.A03() >= 1) {
                int iA1T = A1T() > 0 ? 1 : A1T();
                for (int i11 = 0; i11 < iA1T; i11++) {
                    View viewA1z = A1z(i11);
                    if (A08[5].length() != 32) {
                        throw new RuntimeException();
                    }
                    A08[4] = "FajaHWp";
                    if (viewA1z == null) {
                        break;
                    }
                    this.A04 = this.A07.A00(viewA1z, View.MeasureSpec.makeMeasureSpec(0, 0), View.MeasureSpec.makeMeasureSpec(0, 0));
                    if (A3B() == 0) {
                        iArrA02[0] = iArrA02[0] + this.A04[0];
                        if (i11 == 0) {
                            int i12 = this.A04[1];
                            int iA1d = A1d();
                            if (A08[6].length() != 1) {
                                A08[6] = "o1L5u";
                                iArrA02[1] = i12 + iA1d + A1a();
                            } else {
                                throw new RuntimeException();
                            }
                        } else {
                            continue;
                        }
                    } else {
                        int i13 = iArrA02[1];
                        int[] iArr = this.A04;
                        if (A08[6].length() != 1) {
                            A08[5] = "6nCDHSOFLCCkeDdRDThHGlolS6KLs45E";
                            iArrA02[1] = i13 + iArr[1];
                            if (i11 == 0) {
                                iArrA02[0] = this.A04[0] + A1b() + A1c();
                            }
                        } else {
                            A08[3] = "KFvpvLkhCjqU9hzA1pvFB";
                            iArrA02[1] = i13 + iArr[1];
                            if (i11 == 0) {
                            }
                        }
                    }
                }
                if (this.A01 != -1) {
                    this.A06.A00(this.A01, iArrA02);
                }
            }
        }
        if (mode == 1073741824) {
            iArrA02[0] = size;
        }
        if (mode2 == 1073741824) {
            iArrA02[1] = size2;
        }
        A2E(iArrA02[0], iArrA02[1]);
    }

    @Override // com.facebook.ads.redexgen.X.J7, com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2o(C7O c7o, C1975jB c1975jB, int i5) {
        this.A03.A0H(i5);
        A2c(this.A03);
    }

    public final void A3L(double d5) {
        if (d5 <= 0.0d) {
            d5 = 1.0d;
        }
        this.A00 = (float) (50.0d / d5);
        this.A03 = new AnonymousClass77(this, this.A05);
    }

    public final void A3M(int i5) {
        this.A01 = i5;
    }

    public final void A3N(int i5) {
        this.A02 = i5;
    }
}
