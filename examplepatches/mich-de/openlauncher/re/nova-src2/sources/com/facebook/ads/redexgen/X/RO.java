package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import androidx.compose.ui.node.LayoutNode;
import java.util.Collections;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class RO extends WT<RO> implements Comparable<RO> {
    public static String[] A0I = {"P4R9wJWAYyqjrhbRHbCv636JXConZvq3", "2Mzg6q2Xp5b4khmgCkCieu53qULwPG8h", "vaNfeANqbrnyfhHcxrjF", "bXOhXzPgHRErXS", "IXcEGBsao5qVdUmFKQjcY19rlhxnx5lS", "LTRkc", "Beig4rKsYLcGqimXZb647yryWj8XuJuc", "KdGkG"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final int A09;
    public final C07408i A0A;
    public final String A0B;
    public final boolean A0C;
    public final boolean A0D;
    public final boolean A0E;
    public final boolean A0F;
    public final boolean A0G;
    public final boolean A0H;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public RO(int i5, U8 u82, int i11, C07408i c07408i, int i12, boolean z11, InterfaceC1334Wt<VC> interfaceC1334Wt) {
        super(i5, u82, i11);
        this.A0A = c07408i;
        this.A0B = C07398h.A0K(super.A02.A0V);
        this.A0F = C07398h.A0S(i12, false);
        int i13 = 0;
        int i14 = LayoutNode.NotPlacedPlaceOrder;
        int i15 = 0;
        while (true) {
            if (i15 >= c07408i.A0I.size()) {
                break;
            }
            int iA02 = C07398h.A02(super.A02, c07408i.A0I.get(i15), false);
            if (iA02 > 0) {
                i14 = i15;
                i13 = iA02;
                break;
            }
            i15++;
        }
        this.A04 = i14;
        this.A05 = i13;
        this.A07 = C07398h.A00(super.A02.A0E, ((U1) c07408i).A0B);
        this.A0C = super.A02.A0E == 0 || (super.A02.A0E & 1) != 0;
        this.A0D = (super.A02.A0H & 1) != 0;
        this.A01 = super.A02.A06;
        this.A08 = super.A02.A0G;
        this.A00 = super.A02.A05;
        this.A0E = (super.A02.A05 == -1 || super.A02.A05 <= ((U1) c07408i).A01) && (super.A02.A06 == -1 || super.A02.A06 <= ((U1) c07408i).A02) && interfaceC1334Wt.A4d(super.A02);
        String[] strArrA1L = N1.A1L();
        int i16 = LayoutNode.NotPlacedPlaceOrder;
        int i17 = 0;
        int i18 = 0;
        while (true) {
            if (i18 >= strArrA1L.length) {
                break;
            }
            int iA022 = C07398h.A02(super.A02, strArrA1L[i18], false);
            if (iA022 > 0) {
                i16 = i18;
                i17 = iA022;
                break;
            }
            i18++;
        }
        this.A02 = i16;
        this.A03 = i17;
        int i19 = LayoutNode.NotPlacedPlaceOrder;
        int i21 = 0;
        while (true) {
            if (i21 < c07408i.A0J.size()) {
                if (super.A02.A0W != null && super.A02.A0W.equals(c07408i.A0J.get(i21))) {
                    i19 = i21;
                    break;
                }
                i21++;
            } else {
                break;
            }
        }
        this.A06 = i19;
        this.A0H = PX.A02(i12) == 128;
        this.A0G = PX.A04(i12) == 64;
        this.A09 = A00(i12, z11);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static int A02(List<RO> list, List<RO> list2) {
        return ((RO) Collections.max(list)).compareTo((RO) Collections.max(list2));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static AbstractC07549l<RO> A03(int i5, U8 u82, C07408i c07408i, int[] iArr, boolean z11, InterfaceC1334Wt<VC> interfaceC1334Wt) {
        C06344e c06344eA01 = AbstractC07549l.A01();
        for (int i11 = 0; i11 < u82.A01; i11++) {
            c06344eA01.A04(new RO(i5, u82, i11, c07408i, iArr[i11], z11, interfaceC1334Wt));
        }
        return c06344eA01.A05();
    }

    private int A00(int i5, boolean z11) {
        if (!C07398h.A0S(i5, this.A0A.A0B)) {
            return 0;
        }
        if (!this.A0E && !this.A0A.A09) {
            return 0;
        }
        boolean zA0S = C07398h.A0S(i5, false);
        String[] strArr = A0I;
        if (strArr[6].charAt(14) != strArr[4].charAt(14)) {
            throw new RuntimeException();
        }
        A0I[3] = "V5hK0VSk3dhSjP";
        if (zA0S && this.A0E && super.A02.A05 != -1 && !this.A0A.A0N && !this.A0A.A0O && (this.A0A.A04 || !z11)) {
            return 2;
        }
        return 1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<java.lang.Integer> */
    @Override // java.lang.Comparable
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final int compareTo(RO ro2) {
        AbstractC1294Vc abstractC1294VcA06;
        AbstractC1294Vc abstractC1294VcA062 = (this.A0E && this.A0F) ? C07398h.A09 : C07398h.A09.A06();
        AbstractC1314Vy abstractC1314VyA08 = AbstractC1314Vy.A01().A09(this.A0F, ro2.A0F).A08(Integer.valueOf(this.A04), Integer.valueOf(ro2.A04), AbstractC1294Vc.A03().A06()).A06(this.A05, ro2.A05).A06(this.A07, ro2.A07).A09(this.A0D, ro2.A0D).A09(this.A0C, ro2.A0C).A08(Integer.valueOf(this.A02), Integer.valueOf(ro2.A02), AbstractC1294Vc.A03().A06()).A06(this.A03, ro2.A03).A09(this.A0E, ro2.A0E).A08(Integer.valueOf(this.A06), Integer.valueOf(ro2.A06), AbstractC1294Vc.A03().A06());
        Integer numValueOf = Integer.valueOf(this.A00);
        Integer numValueOf2 = Integer.valueOf(ro2.A00);
        if (this.A0A.A0O) {
            AbstractC1294Vc abstractC1294Vc = C07398h.A09;
            String[] strArr = A0I;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0I;
            strArr2[0] = "uf4QuxhNclx1RplB85CZ2PCc23e9qoPA";
            strArr2[1] = "vBsICpyRH4MkJ3FKcDCosYbe40sdLBiY";
            abstractC1294VcA06 = abstractC1294Vc.A06();
        } else {
            abstractC1294VcA06 = C07398h.A0A;
        }
        AbstractC1314Vy abstractC1314VyA082 = abstractC1314VyA08.A08(numValueOf, numValueOf2, abstractC1294VcA06).A09(this.A0H, ro2.A0H).A09(this.A0G, ro2.A0G).A08(Integer.valueOf(this.A01), Integer.valueOf(ro2.A01), abstractC1294VcA062).A08(Integer.valueOf(this.A08), Integer.valueOf(ro2.A08), abstractC1294VcA062);
        Integer numValueOf3 = Integer.valueOf(this.A00);
        Integer numValueOf4 = Integer.valueOf(ro2.A00);
        if (!N1.A1E(this.A0B, ro2.A0B)) {
            abstractC1294VcA062 = C07398h.A0A;
        }
        int iA05 = abstractC1314VyA082.A08(numValueOf3, numValueOf4, abstractC1294VcA062).A05();
        if (A0I[2].length() != 20) {
            return iA05;
        }
        A0I[3] = "0hmH2ynyvjQ4qO";
        return iA05;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.WT
    /* renamed from: A04, reason: merged with bridge method [inline-methods] */
    public final boolean A09(RO ro2) {
        if ((this.A0A.A00 || (super.A02.A06 != -1 && super.A02.A06 == ((WT) ro2).A02.A06)) && (this.A0A.A02 || (super.A02.A0W != null && TextUtils.equals(super.A02.A0W, ((WT) ro2).A02.A0W)))) {
            boolean z11 = this.A0A.A03;
            String[] strArr = A0I;
            if (strArr[0].charAt(18) != strArr[1].charAt(18)) {
                throw new RuntimeException();
            }
            A0I[2] = "h02XvMyQLjLLGXpJVBMi";
            if ((z11 || (super.A02.A0G != -1 && super.A02.A0G == ((WT) ro2).A02.A0G)) && (this.A0A.A01 || (this.A0H == ro2.A0H && this.A0G == ro2.A0G))) {
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.WT
    public final int A08() {
        return this.A09;
    }
}
