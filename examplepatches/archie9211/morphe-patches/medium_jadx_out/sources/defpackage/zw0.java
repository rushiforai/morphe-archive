package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zw0 implements w48 {
    public final /* synthetic */ m45 a;
    public final /* synthetic */ int b;
    public final /* synthetic */ float c;
    public final /* synthetic */ ox0 d;

    public zw0(m45 m45Var, int i, float f, ox0 ox0Var) {
        this.a = m45Var;
        this.b = i;
        this.c = f;
        this.d = ox0Var;
    }

    @Override // defpackage.w48
    public final /* synthetic */ int a(y66 y66Var, List list, int i) {
        return ev6.d(this, y66Var, (ArrayList) list, i);
    }

    @Override // defpackage.w48
    public final al7 b(final bl7 bl7Var, List list, long j) {
        Object obj;
        Object obj2;
        Object obj3;
        Object obj4;
        ArrayList arrayList = (ArrayList) list;
        List list2 = (List) arrayList.get(0);
        int i = 1;
        List list3 = (List) arrayList.get(1);
        List list4 = (List) arrayList.get(2);
        List list5 = (List) arrayList.get(3);
        List list6 = (List) arrayList.get(4);
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
        Object obj5 = null;
        if (arrayList3.isEmpty()) {
            obj = null;
        } else {
            obj = arrayList3.get(0);
            int i2 = ((t99) obj).b;
            int size3 = arrayList3.size() - 1;
            if (1 <= size3) {
                int i3 = 1;
                while (true) {
                    Object obj6 = arrayList3.get(i3);
                    int i4 = ((t99) obj6).b;
                    if (i2 < i4) {
                        obj = obj6;
                        i2 = i4;
                    }
                    if (i3 == size3) {
                        break;
                    }
                    i3++;
                }
            }
        }
        t99 t99Var = (t99) obj;
        final int i5 = t99Var != null ? t99Var.b : 0;
        long jA2 = f72.a(jA, 0, 0, 0, iG - i5, 7);
        final ArrayList arrayList4 = new ArrayList(list3.size());
        int size4 = list3.size();
        for (int iQ3 = 0; iQ3 < size4; iQ3 = km4.q((tk7) list3.get(iQ3), jA2, arrayList4, iQ3, 1)) {
        }
        final ArrayList arrayList5 = new ArrayList(list5.size());
        int size5 = list5.size();
        for (int iQ4 = 0; iQ4 < size5; iQ4 = km4.q((tk7) list5.get(iQ4), jA, arrayList5, iQ4, 1)) {
        }
        if (arrayList5.isEmpty()) {
            obj2 = null;
        } else {
            obj2 = arrayList5.get(0);
            int i6 = ((t99) obj2).a;
            int size6 = arrayList5.size() - 1;
            if (1 <= size6) {
                int i7 = 1;
                while (true) {
                    Object obj7 = arrayList5.get(i7);
                    int i8 = ((t99) obj7).a;
                    if (i6 < i8) {
                        obj2 = obj7;
                        i6 = i8;
                    }
                    if (i7 == size6) {
                        break;
                    }
                    i7++;
                }
            }
        }
        t99 t99Var2 = (t99) obj2;
        final int i9 = t99Var2 != null ? t99Var2.a : 0;
        if (arrayList5.isEmpty()) {
            obj3 = null;
        } else {
            obj3 = arrayList5.get(0);
            int i10 = ((t99) obj3).b;
            int size7 = arrayList5.size() - 1;
            if (1 <= size7) {
                int i11 = 1;
                while (true) {
                    Object obj8 = arrayList5.get(i11);
                    int i12 = ((t99) obj8).b;
                    if (i10 < i12) {
                        obj3 = obj8;
                        i10 = i12;
                    }
                    if (i11 == size7) {
                        break;
                    }
                    i11++;
                }
            }
        }
        t99 t99Var3 = (t99) obj3;
        final int i13 = t99Var3 != null ? t99Var3.b : 0;
        final ArrayList arrayList6 = new ArrayList(list6.size());
        int size8 = list6.size();
        for (int iQ5 = 0; iQ5 < size8; iQ5 = km4.q((tk7) list6.get(iQ5), jA, arrayList6, iQ5, 1)) {
        }
        if (arrayList6.isEmpty()) {
            obj4 = null;
        } else {
            obj4 = arrayList6.get(0);
            int i14 = ((t99) obj4).a;
            int size9 = arrayList6.size() - 1;
            if (1 <= size9) {
                int i15 = 1;
                while (true) {
                    Object obj9 = arrayList6.get(i15);
                    int i16 = ((t99) obj9).a;
                    if (i14 < i16) {
                        obj4 = obj9;
                        i14 = i16;
                    }
                    if (i15 == size9) {
                        break;
                    }
                    i15++;
                }
            }
        }
        t99 t99Var4 = (t99) obj4;
        final int i17 = t99Var4 != null ? t99Var4.a : 0;
        if (!arrayList6.isEmpty()) {
            Object obj10 = arrayList6.get(0);
            int i18 = ((t99) obj10).b;
            int size10 = arrayList6.size() - 1;
            if (1 <= size10) {
                while (true) {
                    Object obj11 = arrayList6.get(i);
                    int i19 = ((t99) obj11).b;
                    if (i18 < i19) {
                        obj10 = obj11;
                        i18 = i19;
                    }
                    if (i == size10) {
                        break;
                    }
                    i++;
                }
            }
            obj5 = obj10;
        }
        t99 t99Var5 = (t99) obj5;
        final int i20 = t99Var5 != null ? t99Var5.b : 0;
        final m45 m45Var = this.a;
        final int i21 = this.b;
        final float f = this.c;
        final ox0 ox0Var = this.d;
        return bl7Var.q0(iH, iG, fy3.a, new x45() { // from class: vw0
            @Override // defpackage.x45
            public final Object invoke(Object obj12) {
                int iI0;
                int i22;
                s99 s99Var = (s99) obj12;
                int iW0 = nk7.w0(((Number) m45Var.invoke()).floatValue());
                int i23 = i21;
                bl7 bl7Var2 = bl7Var;
                int i24 = iH;
                if (i23 == 0) {
                    iI0 = bl7Var2.i0(16.0f);
                } else {
                    int i25 = i9;
                    iI0 = i23 == 1 ? (i24 - i25) / 2 : (i24 - i25) - bl7Var2.i0(16.0f);
                }
                float fZ = bl7Var2.Z(f);
                int i26 = i13;
                int i27 = i26 / 2;
                int iI02 = fZ < ((float) i27) ? (iW0 - i26) - bl7Var2.i0(16.0f) : iW0 - i27;
                int i28 = (i24 - i17) / 2;
                int i29 = xw0.a[((px0) ox0Var.a.g.getValue()).ordinal()];
                int i30 = i20;
                if (i29 == 1) {
                    i22 = iI02 - i30;
                } else {
                    if (i29 != 2) {
                        ygf.a();
                        return null;
                    }
                    i22 = iG - i30;
                }
                ArrayList arrayList7 = arrayList4;
                int size11 = arrayList7.size();
                for (int i31 = 0; i31 < size11; i31++) {
                    s99.j(s99Var, (t99) arrayList7.get(i31), 0, i5);
                }
                ArrayList arrayList8 = arrayList3;
                int size12 = arrayList8.size();
                for (int i32 = 0; i32 < size12; i32++) {
                    s99.j(s99Var, (t99) arrayList8.get(i32), 0, 0);
                }
                ArrayList arrayList9 = arrayList2;
                int size13 = arrayList9.size();
                for (int i33 = 0; i33 < size13; i33++) {
                    s99.j(s99Var, (t99) arrayList9.get(i33), 0, 0);
                }
                ArrayList arrayList10 = arrayList5;
                int size14 = arrayList10.size();
                for (int i34 = 0; i34 < size14; i34++) {
                    s99.j(s99Var, (t99) arrayList10.get(i34), iI0, iI02);
                }
                ArrayList arrayList11 = arrayList6;
                int size15 = arrayList11.size();
                for (int i35 = 0; i35 < size15; i35++) {
                    s99.j(s99Var, (t99) arrayList11.get(i35), i28, i22);
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
