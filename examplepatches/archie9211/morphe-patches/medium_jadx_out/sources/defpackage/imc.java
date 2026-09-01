package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.models.EntityType;
import com.medium.reader.R;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class imc {
    public static final jy8 a = w2g.h(0.0f, 28.0f, 0.0f, 32.0f, 5);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v23 */
    /* JADX WARN: Type inference failed for: r3v6 */
    /* JADX WARN: Type inference failed for: r3v7, types: [boolean, int] */
    public static final void a(kmc kmcVar, obe obeVar, r28 r28Var, hy8 hy8Var, x12 x12Var, int i, int i2) {
        hy8 hy8Var2;
        int i3;
        r28 r28Var2;
        hy8 hy8Var3;
        p65 p65Var;
        ?? r3;
        o28 o28Var;
        p65 p65Var2;
        p65 p65Var3;
        boolean z;
        o28 o28Var2;
        p65 p65Var4;
        kmcVar.getClass();
        jmc jmcVar = kmcVar.g;
        String str = kmcVar.c;
        Long l = kmcVar.f;
        p65 p65Var5 = (p65) x12Var;
        p65Var5.a0(-2134557211);
        int i4 = i | (p65Var5.f(kmcVar) ? 4 : 2) | (p65Var5.f(obeVar) ? 32 : 16);
        int i5 = i4 | 384;
        int i6 = i2 & 8;
        if (i6 != 0) {
            i3 = i4 | 3456;
            hy8Var2 = hy8Var;
        } else {
            hy8Var2 = hy8Var;
            i3 = i5 | (p65Var5.f(hy8Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        }
        if (p65Var5.P(i3 & 1, (i3 & 1171) != 1170)) {
            if (i6 != 0) {
                hy8Var2 = a;
            }
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i8 = i3 & 14;
            boolean z2 = (i7 == 32) | (i8 == 4);
            Object objM = p65Var5.M();
            Object obj = w12.a;
            n92 n92Var = null;
            Object obj2 = objM;
            if (z2 || objM == obj) {
                Object n79Var = new n79(obeVar, kmcVar, n92Var, 18);
                p65Var5.j0(n79Var);
                obj2 = n79Var;
            }
            kyd.k(p65Var5, (b55) obj2, c1e.a);
            o28 o28Var3 = o28.b;
            r28 r28VarD = jfc.d(o28Var3, 1.0f);
            boolean z3 = (i8 == 4) | (i7 == 32);
            Object objM2 = p65Var5.M();
            Object obj3 = objM2;
            if (z3 || objM2 == obj) {
                Object nbbVar = new nbb(obeVar, 11, kmcVar);
                p65Var5.j0(nbbVar);
                obj3 = nbbVar;
            }
            r28 r28VarB = w2g.B(hlg.r(r28VarD, false, null, null, (m45) obj3, 15), hy8Var2);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var5, 0);
            long j = p65Var5.T;
            int i9 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var5.l();
            r28 r28VarR = gx1.R(p65Var5, r28VarB);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var5.c0();
            if (p65Var5.S) {
                p65Var5.k(m45Var);
            } else {
                p65Var5.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var5, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var5, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i9);
            cu cuVar3 = q12.g;
            tp7.B(p65Var5, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var5, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var5, cuVar4, r28VarR);
            r28 r28VarG = w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var5, 0);
            hy8 hy8Var4 = hy8Var2;
            long j2 = p65Var5.T;
            int i10 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var5.l();
            r28 r28VarR2 = gx1.R(p65Var5, r28VarG);
            p65Var5.c0();
            if (p65Var5.S) {
                p65Var5.k(m45Var);
            } else {
                p65Var5.m0();
            }
            tp7.B(p65Var5, cuVar, ombVarA);
            tp7.B(p65Var5, cuVar2, i89VarL2);
            ka1.z(i10, p65Var5, cuVar3, p65Var5, fnVar);
            tp7.B(p65Var5, cuVar4, r28VarR2);
            int i11 = i3;
            d46.a(kmcVar.d, hl0.M, w2g.G(o28Var3, 0.0f, 4.0f, 0.0f, 0.0f, 13), kmcVar.e, null, null, null, 0.0f, 0, null, null, p65Var5, 432, 0, 4080);
            p65 p65Var6 = p65Var5;
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var3, 12.0f, 4.0f, 12.0f, 0.0f, 8), true);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var6, 0);
            long j3 = p65Var6.T;
            int i12 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var6.l();
            r28 r28VarR3 = gx1.R(p65Var6, r28VarU);
            p65Var6.c0();
            if (p65Var6.S) {
                p65Var6.k(m45Var);
            } else {
                p65Var6.m0();
            }
            tp7.B(p65Var6, cuVar, wv1VarA2);
            tp7.B(p65Var6, cuVar2, i89VarL3);
            ka1.z(i12, p65Var6, cuVar3, p65Var6, fnVar);
            tp7.B(p65Var6, cuVar4, r28VarR3);
            if (str != null) {
                p65Var6.Y(-1179402851);
                String upperCase = str.toUpperCase(Locale.ROOT);
                upperCase.getClass();
                o28Var = o28Var3;
                r3 = 0;
                jjd.b(upperCase, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var6.j(jt7.c)).w, ((zo7) p65Var6.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var6, 0, 0, 131070);
                p65 p65Var7 = p65Var6;
                hp7.t(p65Var7, jfc.e(o28Var, 2.0f));
                p65Var2 = p65Var7;
            } else {
                r3 = 0;
                o28Var = o28Var3;
                p65Var6.Y(-1182503347);
                p65Var2 = p65Var6;
            }
            p65Var2.p(r3);
            String str2 = kmcVar.b;
            d8a d8aVar = jt7.c;
            p65 p65Var8 = p65Var2;
            jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(d8aVar)).j, p65Var8, 0, 0, 131070);
            p65 p65Var9 = p65Var8;
            if (l != null) {
                p65Var9.Y(-1178811526);
                String strG = dq1.g(l);
                int iLongValue = (int) l.longValue();
                Object[] objArr = new Object[1];
                objArr[r3] = strG;
                jjd.b(vo7.D(R.plurals.n_followers, iLongValue, objArr, p65Var9), w2g.G(o28Var, 0.0f, 4.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var9.j(d8aVar)).n, ((zo7) p65Var9.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var9, 48, 0, 131068);
                p65Var3 = p65Var9;
            } else {
                p65Var9.Y(-1182503347);
                p65Var3 = p65Var9;
            }
            p65Var3.p(r3);
            p65Var3.p(true);
            p65Var3.Y(473954098);
            boolean z4 = r3;
            o28 o28Var4 = o28Var;
            n01.x((wu4) guc.x(jmcVar.a, new wu4(kmcVar.a, null, EntityType.AUTHOR, bt4.NOT_FOLLOWING, new ag8(null), kmcVar.i), p65Var3, r3).getValue(), it4.S, obeVar, null, jfc.q(o28Var, 100.0f, 0.0f, 2), null, null, 0L, p65Var3, ((i11 << 3) & 896) | 24624, 232);
            p65Var3.p(z4);
            p65Var3.p(true);
            String str3 = kmcVar.h;
            if (str3 == null || muc.b0(str3)) {
                z = z4 ? 1 : 0;
                o28Var2 = o28Var4;
                p65Var3.Y(1859938803);
                p65Var4 = p65Var3;
            } else {
                p65Var3.Y(1865529963);
                String str4 = kmcVar.h;
                r28 r28VarG2 = w2g.G(o28Var4, 24.0f, 10.0f, 24.0f, 0.0f, 8);
                o28Var2 = o28Var4;
                mkd mkdVarA = mkd.a(((bu7) p65Var3.j(d8aVar)).m, ((zo7) p65Var3.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                p65 p65Var10 = p65Var3;
                z = z4 ? 1 : 0;
                jjd.b(str4, r28VarG2, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var10, 48, 0, 131068);
                p65Var4 = p65Var10;
            }
            p65Var4.p(z);
            p65Var4.p(true);
            r28Var2 = o28Var2;
            hy8Var3 = hy8Var4;
            p65Var = p65Var4;
        } else {
            p65Var5.S();
            r28Var2 = r28Var;
            hy8Var3 = hy8Var2;
            p65Var = p65Var5;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(kmcVar, obeVar, r28Var2, hy8Var3, i, i2, 18);
        }
    }

    public static final void b(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        r28 r28Var2;
        long j3;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2062191227);
        int i2 = i | 22;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).b;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j3 = j;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarV = m40.V(jfc.d(r28Var3, 1.0f), p65Var, 0);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            r28 r28Var4 = r28Var3;
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
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
            dy0.a(flb.a0(jfc.l(w2g.G(o28Var, 0.0f, 8.0f, 0.0f, 0.0f, 13), hl0.M.m114getSizeD9Ej5fM()), j3, bmb.a), p65Var, 0);
            long j6 = j3;
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 10.0f, 4.0f, 10.0f, 0.0f, 8), true);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j7 = p65Var.T;
            int i6 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarU);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(966682537);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).j.a.b);
            p65Var.p(false);
            r28 r28VarD = jfc.d(jfc.e(o28Var, fZ), 0.5f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarD, j6, nr5Var), p65Var, 0);
            p65Var.Y(966694569);
            m73 m73Var2 = (m73) p65Var.j(sn3Var);
            mkd mkdVar = ((bu7) p65Var.j(sn3Var2)).j;
            float fZ2 = m73Var2.z(mkdVar.b.c) - m73Var2.z(mkdVar.a.b);
            p65Var.p(false);
            hp7.t(p65Var, jfc.e(o28Var, fZ2));
            p65Var.Y(966705059);
            float fZ3 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).n.a.b);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.G(o28Var, 0.0f, 4.0f, 0.0f, 0.0f, 13), fZ3), 0.55f), j6, nr5Var), p65Var, 0);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.m(o28Var, 100.0f, 32.0f), j6, bmb.a(16.0f)), p65Var, 0);
            p65Var.p(true);
            mkd mkdVar2 = ((bu7) p65Var.j(sn3Var2)).m;
            float fZ4 = ((m73) p65Var.j(sn3Var)).z(mkdVar2.a.b);
            m73 m73Var3 = (m73) p65Var.j(sn3Var);
            float fZ5 = m73Var3.z(mkdVar2.b.c) - m73Var3.z(mkdVar2.a.b);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.G(o28Var, 24.0f, 10.0f, 24.0f, 0.0f, 8), fZ4), 0.9f), j6, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, fZ5));
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), fZ4), 0.7f), j6, nr5Var), p65Var, 0);
            lv8.y(o28Var, 32.0f, p65Var, true);
            j2 = j6;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            j2 = j;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i, 17);
        }
    }
}
