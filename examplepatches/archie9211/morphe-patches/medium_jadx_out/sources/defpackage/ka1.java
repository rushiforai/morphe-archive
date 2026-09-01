package defpackage;

import com.medium.android.graphql.type.Collection;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.Long;
import com.medium.android.graphql.type.Post;
import com.medium.android.graphql.type.User;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class ka1 {
    public static void A(h52 h52Var, vj3 vj3Var, String str) {
        h52Var.f(new ze3(vj3Var, str));
    }

    public static void B(p65 p65Var, boolean z, o28 o28Var, float f, p65 p65Var2) {
        p65Var.p(z);
        hp7.t(p65Var2, jfc.l(o28Var, f));
    }

    public static void C(StringBuilder sb, String str, String str2, String str3, String str4) {
        sb.append(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(str4);
    }

    public static void D(StringBuilder sb, String str, String str2, boolean z, String str3) {
        sb.append(str);
        sb.append(str2);
        sb.append(z);
        sb.append(str3);
    }

    public static int a(bo4 bo4Var, int i, int i2) {
        return (bo4Var.hashCode() + i) * i2;
    }

    public static int b(az5 az5Var, int i, int i2) {
        return (az5Var.hashCode() + i) * i2;
    }

    public static mx c(String str, int i, kx kxVar, skc skcVar, int i2) {
        kxVar.b(skcVar, i2, str.length() + i);
        return kxVar.i();
    }

    public static tx1 d(mx1 mx1Var, String str) {
        mx1Var.getClass();
        return new tx1(str);
    }

    public static zl2 e(GraphQLBoolean.Companion companion) {
        companion.getClass();
        zl2 zl2Var = GraphQLBoolean.type;
        zl2Var.getClass();
        return zl2Var;
    }

    public static zl2 f(Long.Companion companion) {
        companion.getClass();
        zl2 zl2Var = Long.type;
        zl2Var.getClass();
        return zl2Var;
    }

    public static sr4 g(p65 p65Var) {
        sr4 sr4Var = new sr4();
        p65Var.j0(sr4Var);
        return sr4Var;
    }

    public static ai6 h(Class cls, String str, String str2, int i, s1b s1bVar) {
        return s1bVar.e(new c78(cls, str, str2, i));
    }

    public static r28 i(yq0 yq0Var, r28 r28Var) {
        return r28Var.b(new dr5(yq0Var));
    }

    public static r28 j(jp7 jp7Var, o28 o28Var, int i, float f) {
        jp7Var.getClass();
        return jfc.d(jfc.r(o28Var, i), f);
    }

    public static m68 k(p65 p65Var) {
        m68 m68Var = new m68();
        p65Var.j0(m68Var);
        return m68Var;
    }

    public static sm8 l(Collection.Companion companion) {
        companion.getClass();
        sm8 sm8Var = Collection.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static sm8 m(Post.Companion companion) {
        companion.getClass();
        sm8 sm8Var = Post.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static sm8 n(User.Companion companion) {
        companion.getClass();
        sm8 sm8Var = User.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static f8a o(ko2 ko2Var, xm2 xm2Var, fo2 fo2Var, int i) {
        return mec.a(new eo2(ko2Var, xm2Var, fo2Var, i, 0));
    }

    public static String p(s1b s1bVar, Class cls, StringBuilder sb) {
        sb.append(s1bVar.b(cls));
        return sb.toString();
    }

    public static String q(String str, Object obj) {
        return str + obj;
    }

    public static String r(String str, String str2) {
        return str + str2;
    }

    public static String s(String str, String str2, String str3, String str4, List list) {
        return str + str2 + str3 + list + str4;
    }

    public static String t(String str, String str2, List list) {
        return str + list + str2;
    }

    public static String u(String str, StringBuilder sb) {
        return str + ((Object) sb);
    }

    public static String v(StringBuilder sb, String str, String str2) {
        sb.append(str);
        sb.append(str2);
        return sb.toString();
    }

    public static StringBuilder w(String str, zv8 zv8Var, String str2, zv8 zv8Var2, String str3) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(zv8Var);
        sb.append(str2);
        sb.append(zv8Var2);
        sb.append(str3);
        return sb;
    }

    public static StringBuilder x(String str, List list, String str2, boolean z, String str3) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(list);
        sb.append(str2);
        sb.append(z);
        sb.append(str3);
        return sb;
    }

    public static List y(mx1 mx1Var, yv8 yv8Var) {
        return d46.Q(new lx1(mx1Var, yv8Var));
    }

    public static void z(int i, p65 p65Var, cu cuVar, p65 p65Var2, fn fnVar) {
        tp7.B(p65Var, cuVar, Integer.valueOf(i));
        tp7.y(p65Var2, fnVar);
    }
}
