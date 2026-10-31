package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;

/* renamed from: com.facebook.ads.redexgen.X.Oq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1142Oq implements InterfaceC1383Yv {
    public static byte[] A03;
    public static String[] A04 = {"x", "MiUD8Isflwo", "KZKaSVAY", "mp8bdMD1yg5xa0iWi32P6T4pt0URnEjo", "zIPFGAzXK1NPSfEVzLcBth4U9l189OV3", "ollVFlEdibIM6SsOFXYDJd5zCVU5wYsQ", "LVFdRt7YRf1", "WfjrlLhSwLMWW1ghpgSewv2b9IikS1nc"};
    public static final InterfaceC1387Yz A05;
    public InterfaceC1384Yw A00;
    public AbstractC1498bN A01;
    public boolean A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 107);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        String[] strArr = A04;
        if (strArr[1].length() != strArr[6].length()) {
            throw new RuntimeException();
        }
        A04[0] = "J";
        A03 = new byte[]{122, 93, 85, 80, 89, 88, 28, 72, 83, 28, 88, 89, 72, 89, 78, 81, 85, 82, 89, 28, 94, 85, 72, 79, 72, 78, 89, 93, 81, 28, 72, 69, 76, 89};
    }

    static {
        A02();
        A05 = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Or
            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final InterfaceC1383Yv[] A5w() {
                return C1142Oq.A04();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
            public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
                return AbstractC1386Yy.A01(this, uri, map);
            }
        };
    }

    public static C1084Mk A00(C1084Mk c1084Mk) {
        c1084Mk.A0f(0);
        return c1084Mk;
    }

    @EnsuresNonNullIf
    private boolean A03(Q9 q92) throws IOException {
        C1494bJ c1494bJ = new C1494bJ();
        if (!c1494bJ.A05(q92, true) || (c1494bJ.A04 & 2) != 2) {
            return false;
        }
        int length = Math.min(c1494bJ.A00, 8);
        C1084Mk c1084Mk = new C1084Mk(length);
        q92.AI6(c1084Mk.A0l(), 0, length);
        if (C1146Ou.A01(A00(c1084Mk))) {
            this.A01 = new C1146Ou();
        } else if (C1137Ol.A06(A00(c1084Mk))) {
            this.A01 = new C1137Ol();
        } else {
            if (!C1139On.A02(A00(c1084Mk))) {
                return false;
            }
            this.A01 = new C1139On();
        }
        return true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A04() {
        return new InterfaceC1383Yv[]{new C1142Oq()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A00 = interfaceC1384Yw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        AbstractC1062Ln.A02(this.A00);
        if (this.A01 == null) {
            if (A03(q92)) {
                q92.AK3();
            } else {
                throw L9.A01(A01(0, 34, 87), null);
            }
        }
        boolean z11 = this.A02;
        String[] strArr = A04;
        if (strArr[7].charAt(17) == strArr[5].charAt(17)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[1] = "R5brB6y4piA";
        strArr2[6] = "kwYf40qjcdA";
        if (!z11) {
            ZP zpALm = this.A00.ALm(0, 1);
            this.A00.A6x();
            this.A01.A0H(this.A00, zpALm);
            this.A02 = true;
        }
        return this.A01.A0B(q92, zh2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        if (this.A01 != null) {
            this.A01.A0G(j11, j12);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        try {
            return A03(q92);
        } catch (L9 unused) {
            return false;
        }
    }
}
