package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public final class OS implements InterfaceC1506bV {
    public final List<C1564cR> A00;
    public final long[] A01;
    public final long[] A02;

    /* JADX WARN: Incorrect condition in loop: B:4:0x001d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public OS(List<C1564cR> list) {
        this.A00 = Collections.unmodifiableList(new ArrayList(list));
        this.A01 = new long[list.size() * 2];
        for (int i5 = 0; i5 < cueIndex; i5++) {
            C1564cR c1564cR = list.get(i5);
            int i11 = i5 * 2;
            this.A01[i11] = c1564cR.A01;
            int arrayIndex = i11 + 1;
            this.A01[arrayIndex] = c1564cR.A00;
        }
        this.A02 = Arrays.copyOf(this.A01, this.A01.length);
        Arrays.sort(this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (int i5 = 0; i5 < this.A00.size(); i5++) {
            if (this.A01[i5 * 2] <= j11 && j11 < this.A01[(i5 * 2) + 1]) {
                C1564cR c1564cR = this.A00.get(i5);
                if (c1564cR.A02.A01 == -3.4028235E38f) {
                    arrayList2.add(c1564cR);
                } else {
                    arrayList.add(c1564cR.A02);
                }
            }
        }
        Collections.sort(arrayList2, new Comparator() { // from class: com.facebook.ads.redexgen.X.cb
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return Long.compare(((C1564cR) obj).A01, ((C1564cR) obj2).A01);
            }
        });
        for (int i11 = 0; i11 < arrayList2.size(); i11++) {
            arrayList.add(((C1564cR) arrayList2.get(i11)).A02.A02().A07((-1) - i11, 1).A0H());
        }
        return arrayList;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        boolean z11 = true;
        AbstractC1062Ln.A07(i5 >= 0);
        if (i5 >= this.A02.length) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        return this.A02[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return this.A02.length;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        int iA0K = N1.A0K(this.A02, j11, false, false);
        int index = this.A02.length;
        if (iA0K < index) {
            return iA0K;
        }
        return -1;
    }
}
