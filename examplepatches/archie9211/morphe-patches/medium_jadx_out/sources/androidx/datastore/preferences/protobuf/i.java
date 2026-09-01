package androidx.datastore.preferences.protobuf;

import defpackage.crb;
import defpackage.d21;
import defpackage.rd6;
import defpackage.u56;
import defpackage.u7a;
import defpackage.zg7;
import defpackage.zp1;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i {
    public static final Class a;
    public static final j b;
    public static final l c;

    static {
        Class<?> cls;
        Class<?> cls2;
        u7a u7aVar = u7a.c;
        j jVar = null;
        try {
            cls = Class.forName("androidx.datastore.preferences.protobuf.GeneratedMessage");
        } catch (Throwable unused) {
            cls = null;
        }
        a = cls;
        try {
            u7a u7aVar2 = u7a.c;
            try {
                cls2 = Class.forName("androidx.datastore.preferences.protobuf.UnknownFieldSetSchema");
            } catch (Throwable unused2) {
                cls2 = null;
            }
            if (cls2 != null) {
                jVar = (j) cls2.getConstructor(null).newInstance(null);
            }
        } catch (Throwable unused3) {
        }
        b = jVar;
        c = new l();
    }

    public static void A(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                long jLongValue = ((Long) list.get(i2)).longValue();
                zp1Var.E(i, (jLongValue >> 63) ^ (jLongValue << 1));
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            long jLongValue2 = ((Long) list.get(i3)).longValue();
            iJ += zp1.j((jLongValue2 >> 63) ^ (jLongValue2 << 1));
        }
        zp1Var.D(iJ);
        while (i2 < list.size()) {
            long jLongValue3 = ((Long) list.get(i2)).longValue();
            zp1Var.F((jLongValue3 >> 63) ^ (jLongValue3 << 1));
            i2++;
        }
    }

    public static void B(int i, List list, zg7 zg7Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zg7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            ((zp1) zg7Var.b).z(i, (String) list.get(i2));
        }
    }

    public static void C(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.C(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            i3 += zp1.i(((Integer) list.get(i4)).intValue());
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.D(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void D(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.E(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iJ += zp1.j(((Long) list.get(i3)).longValue());
        }
        zp1Var.D(iJ);
        while (i2 < list.size()) {
            zp1Var.F(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static int a(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iJ = 0;
        for (int i = 0; i < size; i++) {
            iJ += zp1.j(((Integer) list.get(i)).intValue());
        }
        return iJ;
    }

    public static int b(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (zp1.h(i) + 4) * size;
    }

    public static int c(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (zp1.h(i) + 8) * size;
    }

    public static int d(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iJ = 0;
        for (int i = 0; i < size; i++) {
            iJ += zp1.j(((Integer) list.get(i)).intValue());
        }
        return iJ;
    }

    public static int e(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iJ = 0;
        for (int i = 0; i < size; i++) {
            iJ += zp1.j(((Long) list.get(i)).longValue());
        }
        return iJ;
    }

    public static int f(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            int iIntValue = ((Integer) list.get(i2)).intValue();
            i += zp1.i((iIntValue >> 31) ^ (iIntValue << 1));
        }
        return i;
    }

    public static int g(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iJ = 0;
        for (int i = 0; i < size; i++) {
            long jLongValue = ((Long) list.get(i)).longValue();
            iJ += zp1.j((jLongValue >> 63) ^ (jLongValue << 1));
        }
        return iJ;
    }

    public static int h(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            i += zp1.i(((Integer) list.get(i2)).intValue());
        }
        return i;
    }

    public static int i(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iJ = 0;
        for (int i = 0; i < size; i++) {
            iJ += zp1.j(((Long) list.get(i)).longValue());
        }
        return iJ;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public static void k(j jVar, Object obj, Object obj2) {
        ((l) jVar).getClass();
        e eVar = (e) obj;
        k kVar = eVar.unknownFields;
        k kVar2 = ((e) obj2).unknownFields;
        k kVar3 = k.f;
        if (!kVar3.equals(kVar2)) {
            if (kVar3.equals(kVar)) {
                int i = kVar.a + kVar2.a;
                int[] iArrCopyOf = Arrays.copyOf(kVar.b, i);
                System.arraycopy(kVar2.b, 0, iArrCopyOf, kVar.a, kVar2.a);
                Object[] objArrCopyOf = Arrays.copyOf(kVar.c, i);
                System.arraycopy(kVar2.c, 0, objArrCopyOf, kVar.a, kVar2.a);
                kVar = new k(i, iArrCopyOf, objArrCopyOf, true);
            } else {
                kVar.getClass();
                if (!kVar2.equals(kVar3)) {
                    if (!kVar.e) {
                        rd6.b();
                        return;
                    }
                    int i2 = kVar.a + kVar2.a;
                    kVar.a(i2);
                    System.arraycopy(kVar2.b, 0, kVar.b, kVar.a, kVar2.a);
                    System.arraycopy(kVar2.c, 0, kVar.c, kVar.a, kVar2.a);
                    kVar.a = i2;
                }
            }
        }
        eVar.unknownFields = kVar;
    }

    public static boolean l(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void m(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.o(i, ((Boolean) list.get(i2)).booleanValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Boolean) list.get(i4)).getClass();
            i3++;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.m(((Boolean) list.get(i2)).booleanValue() ? (byte) 1 : (byte) 0);
            i2++;
        }
    }

    public static void n(int i, List list, zg7 zg7Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zg7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            ((zp1) zg7Var.b).p(i, (d21) list.get(i2));
        }
    }

    public static void o(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.t(i, Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Double) list.get(i4)).getClass();
            i3 += 8;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.u(Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
            i2++;
        }
    }

    public static void p(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.v(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iJ += zp1.j(((Integer) list.get(i3)).intValue());
        }
        zp1Var.D(iJ);
        while (i2 < list.size()) {
            zp1Var.w(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void q(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.r(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Integer) list.get(i4)).getClass();
            i3 += 4;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.s(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void r(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.t(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.u(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void s(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.r(i, Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Float) list.get(i4)).getClass();
            i3 += 4;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.s(Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
            i2++;
        }
    }

    public static void t(int i, List list, zg7 zg7Var, crb crbVar) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zg7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            zg7Var.u0(i, list.get(i2), crbVar);
        }
    }

    public static void u(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.v(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iJ += zp1.j(((Integer) list.get(i3)).intValue());
        }
        zp1Var.D(iJ);
        while (i2 < list.size()) {
            zp1Var.w(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void v(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.E(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iJ += zp1.j(((Long) list.get(i3)).longValue());
        }
        zp1Var.D(iJ);
        while (i2 < list.size()) {
            zp1Var.F(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void w(int i, List list, zg7 zg7Var, crb crbVar) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zg7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            ((zp1) zg7Var.b).y(i, (a) list.get(i2), crbVar);
        }
    }

    public static void x(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.r(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Integer) list.get(i4)).getClass();
            i3 += 4;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.s(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void y(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                zp1Var.t(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            zp1Var.u(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void z(int i, List list, zg7 zg7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zp1 zp1Var = (zp1) zg7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                int iIntValue = ((Integer) list.get(i2)).intValue();
                zp1Var.C(i, (iIntValue >> 31) ^ (iIntValue << 1));
                i2++;
            }
            return;
        }
        zp1Var.B(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            int iIntValue2 = ((Integer) list.get(i4)).intValue();
            i3 += zp1.i((iIntValue2 >> 31) ^ (iIntValue2 << 1));
        }
        zp1Var.D(i3);
        while (i2 < list.size()) {
            int iIntValue3 = ((Integer) list.get(i2)).intValue();
            zp1Var.D((iIntValue3 >> 31) ^ (iIntValue3 << 1));
            i2++;
        }
    }

    public static Object j(Object obj, int i, u56 u56Var, Object obj2, j jVar) {
        return obj2;
    }
}
