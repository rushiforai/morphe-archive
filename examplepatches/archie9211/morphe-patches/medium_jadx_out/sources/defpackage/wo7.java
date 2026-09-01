package defpackage;

import android.graphics.Path;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.util.LongSparseArray;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.reader.R;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Locale;
import kotlinx.coroutines.TimeoutCancellationException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class wo7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static Field c;
    public static boolean d;
    public static Class e;
    public static boolean f;
    public static Field g;
    public static boolean h;
    public static Field i;
    public static boolean j;
    public static final /* synthetic */ int k = 0;
    public static final /* synthetic */ int l = 0;
    public static final /* synthetic */ int m = 0;

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object A(long r7, defpackage.b55 r9, defpackage.n92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.hmd
            if (r0 == 0) goto L13
            r0 = r10
            hmd r0 = (defpackage.hmd) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            hmd r0 = new hmd
            r0.<init>(r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L32
            if (r2 != r4) goto L2c
            rya r7 = r0.b
            defpackage.br7.v(r10)     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L2a
            return r10
        L2a:
            r8 = move-exception
            goto L56
        L2c:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L32:
            defpackage.br7.v(r10)
            r5 = 0
            int r10 = (r7 > r5 ? 1 : (r7 == r5 ? 0 : -1))
            if (r10 > 0) goto L3c
            goto L5c
        L3c:
            rya r10 = new rya
            r10.<init>()
            r0.b = r10     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            r0.d = r4     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            gmd r2 = new gmd     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            r2.<init>(r7, r0)     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            r10.a = r2     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            java.lang.Object r7 = v(r2, r9)     // Catch: kotlinx.coroutines.TimeoutCancellationException -> L54
            if (r7 != r1) goto L53
            return r1
        L53:
            return r7
        L54:
            r8 = move-exception
            r7 = r10
        L56:
            va6 r9 = r8.a
            java.lang.Object r7 = r7.a
            if (r9 != r7) goto L5d
        L5c:
            return r3
        L5d:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wo7.A(long, b55, n92):java.lang.Object");
    }

    public static hz B() {
        fy1 fy1Var = new fy1(-1, -1, 0, true);
        Parcelable.Creator<hz> creator = hz.CREATOR;
        hz hzVar = new hz(fy1Var, false);
        hzVar.c = false;
        return hzVar;
    }

    public static duf C(long j2, Object obj) {
        duf dufVar = (duf) avf.n(j2, obj);
        if (((puf) dufVar).a) {
            return dufVar;
        }
        puf pufVar = (puf) dufVar;
        int i2 = pufVar.c;
        puf pufVarE = pufVar.e(i2 == 0 ? 10 : i2 << 1);
        avf.b(j2, obj, pufVarE);
        return pufVarE;
    }

    public static final void a(final r28 r28Var, final m78 m78Var, final l78 l78Var, final yrb yrbVar, final m3c m3cVar, final long j2, final float f2, final mz1 mz1Var, x12 x12Var, final int i2) {
        int i3;
        float f3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(848986741);
        int i4 = i2 | (p65Var.f(r28Var) ? 4 : 2) | (p65Var.f(m78Var) ? 32 : 16) | (p65Var.f(yrbVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(m3cVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.e(j2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.c(0.0f) ? 1048576 : 524288) | (p65Var.c(f2) ? 8388608 : 4194304) | (p65Var.f(null) ? 67108864 : 33554432) | (p65Var.h(mz1Var) ? 536870912 : 268435456);
        if (p65Var.P(i4 & 1, (i4 & 306783379) != 306783378)) {
            dsd dsdVarK0 = k40.K0(m78Var, "DropDownMenu", p65Var, (((i4 >> 3) & 14) | 48) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            wlc wlcVarN = ek7.N(i48.FastSpatial, p65Var);
            wlc wlcVarN2 = ek7.N(i48.FastEffects, p65Var);
            hud hudVar = d46.i;
            b2 b2Var = dsdVarK0.a;
            k49 k49Var = dsdVarK0.d;
            boolean zBooleanValue = ((Boolean) b2Var.o0()).booleanValue();
            p65Var.Y(143964305);
            float f4 = zBooleanValue ? 1.0f : 0.8f;
            p65Var.p(false);
            Float fValueOf = Float.valueOf(f4);
            boolean zBooleanValue2 = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(143964305);
            float f5 = zBooleanValue2 ? 1.0f : 0.8f;
            p65Var.p(false);
            Float fValueOf2 = Float.valueOf(f5);
            dsdVarK0.f();
            p65Var.Y(-745957716);
            p65Var.p(false);
            boolean z = true;
            bsd bsdVarW = k40.W(dsdVarK0, fValueOf, fValueOf2, wlcVarN, hudVar, p65Var, 0);
            boolean zBooleanValue3 = ((Boolean) dsdVarK0.a.o0()).booleanValue();
            p65Var.Y(892761509);
            float f6 = zBooleanValue3 ? 1.0f : 0.0f;
            p65Var.p(false);
            Float fValueOf3 = Float.valueOf(f6);
            boolean zBooleanValue4 = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(892761509);
            float f7 = zBooleanValue4 ? 1.0f : 0.0f;
            p65Var.p(false);
            Float fValueOf4 = Float.valueOf(f7);
            dsdVarK0.f();
            p65Var.Y(2839488);
            p65Var.p(false);
            bsd bsdVarW2 = k40.W(dsdVarK0, fValueOf3, fValueOf4, wlcVarN2, hudVar, p65Var, 0);
            boolean zBooleanValue5 = ((Boolean) p65Var.j(l36.a)).booleanValue();
            boolean zG = p65Var.g(zBooleanValue5) | p65Var.f(bsdVarW);
            if ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) != 32) {
                z = false;
            }
            boolean zF = z | zG | p65Var.f(bsdVarW2);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                i3 = 0;
                f3 = 0.0f;
                xx7 xx7Var = new xx7(zBooleanValue5, m78Var, l78Var, bsdVarW, bsdVarW2);
                p65Var.j0(xx7Var);
                objM = xx7Var;
            } else {
                i3 = 0;
                f3 = 0.0f;
            }
            int i5 = i4 >> 9;
            int i6 = i4 >> 6;
            g3d.a(xz5.W(o28.b, (x45) objM), m3cVar, j2, 0L, f3, f2, null, pxf.E(-1463404422, new zx7(r28Var, yrbVar, mz1Var, i3), p65Var), p65Var, (i5 & 896) | (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 12582912 | (57344 & i6) | (458752 & i6) | (i6 & 3670016), 8);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(m78Var, l78Var, yrbVar, m3cVar, j2, f2, mz1Var, i2) { // from class: yx7
                public final /* synthetic */ m78 b;
                public final /* synthetic */ l78 c;
                public final /* synthetic */ yrb d;
                public final /* synthetic */ m3c e;
                public final /* synthetic */ long f;
                public final /* synthetic */ float g;
                public final /* synthetic */ mz1 h;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(385);
                    wo7.a(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void b(b55 b55Var, m45 m45Var, r28 r28Var, b55 b55Var2, b55 b55Var3, boolean z, qx7 qx7Var, hy8 hy8Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1325192924);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(b55Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(b55Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.h(b55Var3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.f(qx7Var) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var.f(hy8Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= p65Var.f(null) ? 67108864 : 33554432;
        }
        if (p65Var.P(i3 & 1, (38347923 & i3) != 38347922)) {
            r28 r28VarB = w2g.B(jfc.o(jfc.d(hlg.p(r28Var, null, qkb.a(0.0f, 6, 0L, true), z, null, m45Var, 24), 1.0f), 112.0f, 48.0f, 280.0f, 0.0f, 8), hy8Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.a(((lyd) p65Var.j(pyd.a)).m, pxf.E(865999929, new ix0(b55Var2, qx7Var, z, b55Var3, b55Var), p65Var), p65Var, 48);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rl1(b55Var, m45Var, r28Var, b55Var2, b55Var3, z, qx7Var, hy8Var, i2);
        }
    }

    public static final void c(m45 m45Var, mz1 mz1Var, r28 r28Var, boolean z, m3c m3cVar, nl1 nl1Var, x12 x12Var, int i2) {
        r28 r28Var2;
        boolean z2;
        m3c m3cVar2;
        nl1 nl1Var2;
        int i3;
        m3c m3cVar3;
        r28 r28Var3;
        nl1 nl1Var3;
        boolean z3;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1145483845);
        int i4 = i2 | (p65Var.h(m45Var) ? 4 : 2) | 919170432;
        if (p65Var.P(i4 & 1, (306783379 & i4) != 306783378)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                amb ambVarA = bmb.a(18.0f);
                float f2 = z0d.a;
                sn3 sn3Var = kt7.b;
                long j2 = ((zo7) p65Var.j(sn3Var)).b;
                long j3 = ((zo7) p65Var.j(sn3Var)).n;
                long j4 = ((zo7) p65Var.j(sn3Var)).n;
                long j5 = ((zo7) p65Var.j(sn3Var)).c;
                long j6 = ((zo7) p65Var.j(sn3Var)).o;
                long j7 = ((zo7) p65Var.j(sn3Var)).o;
                nl1 nl1VarE = wl1.e((fv1) p65Var.j(iv1.a));
                long j8 = uu1.h;
                if (j2 == 16) {
                    j2 = nl1VarE.a;
                }
                long j9 = j2;
                if (j3 == 16) {
                    j3 = nl1VarE.b;
                }
                long j10 = j3;
                if (j4 == 16) {
                    j4 = nl1VarE.c;
                }
                long j11 = j4;
                long j12 = j8 != 16 ? j8 : nl1VarE.d;
                if (j5 == 16) {
                    j5 = nl1VarE.e;
                }
                long j13 = j5;
                if (j6 == 16) {
                    j6 = nl1VarE.f;
                }
                long j14 = j6;
                if (j7 == 16) {
                    j7 = nl1VarE.g;
                }
                nl1 nl1Var4 = new nl1(j9, j10, j11, j12, j13, j14, j7, j8 != 16 ? j8 : nl1VarE.h);
                i3 = i4 & (-4128769);
                m3cVar3 = ambVarA;
                r28Var3 = o28.b;
                nl1Var3 = nl1Var4;
                z3 = true;
            } else {
                p65Var.S();
                i3 = i4 & (-4128769);
                r28Var3 = r28Var;
                z3 = z;
                m3cVar3 = m3cVar;
                nl1Var3 = nl1Var;
            }
            p65Var.q();
            wl1.d(m45Var, mz1Var, r28Var3, z3, m3cVar3, nl1Var3, null, null, p65Var, i3 & 2147483646);
            r28Var2 = r28Var3;
            z2 = z3;
            m3cVar2 = m3cVar3;
            nl1Var2 = nl1Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            z2 = z;
            m3cVar2 = m3cVar;
            nl1Var2 = nl1Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ke0(m45Var, mz1Var, r28Var2, z2, m3cVar2, nl1Var2, i2, 3);
        }
    }

    public static final void d(Integer num, r28 r28Var, boolean z, m45 m45Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1335480974);
        int i3 = i2 | (p65Var.f(num) ? 4 : 2) | (p65Var.g(z) ? 256 : 128) | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarB = hlg.r(o28Var, z, null, null, m45Var, 14).b(r28Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
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
            c09 c09VarJ = vn7.J(R.drawable.ic_respond_24, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.common_read_responses);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, strR, null, ((zo7) p65Var.j(sn3Var)).o, p65Var, 8, 4);
            hp7.t(p65Var, jfc.p(o28Var, 4.0f));
            Integer num2 = num.intValue() > 0 ? num : null;
            String strG = num2 != null ? dq1.g(num2) : null;
            if (strG == null) {
                strG = km4.w(p65Var, -103893153, R.string.common_count_placeholder, p65Var, false);
            } else {
                p65Var.Y(-103896191);
                p65Var.p(false);
            }
            jjd.b(strG, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(num, r28Var, z, m45Var, i2, 9);
        }
    }

    public static final void e(xm1 xm1Var, Integer num, boolean z, ojc ojcVar, r28 r28Var, x12 x12Var, int i2) {
        xm1Var.getClass();
        ojcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-634229838);
        int i3 = i2 | (p65Var.f(xm1Var) ? 4 : 2) | (p65Var.f(num) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.f(ojcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
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
            g3d.a(jfc.e(o28.b, 40.0f), bmb.a(22.0f), ap7.b(((zo7) p65Var.j(kt7.b)).a, p65Var, 0), 0L, 0.0f, 6.0f, null, pxf.E(-1088750013, new ov0(10, xm1Var, ojcVar, num, z), p65Var), p65Var, 12779526, 88);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new je0(xm1Var, num, z, ojcVar, r28Var, i2);
        }
    }

    public static final void f(int i2, StringBuilder sb) {
        for (int i3 = 0; i3 < i2; i3++) {
            sb.append("?");
            if (i3 < i2 - 1) {
                sb.append(",");
            }
        }
    }

    public static void g(View view, View view2, String str) {
        HashSet hashSet;
        Field declaredField;
        Field declaredField2;
        Object obj;
        view.getClass();
        int iHashCode = view.hashCode();
        HashSet hashSet2 = zue.e;
        HashSet hashSet3 = null;
        if (ec2.a.contains(zue.class)) {
            hashSet = null;
        } else {
            try {
                hashSet = zue.e;
            } catch (Throwable th) {
                ec2.a(zue.class, th);
                hashSet = null;
            }
        }
        if (hashSet.contains(Integer.valueOf(iHashCode))) {
            return;
        }
        zue zueVar = new zue(view, view2, str);
        if (!ec2.a.contains(gue.class)) {
            try {
                try {
                    declaredField = Class.forName("android.view.View").getDeclaredField("mListenerInfo");
                } catch (ClassNotFoundException | NoSuchFieldException unused) {
                    declaredField = null;
                }
                try {
                    declaredField2 = Class.forName("android.view.View$ListenerInfo").getDeclaredField("mOnClickListener");
                } catch (ClassNotFoundException | NoSuchFieldException unused2) {
                    declaredField2 = null;
                }
                if (declaredField == null || declaredField2 == null) {
                    view.setOnClickListener(zueVar);
                } else {
                    declaredField.setAccessible(true);
                    declaredField2.setAccessible(true);
                    try {
                        declaredField.setAccessible(true);
                        obj = declaredField.get(view);
                    } catch (IllegalAccessException unused3) {
                        obj = null;
                    }
                    if (obj == null) {
                        view.setOnClickListener(zueVar);
                    } else {
                        declaredField2.set(obj, zueVar);
                    }
                }
            } catch (Exception unused4) {
            } catch (Throwable th2) {
                ec2.a(gue.class, th2);
            }
        }
        if (!ec2.a.contains(zue.class)) {
            try {
                hashSet3 = zue.e;
            } catch (Throwable th3) {
                ec2.a(zue.class, th3);
            }
        }
        hashSet3.add(Integer.valueOf(iHashCode));
    }

    public static final xua h(bfc bfcVar) {
        bfcVar.getClass();
        return new xua(bfcVar);
    }

    public static final yua i(ikc ikcVar) {
        ikcVar.getClass();
        return new yua(ikcVar);
    }

    public static boolean j(i69[] i69VarArr, i69[] i69VarArr2) {
        if (i69VarArr != null && i69VarArr2 != null && i69VarArr.length == i69VarArr2.length) {
            for (int i2 = 0; i2 < i69VarArr.length; i2++) {
                i69 i69Var = i69VarArr[i2];
                char c2 = i69Var.a;
                i69 i69Var2 = i69VarArr2[i2];
                if (c2 == i69Var2.a && i69Var.b.length == i69Var2.b.length) {
                }
            }
            return true;
        }
        return false;
    }

    public static void k(za8 za8Var, String str, mz1 mz1Var) {
        za8Var.g.add(new e12((d12) za8Var.f.b(gq7.w(d12.class)), str, mz1Var).a());
    }

    public static float[] l(int i2, float[] fArr) {
        if (i2 < 0) {
            lg8.r();
            return null;
        }
        int length = fArr.length;
        if (length < 0) {
            throw new ArrayIndexOutOfBoundsException();
        }
        int iMin = Math.min(i2, length);
        float[] fArr2 = new float[i2];
        System.arraycopy(fArr, 0, fArr2, 0, iMin);
        return fArr2;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0096 A[Catch: NumberFormatException -> 0x00aa, LOOP:3: B:25:0x0068->B:44:0x0096, LOOP_END, TryCatch #0 {NumberFormatException -> 0x00aa, blocks: (B:22:0x0054, B:25:0x0068, B:27:0x006e, B:31:0x007a, B:44:0x0096, B:46:0x009c, B:52:0x00b1, B:53:0x00b4), top: B:68:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x009c A[Catch: NumberFormatException -> 0x00aa, TryCatch #0 {NumberFormatException -> 0x00aa, blocks: (B:22:0x0054, B:25:0x0068, B:27:0x006e, B:31:0x007a, B:44:0x0096, B:46:0x009c, B:52:0x00b1, B:53:0x00b4), top: B:68:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00b1 A[Catch: NumberFormatException -> 0x00aa, TryCatch #0 {NumberFormatException -> 0x00aa, blocks: (B:22:0x0054, B:25:0x0068, B:27:0x006e, B:31:0x007a, B:44:0x0096, B:46:0x009c, B:52:0x00b1, B:53:0x00b4), top: B:68:0x0054 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00d6 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0095 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.i69[] m(java.lang.String r17) {
        /*
            Method dump skipped, instruction units count: 268
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wo7.m(java.lang.String):i69[]");
    }

    public static i69[] n(i69[] i69VarArr) {
        i69[] i69VarArr2 = new i69[i69VarArr.length];
        for (int i2 = 0; i2 < i69VarArr.length; i2++) {
            i69VarArr2[i2] = new i69(i69VarArr[i2]);
        }
        return i69VarArr2;
    }

    public static void o(Object obj) {
        LongSparseArray longSparseArray;
        if (!f) {
            try {
                e = Class.forName("android.content.res.ThemedResourceCache");
            } catch (ClassNotFoundException e2) {
                Log.e("ResourcesFlusher", "Could not find ThemedResourceCache class", e2);
            }
            f = true;
        }
        Class cls = e;
        if (cls == null) {
            return;
        }
        if (!h) {
            try {
                Field declaredField = cls.getDeclaredField("mUnthemedEntries");
                g = declaredField;
                declaredField.setAccessible(true);
            } catch (NoSuchFieldException e3) {
                Log.e("ResourcesFlusher", "Could not retrieve ThemedResourceCache#mUnthemedEntries field", e3);
            }
            h = true;
        }
        Field field = g;
        if (field == null) {
            return;
        }
        try {
            longSparseArray = (LongSparseArray) field.get(obj);
        } catch (IllegalAccessException e4) {
            Log.e("ResourcesFlusher", "Could not retrieve value from ThemedResourceCache#mUnthemedEntries", e4);
            longSparseArray = null;
        }
        if (longSparseArray != null) {
            longSparseArray.clear();
        }
    }

    public static x2b p(String str) {
        return new x2b(str, y2b.LITERAL);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void r(i69[] i69VarArr, Path path) {
        int i2;
        float[] fArr;
        int i3;
        i69 i69Var;
        int i4;
        char c2;
        float f2;
        float f3;
        i69 i69Var2;
        boolean z;
        float f4;
        float f5;
        float f6;
        float f7;
        float f8;
        float f9;
        float f10;
        float f11;
        i69[] i69VarArr2 = i69VarArr;
        Path path2 = path;
        float[] fArr2 = new float[6];
        int length = i69VarArr2.length;
        int i5 = 0;
        int i6 = 0;
        char c3 = 'm';
        while (i6 < length) {
            i69 i69Var3 = i69VarArr2[i6];
            char c4 = i69Var3.a;
            float[] fArr3 = i69Var3.b;
            float f12 = fArr2[i5];
            float f13 = fArr2[1];
            float f14 = fArr2[2];
            float f15 = fArr2[3];
            float f16 = fArr2[4];
            int i7 = i5;
            float f17 = fArr2[5];
            switch (c4) {
                case 'A':
                case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                    i2 = 7;
                    break;
                case 'C':
                case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                    i2 = 6;
                    break;
                case 'H':
                case 'V':
                case 'h':
                case 'v':
                    i2 = 1;
                    break;
                case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                case 'q':
                case 's':
                    i2 = 4;
                    break;
                case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                case 'z':
                    path2.close();
                    path2.moveTo(f16, f17);
                    f12 = f16;
                    f14 = f12;
                    f13 = f17;
                    f15 = f13;
                default:
                    i2 = 2;
                    break;
            }
            float f18 = f16;
            float f19 = f17;
            float f20 = f12;
            float f21 = f13;
            int i8 = i7;
            while (i8 < fArr3.length) {
                if (c4 == 'A') {
                    fArr = fArr3;
                    i3 = i8;
                    i69Var = i69Var3;
                    float f22 = f20;
                    float f23 = f21;
                    i4 = i6;
                    c2 = c4;
                    int i9 = i3 + 5;
                    int i10 = i3 + 6;
                    i69.a(path, f22, f23, fArr[i9], fArr[i10], fArr[i3], fArr[i3 + 1], fArr[i3 + 2], fArr[i3 + 3] != 0.0f ? 1 : i7, fArr[i3 + 4] != 0.0f ? 1 : i7);
                    f14 = fArr[i9];
                    f2 = fArr[i10];
                    f15 = f2;
                    f3 = f14;
                } else if (c4 == 'C') {
                    fArr = fArr3;
                    i3 = i8;
                    i4 = i6;
                    i69Var = i69Var3;
                    c2 = c4;
                    int i11 = i3 + 2;
                    int i12 = i3 + 3;
                    int i13 = i3 + 4;
                    int i14 = i3 + 5;
                    path2.cubicTo(fArr[i3], fArr[i3 + 1], fArr[i11], fArr[i12], fArr[i13], fArr[i14]);
                    float f24 = fArr[i13];
                    float f25 = fArr[i14];
                    f14 = fArr[i11];
                    f15 = fArr[i12];
                    f2 = f25;
                    f3 = f24;
                } else if (c4 == 'H') {
                    fArr = fArr3;
                    i3 = i8;
                    i69Var = i69Var3;
                    c2 = c4;
                    f2 = f21;
                    i4 = i6;
                    path2.lineTo(fArr[i3], f2);
                    f3 = fArr[i3];
                } else if (c4 == 'Q') {
                    fArr = fArr3;
                    i3 = i8;
                    i4 = i6;
                    i69Var = i69Var3;
                    c2 = c4;
                    int i15 = i3 + 1;
                    int i16 = i3 + 2;
                    int i17 = i3 + 3;
                    path2.quadTo(fArr[i3], fArr[i15], fArr[i16], fArr[i17]);
                    float f26 = fArr[i3];
                    float f27 = fArr[i15];
                    float f28 = fArr[i16];
                    float f29 = fArr[i17];
                    f14 = f26;
                    f15 = f27;
                    f3 = f28;
                    f2 = f29;
                } else if (c4 == 'V') {
                    fArr = fArr3;
                    i3 = i8;
                    i4 = i6;
                    i69Var = i69Var3;
                    f3 = f20;
                    c2 = c4;
                    path2.lineTo(f3, fArr[i3]);
                    f2 = fArr[i3];
                } else if (c4 != 'a') {
                    if (c4 == 'c') {
                        fArr = fArr3;
                        i3 = i8;
                        int i18 = i3 + 2;
                        int i19 = i3 + 3;
                        int i20 = i3 + 4;
                        int i21 = i3 + 5;
                        path2.rCubicTo(fArr[i3], fArr[i3 + 1], fArr[i18], fArr[i19], fArr[i20], fArr[i21]);
                        float f30 = fArr[i18] + f20;
                        float f31 = fArr[i19] + f21;
                        f20 += fArr[i20];
                        f21 += fArr[i21];
                        f14 = f30;
                        f15 = f31;
                    } else if (c4 != 'h') {
                        if (c4 != 'q') {
                            if (c4 != 'v') {
                                if (c4 == 'L') {
                                    fArr = fArr3;
                                    i3 = i8;
                                    int i22 = i3 + 1;
                                    path2.lineTo(fArr[i3], fArr[i22]);
                                    f3 = fArr[i3];
                                    f2 = fArr[i22];
                                } else if (c4 == 'M') {
                                    fArr = fArr3;
                                    i3 = i8;
                                    f3 = fArr[i3];
                                    f2 = fArr[i3 + 1];
                                    if (i3 > 0) {
                                        path2.lineTo(f3, f2);
                                    } else {
                                        path2.moveTo(f3, f2);
                                        f18 = f3;
                                        f19 = f2;
                                    }
                                } else if (c4 != 'S') {
                                    if (c4 == 'T') {
                                        fArr = fArr3;
                                        i3 = i8;
                                        if (c3 == 'q' || c3 == 't' || c3 == 'Q' || c3 == 'T') {
                                            f20 = (f20 * 2.0f) - f14;
                                            f21 = (f21 * 2.0f) - f15;
                                        }
                                        int i23 = i3 + 1;
                                        path2.quadTo(f20, f21, fArr[i3], fArr[i23]);
                                        f3 = fArr[i3];
                                        f2 = fArr[i23];
                                        i69Var = i69Var3;
                                        f14 = f20;
                                        f15 = f21;
                                    } else if (c4 == 'l') {
                                        fArr = fArr3;
                                        i3 = i8;
                                        int i24 = i3 + 1;
                                        path2.rLineTo(fArr[i3], fArr[i24]);
                                        f20 += fArr[i3];
                                        f7 = fArr[i24];
                                    } else if (c4 == 'm') {
                                        fArr = fArr3;
                                        i3 = i8;
                                        float f32 = fArr[i3];
                                        f20 += f32;
                                        float f33 = fArr[i3 + 1];
                                        f21 += f33;
                                        if (i3 > 0) {
                                            path2.rLineTo(f32, f33);
                                        } else {
                                            path2.rMoveTo(f32, f33);
                                            i69Var = i69Var3;
                                            f3 = f20;
                                            f18 = f3;
                                            f2 = f21;
                                            f19 = f2;
                                        }
                                    } else if (c4 != 's') {
                                        if (c4 != 't') {
                                            fArr = fArr3;
                                            i3 = i8;
                                            i69Var = i69Var3;
                                            f3 = f20;
                                        } else {
                                            if (c3 == 'q' || c3 == 't' || c3 == 'Q' || c3 == 'T') {
                                                f10 = f20 - f14;
                                                f11 = f21 - f15;
                                            } else {
                                                f11 = 0.0f;
                                                f10 = 0.0f;
                                            }
                                            int i25 = i8 + 1;
                                            path2.rQuadTo(f10, f11, fArr3[i8], fArr3[i25]);
                                            float f34 = f10 + f20;
                                            float f35 = f11 + f21;
                                            float f36 = f20 + fArr3[i8];
                                            f21 += fArr3[i25];
                                            f15 = f35;
                                            fArr = fArr3;
                                            i3 = i8;
                                            i69Var = i69Var3;
                                            f3 = f36;
                                            f14 = f34;
                                        }
                                        f2 = f21;
                                    } else {
                                        if (c3 == 'c' || c3 == 's' || c3 == 'C' || c3 == 'S') {
                                            f8 = f21 - f15;
                                            f9 = f20 - f14;
                                        } else {
                                            f9 = 0.0f;
                                            f8 = 0.0f;
                                        }
                                        int i26 = i8;
                                        int i27 = i26 + 1;
                                        int i28 = i26 + 2;
                                        int i29 = i26 + 3;
                                        fArr = fArr3;
                                        i3 = i26;
                                        path2.rCubicTo(f9, f8, fArr3[i26], fArr3[i27], fArr3[i28], fArr3[i29]);
                                        f4 = fArr[i3] + f20;
                                        f5 = fArr[i27] + f21;
                                        f20 += fArr[i28];
                                        f6 = fArr[i29];
                                    }
                                    i4 = i6;
                                    c2 = c4;
                                } else {
                                    fArr = fArr3;
                                    i3 = i8;
                                    if (c3 == 'c' || c3 == 's' || c3 == 'C' || c3 == 'S') {
                                        f20 = (f20 * 2.0f) - f14;
                                        f21 = (f21 * 2.0f) - f15;
                                    }
                                    float f37 = f20;
                                    float f38 = f21;
                                    int i30 = i3 + 1;
                                    int i31 = i3 + 2;
                                    int i32 = i3 + 3;
                                    path2.cubicTo(f37, f38, fArr[i3], fArr[i30], fArr[i31], fArr[i32]);
                                    f14 = fArr[i3];
                                    f15 = fArr[i30];
                                    f3 = fArr[i31];
                                    f2 = fArr[i32];
                                }
                                i4 = i6;
                                i69Var = i69Var3;
                                c2 = c4;
                            } else {
                                fArr = fArr3;
                                i3 = i8;
                                path2.rLineTo(0.0f, fArr[i3]);
                                f7 = fArr[i3];
                            }
                            f21 += f7;
                        } else {
                            fArr = fArr3;
                            i3 = i8;
                            int i33 = i3 + 1;
                            int i34 = i3 + 2;
                            int i35 = i3 + 3;
                            path2.rQuadTo(fArr[i3], fArr[i33], fArr[i34], fArr[i35]);
                            f4 = fArr[i3] + f20;
                            f5 = fArr[i33] + f21;
                            f20 += fArr[i34];
                            f6 = fArr[i35];
                        }
                        f21 += f6;
                        f14 = f4;
                        f15 = f5;
                    } else {
                        fArr = fArr3;
                        i3 = i8;
                        path2.rLineTo(fArr[i3], 0.0f);
                        f20 += fArr[i3];
                    }
                    i69Var = i69Var3;
                    f3 = f20;
                    f2 = f21;
                    i4 = i6;
                    c2 = c4;
                } else {
                    fArr = fArr3;
                    i3 = i8;
                    int i36 = i3 + 5;
                    float f39 = fArr[i36] + f20;
                    int i37 = i3 + 6;
                    float f40 = fArr[i37] + f21;
                    float f41 = fArr[i3];
                    float f42 = fArr[i3 + 1];
                    float f43 = fArr[i3 + 2];
                    if (fArr[i3 + 3] != 0.0f) {
                        i69Var2 = i69Var3;
                        z = 1;
                    } else {
                        i69Var2 = i69Var3;
                        z = i7;
                    }
                    i69Var = i69Var2;
                    float f44 = f20;
                    c2 = c4;
                    float f45 = f21;
                    i4 = i6;
                    i69.a(path, f44, f45, f39, f40, f41, f42, f43, z, fArr[i3 + 4] != 0.0f ? 1 : i7);
                    f3 = f44 + fArr[i36];
                    f2 = f45 + fArr[i37];
                    f14 = f3;
                    f15 = f2;
                }
                i8 = i3 + i2;
                path2 = path;
                i69Var3 = i69Var;
                c4 = c2;
                i6 = i4;
                f20 = f3;
                f21 = f2;
                c3 = c4;
                fArr3 = fArr;
            }
            fArr2[i7] = f20;
            fArr2[1] = f21;
            fArr2[2] = f14;
            fArr2[3] = f15;
            fArr2[4] = f18;
            fArr2[5] = f19;
            c3 = i69Var3.a;
            i6++;
            i69VarArr2 = i69VarArr;
            path2 = path;
            i5 = i7;
        }
    }

    public static void s(String str, String str2, float[] fArr) {
        boolean zContains;
        boolean zContains2;
        y0d y0dVar = y0d.a;
        if (ec2.a.contains(y0d.class)) {
            zContains = false;
        } else {
            try {
                str.getClass();
                zContains = y0d.c.contains(str);
            } catch (Throwable th) {
                ec2.a(y0d.class, th);
                zContains = false;
            }
        }
        if (zContains) {
            g50 g50Var = new g50(f94.a(), (String) null);
            if (ec2.a.contains(g50Var)) {
                return;
            }
            try {
                Bundle bundle = new Bundle();
                bundle.putString("_is_suggested_event", "1");
                bundle.putString("_button_text", str2);
                g50Var.d(str, bundle);
                return;
            } catch (Throwable th2) {
                ec2.a(g50Var, th2);
                return;
            }
        }
        if (ec2.a.contains(y0d.class)) {
            zContains2 = false;
        } else {
            try {
                str.getClass();
                zContains2 = y0d.d.contains(str);
            } catch (Throwable th3) {
                ec2.a(y0d.class, th3);
                zContains2 = false;
            }
        }
        if (zContains2) {
            Bundle bundle2 = new Bundle();
            try {
                bundle2.putString("event_name", str);
                JSONObject jSONObject = new JSONObject();
                StringBuilder sb = new StringBuilder();
                for (float f2 : fArr) {
                    sb.append(f2);
                    sb.append(",");
                }
                jSONObject.put("dense", sb.toString());
                jSONObject.put("button_text", str2);
                bundle2.putString("metadata", jSONObject.toString());
                String str3 = ff5.j;
                ff5 ff5VarH0 = xz5.h0(null, String.format(Locale.US, "%s/suggested_events", Arrays.copyOf(new Object[]{f94.b()}, 1)), null, null);
                ff5VarH0.d = bundle2;
                ff5VarH0.c();
            } catch (JSONException unused) {
            }
        }
    }

    public static dh7 t(hv2 hv2Var, String str, Integer num, Boolean bool, String str2, String str3, String str4, String str5, int i2) {
        if ((i2 & 2) != 0) {
            str = null;
        }
        if ((i2 & 4) != 0) {
            num = null;
        }
        if ((i2 & 8) != 0) {
            bool = null;
        }
        if ((i2 & 16) != 0) {
            str2 = null;
        }
        if ((i2 & 32) != 0) {
            str3 = null;
        }
        if ((i2 & 64) != 0) {
            str4 = null;
        }
        if ((i2 & 128) != 0) {
            str5 = null;
        }
        hv2Var.getClass();
        dh7 dh7Var = new dh7();
        dh7Var.put("error_type", gv2.BILLING);
        dh7Var.put("purchase_stage", hv2Var.name());
        if (str != null) {
            dh7Var.put("product_id", str);
        }
        if (num != null) {
            dh7Var.put("response_code", Integer.valueOf(num.intValue()));
        }
        if (bool != null) {
            dh7Var.put("is_upgrade", bool);
        }
        if (str2 != null) {
            dh7Var.put("referrer_source", str2);
        }
        if (str3 != null) {
            dh7Var.put("source", str3);
        }
        if (str4 != null) {
            dh7Var.put("location", str4);
        }
        if (str5 != null) {
            dh7Var.put("order_id", str5);
        }
        return dh7Var.b();
    }

    public static boolean u(String str, String str2) {
        hy9 hy9Var = hy9.a;
        String str3 = null;
        if (!ec2.a.contains(hy9.class)) {
            try {
                LinkedHashMap linkedHashMap = hy9.b;
                if (linkedHashMap.containsKey(str)) {
                    str3 = (String) linkedHashMap.get(str);
                }
            } catch (Throwable th) {
                ec2.a(hy9.class, th);
            }
        }
        if (str3 == null) {
            return false;
        }
        if (str3.equals("other")) {
            return true;
        }
        try {
            f94.c().execute(new fi2(str3, 28, str2));
            return true;
        } catch (Exception unused) {
            return true;
        }
    }

    public static final Object v(gmd gmdVar, b55 b55Var) {
        bo.U(gmdVar, true, new di3(gsa.g0(gmdVar.d.getContext()).Q(gmdVar.e, gmdVar, gmdVar.c)));
        return mo7.U(gmdVar, false, gmdVar, b55Var);
    }

    public static r28 w(r28 r28Var, float f2, m3c m3cVar, long j2, long j3, int i2) {
        if ((i2 & 2) != 0) {
            m3cVar = rv8.r;
        }
        m3c m3cVar2 = m3cVar;
        boolean z = false;
        if ((i2 & 4) != 0 && vj3.a(f2, 0.0f) > 0) {
            z = true;
        }
        boolean z2 = z;
        if ((i2 & 8) != 0) {
            j2 = sf5.a;
        }
        long j4 = j2;
        if ((i2 & 16) != 0) {
            j3 = sf5.a;
        }
        return (vj3.a(f2, 0.0f) > 0 || z2) ? r28Var.b(new j3c(f2, m3cVar2, z2, j4, j3)) : r28Var;
    }

    public static final double x(long j2) {
        return ((j2 >>> 11) * 2048.0d) + (j2 & 2047);
    }

    public static final String y(int i2, long j2) {
        if (j2 >= 0) {
            kyd.I(i2);
            String string = Long.toString(j2, i2);
            string.getClass();
            return string;
        }
        long j3 = i2;
        long j4 = ((j2 >>> 1) / j3) << 1;
        long j5 = j2 - (j4 * j3);
        if (j5 >= j3) {
            j5 -= j3;
            j4++;
        }
        kyd.I(i2);
        String string2 = Long.toString(j4, i2);
        string2.getClass();
        kyd.I(i2);
        String string3 = Long.toString(j5, i2);
        string3.getClass();
        return string2.concat(string3);
    }

    public static final Object z(long j2, b55 b55Var, n92 n92Var) {
        if (j2 > 0) {
            return v(new gmd(j2, n92Var), b55Var);
        }
        throw new TimeoutCancellationException("Timed out immediately", null);
    }

    public static final void q(String str) {
        str.getClass();
        throw new IllegalArgumentException(ev6.x("No valid saved state was found for the key '", str, peNPu.irm));
    }
}
