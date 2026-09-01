package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hp5 implements d55 {
    public final /* synthetic */ ArrayList a;
    public final /* synthetic */ float b;
    public final /* synthetic */ stc c;
    public final /* synthetic */ md3 d;
    public final /* synthetic */ k8b e;

    public hp5(ArrayList arrayList, float f, stc stcVar, md3 md3Var, k8b k8bVar) {
        this.a = arrayList;
        this.b = f;
        this.c = stcVar;
        this.d = md3Var;
        this.e = k8bVar;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        boolean z;
        boolean z2;
        xr6 xr6Var = (xr6) obj;
        int iIntValue = ((Number) obj2).intValue();
        x12 x12Var = (x12) obj3;
        int iIntValue2 = ((Number) obj4).intValue();
        if ((iIntValue2 & 6) == 0) {
            i = (((p65) x12Var).f(xr6Var) ? 4 : 2) | iIntValue2;
        } else {
            i = iIntValue2;
        }
        if ((iIntValue2 & 48) == 0) {
            i |= ((p65) x12Var).d(iIntValue) ? 32 : 16;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(i & 1, (i & 147) != 146)) {
            op5 op5Var = (op5) this.a.get(iIntValue);
            p65Var.Y(-2005566849);
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), km4.k(xr6Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (iIntValue > 0) {
                p65Var.Y(1253894322);
                tp7.c(0.0f, 0, 6, 0L, p65Var, w2g.E(o28Var, this.b, 0.0f, 2));
                z = false;
            } else {
                z = false;
                p65Var.Y(1232038764);
            }
            p65Var.p(z);
            boolean z3 = op5Var instanceof mp5;
            md3 md3Var = this.d;
            if (z3) {
                p65Var.Y(1254099666);
                il7.k(((mp5) op5Var).a, this.c, md3Var, null, null, p65Var, 0, 24);
                z2 = false;
                p65Var.p(false);
            } else {
                if (!(op5Var instanceof np5)) {
                    throw ho2.L(p65Var, 179000624, false);
                }
                p65Var.Y(1254403218);
                lk7.o(((np5) op5Var).a, this.e, md3Var, ((zo7) p65Var.j(kt7.b)).n, null, p65Var, 0, 16);
                z2 = false;
                p65Var.p(false);
            }
            b09.H(p65Var, true, true, z2);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
