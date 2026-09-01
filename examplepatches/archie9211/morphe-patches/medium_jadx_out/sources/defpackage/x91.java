package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x91 implements d55 {
    public final /* synthetic */ az5 a;
    public final /* synthetic */ uu6 b;
    public final /* synthetic */ gc1 c;
    public final /* synthetic */ y81 d;
    public final /* synthetic */ sh9 e;
    public final /* synthetic */ int f;

    public x91(az5 az5Var, uu6 uu6Var, gc1 gc1Var, y81 y81Var, sh9 sh9Var, int i) {
        this.a = az5Var;
        this.b = uu6Var;
        this.c = gc1Var;
        this.d = y81Var;
        this.e = sh9Var;
        this.f = i;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i;
        r28 r28VarW;
        boolean z;
        boolean z2;
        boolean z3;
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
            Object obj5 = this.a.get(iIntValue);
            p65Var.Y(-809742896);
            uu6 uu6Var = this.b;
            Integer num = (Integer) uu6Var.e.getValue();
            o28 o28Var = o28.b;
            if (num != null && num.intValue() == iIntValue) {
                p65Var.Y(-809678417);
                vff vffVar = new vff(1.0f);
                boolean zH = p65Var.h(uu6Var);
                Object objM = p65Var.M();
                if (zH || objM == w12.a) {
                    objM = new z(10, uu6Var);
                    p65Var.j0(objM);
                }
                r28VarW = xz5.W(vffVar, (x45) objM);
                p65Var.p(false);
            } else {
                p65Var.Y(-809522270);
                p65Var.p(false);
                r28VarW = o28Var;
            }
            ec1 ec1Var = (ec1) obj5;
            p65Var.Y(-477959594);
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28VarW, 3, 1.0f);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (iIntValue > 0) {
                p65Var.Y(1097653551);
                tp7.c(0.5f, 384, 3, 0L, p65Var, null);
                z = false;
            } else {
                z = false;
                p65Var.Y(1052218339);
            }
            p65Var.p(z);
            if (this.c.n) {
                p65Var.Y(1098707923);
                if (ec1Var instanceof cc1) {
                    p65Var.Y(35444681);
                    y91.e(vo7.R(p65Var, R.string.catalog_detail_story_no_longer_available), null, p65Var, 0);
                    p65Var.p(false);
                } else {
                    if (!(ec1Var instanceof dc1)) {
                        throw ho2.L(p65Var, 35442191, false);
                    }
                    p65Var.Y(35452325);
                    y91.e(((dc1) ec1Var).c.c, null, p65Var, 0);
                    p65Var.p(false);
                }
                p65Var.p(false);
            } else {
                p65Var.Y(1097943680);
                if (ec1Var instanceof cc1) {
                    p65Var.Y(35419840);
                    z3 = false;
                    y91.b((cc1) ec1Var, this.d, null, p65Var, 0);
                    p65Var.p(false);
                } else {
                    if (!(ec1Var instanceof dc1)) {
                        throw ho2.L(p65Var, 35417538, false);
                    }
                    p65Var.Y(35428385);
                    y91.d(this.c, (dc1) ec1Var, this.e, this.d, null, p65Var, 0);
                    z3 = false;
                    p65Var.p(false);
                }
                p65Var.p(z3);
            }
            if (iIntValue < this.f - 1) {
                p65Var.Y(1099279439);
                tp7.c(0.5f, 384, 3, 0L, p65Var, null);
                z2 = false;
            } else {
                z2 = false;
                p65Var.Y(1052218339);
            }
            p65Var.p(z2);
            ho2.N(p65Var, true, true, true, z2);
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
