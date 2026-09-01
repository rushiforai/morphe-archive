package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Paint;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rx0 {
    public static int k;
    public static final /* synthetic */ int m = 0;
    public static final /* synthetic */ int n = 0;
    public static final /* synthetic */ int o = 0;
    public static final /* synthetic */ int p = 0;
    public static final mz1 a = new mz1(new e02(12), false, -1628152524);
    public static final mz1 b = new mz1(new c02(2), false, 117570019);
    public static final mz1 c = new mz1(new n02(0), false, -481975365);
    public static final mz1 d = new mz1(new n02(1), false, 1732408253);
    public static final mz1 e = new mz1(new m02(1), false, -1985615806);
    public static final mz1 f = new mz1(new m02(2), false, 1269059651);
    public static final mz1 g = new mz1(new v02(12, 0), false, -496554769);
    public static final ugc h = new ugc(1);
    public static final pgc i = new pgc(0);
    public static final Object j = new Object();
    public static final n9g l = new n9g();

    public static final void A(jx9 jx9Var, bo4 bo4Var, ex9 ex9Var, md3 md3Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(448031458);
        int i3 = i2 | (p65Var2.f(jx9Var) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(ex9Var) ? 256 : 128) | (p65Var2.f(md3Var) ? 2048 : 1024);
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            ((jp7) p65Var2.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var2) == ip7.COMPACT ? stc.M : stc.L;
            boolean zD = ((i3 & 14) == 4) | p65Var2.d(stcVar.ordinal()) | ((i3 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                objM = new pi9(jx9Var, stcVar, md3Var, i4);
                p65Var2.j0(objM);
            }
            k40.t(null, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var2, 0, 509);
            p65Var = p65Var2;
            int i5 = i3 & 896;
            boolean zF = p65Var.f(kv6VarA) | (i5 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new kd7(kv6VarA, ex9Var, n92Var, 29);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            Object objM3 = p65Var.M();
            int i6 = 8;
            if (objM3 == uobVar) {
                objM3 = bjc.b(new f91(kv6VarA, i6));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z = i5 == 256;
            Object objM4 = p65Var.M();
            if (z || objM4 == uobVar) {
                objM4 = new n79(ex9Var, upcVar, n92Var, 7);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new wi1(bo4Var, kv6VarA, n92Var, i6);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 17, jx9Var, bo4Var, ex9Var, md3Var);
        }
    }

    public static final void B(b24 b24Var, ex9 ex9Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(541976630);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(ex9Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                bo9 bo9Var = new bo9(0, ex9Var, ex9.class, "onRefresh", "onRefresh()V", 0, 13);
                p65Var.j0(bo9Var);
                objM = bo9Var;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 5, b24Var, ex9Var, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v0 */
    /* JADX WARN: Type inference failed for: r15v1, types: [int] */
    /* JADX WARN: Type inference failed for: r15v8 */
    public static final void C(r28 r28Var, x12 x12Var, int i2) {
        ?? r15;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2123476345);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        boolean z2 = false;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
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
            p65Var.Y(470349836);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z2);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z2);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                il7.l(stcVar, null, 0L, null, p65Var, 0, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = true;
                z2 = false;
            }
            boolean z3 = z;
            p65Var.p(z2);
            p65Var.p(z3);
            r15 = z3;
        } else {
            r15 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, r15);
        }
    }

    public static final void D(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-934828483);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gq7.a(jfc.c, null, vo7.R(p65Var, R.string.search_posts_none_found), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 0);
        }
    }

    public static final void E(jx9 jx9Var, bo4 bo4Var, ex9 ex9Var, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        uob uobVar;
        ex9 ex9Var2 = ex9Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-887451825);
        int i4 = i2 | (p65Var.f(jx9Var) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(ex9Var2) ? 256 : 128) | (p65Var.f(md3Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            boolean z = jx9Var.b;
            int i5 = i4 & 896;
            boolean z2 = i5 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                i3 = i5;
                uobVar = uobVar2;
                bo9 bo9Var = new bo9(0, ex9Var, ex9.class, "onRefresh", "onRefresh()V", 0, 14);
                p65Var.j0(bo9Var);
                objM = bo9Var;
            } else {
                i3 = i5;
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1827334399, new ov2(jx9Var, bo4Var, ex9Var, md3Var, 14), p65Var), p65Var, (i4 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i3 == 256;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                ex9Var2 = ex9Var;
                objM2 = new lo5(ex9Var2, null, 17);
                p65Var.j0(objM2);
            } else {
                ex9Var2 = ex9Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(jx9Var, bo4Var, ex9Var2, md3Var, r28Var, i2, 9);
        }
    }

    public static final void F(bo4 bo4Var, String str, bo4 bo4Var2, fub fubVar, r28 r28Var, qx9 qx9Var, x12 x12Var, int i2) {
        r28 r28Var2;
        qx9 qx9Var2;
        qx9 qx9Var3;
        int i3;
        r28 r28Var3;
        qx9 qx9Var4;
        str.getClass();
        bo4Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(493803768);
        int i4 = 2;
        int i5 = i2 | (p65Var.h(bo4Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var2) ? 256 : 128) | (p65Var.f(fubVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        if (p65Var.P(i5 & 1, (74899 & i5) != 74898)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean zH = p65Var.h(bo4Var) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    objM = new ui1(bo4Var, str, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    qx9Var3 = (qx9) to7.z(n1b.a.b(qx9.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i5 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i5 & (-458753);
                r28Var3 = r28Var;
                qx9Var3 = qx9Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(qx9Var3.p, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            ex9 ex9Var = new ex9(qx9Var3, fubVar);
            md3 md3Var = new md3(qx9Var3, 5, fubVar);
            G((kx9) l78VarZ.getValue(), nhcVarF, bo4Var2, ex9Var, md3Var, r28Var3, p65Var, (i3 & 896) | 196608);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH2 = p65Var.h(qx9Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                qx9Var4 = qx9Var3;
                objM3 = new uk8(qx9Var4, nhcVarF, sb2Var, resources, md3Var, (n92) null, 7);
                p65Var.j0(objM3);
            } else {
                qx9Var4 = qx9Var3;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var3;
            qx9Var2 = qx9Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            qx9Var2 = qx9Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 17, r28Var2, (que) qx9Var2, (Object) bo4Var, (Object) bo4Var2, (Object) fubVar, str);
        }
    }

    public static final void G(kx9 kx9Var, nhc nhcVar, bo4 bo4Var, ex9 ex9Var, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(111760305);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(kx9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(bo4Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(ex9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(md3Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var = p65Var2;
            pr7.b(bgf.N(r28Var, "posts_search"), null, null, pxf.E(1152922807, new w87(nhcVar, 6), p65Var2), null, 0, 0L, 0L, qb8.p, pxf.E(1116329216, new ov2(kx9Var, ex9Var, bo4Var, md3Var, 13), p65Var2), p65Var, 805309440, 246);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(kx9Var, nhcVar, bo4Var, ex9Var, md3Var, r28Var, i2, 10);
        }
    }

    public static final l16 H(n16 n16Var, float f2, float f3, k16 k16Var, x12 x12Var) {
        return I(n16Var, Float.valueOf(f2), Float.valueOf(f3), d46.i, k16Var, x12Var, 33208, 0);
    }

    public static final l16 I(n16 n16Var, Number number, Number number2, hud hudVar, k16 k16Var, x12 x12Var, int i2, int i3) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            l16 l16Var = new l16(n16Var, number, number2, hudVar, k16Var);
            p65Var.j0(l16Var);
            objM = l16Var;
        }
        l16 l16Var2 = (l16) objM;
        boolean z = (((57344 & i2) ^ 24576) > 16384 && p65Var.h(k16Var)) || (i2 & 24576) == 16384;
        Object objM2 = p65Var.M();
        if (z || objM2 == uobVar) {
            hu0 hu0Var = new hu0(number, l16Var2, number2, k16Var, 5);
            p65Var.j0(hu0Var);
            objM2 = hu0Var;
        }
        kyd.v((m45) objM2, p65Var);
        boolean zH = p65Var.h(n16Var);
        Object objM3 = p65Var.M();
        if (zH || objM3 == uobVar) {
            objM3 = new si3(n16Var, 18, l16Var2);
            p65Var.j0(objM3);
        }
        kyd.h(l16Var2, (x45) objM3, p65Var);
        return l16Var2;
    }

    public static final void J(qpc qpcVar, List list) {
        int size = list.size();
        for (int i2 = 0; i2 < size; i2++) {
            tk7 tk7Var = (tk7) list.get(i2);
            Object objF = kng.F(tk7Var);
            if (objF == null) {
                tk7Var.w();
                objF = new wz7(14);
            }
            c62 c62VarB = qpcVar.b(objF.toString());
            if (c62VarB != null) {
                c62VarB.g0 = tk7Var;
                b72 b72Var = c62VarB.h0;
                if (b72Var != null) {
                    b72Var.h0 = tk7Var;
                }
            }
            tk7Var.w();
        }
    }

    public static v55 K(n55 n55Var, boolean z) {
        String lowerCase;
        n55Var.getClass();
        List list = n55Var.k;
        v55 v55Var = new v55(n55Var, null, e41.DECLARATION, z);
        yq6 yq6VarK0 = n55Var.k0();
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (((swd) obj).z() != pqe.IN_VARIANCE) {
                break;
            }
            arrayList.add(obj);
        }
        i80 i80VarS1 = bu1.s1(arrayList);
        ArrayList arrayList2 = new ArrayList(cu1.k0(i80VarS1, 10));
        Iterator it2 = i80VarS1.iterator();
        while (true) {
            zm3 zm3Var = (zm3) it2;
            if (!zm3Var.b.hasNext()) {
                hec hecVarT = ((swd) bu1.H0(list)).T();
                c28 c28Var = c28.ABSTRACT;
                g93 g93Var = h93.e;
                ey3 ey3Var = ey3.a;
                v55Var.D0(null, yq6VarK0, ey3Var, ey3Var, arrayList2, hecVarT, c28Var, g93Var);
                v55 v55Var2 = v55Var;
                v55Var2.x = true;
                return v55Var2;
            }
            r06 r06Var = (r06) zm3Var.next();
            int i2 = r06Var.a;
            swd swdVar = (swd) r06Var.b;
            String strB = swdVar.getName().b();
            strB.getClass();
            if (strB.equals("T")) {
                lowerCase = "instance";
            } else if (strB.equals("E")) {
                lowerCase = "receiver";
            } else {
                lowerCase = strB.toLowerCase(Locale.ROOT);
                lowerCase.getClass();
            }
            v55 v55Var3 = v55Var;
            ky kyVar = cd7.e;
            n98 n98VarE = n98.e(lowerCase);
            hec hecVarT2 = swdVar.T();
            hecVarT2.getClass();
            arrayList2.add(new lqe(v55Var3, null, i2, kyVar, n98VarE, hecVarT2, false, false, false, null, jkc.g0));
            v55Var = v55Var3;
        }
    }

    public static final r28 L(r28 r28Var, tl tlVar, hw8 hw8Var, b55 b55Var) {
        return r28Var.b(new jl3(tlVar, b55Var, hw8Var));
    }

    public static final es4 M(es4 es4Var) {
        es4 es4VarF = ((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f();
        if (es4VarF == null || !es4VarF.n) {
            return null;
        }
        return es4VarF;
    }

    public static final zwa N(es4 es4Var) {
        eh8 eh8Var;
        if (es4Var.n && (eh8Var = es4Var.h) != null) {
            hp6 hp6VarK = sgg.K(eh8Var);
            if (!hp6VarK.m()) {
                hp6VarK = null;
            }
            if (hp6VarK != null) {
                return es4Var.L0(hp6VarK);
            }
        }
        return zwa.e;
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x0070, code lost:
    
        return r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0026, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.es4 O(defpackage.es4 r8) {
        /*
            q28 r0 = r8.a
            boolean r0 = r0.n
            r1 = 0
            if (r0 != 0) goto L9
            goto Laf
        L9:
            if (r0 != 0) goto L10
            java.lang.String r0 = "visitChildren called on an unattached node"
            defpackage.b26.b(r0)
        L10:
            o78 r0 = new o78
            r2 = 16
            q28[] r3 = new defpackage.q28[r2]
            r0.<init>(r3)
            q28 r8 = r8.a
            q28 r3 = r8.f
            if (r3 != 0) goto L23
            defpackage.flb.X(r0, r8)
            goto L26
        L23:
            r0.b(r3)
        L26:
            int r8 = r0.c
            if (r8 == 0) goto Laf
            int r8 = r8 + (-1)
            java.lang.Object r8 = r0.m(r8)
            q28 r8 = (defpackage.q28) r8
            int r3 = r8.d
            r3 = r3 & 1024(0x400, float:1.435E-42)
            if (r3 != 0) goto L3c
            defpackage.flb.X(r0, r8)
            goto L26
        L3c:
            if (r8 == 0) goto L26
            int r3 = r8.c
            r3 = r3 & 1024(0x400, float:1.435E-42)
            if (r3 == 0) goto Lac
            r3 = r1
        L45:
            if (r8 == 0) goto L26
            boolean r4 = r8 instanceof defpackage.es4
            r5 = 1
            if (r4 == 0) goto L71
            es4 r8 = (defpackage.es4) r8
            q28 r4 = r8.a
            boolean r4 = r4.n
            if (r4 == 0) goto La7
            zr4 r4 = r8.N0()
            int[] r6 = defpackage.is4.b
            int r4 = r4.ordinal()
            r4 = r6[r4]
            if (r4 == r5) goto L70
            r5 = 2
            if (r4 == r5) goto L70
            r5 = 3
            if (r4 == r5) goto L70
            r8 = 4
            if (r4 != r8) goto L6c
            goto La7
        L6c:
            defpackage.ygf.a()
            return r1
        L70:
            return r8
        L71:
            int r4 = r8.c
            r4 = r4 & 1024(0x400, float:1.435E-42)
            if (r4 == 0) goto La7
            boolean r4 = r8 instanceof defpackage.b43
            if (r4 == 0) goto La7
            r4 = r8
            b43 r4 = (defpackage.b43) r4
            q28 r4 = r4.p
            r6 = 0
        L81:
            if (r4 == 0) goto La4
            int r7 = r4.c
            r7 = r7 & 1024(0x400, float:1.435E-42)
            if (r7 == 0) goto La1
            int r6 = r6 + 1
            if (r6 != r5) goto L8f
            r8 = r4
            goto La1
        L8f:
            if (r3 != 0) goto L98
            o78 r3 = new o78
            q28[] r7 = new defpackage.q28[r2]
            r3.<init>(r7)
        L98:
            if (r8 == 0) goto L9e
            r3.b(r8)
            r8 = r1
        L9e:
            r3.b(r4)
        La1:
            q28 r4 = r4.f
            goto L81
        La4:
            if (r6 != r5) goto La7
            goto L45
        La7:
            q28 r8 = defpackage.flb.q0(r3)
            goto L45
        Lac:
            q28 r8 = r8.f
            goto L3c
        Laf:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rx0.O(es4):es4");
    }

    public static final Paint P(uq uqVar) {
        if (!(uqVar instanceof uq)) {
            a26.a("Extracting native reference is only supported from androidx.compose.ui.graphics.AndroidPaint instances but received " + n1b.a.b(uqVar.getClass()).d());
        }
        return uqVar.a;
    }

    public static final boolean Q(es4 es4Var) {
        aq6 aq6Var;
        eh8 eh8Var;
        aq6 aq6Var2;
        eh8 eh8Var2 = es4Var.h;
        return (eh8Var2 == null || (aq6Var = eh8Var2.o) == null || !aq6Var.I() || (eh8Var = es4Var.h) == null || (aq6Var2 = eh8Var.o) == null || !aq6Var2.H()) ? false : true;
    }

    public static void R(Uri uri) {
        S();
        cm2.d.lock();
        m50 m50Var = cm2.c;
        if (m50Var != null) {
            Bundle bundle = new Bundle();
            try {
                ((vt5) ((xt5) m50Var.b)).a((fm2) m50Var.c, uri, bundle);
            } catch (RemoteException unused) {
            }
        }
        cm2.d.unlock();
    }

    public static void S() {
        lig ligVar;
        cm2.d.lock();
        if (cm2.c == null && (ligVar = cm2.b) != null) {
            xt5 xt5Var = (xt5) ligVar.b;
            fm2 fm2Var = new fm2();
            fm2Var.attachInterface(fm2Var, "android.support.customtabs.ICustomTabsCallback");
            new Handler(Looper.getMainLooper());
            m50 m50Var = !((vt5) xt5Var).c(fm2Var) ? null : new m50(xt5Var, fm2Var, (ComponentName) ligVar.c, 25);
            cm2.c = m50Var;
        }
        cm2.d.unlock();
    }

    public static final n16 T(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new n16();
            p65Var.j0(objM);
        }
        n16 n16Var = (n16) objM;
        n16Var.a(p65Var, 0);
        return n16Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object U(defpackage.m45 r5, defpackage.b55 r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.pk
            if (r0 == 0) goto L13
            r0 = r7
            pk r0 = (defpackage.pk) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            pk r0 = new pk
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)     // Catch: androidx.compose.material3.internal.AnchoredDragFinishedSignal -> L3f
            goto L3f
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            wk r7 = new wk     // Catch: androidx.compose.material3.internal.AnchoredDragFinishedSignal -> L3f
            r7.<init>(r5, r6, r3, r4)     // Catch: androidx.compose.material3.internal.AnchoredDragFinishedSignal -> L3f
            r0.c = r4     // Catch: androidx.compose.material3.internal.AnchoredDragFinishedSignal -> L3f
            java.lang.Object r5 = defpackage.o7f.s(r7, r0)     // Catch: androidx.compose.material3.internal.AnchoredDragFinishedSignal -> L3f
            if (r5 != r1) goto L3f
            return r1
        L3f:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rx0.U(m45, b55, p92):java.lang.Object");
    }

    public static Object V(b55 b55Var) {
        return g01.U(zx3.a, b55Var);
    }

    public static final String W(Object obj) {
        return (obj.getClass().isAnonymousClass() ? obj.getClass().getName() : obj.getClass().getSimpleName()) + '@' + String.format("%07x", Arrays.copyOf(new Object[]{Integer.valueOf(System.identityHashCode(obj))}, 1));
    }

    public static final void a(nt3 nt3Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        nt3Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1295759756);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(nt3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        byte b2 = 0;
        int i5 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                hq3 hq3Var = new hq3(0, nt3Var, nt3.class, "onDialogClosed", "onDialogClosed()V", 0, 5);
                p65Var2.j0(hq3Var);
                objM = hq3Var;
            }
            p65Var = p65Var2;
            m40.h((m45) ((qh6) objM), null, pxf.E(2018254997, new it3(nt3Var, i4, b2), p65Var2), p65Var, 384, 2);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jt3(nt3Var, i2, i5);
        }
    }

    public static final void b(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-727376211);
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-1986899277);
            for (int i8 = 0; i8 < 8; i8++) {
                yi2.p(0, 0L, p65Var, null);
            }
            i3 = 1;
            ho2.N(p65Var, false, true, true, true);
        } else {
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, i3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:75:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(defpackage.xe r24, defpackage.nhc r25, defpackage.me r26, defpackage.cs1 r27, defpackage.m45 r28, defpackage.m45 r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 308
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rx0.c(xe, nhc, me, cs1, m45, m45, r28, x12, int, int):void");
    }

    public static final void d(String str, int i2, ke keVar, r28 r28Var, ze zeVar, x12 x12Var, int i3) {
        ze zeVar2;
        int i4;
        ze zeVar3;
        ze zeVar4;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(98681867);
        int i5 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(keVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        int i6 = 0;
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            p65Var.U();
            int i7 = i3 & 1;
            uob uobVar = w12.a;
            if (i7 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ne(str, i2, i6);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i4 = i5 & (-57345);
                    zeVar3 = (ze) to7.z(n1b.a.b(ze.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i4 = i5 & (-57345);
                zeVar3 = zeVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(zeVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i8 = i4 & 896;
            boolean zF = p65Var.f(zeVar3) | (i8 == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new pe(keVar, zeVar3);
                p65Var.j0(objM2);
            }
            pe peVar = (pe) objM2;
            xe xeVar = (xe) l78VarZ.getValue();
            boolean zH = p65Var.h(zeVar3);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                ze zeVar5 = zeVar3;
                x8 x8Var = new x8(0, zeVar5, ze.class, "refresh", "refresh()V", 0, 23);
                zeVar3 = zeVar5;
                p65Var.j0(x8Var);
                objM3 = x8Var;
            }
            m45 m45Var = (m45) ((qh6) objM3);
            boolean zH2 = p65Var.h(zeVar3);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                ze zeVar6 = zeVar3;
                x8 x8Var2 = new x8(0, zeVar6, ze.class, "reportScreenViewed", "reportScreenViewed()V", 0, 24);
                zeVar3 = zeVar6;
                p65Var.j0(x8Var2);
                objM4 = x8Var2;
            }
            c(xeVar, nhcVarF, keVar, peVar, m45Var, (m45) ((qh6) objM4), r28Var, p65Var, i8 | ((i4 << 9) & 3670016), 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH3 = p65Var.h(zeVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(peVar);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                ra raVar = new ra(zeVar3, nhcVarF, resources, peVar, null, 1);
                zeVar4 = zeVar3;
                p65Var.j0(raVar);
                objM5 = raVar;
            } else {
                zeVar4 = zeVar3;
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
            zeVar2 = zeVar4;
        } else {
            p65Var.S();
            zeVar2 = zeVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(str, i2, keVar, r28Var, zeVar2, i3, 1);
        }
    }

    public static final void e(ve veVar, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(563053674);
        int i3 = i2 | (p65Var.f(veVar) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(veVar.a, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, m45Var, null, p65Var, (i3 << 15) & 3670016, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 8, veVar, m45Var, r28Var);
        }
    }

    public static final void f(ov4 ov4Var, kv6 kv6Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(832215180);
        int i3 = i2 | (p65Var2.f(ov4Var) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(ye1Var) ? 256 : 128) | 3072;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Context context = (Context) p65Var2.j(eo.b);
            context.getClass();
            float f2 = r3.widthPixels / context.getResources().getDisplayMetrics().density;
            oe1 oe1Var = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarG = w2g.g(1, 0.0f);
            rh4 rh4Var = jfc.c;
            boolean zD = ((i3 & 14) == 4) | ((i3 & 896) == 256) | p65Var2.d(oe1Var.ordinal());
            Object objM = p65Var2.M();
            if (zD || objM == w12.a) {
                objM = new o8(ov4Var, ye1Var, oe1Var, 19);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            k40.t(rh4Var, kv6Var, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 24960, 488);
            r28Var2 = o28.b;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 7, r28Var2, (Object) ov4Var, (Object) kv6Var, (Object) ye1Var);
        }
    }

    public static final void g(ov4 ov4Var, kv6 kv6Var, iv4 iv4Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-269503083);
        int i3 = i2 | (p65Var2.f(ov4Var) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(iv4Var) ? 256 : 128) | (p65Var2.f(ye1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = ov4Var.b;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new gi4(0, iv4Var, iv4.class, "onRefresh", "onRefresh()V", 0, 11);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-2008490845, new nh(ov4Var, kv6Var, ye1Var, 27), p65Var2), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(ov4Var, kv6Var, iv4Var, ye1Var, r28Var, i2, 20);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0197  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:77:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(java.lang.String r37, defpackage.r28 r38, boolean r39, java.lang.Integer r40, defpackage.sk6 r41, defpackage.pk6 r42, defpackage.x45 r43, defpackage.x12 r44, int r45, int r46) {
        /*
            Method dump skipped, instruction units count: 436
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rx0.h(java.lang.String, r28, boolean, java.lang.Integer, sk6, pk6, x45, x12, int, int):void");
    }

    public static final void i(ue ueVar, m45 m45Var, m45 m45Var2, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1804892723);
        int i3 = i2 | (p65Var2.f(ueVar) ? 4 : 2) | (p65Var2.h(m45Var) ? 32 : 16) | (p65Var2.h(m45Var2) ? 256 : 128) | (p65Var2.f(cs1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            er7.d(ueVar.b, m45Var, r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(459216987, new nh(pv6.a(p65Var2), ueVar, cs1Var, 7), p65Var2), p65Var2, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 >> 6) & 896), PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new qe(m45Var2, null, 0);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(ueVar, m45Var, m45Var2, cs1Var, r28Var, i2, 4);
        }
    }

    public static final void j(rc3 rc3Var, nc3 nc3Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1541845147);
        int i3 = i2 | (p65Var.f(rc3Var) ? 4 : 2) | (p65Var.f(nc3Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            sq6 sq6Var = new sq6(1.0f, true);
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 32.0f, 7);
            boolean z = (i3 & 14) == 4;
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = z | (i5 == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new i0(rc3Var, 28, nc3Var);
                p65Var.j0(objM);
            }
            k40.t(sq6Var, null, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, 384, 506);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            jjd.b(vo7.R(p65Var, R.string.digest_history_history_number_of_digest), jfc.d(w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 130044);
            boolean z3 = i5 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                gu1 gu1Var = new gu1(0, nc3Var, nc3.class, "close", "close()V", 0, 12);
                p65Var.j0(gu1Var);
                objM2 = gu1Var;
            }
            p65Var = p65Var;
            fo7.j((m45) ((qh6) objM2), vo7.R(p65Var, R.string.common_cancel), xn7.L, jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), false, null, p65Var, 3456, 48);
            lv8.y(o28Var, 32.0f, p65Var, true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 19, rc3Var, nc3Var, obj);
        }
    }

    public static final void k(sc3 sc3Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1292782514);
        int i3 = (p65Var.f(sc3Var) ? 4 : 2) | i2 | 48;
        int i4 = 18;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28Var = o28Var;
            iq7.a(sc3Var.a, w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13), null, null, null, null, null, null, p65Var, 0, 252);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(sc3Var, r28Var, i2, i4);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1661744966);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).c;
            o28 o28Var = o28.b;
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            tp7.c(0.0f, 0, 5, j2, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            p65Var.Y(1160157155);
            for (int i5 = 0; i5 < 10; i5++) {
                k50.u(0, j2, p65Var, null);
            }
            p65Var.p(false);
            tp7.c(0.0f, 0, 5, j2, p65Var, null);
            ok7.s(0.0f, 48, 4, j2, p65Var, jfc.d(w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f), ((bu7) p65Var.j(jt7.c)).n);
            fo7.h(xn7.L, jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), j2, p65Var, 54, 0);
            p65Var = p65Var;
            lv8.y(o28Var, 32.0f, p65Var, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var2, i2, 15);
        }
    }

    public static final void m(uc3 uc3Var, nc3 nc3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        nc3 nc3Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1944972273);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(uc3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nc3Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            String strR = vo7.R(p65Var2, R.string.digest_history_title);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                gu1 gu1Var = new gu1(0, nc3Var, nc3.class, "close", "close()V", 0, 13);
                nc3Var2 = nc3Var;
                p65Var2.j0(gu1Var);
                objM = gu1Var;
            } else {
                nc3Var2 = nc3Var;
            }
            m45 m45Var = (m45) ((qh6) objM);
            r28 r28VarJ = rv8.J(r28Var, jq7.t(p65Var2), null);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new iz2(7);
                p65Var2.j0(objM2);
            }
            p65Var = p65Var2;
            ek7.g(strR, m45Var, bgf.N(wxb.a(r28VarJ, false, (x45) objM2), "digest_history"), null, pxf.E(-2084376441, new ec(uc3Var, 24, nc3Var2), p65Var2), p65Var, 24576, 8);
        } else {
            p65Var = p65Var2;
            nc3Var2 = nc3Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 14, uc3Var, nc3Var2, r28Var);
        }
    }

    public static final void n(String str, String str2, String str3, String str4, rz2 rz2Var, r28 r28Var, wc3 wc3Var, x12 x12Var, int i2) {
        r28 r28Var2;
        wc3 wc3Var2;
        wc3 wc3Var3;
        r28 r28Var3;
        ho2.Q(str, str2, str3, str4);
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1943350076);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(str4) ? 2048 : 1024) | (p65Var.f(rz2Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 720896;
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256) | ((i3 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    iu iuVar = new iu(str, str2, str3, str4, 4);
                    p65Var.j0(iuVar);
                    objM = iuVar;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    wc3Var3 = (wc3) to7.z(n1b.a.b(wc3.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                wc3Var3 = wc3Var;
            }
            p65Var.q();
            m((uc3) guc.z(wc3Var3.i, p65Var, 0).getValue(), new nc3(rz2Var, wc3Var3), r28Var3, p65Var, 384);
            wc3Var2 = wc3Var3;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            wc3Var2 = wc3Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, str2, str3, str4, rz2Var, r28Var2, wc3Var2, i2, 0);
        }
    }

    public static final void o(nt3 nt3Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        int i4;
        nt3Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-278279618);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(nt3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        byte b2 = 0;
        int i5 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                hq3 hq3Var = new hq3(0, nt3Var, nt3.class, "onDialogClosed", "onDialogClosed()V", 0, 9);
                p65Var2.j0(hq3Var);
                objM = hq3Var;
            }
            i4 = 0;
            p65Var = p65Var2;
            hlg.a((m45) ((qh6) objM), pxf.E(-448629514, new it3(nt3Var, b2, b2), p65Var2), null, pxf.E(-1771808460, new it3(nt3Var, i5, b2), p65Var2), null, rv8.g, rv8.h, null, 0L, 0L, 0L, 0L, null, p65Var, 1772592, 0, 16276);
        } else {
            p65Var = p65Var2;
            i4 = 0;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jt3(nt3Var, i2, i4);
        }
    }

    public static final void p(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1513523820);
        int i3 = i2 | (p65Var.f(r28Var) ? 4 : 2);
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            gq7.a(r28Var, null, vo7.R(p65Var, R.string.followed_lists_empty_state_title), vo7.R(p65Var, R.string.followed_lists_empty_state_content), 0L, null, null, null, null, 0.0f, 0.0f, p65Var, i3 & 14, 0, 2034);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 29);
        }
    }

    public static final void q(pv4 pv4Var, iv4 iv4Var, r28 r28Var, x12 x12Var, int i2) {
        pv4 pv4Var2 = pv4Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2047647935);
        int i3 = i2 | (p65Var.f(pv4Var2) ? 4 : 2) | (p65Var.f(iv4Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            pv4Var2 = pv4Var;
            b24 b24Var = pv4Var2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                gi4 gi4Var = new gi4(0, iv4Var, iv4.class, "onRefresh", "onRefresh()V", 0, 12);
                p65Var.j0(gi4Var);
                objM = gi4Var;
            }
            iq7.a(b24Var, jfc.c, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 18, pv4Var2, iv4Var, r28Var);
        }
    }

    public static final void r(int i2, x12 x12Var, bo4 bo4Var, r28 r28Var, uef uefVar, String str) {
        str.getClass();
        bo4Var.getClass();
        uefVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1456150031);
        int i3 = 4;
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(uefVar) ? 256 : 128);
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            boolean z = (((i4 & 14) ^ 6) > 4 && p65Var.f(str)) || (i4 & 6) == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new mb(str, 22);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            xv4 xv4Var = (xv4) to7.z(n1b.a.b(xv4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            Resources resources = (Resources) p65Var.j(eo.c);
            l78 l78VarZ = guc.z(xv4Var.o, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            nhc nhcVarF = mk7.F(p65Var);
            boolean zF = p65Var.f(xv4Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new iv4(xv4Var);
                p65Var.j0(objM2);
            }
            iv4 iv4Var = (iv4) objM2;
            boolean zF2 = p65Var.f(xv4Var) | ((i4 & 896) == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new hv4(xv4Var, uefVar);
                p65Var.j0(objM3);
            }
            hv4 hv4Var = (hv4) objM3;
            s((sv4) l78VarZ.getValue(), kv6VarA, nhcVarF, iv4Var, hv4Var, r28Var, p65Var, 196608);
            boolean zH = p65Var.h(xv4Var) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(hv4Var);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                fl2 fl2Var = new fl2(xv4Var, nhcVarF, resources, hv4Var, null, 19);
                p65Var.j0(fl2Var);
                objM4 = fl2Var;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM4, c1eVar);
            boolean zF3 = p65Var.f(kv6VarA) | p65Var.h(xv4Var);
            Object objM5 = p65Var.M();
            n92 n92Var = null;
            if (zF3 || objM5 == uobVar) {
                objM5 = new xs3(kv6VarA, xv4Var, n92Var, 10);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, kv6VarA);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM6 = p65Var.M();
            if (zH2 || objM6 == uobVar) {
                objM6 = new wi1(bo4Var, kv6VarA, n92Var, i3);
                p65Var.j0(objM6);
            }
            kyd.k(p65Var, (b55) objM6, c1eVar);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gv4(str, bo4Var, uefVar, r28Var, i2, 0);
        }
    }

    public static final void s(sv4 sv4Var, kv6 kv6Var, nhc nhcVar, iv4 iv4Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        sv4Var.getClass();
        kv6Var.getClass();
        nhcVar.getClass();
        iv4Var.getClass();
        ye1Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1119011429);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(sv4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(kv6Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(iv4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(ye1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new cq4(i4);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(rv8.J(wxb.a(r28Var, false, (x45) objM), jq7.t(p65Var2), null).b(jfc.c), "followed_lists"), null, null, pxf.E(-668635307, new u8(nhcVar, 26), p65Var2), null, 0, 0L, 0L, qb8.p, pxf.E(-1302297812, new fd3(sv4Var, kv6Var, iv4Var, ye1Var, 1), p65Var2), p65Var, 805309440, 246);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(sv4Var, kv6Var, nhcVar, iv4Var, ye1Var, r28Var, i2, 2);
        }
    }

    public static final void t(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-17885051);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f2 = r0.widthPixels / context.getResources().getDisplayMetrics().density;
            oe1 oe1Var = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            kv6 kv6VarA = pv6.a(p65Var);
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarG = w2g.g(1, 0.0f);
            boolean zD = p65Var.d(oe1Var.ordinal());
            Object objM = p65Var.M();
            if (zD || objM == w12.a) {
                objM = new fv4(oe1Var, i4);
                p65Var.j0(objM);
            }
            r28Var2 = r28Var;
            k40.t(r28Var2, kv6VarA, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var, (i3 & 14) | 12607872, 360);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var2, i2, 28);
        }
    }

    public static final void u(n97 n97Var, x87 x87Var, r28 r28Var, x12 x12Var, int i2) {
        x87 x87Var2;
        ot2 ot2Var;
        Integer num;
        sr4 sr4Var;
        int i3;
        cu cuVar;
        pk6 pk6Var;
        p65 p65Var;
        int i4;
        boolean z;
        int i5;
        n92 n92Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-425961335);
        int i6 = i2 | (p65Var2.f(n97Var) ? 4 : 2) | (p65Var2.f(x87Var) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        if (p65Var2.P(i6 & 1, (i6 & 147) != 146)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.g(p65Var2);
            }
            sr4 sr4Var2 = (sr4) objM;
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), r28Var.b(rh4Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarX);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar2 = q12.f;
            tp7.B(p65Var2, cuVar2, zk7VarC);
            cu cuVar3 = q12.e;
            tp7.B(p65Var2, cuVar3, i89VarL);
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar4 = q12.g;
            tp7.B(p65Var2, cuVar4, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar5 = q12.d;
            tp7.B(p65Var2, cuVar5, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                ot2Var = ot2Var2;
                p65Var2.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar2, zk7VarC2);
            tp7.B(p65Var2, cuVar3, i89VarL2);
            ka1.z(i8, p65Var2, cuVar4, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar5, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
            long j4 = p65Var2.T;
            int i9 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, rh4Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar2, wv1VarA);
            tp7.B(p65Var2, cuVar3, i89VarL3);
            ka1.z(i9, p65Var2, cuVar4, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar5, r28VarR3);
            String strR = vo7.R(p65Var2, R.string.login_code_title);
            sn3 sn3Var = jt7.c;
            ot2 ot2Var3 = ot2Var;
            jjd.b(strR, bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).F, p65Var2, 48, 0, 130044);
            y30.y(o28Var, 1.0f, 24.0f, p65Var2);
            jjd.b(vo7.Q(R.string.login_code_text, new Object[]{n97Var.b, vo7.R(p65Var2, n97Var.a == SusiOperation.LOGIN ? R.string.login_code_text_sign_in : R.string.login_code_text_sign_up)}, p65Var2), bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "text"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).m, p65Var2, 48, 0, 130044);
            y30.y(o28Var, 1.0f, 32.0f, p65Var2);
            String str = n97Var.c;
            boolean z2 = n97Var.g;
            Integer num2 = n97Var.d;
            r28 r28VarN = bgf.N(t40.F(w2g.E(o28Var, 24.0f, 0.0f, 2), sr4Var2), "code");
            int i10 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i10 == 32;
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new ff4(24, x87Var);
                p65Var2.j0(objM2);
            }
            pk6 pk6Var2 = new pk6((x45) objM2, null, null, 62);
            boolean z4 = i10 == 32;
            Object objM3 = p65Var2.M();
            if (z4 || objM3 == uobVar) {
                num = num2;
                sr4Var = sr4Var2;
                i3 = i10;
                cuVar = cuVar5;
                pk6Var = pk6Var2;
                objM3 = new k0(1, x87Var, x87.class, "onCodeChanged", "onCodeChanged(Ljava/lang/String;)V", 0, 26);
                p65Var2.j0(objM3);
            } else {
                sr4Var = sr4Var2;
                num = num2;
                i3 = i10;
                pk6Var = pk6Var2;
                cuVar = cuVar5;
            }
            h(str, r28VarN, z2, num, null, pk6Var, (x45) ((qh6) objM3), p65Var2, 384, 32);
            y30.y(o28Var, 1.0f, 32.0f, p65Var2);
            int i11 = i3;
            boolean z5 = i11 == 32;
            Object objM4 = p65Var2.M();
            if (z5 || objM4 == uobVar) {
                objM4 = new ek5(0, x87Var, x87.class, "onSubmitClicked", "onSubmitClicked()V", 0, 18);
                p65Var2.j0(objM4);
            }
            boolean z6 = n97Var.e;
            String strR2 = vo7.R(p65Var2, R.string.login_code_submit);
            xn7 xn7Var = xn7.M;
            fo7.i((m45) ((qh6) objM4), strR2, xn7Var, bgf.N(w2g.E(jfc.d(jfc.q(o28Var, 0.0f, 348.0f, 1), 1.0f), 24.0f, 0.0f, 2), "validate"), z6, p65Var2, 3456, 0);
            y30.y(o28Var, 1.0f, 18.0f, p65Var2);
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.e, z46.n, p65Var2, 54);
            long j5 = p65Var2.T;
            int i12 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarE);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var3);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar2, ombVarA);
            tp7.B(p65Var2, cuVar3, i89VarL4);
            ka1.z(i12, p65Var2, cuVar4, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar, r28VarR4);
            boolean z7 = i11 == 32;
            Object objM5 = p65Var2.M();
            if (z7 || objM5 == uobVar) {
                p65Var = p65Var2;
                ek5 ek5Var = new ek5(0, x87Var, x87.class, "onResendCodeClicked", "onResendCodeClicked()V", 0, 19);
                p65Var.j0(ek5Var);
                objM5 = ek5Var;
            } else {
                p65Var = p65Var2;
            }
            p65Var2 = p65Var;
            fo7.k(3456, 80, null, p65Var2, (m45) ((qh6) objM5), xn7Var, bgf.N(o28Var, "resend_code"), vo7.R(p65Var, R.string.login_code_resend_code), n97Var.f, false);
            if (n97Var.d != null) {
                p65Var2.Y(-1959836671);
                i5 = 32;
                i4 = i11;
                jjd.b(vo7.R(p65Var2, R.string.common_or), bgf.N(o28Var, "or"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 48, 0, 131068);
                boolean z8 = i4 == 32;
                Object objM6 = p65Var2.M();
                if (z8 || objM6 == uobVar) {
                    objM6 = new ek5(0, x87Var, x87.class, "onSendMagicLinkClicked", "onSendMagicLinkClicked()V", 0, 20);
                    x87Var2 = x87Var;
                    p65Var2.j0(objM6);
                } else {
                    x87Var2 = x87Var;
                }
                String strR3 = vo7.R(p65Var2, R.string.login_code_send_magic_link);
                p65Var2 = p65Var2;
                fo7.k(3456, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var2, (m45) ((qh6) objM6), xn7Var, bgf.N(o28Var, "send_magic_link"), strR3, false, false);
                z = false;
            } else {
                i4 = i11;
                z = false;
                i5 = 32;
                x87Var2 = x87Var;
                p65Var2.Y(-1970445646);
            }
            p65Var2.p(z);
            ho2.N(p65Var2, true, true, true, true);
            Object objM7 = p65Var2.M();
            if (objM7 == uobVar) {
                n92Var = null;
                objM7 = new y8(sr4Var, n92Var, 3);
                p65Var2.j0(objM7);
            } else {
                n92Var = null;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var2, (b55) objM7, c1eVar);
            boolean z9 = i4 != i5 ? z : true;
            Object objM8 = p65Var2.M();
            if (z9 || objM8 == uobVar) {
                objM8 = new lo5(x87Var2, n92Var, 4);
                p65Var2.j0(objM8);
            }
            kyd.k(p65Var2, (b55) objM8, c1eVar);
        } else {
            x87Var2 = x87Var;
            p65Var2.S();
        }
        mwa mwaVarS = p65Var2.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 4, n97Var, x87Var2, r28Var);
        }
    }

    public static final void v(p97 p97Var, nhc nhcVar, x87 x87Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p97Var.getClass();
        nhcVar.getClass();
        x87Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1369964697);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(p97Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(x87Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new vx5(28);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "login_code"), pxf.E(746274205, new v87(x87Var), p65Var2), null, pxf.E(765815327, new w87(nhcVar, i4), p65Var2), null, 0, 0L, 0L, null, pxf.E(-1782290648, new g64(p97Var, 18, x87Var), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 28, p97Var, nhcVar, x87Var, r28Var);
        }
    }

    public static final void w(final String str, final SusiOperation susiOperation, final SusiDestination susiDestination, final String str2, final String str3, final boolean z, final boolean z2, final r87 r87Var, r28 r28Var, u97 u97Var, x12 x12Var, final int i2) {
        final r28 r28Var2;
        p65 p65Var;
        final u97 u97Var2;
        uob uobVar;
        int i3;
        u97 u97Var3;
        int i4;
        u97 u97Var4;
        str.getClass();
        susiOperation.getClass();
        str2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1568862304);
        int i5 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.d(susiOperation.ordinal()) ? 32 : 16) | (p65Var2.f(susiDestination) ? 256 : 128) | (p65Var2.f(str2) ? 2048 : 1024) | (p65Var2.f(str3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.g(z2) ? 1048576 : 524288) | (p65Var2.f(r87Var) ? 8388608 : 4194304) | 369098752;
        if (p65Var2.P(i5 & 1, (306783379 & i5) != 306783378)) {
            p65Var2.U();
            int i6 = i2 & 1;
            uob uobVar2 = w12.a;
            if (i6 == 0 || p65Var2.z()) {
                boolean z3 = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 896) == 256) | ((i5 & 7168) == 2048) | ((57344 & i5) == 16384) | ((458752 & i5) == 131072) | ((3670016 & i5) == 1048576);
                Object objM = p65Var2.M();
                if (z3 || objM == uobVar2) {
                    uobVar = uobVar2;
                    i3 = 8388608;
                    x45 x45Var = new x45() { // from class: t87
                        @Override // defpackage.x45
                        public final Object invoke(Object obj) {
                            mq2 mq2Var = (mq2) obj;
                            mq2Var.getClass();
                            eo2 eo2Var = mq2Var.a;
                            ys2 ys2Var = (ys2) eo2Var.e;
                            vob vobVar = ys2Var.a;
                            gse gseVar = new gse(ys2Var.C(), ys2Var.b.v());
                            dzb dzbVarV = ys2Var.v();
                            hac hacVarW = ys2Var.w();
                            hac hacVarX = ys2Var.x();
                            ko2 ko2Var = eo2Var.b;
                            a13 a13VarV = ko2Var.v();
                            ax2 ax2VarT = ko2Var.t();
                            r13 r13Var = xg3.a;
                            iq7.s(r13Var);
                            return new u97(str, susiOperation, susiDestination, str2, str3, z, z2, vobVar, gseVar, dzbVarV, hacVarW, hacVarX, a13VarV, ax2VarT, r13Var);
                        }
                    };
                    p65Var2.j0(x45Var);
                    objM = x45Var;
                } else {
                    uobVar = uobVar2;
                    i3 = 8388608;
                }
                x45 x45Var2 = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    u97Var3 = (u97) to7.z(n1b.a.b(u97.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var2) : r40.N(og2.b, x45Var2), p65Var2);
                    i4 = i5 & (-1879048193);
                    r28Var2 = o28.b;
                }
            } else {
                p65Var2.S();
                i4 = i5 & (-1879048193);
                r28Var2 = r28Var;
                u97Var3 = u97Var;
                uobVar = uobVar2;
                i3 = 8388608;
            }
            p65Var2.q();
            l78 l78VarZ = guc.z(u97Var3.p, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            akc akcVar = (akc) p65Var2.j(z22.r);
            int i7 = i4 & 29360128;
            boolean zF = (i7 == i3) | p65Var2.f(u97Var3);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                objM2 = new x87(r87Var, u97Var3);
                p65Var2.j0(objM2);
            }
            v((p97) l78VarZ.getValue(), nhcVarF, (x87) objM2, r28Var2, p65Var2, 3072);
            Resources resources = (Resources) p65Var2.j(eo.c);
            boolean zH = p65Var2.h(u97Var3) | p65Var2.f(nhcVarF) | p65Var2.h(resources) | p65Var2.f(akcVar) | (i7 == i3);
            Object objM3 = p65Var2.M();
            if (zH || objM3 == uobVar) {
                u97Var4 = u97Var3;
                b9 b9Var = new b9((Object) u97Var4, nhcVarF, resources, (Object) akcVar, (Object) r87Var, (n92) null, 24);
                p65Var2.j0(b9Var);
                objM3 = b9Var;
            } else {
                u97Var4 = u97Var3;
            }
            kyd.k(p65Var2, (b55) objM3, c1e.a);
            p65Var = p65Var2;
            u97Var2 = u97Var4;
        } else {
            p65Var2.S();
            r28Var2 = r28Var;
            p65Var = p65Var2;
            u97Var2 = u97Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(str, susiOperation, susiDestination, str2, str3, z, z2, r87Var, r28Var2, u97Var2, i2) { // from class: u87
                public final /* synthetic */ String a;
                public final /* synthetic */ SusiOperation b;
                public final /* synthetic */ SusiDestination c;
                public final /* synthetic */ String d;
                public final /* synthetic */ String e;
                public final /* synthetic */ boolean f;
                public final /* synthetic */ boolean g;
                public final /* synthetic */ r87 h;
                public final /* synthetic */ r28 i;
                public final /* synthetic */ u97 j;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    rx0.w(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void x(o97 o97Var, x87 x87Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1870230407);
        int i3 = i2 | (p65Var.f(o97Var) ? 4 : 2) | (p65Var.f(x87Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(rh4Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String strR = vo7.R(p65Var, R.string.login_code_title);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).F, p65Var, 48, 0, 130044);
            y30.y(o28Var, 1.0f, 24.0f, p65Var);
            jjd.b(vo7.Q(R.string.login_code_text, new Object[]{o97Var.b, vo7.R(p65Var, o97Var.a == SusiOperation.LOGIN ? R.string.login_code_text_sign_in : R.string.login_code_text_sign_up)}, p65Var), bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "text"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 48, 0, 130044);
            p65Var = p65Var;
            y30.y(o28Var, 1.0f, 32.0f, p65Var);
            String str = o97Var.c;
            r28 r28VarN = bgf.N(w2g.E(o28Var, 24.0f, 0.0f, 2), "code");
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                k0 k0Var = new k0(1, x87Var, x87.class, "onCodeChanged", "onCodeChanged(Ljava/lang/String;)V", 0, 27);
                p65Var.j0(k0Var);
                objM = k0Var;
            }
            h(str, r28VarN, false, Integer.valueOf(R.string.login_code_too_many_attempts), null, null, (x45) ((qh6) objM), p65Var, 3504, 96);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 5, o97Var, x87Var, r28Var);
        }
    }

    public static final void y(x87 x87Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1721089946);
        int i3 = (p65Var2.f(x87Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var2);
            String strR = vo7.R(p65Var2, R.string.common_close);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new ek5(0, x87Var, x87.class, "onBackPressed", "onBackPressed()V", 0, 21);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, null, (m45) ((qh6) objM), null, c09VarJ, strR, 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_SPATIAL_QUALITY);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v87(x87Var, i2);
        }
    }

    public static final uq z() {
        return new uq(new Paint(7));
    }
}
