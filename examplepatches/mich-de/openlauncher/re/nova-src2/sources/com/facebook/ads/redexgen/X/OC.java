package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class OC implements InterfaceC1580ch {
    public static byte[] A06;
    public static String[] A07 = {"PahcxQEjsm7nWiAGfKA0s9Z8ehxfTyD7", "khchdWyhC3LruOr6lswPp47Tdx1XVi9Q", "PHjUuC9odwRlx209E5wPDT3TYRvN1c2J", "kheAEn4IU3EoVHqb0zIUPlScI42kccyE", "Vnq4DwsxrxxViksnhLlfyKdKnPJfqDp8", "EpM8gpL3PaAF0ukdzfwToTihGon54bgi", "296fAA6HH6ETbj19OFpoPwKNwJQYqoU2", "zODTrbU8fTugRGwwCEVELBReBCv4K7jD"};
    public int A00;
    public int A01;
    public long A02 = -9223372036854775807L;
    public boolean A03;
    public final List<C1597cy> A04;
    public final ZP[] A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            String[] strArr = A07;
            if (strArr[2].charAt(29) == strArr[4].charAt(29)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[3] = "QFs5MHap4BAC0RMiP9GwzAUYPG3tGlSO";
            strArr2[7] = "DSro16b4yiFiIZzzKMdst89KHzJdjiZt";
            bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 84);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A06 = new byte[]{0, 15, 15, 11, 8, 2, 0, 19, 8, 14, 13, -50, 3, 21, 1, 18, 20, 1, 18};
    }

    static {
        A01();
    }

    public OC(List<C1597cy> list) {
        this.A04 = list;
        this.A05 = new ZP[list.size()];
    }

    private boolean A02(C1084Mk c1084Mk, int i5) {
        if (c1084Mk.A07() == 0) {
            return false;
        }
        if (c1084Mk.A0I() != i5) {
            this.A03 = false;
        }
        this.A00--;
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void A5j(C1084Mk c1084Mk) {
        if (this.A03) {
            if (this.A00 == 2 && !A02(c1084Mk, 32)) {
                return;
            }
            if (this.A00 == 1 && !A02(c1084Mk, 0)) {
                return;
            }
            int iA09 = c1084Mk.A09();
            int iA07 = c1084Mk.A07();
            for (ZP zp2 : this.A05) {
                c1084Mk.A0f(iA09);
                zp2.AK9(c1084Mk, iA07);
            }
            int dataPosition = this.A01;
            this.A01 = dataPosition + iA07;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A6B(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        for (int i5 = 0; i5 < i; i5++) {
            C1597cy c1597cy = this.A04.get(i5);
            c1601d2.A05();
            ZP zpALm = interfaceC1384Yw.ALm(c1601d2.A03(), 3);
            zpALm.A7E(new C1029Ke().A0y(c1601d2.A04()).A11(A00(0, 19, 75)).A12(Collections.singletonList(c1597cy.A02)).A10(c1597cy.A01).A14());
            this.A05[i5] = zpALm;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI2() {
        if (this.A03) {
            if (this.A02 != -9223372036854775807L) {
                for (ZP zp2 : this.A05) {
                    zp2.AKC(this.A02, 1, this.A01, 0, null);
                }
            }
            this.A03 = false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AI3(long j11, int i5) {
        if ((i5 & 4) == 0) {
            return;
        }
        this.A03 = true;
        if (j11 != -9223372036854775807L) {
            this.A02 = j11;
        }
        this.A01 = 0;
        this.A00 = 2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1580ch
    public final void AKN() {
        this.A03 = false;
        this.A02 = -9223372036854775807L;
    }
}
