package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.view.DragEvent;
import androidx.work.impl.WorkDatabase;
import com.android.installreferrer.api.InstallReferrerClient;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o7f {
    public static final d1g i;
    public static final d1g j;
    public static final d1g k;
    public static final d1g l;
    public static final d1g m;
    public static final /* synthetic */ int s = 0;
    public static final /* synthetic */ int t = 0;
    public static final mz1 a = new mz1(new zz1(1), false, 2136162138);
    public static final mz1 b = new mz1(new yz1(13), false, -528378502);
    public static final mz1 c = new mz1(new c02(29), false, -423495259);
    public static final mz1 d = new mz1(new j02(0), false, -1773905369);
    public static final mz1 e = new mz1(new f02(27), false, 18143212);
    public static final mz1 f = new mz1(new f02(28), false, 1490421805);
    public static final mz1 g = new mz1(new m02(24), false, -31045500);
    public static final wy5 h = new wy5(false);
    public static final sx3 n = new sx3(false);
    public static final sx3 o = new sx3(true);
    public static final mya p = new mya(new sw8(21), 3, new qna(22));
    public static final d3d q = new d3d(17);
    public static final byte[] r = new byte[0];

    static {
        boolean z = false;
        int i2 = 16;
        i = new d1g(i2, "COMPLETING_ALREADY", z);
        j = new d1g(i2, "COMPLETING_WAITING_CHILDREN", z);
        k = new d1g(i2, "COMPLETING_RETRY", z);
        l = new d1g(i2, "TOO_LATE_TO_CANCEL", z);
        m = new d1g(i2, "SEALED", z);
    }

    public static String A(zk1 zk1Var, g96 g96Var) {
        if (zk1Var.a(g96Var)) {
            return null;
        }
        return zk1Var.getDescription();
    }

    public static final boolean B(sb2 sb2Var) {
        va6 va6Var = (va6) sb2Var.Q().o0(cd7.g);
        if (va6Var != null) {
            return va6Var.f();
        }
        return true;
    }

    public static final boolean C(String str) {
        for (int i2 = 0; i2 < str.length(); i2++) {
            char cCharAt = str.charAt(i2);
            if (g76.Q(cCharAt, 128) >= 0 || Character.isLetter(cCharAt)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void D(defpackage.i40 r8, defpackage.y3 r9) {
        /*
            Method dump skipped, instruction units count: 249
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o7f.D(i40, y3):void");
    }

    public static final r28 E(r28 r28Var, x45 x45Var) {
        return r28Var.b(new ir8(x45Var));
    }

    public static final mx0 I(v7c v7cVar, x12 x12Var, int i2) {
        if ((i2 & 1) != 0) {
            v7cVar = J(null, null, x12Var, 0, 7);
        }
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = y30.j(p65Var);
        }
        nhc nhcVar = (nhc) objM;
        boolean zF = ((p65) x12Var).f(v7cVar) | ((p65) x12Var).f(nhcVar);
        p65 p65Var2 = (p65) x12Var;
        Object objM2 = p65Var2.M();
        if (zF || objM2 == uobVar) {
            objM2 = new mx0(v7cVar, nhcVar);
            p65Var2.j0(objM2);
        }
        return (mx0) objM2;
    }

    public static final v7c J(w7c w7cVar, x45 x45Var, x12 x12Var, int i2, int i3) {
        if ((i3 & 1) != 0) {
            w7cVar = w7c.PartiallyExpanded;
        }
        w7c w7cVar2 = w7cVar;
        if ((i3 & 2) != 0) {
            p65 p65Var = (p65) x12Var;
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new nx(19);
                p65Var.j0(objM);
            }
            x45Var = (x45) objM;
        }
        return s7c.b(false, x45Var, w7cVar2, (i3 & 4) != 0, x12Var, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i2 << 6) & 896) | ((i2 << 3) & 7168), 49);
    }

    public static final Object K(Object obj) {
        n06 n06Var = obj instanceof n06 ? (n06) obj : null;
        return n06Var != null ? n06Var.a : obj;
    }

    public static final l44 L(m44 m44Var, yl2 yl2Var) {
        yl2Var.getClass();
        wh7 wh7Var = new wh7();
        wh7Var.i();
        m44Var.serializeVariables(wh7Var, yl2Var, true);
        wh7Var.e();
        Object objM = wh7Var.m();
        objM.getClass();
        l44 l44Var = new l44();
        l44Var.a = (Map) objM;
        return l44Var;
    }

    public static final int M(float f2, float[] fArr, int i2) {
        float f3 = f2 >= 0.0f ? f2 : 0.0f;
        if (f3 > 1.0f) {
            f3 = 1.0f;
        }
        if (Math.abs(f3 - f2) > 1.05E-6f) {
            f3 = Float.NaN;
        }
        fArr[i2] = f3;
        return !Float.isNaN(f3) ? 1 : 0;
    }

    public static final void a(final mz1 mz1Var, final r28 r28Var, final mx0 mx0Var, final float f2, final float f3, final m3c m3cVar, final long j2, final long j3, final float f4, final b55 b55Var, final boolean z, final b55 b55Var2, final c55 c55Var, final long j4, final long j5, final mz1 mz1Var2, x12 x12Var, final int i2, final int i3) {
        int i4;
        mx0 mx0Var2;
        float f5;
        int i5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(920075480);
        if ((i2 & 6) == 0) {
            i4 = (p65Var.h(mz1Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            mx0Var2 = mx0Var;
            i4 |= p65Var.f(mx0Var2) ? 256 : 128;
        } else {
            mx0Var2 = mx0Var;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var.c(f2) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            f5 = f3;
            i4 |= p65Var.c(f5) ? 16384 : 8192;
        } else {
            f5 = f3;
        }
        if ((i2 & 196608) == 0) {
            i4 |= p65Var.f(m3cVar) ? 131072 : 65536;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var.e(j2) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var.e(j3) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i4 |= p65Var.c(0.0f) ? 67108864 : 33554432;
        }
        if ((i2 & 805306368) == 0) {
            i4 |= p65Var.c(f4) ? 536870912 : 268435456;
        }
        if ((i3 & 6) == 0) {
            i5 = i3 | (p65Var.h(b55Var) ? 4 : 2);
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var.h(b55Var2) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i5 |= p65Var.h(c55Var) ? 2048 : 1024;
        }
        if ((i3 & 24576) == 0) {
            i5 |= p65Var.e(j4) ? 16384 : 8192;
        }
        if ((i3 & 196608) == 0) {
            i5 |= p65Var.e(j5) ? 131072 : 65536;
        }
        if ((i3 & 1572864) == 0) {
            i5 |= p65Var.h(mz1Var2) ? 1048576 : 524288;
        }
        if (p65Var.P(i4 & 1, ((i4 & 306783379) == 306783378 && (i5 & 599187) == 599186) ? false : true)) {
            p65Var.U();
            if ((i2 & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            r28 r28VarA0 = flb.a0(r28Var.b(jfc.c), j4, rv8.r);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            k40.c(b09.q(j5, c82.a), pxf.E(999829022, new tw0(mx0Var2, b55Var2, mz1Var2, f2, f5, z, m3cVar, j2, j3, f4, b55Var, mz1Var, c55Var), p65Var), p65Var, 56);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: jw0
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    o7f.a(mz1Var, r28Var, mx0Var, f2, f3, m3cVar, j2, j3, f4, b55Var, z, b55Var2, c55Var, j4, j5, mz1Var2, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void b(b55 b55Var, mz1 mz1Var, mz1 mz1Var2, mz1 mz1Var3, m45 m45Var, v7c v7cVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1217723575);
        int i3 = i2 | (p65Var.h(b55Var) ? 4 : 2) | (p65Var.h(m45Var) ? 16384 : 8192) | (p65Var.f(v7cVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        int i4 = 1;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            List listR = d46.R(b55Var == null ? rz1.a : b55Var, mz1Var, mz1Var2, mz1Var3);
            boolean z = ((i3 & 57344) == 16384) | ((458752 & i3) == 131072);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new yw0(v7cVar, m45Var);
                p65Var.j0(objM);
            }
            w48 w48Var = (w48) objM;
            mz1 mz1Var4 = new mz1(new d50(listR, i4), true, 1271844412);
            boolean zF = p65Var.f(w48Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new x48(w48Var);
                p65Var.j0(objM2);
            }
            zk7 zk7Var = (zk7) objM2;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7Var);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H(0, mz1Var4, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(b55Var, mz1Var, mz1Var2, mz1Var3, m45Var, v7cVar, i2, 2);
        }
    }

    public static final k92 c(ib2 ib2Var) {
        if (ib2Var.o0(cd7.g) == null) {
            ib2Var = ib2Var.j0(bo.q());
        }
        return new k92(ib2Var);
    }

    public static ocb d(int i2, d05 d05Var, int i3, int i4) {
        if ((i4 & 2) != 0) {
            d05Var = d05.f;
        }
        if ((i4 & 4) != 0) {
            i3 = 0;
        }
        return new ocb(i2, d05Var, i3, new c05(new b05[0]));
    }

    public static final void e(yv5 yv5Var, xv5 xv5Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        r28 r28VarB;
        xv5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-99093344);
        int i3 = i2 | (p65Var.f(yv5Var) ? 4 : 2);
        int i4 = 16;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(xv5Var) ? 32 : 16;
        }
        int i5 = i3 | 384;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            boolean z = yv5Var.f;
            o28 o28Var = o28.b;
            if (z && yv5Var.e) {
                p65Var.Y(-1447079017);
                r28VarB = bo.B(o28Var, 4.0f, ((zo7) p65Var.j(kt7.b)).A, rv8.r);
                p65Var.p(false);
            } else {
                p65Var.Y(-1446969494);
                p65Var.p(false);
                r28VarB = o28Var;
            }
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r40.h(jfc.d(r28VarB, 1.0f), null, pxf.E(-2139654572, new g64(yv5Var, i4, xv5Var), p65Var), p65Var, 3072, 6);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 29, yv5Var, xv5Var, r28Var2);
        }
    }

    public static final void f(jy0 jy0Var, d28 d28Var, String str, boolean z, xv5 xv5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        xv5 xv5Var2;
        r28 r28Var2;
        o28 o28Var;
        boolean z2;
        boolean z3;
        ar0 ar0Var = z46.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2109273416);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(jy0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(d28Var.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(str) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            xv5Var2 = xv5Var;
            i3 |= p65Var.f(xv5Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            xv5Var2 = xv5Var;
        }
        int i4 = i3 | 196608;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            o28 o28Var2 = o28.b;
            r28 r28VarC = jy0Var.c(o28Var2);
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var.j(sn3Var)).c;
            nr5 nr5Var = rv8.r;
            r28 r28VarA0 = flb.a0(r28VarC, j2, nr5Var);
            int i5 = wv5.a[d28Var.ordinal()];
            if (i5 != 1) {
                if (i5 == 2) {
                    p65Var = p65Var;
                    p65Var.Y(1994002687);
                    zk7 zk7VarC = dy0.c(ar0Var, false);
                    long j3 = p65Var.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarA0);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    jjd.b(vo7.R(p65Var, R.string.common_media_resource_load_failed), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 0, 0, 131070);
                    p65Var.p(true);
                    p65Var.p(false);
                } else if (i5 == 3) {
                    p65Var = p65Var;
                    p65Var.Y(1994277347);
                    zk7 zk7VarC2 = dy0.c(ar0Var, false);
                    long j4 = p65Var.T;
                    int i7 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL2 = p65Var.l();
                    r28 r28VarR2 = gx1.R(p65Var, r28VarA0);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var2);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC2);
                    tp7.B(p65Var, q12.e, i89VarL2);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i7));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR2);
                    jjd.b(vo7.R(p65Var, R.string.common_media_resource_offline), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 0, 0, 131070);
                    p65Var.p(true);
                    p65Var.p(false);
                } else {
                    if (i5 != 4) {
                        throw ho2.L(p65Var, -212799365, false);
                    }
                    p65Var = p65Var;
                    p65Var.Y(-212754483);
                    if (z) {
                        p65Var.Y(1994562919);
                        r28 r28VarC2 = jy0Var.c(o28Var2);
                        boolean z4 = (i4 & 57344) == 16384;
                        Object objM = p65Var.M();
                        if (z4 || objM == w12.a) {
                            z3 = false;
                            ek5 ek5Var = new ek5(0, xv5Var2, xv5.class, "onEditIframeClicked", "onEditIframeClicked()V", 0, 12);
                            p65Var.j0(ek5Var);
                            objM = ek5Var;
                        } else {
                            z3 = false;
                        }
                        dy0.a(hlg.r(r28VarC2, false, null, null, (m45) ((qh6) objM), 15), p65Var, z3 ? 1 : 0);
                    } else {
                        z3 = false;
                        p65Var.Y(1985214714);
                    }
                    p65Var.p(z3);
                    p65Var.p(z3);
                }
                o28Var = o28Var2;
            } else {
                p65Var = p65Var;
                p65Var.Y(1993166741);
                zk7 zk7VarC3 = dy0.c(ar0Var, false);
                long j5 = p65Var.T;
                int i8 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarA0);
                r12.W.getClass();
                ot2 ot2Var3 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var3);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, zk7VarC3);
                tp7.B(p65Var, q12.e, i89VarL3);
                tp7.B(p65Var, q12.g, Integer.valueOf(i8));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR3);
                iy0 iy0Var = iy0.a;
                if (str != null) {
                    p65Var.Y(-1651548694);
                    o28Var = o28Var2;
                    z2 = false;
                    ur7.a(str, null, iy0Var.b(o28Var2), null, v82.a, 0.0f, null, 0, p65Var, ((i4 >> 6) & 14) | 1572912, 1976);
                    dy0.a(flb.a0(iy0Var.b(o28Var), uu1.b(0.6f, ((zo7) p65Var.j(sn3Var)).c), nr5Var), p65Var, 0);
                } else {
                    o28Var = o28Var2;
                    z2 = false;
                    p65Var.Y(-1659572424);
                }
                p65Var.p(z2);
                xz5.o(iy0Var.a(o28Var, z46.h), null, 0.0f, ((zo7) p65Var.j(sn3Var)).d, 0L, 0, p65Var, 0, 118);
                p65Var.p(true);
                p65Var.p(z2);
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(jy0Var, d28Var, str, z, xv5Var, r28Var2, i2);
        }
    }

    public static final void g(jy0 jy0Var, yv5 yv5Var, xv5 xv5Var, d28 d28Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        x45 x45Var2;
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(39822814);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(jy0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(yv5Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(xv5Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.d(d28Var.ordinal()) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            x45Var2 = x45Var;
            i3 |= p65Var2.h(x45Var2) ? 16384 : 8192;
        } else {
            x45Var2 = x45Var;
        }
        int i4 = 196608 | i3;
        if (p65Var2.P(i4 & 1, (74899 & i4) != 74898)) {
            int iH = f72.h(jy0Var.b);
            int iW0 = nk7.w0(iH * yv5Var.d);
            boolean zD = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 896) == 256) | ((i4 & 7168) == 2048) | p65Var2.d(iH) | p65Var2.d(iW0) | ((57344 & i4) == 16384);
            Object objM = p65Var2.M();
            if (zD || objM == w12.a) {
                ey0 ey0Var = new ey0(iH, iW0, yv5Var, x45Var2, d28Var, xv5Var);
                p65Var2.j0(ey0Var);
                objM = ey0Var;
            }
            x45 x45Var3 = (x45) objM;
            int i5 = (i4 >> 12) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            vc2.a(x45Var3, o28Var, null, p65Var, i5, 4);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(jy0Var, yv5Var, xv5Var, d28Var, x45Var, r28Var2, i2, 6);
        }
    }

    public static final void h(final f86 f86Var, final ek8 ek8Var, x12 x12Var, int i2) {
        int i3;
        final int i4;
        String str = f86Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-190403568);
        int i5 = (p65Var.f(f86Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i5 & 1, (i5 & 19) != 18)) {
            String str2 = f86Var.e;
            boolean z = f86Var.a;
            kx kxVarW = ho2.w(p65Var, 1705776279);
            String strA = af1.a(f86Var.g, p65Var);
            String strQ = vo7.Q(R.string.notification_type_item_added_to_followed_catalog, new Object[]{str, vo7.D(R.plurals.n_stories, 1, new Object[]{1}, p65Var), strA}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str.length() + iZ);
                int iZ2 = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j2 = f86Var.b;
                int i6 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i5 & 14;
                boolean z2 = (i6 == 32) | (i7 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    i4 = 0;
                    objM = new m45() { // from class: g86
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i4;
                            c1e c1eVar = c1e.a;
                            f86 f86Var2 = f86Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i8) {
                                case 0:
                                    ek8Var2.o(f86Var2.f, f86Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(f86Var2.c, f86Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i4 = 0;
                }
                m45 m45Var = (m45) objM;
                int i8 = i6 == 32 ? 1 : i4;
                if (i7 == 4) {
                    i4 = 1;
                }
                int i9 = i8 | i4;
                Object objM2 = p65Var.M();
                if (i9 != 0 || objM2 == uobVar) {
                    final int i10 = 1;
                    objM2 = new m45() { // from class: g86
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i10;
                            c1e c1eVar = c1e.a;
                            f86 f86Var2 = f86Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i82) {
                                case 0:
                                    ek8Var2.o(f86Var2.f, f86Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(f86Var2.c, f86Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                i3 = 14;
                rv8.f(z, str2, null, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 384, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i3 = 14;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm4(f86Var, ek8Var, i2, i3);
        }
    }

    public static final k92 i() {
        m2d m2dVarH = qq7.h();
        r13 r13Var = xg3.a;
        return new k92(flb.p0(m2dVarH, ff7.a));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void j(final v7c v7cVar, final float f2, final float f3, final boolean z, final m3c m3cVar, final long j2, final long j3, final float f4, final b55 b55Var, final mz1 mz1Var, x12 x12Var, final int i2) {
        p65 p65Var;
        boolean z2;
        float f5;
        r28 r28VarJ;
        int i3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2108849428);
        int i4 = i2 | (p65Var2.f(v7cVar) ? 4 : 2) | (p65Var2.c(f2) ? 32 : 16) | (p65Var2.c(f3) ? 256 : 128) | (p65Var2.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(m3cVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.e(j2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.e(j3) ? 1048576 : 524288) | (p65Var2.c(0.0f) ? 8388608 : 4194304) | (p65Var2.c(f4) ? 67108864 : 33554432) | (p65Var2.h(b55Var) ? 536870912 : 268435456);
        if (p65Var2.P(i4 & 1, ((i4 & 306783379) == 306783378 && ((p65Var2.h(mz1Var) ? (char) 4 : (char) 2) & 3) == 2) ? false : true)) {
            i48 i48Var = i48.DefaultSpatial;
            wlc wlcVarN = ek7.N(i48Var, p65Var2);
            wlc wlcVarN2 = ek7.N(i48Var, p65Var2);
            wlc wlcVarN3 = ek7.N(i48.FastEffects, p65Var2);
            int i5 = i4 & 14;
            boolean zH = (i5 == 4) | p65Var2.h(wlcVarN2) | p65Var2.h(wlcVarN3) | p65Var2.h(wlcVarN);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                z2 = false;
                f5 = 0.0f;
                lw0 lw0Var = new lw0(v7cVar, wlcVarN2, wlcVarN3, wlcVarN, 0);
                p65Var2.j0(lw0Var);
                objM = lw0Var;
            } else {
                z2 = false;
                f5 = 0.0f;
            }
            kyd.v((m45) objM, p65Var2);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var2);
                p65Var2.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            hw8 hw8Var = hw8.Vertical;
            float fZ = ((m73) p65Var2.j(z22.h)).Z(f2);
            o28 o28Var = o28.b;
            if (z) {
                p65Var2.Y(2049456610);
                boolean zF = p65Var2.f(v7cVar.e);
                Object objM3 = p65Var2.M();
                if (zF || objM3 == uobVar) {
                    i0 i0Var = new i0(sb2Var, 19, v7cVar);
                    cud cudVar = s7c.a;
                    objM3 = new q7c(v7cVar, i0Var, hw8Var);
                    p65Var2.j0(objM3);
                }
                r28VarJ = rv8.J(o28Var, (zc8) objM3, null);
                p65Var2.p(false);
            } else {
                p65Var2.Y(2049851798);
                p65Var2.p(z2);
                r28VarJ = o28Var;
            }
            r28 r28VarB = jfc.g(jfc.d(jfc.q(o28Var, 0.0f, f3, 1), 1.0f), f2).b(r28VarJ);
            tl tlVar = v7cVar.e;
            boolean zC = (i5 == 4) | p65Var2.c(fZ);
            Object objM4 = p65Var2.M();
            if (zC || objM4 == uobVar) {
                i3 = 1;
                objM4 = new mw0(fZ, i3, v7cVar);
                p65Var2.j0(objM4);
            } else {
                i3 = 1;
            }
            r28 r28VarL = rx0.L(r28VarB, tlVar, hw8Var, (b55) objM4);
            tl tlVar2 = v7cVar.e;
            p65Var = p65Var2;
            int i6 = i4 >> 9;
            g3d.a(xz5.W(pl3.a(r28VarL, (rl) tlVar2.f, hw8Var, z, null, ((k49) tlVar2.h).getValue() != null ? i3 : 0, new kk(tlVar2, null, 0), false, 32), new hw0(v7cVar, i3)), m3cVar, j2, j3, f5, f4, null, pxf.E(1508311921, new ix0(v7cVar, b55Var, mz1Var, sb2Var, z), p65Var), p65Var, (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 12582912 | (i6 & 896) | (i6 & 7168) | (57344 & i6) | (i6 & 458752), 64);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(f2, f3, z, m3cVar, j2, j3, f4, b55Var, mz1Var, i2) { // from class: ow0
                public final /* synthetic */ float b;
                public final /* synthetic */ float c;
                public final /* synthetic */ boolean d;
                public final /* synthetic */ m3c e;
                public final /* synthetic */ long f;
                public final /* synthetic */ long g;
                public final /* synthetic */ float h;
                public final /* synthetic */ b55 i;
                public final /* synthetic */ mz1 j;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    o7f.j(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static f09 k(Bundle bundle, ov8 ov8Var, boolean z) {
        String str = wk0.d() ? "1" : "0";
        Map map = ov8.b;
        pv8 pv8Var = pv8.IAPParameters;
        f09 f09VarI = aq7.i(pv8Var, "is_implicit_purchase_logging_enabled", str, bundle, ov8Var);
        Object objQ = aq7.q(pv8Var, "fb_iap_product_id", bundle, ov8Var);
        String str2 = objQ instanceof String ? (String) objQ : null;
        if (!z) {
            if ((bundle != null ? bundle.getString("fb_content_id") : null) == null && str2 != null) {
                f09 f09VarI2 = aq7.i(pv8Var, "fb_content_id", str2, bundle, ov8Var);
                f09VarI = aq7.i(pv8Var, "android_dynamic_ads_content_id", "client_manual", (Bundle) f09VarI2.a, (ov8) f09VarI2.b);
            }
        }
        f09 f09VarI3 = aq7.i(pv8Var, "is_autolog_app_events_enabled", mme.c() ? "1" : "0", (Bundle) f09VarI.a, (ov8) f09VarI.b);
        return new f09((Bundle) f09VarI3.a, (ov8) f09VarI3.b);
    }

    public static final l41 l(b55 b55Var) {
        return new l41(b55Var, zx3.a, -2, nz0.SUSPEND);
    }

    public static final void m(sb2 sb2Var, CancellationException cancellationException) {
        va6 va6Var = (va6) sb2Var.Q().o0(cd7.g);
        if (va6Var != null) {
            va6Var.m(cancellationException);
        } else {
            ik4.m("Scope cannot be cancelled because it does not have a job: ", sb2Var);
        }
    }

    public static xp q(xp xpVar) {
        if (!"UTF-8".equals(xpVar.q())) {
            return xpVar;
        }
        byte[] bArr = new byte[8];
        int i2 = (xpVar.b * 4) / 3;
        xp xpVar2 = new xp((char) 0, 3);
        xpVar2.d = null;
        xpVar2.c = new byte[i2];
        xpVar2.b = 0;
        int i3 = 0;
        char c2 = 0;
        int i4 = 0;
        int i5 = 0;
        while (true) {
            int i6 = xpVar.b;
            if (i3 >= i6) {
                if (c2 == 11) {
                    for (int i7 = 0; i7 < i5; i7++) {
                        byte[] bArrR = r(bArr[i7]);
                        int length = bArrR.length;
                        xpVar2.k(xpVar2.b + length);
                        System.arraycopy(bArrR, 0, (byte[]) xpVar2.c, xpVar2.b, length);
                        xpVar2.b += length;
                    }
                }
                return xpVar2;
            }
            if (i3 >= i6) {
                z10.i("The index exceeds the valid buffer area");
                return null;
            }
            byte b2 = ((byte[]) xpVar.c)[i3];
            int i8 = b2 & 255;
            if (c2 == 11) {
                if (i4 <= 0 || (b2 & 192) != 128) {
                    byte[] bArrR2 = r(bArr[0]);
                    int length2 = bArrR2.length;
                    xpVar2.k(xpVar2.b + length2);
                    System.arraycopy(bArrR2, 0, (byte[]) xpVar2.c, xpVar2.b, length2);
                    xpVar2.b += length2;
                    i3 -= i5;
                } else {
                    int i9 = i5 + 1;
                    bArr[i5] = (byte) i8;
                    i4--;
                    if (i4 == 0) {
                        xpVar2.k(xpVar2.b + i9);
                        System.arraycopy(bArr, 0, (byte[]) xpVar2.c, xpVar2.b, i9);
                        xpVar2.b += i9;
                    } else {
                        i5 = i9;
                    }
                }
                c2 = 0;
                i5 = 0;
            } else if (i8 < 127) {
                byte b3 = (byte) i8;
                xpVar2.k(xpVar2.b + 1);
                byte[] bArr2 = (byte[]) xpVar2.c;
                int i10 = xpVar2.b;
                xpVar2.b = i10 + 1;
                bArr2[i10] = b3;
            } else if (i8 >= 192) {
                i4 = -1;
                for (int i11 = i8; i4 < 8 && (i11 & 128) == 128; i11 <<= 1) {
                    i4++;
                }
                bArr[i5] = (byte) i8;
                i5++;
                c2 = 11;
            } else {
                byte[] bArrR3 = r((byte) i8);
                int length3 = bArrR3.length;
                xpVar2.k(xpVar2.b + length3);
                System.arraycopy(bArrR3, 0, (byte[]) xpVar2.c, xpVar2.b, length3);
                xpVar2.b += length3;
            }
            i3++;
        }
    }

    public static byte[] r(byte b2) {
        int i2 = b2 & 255;
        if (i2 >= 128) {
            try {
                return (i2 == 129 || i2 == 141 || i2 == 143 || i2 == 144 || i2 == 157) ? new byte[]{32} : new String(new byte[]{b2}, "cp1252").getBytes("UTF-8");
            } catch (UnsupportedEncodingException unused) {
            }
        }
        return new byte[]{b2};
    }

    public static final Object s(b55 b55Var, n92 n92Var) {
        frb frbVar = new frb(n92Var, n92Var.getContext());
        return mo7.U(frbVar, true, frbVar, b55Var);
    }

    public static final m7f t(Context context, r32 r32Var) {
        blb blbVarP;
        context.getClass();
        q7f q7fVar = new q7f(r32Var.c);
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        s10 s10Var = q7fVar.a;
        s10Var.getClass();
        rz5 rz5Var = r32Var.d;
        if (context.getResources().getBoolean(R.bool.workmanager_test_configuration)) {
            blbVarP = new blb(applicationContext, WorkDatabase.class, null);
            blbVarP.i = true;
        } else {
            blbVarP = tr7.p(applicationContext, WorkDatabase.class, "androidx.work.workdb");
            blbVarP.h = new o19(16, applicationContext);
        }
        blbVarP.f = s10Var;
        blbVarP.d.add(new fo1());
        blbVarP.a(q08.h);
        blbVarP.a(new acb(applicationContext, 2, 3));
        blbVarP.a(q08.i);
        blbVarP.a(q08.j);
        blbVarP.a(new acb(applicationContext, 5, 6));
        blbVarP.a(q08.k);
        blbVarP.a(q08.l);
        blbVarP.a(q08.m);
        blbVarP.a(new acb(applicationContext));
        blbVarP.a(new acb(applicationContext, 10, 11));
        blbVarP.a(q08.d);
        blbVarP.a(q08.e);
        blbVarP.a(q08.f);
        blbVarP.a(q08.g);
        blbVarP.a(new acb(applicationContext, 21, 22));
        blbVarP.o = false;
        blbVarP.p = true;
        blbVarP.q = true;
        WorkDatabase workDatabase = (WorkDatabase) blbVarP.b();
        Context applicationContext2 = context.getApplicationContext();
        applicationContext2.getClass();
        sqd sqdVar = new sqd(applicationContext2, q7fVar);
        i2a i2aVar = new i2a(context.getApplicationContext(), r32Var, q7fVar, workDatabase);
        return new m7f(context.getApplicationContext(), r32Var, q7fVar, workDatabase, (List) n7f.a.p(context, r32Var, q7fVar, workDatabase, sqdVar, i2aVar), i2aVar, sqdVar);
    }

    public static f50 u() {
        f50 f50Var;
        synchronized (g50.c()) {
            f50Var = null;
            if (!ec2.a.contains(g50.class)) {
                try {
                    f50Var = g50.e;
                } catch (Throwable th) {
                    ec2.a(g50.class, th);
                }
            }
        }
        return f50Var;
    }

    public static t41 v(r41 r41Var) {
        q41 q41Var = new q41();
        q41Var.c = new dcb();
        t41 t41Var = new t41(q41Var);
        q41Var.b = t41Var;
        q41Var.a = r41Var.getClass();
        try {
            Object objD = r41Var.d(q41Var);
            if (objD == null) {
                return t41Var;
            }
            q41Var.a = objD;
            return t41Var;
        } catch (Exception e2) {
            t41Var.b.l(e2);
            return t41Var;
        }
    }

    public static String w() {
        z10 z10Var;
        if (ec2.a.contains(g50.class)) {
            z10Var = null;
        } else {
            try {
                z10Var = g50.i;
            } catch (Throwable th) {
                ec2.a(g50.class, th);
                z10Var = null;
            }
        }
        z10Var.getClass();
        if (!f94.a().getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).getBoolean("is_referrer_updated", false)) {
            InstallReferrerClient installReferrerClientBuild = InstallReferrerClient.newBuilder(f94.a()).build();
            try {
                installReferrerClientBuild.startConnection(new olb(installReferrerClientBuild, z10Var));
            } catch (Exception unused) {
            }
        }
        return f94.a().getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).getString("install_referrer", null);
    }

    public static final xx6 x(iy6 iy6Var) {
        iy6Var.getClass();
        wx6 lifecycle = iy6Var.getLifecycle();
        lifecycle.getClass();
        zg7 zg7Var = lifecycle.a;
        while (true) {
            xx6 xx6Var = (xx6) ((AtomicReference) zg7Var.b).get();
            if (xx6Var != null) {
                return xx6Var;
            }
            m2d m2dVarH = qq7.h();
            r13 r13Var = xg3.a;
            xx6 xx6Var2 = new xx6(lifecycle, flb.p0(m2dVarH, ff7.a.f));
            AtomicReference atomicReference = (AtomicReference) zg7Var.b;
            do {
                n92 n92Var = null;
                if (atomicReference.compareAndSet(null, xx6Var2)) {
                    r13 r13Var2 = xg3.a;
                    vx0.c0(xx6Var2, ff7.a.f, null, new rc0(xx6Var2, n92Var, 21), 2);
                    return xx6Var2;
                }
            } while (atomicReference.get() == null);
        }
    }

    public static final long y(md5 md5Var) {
        DragEvent dragEvent = (DragEvent) md5Var.b;
        float x = dragEvent.getX();
        float y = dragEvent.getY();
        return (((long) Float.floatToRawIntBits(x)) << 32) | (((long) Float.floatToRawIntBits(y)) & 4294967295L);
    }

    public static void z() {
        synchronized (g50.c()) {
            if (g50.b() != null) {
                return;
            }
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
            if (!ec2.a.contains(g50.class)) {
                try {
                    g50.d = scheduledThreadPoolExecutor;
                } catch (Throwable th) {
                    ec2.a(g50.class, th);
                }
            }
            e eVar = new e(8);
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutorB = g50.b();
            if (scheduledThreadPoolExecutorB != null) {
                scheduledThreadPoolExecutorB.scheduleAtFixedRate(eVar, 0L, 86400L, TimeUnit.SECONDS);
            } else {
                ygf.f("Required value was null.");
            }
        }
    }

    public abstract void F(i2 i2Var, i2 i2Var2);

    public abstract void G(i2 i2Var, Thread thread);

    public abstract qx1 H();

    public abstract boolean n(j2 j2Var, f2 f2Var, f2 f2Var2);

    public abstract boolean o(j2 j2Var, Object obj, Object obj2);

    public abstract boolean p(j2 j2Var, i2 i2Var, i2 i2Var2);
}
