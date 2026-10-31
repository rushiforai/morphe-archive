package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class O1 implements InterfaceC1602d3 {
    public static byte[] A0C;
    public static String[] A0D = {"s1OLgDpLhwU6S3ev2LG7370P1S1hgRKL", "ZlUa", "q8uvNR0LmWicI4Royxvt1Zty1bBi2yMt", "lN3rpYNXmWWD132XUlN2ThtdYynBh6B0", "DemfNCPv02gD7OuapGlPMaBjpYQUBs9I", "lBsGkgfsHAkvf0DthDZ1e", "lPkycUi8aQ8EQdlpq3OxMzwckgLEoe", "P0z8XJzQz6G5COmoNubq0j8sI0uUWshp"};
    public int A00;
    public int A01;
    public int A02;
    public long A04;
    public C1092Ms A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public final InterfaceC1580ch A0B;
    public final C1083Mj A0A = new C1083Mj(new byte[10]);
    public int A03 = 0;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 16);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0C = new byte[]{105, -74, -72, -69, -82, 105, -85, -62, -67, -82, -68, -51, -10, -4, -11, -21, -89, -11, -20, -18, -24, -5, -16, -3, -20, -89, -9, -24, -22, -14, -20, -5, -89, -9, -24, 0, -13, -10, -24, -21, -89, -6, -16, 1, -20, -63, -89, 103, 124, -118, 105, 124, 120, 123, 124, -119, 114, -117, -126, -107, -115, -126, -128, -111, -126, -127, 61, -112, -111, 126, -113, -111, 61, -128, -116, -127, -126, 61, -115, -113, -126, -125, -122, -107, 87, 61, 111, -120, AbstractJsonLexerKt.TC_INVALID, -110, -118, AbstractJsonLexerKt.TC_INVALID, 125, -114, AbstractJsonLexerKt.TC_INVALID, 126, 58, -115, -114, 123, -116, -114, 58, -125, -120, 126, -125, 125, 123, -114, -119, -116, 58, -116, AbstractJsonLexerKt.TC_INVALID, 123, 126, -125, -120, -127, 58, AbstractJsonLexerKt.TC_INVALID, -110, -114, AbstractJsonLexerKt.TC_INVALID, -120, 126, AbstractJsonLexerKt.TC_INVALID, 126, 58, -126, AbstractJsonLexerKt.TC_INVALID, 123, 126, AbstractJsonLexerKt.TC_INVALID, -116, -74, -49, -58, -39, -47, -58, -60, -43, -58, -59, -127, -44, -43, -62, -45, -43, -127, -54, -49, -59, -54, -60, -62, -43, -48, -45, -101, -127, -58, -39, -47, -58, -60, -43, -58, -59, -127};
    }

    static {
        A02();
    }

    public O1(InterfaceC1580ch interfaceC1580ch) {
        this.A0B = interfaceC1580ch;
    }

    @RequiresNonNull
    private void A01() {
        this.A0A.A08(0);
        this.A04 = -9223372036854775807L;
        if (this.A08) {
            this.A0A.A09(4);
            this.A0A.A09(1);
            long pts = this.A0A.A04(15) << 15;
            long jA04 = (this.A0A.A04(3) << 30) | pts;
            this.A0A.A09(1);
            long pts2 = this.A0A.A04(15);
            long j11 = jA04 | pts2;
            this.A0A.A09(1);
            if (!this.A09 && this.A07) {
                this.A0A.A09(4);
                long pts3 = this.A0A.A04(3);
                this.A0A.A09(1);
                this.A0A.A09(1);
                this.A0A.A09(1);
                this.A05.A06((pts3 << 30) | (this.A0A.A04(15) << 15) | this.A0A.A04(15));
                this.A09 = true;
            }
            this.A04 = this.A05.A06(j11);
        }
    }

    private void A03(int i5) {
        this.A03 = i5;
        this.A00 = 0;
    }

    private boolean A04() {
        this.A0A.A08(0);
        int iA04 = this.A0A.A04(24);
        String strA00 = A00(47, 9, 7);
        if (iA04 != 1) {
            MV.A07(strA00, A00(56, 30, 13) + iA04);
            this.A02 = -1;
            return false;
        }
        this.A0A.A09(8);
        int iA042 = this.A0A.A04(16);
        this.A0A.A09(5);
        this.A06 = this.A0A.A0H();
        this.A0A.A09(2);
        this.A08 = this.A0A.A0H();
        this.A07 = this.A0A.A0H();
        this.A0A.A09(6);
        int startCodePrefix = this.A0A.A04(8);
        this.A01 = startCodePrefix;
        if (iA042 == 0) {
            this.A02 = -1;
        } else {
            int startCodePrefix2 = iA042 + 6;
            int packetLength = startCodePrefix2 - 9;
            int startCodePrefix3 = this.A01;
            this.A02 = packetLength - startCodePrefix3;
            int startCodePrefix4 = this.A02;
            if (startCodePrefix4 < 0) {
                StringBuilder sbAppend = new StringBuilder().append(A00(11, 36, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                int startCodePrefix5 = this.A02;
                MV.A07(strA00, sbAppend.append(startCodePrefix5).toString());
                this.A02 = -1;
            }
        }
        return true;
    }

    private boolean A05(C1084Mk c1084Mk, byte[] bArr, int i5) {
        int iMin = Math.min(c1084Mk.A07(), i5 - this.A00);
        if (iMin <= 0) {
            return true;
        }
        if (bArr == null) {
            c1084Mk.A0g(iMin);
        } else {
            int bytesToRead = this.A00;
            c1084Mk.A0k(bArr, bytesToRead, iMin);
        }
        int bytesToRead2 = this.A00;
        this.A00 = bytesToRead2 + iMin;
        int bytesToRead3 = this.A00;
        return bytesToRead3 == i5;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void A5k(C1084Mk c1084Mk, int i5) throws L9 {
        AbstractC1062Ln.A02(this.A05);
        if ((i5 & 1) != 0) {
            int i11 = this.A03;
            String strA00 = A00(47, 9, 7);
            switch (i11) {
                case 0:
                case 1:
                    A03(1);
                    break;
                case 2:
                    MV.A07(strA00, A00(86, 50, 10));
                    A03(1);
                    break;
                case 3:
                    if (this.A02 != -1) {
                        MV.A07(strA00, A00(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 37, 81) + this.A02 + A00(0, 11, 57));
                    }
                    this.A0B.AI2();
                    A03(1);
                    break;
                default:
                    throw new IllegalStateException();
            }
        }
        while (c1084Mk.A07() > 0) {
            switch (this.A03) {
                case 0:
                    c1084Mk.A0g(c1084Mk.A07());
                    break;
                case 1:
                    if (!A05(c1084Mk, this.A0A.A00, 9)) {
                        break;
                    } else {
                        A03(A04() ? 2 : 0);
                        break;
                    }
                case 2:
                    if (A05(c1084Mk, this.A0A.A00, Math.min(10, this.A01))) {
                        int i12 = this.A01;
                        String[] strArr = A0D;
                        String str = strArr[7];
                        String str2 = strArr[0];
                        int iCharAt = str.charAt(13);
                        int readLength = str2.charAt(13);
                        if (iCharAt != readLength) {
                            String[] strArr2 = A0D;
                            strArr2[7] = "La2ywzQaUlSKJwW2oa92KpQQSNBVqlsm";
                            strArr2[0] = "Lmwsgxnc2XnvTDKag3jwqZ0KvySkQZYo";
                            if (!A05(c1084Mk, null, i12)) {
                                break;
                            } else {
                                A01();
                                i5 |= this.A06 ? 4 : 0;
                                this.A0B.AI3(this.A04, i5);
                                A03(3);
                                break;
                            }
                        } else {
                            throw new RuntimeException();
                        }
                    } else {
                        continue;
                    }
                case 3:
                    int iA07 = c1084Mk.A07();
                    int readLength2 = this.A02;
                    if (readLength2 != -1) {
                        int readLength3 = this.A02;
                        i = iA07 - readLength3;
                    }
                    if (i > 0) {
                        iA07 -= i;
                        int readLength4 = c1084Mk.A09();
                        c1084Mk.A0e(readLength4 + iA07);
                    }
                    this.A0B.A5j(c1084Mk);
                    int readLength5 = this.A02;
                    if (readLength5 == -1) {
                        break;
                    } else {
                        int readLength6 = this.A02;
                        this.A02 = readLength6 - iA07;
                        int readLength7 = this.A02;
                        if (readLength7 != 0) {
                            break;
                        } else {
                            this.A0B.AI2();
                            A03(1);
                            break;
                        }
                    }
                default:
                    throw new IllegalStateException();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void AAo(C1092Ms c1092Ms, InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        this.A05 = c1092Ms;
        this.A0B.A6B(interfaceC1384Yw, c1601d2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1602d3
    public final void AKN() {
        this.A03 = 0;
        this.A00 = 0;
        this.A09 = false;
        this.A0B.AKN();
    }
}
