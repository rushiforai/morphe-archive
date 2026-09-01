package defpackage;

import android.content.res.Resources;
import com.medium.reader.R;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class aoc {
    public static final amb a = bmb.a(16.0f);
    public static final float b = 400.0f;

    public static final void a(yc9 yc9Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        yc9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(302018275);
        int i2 = 4;
        int i3 = (p65Var.f(yc9Var) ? 4 : 2) | i | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            l90 l90Var = new l90((Resources) p65Var.j(eo.c), i2);
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 0.0f, 16.0f, 1), "popular_post_" + yc9Var.a);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarM = jfc.m(o28Var, 70.0f, 52.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarM, ((zo7) p65Var.j(sn3Var)).c, rv8.r);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarA0);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            k40.c(u57.a.a(l90Var), pxf.E(-2007592199, new k6c(1, yc9Var), p65Var), p65Var, 56);
            ka1.B(p65Var, true, o28Var, 16.0f, p65Var);
            String str = yc9Var.b;
            if (str == null) {
                str = "";
            }
            jjd.b(str, new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(yc9Var, obj, i, 5);
        }
    }

    public static final void b(az5 az5Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        az5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(347863726);
        int i3 = (p65Var.f(az5Var) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarF = w2g.F(jfc.d(r28Var, 1.0f), 24.0f, 24.0f, 24.0f, 32.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String upperCase = vo7.R(p65Var, R.string.onboarding_starter_pack_detail_popular_stories).toUpperCase(Locale.ROOT);
            upperCase.getClass();
            jjd.b(upperCase, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).w, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            i2 = 4;
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new h9b(17, az5Var);
                p65Var.j0(objM);
            }
            f76.u(r28VarD, (b55) objM, p65Var, 6, 0);
            p65Var.p(true);
        } else {
            i2 = 4;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(az5Var, r28Var, i, i2);
        }
    }

    public static final void c(int i, long j, x12 x12Var, r28 r28Var) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1286404303);
        if ((i & 6) == 0) {
            i2 = (p65Var.e(j) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        char c = ' ';
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            int i3 = jp7.a(p65Var) != ip7.COMPACT ? 3 : 2;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i5 = 48;
            int i6 = ((i2 << 9) & 7168) | 48;
            ok7.r(120.0f, i6, 4, j, p65Var, null, ((bu7) p65Var.j(jt7.c)).w);
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            p65Var.Y(-238356555);
            int i7 = 0;
            while (i7 < i3) {
                r28 r28VarD = jfc.d(o28Var, 1.0f);
                char c2 = c;
                omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, i5);
                int i8 = i6;
                long j3 = p65Var.T;
                int i9 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, ombVarA);
                tp7.B(p65Var, q12.e, i89VarL2);
                tp7.B(p65Var, q12.g, Integer.valueOf(i9));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR2);
                dy0.a(flb.a0(jfc.m(o28Var, 70.0f, 52.0f), j, rv8.r), p65Var, 0);
                hp7.t(p65Var, jfc.p(o28Var, 16.0f));
                i6 = i8;
                ok7.r(180.0f, i6, 0, j, p65Var, new sq6(1.0f, true), ((bu7) p65Var.j(jt7.c)).m);
                p65Var.p(true);
                hp7.t(p65Var, jfc.e(o28Var, 16.0f));
                i7++;
                c = c2;
                i5 = 48;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(j, r28Var, i);
        }
    }

    public static final String d(int i) {
        if (i >= 1000000) {
            return String.format(Locale.US, "%.1fM followers", Arrays.copyOf(new Object[]{Double.valueOf(((double) i) / 1000000.0d)}, 1));
        }
        if (i >= 1000) {
            return String.format(Locale.US, "%.1fK followers", Arrays.copyOf(new Object[]{Double.valueOf(((double) i) / 1000.0d)}, 1));
        }
        return i + " followers";
    }

    public static final r28 e(x12 x12Var, r28 r28Var) {
        r28 r28VarW;
        long j;
        r28Var.getClass();
        long j2 = op8.j(637534208);
        long j3 = op8.j(218103808);
        sn3 sn3Var = kt7.b;
        p65 p65Var = (p65) x12Var;
        long j4 = ((zo7) p65Var.j(sn3Var)).z;
        long j5 = ((zo7) p65Var.j(sn3Var)).a;
        boolean zN = yi2.N(x12Var);
        ((jp7) p65Var.j(kt7.a)).getClass();
        ip7 ip7VarA = jp7.a(x12Var);
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = bjc.b(new znc(ip7VarA, 0));
            p65Var.j0(objM);
        }
        upc upcVar = (upc) objM;
        o28 o28Var = o28.b;
        if (zN) {
            r28VarW = o28Var;
            j = j5;
        } else {
            j = j5;
            r28VarW = wo7.w(wo7.w(o28Var, 8.0f, null, j2, j2, 6), 4.0f, null, j3, j3, 6);
        }
        r28 r28VarB = r28Var.b(r28VarW);
        amb ambVar = a;
        return flb.a0(r40.y(jfc.f(bo.B(r28VarB, 1.0f, j4, ambVar), 0.0f, ((vj3) upcVar.getValue()).a, 1).b(jfc.c), ambVar), j, rv8.r);
    }
}
