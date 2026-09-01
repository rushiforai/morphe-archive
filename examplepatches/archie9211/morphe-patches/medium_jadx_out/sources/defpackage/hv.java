package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hv implements zk7 {
    public final ov a;

    public hv(ov ovVar) {
        this.a = ovVar;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).n(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).n(i));
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
    public final al7 b(bl7 bl7Var, List list, long j) {
        t99 t99Var;
        int i;
        t99 t99Var2;
        int i2;
        int i3;
        int size = list.size();
        t99[] t99VarArr = new t99[size];
        int size2 = list.size();
        long j2 = 0;
        int i4 = 0;
        while (true) {
            t99Var = null;
            i = 1;
            if (i4 >= size2) {
                break;
            }
            tk7 tk7Var = (tk7) list.get(i4);
            Object objW = tk7Var.w();
            jv jvVar = objW instanceof jv ? (jv) objW : null;
            if (jvVar != null && ((Boolean) jvVar.b.getValue()).booleanValue()) {
                t99 t99VarS = tk7Var.s(j);
                long j3 = (((long) t99VarS.b) & 4294967295L) | (((long) t99VarS.a) << 32);
                t99VarArr[i4] = t99VarS;
                j2 = j3;
            }
            i4++;
        }
        int size3 = list.size();
        for (int i5 = 0; i5 < size3; i5++) {
            tk7 tk7Var2 = (tk7) list.get(i5);
            if (t99VarArr[i5] == null) {
                t99VarArr[i5] = tk7Var2.s(j);
            }
        }
        if (bl7Var.W()) {
            i2 = (int) (j2 >> 32);
        } else {
            if (size == 0) {
                t99Var2 = null;
            } else {
                t99Var2 = t99VarArr[0];
                int i6 = size - 1;
                if (i6 != 0) {
                    int i7 = t99Var2 != null ? t99Var2.a : 0;
                    if (1 <= i6) {
                        int i8 = 1;
                        while (true) {
                            t99 t99Var3 = t99VarArr[i8];
                            int i9 = t99Var3 != null ? t99Var3.a : 0;
                            if (i7 < i9) {
                                t99Var2 = t99Var3;
                                i7 = i9;
                            }
                            if (i8 == i6) {
                                break;
                            }
                            i8++;
                        }
                    }
                }
            }
            i2 = t99Var2 != null ? t99Var2.a : 0;
        }
        if (bl7Var.W()) {
            i3 = (int) (j2 & 4294967295L);
        } else {
            if (size != 0) {
                t99Var = t99VarArr[0];
                int i10 = size - 1;
                if (i10 != 0) {
                    int i11 = t99Var != null ? t99Var.b : 0;
                    if (1 <= i10) {
                        while (true) {
                            t99 t99Var4 = t99VarArr[i];
                            int i12 = t99Var4 != null ? t99Var4.b : 0;
                            if (i11 < i12) {
                                t99Var = t99Var4;
                                i11 = i12;
                            }
                            if (i == i10) {
                                break;
                            }
                            i++;
                        }
                    }
                }
            }
            i3 = t99Var != null ? t99Var.b : 0;
        }
        if (!bl7Var.W()) {
            this.a.c.setValue(new s46((((long) i2) << 32) | (((long) i3) & 4294967295L)));
        }
        return bl7Var.q0(i2, i3, fy3.a, new gv(t99VarArr, this, i2, i3));
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((tk7) list.get(0)).k(i));
            int i2 = 1;
            int size = list.size() - 1;
            if (1 <= size) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((tk7) list.get(i2)).k(i));
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
