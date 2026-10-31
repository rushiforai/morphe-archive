package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.cn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1586cn {
    public static String[] A0G = {"mSp46DkNS7xEieh80guIVZ7sV0u6dUAQ", "jM0yQybpe894JheaHPvFn5cJza04zohE", b.f42142b, "bSsBFtY", "M8pMGZ09aZYxchNo783hWobFpgLIdHMK", "A0mAX90nsuNPH77wughJrz", "WI1cxDDLVLb2xGeJGvHcPzEs5ecrjg", "tGE7EVjUdUYBWvzFrFzlVRVKRQR3AbPb"};
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public ZD A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public boolean A0E;
    public boolean A0F;

    public C1586cn() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean A00(C1586cn c1586cn) {
        if (!this.A0F) {
            return false;
        }
        if (!c1586cn.A0F) {
            return true;
        }
        ZD zd2 = (ZD) AbstractC1062Ln.A02(this.A09);
        ZD spsData = c1586cn.A09;
        Object objA02 = AbstractC1062Ln.A02(spsData);
        String[] strArr = A0G;
        if (strArr[1].charAt(2) != strArr[4].charAt(2)) {
            A0G[5] = "bGJAjg0UvOScJSqMR9DvUo";
            ZD zd3 = (ZD) objA02;
            if (this.A03 == c1586cn.A03 && this.A07 == c1586cn.A07 && this.A0C == c1586cn.A0C) {
                boolean z11 = this.A0B;
                String[] strArr2 = A0G;
                if (strArr2[0].charAt(6) != strArr2[7].charAt(6)) {
                    String[] strArr3 = A0G;
                    strArr3[1] = "zGEPkm82U6lR0kw5WoQ7H3xaccmIbkhA";
                    strArr3[4] = "4JbuyaC1gPd3JLtMI6JEWMBAkIJpwsD4";
                    if ((!z11 || !c1586cn.A0B || this.A0A == c1586cn.A0A) && (this.A05 == c1586cn.A05 || (this.A05 != 0 && c1586cn.A05 != 0))) {
                        if (zd2.A07 == 0 && zd3.A07 == 0) {
                            if (this.A06 == c1586cn.A06) {
                                int i5 = this.A02;
                                int i11 = c1586cn.A02;
                                if (A0G[5].length() != 22) {
                                    String[] strArr4 = A0G;
                                    strArr4[3] = "Q766Uv7";
                                    strArr4[6] = "ztPZD3stfobM0bmO5EwadwoSm8Fg2U";
                                    if (i5 == i11) {
                                    }
                                } else {
                                    String[] strArr5 = A0G;
                                    strArr5[3] = "W4k1Osa";
                                    strArr5[6] = "QypJscKKJMpe4voXGbPnWtiIDDGnzd";
                                    if (i5 == i11) {
                                    }
                                }
                            }
                        }
                        if (zd2.A07 == 1) {
                            int i12 = zd3.A07;
                            if (A0G[2].length() == 0) {
                                String[] strArr6 = A0G;
                                strArr6[1] = "pS0mPIqdKKk4Q0GOMo4PzG9chz9ShoRz";
                                strArr6[4] = "7VVn5WGA1uuRzbrikFXMARoWT01BdWhs";
                                if (i12 != 1 || (this.A00 == c1586cn.A00 && this.A01 == c1586cn.A01)) {
                                    if (this.A0E == c1586cn.A0E && (!this.A0E || this.A04 == c1586cn.A04)) {
                                        return false;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return true;
        }
        throw new RuntimeException();
    }

    public final void A02() {
        this.A0D = false;
        this.A0F = false;
    }

    public final void A03(int i5) {
        this.A08 = i5;
        this.A0D = true;
    }

    public final void A04(ZD zd2, int i5, int i11, int i12, int i13, boolean z11, boolean z12, boolean z13, boolean z14, int i14, int i15, int i16, int i17, int i18) {
        this.A09 = zd2;
        this.A05 = i5;
        this.A08 = i11;
        this.A03 = i12;
        this.A07 = i13;
        this.A0C = z11;
        this.A0B = z12;
        this.A0A = z13;
        this.A0E = z14;
        this.A04 = i14;
        this.A06 = i15;
        this.A02 = i16;
        this.A00 = i17;
        this.A01 = i18;
        this.A0F = true;
        this.A0D = true;
    }

    public final boolean A05() {
        return this.A0D && (this.A08 == 7 || this.A08 == 2);
    }
}
