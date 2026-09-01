package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f7d {
    static {
        en7.B(20);
    }

    public static final void a(boolean z, m45 m45Var, r28 r28Var, boolean z2, long j, long j2, mz1 mz1Var, x12 x12Var, int i) {
        r28 r28Var2;
        boolean z3;
        long j3;
        long j4;
        int i2;
        r28 r28Var3;
        long j5;
        long j6;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1847932236);
        int i3 = i | (p65Var.g(z) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 617856;
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                sn3 sn3Var = d82.a;
                long j7 = ((uu1) p65Var.j(sn3Var)).a;
                long j8 = ((uu1) p65Var.j(sn3Var)).a;
                long jB = uu1.b((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j8)) < 0.5d : ((double) op8.f0(j8)) > 0.5d) ? 0.6f : 0.74f, j7);
                i2 = i3 & (-4128769);
                r28Var3 = o28.b;
                j5 = j7;
                j6 = jB;
                z3 = true;
            } else {
                p65Var.S();
                i2 = i3 & (-4128769);
                r28Var3 = r28Var;
                z3 = z2;
                j5 = j;
                j6 = j2;
            }
            p65Var.q();
            r28 r28Var4 = r28Var3;
            int i4 = 3072 | ((i2 << 6) & 896);
            long j9 = j5;
            long j10 = j6;
            b(j9, j10, z, pxf.E(-652402312, new ss4(r28Var4, z, rkb.a(2, j5, true), z3, m45Var, mz1Var), p65Var), p65Var, i4);
            j3 = j9;
            j4 = j10;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            z3 = z2;
            j3 = j;
            j4 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b7d(z, m45Var, r28Var2, z3, j3, j4, mz1Var, i, 1);
        }
    }

    public static final void b(long j, long j2, boolean z, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        long j3;
        int i3;
        boolean z2;
        cud cudVarQ;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1841653376);
        if ((i & 6) == 0) {
            i2 = (p65Var.e(j) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            j3 = j2;
            i2 |= p65Var.e(j3) ? 32 : 16;
        } else {
            j3 = j2;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(z) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            int i4 = i2 >> 6;
            dsd dsdVarT0 = k40.T0(Boolean.valueOf(z), null, p65Var, i4 & 14, 2);
            k49 k49Var = dsdVarT0.d;
            boolean zBooleanValue = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(90393475);
            long j4 = zBooleanValue ? j : j3;
            p65Var.p(false);
            jv1 jv1VarE = uu1.e(j4);
            boolean zF = p65Var.f(jv1VarE);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                hud hudVar = new hud(fn.s, new ce(9, jv1VarE));
                p65Var.j0(hudVar);
                objM = hudVar;
            }
            hud hudVar2 = (hud) objM;
            boolean zBooleanValue2 = ((Boolean) dsdVarT0.a.o0()).booleanValue();
            p65Var.Y(90393475);
            long j5 = zBooleanValue2 ? j : j3;
            p65Var.p(false);
            uu1 uu1Var = new uu1(j5);
            boolean zBooleanValue3 = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(90393475);
            long j6 = zBooleanValue3 ? j : j3;
            p65Var.p(false);
            uu1 uu1Var2 = new uu1(j6);
            zrd zrdVarF = dsdVarT0.f();
            p65Var.Y(297582231);
            if (zrdVarF.b(Boolean.FALSE, Boolean.TRUE)) {
                i3 = i4;
                cudVarQ = new cud(150, 100, ao3.d);
                z2 = false;
            } else {
                i3 = i4;
                z2 = false;
                cudVarQ = f76.Q(100, 0, ao3.d, 2);
            }
            p65Var.p(z2);
            bsd bsdVarW = k40.W(dsdVarT0, uu1Var, uu1Var2, cudVarQ, hudVar2, p65Var, 0);
            o10 o10VarQ = b09.q(uu1.b(1.0f, ((uu1) bsdVarW.j.getValue()).a), d82.a);
            o10 o10VarA = w72.a.a(Float.valueOf(uu1.c(((uu1) bsdVarW.j.getValue()).a)));
            o10[] o10VarArr = new o10[2];
            o10VarArr[z2 ? 1 : 0] = o10VarQ;
            o10VarArr[1] = o10VarA;
            k40.d(o10VarArr, mz1Var, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c7d(j, j3, z, mz1Var, i, 1);
        }
    }
}
