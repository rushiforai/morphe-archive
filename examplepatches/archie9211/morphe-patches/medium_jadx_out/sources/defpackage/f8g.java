package defpackage;

import com.google.android.gms.internal.play_billing.zzfm;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f8g {
    public static final e9g a;

    static {
        int i = g3g.a;
        a = new e9g();
    }

    public static void a(int i, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    int iIntValue = ((Integer) list.get(i2)).intValue();
                    c4gVar.l(i, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int iP = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                int iIntValue2 = ((Integer) list.get(i3)).intValue();
                iP += c4g.p((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
            }
            c4gVar.m(iP);
            while (i2 < list.size()) {
                int iIntValue3 = ((Integer) list.get(i2)).intValue();
                c4gVar.m((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                int iE = j5gVar.e(i2);
                c4gVar.l(i, (iE >> 31) ^ (iE + iE));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iP2 = 0;
        for (int i4 = 0; i4 < j5gVar.c; i4++) {
            int iE2 = j5gVar.e(i4);
            iP2 += c4g.p((iE2 >> 31) ^ (iE2 + iE2));
        }
        c4gVar.m(iP2);
        while (i2 < j5gVar.c) {
            int iE3 = j5gVar.e(i2);
            c4gVar.m((iE3 >> 31) ^ (iE3 + iE3));
            i2++;
        }
    }

    public static void b(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                long jLongValue = ((Long) list.get(i2)).longValue();
                c4gVar.n(i, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iQ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            long jLongValue2 = ((Long) list.get(i3)).longValue();
            iQ += c4g.q((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
        }
        c4gVar.m(iQ);
        while (i2 < list.size()) {
            long jLongValue3 = ((Long) list.get(i2)).longValue();
            c4gVar.o((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
            i2++;
        }
    }

    public static void c(int i, List list, ujf ujfVar, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    c4gVar.l(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int iP = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iP += c4g.p(((Integer) list.get(i3)).intValue());
            }
            c4gVar.m(iP);
            while (i2 < list.size()) {
                c4gVar.m(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                c4gVar.l(i, j5gVar.e(i2));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iP2 = 0;
        for (int i4 = 0; i4 < j5gVar.c; i4++) {
            iP2 += c4g.p(j5gVar.e(i4));
        }
        c4gVar.m(iP2);
        while (i2 < j5gVar.c) {
            c4gVar.m(j5gVar.e(i2));
            i2++;
        }
    }

    public static void d(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.n(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iQ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iQ += c4g.q(((Long) list.get(i3)).longValue());
        }
        c4gVar.m(iQ);
        while (i2 < list.size()) {
            c4gVar.o(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static boolean e(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static int f(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof j5g)) {
            int iQ = 0;
            while (i < size) {
                iQ += c4g.q(((Integer) list.get(i)).intValue());
                i++;
            }
            return iQ;
        }
        j5g j5gVar = (j5g) list;
        int iQ2 = 0;
        while (i < size) {
            iQ2 += c4g.q(j5gVar.e(i));
            i++;
        }
        return iQ2;
    }

    public static int g(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (c4g.p(i << 3) + 4) * size;
    }

    public static int h(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (c4g.p(i << 3) + 8) * size;
    }

    public static int i(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof j5g)) {
            int iQ = 0;
            while (i < size) {
                iQ += c4g.q(((Integer) list.get(i)).intValue());
                i++;
            }
            return iQ;
        }
        j5g j5gVar = (j5g) list;
        int iQ2 = 0;
        while (i < size) {
            iQ2 += c4g.q(j5gVar.e(i));
            i++;
        }
        return iQ2;
    }

    public static int j(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iQ = 0;
        for (int i = 0; i < size; i++) {
            iQ += c4g.q(((Long) list.get(i)).longValue());
        }
        return iQ;
    }

    public static int k(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof j5g)) {
            int iP = 0;
            while (i < size) {
                int iIntValue = ((Integer) list.get(i)).intValue();
                iP += c4g.p((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i++;
            }
            return iP;
        }
        j5g j5gVar = (j5g) list;
        int iP2 = 0;
        while (i < size) {
            int iE = j5gVar.e(i);
            iP2 += c4g.p((iE >> 31) ^ (iE + iE));
            i++;
        }
        return iP2;
    }

    public static int l(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iQ = 0;
        for (int i = 0; i < size; i++) {
            long jLongValue = ((Long) list.get(i)).longValue();
            iQ += c4g.q((jLongValue >> 63) ^ (jLongValue + jLongValue));
        }
        return iQ;
    }

    public static int m(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof j5g)) {
            int iP = 0;
            while (i < size) {
                iP += c4g.p(((Integer) list.get(i)).intValue());
                i++;
            }
            return iP;
        }
        j5g j5gVar = (j5g) list;
        int iP2 = 0;
        while (i < size) {
            iP2 += c4g.p(j5gVar.e(i));
            i++;
        }
        return iP2;
    }

    public static int n(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iQ = 0;
        for (int i = 0; i < size; i++) {
            iQ += c4g.q(((Long) list.get(i)).longValue());
        }
        return iQ;
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
    public static void o(Object obj, Object obj2) {
        h5g h5gVar = (h5g) obj;
        c9g c9gVar = h5gVar.zzc;
        c9g c9gVar2 = ((h5g) obj2).zzc;
        c9g c9gVar3 = c9g.f;
        if (!c9gVar3.equals(c9gVar2)) {
            if (c9gVar3.equals(c9gVar)) {
                int i = c9gVar.a + c9gVar2.a;
                int[] iArrCopyOf = Arrays.copyOf(c9gVar.b, i);
                System.arraycopy(c9gVar2.b, 0, iArrCopyOf, c9gVar.a, c9gVar2.a);
                Object[] objArrCopyOf = Arrays.copyOf(c9gVar.c, i);
                System.arraycopy(c9gVar2.c, 0, objArrCopyOf, c9gVar.a, c9gVar2.a);
                c9gVar = new c9g(i, iArrCopyOf, objArrCopyOf, true);
            } else {
                c9gVar.getClass();
                if (!c9gVar2.equals(c9gVar3)) {
                    if (!c9gVar.e) {
                        rd6.b();
                        return;
                    }
                    int i2 = c9gVar.a + c9gVar2.a;
                    c9gVar.e(i2);
                    System.arraycopy(c9gVar2.b, 0, c9gVar.b, c9gVar.a, c9gVar2.a);
                    System.arraycopy(c9gVar2.c, 0, c9gVar.c, c9gVar.a, c9gVar2.a);
                    c9gVar.a = i2;
                }
            }
        }
        h5gVar.zzc = c9gVar;
    }

    public static void p(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                boolean zBooleanValue = ((Boolean) list.get(i2)).booleanValue();
                c4gVar.m(i << 3);
                c4gVar.b(zBooleanValue ? (byte) 1 : (byte) 0);
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Boolean) list.get(i4)).getClass();
            i3++;
        }
        c4gVar.m(i3);
        while (i2 < list.size()) {
            c4gVar.b(((Boolean) list.get(i2)).booleanValue() ? (byte) 1 : (byte) 0);
            i2++;
        }
    }

    public static void q(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.f(i, Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Double) list.get(i4)).getClass();
            i3 += 8;
        }
        c4gVar.m(i3);
        while (i2 < list.size()) {
            c4gVar.g(Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
            i2++;
        }
    }

    public static void r(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    c4gVar.h(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int iQ = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iQ += c4g.q(((Integer) list.get(i3)).intValue());
            }
            c4gVar.m(iQ);
            while (i2 < list.size()) {
                c4gVar.i(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                c4gVar.h(i, j5gVar.e(i2));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iQ2 = 0;
        for (int i4 = 0; i4 < j5gVar.c; i4++) {
            iQ2 += c4g.q(j5gVar.e(i4));
        }
        c4gVar.m(iQ2);
        while (i2 < j5gVar.c) {
            c4gVar.i(j5gVar.e(i2));
            i2++;
        }
    }

    public static void s(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    c4gVar.d(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Integer) list.get(i4)).getClass();
                i3 += 4;
            }
            c4gVar.m(i3);
            while (i2 < list.size()) {
                c4gVar.e(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                c4gVar.d(i, j5gVar.e(i2));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < j5gVar.c; i6++) {
            j5gVar.e(i6);
            i5 += 4;
        }
        c4gVar.m(i5);
        while (i2 < j5gVar.c) {
            c4gVar.e(j5gVar.e(i2));
            i2++;
        }
    }

    public static void t(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.f(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        c4gVar.m(i3);
        while (i2 < list.size()) {
            c4gVar.g(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void u(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.d(i, Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Float) list.get(i4)).getClass();
            i3 += 4;
        }
        c4gVar.m(i3);
        while (i2 < list.size()) {
            c4gVar.e(Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
            i2++;
        }
    }

    public static void v(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    c4gVar.h(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int iQ = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iQ += c4g.q(((Integer) list.get(i3)).intValue());
            }
            c4gVar.m(iQ);
            while (i2 < list.size()) {
                c4gVar.i(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                c4gVar.h(i, j5gVar.e(i2));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iQ2 = 0;
        for (int i4 = 0; i4 < j5gVar.c; i4++) {
            iQ2 += c4g.q(j5gVar.e(i4));
        }
        c4gVar.m(iQ2);
        while (i2 < j5gVar.c) {
            c4gVar.i(j5gVar.e(i2));
            i2++;
        }
    }

    public static void w(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.n(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int iQ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iQ += c4g.q(((Long) list.get(i3)).longValue());
        }
        c4gVar.m(iQ);
        while (i2 < list.size()) {
            c4gVar.o(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void x(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof j5g)) {
            if (!z) {
                while (i2 < list.size()) {
                    c4gVar.d(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            c4gVar.k(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Integer) list.get(i4)).getClass();
                i3 += 4;
            }
            c4gVar.m(i3);
            while (i2 < list.size()) {
                c4gVar.e(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        j5g j5gVar = (j5g) list;
        if (!z) {
            while (i2 < j5gVar.c) {
                c4gVar.d(i, j5gVar.e(i2));
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < j5gVar.c; i6++) {
            j5gVar.e(i6);
            i5 += 4;
        }
        c4gVar.m(i5);
        while (i2 < j5gVar.c) {
            c4gVar.e(j5gVar.e(i2));
            i2++;
        }
    }

    public static void y(int i, List list, ujf ujfVar, boolean z) throws zzfm {
        if (list == null || list.isEmpty()) {
            return;
        }
        c4g c4gVar = (c4g) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                c4gVar.f(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        c4gVar.k(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        c4gVar.m(i3);
        while (i2 < list.size()) {
            c4gVar.g(((Long) list.get(i2)).longValue());
            i2++;
        }
    }
}
