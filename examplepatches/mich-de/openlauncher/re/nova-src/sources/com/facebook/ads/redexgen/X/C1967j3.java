package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import java.util.ArrayList;

/* renamed from: com.facebook.ads.redexgen.X.j3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1967j3 {
    public static String[] A02 = {"hO0SXlIn7n5HXEBLx", "jESNVpuYnHPlnh4DZ", "CDLwN7DwmtArlNd144q1QIOvLDqs4yZF", "JntNhgZ58kYFXbwiJ6hzeVdvPNGn00kF", "yTsWpbzmHeCmcQEDkb0QkT5J3TV6CkfD", "Lh9pded4Clz2", "gnDNjs3GBImfOnnM5uEQWokXBd1c", "C4tnEN178k9sL9bIxtVolUttiI5dEdE5"};
    public SparseArray<C1966j2> A00 = new SparseArray<>();
    public int A01 = 0;

    private final long A00(long j11, long j12) {
        if (j11 == 0) {
            return j12;
        }
        long j13 = j11 / 4;
        String[] strArr = A02;
        if (strArr[3].charAt(9) != strArr[7].charAt(9)) {
            throw new RuntimeException();
        }
        A02[4] = "GTVZcsVJP0WVKaHbsMtSVk9gu6Gyk4Ss";
        return (j13 * 3) + (j12 / 4);
    }

    private C1966j2 A01(int i5) {
        C1966j2 c1966j2 = this.A00.get(i5);
        if (c1966j2 == null) {
            C1966j2 c1966j22 = new C1966j2();
            this.A00.put(i5, c1966j22);
            return c1966j22;
        }
        return c1966j2;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final void A02() {
        for (int i5 = 0; i5 < i; i5++) {
            this.A00.valueAt(i5).A03.clear();
        }
    }

    public final AbstractC1978jE A03(int i5) {
        C1966j2 c1966j2 = this.A00.get(i5);
        if (c1966j2 != null && !c1966j2.A03.isEmpty()) {
            ArrayList<AbstractC1978jE> arrayList = c1966j2.A03;
            if (A02[4].charAt(1) != 'T') {
                throw new RuntimeException();
            }
            A02[6] = "6zOEmNGiTAHU1v9SGa3";
            return arrayList.remove(arrayList.size() - 1);
        }
        return null;
    }

    public final void A04() {
        this.A01--;
    }

    public final void A05(int i5, long j11) {
        C1966j2 c1966j2A01 = A01(i5);
        c1966j2A01.A01 = A00(c1966j2A01.A01, j11);
    }

    public final void A06(int i5, long j11) {
        C1966j2 c1966j2A01 = A01(i5);
        c1966j2A01.A02 = A00(c1966j2A01.A02, j11);
    }

    public final void A07(AbstractC1948ik abstractC1948ik) {
        this.A01++;
    }

    public final void A08(AbstractC1948ik abstractC1948ik, AbstractC1948ik abstractC1948ik2, boolean z11) {
        if (abstractC1948ik != null) {
            A04();
        }
        if (!z11 && this.A01 == 0) {
            A02();
        }
        if (abstractC1948ik2 != null) {
            A07(abstractC1948ik2);
        }
    }

    public final void A09(AbstractC1978jE abstractC1978jE) {
        int iA0S = abstractC1978jE.A0S();
        ArrayList<AbstractC1978jE> arrayList = A01(iA0S).A03;
        int i5 = this.A00.get(iA0S).A00;
        int viewType = arrayList.size();
        if (i5 <= viewType) {
            return;
        }
        abstractC1978jE.A0b();
        String[] strArr = A02;
        String str = strArr[3];
        String str2 = strArr[7];
        int iCharAt = str.charAt(9);
        int viewType2 = str2.charAt(9);
        if (iCharAt != viewType2) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[1] = "TnDeXYrDbfmyODeGX";
        strArr2[5] = "ziritv0xfrad";
        arrayList.add(abstractC1978jE);
    }

    public final boolean A0A(int i5, long j11, long j12) {
        long j13 = A01(i5).A01;
        return j13 == 0 || j11 + j13 < j12;
    }

    public final boolean A0B(int i5, long j11, long j12) {
        long j13 = A01(i5).A02;
        return j13 == 0 || j11 + j13 < j12;
    }
}
