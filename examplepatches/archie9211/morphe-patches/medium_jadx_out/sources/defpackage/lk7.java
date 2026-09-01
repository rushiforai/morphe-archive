package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.util.Patterns;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class lk7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    /* JADX WARN: Code restructure failed: missing block: B:67:0x01d9, code lost:
    
        r0 = defpackage.qo7.k(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01dd, code lost:
    
        defpackage.xz5.F(r2, null);
        r10 = r0;
     */
    /* JADX WARN: Finally extract failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.s7d A(defpackage.anb r29, java.lang.String r30) {
        /*
            Method dump skipped, instruction units count: 511
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lk7.A(anb, java.lang.String):s7d");
    }

    public static final hec B(hec hecVar, List list, uvd uvdVar) {
        hecVar.getClass();
        list.getClass();
        uvdVar.getClass();
        if (list.isEmpty() && uvdVar == hecVar.i0()) {
            return hecVar;
        }
        if (list.isEmpty()) {
            return hecVar.p0(uvdVar);
        }
        if (!(hecVar instanceof i24)) {
            return pwd.Y(uvdVar, hecVar.j0(), list, hecVar.k0());
        }
        i24 i24Var = (i24) hecVar;
        zvd zvdVar = i24Var.b;
        s14 s14Var = i24Var.c;
        k24 k24Var = i24Var.d;
        boolean z = i24Var.f;
        String[] strArr = i24Var.g;
        return new i24(zvdVar, s14Var, k24Var, list, z, (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public static mn6 C(mn6 mn6Var, List list, ly lyVar, int i) {
        if ((i & 2) != 0) {
            lyVar = mn6Var.getAnnotations();
        }
        mn6Var.getClass();
        if ((list.isEmpty() || list == mn6Var.h0()) && lyVar == mn6Var.getAnnotations()) {
            return mn6Var;
        }
        uvd uvdVarI0 = mn6Var.i0();
        if ((lyVar instanceof xh4) && ((xh4) lyVar).isEmpty()) {
            lyVar = cd7.e;
        }
        uvd uvdVarN = pr7.n(uvdVarI0, lyVar);
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof zm4) {
            zm4 zm4Var = (zm4) o3eVarM0;
            return pwd.K(B(zm4Var.b, list, uvdVarN), B(zm4Var.c, list, uvdVarN));
        }
        if (o3eVarM0 instanceof hec) {
            return B((hec) o3eVarM0, list, uvdVarN);
        }
        ygf.a();
        return null;
    }

    public static /* synthetic */ hec D(hec hecVar, List list, uvd uvdVar, int i) {
        if ((i & 1) != 0) {
            list = hecVar.h0();
        }
        if ((i & 2) != 0) {
            uvdVar = hecVar.i0();
        }
        return B(hecVar, list, uvdVar);
    }

    public static final Object E(b55 b55Var) {
        Thread.interrupted();
        return g01.U(zx3.a, new n79(b55Var, null, 16));
    }

    public static int G(int i) {
        return (int) (((long) Integer.rotateLeft((int) (((long) i) * (-862048943)), 15)) * 461845907);
    }

    public static int H(fyf fyfVar) {
        Iterator it2 = fyfVar.iterator();
        int iHashCode = 0;
        while (it2.hasNext()) {
            Object next = it2.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }

    public static void I(long[] jArr, long[] jArr2, int i) {
        for (int i2 = 0; i2 < 10; i2++) {
            int i3 = (int) jArr[i2];
            jArr[i2] = ((-i) & (((int) jArr2[i2]) ^ i3)) ^ i3;
        }
    }

    public static final void a(if8 if8Var, my6 my6Var, r28 r28Var, boolean z, x12 x12Var, int i) {
        r28 r28Var2;
        boolean z2;
        boolean z3;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2025224640);
        int i2 = i | (p65Var.f(if8Var) ? 4 : 2) | (p65Var.h(my6Var) ? 32 : 16) | 384 | (p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            mq7.e(if8Var, my6Var, new dr5(z46.q), p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var2, 24.0f));
            String str = if8Var.d;
            if (str == null || z) {
                z2 = true;
                z3 = false;
                o28Var = o28Var2;
                p65Var.Y(-1111579336);
            } else {
                p65Var.Y(-1086907955);
                z2 = true;
                z3 = false;
                o28Var = o28Var2;
                jjd.b(vo7.Q(R.string.publication_newsletter_sent_by_newsletter, new Object[]{str}, p65Var), bgf.N(w2g.E(jfc.d(o28Var2, 1.0f), 24.0f, 0.0f, 2), "pub_newsletter_feed_header_sent_by"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
                p65Var = p65Var;
            }
            p65Var.p(z3);
            p65Var.p(z2);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(if8Var, my6Var, r28Var2, z, i);
        }
    }

    public static final void b(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1832478168);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            mq7.f(new dr5(yq0Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(1546445454);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).m.b.c);
            p65Var.p(false);
            dy0.a(m40.V(flb.a0(jfc.d(jfc.e(o28Var, fZ), 0.3f), ((zo7) p65Var.j(kt7.b)).c, rv8.r), p65Var, 0), p65Var, 0);
            p65Var.p(true);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 13);
        }
    }

    public static final void c(int i, x12 x12Var, x45 x45Var, r28 r28Var, String str, boolean z) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        long j;
        str.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1072870796);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        int i3 = i2 | 27648;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            o28 o28Var = o28.b;
            r28 r28VarE = o7f.E(w2g.C(o28Var, 16.0f), x45Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 48);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
            if (z) {
                p65Var2.Y(986516670);
                j = ((zo7) p65Var2.j(kt7.b)).n;
                p65Var2.p(false);
            } else {
                p65Var2.Y(986606012);
                j = ((zo7) p65Var2.j(kt7.b)).o;
                p65Var2.p(false);
            }
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, j, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, i3 & 14, 0, 131070);
            p65Var = p65Var2;
            p65Var.Y(985027058);
            p65Var.p(false);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w61(i, x45Var, r28Var2, str, z);
        }
    }

    public static final void d(mz1 mz1Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1677843913);
        int i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            mz1Var.invoke(p65Var, Integer.valueOf(i2 & 14));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var, i, 7);
        }
    }

    public static final void e(float f, r28 r28Var, x12 x12Var, int i) {
        float f2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(191334355);
        int i2 = 2;
        int i3 = (p65Var.c(f) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        int i4 = 0;
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            f2 = f;
            p65Var.S();
        } else {
            if (0.0f > f || f > 1.0f) {
                ygf.f("scrollProgress should be between 0f and 1f.");
                return;
            }
            upc upcVarB = zu.b(f, f76.Q(150, 0, ao3.d, 2), "scrollbar_thumb", p65Var, (i3 & 14) | 3072, 20);
            f2 = f;
            sn3 sn3Var = kt7.b;
            long jB = uu1.b(0.2f, ((zo7) p65Var.j(sn3Var)).o);
            long jB2 = uu1.b(0.2f, ((zo7) p65Var.j(sn3Var)).n);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new hb8(28);
                p65Var.j0(objM);
            }
            r40.h(flb.a0(jfc.p(jfc.c(gx1.E(r28Var, new cv(i2, (x45) objM)), 1.0f), 4.0f), jB, bmb.a), null, pxf.E(-1472257111, new pe1(i2, jB2, upcVarB), p65Var), p65Var, 3072, 6);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kj9(f2, r28Var, i, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x034f  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x035b  */
    /* JADX WARN: Removed duplicated region for block: B:116:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00be  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.j4a r58, defpackage.x45 r59, defpackage.x45 r60, defpackage.r28 r61, boolean r62, java.lang.String r63, java.lang.Integer r64, defpackage.m45 r65, defpackage.sr4 r66, defpackage.x12 r67, int r68, int r69) {
        /*
            Method dump skipped, instruction units count: 879
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lk7.f(j4a, x45, x45, r28, boolean, java.lang.String, java.lang.Integer, m45, sr4, x12, int, int):void");
    }

    public static final void g(gka gkaVar, xja xjaVar, my6 my6Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-459471293);
        int i2 = i | (p65Var.f(gkaVar) ? 4 : 2) | (p65Var.f(xjaVar) ? 32 : 16) | (p65Var.h(my6Var) ? 256 : 128) | (p65Var.f(sh9Var) ? 2048 : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            kv6 kv6VarA = pv6.a(p65Var);
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            boolean zH = ((i2 & 14) == 4) | p65Var.h(my6Var) | p65Var.d(stcVar.ordinal()) | ((i2 & 7168) == 2048);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                iu iuVar = new iu(gkaVar, my6Var, stcVar, sh9Var, 21);
                p65Var.j0(iuVar);
                objM = iuVar;
            }
            k40.t(r28Var, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var, (i2 >> 12) & 14, 508);
            boolean zF = p65Var.f(kv6VarA);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = zF | (i3 == 32);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z || objM2 == uobVar) {
                objM2 = new nx9(kv6VarA, xjaVar, n92Var, 15);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            boolean z2 = i3 == 32;
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                objM3 = new lo5(xjaVar, n92Var, 25);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(gkaVar, xjaVar, my6Var, sh9Var, r28Var, i, 19);
        }
    }

    public static final void h(hka hkaVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(628785283);
        int i2 = (p65Var.f(hkaVar) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(hkaVar.a, null, null, null, null, null, null, null, p65Var, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(hkaVar, r28Var, i, 28);
        }
    }

    public static final void i(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-306698741);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            b(null, p65Var, 0);
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            p65Var.Y(-1132792666);
            for (int i6 = 0; i6 < 10; i6++) {
                il7.l(stcVar, null, 0L, null, p65Var, 0, 14);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:70:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(defpackage.jka r18, defpackage.nhc r19, defpackage.xja r20, defpackage.my6 r21, defpackage.sh9 r22, defpackage.r28 r23, defpackage.x12 r24, int r25, int r26) {
        /*
            Method dump skipped, instruction units count: 277
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lk7.j(jka, nhc, xja, my6, sh9, r28, x12, int, int):void");
    }

    public static final void k(String str, String str2, zm7 zm7Var, r28 r28Var, pka pkaVar, x12 x12Var, int i) {
        r28 r28Var2;
        pka pkaVar2;
        r28 r28Var3;
        pka pkaVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-586755443);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(zm7Var) ? 256 : 128) | 11264;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            int i3 = i & 1;
            uob uobVar = w12.a;
            if (i3 == 0 || p65Var.z()) {
                boolean z = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 13);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    pka pkaVar4 = (pka) to7.z(n1b.a.b(pka.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                    pkaVar3 = pkaVar4;
                }
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                pkaVar3 = pkaVar;
            }
            p65Var.q();
            Resources resources = (Resources) p65Var.j(eo.c);
            l78 l78VarZ = guc.z(pkaVar3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            xja xjaVar = new xja(pkaVar3, zm7Var);
            my6 my6Var = new my6(pkaVar3);
            md3 md3Var = new md3(zm7Var, 7, pkaVar3);
            r28 r28Var4 = r28Var3;
            j((jka) l78VarZ.getValue(), nhcVarF, xjaVar, my6Var, md3Var, r28Var4, p65Var, 196608, 0);
            boolean zH = p65Var.h(pkaVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(xjaVar) | p65Var.f(md3Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                uk8 uk8Var = new uk8(pkaVar3, nhcVarF, resources, xjaVar, md3Var, (n92) null);
                p65Var.j0(uk8Var);
                objM2 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = r28Var4;
            pkaVar2 = pkaVar3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            pkaVar2 = pkaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) zm7Var, r28Var2, (que) pkaVar2, i, 18);
        }
    }

    public static final zwa l(long j, long j2) {
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        return new zwa(Float.intBitsToFloat(i), Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j2 >> 32)) + Float.intBitsToFloat(i), Float.intBitsToFloat((int) (j2 & 4294967295L)) + Float.intBitsToFloat(i2));
    }

    public static final void m(j8b j8bVar, k8b k8bVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        boolean z;
        boolean z2;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-958451118);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(j8bVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(k8bVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            dr9 dr9Var = j8bVar.i;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            boolean zF = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4) | p65Var.f(dr9Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new i16(j8bVar, k8bVar, dr9Var, 20);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, null, false, null, null, g01.n, p65Var, 1572864, 62);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28.b);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            if (j8bVar.k.k) {
                p65Var.Y(652828098);
                Object objM3 = p65Var.M();
                if (objM3 == uobVar) {
                    l78Var = l78Var2;
                    objM3 = new z7b(l78Var, 2);
                    p65Var.j0(objM3);
                } else {
                    l78Var = l78Var2;
                }
                z2 = true;
                f49.l((m45) objM3, null, false, null, null, pxf.E(1382423797, new vh9(dr9Var, 1 == true ? 1 : 0), p65Var), p65Var, 1572870, 62);
                boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
                Object objM4 = p65Var.M();
                if (objM4 == uobVar) {
                    objM4 = new z7b(l78Var, 3);
                    p65Var.j0(objM4);
                }
                z = false;
                xp7.b(zBooleanValue, (m45) objM4, null, 0L, null, null, null, 0L, 0.0f, pxf.E(960384594, new ov2(j8bVar, dr9Var, k8bVar, l78Var, 20), p65Var), p65Var, 48, 2044);
                p65Var = p65Var;
            } else {
                z = false;
                z2 = true;
                p65Var.Y(645622086);
            }
            p65Var.p(z);
            p65Var.p(z2);
            p65Var.p(z2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 22, j8bVar, k8bVar, r28Var);
        }
    }

    public static final void n(j8b j8bVar, dr9 dr9Var, k8b k8bVar, m45 m45Var, x12 x12Var, int i) {
        boolean z;
        g08 g08Var;
        boolean z2;
        uob uobVar;
        i8b i8bVar;
        boolean z3;
        boolean z4;
        g08 g08Var2;
        boolean z5;
        g08 g08Var3;
        boolean z6;
        int i2;
        o28 o28Var;
        Object a8bVar;
        g08 g08Var4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(907112173);
        int i3 = i | (p65Var.f(j8bVar) ? 4 : 2) | (p65Var.f(dr9Var) ? 32 : 16) | (p65Var.f(k8bVar) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            i8b i8bVar2 = j8bVar.k;
            boolean z7 = i8bVar2.a;
            g08 g08Var5 = dr9Var.x;
            boolean z8 = i8bVar2.c;
            boolean z9 = i8bVar2.b;
            uob uobVar2 = w12.a;
            o28 o28Var2 = o28.b;
            if (z7) {
                p65Var.Y(-155184103);
                bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.repost_item_edit_note), false, null, null, 30);
                boolean zF = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256) | ((i3 & 14) == 4) | p65Var.f(g08Var5);
                Object objM = p65Var.M();
                if (zF || objM == uobVar2) {
                    z = z8;
                    uobVar = uobVar2;
                    z2 = z9;
                    a8bVar = new a8b(k8bVar, dr9Var, j8bVar, g08Var5, m45Var, 0);
                    g08Var4 = g08Var5;
                    p65Var.j0(a8bVar);
                } else {
                    z = z8;
                    g08Var4 = g08Var5;
                    uobVar = uobVar2;
                    a8bVar = objM;
                    z2 = z9;
                }
                z3 = z7;
                i8bVar = i8bVar2;
                g08Var = g08Var4;
                aq7.b(bq7Var, (m45) a8bVar, bgf.N(o28Var2, "edit_repost_note"), 0L, 0L, p65Var, 384, 24);
                z4 = false;
            } else {
                z = z8;
                g08Var = g08Var5;
                z2 = z9;
                uobVar = uobVar2;
                i8bVar = i8bVar2;
                z3 = z7;
                z4 = false;
                p65Var.Y(-164175467);
            }
            p65Var.p(z4);
            if (z2) {
                p65Var.Y(-154613021);
                bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.repost_item_remove_note), false, null, null, 30);
                g08 g08Var6 = g08Var;
                boolean zF2 = ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(g08Var6);
                Object objM2 = p65Var.M();
                if (zF2 || objM2 == uobVar) {
                    b8b b8bVar = new b8b(k8bVar, dr9Var, g08Var6, m45Var, 0);
                    p65Var.j0(b8bVar);
                    objM2 = b8bVar;
                }
                g08Var2 = g08Var6;
                aq7.b(bq7Var2, (m45) objM2, bgf.N(o28Var2, "remove_repost_note"), 0L, 0L, p65Var, 384, 24);
                z5 = false;
            } else {
                g08Var2 = g08Var;
                z5 = false;
                p65Var.Y(-164175467);
            }
            p65Var.p(z5);
            if (z) {
                p65Var.Y(-154085556);
                bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.repost_item_add_note), false, null, null, 30);
                g08 g08Var7 = g08Var2;
                boolean zF3 = ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.f(g08Var7);
                Object objM3 = p65Var.M();
                if (zF3 || objM3 == uobVar) {
                    b8b b8bVar2 = new b8b(k8bVar, dr9Var, g08Var7, m45Var, 1);
                    p65Var.j0(b8bVar2);
                    objM3 = b8bVar2;
                }
                g08Var3 = g08Var7;
                aq7.b(bq7Var3, (m45) objM3, bgf.N(o28Var2, "add_repost_note"), 0L, 0L, p65Var, 384, 24);
                z6 = false;
                p65Var.p(false);
                i2 = -164175467;
            } else {
                g08Var3 = g08Var2;
                z6 = false;
                i2 = -164175467;
                p65Var.Y(-164175467);
                p65Var.p(false);
            }
            if (i8bVar.d) {
                p65Var.Y(-153554650);
                if (z3 || z2 || z) {
                    p65Var.Y(-153481118);
                    o28Var = o28Var2;
                    tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var2, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                    p65Var.p(false);
                } else {
                    p65Var.Y(i2);
                    p65Var.p(z6);
                    o28Var = o28Var2;
                }
                bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.user_activity_delete_repost), false, null, null, 30);
                g08 g08Var8 = g08Var3;
                boolean zF4 = ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4) | p65Var.f(g08Var8);
                Object objM4 = p65Var.M();
                if (zF4 || objM4 == uobVar) {
                    a8b a8bVar2 = new a8b(k8bVar, dr9Var, j8bVar, g08Var8, m45Var, 1);
                    p65Var.j0(a8bVar2);
                    objM4 = a8bVar2;
                }
                aq7.b(bq7Var4, (m45) objM4, bgf.N(o28Var, "delete_repost"), 0L, 0L, p65Var, 384, 24);
                z6 = false;
            } else {
                p65Var.Y(i2);
            }
            p65Var.p(z6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c8b(j8bVar, dr9Var, k8bVar, m45Var, i, 0);
        }
    }

    public static final void o(j8b j8bVar, final k8b k8bVar, final sh9 sh9Var, final long j, r28 r28Var, x12 x12Var, final int i, final int i2) {
        r28 r28Var2;
        int i3;
        j8b j8bVar2;
        final r28 r28Var3;
        m45 m45Var;
        boolean z;
        o28 o28Var;
        int i4;
        String str = j8bVar.h;
        k8bVar.getClass();
        sh9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(252040899);
        int i5 = (p65Var.f(j8bVar) ? 4 : 2) | i;
        if ((i & 48) == 0) {
            i5 |= p65Var.f(k8bVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i5 |= p65Var.f(sh9Var) ? 256 : 128;
        }
        int i6 = i5 | (p65Var.e(j) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i7 = i2 & 16;
        if (i7 != 0) {
            i3 = i6 | 24576;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i3 = i6 | (p65Var.f(r28Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            o28 o28Var2 = o28.b;
            r28 r28Var4 = i7 != 0 ? o28Var2 : r28Var2;
            dr9 dr9Var = j8bVar.i;
            r28 r28VarD = jfc.d(r28Var4, 1.0f);
            int i8 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i8 == 32) | p65Var.f(dr9Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new ui9(k8bVar, 26, dr9Var);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r28VarD, false, null, null, (m45) objM, 15), 0.0f, 28.0f, 0.0f, 20.0f, 5), "post_reposted_" + j8bVar.a);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            r28 r28Var5 = r28Var4;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i9 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i9);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String str2 = j8bVar.c;
            String str3 = j8bVar.d;
            boolean z2 = j8bVar.e;
            String strR = vo7.R(p65Var, R.string.user_activity_reposted);
            Long l = j8bVar.g;
            r28 r28VarG = w2g.G(o28Var2, 22.0f, 0.0f, 22.0f, 0.0f, 10);
            if (j8bVar.f) {
                p65Var.Y(439269929);
                boolean z3 = ((i3 & 896) == 256) | ((i3 & 14) == 4);
                Object objM2 = p65Var.M();
                if (z3 || objM2 == uobVar) {
                    objM2 = new ui9(sh9Var, 27, j8bVar);
                    p65Var.j0(objM2);
                }
                m45Var = (m45) objM2;
                p65Var.p(false);
            } else {
                p65Var.Y(439534545);
                p65Var.p(false);
                m45Var = null;
            }
            int i10 = i3;
            w2g.a(str2, str3, z2, R.drawable.ic_repost_16, strR, l, r28VarG, j, m45Var, p65Var, ((i3 << 12) & 29360128) | 1572864, 0);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var2, 16.0f));
            String str4 = "post_reposted_story";
            int i11 = 14;
            if (str != null) {
                p65Var.Y(439712020);
                mkd mkdVar = ((bu7) p65Var.j(jt7.c)).m;
                long j3 = ((zo7) p65Var.j(kt7.b)).z;
                r28 r28VarG2 = w2g.G(o28Var2, 34.0f, 0.0f, 24.0f, 0.0f, 10);
                boolean zF2 = p65Var.f(mkdVar) | p65Var.e(j3);
                Object objM3 = p65Var.M();
                if (zF2 || objM3 == uobVar) {
                    i4 = 0;
                    objM3 = new e8b(mkdVar, j3, i4);
                    p65Var.j0(objM3);
                } else {
                    i4 = 0;
                }
                r28 r28VarG3 = w2g.G(guc.A(r28VarG2, (x45) objM3), 18.0f, 0.0f, 0.0f, 0.0f, 14);
                wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, i4);
                long j4 = p65Var.T;
                int i12 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarG3);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, wv1VarA2);
                tp7.B(p65Var, cuVar2, i89VarL2);
                ka1.z(i12, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR2);
                StringBuilder sb = new StringBuilder(16);
                ArrayList arrayListV = wgd.v();
                new ArrayList();
                sb.append(str);
                Matcher matcher = Patterns.WEB_URL.matcher(str);
                while (matcher.find()) {
                    arrayListV.add(new jx(new b07("web_url", new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, i11), new re0(Uri.parse(matcher.group()), k8bVar, dr9Var, 3)), matcher.start(), matcher.end(), 8));
                    str4 = str4;
                    i11 = 14;
                }
                String str5 = str4;
                String string = sb.toString();
                ArrayList arrayList = new ArrayList(arrayListV.size());
                int size = arrayListV.size();
                for (int i13 = 0; i13 < size; i13 = lv8.i(sb, (jx) arrayListV.get(i13), arrayList, i13, 1)) {
                }
                z = true;
                jjd.c(new mx(string, arrayList), bgf.N(o28Var2, "repost_note"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkdVar, p65Var, 48, 0, 262140);
                p65Var = p65Var;
                Context context = (Context) p65Var.j(eo.b);
                context.getClass();
                float f = r6.widthPixels / context.getResources().getDisplayMetrics().density;
                hp7.t(p65Var, jfc.l(o28Var2, (vj3.a(f, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? 16.0f : 20.0f));
                bo.d(dr9Var, z(true, p65Var), sh9Var, bgf.N(o28Var2, str5), p65Var, ((i10 << 3) & 7168) | 24960);
                p65Var.p(true);
                p65Var.p(false);
                o28Var = o28Var2;
            } else {
                z = true;
                p65Var.Y(441637895);
                o28Var = o28Var2;
                bo.d(dr9Var, z(false, p65Var), sh9Var, bgf.N(w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10), "post_reposted_story"), p65Var, ((i10 << 3) & 7168) | 24960);
                p65Var.p(false);
            }
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            j8bVar2 = j8bVar;
            m(j8bVar2, k8bVar, w2g.G(o28Var, 12.0f, 0.0f, 12.0f, 0.0f, 10), p65Var, (i10 & 14) | 384 | i8);
            p65Var.p(z);
            r28Var3 = r28Var5;
        } else {
            j8bVar2 = j8bVar;
            p65Var.S();
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final j8b j8bVar3 = j8bVar2;
            mwaVarS.d = new b55() { // from class: f8b
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    lk7.o(j8bVar3, k8bVar, sh9Var, j, r28Var3, (x12) obj, tr7.y(i | 1), i2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void p(j8b j8bVar, dr9 dr9Var, k8b k8bVar, m45 m45Var, x12 x12Var, int i) {
        p65 p65Var;
        i8b i8bVar;
        g08 g08Var;
        boolean z;
        int i2;
        i8b i8bVar2;
        j8b j8bVar2;
        o28 o28Var;
        g08 g08Var2;
        o28 o28Var2;
        i8b i8bVar3;
        i8b i8bVar4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2106513538);
        int i3 = i | (p65Var2.f(j8bVar) ? 4 : 2) | (p65Var2.f(dr9Var) ? 32 : 16) | (p65Var2.f(k8bVar) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            i8b i8bVar5 = j8bVar.k;
            g08 g08Var3 = dr9Var.x;
            l78 l78VarX = guc.x(i8bVar5.f, bt4.CANT_FOLLOW, p65Var2, 48);
            boolean z2 = i8bVar5.e;
            o28 o28Var3 = o28.b;
            uob uobVar = w12.a;
            if (z2) {
                p65Var2.Y(1378149850);
                l78 l78VarX2 = guc.x(dr9Var.u.a, Boolean.FALSE, p65Var2, 48);
                bq7 bq7Var = new bq7(vo7.R(p65Var2, ((Boolean) l78VarX2.getValue()).booleanValue() ? R.string.user_activity_unsave_story : R.string.user_activity_save_story), false, Integer.valueOf(((Boolean) l78VarX2.getValue()).booleanValue() ? R.drawable.ic_bookmark_24 : R.drawable.ic_bookmark_add_24), null, 26);
                boolean zF = ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var2.f(g08Var3);
                Object objM = p65Var2.M();
                if (zF || objM == uobVar) {
                    i8bVar = i8bVar5;
                    b8b b8bVar = new b8b(k8bVar, dr9Var, g08Var3, m45Var, 2);
                    g08Var3 = g08Var3;
                    p65Var2.j0(b8bVar);
                    objM = b8bVar;
                } else {
                    i8bVar = i8bVar5;
                }
                z = false;
                g08Var = g08Var3;
                aq7.b(bq7Var, (m45) objM, bgf.N(o28Var3, "save_repost_story"), 0L, 0L, p65Var2, 384, 24);
                p65Var = p65Var2;
            } else {
                i8bVar = i8bVar5;
                g08Var = g08Var3;
                p65Var = p65Var2;
                z = false;
                p65Var.Y(1366313120);
            }
            p65Var.p(z);
            if (i8bVar.h) {
                p65Var.Y(1379276018);
                int i4 = g8b.a[((bt4) l78VarX.getValue()).ordinal()];
                if (i4 == 1) {
                    i2 = i3;
                    i8b i8bVar6 = i8bVar;
                    g08 g08Var4 = g08Var;
                    p65Var.Y(1379310831);
                    bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.user_activity_unfollow_reposter), false, Integer.valueOf(R.drawable.ic_unfollow_24), null, 26);
                    boolean zF2 = ((i2 & 896) == 256 ? true : z) | ((i2 & 14) == 4 ? true : z) | p65Var.f(i8bVar6) | p65Var.f(g08Var4);
                    Object objM2 = p65Var.M();
                    if (zF2 || objM2 == uobVar) {
                        i8bVar3 = i8bVar6;
                        gm1 gm1Var = new gm1(k8bVar, j8bVar, i8bVar3, g08Var4, m45Var, 5);
                        j8bVar2 = j8bVar;
                        p65Var.j0(gm1Var);
                        objM2 = gm1Var;
                    } else {
                        i8bVar3 = i8bVar6;
                        j8bVar2 = j8bVar;
                    }
                    r28 r28VarN = bgf.N(o28Var3, "unfollow_reposter");
                    o28Var = o28Var3;
                    i8bVar2 = i8bVar3;
                    g08Var2 = g08Var4;
                    aq7.b(bq7Var2, (m45) objM2, r28VarN, 0L, 0L, p65Var, 384, 24);
                    p65Var.p(z);
                } else if (i4 == 2) {
                    p65Var.Y(1380131959);
                    bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.user_activity_follow_reposter), false, Integer.valueOf(R.drawable.ic_follow_24), null, 26);
                    g08 g08Var5 = g08Var;
                    boolean zF3 = ((i3 & 896) == 256 ? true : z) | ((i3 & 14) == 4 ? true : z) | p65Var.f(i8bVar) | p65Var.f(g08Var5);
                    Object objM3 = p65Var.M();
                    if (zF3 || objM3 == uobVar) {
                        i2 = i3;
                        i8bVar4 = i8bVar;
                        d8b d8bVar = new d8b(k8bVar, j8bVar, i8bVar4, g08Var5, m45Var);
                        p65Var.j0(d8bVar);
                        objM3 = d8bVar;
                    } else {
                        i2 = i3;
                        i8bVar4 = i8bVar;
                    }
                    aq7.b(bq7Var3, (m45) objM3, bgf.N(o28Var3, "follow_reposter"), 0L, 0L, p65Var, 384, 24);
                    p65Var.p(z);
                    i8bVar2 = i8bVar4;
                    o28Var = o28Var3;
                    g08Var2 = g08Var5;
                    j8bVar2 = j8bVar;
                } else {
                    if (i4 != 3 && i4 != 4) {
                        throw ho2.L(p65Var, 1429966096, z);
                    }
                    p65Var.Y(1430020646);
                    p65Var.p(z);
                    i2 = i3;
                    i8bVar2 = i8bVar;
                    j8bVar2 = j8bVar;
                    o28Var = o28Var3;
                    g08Var2 = g08Var;
                }
            } else {
                i2 = i3;
                i8bVar2 = i8bVar;
                j8bVar2 = j8bVar;
                o28Var = o28Var3;
                g08Var2 = g08Var;
                p65Var.Y(1366313120);
            }
            p65Var.p(z);
            if (i8bVar2.i) {
                p65Var.Y(1381044630);
                o28 o28Var4 = o28Var;
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.user_activity_block_reposter), false, null, null, 30);
                boolean zF4 = ((i2 & 896) == 256 ? true : z) | ((i2 & 14) == 4 ? true : z) | p65Var.f(g08Var2);
                Object objM4 = p65Var.M();
                if (zF4 || objM4 == uobVar) {
                    objM4 = new d8b(k8bVar, j8bVar2, g08Var2, m45Var);
                    p65Var.j0(objM4);
                }
                o28Var2 = o28Var4;
                aq7.b(bq7Var4, (m45) objM4, bgf.N(o28Var4, "block_reposter"), 0L, 0L, p65Var, 384, 24);
            } else {
                o28Var2 = o28Var;
                p65Var.Y(1366313120);
            }
            p65Var.p(z);
            if (i8bVar2.j) {
                p65Var.Y(1381664103);
                bq7 bq7Var5 = new bq7(vo7.R(p65Var, R.string.user_activity_report_repost), false, null, null, 30);
                boolean zF5 = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? true : z) | ((i2 & 896) == 256 ? true : z) | ((i2 & 14) == 4 ? true : z) | p65Var.f(g08Var2);
                Object objM5 = p65Var.M();
                if (zF5 || objM5 == uobVar) {
                    a8b a8bVar = new a8b(k8bVar, dr9Var, j8bVar, g08Var2, m45Var, 2);
                    p65Var.j0(a8bVar);
                    objM5 = a8bVar;
                }
                aq7.b(bq7Var5, (m45) objM5, bgf.N(o28Var2, "report_repost"), 0L, 0L, p65Var, 384, 24);
            } else {
                p65Var.Y(1366313120);
            }
            p65Var.p(z);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c8b(j8bVar, dr9Var, k8bVar, m45Var, i, 1);
        }
    }

    public static final long q(int i, int i2) {
        if (i < 0 || i2 < 0) {
            c26.a("start and end cannot be negative. [start: " + i + ", end: " + i2 + ']');
        }
        long j = (((long) i2) & 4294967295L) | (((long) i) << 32);
        int i3 = bkd.c;
        return j;
    }

    public static final hec r(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        hec hecVar = o3eVarM0 instanceof hec ? (hec) o3eVarM0 : null;
        if (hecVar != null) {
            return hecVar;
        }
        ik4.m("This is should be simple type: ", mn6Var);
        return null;
    }

    public static final long s(int i, long j) {
        int i2 = bkd.c;
        int i3 = (int) (j >> 32);
        int i4 = i3 < 0 ? 0 : i3;
        if (i4 > i) {
            i4 = i;
        }
        int i5 = (int) (4294967295L & j);
        int i6 = i5 >= 0 ? i5 : 0;
        if (i6 <= i) {
            i = i6;
        }
        return (i4 == i3 && i == i5) ? j : q(i4, i);
    }

    public static final boolean t(long j, long j2) {
        return j == j2;
    }

    public static final int u(yy8 yy8Var) {
        return (int) (yy8Var.e == hw8.Vertical ? yy8Var.g() & 4294967295L : yy8Var.g() >> 32);
    }

    public static final mcb v(qjd qjdVar, int i) {
        pjd pjdVar = qjdVar.a;
        f58 f58Var = qjdVar.b;
        if (pjdVar.a.b.length() != 0) {
            int iD = f58Var.d(i);
            if ((i != 0 && iD == f58Var.d(i - 1)) || (i != pjdVar.a.b.length() && iD == f58Var.d(i + 1))) {
                return qjdVar.a(i);
            }
        }
        return qjdVar.h(i);
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object w(defpackage.fka r12, defpackage.nhc r13, android.content.res.Resources r14, defpackage.xja r15, defpackage.sh9 r16, defpackage.n92 r17) {
        /*
            Method dump skipped, instruction units count: 429
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lk7.w(fka, nhc, android.content.res.Resources, xja, sh9, n92):java.lang.Object");
    }

    public static List x(igc igcVar, int i, igc igcVar2, boolean z, boolean z2, boolean z3) {
        List list;
        boolean z4;
        int i2;
        int i3;
        int iT = igcVar.t(i);
        int i4 = i + iT;
        int iF = igcVar.f(igcVar.q(i), igcVar.b);
        int iF2 = igcVar.f(igcVar.q(i4), igcVar.b);
        int i5 = iF2 - iF;
        boolean z5 = i >= 0 && (igcVar.b[(igcVar.q(i) * 5) + 1] & 201326592) != 0;
        igcVar2.v(iT);
        igcVar2.w(i5, igcVar2.t);
        if (igcVar.g < i4) {
            igcVar.A(i4);
        }
        if (igcVar.k < iF2) {
            igcVar.B(iF2, i4);
        }
        int[] iArr = igcVar2.b;
        int i6 = igcVar2.t;
        int i7 = i6 * 5;
        k80.h0(i7, i * 5, igcVar.b, iArr, i4 * 5);
        Object[] objArr = igcVar2.c;
        int i8 = igcVar2.i;
        System.arraycopy(igcVar.c, iF, objArr, i8, i5);
        int i9 = igcVar2.v;
        iArr[i7 + 2] = i9;
        int i10 = i6 - i;
        int i11 = i6 + iT;
        int iF3 = i8 - igcVar2.f(i6, iArr);
        int i12 = igcVar2.m;
        int i13 = igcVar2.l;
        int length = objArr.length;
        boolean z6 = z5;
        int i14 = i12;
        int i15 = i6;
        while (i15 < i11) {
            if (i15 != i6) {
                int i16 = (i15 * 5) + 2;
                iArr[i16] = iArr[i16] + i10;
            }
            int[] iArr2 = iArr;
            int iF4 = igcVar2.f(i15, iArr) + iF3;
            if (i14 < i15) {
                i2 = i6;
                i3 = 0;
            } else {
                i2 = i6;
                i3 = igcVar2.k;
            }
            iArr2[(i15 * 5) + 4] = igc.h(iF4, i3, i13, length);
            if (i15 == i14) {
                i14++;
            }
            i15++;
            i6 = i2;
            iArr = iArr2;
        }
        int[] iArr3 = iArr;
        igcVar2.m = i14;
        int iB = hgc.b(igcVar.d, i, igcVar.o());
        int iB2 = hgc.b(igcVar.d, i4, igcVar.o());
        if (iB < iB2) {
            ArrayList arrayList = igcVar.d;
            ArrayList arrayList2 = new ArrayList(iB2 - iB);
            for (int i17 = iB; i17 < iB2; i17++) {
                k65 k65Var = (k65) arrayList.get(i17);
                k65Var.a += i10;
                arrayList2.add(k65Var);
            }
            igcVar2.d.addAll(hgc.b(igcVar2.d, igcVar2.t, igcVar2.o()), arrayList2);
            arrayList.subList(iB, iB2).clear();
            list = arrayList2;
        } else {
            list = ey3.a;
        }
        if (!list.isEmpty()) {
            HashMap map = igcVar.e;
            HashMap map2 = igcVar2.e;
            if (map != null && map2 != null) {
                int size = list.size();
                for (int i18 = 0; i18 < size; i18++) {
                }
            }
        }
        int i19 = igcVar2.v;
        igcVar2.N(i9);
        int iD = igcVar.D(i, igcVar.b);
        if (!z3) {
            z4 = false;
        } else if (z) {
            boolean z7 = iD >= 0;
            if (z7) {
                igcVar.O();
                igcVar.a(iD - igcVar.t);
                igcVar.O();
            }
            igcVar.a(i - igcVar.t);
            boolean zG = igcVar.G();
            if (z7) {
                igcVar.L();
                igcVar.i();
                igcVar.L();
                igcVar.i();
            }
            z4 = zG;
        } else {
            boolean zH = igcVar.H(i, iT);
            igcVar.I(iF, i5, i - 1);
            z4 = zH;
        }
        if (z4) {
            b22.a("Unexpectedly removed anchors");
        }
        int i20 = igcVar2.o;
        int i21 = iArr3[i7 + 1];
        igcVar2.o = i20 + ((1073741824 & i21) != 0 ? 1 : i21 & 67108863);
        if (z2) {
            igcVar2.t = i11;
            igcVar2.i = i8 + i5;
        }
        if (z6) {
            igcVar2.S(i9);
        }
        return list;
    }

    public static xp y(String str) throws ProtocolException {
        c8a c8aVar;
        int i;
        String strSubstring;
        if (tuc.N(str, "HTTP/1.", false)) {
            i = 9;
            if (str.length() < 9 || str.charAt(8) != ' ') {
                throw new ProtocolException("Unexpected status line: ".concat(str));
            }
            int iCharAt = str.charAt(7) - '0';
            if (iCharAt == 0) {
                c8aVar = c8a.HTTP_1_0;
            } else {
                if (iCharAt != 1) {
                    throw new ProtocolException("Unexpected status line: ".concat(str));
                }
                c8aVar = c8a.HTTP_1_1;
            }
        } else if (tuc.N(str, "ICY ", false)) {
            c8aVar = c8a.HTTP_1_0;
            i = 4;
        } else {
            if (!tuc.N(str, "SOURCETABLE ", false)) {
                throw new ProtocolException("Unexpected status line: ".concat(str));
            }
            c8aVar = c8a.HTTP_1_1;
            i = 12;
        }
        int i2 = i + 3;
        if (str.length() < i2) {
            throw new ProtocolException("Unexpected status line: ".concat(str));
        }
        Integer numO = tuc.O(str.substring(i, i2));
        if (numO == null) {
            throw new ProtocolException("Unexpected status line: ".concat(str));
        }
        int iIntValue = numO.intValue();
        if (str.length() <= i2) {
            strSubstring = "";
        } else {
            if (str.charAt(i2) != ' ') {
                throw new ProtocolException("Unexpected status line: ".concat(str));
            }
            strSubstring = str.substring(i + 4);
        }
        return new xp(c8aVar, iIntValue, strSubstring);
    }

    public static final z61 z(boolean z, x12 x12Var) {
        ((jp7) ((p65) x12Var).j(kt7.a)).getClass();
        return jp7.a(x12Var) == ip7.COMPACT ? z61.S : z ? z61.L_WITH_NOTE : z61.L_NO_NOTE;
    }

    public abstract void F();
}
