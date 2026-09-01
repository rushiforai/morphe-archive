package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fhc implements c55 {
    public final /* synthetic */ ihc a;
    public final /* synthetic */ ihc b;
    public final /* synthetic */ l94 c;
    public final /* synthetic */ String d;

    public fhc(ihc ihcVar, ihc ihcVar2, l94 l94Var, String str) {
        this.a = ihcVar;
        this.b = ihcVar2;
        this.c = l94Var;
        this.d = str;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        b55 b55Var = (b55) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).h(b55Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            ihc ihcVar = this.b;
            ihc ihcVar2 = this.a;
            boolean zL = g76.L(ihcVar2, ihcVar);
            wlc wlcVarN = ek7.N(i48.FastEffects, p65Var);
            boolean zF = p65Var.f(ihcVar2);
            l94 l94Var = this.c;
            boolean zH = zF | p65Var.h(l94Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                objM = new nbb(ihcVar2, 10, l94Var);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = yi2.h(!zL ? 1.0f : 0.0f);
                p65Var.j0(objM2);
            }
            ou ouVar = (ou) objM2;
            Boolean boolValueOf = Boolean.valueOf(zL);
            boolean zH2 = p65Var.h(ouVar) | p65Var.g(zL) | p65Var.h(wlcVarN) | p65Var.f(m45Var);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                qa qaVar = new qa(ouVar, zL, wlcVarN, m45Var, (n92) null, 16);
                p65Var.j0(qaVar);
                objM3 = qaVar;
            }
            kyd.k(p65Var, (b55) objM3, boolValueOf);
            xw xwVar = ouVar.c;
            wlc wlcVarN2 = ek7.N(i48.FastSpatial, p65Var);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = yi2.h(zL ? 0.8f : 1.0f);
                p65Var.j0(objM4);
            }
            ou ouVar2 = (ou) objM4;
            Boolean boolValueOf2 = Boolean.valueOf(zL);
            boolean zH3 = p65Var.h(ouVar2) | p65Var.g(zL) | p65Var.h(wlcVarN2);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                lj1 lj1Var = new lj1(ouVar2, zL, wlcVarN2, (n92) null, 10);
                p65Var.j0(lj1Var);
                objM5 = lj1Var;
            }
            kyd.k(p65Var, (b55) objM5, boolValueOf2);
            xw xwVar2 = ouVar2.c;
            r28 r28VarX = xz5.X(o28.b, ((Number) xwVar2.b.getValue()).floatValue(), ((Number) xwVar2.b.getValue()).floatValue(), ((Number) xwVar.b.getValue()).floatValue(), 0.0f, null, 131064);
            boolean zG = p65Var.g(zL) | p65Var.f(ihcVar2);
            String str = this.d;
            boolean zF2 = zG | p65Var.f(str);
            Object objM6 = p65Var.M();
            if (zF2 || objM6 == uobVar) {
                objM6 = new rb(str, ihcVar2, zL, 6);
                p65Var.j0(objM6);
            }
            r28 r28VarA = wxb.a(r28VarX, false, (x45) objM6);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            b55Var.invoke(p65Var, Integer.valueOf(iIntValue & 14));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
