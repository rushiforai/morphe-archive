package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.Comparator;
import java.util.TreeSet;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.7x, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07317x implements InterfaceC1085Ml {
    public static byte[] A03;

    @MetaExoPlayerCustomization
    public long A00;

    @MetaExoPlayerCustomization
    public final long A01;

    @MetaExoPlayerCustomization
    public final TreeSet<C1681eL> A02 = new TreeSet<>(new Comparator() { // from class: com.facebook.ads.redexgen.X.eZ
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return C07317x.A00((C1681eL) obj, (C1681eL) obj2);
        }
    });

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 123);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{-9, 8, -5, -11, 6, -43, -13, -11, -6, -9};
    }

    public C07317x(long j11) {
        this.A01 = j11;
    }

    @MetaExoPlayerCustomization
    public static int A00(C1681eL c1681eL, C1681eL c1681eL2) {
        if (c1681eL.A00 - c1681eL2.A00 == 0) {
            return c1681eL.compareTo(c1681eL2);
        }
        return c1681eL.A00 < c1681eL2.A00 ? -1 : 1;
    }

    private void A03(InterfaceC1671eB interfaceC1671eB, long j11) {
        AbstractC1093Mt.A02(A01(0, 10, 23));
        while (this.A00 + j11 > this.A01 && !this.A02.isEmpty()) {
            interfaceC1671eB.AJm(this.A02.first());
        }
        AbstractC1093Mt.A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1670eA
    public final void AH9(InterfaceC1671eB interfaceC1671eB, C1681eL c1681eL) {
        this.A02.add(c1681eL);
        this.A00 += c1681eL.A01;
        A03(interfaceC1671eB, 0L);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1670eA
    public final void AHA(InterfaceC1671eB interfaceC1671eB, C1681eL c1681eL) {
        this.A02.remove(c1681eL);
        this.A00 -= c1681eL.A01;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1670eA
    public final void AHB(InterfaceC1671eB interfaceC1671eB, C1681eL c1681eL, C1681eL c1681eL2) {
        AHA(interfaceC1671eB, c1681eL);
        AH9(interfaceC1671eB, c1681eL2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1085Ml
    public final void AHC(InterfaceC1671eB interfaceC1671eB, String str, long j11, long j12) {
        if (j12 != -1) {
            A03(interfaceC1671eB, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1085Ml
    public final boolean AK1() {
        return true;
    }
}
