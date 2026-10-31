package androidx.recyclerview.widget;

/* loaded from: classes.dex */
public final class j3 {

    /* renamed from: a, reason: collision with root package name */
    public final z.c1 f15009a = new z.c1(0);

    /* renamed from: b, reason: collision with root package name */
    public final z.v f15010b = new z.v((Object) null);

    public final void a(s2 s2Var, t1 t1Var) {
        z.c1 c1Var = this.f15009a;
        h3 h3VarA = (h3) c1Var.get(s2Var);
        if (h3VarA == null) {
            h3VarA = h3.a();
            c1Var.put(s2Var, h3VarA);
        }
        h3VarA.f14992c = t1Var;
        h3VarA.f14990a |= 8;
    }

    public final t1 b(s2 s2Var, int i5) {
        h3 h3Var;
        t1 t1Var;
        z.c1 c1Var = this.f15009a;
        int iD = c1Var.d(s2Var);
        if (iD >= 0 && (h3Var = (h3) c1Var.j(iD)) != null) {
            int i11 = h3Var.f14990a;
            if ((i11 & i5) != 0) {
                int i12 = i11 & (~i5);
                h3Var.f14990a = i12;
                if (i5 == 4) {
                    t1Var = h3Var.f14991b;
                } else {
                    if (i5 != 8) {
                        throw new IllegalArgumentException("Must provide flag PRE or POST");
                    }
                    t1Var = h3Var.f14992c;
                }
                if ((i12 & 12) == 0) {
                    c1Var.h(iD);
                    h3Var.f14990a = 0;
                    h3Var.f14991b = null;
                    h3Var.f14992c = null;
                    h3.f14989d.n(h3Var);
                }
                return t1Var;
            }
        }
        return null;
    }

    public final void c(s2 s2Var) {
        h3 h3Var = (h3) this.f15009a.get(s2Var);
        if (h3Var == null) {
            return;
        }
        h3Var.f14990a &= -2;
    }

    public final void d(s2 s2Var) {
        z.v vVar = this.f15010b;
        int iG = vVar.g() - 1;
        while (true) {
            if (iG < 0) {
                break;
            }
            if (s2Var == vVar.h(iG)) {
                Object[] objArr = vVar.f97844c;
                Object obj = objArr[iG];
                Object obj2 = z.w.f97848a;
                if (obj != obj2) {
                    objArr[iG] = obj2;
                    vVar.f97842a = true;
                }
            } else {
                iG--;
            }
        }
        h3 h3Var = (h3) this.f15009a.remove(s2Var);
        if (h3Var != null) {
            h3Var.f14990a = 0;
            h3Var.f14991b = null;
            h3Var.f14992c = null;
            h3.f14989d.n(h3Var);
        }
    }
}
