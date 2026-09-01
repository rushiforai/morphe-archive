package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ex0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ ex0(String str, SusiOperation susiOperation, SusiDestination susiDestination, String str2, String str3, boolean z) {
        this.a = 2;
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.c = susiDestination;
        this.g = susiOperation;
        this.b = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        ejd ejdVar;
        hp6 hp6Var;
        hp6 hp6Var2;
        int i = this.a;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        int i2 = 1;
        Object obj2 = this.g;
        Object obj3 = this.c;
        Object obj4 = this.f;
        Object obj5 = this.e;
        Object obj6 = this.d;
        switch (i) {
            case 0:
                v7c v7cVar = (v7c) obj3;
                String str = (String) obj6;
                String str2 = (String) obj5;
                String str3 = (String) obj4;
                sb2 sb2Var = (sb2) obj2;
                jyb jybVar = (jyb) obj;
                if (v7cVar.e.g().a.size() > 1 && z) {
                    w7c w7cVarC = v7cVar.c();
                    w7c w7cVar = w7c.PartiallyExpanded;
                    tl tlVar = v7cVar.e;
                    if (w7cVarC == w7cVar) {
                        if (((Boolean) ((x45) tlVar.d).invoke(w7c.Expanded)).booleanValue()) {
                            dx0 dx0Var = new dx0(sb2Var, v7cVar, i2);
                            fj6[] fj6VarArr = gyb.a;
                            jybVar.d(sxb.t, new i4(str, dx0Var));
                        }
                    } else if (((Boolean) ((x45) tlVar.d).invoke(w7cVar)).booleanValue()) {
                        dx0 dx0Var2 = new dx0(sb2Var, v7cVar, 2);
                        fj6[] fj6VarArr2 = gyb.a;
                        jybVar.d(sxb.u, new i4(str2, dx0Var2));
                    }
                    if (!v7cVar.c) {
                        dx0 dx0Var3 = new dx0(sb2Var, v7cVar, 3);
                        fj6[] fj6VarArr3 = gyb.a;
                        jybVar.d(sxb.v, new i4(str3, dx0Var3));
                    }
                }
                return c1eVar;
            case 1:
                kx6 kx6Var = (kx6) obj3;
                k49 k49Var = kx6Var.o;
                w3f w3fVar = (w3f) obj6;
                lid lidVar = (lid) obj5;
                uid uidVar = (uid) obj4;
                yqa yqaVar = (yqa) obj2;
                hp6 hp6Var3 = (hp6) obj;
                kx6Var.h = hp6Var3;
                rjd rjdVarD = kx6Var.d();
                if (rjdVarD != null) {
                    rjdVarD.b = hp6Var3;
                }
                if (z) {
                    if (kx6Var.a() == ci5.Selection) {
                        if (((Boolean) kx6Var.l.getValue()).booleanValue() && ((Boolean) ((ax6) w3fVar).c.getValue()).booleanValue()) {
                            lidVar.s();
                        } else {
                            lidVar.m();
                        }
                        kx6Var.m.setValue(Boolean.valueOf(gr7.t(lidVar, true)));
                        kx6Var.n.setValue(Boolean.valueOf(gr7.t(lidVar, false)));
                        k49Var.setValue(Boolean.valueOf(bkd.c(uidVar.b)));
                    } else if (kx6Var.a() == ci5.Cursor) {
                        k49Var.setValue(Boolean.valueOf(gr7.t(lidVar, true)));
                    }
                    rv8.K(kx6Var, uidVar, yqaVar);
                    rjd rjdVarD2 = kx6Var.d();
                    if (rjdVarD2 != null && (ejdVar = kx6Var.e) != null && kx6Var.b() && (hp6Var = rjdVarD2.b) != null && hp6Var.m() && (hp6Var2 = rjdVarD2.c) != null) {
                        qjd qjdVar = rjdVarD2.a;
                        k0b k0bVar = new k0b(6, hp6Var);
                        zwa zwaVarH = mk7.H(hp6Var);
                        zwa zwaVarH2 = hp6Var.H(hp6Var2, false);
                        if (g76.L((ejd) ejdVar.a.b.get(), ejdVar)) {
                            ejdVar.b.a(uidVar, yqaVar, qjdVar, k0bVar, zwaVarH, zwaVarH2);
                        }
                    }
                }
                return c1eVar;
            default:
                oq2 oq2Var = (oq2) obj;
                oq2Var.getClass();
                eo2 eo2Var = oq2Var.a;
                a13 a13VarV = eo2Var.b.v();
                ys2 ys2Var = (ys2) eo2Var.e;
                z3d z3dVarC = ys2Var.C();
                ko2 ko2Var = ys2Var.b;
                gzb gzbVar = new gzb(z3dVarC, (gwa) ko2Var.S.get(), (dm4) ko2Var.j.get());
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new me7((String) obj6, (String) obj5, (String) obj4, (SusiDestination) obj3, (SusiOperation) obj2, this.b, a13VarV, gzbVar, r13Var);
        }
    }

    public /* synthetic */ ex0(Object obj, boolean z, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.c = obj;
        this.b = z;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
    }
}
