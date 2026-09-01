package defpackage;

import android.net.Uri;
import android.os.Bundle;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ho2 {
    public static Bundle A(String str) {
        str.getClass();
        return new Bundle();
    }

    public static Boolean B(String str, List list) {
        return Boolean.valueOf(g76.L(list, d46.Q(str)));
    }

    public static String C(int i, String str, String str2, String str3, String str4) {
        return str + str2 + str3 + i + str4;
    }

    public static String D(long j, String str) {
        return str + j;
    }

    public static String E(String str, b24 b24Var, String str2) {
        return str + b24Var + str2;
    }

    public static String F(String str, g8e g8eVar, String str2) {
        return str + g8eVar + str2;
    }

    public static String G(String str, Integer num, String str2) {
        return str + num + str2;
    }

    public static String H(StringBuilder sb, int i, String str) {
        sb.append(i);
        sb.append(str);
        return sb.toString();
    }

    public static StringBuilder I(long j, String str, String str2, String str3) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(j);
        return sb;
    }

    public static UnsupportedOperationException J(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        sourceParameter.getClass();
        return new UnsupportedOperationException(str2);
    }

    public static ArrayList K(Uri uri, List list) {
        List<String> pathSegments = uri.getPathSegments();
        pathSegments.getClass();
        if (list.size() != pathSegments.size()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        int i = 0;
        for (Object obj : list) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            arrayList.add(((x2b) obj).b(pathSegments.get(i)));
            i = i2;
        }
        ArrayList arrayListV0 = bu1.v0(arrayList);
        if (arrayListV0.size() != list.size()) {
            return null;
        }
        return arrayListV0;
    }

    public static NoWhenBranchMatchedException L(p65 p65Var, int i, boolean z) {
        p65Var.Y(i);
        p65Var.p(z);
        return new NoWhenBranchMatchedException();
    }

    public static void M(int i, HashMap map, String str, int i2, String str2) {
        map.put(str, Integer.valueOf(i));
        map.put(str2, Integer.valueOf(i2));
    }

    public static void N(p65 p65Var, boolean z, boolean z2, boolean z3, boolean z4) {
        p65Var.p(z);
        p65Var.p(z2);
        p65Var.p(z3);
        p65Var.p(z4);
    }

    public static void O(SourceParameter sourceParameter, String str, String str2) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
    }

    public static void P(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
    }

    public static void Q(String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
    }

    public static void R(StringBuilder sb, boolean z, String str, boolean z2, String str2) {
        sb.append(z);
        sb.append(str);
        sb.append(z2);
        sb.append(str2);
    }

    public static boolean S(Uri uri, int i, String str) {
        return g76.L(uri.getPathSegments().get(i), str);
    }

    public static q44 a(q44 q44Var, r44 r44Var) {
        r44Var.getClass();
        if (q44Var.getKey().equals(r44Var)) {
            return q44Var;
        }
        return null;
    }

    public static s44 b(q44 q44Var, r44 r44Var) {
        r44Var.getClass();
        return q44Var.getKey().equals(r44Var) ? by3.a : q44Var;
    }

    public static s44 c(s44 s44Var, s44 s44Var2) {
        s44Var2.getClass();
        return s44Var2 == by3.a ? s44Var : (s44) s44Var2.b(s44Var, new p44(0));
    }

    public static int d(m73 m73Var, float f) {
        float fZ = m73Var.Z(f);
        if (Float.isInfinite(fZ)) {
            return Integer.MAX_VALUE;
        }
        return Math.round(fZ);
    }

    public static long e(long j, m73 m73Var) {
        if (j != 9205357640488583168L) {
            return pwd.i(m73Var.Q(Float.intBitsToFloat((int) (j >> 32))), m73Var.Q(Float.intBitsToFloat((int) (j & 4294967295L))));
        }
        return 9205357640488583168L;
    }

    public static float f(long j, m73 m73Var) {
        if (!rkd.a(qkd.b(j), 4294967296L)) {
            d26.b("Only Sp can convert to Px");
        }
        return m73Var.Z(m73Var.z(j));
    }

    public static long g(long j, m73 m73Var) {
        if (j == 9205357640488583168L) {
            return 9205357640488583168L;
        }
        float fZ = m73Var.Z(yj3.b(j));
        float fZ2 = m73Var.Z(yj3.a(j));
        return (((long) Float.floatToRawIntBits(fZ)) << 32) | (((long) Float.floatToRawIntBits(fZ2)) & 4294967295L);
    }

    public static long h(long j, long j2) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32)) - Float.intBitsToFloat((int) (j2 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L)) - Float.intBitsToFloat((int) (j2 & 4294967295L));
        return (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L);
    }

    public static void i(md5 md5Var, float f, float f2, int i) {
        m50 m50Var = (m50) md5Var.b;
        if ((i & 4) != 0) {
            f = Float.intBitsToFloat((int) (m50Var.B() >> 32));
        }
        float f3 = f;
        if ((i & 8) != 0) {
            f2 = Float.intBitsToFloat((int) (m50Var.B() & 4294967295L));
        }
        m50Var.x().o(0.0f, 0.0f, f3, f2, 1);
    }

    public static void j(zl3 zl3Var, long j, float f, float f2, long j2, long j3, float f3, pxf pxfVar, int i) {
        zl3Var.O(j, f, f2, j2, j3, (i & 64) != 0 ? 1.0f : f3, pxfVar);
    }

    public static void k(zl3 zl3Var, long j, float f, long j2, pxf pxfVar, int i) {
        if ((i & 4) != 0) {
            j2 = zl3Var.k0();
        }
        long j3 = j2;
        if ((i & 16) != 0) {
            pxfVar = ph4.R;
        }
        zl3Var.u(j, f, j3, pxfVar);
    }

    public static void l(zl3 zl3Var, wp wpVar, long j, long j2, float f, bs0 bs0Var, int i, int i2) {
        zl3Var.g0(wpVar, 0L, j, (i2 & 16) != 0 ? j : j2, (i2 & 32) != 0 ? 1.0f : f, bs0Var, (i2 & 512) != 0 ? 1 : i);
    }

    public static void m(cq6 cq6Var, wp wpVar, bs0 bs0Var) {
        g61 g61Var = cq6Var.a;
        g61Var.a.c.a(wpVar, g61Var.c(null, ph4.R, 1.0f, bs0Var, 3, 1));
    }

    public static void n(zl3 zl3Var, long j, long j2, long j3, float f, int i, int i2) {
        zl3Var.E(j, j2, j3, (i2 & 8) != 0 ? 0.0f : f, (i2 & 16) != 0 ? 0 : i);
    }

    public static void o(zl3 zl3Var, br brVar, ez0 ez0Var, float f, uuc uucVar, int i) {
        if ((i & 4) != 0) {
            f = 1.0f;
        }
        float f2 = f;
        pxf pxfVar = uucVar;
        if ((i & 8) != 0) {
            pxfVar = ph4.R;
        }
        zl3Var.S(brVar, ez0Var, f2, pxfVar, (i & 32) != 0 ? 3 : 0);
    }

    public static void p(zl3 zl3Var, br brVar, long j, float f, uuc uucVar, int i) {
        if ((i & 4) != 0) {
            f = 1.0f;
        }
        float f2 = f;
        pxf pxfVar = uucVar;
        if ((i & 8) != 0) {
            pxfVar = ph4.R;
        }
        zl3Var.V(brVar, j, f2, pxfVar);
    }

    public static void q(cq6 cq6Var, ez0 ez0Var, long j, long j2, float f, pxf pxfVar, int i) {
        if ((i & 2) != 0) {
            j = 0;
        }
        long j3 = j;
        cq6Var.d(ez0Var, j3, (i & 4) != 0 ? h(cq6Var.f(), j3) : j2, (i & 8) != 0 ? 1.0f : f, (i & 16) != 0 ? ph4.R : pxfVar, (i & 64) != 0 ? 3 : 6);
    }

    public static void r(zl3 zl3Var, long j, long j2, long j3, float f, int i) {
        long j4 = (i & 2) != 0 ? 0L : j2;
        zl3Var.Y(j, j4, (i & 4) != 0 ? h(zl3Var.f(), j4) : j3, (i & 8) != 0 ? 1.0f : f, ph4.R, (i & 64) != 0 ? 3 : 0);
    }

    public static void s(zl3 zl3Var, ez0 ez0Var, long j, long j2, long j3, pxf pxfVar, int i) {
        if ((i & 2) != 0) {
            j = 0;
        }
        long j4 = j;
        zl3Var.o(ez0Var, j4, (i & 4) != 0 ? h(zl3Var.f(), j4) : j2, j3, 1.0f, (i & 32) != 0 ? ph4.R : pxfVar);
    }

    public static void t(zl3 zl3Var, long j, long j2, long j3, pxf pxfVar) {
        zl3Var.q(j, 0L, j2, j3, pxfVar);
    }

    public static int u(int i, int i2, int i3, int i4) {
        return aq1.j(i) + i2 + i3 + i4;
    }

    public static int v(String str, wjd wjdVar, e07 e07Var, kx kxVar) {
        return kxVar.g(new b07(str, wjdVar, e07Var));
    }

    public static kx w(p65 p65Var, int i) {
        p65Var.Y(i);
        return new kx();
    }

    public static r28 x(jp7 jp7Var, r28 r28Var, int i, float f) {
        jp7Var.getClass();
        return jfc.d(jfc.r(r28Var, i), f);
    }

    public static f8a y(ko2 ko2Var, int i) {
        return yi3.a(new jo2(ko2Var, i));
    }

    public static f8a z(ko2 ko2Var, zm2 zm2Var, ys2 ys2Var, int i) {
        return mec.a(new eo2(ko2Var, zm2Var, ys2Var, i, 1));
    }
}
