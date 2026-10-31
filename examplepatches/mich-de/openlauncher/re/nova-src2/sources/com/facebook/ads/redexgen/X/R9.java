package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.facebook.ads.androidx.media3.common.Timeline;

/* loaded from: assets/audience_network/classes.dex */
public abstract class R9 extends AbstractC1323Wi {
    public C1316Wa A00;

    public abstract Pair<C1154Ph[], RA[]> A0d(C1316Wa c1316Wa, int[][][] iArr, int[] iArr2, C1202Rk c1202Rk, Timeline timeline) throws AnonymousClass96;

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /* JADX WARN: Incorrect condition in loop: B:7:0x000d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A0Y(InterfaceC1153Pe[] interfaceC1153PeArr, U8 u82, int[] iArr, boolean z11) throws AnonymousClass96 {
        int length = interfaceC1153PeArr.length;
        int formatSupportLevel = 0;
        int i5 = 1;
        for (int i11 = 0; i11 < bestRendererIndex; i11++) {
            InterfaceC1153Pe interfaceC1153Pe = interfaceC1153PeArr[i11];
            int iMax = 0;
            for (int bestFormatSupportLevel = 0; bestFormatSupportLevel < bestRendererIndex; bestFormatSupportLevel++) {
                int bestRendererIndex = interfaceC1153Pe.ALf(u82.A08(bestFormatSupportLevel));
                iMax = Math.max(iMax, PX.A03(bestRendererIndex));
            }
            int bestRendererIndex2 = iArr[i11];
            int bestRendererIndex3 = bestRendererIndex2 == 0 ? 1 : 0;
            if (iMax > formatSupportLevel || (iMax == formatSupportLevel && z11 && i5 == 0 && bestRendererIndex3 != 0)) {
                length = i11;
                formatSupportLevel = iMax;
                i5 = bestRendererIndex3;
            }
        }
        return length;
    }

    public static int[] A0Z(InterfaceC1153Pe interfaceC1153Pe, U8 u82) throws AnonymousClass96 {
        int[] iArr = new int[u82.A01];
        for (int i5 = 0; i5 < u82.A01; i5++) {
            iArr[i5] = interfaceC1153Pe.ALf(u82.A08(i5));
        }
        return iArr;
    }

    public static int[] A0a(InterfaceC1153Pe[] interfaceC1153PeArr) throws AnonymousClass96 {
        int[] iArr = new int[interfaceC1153PeArr.length];
        for (int i5 = 0; i5 < iArr.length; i5++) {
            iArr[i5] = interfaceC1153PeArr[i5].ALh();
        }
        return iArr;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1323Wi
    public final C1324Wj A0b(InterfaceC1153Pe[] interfaceC1153PeArr, RY ry2, C1202Rk c1202Rk, Timeline timeline) throws AnonymousClass96 {
        int[] iArrA0Z;
        int[] iArr = new int[interfaceC1153PeArr.length + 1];
        U8[][] u8Arr = new U8[interfaceC1153PeArr.length + 1][];
        int[][][] iArr2 = new int[interfaceC1153PeArr.length + 1][][];
        for (int i5 = 0; i5 < u8Arr.length; i5++) {
            u8Arr[i5] = new U8[ry2.A01];
            iArr2[i5] = new int[ry2.A01][];
        }
        int[] iArrA0a = A0a(interfaceC1153PeArr);
        for (int i11 = 0; i11 < ry2.A01; i11++) {
            U8 u8A05 = ry2.A05(i11);
            int groupIndex = A0Y(interfaceC1153PeArr, u8A05, iArr, u8A05.A02 == 5);
            if (groupIndex == interfaceC1153PeArr.length) {
                iArrA0Z = new int[u8A05.A01];
            } else {
                iArrA0Z = A0Z(interfaceC1153PeArr[groupIndex], u8A05);
            }
            int i12 = iArr[groupIndex];
            u8Arr[groupIndex][i12] = u8A05;
            iArr2[groupIndex][i12] = iArrA0Z;
            iArr[groupIndex] = iArr[groupIndex] + 1;
        }
        RY[] ryArr = new RY[interfaceC1153PeArr.length];
        String[] strArr = new String[interfaceC1153PeArr.length];
        int[] iArr3 = new int[interfaceC1153PeArr.length];
        for (int i13 = 0; i13 < interfaceC1153PeArr.length; i13++) {
            int i14 = iArr[i13];
            ryArr[i13] = new RY((U8[]) N1.A1I(u8Arr[i13], i14));
            iArr2[i13] = (int[][]) N1.A1I(iArr2[i13], i14);
            strArr[i13] = interfaceC1153PeArr[i13].getName();
            iArr3[i13] = interfaceC1153PeArr[i13].AA0();
        }
        C1316Wa c1316Wa = new C1316Wa(strArr, iArr3, ryArr, iArrA0a, iArr2, new RY((U8[]) N1.A1I(u8Arr[interfaceC1153PeArr.length], iArr[interfaceC1153PeArr.length])));
        Pair<C1154Ph[], RA[]> pairA0d = A0d(c1316Wa, iArr2, iArrA0a, c1202Rk, timeline);
        return new C1324Wj((C1154Ph[]) pairA0d.first, (RA[]) pairA0d.second, AbstractC1320Wf.A00(c1316Wa, (InterfaceC1318Wc[]) pairA0d.second), c1316Wa);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1323Wi
    public final void A0c(Object obj) {
        this.A00 = (C1316Wa) obj;
    }
}
