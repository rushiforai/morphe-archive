package defpackage;

import android.graphics.Color;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.unsplash.data.UnsplashPhoto;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d3e {
    public static final void a(e3e e3eVar, r28 r28Var, pw6 pw6Var, gx5 gx5Var, b3e b3eVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1706687408);
        int i2 = i | (p65Var.f(e3eVar) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16) | (p65Var.f(pw6Var) ? 256 : 128) | (p65Var.f(gx5Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(b3eVar) ? 16384 : 8192);
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            boolean z = e3eVar.d;
            boolean z2 = (57344 & i2) == 16384;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ibd ibdVar = new ibd(0, b3eVar, b3e.class, "onRefresh", "onRefresh()V", 0, 14);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1043156638, new fd3(pw6Var, e3eVar, b3eVar, gx5Var, 10), p65Var), p65Var, (i2 << 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(e3eVar, r28Var, pw6Var, gx5Var, b3eVar, i);
        }
    }

    public static final void b(f3e f3eVar, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2071419460);
        int i2 = i | (p65Var.f(f3eVar) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            iq7.a(f3eVar.a, jfc.c, null, null, null, null, m45Var, null, p65Var, ((i2 << 15) & 3670016) | 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 9, f3eVar, m45Var, r28Var);
        }
    }

    public static final void c(pw6 pw6Var, r28 r28Var, x12 x12Var, int i) {
        pw6 pw6Var2 = pw6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(398917163);
        int i2 = (p65Var.f(pw6Var2) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
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
            ymc ymcVar = new ymc();
            jy8 jy8VarG = w2g.g(2, 4.0f);
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new tjd(12);
                p65Var.j0(objM);
            }
            pw6Var2 = pw6Var;
            op8.t(ymcVar, r28VarV, pw6Var2, jy8VarG, null, null, false, null, (x45) objM, p65Var, ((i2 << 6) & 896) | 100666368, 6, 752);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(pw6Var2, r28Var, i, 21);
        }
    }

    public static final void d(UnsplashPhoto unsplashPhoto, r28 r28Var, gx5 gx5Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1531975747);
        int i2 = i | (p65Var2.f(unsplashPhoto) ? 4 : 2) | (p65Var2.f(r28Var) ? 32 : 16) | (p65Var2.f(gx5Var) ? 256 : 128);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarC = w2g.C(r28Var, 4.0f);
            String color = unsplashPhoto.getColor();
            r28 r28VarR = jfc.r(jfc.d(flb.a0(r28VarC, color != null ? op8.j(Color.parseColor(color)) : uu1.h, rv8.r), 1.0f), 3);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarR);
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
            tp7.B(p65Var2, q12.d, r28VarR2);
            k40.c(u57.a.a(bo.a0(p65Var2)), pxf.E(975511171, new l6c(unsplashPhoto, 20, gx5Var), p65Var2), p65Var2, 56);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            iy0 iy0Var = iy0.a;
            r28 r28VarB = iy0Var.b(r28VarD);
            uu1 uu1Var = new uu1(uu1.g);
            long j2 = xo7.i;
            dy0.a(flb.Z(r28VarB, hpe.y(d46.R(uu1Var, new uu1(uu1.b(0.3f, j2))))), p65Var2, 0);
            jjd.b(unsplashPhoto.getUser().getName(), w2g.C(iy0Var.a(bgf.N(o28Var, "user_name"), z46.j), 8.0f), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).n, uu1.d, 0L, null, null, null, 0L, 0L, new i3c(4.0f, uu1.b(0.6f, j2), (((long) Float.floatToRawIntBits(2.0f)) << 32) | (((long) Float.floatToRawIntBits(2.0f)) & 4294967295L)), 0, 0L, null, null, 16769022), p65Var2, 0, 24960, 110588);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 10, unsplashPhoto, r28Var, gx5Var);
        }
    }

    public static final void e(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1828268646);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            dy0.a(jfc.d(flb.a0(w2g.C(r28Var, 4.0f), ((zo7) p65Var.j(kt7.b)).c, rv8.r), 1.0f), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i, 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.h3e r26, defpackage.pw6 r27, defpackage.b3e r28, defpackage.r28 r29, defpackage.gx5 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 442
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d3e.f(h3e, pw6, b3e, r28, gx5, x12, int, int):void");
    }

    public static final void g(String str, gx5 gx5Var, qlb qlbVar, r28 r28Var, k3e k3eVar, x12 x12Var, int i) {
        k3e k3eVar2;
        k3e k3eVar3;
        int i2;
        str.getClass();
        gx5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2137653487);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(gx5Var) ? 32 : 16) | (p65Var.f(qlbVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = (i3 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new nmc(str, 6);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    k3eVar3 = (k3e) to7.z(n1b.a.b(k3e.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-57345);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-57345);
                k3eVar3 = k3eVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(k3eVar3.h, p65Var, 0);
            pw6 pw6VarN0 = gsa.n0(p65Var);
            boolean zF = p65Var.f(k3eVar3) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new b3e(qlbVar, k3eVar3);
                p65Var.j0(objM2);
            }
            f((h3e) l78VarZ.getValue(), pw6VarN0, (b3e) objM2, r28Var, gx5Var, p65Var, ((i2 << 9) & 57344) | (i2 & 7168), 0);
            boolean zF2 = p65Var.f(pw6VarN0) | p65Var.h(k3eVar3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new cfd(pw6VarN0, k3eVar3, null, 5);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, pw6VarN0);
            k3eVar2 = k3eVar3;
        } else {
            p65Var.S();
            k3eVar2 = k3eVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, gx5Var, qlbVar, r28Var, k3eVar2, i, 11);
        }
    }
}
