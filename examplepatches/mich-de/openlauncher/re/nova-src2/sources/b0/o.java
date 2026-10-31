package b0;

import java.util.List;
import kotlin.Unit;
import p1.s2;

/* loaded from: classes2.dex */
public final class o implements z2.r0 {

    /* renamed from: a, reason: collision with root package name */
    public final w f16195a;

    public o(w wVar) {
        this.f16195a = wVar;
    }

    @Override // z2.r0
    public final int a(z2.t tVar, List list, int i5) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((z2.s) list.get(0)).E(i5));
            int iK = ul.b.K(list);
            int i11 = 1;
            if (1 <= iK) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((z2.s) list.get(i11)).E(i5));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i11 == iK) {
                        break;
                    }
                    i11++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }

    @Override // z2.r0
    public final int b(z2.t tVar, List list, int i5) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((z2.s) list.get(0)).F(i5));
            int iK = ul.b.K(list);
            int i11 = 1;
            if (1 <= iK) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((z2.s) list.get(i11)).F(i5));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i11 == iK) {
                        break;
                    }
                    i11++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }

    @Override // z2.r0
    public final int c(z2.t tVar, List list, int i5) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((z2.s) list.get(0)).t(i5));
            int iK = ul.b.K(list);
            int i11 = 1;
            if (1 <= iK) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((z2.s) list.get(i11)).t(i5));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i11 == iK) {
                        break;
                    }
                    i11++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }

    @Override // z2.r0
    public final int d(z2.t tVar, List list, int i5) {
        Integer numValueOf;
        if (list.isEmpty()) {
            numValueOf = null;
        } else {
            numValueOf = Integer.valueOf(((z2.s) list.get(0)).b(i5));
            int iK = ul.b.K(list);
            int i11 = 1;
            if (1 <= iK) {
                while (true) {
                    Integer numValueOf2 = Integer.valueOf(((z2.s) list.get(i11)).b(i5));
                    if (numValueOf2.compareTo(numValueOf) > 0) {
                        numValueOf = numValueOf2;
                    }
                    if (i11 == iK) {
                        break;
                    }
                    i11++;
                }
            }
        }
        if (numValueOf != null) {
            return numValueOf.intValue();
        }
        return 0;
    }

    @Override // z2.r0
    public final z2.s0 e(z2.t0 t0Var, List list, long j11) {
        z2.i1 i1Var;
        int i5;
        z2.i1 i1Var2;
        int i11;
        int i12;
        int size = list.size();
        z2.i1[] i1VarArr = new z2.i1[size];
        List list2 = list;
        int size2 = list2.size();
        long j12 = 0;
        int i13 = 0;
        while (true) {
            i1Var = null;
            i5 = 1;
            if (i13 >= size2) {
                break;
            }
            z2.q0 q0Var = (z2.q0) list.get(i13);
            Object objK = q0Var.k();
            s sVar = objK instanceof s ? (s) objK : null;
            if (sVar != null && ((Boolean) ((s2) sVar.f16228a).getValue()).booleanValue()) {
                z2.i1 i1VarH = q0Var.H(j11);
                Unit unit = Unit.f71706a;
                i1VarArr[i13] = i1VarH;
                j12 = (i1VarH.f98082b & 4294967295L) | (i1VarH.f98081a << 32);
            }
            i13++;
        }
        int size3 = list2.size();
        for (int i14 = 0; i14 < size3; i14++) {
            z2.q0 q0Var2 = (z2.q0) list.get(i14);
            if (i1VarArr[i14] == null) {
                i1VarArr[i14] = q0Var2.H(j11);
            }
        }
        if (t0Var.l()) {
            i11 = (int) (j12 >> 32);
        } else {
            if (size == 0) {
                i1Var2 = null;
            } else {
                i1Var2 = i1VarArr[0];
                int i15 = size - 1;
                if (i15 != 0) {
                    int i16 = i1Var2 != null ? i1Var2.f98081a : 0;
                    if (1 <= i15) {
                        int i17 = 1;
                        while (true) {
                            z2.i1 i1Var3 = i1VarArr[i17];
                            int i18 = i1Var3 != null ? i1Var3.f98081a : 0;
                            if (i16 < i18) {
                                i1Var2 = i1Var3;
                                i16 = i18;
                            }
                            if (i17 == i15) {
                                break;
                            }
                            i17++;
                        }
                    }
                }
            }
            i11 = i1Var2 != null ? i1Var2.f98081a : 0;
        }
        if (t0Var.l()) {
            i12 = (int) (j12 & 4294967295L);
        } else {
            if (size != 0) {
                i1Var = i1VarArr[0];
                int i19 = size - 1;
                if (i19 != 0) {
                    int i21 = i1Var != null ? i1Var.f98082b : 0;
                    if (1 <= i19) {
                        while (true) {
                            z2.i1 i1Var4 = i1VarArr[i5];
                            int i22 = i1Var4 != null ? i1Var4.f98082b : 0;
                            if (i21 < i22) {
                                i1Var = i1Var4;
                                i21 = i22;
                            }
                            if (i5 == i19) {
                                break;
                            }
                            i5++;
                        }
                    }
                }
            }
            i12 = i1Var != null ? i1Var.f98082b : 0;
        }
        if (!t0Var.l()) {
            ((s2) this.f16195a.f16268c).setValue(new y3.m((i11 << 32) | (i12 & 4294967295L)));
        }
        return t0Var.y(i11, i12, b70.h.f17594a, new n(i1VarArr, this, i11, i12));
    }
}
