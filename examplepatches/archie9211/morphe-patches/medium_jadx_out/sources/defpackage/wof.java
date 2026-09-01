package defpackage;

import com.google.android.recaptcha.internal.zzacz;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class wof {
    public static final jzb a;

    static {
        int i = gmf.a;
        a = new jzb();
    }

    public static int A(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (h30.c0(i << 3) + 8) * size;
    }

    public static boolean a(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
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
    public static void b(Object obj, Object obj2) {
        fnf fnfVar = (fnf) obj;
        epf epfVar = fnfVar.zzc;
        epf epfVar2 = ((fnf) obj2).zzc;
        epf epfVar3 = epf.f;
        if (!epfVar3.equals(epfVar2)) {
            if (epfVar3.equals(epfVar)) {
                int i = epfVar.a + epfVar2.a;
                int[] iArrCopyOf = Arrays.copyOf(epfVar.b, i);
                System.arraycopy(epfVar2.b, 0, iArrCopyOf, epfVar.a, epfVar2.a);
                Object[] objArrCopyOf = Arrays.copyOf(epfVar.c, i);
                System.arraycopy(epfVar2.c, 0, objArrCopyOf, epfVar.a, epfVar2.a);
                epfVar = new epf(i, iArrCopyOf, objArrCopyOf, true);
            } else {
                epfVar.getClass();
                if (!epfVar2.equals(epfVar3)) {
                    if (!epfVar.e) {
                        rd6.b();
                        return;
                    }
                    int i2 = epfVar.a + epfVar2.a;
                    epfVar.e(i2);
                    System.arraycopy(epfVar2.b, 0, epfVar.b, epfVar.a, epfVar2.a);
                    System.arraycopy(epfVar2.c, 0, epfVar.c, epfVar.a, epfVar2.a);
                    epfVar.a = i2;
                }
            }
        }
        fnfVar.zzc = epfVar;
    }

    public static Object c(Object obj, int i, snf snfVar, usf usfVar, Object obj2) {
        if (usfVar == null) {
            return obj2;
        }
        if (!y30.C(snfVar)) {
            Iterator it2 = snfVar.iterator();
            while (it2.hasNext()) {
                int iIntValue = ((Integer) it2.next()).intValue();
                if (!usf.a(iIntValue)) {
                    obj2 = d(obj, i, obj2, iIntValue);
                    it2.remove();
                }
            }
            return obj2;
        }
        int size = snfVar.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            Integer num = (Integer) snfVar.get(i3);
            int iIntValue2 = num.intValue();
            if (usf.a(iIntValue2)) {
                if (i3 != i2) {
                    snfVar.set(i2, num);
                }
                i2++;
            } else {
                obj2 = d(obj, i, obj2, iIntValue2);
            }
        }
        if (i2 != size) {
            snfVar.subList(i2, size).clear();
        }
        return obj2;
    }

    public static Object d(Object obj, int i, Object obj2, int i2) {
        if (obj2 == null) {
            obj2 = jzb.E(obj);
        }
        ((epf) obj2).d(i << 3, Long.valueOf(i2));
        return obj2;
    }

    public static void e(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                h30Var.T(i, Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Double) list.get(i4)).getClass();
            i3 += 8;
        }
        h30Var.X(i3);
        while (i2 < list.size()) {
            h30Var.a0(Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
            i2++;
        }
    }

    public static void f(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                h30Var.R(i, Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Float) list.get(i4)).getClass();
            i3 += 4;
        }
        h30Var.X(i3);
        while (i2 < list.size()) {
            h30Var.Y(Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
            i2++;
        }
    }

    public static void g(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof aof)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.S(i, ((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iD0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iD0 += h30.d0(((Long) list.get(i3)).longValue());
            }
            h30Var.X(iD0);
            while (i2 < list.size()) {
                h30Var.Z(((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aof aofVar = (aof) list;
        if (!z) {
            while (i2 < aofVar.c) {
                h30Var.S(i, aofVar.e(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iD02 = 0;
        for (int i4 = 0; i4 < aofVar.c; i4++) {
            iD02 += h30.d0(aofVar.e(i4));
        }
        h30Var.X(iD02);
        while (i2 < aofVar.c) {
            h30Var.Z(aofVar.e(i2));
            i2++;
        }
    }

    public static void h(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof aof)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.S(i, ((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iD0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iD0 += h30.d0(((Long) list.get(i3)).longValue());
            }
            h30Var.X(iD0);
            while (i2 < list.size()) {
                h30Var.Z(((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aof aofVar = (aof) list;
        if (!z) {
            while (i2 < aofVar.c) {
                h30Var.S(i, aofVar.e(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iD02 = 0;
        for (int i4 = 0; i4 < aofVar.c; i4++) {
            iD02 += h30.d0(aofVar.e(i4));
        }
        h30Var.X(iD02);
        while (i2 < aofVar.c) {
            h30Var.Z(aofVar.e(i2));
            i2++;
        }
    }

    public static void i(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof aof)) {
            if (!z) {
                while (i2 < list.size()) {
                    long jLongValue = ((Long) list.get(i2)).longValue();
                    h30Var.S(i, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iD0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                long jLongValue2 = ((Long) list.get(i3)).longValue();
                iD0 += h30.d0((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
            }
            h30Var.X(iD0);
            while (i2 < list.size()) {
                long jLongValue3 = ((Long) list.get(i2)).longValue();
                h30Var.Z((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
                i2++;
            }
            return;
        }
        aof aofVar = (aof) list;
        if (!z) {
            while (i2 < aofVar.c) {
                long jE = aofVar.e(i2);
                h30Var.S(i, (jE >> 63) ^ (jE + jE));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iD02 = 0;
        for (int i4 = 0; i4 < aofVar.c; i4++) {
            long jE2 = aofVar.e(i4);
            iD02 += h30.d0((jE2 >> 63) ^ (jE2 + jE2));
        }
        h30Var.X(iD02);
        while (i2 < aofVar.c) {
            long jE3 = aofVar.e(i2);
            h30Var.Z((jE3 >> 63) ^ (jE3 + jE3));
            i2++;
        }
    }

    public static void j(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof aof)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.T(i, ((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Long) list.get(i4)).getClass();
                i3 += 8;
            }
            h30Var.X(i3);
            while (i2 < list.size()) {
                h30Var.a0(((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aof aofVar = (aof) list;
        if (!z) {
            while (i2 < aofVar.c) {
                h30Var.T(i, aofVar.e(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < aofVar.c; i6++) {
            aofVar.e(i6);
            i5 += 8;
        }
        h30Var.X(i5);
        while (i2 < aofVar.c) {
            h30Var.a0(aofVar.e(i2));
            i2++;
        }
    }

    public static void k(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof aof)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.T(i, ((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Long) list.get(i4)).getClass();
                i3 += 8;
            }
            h30Var.X(i3);
            while (i2 < list.size()) {
                h30Var.a0(((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aof aofVar = (aof) list;
        if (!z) {
            while (i2 < aofVar.c) {
                h30Var.T(i, aofVar.e(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < aofVar.c; i6++) {
            aofVar.e(i6);
            i5 += 8;
        }
        h30Var.X(i5);
        while (i2 < aofVar.c) {
            h30Var.a0(aofVar.e(i2));
            i2++;
        }
    }

    public static void l(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.P(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iD0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iD0 += h30.d0(((Integer) list.get(i3)).intValue());
            }
            h30Var.X(iD0);
            while (i2 < list.size()) {
                h30Var.W(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                h30Var.P(i, gnfVar.f(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iD02 = 0;
        for (int i4 = 0; i4 < gnfVar.c; i4++) {
            iD02 += h30.d0(gnfVar.f(i4));
        }
        h30Var.X(iD02);
        while (i2 < gnfVar.c) {
            h30Var.W(gnfVar.f(i2));
            i2++;
        }
    }

    public static void m(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.Q(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iC0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iC0 += h30.c0(((Integer) list.get(i3)).intValue());
            }
            h30Var.X(iC0);
            while (i2 < list.size()) {
                h30Var.X(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                h30Var.Q(i, gnfVar.f(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iC02 = 0;
        for (int i4 = 0; i4 < gnfVar.c; i4++) {
            iC02 += h30.c0(gnfVar.f(i4));
        }
        h30Var.X(iC02);
        while (i2 < gnfVar.c) {
            h30Var.X(gnfVar.f(i2));
            i2++;
        }
    }

    public static void n(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    int iIntValue = ((Integer) list.get(i2)).intValue();
                    h30Var.Q(i, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iC0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                int iIntValue2 = ((Integer) list.get(i3)).intValue();
                iC0 += h30.c0((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
            }
            h30Var.X(iC0);
            while (i2 < list.size()) {
                int iIntValue3 = ((Integer) list.get(i2)).intValue();
                h30Var.X((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                int iF = gnfVar.f(i2);
                h30Var.Q(i, (iF >> 31) ^ (iF + iF));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iC02 = 0;
        for (int i4 = 0; i4 < gnfVar.c; i4++) {
            int iF2 = gnfVar.f(i4);
            iC02 += h30.c0((iF2 >> 31) ^ (iF2 + iF2));
        }
        h30Var.X(iC02);
        while (i2 < gnfVar.c) {
            int iF3 = gnfVar.f(i2);
            h30Var.X((iF3 >> 31) ^ (iF3 + iF3));
            i2++;
        }
    }

    public static void o(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.R(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Integer) list.get(i4)).getClass();
                i3 += 4;
            }
            h30Var.X(i3);
            while (i2 < list.size()) {
                h30Var.Y(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                h30Var.R(i, gnfVar.f(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < gnfVar.c; i6++) {
            gnfVar.f(i6);
            i5 += 4;
        }
        h30Var.X(i5);
        while (i2 < gnfVar.c) {
            h30Var.Y(gnfVar.f(i2));
            i2++;
        }
    }

    public static void p(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.R(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int i3 = 0;
            for (int i4 = 0; i4 < list.size(); i4++) {
                ((Integer) list.get(i4)).getClass();
                i3 += 4;
            }
            h30Var.X(i3);
            while (i2 < list.size()) {
                h30Var.Y(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                h30Var.R(i, gnfVar.f(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int i5 = 0;
        for (int i6 = 0; i6 < gnfVar.c; i6++) {
            gnfVar.f(i6);
            i5 += 4;
        }
        h30Var.X(i5);
        while (i2 < gnfVar.c) {
            h30Var.Y(gnfVar.f(i2));
            i2++;
        }
    }

    public static void q(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = 0;
        if (!(list instanceof gnf)) {
            if (!z) {
                while (i2 < list.size()) {
                    h30Var.P(i, ((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            h30Var.O(i, 2);
            int iD0 = 0;
            for (int i3 = 0; i3 < list.size(); i3++) {
                iD0 += h30.d0(((Integer) list.get(i3)).intValue());
            }
            h30Var.X(iD0);
            while (i2 < list.size()) {
                h30Var.W(((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        gnf gnfVar = (gnf) list;
        if (!z) {
            while (i2 < gnfVar.c) {
                h30Var.P(i, gnfVar.f(i2));
                i2++;
            }
            return;
        }
        h30Var.O(i, 2);
        int iD02 = 0;
        for (int i4 = 0; i4 < gnfVar.c; i4++) {
            iD02 += h30.d0(gnfVar.f(i4));
        }
        h30Var.X(iD02);
        while (i2 < gnfVar.c) {
            h30Var.W(gnfVar.f(i2));
            i2++;
        }
    }

    public static void r(int i, List list, ujf ujfVar, boolean z) throws zzacz {
        if (list == null || list.isEmpty()) {
            return;
        }
        h30 h30Var = (h30) ujfVar.b;
        int i2 = h30Var.b;
        byte[] bArr = (byte[]) h30Var.e;
        int i3 = 0;
        if (!z) {
            while (i3 < list.size()) {
                byte bBooleanValue = ((Boolean) list.get(i3)).booleanValue();
                h30Var.X(i << 3);
                int i4 = h30Var.c;
                int i5 = i4 + 1;
                try {
                    bArr[i4] = bBooleanValue;
                    h30Var.c = i5;
                    i3++;
                } catch (IndexOutOfBoundsException e) {
                    throw new zzacz(i5, i2, 1, e);
                }
            }
            return;
        }
        h30Var.O(i, 2);
        int i6 = 0;
        for (int i7 = 0; i7 < list.size(); i7++) {
            ((Boolean) list.get(i7)).getClass();
            i6++;
        }
        h30Var.X(i6);
        while (i3 < list.size()) {
            byte bBooleanValue2 = ((Boolean) list.get(i3)).booleanValue();
            int i8 = h30Var.c;
            int i9 = i8 + 1;
            try {
                bArr[i8] = bBooleanValue2;
                h30Var.c = i9;
                i3++;
            } catch (IndexOutOfBoundsException e2) {
                throw new zzacz(i9, i2, 1, e2);
            }
        }
    }

    public static int s(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof aof)) {
            int iD0 = 0;
            while (i < size) {
                iD0 += h30.d0(((Long) list.get(i)).longValue());
                i++;
            }
            return iD0;
        }
        aof aofVar = (aof) list;
        int iD02 = 0;
        while (i < size) {
            iD02 += h30.d0(aofVar.e(i));
            i++;
        }
        return iD02;
    }

    public static int t(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof aof)) {
            int iD0 = 0;
            while (i < size) {
                iD0 += h30.d0(((Long) list.get(i)).longValue());
                i++;
            }
            return iD0;
        }
        aof aofVar = (aof) list;
        int iD02 = 0;
        while (i < size) {
            iD02 += h30.d0(aofVar.e(i));
            i++;
        }
        return iD02;
    }

    public static int u(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof aof)) {
            int iD0 = 0;
            while (i < size) {
                long jLongValue = ((Long) list.get(i)).longValue();
                iD0 += h30.d0((jLongValue >> 63) ^ (jLongValue + jLongValue));
                i++;
            }
            return iD0;
        }
        aof aofVar = (aof) list;
        int iD02 = 0;
        while (i < size) {
            long jE = aofVar.e(i);
            iD02 += h30.d0((jE >> 63) ^ (jE + jE));
            i++;
        }
        return iD02;
    }

    public static int v(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof gnf)) {
            int iD0 = 0;
            while (i < size) {
                iD0 += h30.d0(((Integer) list.get(i)).intValue());
                i++;
            }
            return iD0;
        }
        gnf gnfVar = (gnf) list;
        int iD02 = 0;
        while (i < size) {
            iD02 += h30.d0(gnfVar.f(i));
            i++;
        }
        return iD02;
    }

    public static int w(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof gnf)) {
            int iD0 = 0;
            while (i < size) {
                iD0 += h30.d0(((Integer) list.get(i)).intValue());
                i++;
            }
            return iD0;
        }
        gnf gnfVar = (gnf) list;
        int iD02 = 0;
        while (i < size) {
            iD02 += h30.d0(gnfVar.f(i));
            i++;
        }
        return iD02;
    }

    public static int x(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof gnf)) {
            int iC0 = 0;
            while (i < size) {
                iC0 += h30.c0(((Integer) list.get(i)).intValue());
                i++;
            }
            return iC0;
        }
        gnf gnfVar = (gnf) list;
        int iC02 = 0;
        while (i < size) {
            iC02 += h30.c0(gnfVar.f(i));
            i++;
        }
        return iC02;
    }

    public static int y(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof gnf)) {
            int iC0 = 0;
            while (i < size) {
                int iIntValue = ((Integer) list.get(i)).intValue();
                iC0 += h30.c0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i++;
            }
            return iC0;
        }
        gnf gnfVar = (gnf) list;
        int iC02 = 0;
        while (i < size) {
            int iF = gnfVar.f(i);
            iC02 += h30.c0((iF >> 31) ^ (iF + iF));
            i++;
        }
        return iC02;
    }

    public static int z(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (h30.c0(i << 3) + 4) * size;
    }
}
