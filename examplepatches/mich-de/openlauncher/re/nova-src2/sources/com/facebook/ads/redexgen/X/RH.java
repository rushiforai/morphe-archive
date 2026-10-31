package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class RH extends WT<RH> {
    public static String[] A0H = {"M", "eiCoMS0B1NS75IHdkKjmmSEk8V7XJo6R", "MHaFb4K7cS0D09ebPHFZEdXLD", "7", "H", "edZGWAqUUBsDDpq2lfAjvFAJjKauvcUn", "h8RIemLK21YaGGwPwjZOAzN", "bo2sNdf3z"};
    public final int A00;
    public final int A01;
    public final int A02;

    @MetaExoPlayerCustomization
    public final int A03;

    @MetaExoPlayerCustomization
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final C07408i A09;
    public final boolean A0A;
    public final boolean A0B;
    public final boolean A0C;
    public final boolean A0D;
    public final boolean A0E;
    public final boolean A0F;
    public final boolean A0G;

    @MetaExoPlayerCustomization
    public RH(int i5, U8 u82, int i11, C07408i c07408i, int i12, String str, int i13, boolean z11) {
        int requiredAdaptiveSupport;
        super(i5, u82, i11);
        this.A09 = c07408i;
        if (c07408i.A07) {
            requiredAdaptiveSupport = 24;
        } else {
            requiredAdaptiveSupport = 16;
        }
        this.A0A = c07408i.A06 && (i13 & requiredAdaptiveSupport) != 0;
        this.A0C = z11 && (super.A02.A0L == -1 || super.A02.A0L <= ((U1) c07408i).A06) && ((super.A02.A0A == -1 || super.A02.A0A <= ((U1) c07408i).A05) && ((super.A02.A01 == -1.0f || super.A02.A01 <= ((float) ((U1) c07408i).A04)) && (super.A02.A05 == -1 || super.A02.A05 <= ((U1) c07408i).A03)));
        this.A0D = z11 && (super.A02.A0L == -1 || super.A02.A0L >= ((U1) c07408i).A0A) && ((super.A02.A0A == -1 || super.A02.A0A >= ((U1) c07408i).A09) && ((super.A02.A01 == -1.0f || super.A02.A01 >= ((float) ((U1) c07408i).A08)) && (super.A02.A05 == -1 || super.A02.A05 >= ((U1) c07408i).A07)));
        this.A0E = C07398h.A0S(i12, false);
        int bestLanguageIndex = 0;
        int i14 = LayoutNode.NotPlacedPlaceOrder;
        int i15 = 0;
        while (true) {
            if (i15 >= c07408i.A0L.size()) {
                break;
            }
            int iA02 = C07398h.A02(super.A02, c07408i.A0L.get(i15), false);
            if (iA02 > 0) {
                i14 = i15;
                bestLanguageIndex = iA02;
                break;
            }
            i15++;
        }
        this.A03 = i14;
        this.A04 = bestLanguageIndex;
        this.A00 = super.A02.A05;
        this.A02 = super.A02.A06();
        this.A06 = C07398h.A00(super.A02.A0E, ((U1) c07408i).A0D);
        this.A0B = super.A02.A0E == 0 || (super.A02.A0E & 1) != 0;
        this.A07 = C07398h.A02(super.A02, str, C07398h.A0K(str) == null);
        int i16 = LayoutNode.NotPlacedPlaceOrder;
        int i17 = 0;
        while (true) {
            if (i17 < c07408i.A0M.size()) {
                if (super.A02.A0W != null && super.A02.A0W.equals(c07408i.A0M.get(i17))) {
                    i16 = i17;
                    break;
                }
                i17++;
            } else {
                break;
            }
        }
        this.A05 = i16;
        this.A0G = PX.A02(i12) == 128;
        this.A0F = PX.A04(i12) == 64;
        this.A01 = C07398h.A07(super.A02.A0W);
        this.A08 = A00(i12, requiredAdaptiveSupport);
    }

    private int A00(int i5, int i11) {
        if ((super.A02.A0E & ReaderJsonLexerKt.BATCH_SIZE) != 0 || !C07398h.A0S(i5, this.A09.A0B)) {
            return 0;
        }
        if (!this.A0C && !this.A09.A0C) {
            return 0;
        }
        if (C07398h.A0S(i5, false) && this.A0D) {
            boolean z11 = this.A0C;
            if (A0H[4].length() == 29) {
                throw new RuntimeException();
            }
            A0H[4] = "cQBv6Gw35";
            if (z11 && super.A02.A05 != -1 && !this.A09.A0N && !this.A09.A0O && (i5 & i11) != 0) {
                return 2;
            }
        }
        return 1;
    }

    @MetaExoPlayerCustomization
    public static int A01(RH rh2, RH rh3) {
        AbstractC1314Vy abstractC1314VyA09 = AbstractC1314Vy.A01().A09(rh2.A0E, rh3.A0E).A08(Integer.valueOf(rh2.A03), Integer.valueOf(rh3.A03), AbstractC1294Vc.A03().A06()).A06(rh2.A04, rh3.A04).A06(rh2.A06, rh3.A06).A09(rh2.A0B, rh3.A0B).A06(rh2.A07, rh3.A07).A09(rh2.A0C, rh3.A0C).A09(rh2.A0D, rh3.A0D).A08(Integer.valueOf(rh2.A05), Integer.valueOf(rh3.A05), AbstractC1294Vc.A03().A06()).A09(rh2.A0G, rh3.A0G).A09(rh2.A0F, rh3.A0F);
        if (rh2.A0G && rh2.A0F) {
            abstractC1314VyA09 = abstractC1314VyA09.A06(rh2.A01, rh3.A01);
        }
        return abstractC1314VyA09.A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<java.lang.Integer> */
    public static int A02(RH rh2, RH rh3) {
        AbstractC1294Vc abstractC1294VcA06;
        AbstractC1294Vc abstractC1294VcA062;
        if (!rh2.A0C || !rh2.A0E) {
            AbstractC1294Vc abstractC1294Vc = C07398h.A09;
            if (A0H[4].length() != 29) {
                String[] strArr = A0H;
                strArr[3] = "6";
                strArr[0] = "u";
                abstractC1294VcA06 = abstractC1294Vc.A06();
            } else {
                abstractC1294VcA06 = abstractC1294Vc.A06();
            }
        } else {
            abstractC1294VcA06 = C07398h.A09;
        }
        AbstractC1314Vy abstractC1314VyA01 = AbstractC1314Vy.A01();
        Integer numValueOf = Integer.valueOf(rh2.A00);
        Integer numValueOf2 = Integer.valueOf(rh3.A00);
        C07408i c07408i = rh2.A09;
        if (A0H[1].charAt(14) == 'b') {
            throw new RuntimeException();
        }
        String[] strArr2 = A0H;
        strArr2[7] = "nzfXK0yQO";
        strArr2[2] = "LhwujyBI8CJgLxGyr3cmCtWqM";
        if (c07408i.A0O) {
            abstractC1294VcA062 = C07398h.A09.A06();
        } else {
            abstractC1294VcA062 = C07398h.A0A;
        }
        return abstractC1314VyA01.A08(numValueOf, numValueOf2, abstractC1294VcA062).A08(Integer.valueOf(rh2.A02), Integer.valueOf(rh3.A02), abstractC1294VcA06).A08(Integer.valueOf(rh2.A00), Integer.valueOf(rh3.A00), abstractC1294VcA06).A05();
    }

    public static int A05(List<RH> list, List<RH> list2) {
        return AbstractC1314Vy.A01().A08((RH) Collections.max(list, new Comparator() { // from class: com.facebook.ads.redexgen.X.WU
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A01((RH) obj, (RH) obj2);
            }
        }), (RH) Collections.max(list2, new Comparator() { // from class: com.facebook.ads.redexgen.X.WU
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A01((RH) obj, (RH) obj2);
            }
        }), new Comparator() { // from class: com.facebook.ads.redexgen.X.WU
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A01((RH) obj, (RH) obj2);
            }
        }).A06(list.size(), list2.size()).A08((RH) Collections.max(list, new Comparator() { // from class: com.facebook.ads.redexgen.X.WV
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A02((RH) obj, (RH) obj2);
            }
        }), (RH) Collections.max(list2, new Comparator() { // from class: com.facebook.ads.redexgen.X.WV
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A02((RH) obj, (RH) obj2);
            }
        }), new Comparator() { // from class: com.facebook.ads.redexgen.X.WV
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return RH.A02((RH) obj, (RH) obj2);
            }
        }).A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4e != com.google.common.collect.ImmutableList$Builder<com.facebook.ads.androidx.media3.exoplayer.trackselection.DefaultTrackSelector$VideoTrackInfo> */
    public static AbstractC07549l<RH> A06(int i5, U8 u82, C07408i c07408i, int[] iArr, String str, int maxPixelsToRetainForViewport) {
        int iA03 = C07398h.A03(u82, ((U1) c07408i).A0F, ((U1) c07408i).A0E, c07408i.A0Q);
        C06344e c06344eA01 = AbstractC07549l.A01();
        for (int i11 = 0; i11 < u82.A01; i11++) {
            int iA06 = u82.A08(i11).A06();
            c06344eA01.A04(new RH(i5, u82, i11, c07408i, iArr[i11], str, maxPixelsToRetainForViewport, iA03 == Integer.MAX_VALUE || (iA06 != -1 && iA06 <= iA03)));
        }
        return c06344eA01.A05();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.WT
    /* renamed from: A07, reason: merged with bridge method [inline-methods] */
    public final boolean A09(RH rh2) {
        return (this.A0A || N1.A1E(super.A02.A0W, ((WT) rh2).A02.A0W)) && (this.A09.A05 || (this.A0G == rh2.A0G && this.A0F == rh2.A0F));
    }

    @Override // com.facebook.ads.redexgen.X.WT
    public final int A08() {
        return this.A08;
    }
}
