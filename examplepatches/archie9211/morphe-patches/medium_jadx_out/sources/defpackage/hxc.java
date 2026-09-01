package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hxc implements d55 {
    public final /* synthetic */ List a;
    public final /* synthetic */ int b;
    public final /* synthetic */ long c;
    public final /* synthetic */ yrb d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ float f;
    public final /* synthetic */ mkd g;
    public final /* synthetic */ gxc h;
    public final /* synthetic */ jxc i;
    public final /* synthetic */ oya j;
    public final /* synthetic */ hl0 k;

    public hxc(List list, int i, long j, yrb yrbVar, boolean z, float f, mkd mkdVar, gxc gxcVar, jxc jxcVar, oya oyaVar, hl0 hl0Var) {
        this.a = list;
        this.b = i;
        this.c = j;
        this.d = yrbVar;
        this.e = z;
        this.f = f;
        this.g = mkdVar;
        this.h = gxcVar;
        this.i = jxcVar;
        this.j = oyaVar;
        this.k = hl0Var;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
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
            ixc ixcVar = (ixc) this.a.get(iIntValue);
            p65Var.Y(-102122264);
            int i2 = this.b - 1;
            long j = this.c;
            o28 o28Var = o28.b;
            r28 r28VarA = iIntValue == i2 ? o28Var : guc.A(o28Var, new ro(6, j));
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            yrb yrbVar = this.d;
            boolean z = this.e;
            r28 r28VarZ = er7.z(wgf.w(r28VarD, yrbVar, z), yrbVar, 24.0f, z);
            dq1 dq1Var = qb8.f;
            zq0 zq0Var = z46.n;
            omb ombVarA = nmb.a(dq1Var, zq0Var, p65Var, 54);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarZ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String strV = vo7.v(ixcVar.c, p65Var);
            r28 r28VarB = jfc.e(jfc.p(o28Var, this.f), hl0.XXXS.m114getSizeD9Ej5fM() + 32.0f).b(r28VarA);
            r28VarB.getClass();
            jjd.b(strV, bgf.N(w2g.C(guc.A(r28VarB, new ro(5, j)), 16.0f), "subscriber_list_item_date"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, this.g, p65Var, 0, 0, 131068);
            gxc gxcVar = this.h;
            boolean zH = p65Var.h(gxcVar) | p65Var.f(ixcVar);
            jxc jxcVar = this.i;
            boolean zF = zH | p65Var.f(jxcVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new ba3(gxcVar, ixcVar, jxcVar, 3);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.C(jfc.p(hlg.r(o28Var, false, null, null, (m45) objM, 15), this.j.a).b(r28VarA), 16.0f), "subscriber_list_item_user");
            omb ombVarA2 = nmb.a(qb8.a, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            d46.a(ixcVar.d, this.k, bgf.N(o28Var, "subscriber_list_item_avatar"), null, null, null, null, 0.0f, 0, null, null, p65Var, 25008, 0, 4072);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            jjd.b(ixcVar.b, bgf.N(o28Var, "subscriber_list_item_name"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, this.g, p65Var, 48, 0, 131068);
            b09.H(p65Var, true, true, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
