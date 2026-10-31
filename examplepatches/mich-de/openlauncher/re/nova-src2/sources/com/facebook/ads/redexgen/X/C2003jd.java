package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.os.Build;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.jd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2003jd {
    public static byte[] A04;
    public static String[] A05 = {"9hgZ6gmZVIzcUa9O3mA", "hr5Nv5KmFuAh0QYIKM2bmKkmepVb4QJ5", "yO2HUjhUlIghedwjslAMsCcdfdKPfyCH", "zrGIWgWbx8IbO9KwhUHxd6SamLqSPg13", "PAiLfCht7j7DwfzIfnXwlTfs7d", "E", "ondXKsNdPZeIQPGRQ", "4zzip8XOl1eQzOydGeEIF"};
    public final Intent A00;
    public final C1998jY A01;
    public final C0958Hi A02;
    public final InterfaceC2224nG A03;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private D2 A0G(EnumC2295oR enumC2295oR) {
        InterfaceC2515s3 fg2;
        InterfaceC2459r9 c7e;
        String strA08 = this.A01.A08();
        C1048Kz c1048KzA00 = strA08 != null ? AbstractC2012jm.A00(strA08) : null;
        if (c1048KzA00 == null) {
            c1048KzA00 = A01();
        }
        if (c1048KzA00 == null) {
            return null;
        }
        if (enumC2295oR == EnumC2295oR.A05) {
            fg2 = new FH();
            c7e = new IV(this.A01);
        } else {
            fg2 = new FG();
            c7e = new C7E(this.A01);
        }
        return new D2(this.A02, fg2, this.A03, c1048KzA00, new C2086kz(this.A02), c7e);
    }

    public static String A0K(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0L() {
        A04 = new byte[]{23, 18, 41, 18, 23, 2, 23, 41, 20, 3, 24, 18, 26, 19, 50, 57, 48, 56, 63, 52, 53, 16, 53, 21, 48, 37, 48, 19, 36, 63, 53, 61, 52, 40, 39, 50, 47, 48, 35, 7, 34, 2, 39, 50, 39, 4, 51, 40, 34, 42, 35, 116, 99, 113, 103, 116, 98, 99, 98, 80, 111, 98, 99, 105, 71, 98, 66, 103, 114, 103, 68, 115, 104, 98, 106, 99, 112, 111, 98, 99, 105, 89, 114, 111, 107, 99, 89, 118, 105, 106, 106, 111, 104, 97, 89, 111, 104, 114, 99, 116, 112, 103, 106};
    }

    static {
        A0L();
    }

    public C2003jd(C1998jY c1998jY, Intent intent, InterfaceC2224nG interfaceC2224nG, C0958Hi c0958Hi) {
        this.A01 = c1998jY;
        this.A00 = intent;
        this.A03 = interfaceC2224nG;
        this.A02 = c0958Hi;
    }

    private LA A00() {
        int i5 = Build.VERSION.SDK_INT;
        String strA0K = A0K(33, 18, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        if (i5 >= 33) {
            return (LA) this.A00.getSerializableExtra(strA0K, LA.class);
        }
        return (LA) this.A00.getSerializableExtra(strA0K);
    }

    private C1048Kz A01() {
        int i5 = Build.VERSION.SDK_INT;
        String strA0K = A0K(14, 19, 96);
        if (i5 >= 33) {
            return (C1048Kz) this.A00.getSerializableExtra(strA0K, C1048Kz.class);
        }
        return (C1048Kz) this.A00.getSerializableExtra(strA0K);
    }

    private C07167i A02() {
        int i5 = Build.VERSION.SDK_INT;
        String strA0K = A0K(0, 14, 71);
        if (i5 >= 33) {
            return (C07167i) this.A00.getSerializableExtra(strA0K, C07167i.class);
        }
        Intent intent = this.A00;
        if (A05[5].length() == 28) {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[2] = "aLIzZsfvOjvh4cc7MNDterfabrQQ7uCt";
        strArr[1] = "2zeXMh2DNoLhbNF5aRtGPwdJAkJRstyd";
        return (C07167i) intent.getSerializableExtra(strA0K);
    }

    private C07147g A03() {
        int i5 = Build.VERSION.SDK_INT;
        String strA0K = A0K(51, 25, 55);
        if (i5 >= 33) {
            Serializable serializableExtra = this.A00.getSerializableExtra(strA0K, C07147g.class);
            String[] strArr = A05;
            if (strArr[7].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A05[5] = "bi";
            return (C07147g) serializableExtra;
        }
        return (C07147g) this.A00.getSerializableExtra(strA0K);
    }

    private InterfaceC2460rA A05() {
        return new C2010jk(this.A01, this.A00, this.A03, this.A02).A03();
    }

    private InterfaceC2460rA A06() {
        C07167i c07167iA02 = A02();
        if (c07167iA02 == null) {
            return null;
        }
        return A09(new C7E(this.A01), c07167iA02, c07167iA02.A1u(), new FH());
    }

    private InterfaceC2460rA A07() {
        C07147g c07147gA03 = A03();
        if (c07147gA03 == null) {
            return null;
        }
        return A09(new C7E(this.A01), c07147gA03, c07147gA03.A1u(), new FG());
    }

    private InterfaceC2460rA A08(EnumC2295oR enumC2295oR) {
        InterfaceC2515s3 fh2;
        InterfaceC2459r9 iv2;
        LA laA02 = null;
        String strA08 = this.A01.A08();
        if (strA08 != null) {
            laA02 = AbstractC2011jl.A00(strA08);
        }
        if (laA02 == null) {
            if (enumC2295oR == EnumC2295oR.A0H) {
                laA02 = A03();
            } else if (enumC2295oR == EnumC2295oR.A0B) {
                laA02 = A02();
            }
        }
        if (laA02 == null) {
            return null;
        }
        laA02.A21(this.A01.A08());
        if (laA02.A2K()) {
            this.A01.A0F(laA02.A2R());
            if (enumC2295oR == EnumC2295oR.A0H) {
                fh2 = new FG();
                iv2 = new C7E(this.A01);
            } else {
                fh2 = new FH();
                iv2 = new IV(this.A01);
            }
            return new C06795x(this.A02, fh2, this.A03, laA02, new C2086kz(this.A02), iv2);
        }
        return new C06705o(this.A02, this.A03, new C2086kz(this.A02), new IV(this.A01), laA02);
    }

    private InterfaceC2460rA A09(InterfaceC2459r9 interfaceC2459r9, LA la2, String str, InterfaceC2515s3 interfaceC2515s3) {
        if (la2.A32().A0I().A07() != null) {
            C1758fb c1758fbA07 = la2.A32().A0I().A07();
            if (la2.A2Z()) {
                return new FM(this.A02, this.A03, interfaceC2459r9, la2, c1758fbA07, str, interfaceC2515s3);
            }
            return new FS(this.A02, this.A03, interfaceC2459r9, la2, str, interfaceC2515s3);
        }
        interfaceC2459r9.A5C(interfaceC2515s3.A8c());
        interfaceC2459r9.A5C(interfaceC2515s3.A8X());
        return null;
    }

    private final FL A0A() {
        return new FL(this.A02, this.A01);
    }

    private FI A0B(RelativeLayout relativeLayout) {
        FI fi2 = new FI(this.A02, new IS(this), this.A03, new IV(this.A01));
        fi2.A05(relativeLayout);
        fi2.A04(this.A00.getIntExtra(A0K(76, 27, 55), 200));
        AbstractC2426qc.A0O(relativeLayout, -16777216);
        return fi2;
    }

    private C6U A0C() {
        C07167i c07167iA02 = A02();
        if (c07167iA02 == null) {
            return null;
        }
        return new C6U(this.A02, this.A03, new IV(this.A01), c07167iA02, new FH(), 1);
    }

    private C6U A0D() {
        C07147g c07147gA03 = A03();
        if (c07147gA03 == null) {
            return null;
        }
        return new C6U(this.A02, this.A03, new IV(this.A01), c07147gA03, new FG(), 0);
    }

    private E2 A0E() {
        C1245Tb c1245TbA02;
        LA laA00 = A00();
        if (laA00 == null || (c1245TbA02 = M1.A02(laA00.A1r())) == null) {
            return null;
        }
        return new E2(this.A02, new IV(this.A01), c1245TbA02, laA00.A37());
    }

    private D8 A0F(EnumC2295oR enumC2295oR) {
        C07147g c07147gA03 = A03();
        if (c07147gA03 == null) {
            if (A05[5].length() == 28) {
                throw new RuntimeException();
            }
            A05[6] = "3doWMQfY6jUOCGy1t";
            return null;
        }
        this.A01.A0F(c07147gA03.A2R());
        if (enumC2295oR == EnumC2295oR.A0I) {
            return new C06785w(this.A02, new FG(), this.A03, c07147gA03, new C2086kz(this.A02), new C7E(this.A01));
        }
        return new C06715p(this.A02, new FG(), this.A03, c07147gA03, new C2086kz(this.A02), new C7E(this.A01));
    }

    private C06785w A0H() {
        C07167i c07167iA02 = A02();
        if (c07167iA02 == null) {
            return null;
        }
        return new C06785w(this.A02, new FH(), this.A03, c07167iA02, new C2086kz(this.A02), new IV(this.A01));
    }

    private C06715p A0I() {
        C07167i c07167iA02 = A02();
        if (c07167iA02 != null) {
            this.A01.A0F(c07167iA02.A2R());
            return new C06715p(this.A02, new FH(), this.A03, c07167iA02, new C2086kz(this.A02), new IV(this.A01));
        }
        String[] strArr = A05;
        if (strArr[7].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[2] = "pmcQlDH7sZXh2s7s4TnMspoe9rHNP7fr";
        strArr2[1] = "eL2WbgazC7ehXX3SrLnYK8eATWSTto9D";
        return null;
    }

    private C0827Cg A0J(EnumC2295oR enumC2295oR) {
        LA laA02;
        LA laA022;
        if (enumC2295oR == EnumC2295oR.A0L) {
            laA02 = A03();
            if (A05[3].charAt(25) != 'L') {
                throw new RuntimeException();
            }
            A05[0] = b.f42142b;
            if (laA02 == null || (laA022 = A03()) == null) {
                return null;
            }
        } else if (enumC2295oR != EnumC2295oR.A0F || (laA02 = A02()) == null || (laA022 = A02()) == null) {
            return null;
        }
        return new C0827Cg(this.A02, this.A03, laA02, laA022, new C7E(this.A01), this.A01, enumC2295oR);
    }

    public final InterfaceC2460rA A0M(EnumC2295oR enumC2295oR, RelativeLayout relativeLayout) {
        if (enumC2295oR == null) {
            return null;
        }
        switch (C2002jc.A00[enumC2295oR.ordinal()]) {
            case 1:
                if (relativeLayout != null) {
                    return A0B(relativeLayout);
                }
                return null;
            case 2:
            case 3:
                return A08(enumC2295oR);
            case 4:
            case 5:
                return A0F(enumC2295oR);
            case 6:
                return A07();
            case 7:
                InterfaceC2460rA interfaceC2460rAA05 = A05();
                String[] strArr = A05;
                if (strArr[7].length() != strArr[4].length()) {
                    A05[3] = "JqgzsZEJ1D6XbsEZiOD5vqemmLO24Iu2";
                    return interfaceC2460rAA05;
                }
                break;
            case 8:
                return A0I();
            case 9:
                return A0H();
            case 10:
                return A06();
            case 11:
                return A0E();
            case 12:
                return A0C();
            case 13:
                return A0D();
            case 14:
            case 15:
                return A0G(enumC2295oR);
            case 16:
                return A0A();
            case 17:
            case 18:
                C0827Cg c0827CgA0J = A0J(enumC2295oR);
                String[] strArr2 = A05;
                if (strArr2[7].length() != strArr2[4].length()) {
                    A05[3] = "jUkUT1rQCZ9nRV5DLYO9lkZtxLvo9yBa";
                    return c0827CgA0J;
                }
                break;
            default:
                return null;
        }
        throw new RuntimeException();
    }
}
