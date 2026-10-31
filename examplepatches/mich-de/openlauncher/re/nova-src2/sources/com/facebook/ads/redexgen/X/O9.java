package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Collections;

/* loaded from: assets/audience_network/classes.dex */
public final class O9 implements InterfaceC1580ch {
    public static byte[] A0B;
    public static String[] A0C = {"RmzQBswPTcHRn", "7sruaPUkodwgw3QS8ipm4Ha2G8d1hbf4", "aAnMB0oWNfLMgIl9siRQZtZewG2pJ8kh", "xQmU", "ncat", "INsyHwzMN49j6MmZBuVitykaDF", "oUMWpFbAo", "SoiUZ4hHIkR"};
    public static final float[] A0D;
    public long A00;
    public long A01;
    public ZP A02;
    public C1584cl A03;
    public String A04;
    public boolean A05;
    public final C1084Mk A06;
    public final C1583ck A07;
    public final C1589cq A08;
    public final C1604d5 A09;
    public final boolean[] A0A;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0B = new byte[]{-75, -97, -93, -96, -65, -46, -50, -47, -46, -33, -77, -40, -32, -53, -42, -45, -50, -118, -53, -35, -38, -49, -51, -34, -118, -36, -53, -34, -45, -39, 12, 49, 57, 36, 47, 44, 39, -29, 57, 50, 51, 34, 44, 49, 38, 53, 40, 48, 40, 49, 55, 34, 55, 44, 48, 40, 34, 53, 40, 54, 50, 47, 56, 55, 44, 50, 49, 43, 68, 62, 55, 68, 58, 66, 59, 58, -10, 76, 63, 58, 59, 69, -10, 69, 56, 64, 59, 57, 74, -10, 66, 55, 79, 59, 72, -10, 73, 62, 55, 70, 59, 44, 31, 26, 27, 37, -27, 35, 38, -22, 44, -29, 27, 41};
    }

    static {
        A02();
        A0D = new float[]{1.0f, 1.0f, 1.0909091f, 0.90909094f, 1.4545455f, 1.2121212f, 1.0f};
    }

    public O9() {
        this(null);
    }

    public O9(C1604d5 c1604d5) {
        this.A09 = c1604d5;
        this.A0A = new boolean[4];
        this.A07 = new C1583ck(128);
        this.A00 = -9223372036854775807L;
        if (c1604d5 != null) {
            this.A08 = new C1589cq(178, 128);
            this.A06 = new C1084Mk();
        } else {
            this.A08 = null;
            this.A06 = null;
        }
    }

    public static VC A00(C1583ck c1583ck, int i5, String str) {
        float f11;
        byte[] bArrCopyOf = Arrays.copyOf(c1583ck.A02, c1583ck.A00);
        C1083Mj c1083Mj = new C1083Mj(bArrCopyOf);
        c1083Mj.A0A(i5);
        c1083Mj.A0A(4);
        c1083Mj.A07();
        c1083Mj.A09(8);
        if (c1083Mj.A0H()) {
            c1083Mj.A09(4);
            c1083Mj.A09(3);
        }
        int iA04 = c1083Mj.A04(4);
        String strA01 = A01(10, 20, 13);
        String strA012 = A01(0, 10, 16);
        if (iA04 == 15) {
            int iA042 = c1083Mj.A04(8);
            int iA043 = c1083Mj.A04(8);
            if (iA043 == 0) {
                MV.A07(strA012, strA01);
                f11 = 1.0f;
            } else {
                f11 = iA042 / iA043;
            }
        } else if (iA04 < A0D.length) {
            f11 = A0D[iA04];
        } else {
            MV.A07(strA012, strA01);
            f11 = 1.0f;
        }
        if (c1083Mj.A0H()) {
            c1083Mj.A09(2);
            String[] strArr = A0C;
            if (strArr[5].length() == strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[6] = "1DXyjb23W";
            strArr2[7] = "3ybYm7e6XuU";
            c1083Mj.A09(1);
            if (c1083Mj.A0H()) {
                c1083Mj.A09(15);
                c1083Mj.A07();
                c1083Mj.A09(15);
                c1083Mj.A07();
                String[] strArr3 = A0C;
                if (strArr3[2].charAt(17) != strArr3[1].charAt(17)) {
                    String[] strArr4 = A0C;
                    strArr4[5] = "RxqFL1LhobXh1ktc6pkc0Ud8kV";
                    strArr4[0] = "1CEsVmL5qvOrx";
                    c1083Mj.A09(15);
                    c1083Mj.A07();
                    c1083Mj.A09(3);
                    c1083Mj.A09(4);
                    c1083Mj.A07();
                    c1083Mj.A09(15);
                    c1083Mj.A07();
                } else {
                    String[] strArr5 = A0C;
                    strArr5[3] = "7wQW";
                    strArr5[4] = "XsvE";
                    c1083Mj.A09(15);
                    c1083Mj.A07();
                    c1083Mj.A09(3);
                    c1083Mj.A09(11);
                    c1083Mj.A07();
                    c1083Mj.A09(15);
                    c1083Mj.A07();
                }
            }
        }
        if (c1083Mj.A04(2) != 0) {
            MV.A07(strA012, A01(67, 34, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
        }
        c1083Mj.A07();
        int iA044 = c1083Mj.A04(16);
        c1083Mj.A07();
        if (c1083Mj.A0H()) {
            if (iA044 == 0) {
                MV.A07(strA012, A01(30, 37, 102));
            } else {
                int i11 = 0;
                for (int i12 = iA044 - 1; i12 > 0; i12 >>= 1) {
                    i11++;
                }
                c1083Mj.A09(i11);
            }
        }
        c1083Mj.A07();
        int parWidth = c1083Mj.A04(13);
        c1083Mj.A07();
        int vopTimeIncrementResolution = c1083Mj.A04(13);
        c1083Mj.A07();
        c1083Mj.A07();
        return new C1029Ke().A0y(str).A11(A01(101, 13, 89)).A0r(parWidth).A0f(vopTimeIncrementResolution).A0Y(f11).A12(Collections.singletonList(bArrCopyOf)).A14();
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x016e A[LOOP:0: B:3:0x0029->B:48:0x016e, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0168 A[EDGE_INSN: B:53:0x0168->B:46:0x0168 BREAK  A[LOOP:0: B:3:0x0029->B:48:0x016e], SYNTHETIC] */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A5j(C1084Mk c1084Mk) {
        int limit;
        int offset;
        AbstractC1062Ln.A02(this.A03);
        AbstractC1062Ln.A02(this.A02);
        int iA09 = c1084Mk.A09();
        int bytesAlreadyPassed = c1084Mk.A0A();
        byte[] bArrA0l = c1084Mk.A0l();
        long j11 = this.A01;
        int offset2 = c1084Mk.A07();
        this.A01 = j11 + offset2;
        ZP zp2 = this.A02;
        int offset3 = c1084Mk.A07();
        zp2.AK9(c1084Mk, offset3);
        while (true) {
            int startCodeValue = ZE.A04(bArrA0l, iA09, bytesAlreadyPassed, this.A0A);
            if (startCodeValue == bytesAlreadyPassed) {
                if (!this.A05) {
                    this.A07.A03(bArrA0l, iA09, bytesAlreadyPassed);
                }
                this.A03.A03(bArrA0l, iA09, bytesAlreadyPassed);
                if (this.A08 != null) {
                    this.A08.A02(bArrA0l, iA09, bytesAlreadyPassed);
                    return;
                }
                return;
            }
            int offset4 = startCodeValue + 3;
            int i5 = c1084Mk.A0l()[offset4] & 255;
            int i11 = startCodeValue - iA09;
            String[] strArr = A0C;
            String str = strArr[5];
            String str2 = strArr[0];
            int limit2 = str.length();
            int offset5 = str2.length();
            if (limit2 == offset5) {
                break;
            }
            String[] strArr2 = A0C;
            strArr2[3] = "CaNK";
            strArr2[4] = "biqh";
            if (!this.A05) {
                if (i11 > 0) {
                    this.A07.A03(bArrA0l, iA09, startCodeValue);
                }
                int limit3 = i11 < 0 ? -i11 : 0;
                if (this.A07.A04(i5, limit3)) {
                    ZP zp3 = this.A02;
                    C1583ck c1583ck = this.A07;
                    int limit4 = this.A07.A01;
                    zp3.A7E(A00(c1583ck, limit4, (String) AbstractC1062Ln.A01(this.A04)));
                    this.A05 = true;
                }
            }
            this.A03.A03(bArrA0l, iA09, startCodeValue);
            if (this.A08 != null) {
                int limit5 = 0;
                if (i11 > 0) {
                    this.A08.A02(bArrA0l, iA09, startCodeValue);
                } else {
                    limit5 = -i11;
                }
                if (this.A08.A04(limit5)) {
                    byte[] bArr = this.A08.A01;
                    int offset6 = this.A08.A00;
                    ((C1084Mk) N1.A0f(this.A06)).A0j(this.A08.A01, ZE.A02(bArr, offset6));
                    ((C1604d5) N1.A0f(this.A09)).A02(this.A00, this.A06);
                }
                if (i5 == 178) {
                    byte[] bArrA0l2 = c1084Mk.A0l();
                    int i12 = startCodeValue + 2;
                    String[] strArr3 = A0C;
                    String str3 = strArr3[6];
                    String str4 = strArr3[7];
                    int limit6 = str3.length();
                    int offset7 = str4.length();
                    if (limit6 == offset7) {
                        break;
                    }
                    String[] strArr4 = A0C;
                    strArr4[3] = "XuHL";
                    strArr4[4] = "pdRE";
                    int offset8 = bArrA0l2[i12];
                    if (offset8 == 1) {
                        C1589cq c1589cq = this.A08;
                        String[] strArr5 = A0C;
                        String str5 = strArr5[2];
                        String str6 = strArr5[1];
                        int limit7 = str5.charAt(17);
                        int offset9 = str6.charAt(17);
                        if (limit7 != offset9) {
                            throw new RuntimeException();
                        }
                        String[] strArr6 = A0C;
                        strArr6[3] = "XpqV";
                        strArr6[4] = "m0yB";
                        c1589cq.A01(i5);
                    }
                    int i13 = bytesAlreadyPassed - startCodeValue;
                    this.A03.A02(this.A01 - i13, i13, this.A05);
                    this.A03.A01(i5, this.A00);
                    String[] strArr7 = A0C;
                    String str7 = strArr7[3];
                    String str8 = strArr7[4];
                    limit = str7.length();
                    offset = str8.length();
                    if (limit == offset) {
                        break;
                    }
                    String[] strArr8 = A0C;
                    strArr8[2] = "6iTxcmzVIXvxdsIc5i1IeG77VcHbU7AW";
                    strArr8[1] = "TQw8c6Kr3dOAts0YtieK5cfYtyLkhdsR";
                    iA09 = startCodeValue + 3;
                } else {
                    int i132 = bytesAlreadyPassed - startCodeValue;
                    this.A03.A02(this.A01 - i132, i132, this.A05);
                    this.A03.A01(i5, this.A00);
                    String[] strArr72 = A0C;
                    String str72 = strArr72[3];
                    String str82 = strArr72[4];
                    limit = str72.length();
                    offset = str82.length();
                    if (limit == offset) {
                    }
                }
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        c1601d2.A05();
        this.A04 = c1601d2.A04();
        this.A02 = interfaceC1384Yw.ALm(c1601d2.A03(), 2);
        this.A03 = new C1584cl(this.A02);
        if (this.A09 != null) {
            this.A09.A03(interfaceC1384Yw, c1601d2);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if (j11 != -9223372036854775807L) {
            this.A00 = j11;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        ZE.A0H(this.A0A);
        this.A07.A02();
        if (this.A03 != null) {
            this.A03.A00();
        }
        C1589cq c1589cq = this.A08;
        String[] strArr = A0C;
        if (strArr[5].length() != strArr[0].length()) {
            String[] strArr2 = A0C;
            strArr2[5] = "5MBZOjuw4oVT52TSKhuedhnMOR";
            strArr2[0] = "KYdk32ZZwRgXS";
            if (c1589cq != null) {
                C1589cq c1589cq2 = this.A08;
                String[] strArr3 = A0C;
                if (strArr3[5].length() != strArr3[0].length()) {
                    String[] strArr4 = A0C;
                    strArr4[5] = "X4bSBGsfUgHipqaUiLNXeKByPJ";
                    strArr4[0] = "P2KClEvmHXOZL";
                    c1589cq2.A00();
                }
            }
            this.A01 = 0L;
            this.A00 = -9223372036854775807L;
            return;
        }
        throw new RuntimeException();
    }
}
