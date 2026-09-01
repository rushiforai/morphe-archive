package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z8c extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ z52 c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ u8c e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z8c(l78 l78Var, z52 z52Var, m45 m45Var, u8c u8cVar, int i) {
        super(2);
        this.a = i;
        this.b = l78Var;
        this.c = z52Var;
        this.d = m45Var;
        this.e = u8cVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        m45 m45Var = this.d;
        iy0 iy0Var = iy0.a;
        uob uobVar = w12.a;
        l78 l78Var = this.b;
        z52 z52Var = this.c;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var = (p65) x12Var;
                    if (p65Var.B()) {
                        p65Var.S();
                    }
                }
                l78Var.setValue(c1eVar);
                int i2 = z52Var.b;
                z52Var.f();
                p65 p65Var2 = (p65) x12Var;
                p65Var2.Y(1789373775);
                z52 z52Var2 = (z52) z52Var.e().b;
                i52 i52VarD = z52Var2.d();
                i52 i52VarD2 = z52Var2.d();
                i52 i52VarD3 = z52Var2.d();
                Object objM = p65Var2.M();
                if (objM == uobVar) {
                    objM = p79.w;
                    p65Var2.j0(objM);
                }
                o28 o28Var = o28.b;
                r28 r28VarB = z52.b(o28Var, i52VarD, (x45) objM);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j = p65Var2.T;
                int i3 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var2.l();
                r28 r28VarR = gx1.R(p65Var2, r28VarB);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, q12.f, zk7VarC);
                tp7.B(p65Var2, q12.e, i89VarL);
                tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                tp7.y(p65Var2, q12.h);
                tp7.B(p65Var2, q12.d, r28VarR);
                hp7.t(p65Var2, iy0Var.a(flb.a0(jfc.m(w2g.G(o28Var, 0.0f, 8.0f, 0.0f, 0.0f, 13), 40.0f, 4.0f), ((zo7) p65Var2.j(kt7.b)).b, bmb.a(100.0f)), z46.e));
                p65Var2.p(true);
                u8c u8cVar = this.e;
                boolean zF = p65Var2.f(u8cVar);
                Object objM2 = p65Var2.M();
                if (zF || objM2 == uobVar) {
                    j5c j5cVar = new j5c(0, u8cVar, u8c.class, "onClose", "onClose()V", 0, 15);
                    p65Var2.j0(j5cVar);
                    objM2 = j5cVar;
                }
                m45 m45Var2 = (m45) ((qh6) objM2);
                Object objM3 = p65Var2.M();
                if (objM3 == uobVar) {
                    objM3 = p79.x;
                    p65Var2.j0(objM3);
                }
                f49.l(m45Var2, bgf.N(z52.b(o28Var, i52VarD2, (x45) objM3), "close"), false, null, null, xz5.g, p65Var2, 1572864, 60);
                String strR = vo7.R(p65Var2, R.string.common_show_less_like_this_failure);
                boolean zF2 = p65Var2.f(i52VarD);
                Object objM4 = p65Var2.M();
                if (zF2 || objM4 == uobVar) {
                    objM4 = new et0(i52VarD, 22);
                    p65Var2.j0(objM4);
                }
                jjd.b(strR, z52.b(o28Var, i52VarD3, (x45) objM4), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).i, p65Var2, 0, 0, 130044);
                p65Var2.p(false);
                if (z52Var.b != i2) {
                    kyd.v(m45Var, p65Var2);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.B()) {
                        p65Var3.S();
                    }
                }
                l78Var.setValue(c1eVar);
                int i4 = z52Var.b;
                z52Var.f();
                p65 p65Var4 = (p65) x12Var2;
                p65Var4.Y(-157816108);
                z52 z52Var3 = (z52) z52Var.e().b;
                i52 i52VarD4 = z52Var3.d();
                i52 i52VarD5 = z52Var3.d();
                i52 i52VarD6 = z52Var3.d();
                Object objM5 = p65Var4.M();
                if (objM5 == uobVar) {
                    objM5 = p79.y;
                    p65Var4.j0(objM5);
                }
                o28 o28Var2 = o28.b;
                r28 r28VarB2 = z52.b(o28Var2, i52VarD4, (x45) objM5);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j2 = p65Var4.T;
                int i5 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var4.l();
                r28 r28VarR2 = gx1.R(p65Var4, r28VarB2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(ot2Var2);
                } else {
                    p65Var4.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var4, cuVar, zk7VarC2);
                cu cuVar2 = q12.e;
                tp7.B(p65Var4, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var4, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var4, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var4, cuVar4, r28VarR2);
                hp7.t(p65Var4, iy0Var.a(flb.a0(jfc.m(w2g.G(o28Var2, 0.0f, 8.0f, 0.0f, 0.0f, 13), 40.0f, 4.0f), rz5.A(p65Var4).b, bmb.a(100.0f)), z46.e));
                p65Var4.p(true);
                u8c u8cVar2 = this.e;
                boolean zF3 = p65Var4.f(u8cVar2);
                Object objM6 = p65Var4.M();
                if (zF3 || objM6 == uobVar) {
                    objM6 = new j5c(0, u8cVar2, u8c.class, "onClose", "onClose()V", 0, 16);
                    p65Var4.j0(objM6);
                }
                m45 m45Var3 = (m45) ((qh6) objM6);
                Object objM7 = p65Var4.M();
                if (objM7 == uobVar) {
                    objM7 = p79.z;
                    p65Var4.j0(objM7);
                }
                f49.l(m45Var3, bgf.N(z52.b(o28Var2, i52VarD5, (x45) objM7), "close"), false, null, null, xz5.f, p65Var4, 1572864, 60);
                boolean zF4 = p65Var4.f(i52VarD4);
                Object objM8 = p65Var4.M();
                if (zF4 || objM8 == uobVar) {
                    objM8 = new et0(i52VarD4, 23);
                    p65Var4.j0(objM8);
                }
                r28 r28VarV = m40.V(z52.b(o28Var2, i52VarD6, (x45) objM8), p65Var4, 0);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var4, 0);
                long j3 = p65Var4.T;
                int i6 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var4.l();
                r28 r28VarR3 = gx1.R(p65Var4, r28VarV);
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(ot2Var2);
                } else {
                    p65Var4.m0();
                }
                tp7.B(p65Var4, cuVar, wv1VarA);
                tp7.B(p65Var4, cuVar2, i89VarL3);
                ka1.z(i6, p65Var4, cuVar3, p65Var4, fnVar);
                tp7.B(p65Var4, cuVar4, r28VarR3);
                p65Var4.Y(-1859053431);
                sn3 sn3Var = z22.h;
                float fZ = ((m73) p65Var4.j(sn3Var)).z(rz5.D(p65Var4).i.b.c);
                p65Var4.p(false);
                r28 r28VarD = jfc.d(jfc.e(w2g.G(o28Var2, 48.0f, 0.0f, 48.0f, 0.0f, 10), fZ), 1.0f);
                long j4 = rz5.A(p65Var4).c;
                nr5 nr5Var = rv8.r;
                dy0.a(flb.a0(r28VarD, j4, nr5Var), p65Var4, 0);
                p65Var4.Y(-1859040216);
                float fZ2 = ((m73) p65Var4.j(sn3Var)).z(rz5.D(p65Var4).m.b.c);
                p65Var4.p(false);
                dy0.a(flb.a0(jfc.d(jfc.e(w2g.G(o28Var2, 24.0f, 8.0f, 24.0f, 0.0f, 8), fZ2 * 2.0f), 1.0f), rz5.A(p65Var4).c, nr5Var), p65Var4, 0);
                dy0.a(bo.B(jfc.e(jfc.d(w2g.G(o28Var2, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f), 218.0f), 1.0f, rz5.A(p65Var4).x, bmb.a(8.0f)), p65Var4, 0);
                dy0.a(flb.a0(r40.y(jfc.d(jfc.e(w2g.G(o28Var2, 24.0f, 32.0f, 24.0f, 0.0f, 8), 42.0f), 1.0f), bmb.a(100.0f)), rz5.A(p65Var4).c, nr5Var), p65Var4, 0);
                dy0.a(flb.a0(r40.y(jfc.d(jfc.e(w2g.F(o28Var2, 24.0f, 12.0f, 24.0f, 24.0f), 42.0f), 1.0f), bmb.a(100.0f)), rz5.A(p65Var4).c, nr5Var), p65Var4, 0);
                p65Var4.p(true);
                p65Var4.p(false);
                if (z52Var.b != i4) {
                    kyd.v(m45Var, p65Var4);
                }
                break;
        }
        return c1eVar;
    }
}
