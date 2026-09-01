package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ms7 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ List c;
    public final /* synthetic */ int d;
    public final /* synthetic */ m73 e;
    public final /* synthetic */ Object f;

    public /* synthetic */ ms7(d55 d55Var, boolean z, List list, int i, m73 m73Var) {
        this.f = d55Var;
        this.b = z;
        this.c = list;
        this.d = i;
        this.e = m73Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long j;
        int i = this.a;
        c1e c1eVar = c1e.a;
        uob uobVar = w12.a;
        final m73 m73Var = this.e;
        final int i2 = this.d;
        final List list = this.c;
        Object obj4 = this.f;
        boolean z = this.b;
        final int i3 = 0;
        final int i4 = 1;
        switch (i) {
            case 0:
                d55 d55Var = (d55) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    Boolean boolValueOf = Boolean.valueOf(z);
                    boolean zH = p65Var.h(list) | p65Var.d(i2) | p65Var.f(m73Var);
                    Object objM = p65Var.M();
                    if (zH || objM == uobVar) {
                        objM = new x45() { // from class: gs7
                            @Override // defpackage.x45
                            public final Object invoke(Object obj5) {
                                int i5 = i3;
                                c1e c1eVar2 = c1e.a;
                                m73 m73Var2 = m73Var;
                                int i6 = i2;
                                List list2 = list;
                                switch (i5) {
                                    case 0:
                                        list2.set(i6, new vj3(m73Var2.N((int) (((s46) obj5).a >> 32))));
                                        break;
                                    default:
                                        qjd qjdVar = (qjd) obj5;
                                        qjdVar.getClass();
                                        list2.set(i6, new vj3(m73Var2.N((int) (qjdVar.c >> 32))));
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var.j0(objM);
                    }
                    d55Var.k(boolValueOf, (x45) objM, p65Var, 0);
                }
                break;
            default:
                String str = (String) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    r28 r28VarC = w2g.C(o28.b, 16.0f);
                    mkd mkdVar = ((eu7) p65Var2.j(kt7.c)).n;
                    if (z) {
                        p65Var2.Y(1277215791);
                        j = ((zo7) p65Var2.j(kt7.b)).n;
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(1277312077);
                        j = ((zo7) p65Var2.j(kt7.b)).o;
                        p65Var2.p(false);
                    }
                    mkd mkdVarA = mkd.a(mkdVar, j, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                    boolean zH2 = p65Var2.h(list) | p65Var2.d(i2) | p65Var2.f(m73Var);
                    Object objM2 = p65Var2.M();
                    if (zH2 || objM2 == uobVar) {
                        objM2 = new x45() { // from class: gs7
                            @Override // defpackage.x45
                            public final Object invoke(Object obj5) {
                                int i5 = i4;
                                c1e c1eVar2 = c1e.a;
                                m73 m73Var2 = m73Var;
                                int i6 = i2;
                                List list2 = list;
                                switch (i5) {
                                    case 0:
                                        list2.set(i6, new vj3(m73Var2.N((int) (((s46) obj5).a >> 32))));
                                        break;
                                    default:
                                        qjd qjdVar = (qjd) obj5;
                                        qjdVar.getClass();
                                        list2.set(i6, new vj3(m73Var2.N((int) (qjdVar.c >> 32))));
                                        break;
                                }
                                return c1eVar2;
                            }
                        };
                        p65Var2.j0(objM2);
                    }
                    kjd.b(str, r28VarC, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, (x45) objM2, mkdVarA, p65Var2, 48, 0, 32764);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ms7(boolean z, String str, List list, int i, m73 m73Var) {
        this.b = z;
        this.f = str;
        this.c = list;
        this.d = i;
        this.e = m73Var;
    }
}
