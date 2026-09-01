package defpackage;

import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.type.Mutation;
import com.medium.android.graphql.type.Query;
import com.squareup.wire.internal.Internal;
import java.util.ArrayList;
import java.util.HashMap;
import kotlin.KotlinNothingValueException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class lv8 implements r41 {
    public static void A(String str, Boolean bool, ArrayList arrayList) {
        arrayList.add(str + bool);
    }

    public static void B(String str, Integer num, ArrayList arrayList) {
        arrayList.add(str + num);
    }

    public static void C(String str, String str2, TagData tagData) {
        str.getClass();
        str2.getClass();
        tagData.getClass();
    }

    public static void D(String str, String str2, ArrayList arrayList) {
        arrayList.add(str2.concat(Internal.sanitize(str)));
    }

    public static boolean a(nw nwVar, long j) {
        return j >= nwVar.c();
    }

    public static void b(ol olVar, float f) {
        tl tlVar = olVar.a;
        ((g49) tlVar.k).h(f);
        ((g49) tlVar.l).h(0.0f);
    }

    public static float e(float f, float f2, float f3, float f4) {
        return ((f - f2) * f3) + f4;
    }

    public static int f(int i, int i2, int i3, int i4) {
        return ((i + i2) - i3) + i4;
    }

    public static int g(int i, int i2, long j) {
        return (ev6.n(j) + i) * i2;
    }

    public static int h(zv8 zv8Var, int i, int i2) {
        return (zv8Var.hashCode() + i) * i2;
    }

    public static int i(StringBuilder sb, jx jxVar, ArrayList arrayList, int i, int i2) {
        arrayList.add(jxVar.a(sb.length()));
        return i + i2;
    }

    public static mx1 j(Query.Companion companion) {
        companion.getClass();
        mx1 mx1Var = Query.__user_id;
        mx1Var.getClass();
        return mx1Var;
    }

    public static l78 k(float f, vpc vpcVar, p65 p65Var, int i) {
        return guc.x(vpcVar, new vj3(f), p65Var, i);
    }

    public static sm8 l(Mutation.Companion companion) {
        companion.getClass();
        sm8 sm8Var = Mutation.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static sm8 m(Query.Companion companion) {
        companion.getClass();
        sm8 sm8Var = Query.type;
        sm8Var.getClass();
        return sm8Var;
    }

    public static Object n(o28 o28Var, float f, p65 p65Var, sn3 sn3Var) {
        hp7.t(p65Var, jfc.l(o28Var, f));
        return p65Var.j(sn3Var);
    }

    public static String o(fd6 fd6Var, yl2 yl2Var) {
        fd6Var.getClass();
        yl2Var.getClass();
        String strQ = fd6Var.q();
        strQ.getClass();
        return strQ;
    }

    public static String p(String str, md9 md9Var, String str2) {
        return str + md9Var + str2;
    }

    public static String q(String str, String str2, String str3, PagingParamsData pagingParamsData, String str4) {
        return str + str2 + str3 + pagingParamsData + str4;
    }

    public static String r(String str, String str2, String str3, String str4) {
        return str + str2 + str3 + str4;
    }

    public static String s(StringBuilder sb, float f, char c) {
        sb.append(f);
        sb.append(c);
        return sb.toString();
    }

    public static String t(StringBuilder sb, boolean z, String str) {
        sb.append(z);
        sb.append(str);
        return sb.toString();
    }

    public static StringBuilder u(String str, String str2, String str3) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        return sb;
    }

    public static KotlinNothingValueException v(String str) {
        b26.c(str);
        return new KotlinNothingValueException();
    }

    public static void w(int i, p65 p65Var, int i2, cu cuVar) {
        p65Var.j0(Integer.valueOf(i));
        p65Var.b(cuVar, Integer.valueOf(i2));
    }

    public static void x(int i, HashMap map, String str, int i2, String str2) {
        map.put(Integer.valueOf(i), str);
        map.put(Integer.valueOf(i2), str2);
    }

    public static void y(o28 o28Var, float f, p65 p65Var, boolean z) {
        hp7.t(p65Var, jfc.l(o28Var, f));
        p65Var.p(z);
    }

    public static /* synthetic */ void z(Object obj) {
        if (obj == null) {
            return;
        }
        rd6.m();
    }
}
