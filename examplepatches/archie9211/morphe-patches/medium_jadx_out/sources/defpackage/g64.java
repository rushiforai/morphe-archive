package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.reader.R;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class g64 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ g64(l64 l64Var, x64 x64Var) {
        this.a = 1;
        this.b = l64Var;
        this.c = x64Var;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        r28 r28VarD;
        x45 x45Var = (x45) this.c;
        jy4 jy4Var = (jy4) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            sn3 sn3Var = kt7.a;
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            ((jp7) p65Var.j(sn3Var)).getClass();
            int i3 = fy4.a[jp7.a(p65Var).ordinal()];
            if (i3 == 1) {
                r28VarD = jfc.d(o28Var, 1.0f);
            } else {
                if (i3 != 2 && i3 != 3) {
                    ygf.a();
                    return null;
                }
                r28VarD = jfc.q(o28Var, as7.l, 0.0f, 2);
            }
            boolean zF = p65Var.f(x45Var) | p65Var.f(jy4Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new gd3(x45Var, 18, jy4Var);
                p65Var.j0(objM);
            }
            fo7.i((m45) objM, vo7.R(p65Var, jy4Var.e ? R.string.following_view_friends_on_medium : R.string.following_find_friends_on_medium), xn7.M, bgf.N(w2g.F(iy0.a.a(r28VarD, ar0Var), 24.0f, 15.0f, 24.0f, 15.0f), "following_find_friends_button"), false, p65Var, 384, 16);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        ub0 ub0Var = (ub0) this.c;
        i3c i3cVar = (i3c) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((pmb) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jjd.b(vo7.Q(R.string.speech_rate, new Object[]{dq1.G(Float.valueOf(ub0Var.j), 0, 6)}, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).l, uu1.d, 0L, null, null, null, 0L, 0L, i3cVar, 0, 0L, null, null, 16769022), p65Var, 0, 0, 131070);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        vq5 vq5Var = (vq5) this.c;
        rq5 rq5Var = (rq5) this.b;
        x12 x12Var = (x12) obj2;
        ((Integer) obj3).getClass();
        ((lw) obj).getClass();
        p65 p65Var = (p65) x12Var;
        jp7 jp7Var = (jp7) p65Var.j(kt7.a);
        o28 o28Var = o28.b;
        r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
        zk7 zk7VarC = dy0.c(z46.h, false);
        long j = p65Var.T;
        int i = (int) (j ^ (j >>> 32));
        i89 i89VarL = p65Var.l();
        r28 r28VarR = gx1.R(x12Var, r28VarJ);
        r12.W.getClass();
        ot2 ot2Var = q12.b;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(ot2Var);
        } else {
            p65Var2.m0();
        }
        cu cuVar = q12.f;
        tp7.B(x12Var, cuVar, zk7VarC);
        cu cuVar2 = q12.e;
        tp7.B(x12Var, cuVar2, i89VarL);
        Integer numValueOf = Integer.valueOf(i);
        cu cuVar3 = q12.g;
        tp7.B(x12Var, cuVar3, numValueOf);
        fn fnVar = q12.h;
        tp7.y(x12Var, fnVar);
        cu cuVar4 = q12.d;
        tp7.B(x12Var, cuVar4, r28VarR);
        r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
        zk7 zk7VarC2 = dy0.c(z46.d, false);
        long j2 = p65Var2.T;
        int i2 = (int) (j2 ^ (j2 >>> 32));
        i89 i89VarL2 = p65Var2.l();
        r28 r28VarR2 = gx1.R(x12Var, r28VarD);
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(ot2Var);
        } else {
            p65Var2.m0();
        }
        tp7.B(x12Var, cuVar, zk7VarC2);
        tp7.B(x12Var, cuVar2, i89VarL2);
        tp7.B(x12Var, cuVar3, Integer.valueOf(i2));
        tp7.y(x12Var, fnVar);
        tp7.B(x12Var, cuVar4, r28VarR2);
        r92 r92Var = vq5Var.h;
        if (r92Var == null) {
            ygf.f("Continue reading location cannot be null when AnimatedVisibility visible is set to true.");
            return null;
        }
        nk7.f(r92Var, vq5Var.f, rq5Var, w2g.G(rv8.X(iy0.a.a(o28Var, z46.k), rv8.w), 16.0f, 0.0f, 16.0f, 16.0f, 2), x12Var, 0);
        p65Var2.p(true);
        p65Var2.p(true);
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        yv5 yv5Var = (yv5) this.c;
        xv5 xv5Var = (xv5) this.b;
        jy0 jy0Var = (jy0) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        jy0Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(jy0Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(d28.LOADING);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            d28 d28Var = (d28) l78Var.getValue();
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ws(l78Var, 13);
                p65Var.j0(objM2);
            }
            int i = iIntValue & 14;
            o7f.g(jy0Var, yv5Var, xv5Var, d28Var, (x45) objM2, null, p65Var, i | 24576);
            o7f.f(jy0Var, (d28) l78Var.getValue(), yv5Var.c, yv5Var.e, xv5Var, null, p65Var, i);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        m45 m45Var = (m45) this.c;
        m45 m45Var2 = (m45) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ellipse, 0, p65Var);
            ar0 ar0Var = z46.l;
            iy0 iy0Var = iy0.a;
            w2g.e(c09VarJ, null, iy0Var.a(o28Var, ar0Var), null, null, 0.0f, null, p65Var, 56, 120);
            r28 r28VarC = w2g.C(jfc.d(o28Var, 1.0f), 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarC);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, R.string.lists_get_started_title);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).c;
            long j3 = uu1.d;
            flb.D(strR, w2g.G(jfc.d(o28Var, 1.0f), 0.0f, 0.0f, 56.0f, 0.0f, 11), mkd.a(mkdVar, j3, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), null, 0, false, 2, 0, null, new oh0(((bu7) p65Var.j(sn3Var)).e.a.b, ((bu7) p65Var.j(sn3Var)).c.a.b, en7.A(0.25d)), p65Var, 1572912, 440);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.f, z46.n, p65Var, 54);
            long j4 = p65Var.T;
            int i3 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            sn3 sn3Var2 = kt7.b;
            k40.c(sn3Var2.a(ap7.a), pxf.E(-952470144, new c60(4, m45Var2), p65Var), p65Var, 56);
            qv5.b(vn7.J(R.drawable.ic_bookmark_add_24, 0, p65Var), null, w2g.C(flb.a0(jfc.l(o28Var, 40.0f), j3, bmb.a), 8.0f), ((zo7) p65Var.j(sn3Var2)).r, p65Var, 56, 0);
            p65Var.p(true);
            p65Var.p(true);
            f49.l(m45Var, bgf.N(w2g.C(iy0Var.a(o28Var, z46.f), 8.0f), "dismiss_button"), false, null, null, gx1.c, p65Var, 1572864, 60);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        p97 p97Var = (p97) this.c;
        x87 x87Var = (x87) this.b;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (p97Var instanceof n97) {
                p65Var.Y(910644092);
                rx0.u((n97) p97Var, x87Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(p97Var instanceof o97)) {
                    throw ho2.L(p65Var, 910642125, false);
                }
                p65Var.Y(910650919);
                rx0.x((o97) p97Var, x87Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        wd7 wd7Var = (wd7) this.c;
        ld7 ld7Var = (ld7) this.b;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (wd7Var instanceof vd7) {
                p65Var.Y(-1261160121);
                g01.w(ld7Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(wd7Var instanceof ud7)) {
                    throw ho2.L(p65Var, -1261162669, false);
                }
                p65Var.Y(-1261156634);
                g01.v((ud7) wd7Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        ke7 ke7Var = (ke7) this.c;
        ee7 ee7Var = (ee7) this.b;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (ke7Var == null) {
                throw ho2.L(p65Var, 570533937, false);
            }
            p65Var.Y(570536221);
            n01.I(ke7Var, ee7Var, r28VarB, p65Var, 0);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        MainActivity mainActivity = (MainActivity) this.c;
        l78 l78Var = (l78) this.b;
        ((Integer) obj3).getClass();
        int i = MainActivity.H;
        ((lw) obj).getClass();
        vb0 vb0Var = (vb0) l78Var.getValue();
        vb0Var.getClass();
        vc2.w((ub0) vb0Var, mainActivity.E, null, (x12) obj2, 384);
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        sb2 sb2Var = (sb2) this.c;
        v7c v7cVar = (v7c) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy8) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zH = p65Var.h(sb2Var) | p65Var.f(v7cVar);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new dx0(sb2Var, v7cVar, 4);
                p65Var.j0(objM);
            }
            fo7.r((m45) objM, "Toggle bottom sheet", xn7.M, null, false, p65Var, 432, 24);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        sb2 sb2Var = (sb2) this.c;
        nx0 nx0Var = (nx0) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy8) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zH = p65Var.h(sb2Var) | p65Var.f(nx0Var);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new ps5(sb2Var, 11, nx0Var);
                p65Var.j0(objM);
            }
            mo7.t((m45) objM, "Toggle bottom sheet", yn7.M, null, false, p65Var, 432, 24);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        v88 v88Var = (v88) this.c;
        i88 i88Var = (i88) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 32.0f, 24.0f, 0.0f, 8);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i3 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            nwb nwbVar = new nwb(vo7.R(p65Var, v88Var.b.getTitleResId()));
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 8);
                p65Var.j0(objM2);
            }
            tr7.a(nwbVar, (m45) objM2, bgf.N(o28Var, "refine_recommendation_filter_selector"), 0L, 0, 0, 0, p65Var, 432, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 9);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, bgf.N(o28Var, "refine_recommendation_filter_dropdown"), 0L, null, null, null, 0L, 0.0f, pxf.E(1043775029, new gx4(v88Var, i88Var, l78Var, 12), p65Var), p65Var, 432, 2040);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object v(Object obj, Object obj2, Object obj3) {
        a98 a98Var = (a98) this.c;
        z88 z88Var = (z88) this.b;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = a98.i;
        Object obj4 = z88Var.b;
        atomicReferenceFieldUpdater.set(a98Var, obj4);
        a98Var.f(obj4);
        return c1e.a;
    }

    private final Object w(Object obj, Object obj2, Object obj3) {
        final b98 b98Var = (b98) this.c;
        final tce tceVar = (tce) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        final int i = 0;
        final int i2 = 1;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(b98Var) | p65Var.f(tceVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new m45() { // from class: e98
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i3 = i;
                        c1e c1eVar = c1e.a;
                        tce tceVar2 = tceVar;
                        b98 b98Var2 = b98Var;
                        switch (i3) {
                            case 0:
                                ((i98) b98Var2).b.m(tceVar2.e);
                                break;
                            default:
                                ((i98) b98Var2).b.m(tceVar2.e);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            boolean zF2 = p65Var.f(b98Var);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                qv7 qv7Var = new qv7(0, b98Var, b98.class, "onListsCatalogTutorialDismissed", "onListsCatalogTutorialDismissed()V", 0, 8);
                p65Var.j0(qv7Var);
                objM2 = qv7Var;
            }
            m45 m45Var2 = (m45) ((qh6) objM2);
            boolean zF3 = p65Var.f(b98Var) | p65Var.f(tceVar);
            Object objM3 = p65Var.M();
            if (zF3 || objM3 == uobVar) {
                objM3 = new m45() { // from class: e98
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i3 = i2;
                        c1e c1eVar = c1e.a;
                        tce tceVar2 = tceVar;
                        b98 b98Var2 = b98Var;
                        switch (i3) {
                            case 0:
                                ((i98) b98Var2).b.m(tceVar2.e);
                                break;
                            default:
                                ((i98) b98Var2).b.m(tceVar2.e);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM3);
            }
            r40.o(m45Var, m45Var2, (m45) objM3, null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00aa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final java.lang.Object x(java.lang.Object r10, java.lang.Object r11, java.lang.Object r12) {
        /*
            r9 = this;
            java.lang.Object r0 = r9.c
            gz8 r0 = (defpackage.gz8) r0
            java.lang.Object r9 = r9.b
            ip6 r9 = (defpackage.ip6) r9
            java.lang.Float r10 = (java.lang.Float) r10
            float r10 = r10.floatValue()
            java.lang.Float r11 = (java.lang.Float) r11
            float r11 = r11.floatValue()
            java.lang.Float r12 = (java.lang.Float) r12
            float r12 = r12.floatValue()
            boolean r1 = defpackage.qk7.v(r0, r10)
            yy8 r2 = r0.n()
            hw8 r2 = r2.e
            hw8 r3 = defpackage.hw8.Vertical
            r4 = 0
            r5 = 1
            if (r2 != r3) goto L2b
            goto L35
        L2b:
            ip6 r2 = defpackage.ip6.Ltr
            if (r9 != r2) goto L30
            goto L35
        L30:
            if (r1 != 0) goto L34
            r1 = r5
            goto L35
        L34:
            r1 = r4
        L35:
            yy8 r9 = r0.n()
            int r9 = r9.b
            r2 = 0
            if (r9 != 0) goto L40
            r3 = r2
            goto L46
        L40:
            float r3 = defpackage.qk7.p(r0)
            float r9 = (float) r9
            float r3 = r3 / r9
        L46:
            int r9 = (int) r3
            float r9 = (float) r9
            float r9 = r3 - r9
            m73 r6 = r0.n
            float r7 = java.lang.Math.abs(r10)
            r8 = 1137180672(0x43c80000, float:400.0)
            float r6 = r6.Z(r8)
            int r6 = (r7 > r6 ? 1 : (r7 == r6 ? 0 : -1))
            r7 = 2
            if (r6 >= 0) goto L5c
            goto L63
        L5c:
            int r10 = (r10 > r2 ? 1 : (r10 == r2 ? 0 : -1))
            if (r10 <= 0) goto L62
            r4 = r5
            goto L63
        L62:
            r4 = r7
        L63:
            if (r4 != 0) goto Lac
            float r9 = java.lang.Math.abs(r9)
            r10 = 1056964608(0x3f000000, float:0.5)
            int r9 = (r9 > r10 ? 1 : (r9 == r10 ? 0 : -1))
            if (r9 <= 0) goto L72
            if (r1 == 0) goto Lb3
            goto Laa
        L72:
            float r9 = java.lang.Math.abs(r3)
            m73 r10 = r0.n
            iz8 r2 = defpackage.jz8.a
            r2 = 1113587712(0x42600000, float:56.0)
            float r10 = r10.Z(r2)
            int r2 = r0.p()
            float r2 = (float) r2
            r3 = 1073741824(0x40000000, float:2.0)
            float r2 = r2 / r3
            float r10 = java.lang.Math.min(r10, r2)
            int r0 = r0.p()
            float r0 = (float) r0
            float r10 = r10 / r0
            float r10 = java.lang.Math.abs(r10)
            int r9 = (r9 > r10 ? 1 : (r9 == r10 ? 0 : -1))
            if (r9 < 0) goto L9d
            if (r1 == 0) goto Laa
            goto Lb3
        L9d:
            float r9 = java.lang.Math.abs(r11)
            float r10 = java.lang.Math.abs(r12)
            int r9 = (r9 > r10 ? 1 : (r9 == r10 ? 0 : -1))
            if (r9 >= 0) goto Laa
            goto Lb3
        Laa:
            r11 = r12
            goto Lb3
        Lac:
            if (r4 != r5) goto Laf
            goto Laa
        Laf:
            if (r4 != r7) goto Lb2
            goto Lb3
        Lb2:
            r11 = r2
        Lb3:
            java.lang.Float r9 = java.lang.Float.valueOf(r11)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g64.x(java.lang.Object, java.lang.Object, java.lang.Object):java.lang.Object");
    }

    private final Object y(Object obj, Object obj2, Object obj3) {
        pe9 pe9Var = (pe9) this.c;
        cv9 cv9Var = (cv9) this.b;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(jfc.d(o28Var, 1.0f), 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            ek7.a(pe9Var, cv9Var, p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 8.0f));
            String strW = pe9Var.b;
            if (strW == null) {
                strW = km4.w(p65Var, -1624210321, R.string.common_untitled_story, p65Var, false);
            } else {
                p65Var.Y(-1624210848);
                p65Var.p(false);
            }
            jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 2, false, 2, 2, null, ((bu7) p65Var.j(jt7.c)).e, p65Var, 0, 221568, 77822);
            hp7.t(p65Var, jfc.e(o28Var, 12.0f));
            ek7.i(pe9Var, p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        int i2 = 10;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.b;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                az5 az5Var = (az5) obj5;
                l64 l64Var = (l64) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                    o28 o28Var = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
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
                    ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
                    tp7.B(p65Var, cuVar4, r28VarR2);
                    h70 h70Var = new h70(8.0f, true, new z10(21));
                    jy8 jy8VarH = w2g.h(24.0f, 0.0f, 24.0f, 0.0f, 10);
                    r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 0.0f, 2.0f, 0.0f, 20.0f, 5);
                    boolean zF = p65Var.f(az5Var) | p65Var.f("recommended_tags") | p65Var.h(l64Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new si3(az5Var, 5, l64Var);
                        p65Var.j0(objM);
                    }
                    k40.u(r28VarG, null, jy8VarH, h70Var, null, null, false, null, (x45) objM, p65Var, 24966, 490);
                    p65Var.p(true);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                l64 l64Var2 = (l64) obj4;
                x64 x64Var = (x64) obj5;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var2.T;
                    int i5 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var2, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var2, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i5);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var2, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var2, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var2, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var2.T;
                    int i6 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var2.l();
                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                    tp7.B(p65Var2, cuVar6, i89VarL4);
                    ka1.z(i6, p65Var2, cuVar7, p65Var2, fnVar2);
                    tp7.B(p65Var2, cuVar8, r28VarR4);
                    uid uidVar = new uid((String) null, 7, 0L);
                    r28 r28VarF = w2g.F(o28Var2, 24.0f, 14.0f, 24.0f, 14.0f);
                    boolean zH = p65Var2.h(l64Var2) | p65Var2.f(x64Var);
                    Object objM2 = p65Var2.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new i64(l64Var2, x64Var, 1);
                        p65Var2.j0(objM2);
                    }
                    br7.g(uidVar, false, false, xg8.a, hlg.r(r28VarF, false, null, null, (m45) objM2, 15), null, p65Var2, 3510, 32);
                    p65Var2.p(true);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                az5 az5Var2 = (az5) obj5;
                obe obeVar = (obe) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    p65Var3.S();
                    return c1eVar;
                }
                jp7 jp7Var3 = (jp7) p65Var3.j(kt7.a);
                o28 o28Var3 = o28.b;
                r28 r28VarJ3 = ka1.j(jp7Var3, o28Var3, 3, 1.0f);
                zk7 zk7VarC5 = dy0.c(z46.h, false);
                long j5 = p65Var3.T;
                int i7 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL5 = p65Var3.l();
                r28 r28VarR5 = gx1.R(p65Var3, r28VarJ3);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var3);
                } else {
                    p65Var3.m0();
                }
                cu cuVar9 = q12.f;
                tp7.B(p65Var3, cuVar9, zk7VarC5);
                cu cuVar10 = q12.e;
                tp7.B(p65Var3, cuVar10, i89VarL5);
                Integer numValueOf3 = Integer.valueOf(i7);
                cu cuVar11 = q12.g;
                tp7.B(p65Var3, cuVar11, numValueOf3);
                fn fnVar3 = q12.h;
                tp7.y(p65Var3, fnVar3);
                cu cuVar12 = q12.d;
                tp7.B(p65Var3, cuVar12, r28VarR5);
                r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC6 = dy0.c(z46.d, false);
                long j6 = p65Var3.T;
                int i8 = (int) (j6 ^ (j6 >>> 32));
                i89 i89VarL6 = p65Var3.l();
                r28 r28VarR6 = gx1.R(p65Var3, r28VarD3);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(ot2Var3);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar9, zk7VarC6);
                tp7.B(p65Var3, cuVar10, i89VarL6);
                ka1.z(i8, p65Var3, cuVar11, p65Var3, fnVar3);
                tp7.B(p65Var3, cuVar12, r28VarR6);
                h70 h70Var2 = new h70(24.0f, true, new z10(21));
                jy8 jy8VarH2 = w2g.h(24.0f, 0.0f, 24.0f, 0.0f, 10);
                r28 r28VarD4 = jfc.d(o28Var3, 1.0f);
                boolean zF2 = p65Var3.f(az5Var2) | p65Var3.f(obeVar);
                Object objM3 = p65Var3.M();
                if (zF2 || objM3 == uobVar) {
                    objM3 = new si3(az5Var2, 3, obeVar);
                    p65Var3.j0(objM3);
                }
                k40.u(r28VarD4, null, jy8VarH2, h70Var2, null, null, false, null, (x45) objM3, p65Var3, 24966, 490);
                p65Var3.p(true);
                p65Var3.p(true);
                return c1eVar;
            case 3:
                az5 az5Var3 = (az5) obj5;
                sh9 sh9Var = (sh9) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    jp7 jp7Var4 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ4 = ka1.j(jp7Var4, o28Var4, 3, 1.0f);
                    zk7 zk7VarC7 = dy0.c(z46.h, false);
                    long j7 = p65Var4.T;
                    int i9 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var4.l();
                    r28 r28VarR7 = gx1.R(p65Var4, r28VarJ4);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar13 = q12.f;
                    tp7.B(p65Var4, cuVar13, zk7VarC7);
                    cu cuVar14 = q12.e;
                    tp7.B(p65Var4, cuVar14, i89VarL7);
                    Integer numValueOf4 = Integer.valueOf(i9);
                    cu cuVar15 = q12.g;
                    tp7.B(p65Var4, cuVar15, numValueOf4);
                    fn fnVar4 = q12.h;
                    tp7.y(p65Var4, fnVar4);
                    cu cuVar16 = q12.d;
                    tp7.B(p65Var4, cuVar16, r28VarR7);
                    r28 r28VarD5 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC8 = dy0.c(z46.d, false);
                    long j8 = p65Var4.T;
                    int i10 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var4.l();
                    r28 r28VarR8 = gx1.R(p65Var4, r28VarD5);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar13, zk7VarC8);
                    tp7.B(p65Var4, cuVar14, i89VarL8);
                    ka1.z(i10, p65Var4, cuVar15, p65Var4, fnVar4);
                    tp7.B(p65Var4, cuVar16, r28VarR8);
                    boolean zF3 = p65Var4.f(az5Var3) | p65Var4.f("staff_picks") | p65Var4.f(sh9Var);
                    Object objM4 = p65Var4.M();
                    if (zF3 || objM4 == uobVar) {
                        objM4 = new si3(az5Var3, 4, sh9Var);
                        p65Var4.j0(objM4);
                    }
                    k40.u(null, null, null, null, null, null, false, null, (x45) objM4, p65Var4, 0, 511);
                    p65Var4.p(true);
                    p65Var4.p(true);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                fb4 fb4Var = (fb4) obj5;
                ua4 ua4Var = (ua4) obj4;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    p65Var5.S();
                } else if (fb4Var instanceof cb4) {
                    p65Var5.Y(489649158);
                    m40.l(null, p65Var5, 0);
                    p65Var5.p(false);
                } else if (fb4Var instanceof bb4) {
                    p65Var5.Y(489772631);
                    m40.k((bb4) fb4Var, ua4Var, null, p65Var5, 0);
                    p65Var5.p(false);
                } else if (fb4Var instanceof ab4) {
                    p65Var5.Y(490011641);
                    m40.g((ab4) fb4Var, ua4Var, null, p65Var5, 0);
                    p65Var5.p(false);
                } else if (fb4Var instanceof db4) {
                    p65Var5.Y(490259021);
                    m40.x((db4) fb4Var, ua4Var, null, p65Var5, 0);
                    p65Var5.p(false);
                } else {
                    if (!(fb4Var instanceof eb4)) {
                        throw ho2.L(p65Var5, 2094003617, false);
                    }
                    p65Var5.Y(490505595);
                    m40.y((eb4) fb4Var, ua4Var, null, p65Var5, 0);
                    p65Var5.p(false);
                }
                return c1eVar;
            case 5:
                ob4 ob4Var = (ob4) obj5;
                pb4 pb4Var = (pb4) obj4;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    amb ambVarA = bmb.a(4.0f);
                    o28 o28Var5 = o28.b;
                    r28 r28VarY = r40.y(bo.B(jfc.d(w2g.G(o28Var5, 32.0f, 16.0f, 32.0f, 0.0f, 8), 1.0f), 1.0f, ((zo7) p65Var6.j(kt7.b)).z, ambVarA), ambVarA);
                    boolean zF4 = p65Var6.f(ob4Var) | p65Var6.f(pb4Var);
                    Object objM5 = p65Var6.M();
                    if (zF4 || objM5 == uobVar) {
                        objM5 = new gd3(ob4Var, 8, pb4Var);
                        p65Var6.j0(objM5);
                    }
                    r28 r28VarC = w2g.C(hlg.r(r28VarY, false, null, null, (m45) objM5, 15), 16.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var6, 48);
                    long j9 = p65Var6.T;
                    int i11 = (int) (j9 ^ (j9 >>> 32));
                    i89 i89VarL9 = p65Var6.l();
                    r28 r28VarR9 = gx1.R(p65Var6, r28VarC);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var5);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, q12.f, ombVarA);
                    tp7.B(p65Var6, q12.e, i89VarL9);
                    tp7.B(p65Var6, q12.g, Integer.valueOf(i11));
                    tp7.y(p65Var6, q12.h);
                    tp7.B(p65Var6, q12.d, r28VarR9);
                    String str = pb4Var.c;
                    hp7.o(str != null ? str : null, hl0.S, null, null, null, 0.0f, 0, null, null, p65Var6, 48, 2044);
                    hp7.t(p65Var6, jfc.l(o28Var5, 16.0f));
                    String str2 = pb4Var.b;
                    r28 r28VarN = bgf.N(o28Var5, "featured_in_publication_publication_name");
                    sn3 sn3Var = jt7.c;
                    jjd.b(str2, r28VarN, 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, mkd.a(((bu7) p65Var6.j(sn3Var)).j, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, new bb9(true), null, 16252927), p65Var6, 48, 24960, 110588);
                    p65Var6.p(true);
                    jjd.b(vo7.R(p65Var6, R.string.featured_in_publication_description), jfc.d(w2g.F(o28Var5, 32.0f, 16.0f, 32.0f, 24.0f), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var6.j(sn3Var)).m, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, new bb9(true), null, 16252927), p65Var6, 48, 0, 130044);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                kc4 kc4Var = (kc4) obj5;
                xb4 xb4Var = (xb4) obj4;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    jp7 jp7Var5 = (jp7) p65Var7.j(kt7.a);
                    o28 o28Var6 = o28.b;
                    r28 r28VarJ5 = ka1.j(jp7Var5, o28Var6, 3, 1.0f);
                    zk7 zk7VarC9 = dy0.c(z46.h, false);
                    long j10 = p65Var7.T;
                    int i12 = (int) (j10 ^ (j10 >>> 32));
                    i89 i89VarL10 = p65Var7.l();
                    r28 r28VarR10 = gx1.R(p65Var7, r28VarJ5);
                    r12.W.getClass();
                    ot2 ot2Var6 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    cu cuVar17 = q12.f;
                    tp7.B(p65Var7, cuVar17, zk7VarC9);
                    cu cuVar18 = q12.e;
                    tp7.B(p65Var7, cuVar18, i89VarL10);
                    Integer numValueOf5 = Integer.valueOf(i12);
                    cu cuVar19 = q12.g;
                    tp7.B(p65Var7, cuVar19, numValueOf5);
                    fn fnVar5 = q12.h;
                    tp7.y(p65Var7, fnVar5);
                    cu cuVar20 = q12.d;
                    tp7.B(p65Var7, cuVar20, r28VarR10);
                    r28 r28VarD6 = jfc.d(jfc.o(o28Var6, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC10 = dy0.c(z46.d, false);
                    long j11 = p65Var7.T;
                    int i13 = (int) (j11 ^ (j11 >>> 32));
                    i89 i89VarL11 = p65Var7.l();
                    r28 r28VarR11 = gx1.R(p65Var7, r28VarD6);
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var6);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, cuVar17, zk7VarC10);
                    tp7.B(p65Var7, cuVar18, i89VarL11);
                    ka1.z(i13, p65Var7, cuVar19, p65Var7, fnVar5);
                    tp7.B(p65Var7, cuVar20, r28VarR11);
                    n01.w(kc4Var, xb4Var, null, p65Var7, 0);
                    p65Var7.p(true);
                    p65Var7.p(true);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                hi4 hi4Var = (hi4) obj5;
                l78 l78Var = (l78) obj4;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    mz1 mz1Var = guc.d;
                    boolean zF5 = p65Var8.f(hi4Var);
                    Object objM6 = p65Var8.M();
                    if (zF5 || objM6 == uobVar) {
                        objM6 = new gd3(hi4Var, i2, l78Var);
                        p65Var8.j0(objM6);
                    }
                    oq.b(mz1Var, (m45) objM6, bgf.N(o28.b, "find_friends_re_sync_contacts"), null, null, false, null, null, p65Var8, 390, 504);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                ti4 ti4Var = (ti4) obj5;
                hi4 hi4Var2 = (hi4) obj4;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    jp7 jp7Var6 = (jp7) p65Var9.j(kt7.a);
                    o28 o28Var7 = o28.b;
                    r28 r28VarJ6 = ka1.j(jp7Var6, o28Var7, 3, 1.0f);
                    zk7 zk7VarC11 = dy0.c(z46.h, false);
                    long j12 = p65Var9.T;
                    int i14 = (int) (j12 ^ (j12 >>> 32));
                    i89 i89VarL12 = p65Var9.l();
                    r28 r28VarR12 = gx1.R(p65Var9, r28VarJ6);
                    r12.W.getClass();
                    ot2 ot2Var7 = q12.b;
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var7);
                    } else {
                        p65Var9.m0();
                    }
                    cu cuVar21 = q12.f;
                    tp7.B(p65Var9, cuVar21, zk7VarC11);
                    cu cuVar22 = q12.e;
                    tp7.B(p65Var9, cuVar22, i89VarL12);
                    Integer numValueOf6 = Integer.valueOf(i14);
                    cu cuVar23 = q12.g;
                    tp7.B(p65Var9, cuVar23, numValueOf6);
                    fn fnVar6 = q12.h;
                    tp7.y(p65Var9, fnVar6);
                    cu cuVar24 = q12.d;
                    tp7.B(p65Var9, cuVar24, r28VarR12);
                    r28 r28VarD7 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC12 = dy0.c(z46.d, false);
                    long j13 = p65Var9.T;
                    int i15 = (int) (j13 ^ (j13 >>> 32));
                    i89 i89VarL13 = p65Var9.l();
                    r28 r28VarR13 = gx1.R(p65Var9, r28VarD7);
                    p65Var9.c0();
                    if (p65Var9.S) {
                        p65Var9.k(ot2Var7);
                    } else {
                        p65Var9.m0();
                    }
                    tp7.B(p65Var9, cuVar21, zk7VarC12);
                    tp7.B(p65Var9, cuVar22, i89VarL13);
                    ka1.z(i15, p65Var9, cuVar23, p65Var9, fnVar6);
                    tp7.B(p65Var9, cuVar24, r28VarR13);
                    gx1.n(ti4Var.a, ti4Var.h, hi4Var2, null, p65Var9, 0);
                    p65Var9.p(true);
                    p65Var9.p(true);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                ju4 ju4Var = (ju4) obj5;
                rt4 rt4Var = (rt4) obj4;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    p65Var10.S();
                } else if (ju4Var instanceof iu4) {
                    p65Var10.Y(1204451430);
                    s42.l(0, 0L, p65Var10, null);
                    p65Var10.p(false);
                } else if (ju4Var instanceof gu4) {
                    p65Var10.Y(1204454763);
                    s42.j((gu4) ju4Var, rt4Var, null, p65Var10, 0);
                    p65Var10.p(false);
                } else {
                    if (!(ju4Var instanceof hu4)) {
                        throw ho2.L(p65Var10, 1204449086, false);
                    }
                    p65Var10.Y(1204461193);
                    s42.k((hu4) ju4Var, null, rt4Var, p65Var10, 0);
                    p65Var10.p(false);
                }
                return c1eVar;
            case 10:
                dza dzaVar = (dza) obj5;
                zx4 zx4Var = (zx4) obj4;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 17) != 16)) {
                    jp7 jp7Var7 = (jp7) p65Var11.j(kt7.a);
                    o28 o28Var8 = o28.b;
                    r28 r28VarJ7 = ka1.j(jp7Var7, o28Var8, 3, 1.0f);
                    zk7 zk7VarC13 = dy0.c(z46.h, false);
                    long j14 = p65Var11.T;
                    int i16 = (int) (j14 ^ (j14 >>> 32));
                    i89 i89VarL14 = p65Var11.l();
                    r28 r28VarR14 = gx1.R(p65Var11, r28VarJ7);
                    r12.W.getClass();
                    ot2 ot2Var8 = q12.b;
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var8);
                    } else {
                        p65Var11.m0();
                    }
                    cu cuVar25 = q12.f;
                    tp7.B(p65Var11, cuVar25, zk7VarC13);
                    cu cuVar26 = q12.e;
                    tp7.B(p65Var11, cuVar26, i89VarL14);
                    Integer numValueOf7 = Integer.valueOf(i16);
                    cu cuVar27 = q12.g;
                    tp7.B(p65Var11, cuVar27, numValueOf7);
                    fn fnVar7 = q12.h;
                    tp7.y(p65Var11, fnVar7);
                    cu cuVar28 = q12.d;
                    tp7.B(p65Var11, cuVar28, r28VarR14);
                    r28 r28VarD8 = jfc.d(jfc.o(o28Var8, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC14 = dy0.c(z46.d, false);
                    long j15 = p65Var11.T;
                    int i17 = (int) (j15 ^ (j15 >>> 32));
                    i89 i89VarL15 = p65Var11.l();
                    r28 r28VarR15 = gx1.R(p65Var11, r28VarD8);
                    p65Var11.c0();
                    if (p65Var11.S) {
                        p65Var11.k(ot2Var8);
                    } else {
                        p65Var11.m0();
                    }
                    tp7.B(p65Var11, cuVar25, zk7VarC14);
                    tp7.B(p65Var11, cuVar26, i89VarL15);
                    ka1.z(i17, p65Var11, cuVar27, p65Var11, fnVar7);
                    tp7.B(p65Var11, cuVar28, r28VarR15);
                    b24 b24Var = ((bza) dzaVar).a;
                    boolean zF6 = p65Var11.f(zx4Var);
                    Object objM7 = p65Var11.M();
                    if (zF6 || objM7 == uobVar) {
                        objM7 = new gi4(0, zx4Var, zx4.class, "refresh", "refresh()V", 0, 21);
                        p65Var11.j0(objM7);
                    }
                    iq7.a(b24Var, null, null, null, null, null, (m45) ((qh6) objM7), null, p65Var11, 0, 190);
                    p65Var11.p(true);
                    p65Var11.p(true);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                mza mzaVar = (mza) obj5;
                zx4 zx4Var2 = (zx4) obj4;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    jp7 jp7Var8 = (jp7) p65Var12.j(kt7.a);
                    o28 o28Var9 = o28.b;
                    r28 r28VarJ8 = ka1.j(jp7Var8, o28Var9, 3, 1.0f);
                    zk7 zk7VarC15 = dy0.c(z46.h, false);
                    long j16 = p65Var12.T;
                    int i18 = (int) (j16 ^ (j16 >>> 32));
                    i89 i89VarL16 = p65Var12.l();
                    r28 r28VarR16 = gx1.R(p65Var12, r28VarJ8);
                    r12.W.getClass();
                    ot2 ot2Var9 = q12.b;
                    p65Var12.c0();
                    if (p65Var12.S) {
                        p65Var12.k(ot2Var9);
                    } else {
                        p65Var12.m0();
                    }
                    cu cuVar29 = q12.f;
                    tp7.B(p65Var12, cuVar29, zk7VarC15);
                    cu cuVar30 = q12.e;
                    tp7.B(p65Var12, cuVar30, i89VarL16);
                    Integer numValueOf8 = Integer.valueOf(i18);
                    cu cuVar31 = q12.g;
                    tp7.B(p65Var12, cuVar31, numValueOf8);
                    fn fnVar8 = q12.h;
                    tp7.y(p65Var12, fnVar8);
                    cu cuVar32 = q12.d;
                    tp7.B(p65Var12, cuVar32, r28VarR16);
                    r28 r28VarD9 = jfc.d(jfc.o(o28Var9, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC16 = dy0.c(z46.d, false);
                    long j17 = p65Var12.T;
                    int i19 = (int) (j17 ^ (j17 >>> 32));
                    i89 i89VarL17 = p65Var12.l();
                    r28 r28VarR17 = gx1.R(p65Var12, r28VarD9);
                    p65Var12.c0();
                    if (p65Var12.S) {
                        p65Var12.k(ot2Var9);
                    } else {
                        p65Var12.m0();
                    }
                    tp7.B(p65Var12, cuVar29, zk7VarC16);
                    tp7.B(p65Var12, cuVar30, i89VarL17);
                    ka1.z(i19, p65Var12, cuVar31, p65Var12, fnVar8);
                    tp7.B(p65Var12, cuVar32, r28VarR17);
                    b24 b24Var2 = ((jza) mzaVar).a;
                    boolean zF7 = p65Var12.f(zx4Var2);
                    Object objM8 = p65Var12.M();
                    if (zF7 || objM8 == uobVar) {
                        objM8 = new gi4(0, zx4Var2, zx4.class, "refresh", "refresh()V", 0, 23);
                        p65Var12.j0(objM8);
                    }
                    iq7.a(b24Var2, null, null, null, null, null, (m45) ((qh6) objM8), null, p65Var12, 0, 190);
                    p65Var12.p(true);
                    p65Var12.p(true);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                iza izaVar = (iza) obj5;
                zx4 zx4Var3 = (zx4) obj4;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 17) != 16)) {
                    jp7 jp7Var9 = (jp7) p65Var13.j(kt7.a);
                    o28 o28Var10 = o28.b;
                    r28 r28VarJ9 = ka1.j(jp7Var9, o28Var10, 3, 1.0f);
                    zk7 zk7VarC17 = dy0.c(z46.h, false);
                    long j18 = p65Var13.T;
                    int i20 = (int) (j18 ^ (j18 >>> 32));
                    i89 i89VarL18 = p65Var13.l();
                    r28 r28VarR18 = gx1.R(p65Var13, r28VarJ9);
                    r12.W.getClass();
                    ot2 ot2Var10 = q12.b;
                    p65Var13.c0();
                    if (p65Var13.S) {
                        p65Var13.k(ot2Var10);
                    } else {
                        p65Var13.m0();
                    }
                    cu cuVar33 = q12.f;
                    tp7.B(p65Var13, cuVar33, zk7VarC17);
                    cu cuVar34 = q12.e;
                    tp7.B(p65Var13, cuVar34, i89VarL18);
                    Integer numValueOf9 = Integer.valueOf(i20);
                    cu cuVar35 = q12.g;
                    tp7.B(p65Var13, cuVar35, numValueOf9);
                    fn fnVar9 = q12.h;
                    tp7.y(p65Var13, fnVar9);
                    cu cuVar36 = q12.d;
                    tp7.B(p65Var13, cuVar36, r28VarR18);
                    r28 r28VarD10 = jfc.d(jfc.o(o28Var10, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC18 = dy0.c(z46.d, false);
                    long j19 = p65Var13.T;
                    int i21 = (int) (j19 ^ (j19 >>> 32));
                    i89 i89VarL19 = p65Var13.l();
                    r28 r28VarR19 = gx1.R(p65Var13, r28VarD10);
                    p65Var13.c0();
                    if (p65Var13.S) {
                        p65Var13.k(ot2Var10);
                    } else {
                        p65Var13.m0();
                    }
                    tp7.B(p65Var13, cuVar33, zk7VarC18);
                    tp7.B(p65Var13, cuVar34, i89VarL19);
                    ka1.z(i21, p65Var13, cuVar35, p65Var13, fnVar9);
                    tp7.B(p65Var13, cuVar36, r28VarR19);
                    b24 b24Var3 = ((fza) izaVar).a;
                    boolean zF8 = p65Var13.f(zx4Var3);
                    Object objM9 = p65Var13.M();
                    if (zF8 || objM9 == uobVar) {
                        objM9 = new gi4(0, zx4Var3, zx4.class, "refresh", "refresh()V", 0, 22);
                        p65Var13.j0(objM9);
                    }
                    iq7.a(b24Var3, null, null, null, null, null, (m45) ((qh6) objM9), null, p65Var13, 0, 190);
                    p65Var13.p(true);
                    p65Var13.p(true);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                return a(obj, obj2, obj3);
            case 14:
                return d(obj, obj2, obj3);
            case 15:
                return g(obj, obj2, obj3);
            case 16:
                return h(obj, obj2, obj3);
            case 17:
                return i(obj, obj2, obj3);
            case 18:
                return j(obj, obj2, obj3);
            case 19:
                return l(obj, obj2, obj3);
            case 20:
                return n(obj, obj2, obj3);
            case 21:
                return o(obj, obj2, obj3);
            case 22:
                return r(obj, obj2, obj3);
            case 23:
                return t(obj, obj2, obj3);
            case 24:
                return u(obj, obj2, obj3);
            case 25:
                return v(obj, obj2, obj3);
            case 26:
                return w(obj, obj2, obj3);
            case 27:
                return x(obj, obj2, obj3);
            case 28:
                return y(obj, obj2, obj3);
            default:
                ue9 ue9Var = (ue9) obj5;
                tf9 tf9Var = ue9Var.b;
                cv7 cv7Var = ue9Var.c;
                te9 te9Var = (te9) obj4;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(1 & iIntValue14, (iIntValue14 & 17) != 16)) {
                    if (cv7Var != null) {
                        p65Var14.Y(2007022647);
                        hk7.e(cv7Var, te9Var, null, p65Var14, 0);
                    } else {
                        p65Var14.Y(2005604521);
                    }
                    p65Var14.p(false);
                    if (tf9Var != null) {
                        p65Var14.Y(2007269066);
                        hk7.i(tf9Var, te9Var, null, p65Var14, 0);
                    } else {
                        p65Var14.Y(2005604521);
                    }
                    p65Var14.p(false);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ g64(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }
}
