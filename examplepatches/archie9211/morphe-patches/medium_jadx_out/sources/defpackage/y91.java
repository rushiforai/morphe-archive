package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.CatalogDetailReference;
import com.medium.android.core.share.PostShareData;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.reader.R;
import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class y91 {
    public static final void a(gc1 gc1Var, jt4 jt4Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        char c;
        float f;
        boolean z;
        boolean z2;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2024953802);
        int i2 = i | (p65Var.f(gc1Var) ? 4 : 2) | (p65Var.f(jt4Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(flb.a0(jfc.d(o28Var, 1.0f), ((zo7) p65Var.j(kt7.b)).b, rv8.r), 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
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
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            fc1 fc1Var = gc1Var.e;
            String strW = fc1Var.b;
            if (strW == null) {
                c = 0;
                strW = km4.w(p65Var, -1891977648, R.string.common_unknown_user, p65Var, false);
            } else {
                c = 0;
                p65Var.Y(-1891978454);
                p65Var.p(false);
            }
            Object[] objArr = new Object[1];
            objArr[c] = strW;
            String strQ = vo7.Q(R.string.catalog_detail_more_from, objArr, p65Var);
            sn3 sn3Var = jt7.c;
            jjd.b(strQ, new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).j, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            wu4 wu4Var = (wu4) guc.x(fc1Var.g, null, p65Var, 48).getValue();
            if (wu4Var != null) {
                p65Var.Y(1478725199);
                f = 8.0f;
                n01.x(wu4Var, it4.M, jt4Var, jfc.q(o28Var, 100.0f, 0.0f, 2), null, null, null, 0L, p65Var, ((i2 << 3) & 896) | 48, 240);
                z = false;
                p65Var.p(false);
            } else {
                f = 8.0f;
                z = false;
                p65Var.Y(1479007392);
                hp7.t(p65Var, jfc.p(o28Var, 100.0f));
                p65Var.p(false);
            }
            p65Var.p(true);
            if (fc1Var.c != null) {
                km4.F(f, 683589299, p65Var, p65Var, o28Var);
                z2 = z;
                z3 = true;
                jjd.b(fc1Var.c, jfc.d(o28Var, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 48, 0, 131068);
                p65Var = p65Var;
            } else {
                z2 = z;
                z3 = true;
                p65Var.Y(622171138);
            }
            p65Var.p(z2);
            p65Var.p(z3);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i, 9, gc1Var, jt4Var, obj);
        }
    }

    public static final void b(cc1 cc1Var, y81 y81Var, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-251301746);
        int i2 = i | (p65Var.f(cc1Var) ? 4 : 2) | (p65Var.f(y81Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(w2g.C(o28Var, 24.0f), 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarC = w2g.C(flb.a0(r28VarD2, ((zo7) p65Var.j(sn3Var)).b, bmb.a(4.0f)), 16.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarC);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            qv5.b(vn7.J(R.drawable.ic_exclamation, 0, p65Var), null, null, ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 4);
            boolean z = false;
            jjd.b(y30.n(8.0f, R.string.catalog_detail_story_no_longer_available, p65Var, p65Var, o28Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
            String strR = vo7.R(p65Var, R.string.common_remove_from_list);
            xn7 xn7Var = xn7.M;
            r28 r28VarG = w2g.G(new dr5(z46.r), 0.0f, 0.0f, 24.0f, 0.0f, 11);
            boolean z2 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            if ((i2 & 14) == 4) {
                z = true;
            }
            boolean z3 = z2 | z;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new n(y81Var, 23, cc1Var);
                p65Var.j0(objM);
            }
            fo7.j((m45) objM, strR, xn7Var, r28VarG, false, null, p65Var, 384, 48);
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i, 7, cc1Var, y81Var, obj);
        }
    }

    public static final void c(int i, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1461555783);
        int i2 = i | 6 | (p65Var.e(j) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            p65Var.Y(100806863);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).m.b.c) + 16.0f + 16.0f;
            p65Var.p(false);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var3);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarP = pwd.P(o28Var, a76.Min);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarP);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            tp7.e(3.0f, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 384, 0, j, p65Var, w2g.G(jfc.c(o28Var, 1.0f), 24.0f, 24.0f, 0.0f, 0.0f, 12));
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 0.0f, 24.0f, 24.0f, 0.0f, 9), 1.0f), fZ), j, bmb.a(4.0f)), p65Var, 0);
            p65Var.p(true);
            il7.l(stc.S, jfc.d(o28Var, 1.0f), j, null, p65Var, ((i2 << 3) & 896) | 54, 8);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j, i, 3);
        }
    }

    public static final void d(gc1 gc1Var, dc1 dc1Var, sh9 sh9Var, y81 y81Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        o28 o28Var;
        r28 r28VarR;
        o28 o28Var2;
        boolean z;
        int i2;
        boolean z2;
        long j;
        String strW;
        long j2;
        r28 r28Var3;
        String str = dc1Var.a;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-548101087);
        int i3 = i | (p65Var.f(gc1Var) ? 4 : 2) | (p65Var.f(dc1Var) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128) | (p65Var.f(y81Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z3 = str != null;
            boolean z4 = z3 || gc1Var.f;
            uob uobVar = w12.a;
            o28 o28Var3 = o28.b;
            if (z4) {
                p65Var.Y(986727881);
                boolean z5 = ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z5 || objM == uobVar) {
                    objM = new n(sh9Var, 24, dc1Var);
                    p65Var.j0(objM);
                }
                r28VarR = hlg.r(o28Var3, false, null, null, (m45) objM, 15);
                o28Var = o28Var3;
                p65Var.p(false);
            } else {
                o28Var = o28Var3;
                p65Var.Y(987065905);
                p65Var.p(false);
                r28VarR = o28Var;
            }
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (z4) {
                p65Var.Y(1811069547);
                r28 r28VarP = pwd.P(o28Var, a76.Min);
                omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
                long j4 = p65Var.T;
                int i5 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarP);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                if (z3) {
                    p65Var.Y(1538719884);
                    j = rz5.A(p65Var).y;
                    z2 = false;
                } else {
                    z2 = false;
                    p65Var.Y(1538721418);
                    j = rz5.A(p65Var).x;
                }
                p65Var.p(z2);
                long j5 = j;
                o28 o28Var4 = o28Var;
                boolean z6 = z2;
                int i6 = 1;
                tp7.e(3.0f, 390, 0, j5, p65Var, w2g.G(jfc.c(o28Var, 1.0f), 24.0f, 24.0f, 0.0f, 0.0f, 12));
                hp7.t(p65Var, jfc.l(o28Var4, 16.0f));
                if (str == null) {
                    strW = km4.w(p65Var, 1538734049, R.string.list_add_note_hint, p65Var, z6);
                } else {
                    p65Var.Y(1538733057);
                    p65Var.p(z6);
                    strW = str;
                }
                mkd mkdVar = rz5.D(p65Var).m;
                if (z3) {
                    p65Var.Y(1538739662);
                    j2 = rz5.A(p65Var).n;
                } else {
                    p65Var.Y(1538741264);
                    j2 = rz5.A(p65Var).o;
                }
                p65Var.p(z6);
                mkd mkdVarA = mkd.a(mkdVar, j2, 0L, null, new zz4(i6), null, 0L, 0L, null, 0, 0L, null, null, 16777206);
                r28 r28VarD = jfc.d(w2g.G(o28Var4, 0.0f, 24.0f, 24.0f, 0.0f, 9), 1.0f);
                boolean z7 = ((i3 & 7168) == 2048 ? true : z6) | ((i3 & 14) == 4 ? true : z6) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? true : z6);
                Object objM2 = p65Var.M();
                if (z7 || objM2 == uobVar) {
                    objM2 = new le0(gc1Var, dc1Var, y81Var, 9);
                    p65Var.j0(objM2);
                }
                r28 r28VarR4 = hlg.r(r28VarD, false, null, null, (m45) objM2, 15);
                if (gc1Var.f) {
                    p65Var.Y(457318127);
                    r28 r28VarC = w2g.C(flb.a0(o28Var4, rz5.A(p65Var).b, bmb.a(4.0f)), 16.0f);
                    p65Var.p(z6);
                    r28Var3 = r28VarC;
                } else {
                    p65Var.Y(457692452);
                    p65Var.p(z6);
                    r28Var3 = o28Var4;
                }
                r28 r28VarB = r28VarR4.b(r28Var3);
                o28Var2 = o28Var4;
                z = z6;
                i2 = i3;
                jjd.b(strW, r28VarB, 0L, 0L, 0L, null, null, 0L, 2, false, 10, 0, null, mkdVarA, p65Var, 0, 24960, 110588);
                p65Var = p65Var;
                p65Var.p(true);
            } else {
                o28Var2 = o28Var;
                z = false;
                i2 = i3;
                p65Var.Y(1743019339);
            }
            p65Var.p(z);
            dr9 dr9Var = dc1Var.c;
            wq9 wq9Var = z4 ? wq9.DO_NOTHING : wq9.OPEN_POST_PAGE;
            String str2 = dr9Var.a;
            sw5 sw5Var = dr9Var.b;
            String str3 = dr9Var.c;
            String str4 = dr9Var.d;
            boolean z8 = dr9Var.e;
            Long l = dr9Var.f;
            Integer num = dr9Var.g;
            bo4 bo4Var = dr9Var.h;
            pq9 pq9Var = dr9Var.i;
            rq9 rq9Var = (268304383 & 512) != 0 ? dr9Var.j : null;
            Long l2 = dr9Var.k;
            Integer num2 = dr9Var.l;
            Integer num3 = dr9Var.m;
            boolean z9 = dr9Var.n;
            bo4 bo4Var2 = dr9Var.o;
            PostClientVisibilityState postClientVisibilityState = dr9Var.p;
            cr9 cr9Var = dr9Var.q;
            if ((268304383 & 131072) != 0) {
                wq9Var = dr9Var.r;
            }
            wq9 wq9Var2 = wq9Var;
            bo4 bo4Var3 = dr9Var.s;
            oq9 oq9Var = dr9Var.t;
            sq9 sq9Var = dr9Var.u;
            boolean z10 = dr9Var.v;
            boolean z11 = dr9Var.w;
            g08 g08Var = dr9Var.x;
            lj3 lj3Var = dr9Var.y;
            PostShareData postShareData = dr9Var.z;
            bo4 bo4Var4 = dr9Var.A;
            qq9 qq9Var = dr9Var.B;
            dr9Var.getClass();
            postClientVisibilityState.getClass();
            wq9Var2.getClass();
            g08Var.getClass();
            p65 p65Var2 = p65Var;
            il7.k(new dr9(str2, sw5Var, str3, str4, z8, l, num, bo4Var, pq9Var, rq9Var, l2, num2, num3, z9, bo4Var2, postClientVisibilityState, cr9Var, wq9Var2, bo4Var3, oq9Var, sq9Var, z10, z11, g08Var, lj3Var, postShareData, bo4Var4, qq9Var), stc.S, sh9Var, jfc.d(o28Var2, 1.0f), null, p65Var2, (i2 & 896) | 3120, 16);
            p65Var = p65Var2;
            p65Var.p(true);
            r28Var2 = o28Var2;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(gc1Var, dc1Var, sh9Var, y81Var, r28Var2, i, 8);
        }
    }

    public static final void e(String str, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        String strW;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1126149221);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarC = w2g.C(flb.a0(r28VarD, ((zo7) p65Var.j(sn3Var)).a, rv8.r), 24.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            if (str == null) {
                strW = km4.w(p65Var, 1080742711, R.string.common_untitled_story, p65Var, false);
            } else {
                p65Var.Y(1080742432);
                p65Var.p(false);
                strW = str;
            }
            r28Var2 = o28Var;
            jjd.b(strW, new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(r28Var2, 16.0f));
            qv5.b(vn7.J(R.drawable.ic_reorder_24, 0, p65Var), vo7.R(p65Var, R.string.cd_reorder), null, ((zo7) p65Var.j(sn3Var)).n, p65Var, 8, 4);
            i2 = 1;
            p65Var.p(true);
        } else {
            i2 = 1;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var2, i, i2);
        }
    }

    public static final void f(int i, int i2, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-811400150);
        long j2 = j;
        int i3 = i | 6 | (((i2 & 2) == 0 && p65Var.e(j2)) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                if ((i2 & 2) != 0) {
                    j2 = ((zo7) p65Var.j(kt7.b)).c;
                    i3 &= -113;
                }
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                if ((i2 & 2) != 0) {
                    i3 &= -113;
                }
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarC = w2g.C(flb.a0(jfc.d(r28Var3, 1.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r), 24.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i6 = (i3 << 6) & 7168;
            ok7.s(0.0f, i6, 4, j2, p65Var, new sq6(1.0f, true), ((bu7) p65Var.j(jt7.c)).j);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            qv5.b(vn7.J(R.drawable.ic_reorder_24, 0, p65Var), vo7.R(p65Var, R.string.cd_reorder), null, j2, p65Var, 8 | i6, 4);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        long j4 = j2;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j4, i, i2, 6);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:240:0x0457  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x0466  */
    /* JADX WARN: Removed duplicated region for block: B:245:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00bc  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00f1  */
    /* JADX WARN: Type inference failed for: r15v32 */
    /* JADX WARN: Type inference failed for: r15v33 */
    /* JADX WARN: Type inference failed for: r15v35 */
    /* JADX WARN: Type inference failed for: r18v7, types: [boolean] */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r4v6, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r9v14, types: [boolean] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.jc1 r31, defpackage.ya1 r32, defpackage.ja1 r33, final defpackage.y81 r34, defpackage.sh9 r35, defpackage.jt4 r36, defpackage.r28 r37, defpackage.kv6 r38, defpackage.nhc r39, defpackage.x12 r40, int r41, int r42) {
        /*
            Method dump skipped, instruction units count: 1151
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y91.g(jc1, ya1, ja1, y81, sh9, jt4, r28, kv6, nhc, x12, int, int):void");
    }

    public static final void h(CatalogDetailReference catalogDetailReference, String str, z81 z81Var, r28 r28Var, id1 id1Var, x12 x12Var, int i) {
        id1 id1Var2;
        int i2;
        id1 id1Var3;
        id1 id1Var4;
        uob uobVar;
        catalogDetailReference.getClass();
        str.getClass();
        z81Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-376154192);
        int i3 = i | (p65Var.f(catalogDetailReference) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar2 = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar2) {
                    objM = new i0(catalogDetailReference, 21, str);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    id1 id1Var5 = (id1) to7.z(n1b.a.b(id1.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-57345);
                    id1Var3 = id1Var5;
                }
            } else {
                p65Var.S();
                i2 = i3 & (-57345);
                id1Var3 = id1Var;
            }
            p65Var.q();
            Context context = (Context) p65Var.j(eo.b);
            Resources resources = (Resources) p65Var.j(eo.c);
            l78 l78VarZ = guc.z(id1Var3.U, p65Var, 0);
            l78 l78VarZ2 = guc.z(id1Var3.O, p65Var, 0);
            l78 l78VarZ3 = guc.z(id1Var3.Q, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            nhc nhcVarF = mk7.F(p65Var);
            boolean zF = p65Var.f(id1Var3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar2) {
                objM2 = new u91(id1Var3, z81Var);
                p65Var.j0(objM2);
            }
            u91 u91Var = (u91) objM2;
            jc1 jc1Var = (jc1) l78VarZ.getValue();
            gc1 gc1Var = jc1Var instanceof gc1 ? (gc1) jc1Var : null;
            l78 l78VarY = qo7.y(gc1Var != null ? gc1Var.a : null, p65Var);
            boolean zF2 = p65Var.f(id1Var3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar2) {
                objM3 = new v91(z81Var, l78VarY, id1Var3);
                p65Var.j0(objM3);
            }
            v91 v91Var = (v91) objM3;
            boolean zF3 = p65Var.f(id1Var3);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar2) {
                objM4 = new s91(id1Var3);
                p65Var.j0(objM4);
            }
            g((jc1) l78VarZ.getValue(), (ya1) l78VarZ2.getValue(), (ja1) l78VarZ3.getValue(), u91Var, v91Var, (s91) objM4, r28Var, kv6VarA, nhcVarF, p65Var, (i2 << 9) & 3670016, 0);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar2) {
                objM5 = kyd.M(p65Var);
                p65Var.j0(objM5);
            }
            sb2 sb2Var = (sb2) objM5;
            boolean zH = p65Var.h(id1Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.h(context) | p65Var.f(v91Var);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar2) {
                id1Var4 = id1Var3;
                uobVar = uobVar2;
                nz nzVar = new nz(id1Var4, nhcVarF, sb2Var, context, z81Var, resources, v91Var, null, 1);
                p65Var.j0(nzVar);
                objM6 = nzVar;
            } else {
                id1Var4 = id1Var3;
                uobVar = uobVar2;
            }
            kyd.k(p65Var, (b55) objM6, c1e.a);
            boolean zF4 = p65Var.f(kv6VarA) | p65Var.h(id1Var4);
            Object objM7 = p65Var.M();
            if (zF4 || objM7 == uobVar) {
                objM7 = new r91(kv6VarA, id1Var4, null, 0);
                p65Var.j0(objM7);
            }
            kyd.k(p65Var, (b55) objM7, kv6VarA);
            id1Var2 = id1Var4;
        } else {
            p65Var.S();
            id1Var2 = id1Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(catalogDetailReference, str, z81Var, r28Var, id1Var2, i, 9);
        }
    }

    public static final void i(gc1 gc1Var, y81 y81Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        Object obj;
        String str;
        uob uobVar;
        gc1 gc1Var2 = gc1Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1253885609);
        int i2 = i | (p65Var2.f(gc1Var2) ? 4 : 2) | (p65Var2.f(y81Var) ? 32 : 16) | 384;
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var2, 0);
            long j = p65Var2.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var2, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarJ = ka1.j((jp7) p65Var2.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var2, 0);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarE);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA2);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 0.0f, 6.0f, 0.0f, 0.0f, 13);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j5 = p65Var2.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL5 = p65Var2.l();
            r28 r28VarR5 = gx1.R(p65Var2, r28VarG);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL5);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR5);
            gc1Var2 = gc1Var;
            fc1 fc1Var = gc1Var2.e;
            int i8 = gc1Var2.h;
            Integer num = gc1Var2.j;
            String str2 = fc1Var.d;
            hl0 hl0Var = hl0.M;
            zw7 zw7Var = fc1Var.e;
            r28 r28VarN = bgf.N(o28Var, "creator_avatar");
            int i9 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i10 = i2 & 14;
            boolean z = (i9 == 32) | (i10 == 4);
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z || objM == uobVar2) {
                str = str2;
                uobVar = uobVar2;
                objM = new m91(0, y81Var, gc1Var2);
                p65Var2.j0(objM);
            } else {
                str = str2;
                uobVar = uobVar2;
            }
            uob uobVar3 = uobVar;
            d46.a(str, hl0Var, r28VarN, zw7Var, null, null, null, 0.0f, 0, null, (m45) objM, p65Var2, 432, 0, 2032);
            hp7.t(p65Var2, jfc.p(o28Var, 12.0f));
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var2, 0);
            long j6 = p65Var2.T;
            int i11 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL6 = p65Var2.l();
            r28 r28VarR6 = gx1.R(p65Var2, sq6Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA3);
            tp7.B(p65Var2, cuVar2, i89VarL6);
            ka1.z(i11, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR6);
            String strW = gc1Var2.e.b;
            if (strW == null) {
                strW = km4.w(p65Var2, -20511312, R.string.common_unknown_user, p65Var2, false);
            } else {
                p65Var2.Y(-20512118);
                p65Var2.p(false);
            }
            String str3 = strW;
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var2.j(sn3Var)).l;
            r28 r28VarN2 = bgf.N(o28Var, "creator_name");
            boolean z2 = (i9 == 32) | (i10 == 4);
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar3) {
                objM2 = new m91(1, y81Var, gc1Var2);
                p65Var2.j0(objM2);
            }
            jjd.b(str3, hlg.r(r28VarN2, false, null, null, (m45) objM2, 15), 0L, 0L, 0L, null, null, 0L, 0, false, 3, 0, null, mkdVar, p65Var2, 0, 24576, 114684);
            hp7.t(p65Var2, jfc.e(o28Var, 4.0f));
            p65Var2.Y(-20485602);
            kx kxVar = new kx();
            kxVar.d(vo7.T((Context) p65Var2.j(eo.b), gc1Var2.d));
            if (i8 > 0) {
                p65Var2.Y(335848832);
                kxVar.d("\u2002·\u2002");
                kxVar.d(vo7.D(R.plurals.n_stories, i8, new Object[]{String.valueOf(i8)}, p65Var2));
            } else {
                p65Var2.Y(280048615);
            }
            p65Var2.p(false);
            if (num == null || num.intValue() <= 0) {
                p65Var2.Y(280048615);
            } else {
                p65Var2.Y(336457331);
                kxVar.d("\u2002·\u2002");
                kxVar.d(vo7.D(R.plurals.n_saves, num.intValue(), new Object[]{dq1.g(num)}, p65Var2));
            }
            p65Var2.p(false);
            if (gc1Var2.i) {
                kxVar.d("  ");
                vc2.B(kxVar, "private_icon", "�");
            }
            mx mxVarI = kxVar.i();
            p65Var2.p(false);
            mkd mkdVar2 = ((bu7) p65Var2.j(sn3Var)).m;
            r28 r28VarN3 = bgf.N(o28Var, "info");
            Map mapSingletonMap = Collections.singletonMap("private_icon", new i26(new w99(en7.B(12), en7.B(12), 7), yi2.k));
            mapSingletonMap.getClass();
            jjd.c(mxVarI, r28VarN3, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, mapSingletonMap, null, mkdVar2, p65Var2, 48, 0, 196604);
            p65Var2.p(true);
            p65Var2.p(true);
            hp7.t(p65Var2, jfc.e(o28Var, 24.0f));
            p65Var2.Y(1953275922);
            String strA = af1.a(gc1Var2.b, p65Var2);
            if (strA.length() > 60) {
                p65Var2.Y(1033629298);
                strA = muc.x0(60, strA) + vo7.R(p65Var2, R.string.ellipsis);
                p65Var2.p(false);
            } else {
                p65Var2.Y(1033734884);
                p65Var2.p(false);
            }
            p65Var2.p(false);
            jjd.b(strA, bgf.N(jfc.d(o28Var, 1.0f), "name"), 0L, 0L, 0L, null, null, 0L, 2, false, 5, 0, null, ((bu7) p65Var2.j(sn3Var)).h, p65Var2, 48, 24960, 110588);
            p65 p65Var3 = p65Var2;
            String str4 = gc1Var2.c;
            if (str4 == null) {
                p65Var3.Y(422684139);
            } else {
                p65Var3.Y(422684140);
                p65Var3.Y(1953299663);
                if (str4.length() > 280) {
                    p65Var3.Y(1253581469);
                    str4 = muc.x0(280, str4) + vo7.R(p65Var3, R.string.ellipsis);
                    p65Var3.p(false);
                } else {
                    p65Var3.Y(1253694991);
                    p65Var3.p(false);
                }
                p65Var3.p(false);
                hp7.t(p65Var3, jfc.e(o28Var, 8.0f));
                jjd.b(str4, bgf.N(jfc.d(o28Var, 1.0f), "description"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(sn3Var)).r, p65Var3, 48, 0, 131068);
                p65Var3 = p65Var3;
            }
            p65Var3.p(false);
            ho2.N(p65Var3, true, true, true, true);
            hp7.t(p65Var3, jfc.e(o28Var, 24.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var3, null);
            p65Var = p65Var3;
            obj = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i, 8, gc1Var2, y81Var, obj);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0207  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x016d A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x018a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0197  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(final defpackage.gc1 r26, final defpackage.kv6 r27, final defpackage.y81 r28, final defpackage.sh9 r29, final defpackage.jt4 r30, defpackage.r28 r31, defpackage.x12 r32, int r33) {
        /*
            Method dump skipped, instruction units count: 586
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y91.j(gc1, kv6, y81, sh9, jt4, r28, x12, int):void");
    }

    public static final void k(hc1 hc1Var, y81 y81Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-228652028);
        int i2 = i | (p65Var.f(hc1Var) ? 4 : 2) | (p65Var.f(y81Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            r28 r28VarA = iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var);
            b24 b24Var = hc1Var.a;
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                sc0 sc0Var = new sc0(0, y81Var, y81.class, "onRefresh", "onRefresh()V", 0, 20);
                p65Var.j0(sc0Var);
                objM = sc0Var;
            }
            iq7.a(b24Var, r28VarA, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i, 6, hc1Var, y81Var, r28Var);
        }
    }

    public static final void l(v81 v81Var, r28 r28Var, x12 x12Var, int i) {
        v81 v81Var2;
        ar0 ar0Var = z46.h;
        yq0 yq0Var = z46.p;
        rz5 rz5Var = qb8.c;
        ar0 ar0Var2 = z46.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1392623664);
        int i2 = i | (p65Var.f(v81Var) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            long j = ((zo7) p65Var.j(kt7.b)).b;
            r28 r28VarV = m40.V(r28Var, p65Var, (i2 >> 3) & 14);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
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
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j6 = p65Var.T;
            int i7 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            o28 o28Var2 = o28Var;
            r28 r28VarG = w2g.G(jfc.d(o28Var2, 1.0f), 0.0f, 6.0f, 0.0f, 0.0f, 13);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            ar0 ar0Var3 = ar0Var;
            ar0 ar0Var4 = ar0Var2;
            long j7 = p65Var.T;
            int i8 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            boolean z = false;
            d46.d(hl0.M, null, j, p65Var, 6, 2);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.p(o28Var2, 12.0f));
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA3 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j8 = p65Var.T;
            int i9 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL7 = p65Var.l();
            r28 r28VarR7 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA3);
            tp7.B(p65Var, cuVar2, i89VarL7);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR7);
            sn3 sn3Var = jt7.c;
            long j9 = j;
            boolean z2 = true;
            ok7.s(0.0f, 48, 4, j9, p65Var, jfc.p(o28Var2, 160.0f), ((bu7) p65Var.j(sn3Var)).l);
            hp7.t(p65Var, jfc.e(o28Var2, 4.0f));
            ok7.s(0.0f, 48, 4, j9, p65Var, jfc.p(o28Var2, 140.0f), ((bu7) p65Var.j(sn3Var)).m);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.e(o28Var2, 24.0f));
            ok7.s(0.0f, 48, 4, j9, p65Var, jfc.p(o28Var2, 120.0f), ((bu7) p65Var.j(sn3Var)).h);
            hp7.t(p65Var, jfc.e(o28Var2, 8.0f));
            ok7.s(0.0f, 48, 4, j9, p65Var, jfc.p(o28Var2, 280.0f), ((bu7) p65Var.j(sn3Var)).r);
            b09.H(p65Var, true, true, true);
            hp7.t(p65Var, jfc.e(o28Var2, 24.0f));
            tp7.c(0.0f, 0, 5, j9, p65Var, null);
            p65Var.Y(631907888);
            int i10 = 0;
            while (i10 < 5) {
                r28 r28VarJ2 = ka1.j((jp7) p65Var.j(kt7.a), o28Var2, 3, 1.0f);
                ar0 ar0Var5 = ar0Var3;
                zk7 zk7VarC4 = dy0.c(ar0Var5, z);
                long j10 = p65Var.T;
                int i11 = (int) (j10 ^ (j10 >>> 32));
                i89 i89VarL8 = p65Var.l();
                r28 r28VarR8 = gx1.R(p65Var, r28VarJ2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC4);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL8);
                Integer numValueOf2 = Integer.valueOf(i11);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR8);
                o28 o28Var3 = o28Var2;
                ar0Var3 = ar0Var5;
                r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                long j11 = j9;
                ar0 ar0Var6 = ar0Var4;
                zk7 zk7VarC5 = dy0.c(ar0Var6, z);
                rz5 rz5Var2 = rz5Var;
                long j12 = p65Var.T;
                int i12 = (int) (j12 ^ (j12 >>> 32));
                i89 i89VarL9 = p65Var.l();
                r28 r28VarR9 = gx1.R(p65Var, r28VarD2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC5);
                tp7.B(p65Var, cuVar6, i89VarL9);
                ka1.z(i12, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR9);
                wv1 wv1VarA4 = uv1.a(rz5Var2, yq0Var, p65Var, 0);
                long j13 = p65Var.T;
                int i13 = (int) (j13 ^ (j13 >>> 32));
                i89 i89VarL10 = p65Var.l();
                r28 r28VarR10 = gx1.R(p65Var, o28Var3);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, wv1VarA4);
                tp7.B(p65Var, cuVar6, i89VarL10);
                ka1.z(i13, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR10);
                if (i10 > 0) {
                    p65Var.Y(239536064);
                    j9 = j11;
                    tp7.c(0.5f, 384, 1, j9, p65Var, null);
                    z = false;
                } else {
                    j9 = j11;
                    z = false;
                    p65Var.Y(174746715);
                }
                p65Var.p(z);
                c(z ? 1 : 0, j9, p65Var, null);
                if (i10 < 4) {
                    p65Var.Y(239867392);
                    tp7.c(0.5f, 384, 1, j9, p65Var, null);
                } else {
                    p65Var.Y(174746715);
                }
                p65Var.p(z);
                z2 = true;
                p65Var.p(true);
                p65Var.p(true);
                p65Var.p(true);
                i10++;
                ar0Var4 = ar0Var6;
                o28Var2 = o28Var3;
                rz5Var = rz5Var2;
            }
            p65Var.p(z);
            p65Var.p(z2);
            v81Var2 = v81Var;
            r40.i(v81Var2, og8.a, iy0.a.a(o28Var2, z46.k), p65Var, (i2 & 14) | 48);
            p65Var.p(z2);
        } else {
            v81Var2 = v81Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(v81Var2, r28Var, i, 20);
        }
    }
}
