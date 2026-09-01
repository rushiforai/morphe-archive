package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.type.PageInfoV2;
import com.medium.android.graphql.type.Paging;
import com.medium.android.graphql.type.Post;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class km4 {
    public static String A(StringBuilder sb, int i, char c) {
        sb.append(i);
        sb.append(c);
        return sb.toString();
    }

    public static String B(StringBuilder sb, zv8 zv8Var, String str) {
        sb.append(zv8Var);
        sb.append(str);
        return sb.toString();
    }

    public static String C(StringBuilder sb, String str, String str2, String str3, String str4) {
        sb.append(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(str4);
        return sb.toString();
    }

    public static StringBuilder D(String str, EntityType entityType, String str2, String str3, String str4) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(entityType);
        sb.append(str4);
        return sb;
    }

    public static StringBuilder E(String str, boolean z, String str2, long j) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(z);
        sb.append(str2);
        sb.append(j);
        return sb;
    }

    public static void F(float f, int i, p65 p65Var, p65 p65Var2, o28 o28Var) {
        p65Var.Y(i);
        hp7.t(p65Var2, jfc.l(o28Var, f));
    }

    public static void G(int i, int i2, int i3, int i4, int i5) {
        rv8.m(i);
        rv8.m(i2);
        rv8.m(i3);
        rv8.m(i4);
        rv8.m(i5);
    }

    public static void H(int i, mz1 mz1Var, p65 p65Var, boolean z) {
        mz1Var.invoke(p65Var, Integer.valueOf(i));
        p65Var.p(z);
    }

    public static void I(uld uldVar, Throwable th, String str, Object[] objArr, String str2) {
        uldVar.b(th, str, objArr);
        ak4.a().b(str2);
    }

    public static fu6 J(md5 md5Var, int i) {
        kv6 kv6Var = (kv6) md5Var.b;
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            cv6 cv6Var = (cv6) kv6Var.f.getValue();
            vn7.T(oicVarA, oicVarG, x45VarE);
            return kv6Var.q.a(i, cv6Var.j, kv6Var.d, new vx5(i, cv6Var));
        } catch (Throwable th) {
            vn7.T(oicVarA, oicVarG, x45VarE);
            throw th;
        }
    }

    public static /* synthetic */ Object K(pz2 pz2Var, String str, String str2, String str3, gm1 gm1Var, p4d p4dVar, int i) {
        if ((i & 1) != 0) {
            str = null;
        }
        if ((i & 2) != 0) {
            str2 = null;
        }
        if ((i & 4) != 0) {
            str3 = null;
        }
        if ((i & 8) != 0) {
            gm1Var = null;
        }
        return pz2Var.b(str, str2, str3, gm1Var, p4dVar);
    }

    public static int a(qp6 qp6Var, fb7 fb7Var, tk7 tk7Var, int i) {
        return qp6Var.c(new m76(fb7Var, fb7Var.getLayoutDirection()), new uz2(tk7Var, jl7.Max, kl7.Height, 1), h72.b(0, i, 0, 0, 13)).a();
    }

    public static int b(sp6 sp6Var, y66 y66Var, tk7 tk7Var, int i) {
        return sp6Var.c(new m76(y66Var, y66Var.getLayoutDirection()), new uz2(tk7Var, hh8.Max, ih8.Height, 2), h72.b(0, i, 0, 0, 13)).a();
    }

    public static int c(qp6 qp6Var, fb7 fb7Var, tk7 tk7Var, int i) {
        return qp6Var.c(new m76(fb7Var, fb7Var.getLayoutDirection()), new uz2(tk7Var, jl7.Max, kl7.Width, 1), h72.b(0, 0, 0, i, 7)).b();
    }

    public static int d(sp6 sp6Var, y66 y66Var, tk7 tk7Var, int i) {
        return sp6Var.c(new m76(y66Var, y66Var.getLayoutDirection()), new uz2(tk7Var, hh8.Max, ih8.Width, 2), h72.b(0, 0, 0, i, 7)).b();
    }

    public static int e(qp6 qp6Var, fb7 fb7Var, tk7 tk7Var, int i) {
        return qp6Var.c(new m76(fb7Var, fb7Var.getLayoutDirection()), new uz2(tk7Var, jl7.Min, kl7.Height, 1), h72.b(0, i, 0, 0, 13)).a();
    }

    public static int f(sp6 sp6Var, y66 y66Var, tk7 tk7Var, int i) {
        return sp6Var.c(new m76(y66Var, y66Var.getLayoutDirection()), new uz2(tk7Var, hh8.Min, ih8.Height, 2), h72.b(0, i, 0, 0, 13)).a();
    }

    public static int g(qp6 qp6Var, fb7 fb7Var, tk7 tk7Var, int i) {
        return qp6Var.c(new m76(fb7Var, fb7Var.getLayoutDirection()), new uz2(tk7Var, jl7.Min, kl7.Width, 1), h72.b(0, 0, 0, i, 7)).b();
    }

    public static int h(sp6 sp6Var, y66 y66Var, tk7 tk7Var, int i) {
        return sp6Var.c(new m76(y66Var, y66Var.getLayoutDirection()), new uz2(tk7Var, hh8.Min, ih8.Width, 2), h72.b(0, 0, 0, i, 7)).b();
    }

    public static float i(long j, m73 m73Var) {
        float fC;
        float fU;
        if (!rkd.a(qkd.b(j), 4294967296L)) {
            d26.b("Only Sp can convert to Px");
        }
        float[] fArr = xz4.a;
        if (m73Var.U() >= 1.03f) {
            wz4 wz4VarA = xz4.a(m73Var.U());
            fC = qkd.c(j);
            if (wz4VarA != null) {
                return wz4VarA.b(fC);
            }
            fU = m73Var.U();
        } else {
            fC = qkd.c(j);
            fU = m73Var.U();
        }
        return fU * fC;
    }

    public static long j(m73 m73Var, float f) {
        float[] fArr = xz4.a;
        if (m73Var.U() < 1.03f) {
            return en7.M(f / m73Var.U(), 4294967296L);
        }
        wz4 wz4VarA = xz4.a(m73Var.U());
        return en7.M(wz4VarA != null ? wz4VarA.a(f) : f / m73Var.U(), 4294967296L);
    }

    public static r28 k(xr6 xr6Var) {
        wlc wlcVarP = f76.P(0.0f, 400.0f, null, 5);
        Map map = qwe.a;
        wlc wlcVarP2 = f76.P(0.0f, 400.0f, new k46(4294967297L), 1);
        wlc wlcVarP3 = f76.P(0.0f, 400.0f, null, 5);
        xr6Var.getClass();
        return new zs6(wlcVarP, wlcVarP2, wlcVarP3);
    }

    public static void m(lr4 lr4Var) {
        ((or4) lr4Var).b(8, false, true);
    }

    public static /* synthetic */ bo4 n(f65 f65Var, ib2 ib2Var, int i, nz0 nz0Var, int i2) {
        if ((i2 & 1) != 0) {
            ib2Var = zx3.a;
        }
        if ((i2 & 2) != 0) {
            i = -3;
        }
        if ((i2 & 4) != 0) {
            nz0Var = nz0.SUSPEND;
        }
        return f65Var.c(ib2Var, i, nz0Var);
    }

    public static void o(q52 q52Var, v52 v52Var, float f, int i) {
        if ((i & 2) != 0) {
            f = 0.0f;
        }
        q52Var.a(v52Var, f, 0.0f);
    }

    public static int p(float f, int i, int i2) {
        return (Float.floatToIntBits(f) + i) * i2;
    }

    public static int q(tk7 tk7Var, long j, ArrayList arrayList, int i, int i2) {
        arrayList.add(tk7Var.s(j));
        return i + i2;
    }

    public static rx1 r(PageInfoV2.Companion companion) {
        companion.getClass();
        return kyd.b(PageInfoV2.type);
    }

    public static rx1 s(Post.Companion companion) {
        companion.getClass();
        return kyd.b(Post.type);
    }

    public static xi6 t(Class cls, String str, String str2, int i, s1b s1bVar) {
        return s1bVar.g(new u4a(cls, str, str2, i));
    }

    public static r28 u(float f, r28 r28Var, boolean z) {
        return r28Var.b(new sq6(f, z));
    }

    public static sm8 v(Paging.Companion companion) {
        companion.getClass();
        sm8 sm8Var = Paging.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static String w(p65 p65Var, int i, int i2, p65 p65Var2, boolean z) {
        p65Var.Y(i);
        String strR = vo7.R(p65Var2, i2);
        p65Var.p(z);
        return strR;
    }

    public static String x(String str, j15 j15Var, String str2) {
        return str + j15Var + str2;
    }

    public static String y(String str, String str2) {
        return str + str2;
    }

    public static String z(String str, String str2, String str3, String str4, boolean z) {
        return str + str2 + str3 + z + str4;
    }
}
