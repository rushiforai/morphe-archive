package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.d5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1604d5 {
    public static byte[] A02;
    public static String[] A03 = {"LnyyqlPNv6qTEgkNtN0cFprVvVFAz7up", "G6yzwS48ntoTiKlIZKCjf0uZCMGgTgOX", "Q8zypuRiOz02PLfw9X7vbB76xbkjBMzl", "Qp5QD2LDSSR94ZiBGaIi3PzBkR3y7xnx", "5Lns6nqBdYK87c9W0OSTpfCOmLf7ADuE", "k0", "dazpQp8n2zSWT1b8JgBm", "0PJU7a3uVSd9z7MIb3IYz6MWEQNuS6Ac"};
    public final List<VC> A00;
    public final ZP[] A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 3);
            String[] strArr = A03;
            if (strArr[2].charAt(5) == strArr[4].charAt(5)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[0] = "WwCHZ5Uff0fEC9Blvfo0WA14PFAOfNCv";
            strArr2[1] = "hIzsi5ZPKg01JPAWBJbXYiDKf4ebdb7I";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{71, 96, 120, 111, 98, 103, 106, 46, 109, 98, 97, 125, 107, 106, 46, 109, 111, 126, 122, 103, 97, 96, 46, 99, 103, 99, 107, 46, 122, 119, 126, 107, 46, 126, 124, 97, 120, 103, 106, 107, 106, 52, 46, 27, 10, 10, 22, 19, 25, 27, 14, 19, 21, 20, 85, 25, 31, 27, 87, 76, 74, 66, 62, 47, 47, 51, 54, 60, 62, 43, 54, 48, 49, 112, 60, 58, 62, 114, 104, 111, 103};
    }

    static {
        A01();
    }

    public C1604d5(List<VC> list) {
        this.A00 = list;
        this.A01 = new ZP[list.size()];
    }

    public final void A02(long j11, C1084Mk c1084Mk) {
        if (c1084Mk.A07() < 9) {
            return;
        }
        int iA0C = c1084Mk.A0C();
        int iA0C2 = c1084Mk.A0C();
        int iA0I = c1084Mk.A0I();
        int userDataIdentifier = A03[6].length();
        if (userDataIdentifier == 20) {
            String[] strArr = A03;
            strArr[2] = "aLK0Eq9R55MDkT9akepULHCpjLV1m4Py";
            strArr[4] = "h4fuBr7VBxaQPnNKoVNZEwIETiPLY5il";
            if (iA0C == 434 && iA0C2 == 1195456820 && iA0I == 3) {
                ZP[] zpArr = this.A01;
                String[] strArr2 = A03;
                String str = strArr2[0];
                String str2 = strArr2[1];
                int userDataIdentifier2 = str.charAt(19);
                int userDataStartCode = str2.charAt(19);
                if (userDataIdentifier2 != userDataStartCode) {
                    String[] strArr3 = A03;
                    strArr3[0] = "St55nzREipoTW3otAa6uYr79KCy3egzU";
                    strArr3[1] = "EUYkc12G3aEiqY8BOmd3Gt5LtxzmFD8M";
                    AbstractC1377Yp.A04(j11, c1084Mk, zpArr);
                    return;
                }
            } else {
                return;
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A03(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        for (int i5 = 0; i5 < i; i5++) {
            c1601d2.A05();
            ZP zpALm = interfaceC1384Yw.ALm(c1601d2.A03(), 3);
            VC vc = this.A00.get(i5);
            String str = vc.A0W;
            AbstractC1062Ln.A09(A00(43, 19, Sdk.SDKError.Reason.TPAT_ERROR_VALUE).equals(str) || A00(62, 19, 92).equals(str), A00(0, 43, 13) + str);
            C1029Ke c1029KeA11 = new C1029Ke().A0y(c1601d2.A04()).A11(str);
            int i11 = vc.A0H;
            C1029Ke c1029KeA10 = c1029KeA11.A0n(i11).A10(vc.A0V);
            int i12 = vc.A03;
            zpALm.A7E(c1029KeA10.A0Z(i12).A12(vc.A0X).A14());
            this.A01[i5] = zpALm;
        }
    }
}
