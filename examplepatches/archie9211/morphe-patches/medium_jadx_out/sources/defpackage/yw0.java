package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yw0 implements w48 {
    public final /* synthetic */ v7c a;
    public final /* synthetic */ m45 b;

    public yw0(v7c v7cVar, m45 m45Var) {
        this.a = v7cVar;
        this.b = m45Var;
    }

    @Override // defpackage.w48
    public final /* synthetic */ int a(y66 y66Var, List list, int i) {
        return ev6.d(this, y66Var, (ArrayList) list, i);
    }

    @Override // defpackage.w48
    public final al7 b(bl7 bl7Var, List list, long j) {
        Integer numValueOf;
        ArrayList arrayList = (ArrayList) list;
        List list2 = (List) arrayList.get(0);
        List list3 = (List) arrayList.get(1);
        List list4 = (List) arrayList.get(2);
        List list5 = (List) arrayList.get(3);
        final int iH = f72.h(j);
        final int iG = f72.g(j);
        long jA = f72.a(j, 0, 0, 0, 0, 10);
        final ArrayList arrayList2 = new ArrayList(list4.size());
        int size = list4.size();
        for (int iQ = 0; iQ < size; iQ = km4.q((tk7) list4.get(iQ), jA, arrayList2, iQ, 1)) {
        }
        final ArrayList arrayList3 = new ArrayList(list2.size());
        int size2 = list2.size();
        for (int iQ2 = 0; iQ2 < size2; iQ2 = km4.q((tk7) list2.get(iQ2), jA, arrayList3, iQ2, 1)) {
        }
        if (arrayList3.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((t99) arrayList3.get(0)).b);
            int size3 = arrayList3.size() - 1;
            if (1 <= size3) {
                int i = 1;
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((t99) arrayList3.get(i)).b);
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i == size3) {
                        break;
                    }
                    i++;
                }
            }
        }
        final int iIntValue = numValueOf != null ? numValueOf.intValue() : 0;
        long jA2 = f72.a(jA, 0, 0, 0, iG - iIntValue, 7);
        final ArrayList arrayList4 = new ArrayList(list3.size());
        int size4 = list3.size();
        for (int iQ3 = 0; iQ3 < size4; iQ3 = km4.q((tk7) list3.get(iQ3), jA2, arrayList4, iQ3, 1)) {
        }
        final ArrayList arrayList5 = new ArrayList(list5.size());
        int size5 = list5.size();
        for (int iQ4 = 0; iQ4 < size5; iQ4 = km4.q((tk7) list5.get(iQ4), jA, arrayList5, iQ4, 1)) {
        }
        final v7c v7cVar = this.a;
        final m45 m45Var = this.b;
        return bl7Var.q0(iH, iG, fy3.a, new x45() { // from class: uw0
            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                Integer numValueOf3;
                Integer numValueOf4;
                Integer numValueOf5;
                int iW0;
                s99 s99Var = (s99) obj;
                ArrayList arrayList6 = arrayList2;
                if (arrayList6.isEmpty()) {
                    numValueOf3 = null;
                } else {
                    numValueOf3 = Integer.valueOf(((t99) arrayList6.get(0)).a);
                    int size6 = arrayList6.size() - 1;
                    if (1 <= size6) {
                        int i2 = 1;
                        while (true) {
                            Integer numValueOf6 = Integer.valueOf(((t99) arrayList6.get(i2)).a);
                            if (numValueOf6.compareTo(numValueOf3) > 0) {
                                numValueOf3 = numValueOf6;
                            }
                            if (i2 == size6) {
                                break;
                            }
                            i2++;
                        }
                    }
                }
                int iIntValue2 = numValueOf3 != null ? numValueOf3.intValue() : 0;
                int i3 = iH;
                int iMax = Math.max(0, (i3 - iIntValue2) / 2);
                ArrayList arrayList7 = arrayList5;
                if (arrayList7.isEmpty()) {
                    numValueOf4 = null;
                } else {
                    numValueOf4 = Integer.valueOf(((t99) arrayList7.get(0)).a);
                    int size7 = arrayList7.size() - 1;
                    if (1 <= size7) {
                        int i4 = 1;
                        while (true) {
                            Integer numValueOf7 = Integer.valueOf(((t99) arrayList7.get(i4)).a);
                            if (numValueOf7.compareTo(numValueOf4) > 0) {
                                numValueOf4 = numValueOf7;
                            }
                            if (i4 == size7) {
                                break;
                            }
                            i4++;
                        }
                    }
                }
                int iIntValue3 = numValueOf4 != null ? numValueOf4.intValue() : 0;
                if (arrayList7.isEmpty()) {
                    numValueOf5 = null;
                } else {
                    numValueOf5 = Integer.valueOf(((t99) arrayList7.get(0)).b);
                    int size8 = arrayList7.size() - 1;
                    if (1 <= size8) {
                        int i5 = 1;
                        while (true) {
                            Integer numValueOf8 = Integer.valueOf(((t99) arrayList7.get(i5)).b);
                            if (numValueOf8.compareTo(numValueOf5) > 0) {
                                numValueOf5 = numValueOf8;
                            }
                            if (i5 == size8) {
                                break;
                            }
                            i5++;
                        }
                    }
                }
                int iIntValue4 = numValueOf5 != null ? numValueOf5.intValue() : 0;
                int i6 = (i3 - iIntValue3) / 2;
                int i7 = ww0.a[v7cVar.c().ordinal()];
                if (i7 == 1) {
                    iW0 = nk7.w0(((Number) m45Var.invoke()).floatValue());
                } else {
                    if (i7 != 2 && i7 != 3) {
                        ygf.a();
                        return null;
                    }
                    iW0 = iG;
                }
                int i8 = iW0 - iIntValue4;
                ArrayList arrayList8 = arrayList4;
                int size9 = arrayList8.size();
                for (int i9 = 0; i9 < size9; i9++) {
                    s99.j(s99Var, (t99) arrayList8.get(i9), 0, iIntValue);
                }
                ArrayList arrayList9 = arrayList3;
                int size10 = arrayList9.size();
                for (int i10 = 0; i10 < size10; i10++) {
                    s99.j(s99Var, (t99) arrayList9.get(i10), 0, 0);
                }
                int size11 = arrayList6.size();
                for (int i11 = 0; i11 < size11; i11++) {
                    s99.j(s99Var, (t99) arrayList6.get(i11), iMax, 0);
                }
                int size12 = arrayList7.size();
                for (int i12 = 0; i12 < size12; i12++) {
                    s99.j(s99Var, (t99) arrayList7.get(i12), i6, i8);
                }
                return c1e.a;
            }
        });
    }

    @Override // defpackage.w48
    public final /* synthetic */ int c(y66 y66Var, List list, int i) {
        return ev6.h(this, y66Var, (ArrayList) list, i);
    }

    @Override // defpackage.w48
    public final /* synthetic */ int d(y66 y66Var, List list, int i) {
        return ev6.b(this, y66Var, (ArrayList) list, i);
    }

    @Override // defpackage.w48
    public final /* synthetic */ int e(y66 y66Var, List list, int i) {
        return ev6.f(this, y66Var, (ArrayList) list, i);
    }
}
