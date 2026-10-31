package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.Arrays;

/* JADX WARN: Unexpected interfaces in signature: [com.facebook.ads.internal.util.common.Stateful<android.os.Bundle>] */
/* loaded from: assets/audience_network/classes.dex */
public final class JX {
    public static byte[] A06;
    public static String[] A07 = {"SAMNpPFpITUhS5O2wArhouwTSBZGJm", "j9883o", "ez1Iu7S0g9Y3okmD0rAeLGMZx9C5J", "cx0ufmmqihH41YoN2BIvmgQC03N5OWKz", "xpotzx92kYS", "WaPg1x3uwEHiu", "28liF7Ug1fq7LT93Jkda", "DJaApxMs4P8Fw5vQM3hjBZIJlCayXT4o"};
    public boolean A00;
    public boolean A01;
    public boolean A02;
    public final AbstractC1816gX A03;
    public final C1818gZ A04;
    public final C1818gZ A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 7);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A06 = new byte[]{43, 39, 37, 56, 36, 45, 60, 45, 84, 95, 85, 84, 85, 21, 4, 22, 22, 0, 1, 100, 117, 99, 100, 67, 100, 113, 100, 99, 111, 112, 124, 110, 120, 123, 117, 124, 74, 109, 120, 109, 106};
    }

    static {
        A04();
    }

    public JX(AbstractC1816gX abstractC1816gX) {
        this.A01 = false;
        this.A02 = false;
        this.A00 = false;
        this.A03 = abstractC1816gX;
        this.A04 = new C1818gZ(abstractC1816gX.A01);
        this.A05 = new C1818gZ(abstractC1816gX.A01);
    }

    public JX(AbstractC1816gX abstractC1816gX, Bundle bundle) {
        this.A01 = false;
        this.A02 = false;
        this.A00 = false;
        this.A03 = abstractC1816gX;
        this.A04 = (C1818gZ) AbstractC2403qF.A00(bundle.getByteArray(A00(19, 9, 23)));
        this.A05 = (C1818gZ) AbstractC2403qF.A00(bundle.getByteArray(A00(28, 13, 30)));
        this.A01 = bundle.getBoolean(A00(8, 5, 54));
        this.A02 = bundle.getBoolean(A00(13, 6, 98));
        this.A00 = bundle.getBoolean(A00(0, 8, 79));
    }

    private void A01() {
        this.A00 = true;
        A02();
    }

    private void A02() {
        this.A01 = true;
        this.A03.A00(this.A00, this.A02, this.A02 ? this.A05 : this.A04);
    }

    private void A03() {
        this.A02 = true;
        A01();
    }

    public final Bundle A05() {
        Bundle bundle = new Bundle();
        bundle.putByteArray(A00(28, 13, 30), AbstractC2403qF.A01(this.A05));
        bundle.putByteArray(A00(19, 9, 23), AbstractC2403qF.A01(this.A04));
        bundle.putBoolean(A00(8, 5, 54), this.A01);
        bundle.putBoolean(A00(13, 6, 98), this.A02);
        bundle.putBoolean(A00(0, 8, 79), this.A00);
        return bundle;
    }

    public final void A06() {
        if (!this.A01) {
            this.A05.A03();
        }
    }

    public final void A07(double d5, double d11) {
        double dA02;
        if (this.A01) {
            return;
        }
        C1818gZ c1818gZ = this.A04;
        if (A07[5].length() != 13) {
            throw new RuntimeException();
        }
        A07[4] = "MN6YiANN1x8";
        c1818gZ.A04(d5, d11);
        this.A05.A04(d5, d11);
        if (this.A03.A03) {
            dA02 = this.A05.A00().A04();
        } else {
            dA02 = this.A05.A00().A02();
        }
        if (this.A03.A00 >= 0.0d && this.A04.A00().A05() > this.A03.A00 && dA02 == 0.0d) {
            A01();
        } else if (dA02 >= this.A03.A02) {
            A03();
        }
    }
}
