package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yl1 implements zk7 {
    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        int size = list.size();
        int iN = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iN += ((tk7) list.get(i2)).n(i);
        }
        return iN;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        Object obj;
        Object obj2;
        int size = list.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                obj = null;
                break;
            }
            obj = list.get(i);
            if (g76.L(kng.F((tk7) obj), "leadingIcon")) {
                break;
            }
            i++;
        }
        tk7 tk7Var = (tk7) obj;
        final t99 t99VarS = tk7Var != null ? tk7Var.s(f72.a(j, 0, 0, 0, 0, 10)) : null;
        int i2 = t99VarS != null ? t99VarS.a : 0;
        final int i3 = t99VarS != null ? t99VarS.b : 0;
        int size2 = list.size();
        int i4 = 0;
        while (true) {
            if (i4 >= size2) {
                obj2 = null;
                break;
            }
            obj2 = list.get(i4);
            if (g76.L(kng.F((tk7) obj2), "trailingIcon")) {
                break;
            }
            i4++;
        }
        tk7 tk7Var2 = (tk7) obj2;
        final t99 t99VarS2 = tk7Var2 != null ? tk7Var2.s(f72.a(j, 0, 0, 0, 0, 10)) : null;
        int i5 = t99VarS2 != null ? t99VarS2.a : 0;
        final int i6 = t99VarS2 != null ? t99VarS2.b : 0;
        int size3 = list.size();
        int i7 = 0;
        while (i7 < size3) {
            tk7 tk7Var3 = (tk7) list.get(i7);
            if (g76.L(kng.F(tk7Var3), "label")) {
                final t99 t99VarS3 = tk7Var3.s(h72.j(-(i2 + i5), 0, 2, j));
                int i8 = t99VarS3.a + i2 + i5;
                final int iMax = Math.max(i3, Math.max(t99VarS3.b, i6));
                final int i9 = i2;
                return bl7Var.q0(i8, iMax, fy3.a, new x45() { // from class: xl1
                    @Override // defpackage.x45
                    public final Object invoke(Object obj3) {
                        s99 s99Var = (s99) obj3;
                        t99 t99Var = t99VarS;
                        int i10 = iMax;
                        if (t99Var != null) {
                            s99.j(s99Var, t99Var, 0, Math.round(((i10 - i3) / 2.0f) * 1.0f));
                        }
                        t99 t99Var2 = t99VarS3;
                        int i11 = i9;
                        s99.j(s99Var, t99Var2, i11, 0);
                        t99 t99Var3 = t99VarS2;
                        if (t99Var3 != null) {
                            s99.j(s99Var, t99Var3, i11 + t99Var2.a, Math.round(((i10 - i6) / 2.0f) * 1.0f));
                        }
                        return c1e.a;
                    }
                });
            }
            i7++;
            t99VarS = t99VarS;
            i2 = i2;
        }
        z27.c("Collection contains no element matching the predicate.");
        z72.b();
        return null;
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        int size = list.size();
        int iK = 0;
        for (int i2 = 0; i2 < size; i2++) {
            iK += ((tk7) list.get(i2)).k(i);
        }
        return iK;
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).a(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).a(i));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i2 == size) {
                        break;
                    }
                    i2++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).L(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).L(i));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i2 == size) {
                        break;
                    }
                    i2++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }
}
