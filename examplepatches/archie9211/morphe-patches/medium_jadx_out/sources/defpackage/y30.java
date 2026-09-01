package defpackage;

import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.type.GraphQLBoolean;
import com.medium.android.graphql.type.GraphQLID;
import com.medium.android.graphql.type.GraphQLInt;
import com.medium.android.graphql.type.GraphQLString;
import com.medium.android.graphql.type.User;
import com.medium.proto.event.AnalyticsEventCommonFields;
import gen.model.SourceParameter;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class y30 {
    public static void A(String str, Long l, ArrayList arrayList) {
        arrayList.add(str + l);
    }

    public static void B(String str, String str2, PostPreviewData postPreviewData) {
        str.getClass();
        str2.getClass();
        postPreviewData.getClass();
    }

    public static /* synthetic */ boolean C(Object obj) {
        return obj != null;
    }

    public static void a(vg0 vg0Var, anb anbVar) {
        anbVar.getClass();
        if (anbVar instanceof t2d) {
            vg0Var.b(((t2d) anbVar).a);
        }
    }

    public static ox1 c(List list, String str, List list2, List list3) {
        list.getClass();
        return new ox1(str, list2, list3);
    }

    public static rx1 d(GraphQLBoolean.Companion companion) {
        companion.getClass();
        return kyd.b(GraphQLBoolean.type);
    }

    public static rx1 e(GraphQLID.Companion companion) {
        companion.getClass();
        return kyd.b(GraphQLID.type);
    }

    public static rx1 f(GraphQLString.Companion companion) {
        companion.getClass();
        return kyd.b(GraphQLString.type);
    }

    public static rx1 g(User.Companion companion) {
        companion.getClass();
        return kyd.b(User.type);
    }

    public static zl2 h(GraphQLInt.Companion companion) {
        companion.getClass();
        zl2 zl2Var = GraphQLInt.type;
        zl2Var.getClass();
        return zl2Var;
    }

    public static zl2 i(GraphQLString.Companion companion) {
        companion.getClass();
        zl2 zl2Var = GraphQLString.type;
        zl2Var.getClass();
        return zl2Var;
    }

    public static nhc j(p65 p65Var) {
        nhc nhcVar = new nhc();
        p65Var.j0(nhcVar);
        return nhcVar;
    }

    public static ClassCastException k(Object obj) {
        obj.getClass();
        return new ClassCastException();
    }

    public static IllegalStateException l(fd6 fd6Var, yl2 yl2Var, String str) {
        fd6Var.getClass();
        yl2Var.getClass();
        return new IllegalStateException(str);
    }

    public static Object m(int i, ArrayList arrayList) {
        return arrayList.get(arrayList.size() - i);
    }

    public static String n(float f, int i, p65 p65Var, p65 p65Var2, o28 o28Var) {
        hp7.t(p65Var, jfc.l(o28Var, f));
        return vo7.R(p65Var2, i);
    }

    public static String o(String str, vl4 vl4Var, String str2) {
        return str + vl4Var + str2;
    }

    public static String p(String str, String str2, Throwable th) {
        return str + th + str2;
    }

    public static String q(StringBuilder sb, PostPreviewData postPreviewData, String str) {
        sb.append(postPreviewData);
        sb.append(str);
        return sb.toString();
    }

    public static String r(StringBuilder sb, SourceParameter sourceParameter, String str) {
        sb.append(sourceParameter);
        sb.append(str);
        return sb.toString();
    }

    public static String s(StringBuilder sb, String str, String str2, String str3) {
        sb.append(str);
        sb.append(str2);
        sb.append(str3);
        return sb.toString();
    }

    public static StringBuilder t(int i, String str, String str2, String str3, String str4) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(i);
        sb.append(str4);
        return sb;
    }

    public static StringBuilder u(String str, String str2, String str3, String str4, String str5) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(str4);
        sb.append(str5);
        return sb;
    }

    public static HashMap v(Class cls, u90 u90Var) {
        HashMap map = new HashMap();
        map.put(cls, u90Var);
        return map;
    }

    public static Map w(HashMap map) {
        return DesugarCollections.unmodifiableMap(new HashMap(map));
    }

    public static void x(m50 m50Var, long j) {
        m50Var.x().q();
        m50Var.Q(j);
    }

    public static void y(o28 o28Var, float f, float f2, p65 p65Var) {
        hp7.t(p65Var, jfc.e(jfc.d(o28Var, f), f2));
    }

    public static void z(String str, AnalyticsEventCommonFields analyticsEventCommonFields, ArrayList arrayList) {
        arrayList.add(str + analyticsEventCommonFields);
    }
}
