package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class RI extends WT<RI> implements Comparable<RI> {
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final boolean A05;
    public final boolean A06;
    public final boolean A07;
    public final boolean A08;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static int A01(List<RI> list, List<RI> list2) {
        return list.get(0).compareTo(list2.get(0));
    }

    public RI(int i5, U8 u82, int i11, C07408i c07408i, int i12, String str) {
        List<String> listA03;
        super(i5, u82, i11);
        int i13 = 0;
        this.A08 = C07398h.A0S(i12, false);
        int i14 = super.A02.A0H & (~((U1) c07408i).A00);
        this.A06 = (i14 & 1) != 0;
        this.A07 = (i14 & 2) != 0;
        int i15 = LayoutNode.NotPlacedPlaceOrder;
        int bestLanguageScore = 0;
        if (c07408i.A0K.isEmpty()) {
            listA03 = XR.A03(b.f42142b);
        } else {
            listA03 = c07408i.A0K;
        }
        int bestLanguageIndex = 0;
        while (true) {
            if (bestLanguageIndex >= listA03.size()) {
                break;
            }
            int iA02 = C07398h.A02(super.A02, listA03.get(bestLanguageIndex), c07408i.A0P);
            if (iA02 > 0) {
                i15 = bestLanguageIndex;
                bestLanguageScore = iA02;
                break;
            }
            bestLanguageIndex++;
        }
        this.A00 = i15;
        this.A01 = bestLanguageScore;
        this.A02 = C07398h.A00(super.A02.A0E, ((U1) c07408i).A0C);
        this.A05 = (super.A02.A0E & 1088) != 0;
        this.A03 = C07398h.A02(super.A02, str, C07398h.A0K(str) == null);
        boolean z11 = this.A01 > 0 || (c07408i.A0K.isEmpty() && this.A02 > 0) || this.A06 || (this.A07 && this.A03 > 0);
        if (C07398h.A0S(i12, c07408i.A0B) && z11) {
            i13 = 1;
        }
        this.A04 = i13;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.lang.Comparable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compareTo(RI ri2) {
        AbstractC1314Vy abstractC1314VyA06 = AbstractC1314Vy.A01().A09(this.A08, ri2.A08).A08(Integer.valueOf(this.A00), Integer.valueOf(ri2.A00), AbstractC1294Vc.A03().A06()).A06(this.A01, ri2.A01).A06(this.A02, ri2.A02).A09(this.A06, ri2.A06).A08(Boolean.valueOf(this.A07), Boolean.valueOf(ri2.A07), this.A01 == 0 ? AbstractC1294Vc.A03() : AbstractC1294Vc.A03().A06()).A06(this.A03, ri2.A03);
        if (this.A02 == 0) {
            abstractC1314VyA06 = abstractC1314VyA06.A0A(this.A05, ri2.A05);
        }
        return abstractC1314VyA06.A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<com.facebook.ads.androidx.media3.exoplayer.trackselection.DefaultTrackSelector$TextTrackInfo> */
    public static AbstractC07549l<RI> A02(int i5, U8 u82, C07408i c07408i, int[] iArr, String str) {
        C06344e c06344eA01 = AbstractC07549l.A01();
        for (int i11 = 0; i11 < u82.A01; i11++) {
            c06344eA01.A04(new RI(i5, u82, i11, c07408i, iArr[i11], str));
        }
        return c06344eA01.A05();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.WT
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public final boolean A09(RI ri2) {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.WT
    public final int A08() {
        return this.A04;
    }
}
