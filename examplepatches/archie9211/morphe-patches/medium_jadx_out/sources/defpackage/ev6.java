package defpackage;

import com.medium.proto.event.ListPresented;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ev6 {
    public static String A(StringBuilder sb, boolean z, char c) {
        sb.append(z);
        sb.append(c);
        return sb.toString();
    }

    public static StringBuilder B(int i, int i2, String str, String str2, String str3) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(i);
        sb.append(str2);
        sb.append(i2);
        sb.append(str3);
        return sb;
    }

    public static StringBuilder C(String str, int i, String str2) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(i);
        sb.append(str2);
        return sb;
    }

    public static StringBuilder D(String str, String str2, String str3, String str4, boolean z) {
        StringBuilder sb = new StringBuilder(str);
        sb.append(str2);
        sb.append(str3);
        sb.append(z);
        sb.append(str4);
        return sb;
    }

    public static ArrayList E(fd6 fd6Var) {
        fd6Var.n();
        return new ArrayList();
    }

    public static void F(long j, String str, StringBuilder sb) {
        sb.append((Object) uu1.h(j));
        sb.append(str);
    }

    public static void G(StringBuilder sb, mkd mkdVar, String str, mkd mkdVar2, String str2) {
        sb.append(mkdVar);
        sb.append(str);
        sb.append(mkdVar2);
        sb.append(str2);
    }

    public static qre H() {
        return new qre(0L);
    }

    public static qre I() {
        return new qre(0L);
    }

    public static void J(xu6 xu6Var, String str, mz1 mz1Var) {
        xp xpVar = xu6Var.r;
        j68 j68Var = xu6Var.s;
        if (j68Var == null) {
            j68Var = new j68();
            xu6Var.s = j68Var;
        }
        j68Var.a(xpVar.b);
        xu6Var.k0(str, null, new mz1(new id3(mz1Var, xpVar.b), true, -1588696110));
    }

    public static /* synthetic */ void K(yx2 yx2Var, String str, String str2, String str3, String str4, String str5, int i) {
        if ((i & 2) != 0) {
            str2 = null;
        }
        yx2Var.b(str, str2, null, str3, str4, (i & 32) != 0 ? null : str5);
    }

    public static void L(ax2 ax2Var, String str, String str2, String str3, String str4) {
        ax2Var.getClass();
        str.getClass();
        str2.getClass();
        str4.getClass();
        rqd.a(ax2Var.b, new ListPresented(null, str, false, null, 9, null), str2, str3, false, null, str4, 24);
    }

    public static int a(zk7 zk7Var, y66 y66Var, List list, int i) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            arrayList.add(new uz2((tk7) list.get(i3), z66.Max, d76.Height, i2));
        }
        return zk7Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList, h72.b(0, i, 0, 0, 13)).a();
    }

    public static int b(w48 w48Var, y66 y66Var, ArrayList arrayList, int i) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            List list = (List) arrayList.get(i3);
            ArrayList arrayList3 = new ArrayList(list.size());
            int size2 = list.size();
            for (int i4 = 0; i4 < size2; i4++) {
                arrayList3.add(new uz2((tk7) list.get(i4), z66.Max, d76.Height, i2));
            }
            arrayList2.add(arrayList3);
        }
        return w48Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList2, h72.b(0, i, 0, 0, 13)).a();
    }

    public static int c(zk7 zk7Var, y66 y66Var, List list, int i) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            arrayList.add(new uz2((tk7) list.get(i3), z66.Max, d76.Width, i2));
        }
        return zk7Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList, h72.b(0, 0, 0, i, 7)).b();
    }

    public static int d(w48 w48Var, y66 y66Var, ArrayList arrayList, int i) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            List list = (List) arrayList.get(i3);
            ArrayList arrayList3 = new ArrayList(list.size());
            int size2 = list.size();
            for (int i4 = 0; i4 < size2; i4++) {
                arrayList3.add(new uz2((tk7) list.get(i4), z66.Max, d76.Width, i2));
            }
            arrayList2.add(arrayList3);
        }
        return w48Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList2, h72.b(0, 0, 0, i, 7)).b();
    }

    public static int e(zk7 zk7Var, y66 y66Var, List list, int i) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            arrayList.add(new uz2((tk7) list.get(i3), z66.Min, d76.Height, i2));
        }
        return zk7Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList, h72.b(0, i, 0, 0, 13)).a();
    }

    public static int f(w48 w48Var, y66 y66Var, ArrayList arrayList, int i) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            List list = (List) arrayList.get(i3);
            ArrayList arrayList3 = new ArrayList(list.size());
            int size2 = list.size();
            for (int i4 = 0; i4 < size2; i4++) {
                arrayList3.add(new uz2((tk7) list.get(i4), z66.Min, d76.Height, i2));
            }
            arrayList2.add(arrayList3);
        }
        return w48Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList2, h72.b(0, i, 0, 0, 13)).a();
    }

    public static int g(zk7 zk7Var, y66 y66Var, List list, int i) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            arrayList.add(new uz2((tk7) list.get(i3), z66.Min, d76.Width, i2));
        }
        return zk7Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList, h72.b(0, 0, 0, i, 7)).b();
    }

    public static int h(w48 w48Var, y66 y66Var, ArrayList arrayList, int i) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            List list = (List) arrayList.get(i3);
            ArrayList arrayList3 = new ArrayList(list.size());
            int size2 = list.size();
            for (int i4 = 0; i4 < size2; i4++) {
                arrayList3.add(new uz2((tk7) list.get(i4), z66.Min, d76.Width, i2));
            }
            arrayList2.add(arrayList3);
        }
        return w48Var.b(new m76(y66Var, y66Var.getLayoutDirection()), arrayList2, h72.b(0, 0, 0, i, 7)).b();
    }

    public static r28 i(r28 r28Var, r28 r28Var2) {
        return r28Var2 == o28.b ? r28Var : new gw1(r28Var, r28Var2);
    }

    public static /* synthetic */ void j(xu6 xu6Var, String str, c55 c55Var, int i) {
        if ((i & 1) != 0) {
            str = null;
        }
        xu6Var.k0(str, null, c55Var);
    }

    public static void k(zv6 zv6Var, String str, mz1 mz1Var) {
        zv6Var.r.e(1, new yv6(new wu6(1, str), new vx5(13), null, new mz1(new zq(3, mz1Var), true, 1062451479)));
    }

    public static /* synthetic */ void l(xu6 xu6Var, int i, x45 x45Var, d55 d55Var, int i2) {
        if ((i2 & 2) != 0) {
            x45Var = null;
        }
        xu6Var.l0(i, x45Var, h06.r, d55Var);
    }

    public static int m(int i, int i2, int i3) {
        return aq1.h(i) + i2 + i3;
    }

    public static /* synthetic */ int n(long j) {
        return (int) (j ^ (j >>> 32));
    }

    public static int o(SourceParameter sourceParameter, int i, int i2) {
        return (sourceParameter.hashCode() + i) * i2;
    }

    public static rya p(Object obj) {
        br7.v(obj);
        return new rya();
    }

    public static ClassCastException q(Iterator it2) {
        it2.next().getClass();
        return new ClassCastException();
    }

    public static String r(char c, String str, String str2) {
        return str + c + str2;
    }

    public static String s(int i, int i2, String str, String str2, String str3) {
        return str + i + str2 + i2 + str3;
    }

    public static String t(long j, String str, StringBuilder sb) {
        sb.append(j);
        sb.append(str);
        return sb.toString();
    }

    public static String u(String str, int i, char c) {
        return str + i + c;
    }

    public static String v(String str, int i, int i2, String str2) {
        return str + i + str2 + i2;
    }

    public static String w(String str, int i, String str2) {
        return str + i + str2;
    }

    public static String x(String str, String str2, String str3) {
        return str + str2 + str3;
    }

    public static String y(String str, String str2, String str3, String str4, String str5) {
        return str + str2 + str3 + str4 + str5;
    }

    public static String z(StringBuilder sb, String str, char c) {
        sb.append(str);
        sb.append(c);
        return sb.toString();
    }
}
