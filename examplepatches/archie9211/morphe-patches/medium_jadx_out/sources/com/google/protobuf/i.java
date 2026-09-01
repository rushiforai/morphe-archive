package com.google.protobuf;

import defpackage.aq1;
import defpackage.b46;
import defpackage.brb;
import defpackage.cz7;
import defpackage.f21;
import defpackage.ka7;
import defpackage.r1;
import defpackage.uw6;
import defpackage.zm7;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class i {
    public static final Class a;
    public static final j b;
    public static final j c;
    public static final l d;

    static {
        Class<?> cls;
        try {
            cls = Class.forName("com.google.protobuf.GeneratedMessageV3");
        } catch (Throwable unused) {
            cls = null;
        }
        a = cls;
        b = v(false);
        c = v(true);
        d = new l();
    }

    public static void A(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                double dDoubleValue = ((Double) list.get(i2)).doubleValue();
                aq1Var.getClass();
                aq1Var.t(i, Double.doubleToRawLongBits(dDoubleValue));
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Double) list.get(i4)).getClass();
            i3 += 8;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.u(Double.doubleToRawLongBits(((Double) list.get(i2)).doubleValue()));
            i2++;
        }
    }

    public static void B(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.v(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iF = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iF += aq1.f(((Integer) list.get(i3)).intValue());
        }
        aq1Var.E(iF);
        while (i2 < list.size()) {
            aq1Var.w(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void C(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.r(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Integer) list.get(i4)).getClass();
            i3 += 4;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.s(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void D(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.t(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.u(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void E(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                float fFloatValue = ((Float) list.get(i2)).floatValue();
                aq1Var.getClass();
                aq1Var.r(i, Float.floatToRawIntBits(fFloatValue));
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Float) list.get(i4)).getClass();
            i3 += 4;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.s(Float.floatToRawIntBits(((Float) list.get(i2)).floatValue()));
            i2++;
        }
    }

    public static void F(int i, List list, zm7 zm7Var, brb brbVar) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zm7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            zm7Var.m0(i, list.get(i2), brbVar);
        }
    }

    public static void G(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.v(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iF = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iF += aq1.f(((Integer) list.get(i3)).intValue());
        }
        aq1Var.E(iF);
        while (i2 < list.size()) {
            aq1Var.w(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void H(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.F(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iK = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iK += aq1.k(((Long) list.get(i3)).longValue());
        }
        aq1Var.E(iK);
        while (i2 < list.size()) {
            aq1Var.G(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void I(int i, List list, zm7 zm7Var, brb brbVar) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zm7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            zm7Var.p0(i, list.get(i2), brbVar);
        }
    }

    public static void J(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.r(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Integer) list.get(i4)).getClass();
            i3 += 4;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.s(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void K(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.t(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Long) list.get(i4)).getClass();
            i3 += 8;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.u(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static void L(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                int iIntValue = ((Integer) list.get(i2)).intValue();
                aq1Var.D(i, (iIntValue >> 31) ^ (iIntValue << 1));
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            int iIntValue2 = ((Integer) list.get(i3)).intValue();
            iJ += aq1.j((iIntValue2 >> 31) ^ (iIntValue2 << 1));
        }
        aq1Var.E(iJ);
        while (i2 < list.size()) {
            int iIntValue3 = ((Integer) list.get(i2)).intValue();
            aq1Var.E((iIntValue3 >> 31) ^ (iIntValue3 << 1));
            i2++;
        }
    }

    public static void M(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                long jLongValue = ((Long) list.get(i2)).longValue();
                aq1Var.F(i, (jLongValue >> 63) ^ (jLongValue << 1));
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iK = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            long jLongValue2 = ((Long) list.get(i3)).longValue();
            iK += aq1.k((jLongValue2 >> 63) ^ (jLongValue2 << 1));
        }
        aq1Var.E(iK);
        while (i2 < list.size()) {
            long jLongValue3 = ((Long) list.get(i2)).longValue();
            aq1Var.G((jLongValue3 >> 63) ^ (jLongValue3 << 1));
            i2++;
        }
    }

    public static void N(int i, List list, zm7 zm7Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!(list instanceof uw6)) {
            while (i2 < list.size()) {
                aq1Var.A(i, (String) list.get(i2));
                i2++;
            }
            return;
        }
        uw6 uw6Var = (uw6) list;
        while (i2 < list.size()) {
            Object objO = uw6Var.o(i2);
            if (objO instanceof String) {
                aq1Var.A(i, (String) objO);
            } else {
                aq1Var.p(i, (f21) objO);
            }
            i2++;
        }
    }

    public static void O(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.D(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iJ = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iJ += aq1.j(((Integer) list.get(i3)).intValue());
        }
        aq1Var.E(iJ);
        while (i2 < list.size()) {
            aq1Var.E(((Integer) list.get(i2)).intValue());
            i2++;
        }
    }

    public static void P(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.F(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int iK = 0;
        for (int i3 = 0; i3 < list.size(); i3++) {
            iK += aq1.k(((Long) list.get(i3)).longValue());
        }
        aq1Var.E(iK);
        while (i2 < list.size()) {
            aq1Var.G(((Long) list.get(i2)).longValue());
            i2++;
        }
    }

    public static int a(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iH = aq1.h(i) * size;
        for (int i2 = 0; i2 < list.size(); i2++) {
            iH += aq1.b((f21) list.get(i2));
        }
        return iH;
    }

    public static int b(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + c(list);
    }

    public static int c(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof b46)) {
            int iF = 0;
            while (i < size) {
                iF += aq1.f(((Integer) list.get(i)).intValue());
                i++;
            }
            return iF;
        }
        b46 b46Var = (b46) list;
        int iF2 = 0;
        while (i < size) {
            b46Var.f(i);
            iF2 += aq1.f(b46Var.b[i]);
            i++;
        }
        return iF2;
    }

    public static int d(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return aq1.c(i) * size;
    }

    public static int e(List list) {
        return list.size() * 4;
    }

    public static int f(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return aq1.d(i) * size;
    }

    public static int g(List list) {
        return list.size() * 8;
    }

    public static int h(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + i(list);
    }

    public static int i(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof b46)) {
            int iF = 0;
            while (i < size) {
                iF += aq1.f(((Integer) list.get(i)).intValue());
                i++;
            }
            return iF;
        }
        b46 b46Var = (b46) list;
        int iF2 = 0;
        while (i < size) {
            b46Var.f(i);
            iF2 += aq1.f(b46Var.b[i]);
            i++;
        }
        return iF2;
    }

    public static int j(int i, List list) {
        if (list.size() == 0) {
            return 0;
        }
        return (aq1.h(i) * list.size()) + k(list);
    }

    public static int k(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof ka7)) {
            int iK = 0;
            while (i < size) {
                iK += aq1.k(((Long) list.get(i)).longValue());
                i++;
            }
            return iK;
        }
        ka7 ka7Var = (ka7) list;
        int iK2 = 0;
        while (i < size) {
            ka7Var.f(i);
            iK2 += aq1.k(ka7Var.b[i]);
            i++;
        }
        return iK2;
    }

    public static int l(int i, List list, brb brbVar) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int iH = aq1.h(i) * size;
        for (int i2 = 0; i2 < size; i2++) {
            int serializedSize = ((r1) ((cz7) list.get(i2))).getSerializedSize(brbVar);
            iH += aq1.j(serializedSize) + serializedSize;
        }
        return iH;
    }

    public static int m(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + n(list);
    }

    public static int n(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof b46)) {
            int iJ = 0;
            while (i < size) {
                int iIntValue = ((Integer) list.get(i)).intValue();
                iJ += aq1.j((iIntValue >> 31) ^ (iIntValue << 1));
                i++;
            }
            return iJ;
        }
        b46 b46Var = (b46) list;
        int iJ2 = 0;
        while (i < size) {
            b46Var.f(i);
            int i2 = b46Var.b[i];
            iJ2 += aq1.j((i2 >> 31) ^ (i2 << 1));
            i++;
        }
        return iJ2;
    }

    public static int o(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + p(list);
    }

    public static int p(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof ka7)) {
            int iK = 0;
            while (i < size) {
                long jLongValue = ((Long) list.get(i)).longValue();
                iK += aq1.k((jLongValue >> 63) ^ (jLongValue << 1));
                i++;
            }
            return iK;
        }
        ka7 ka7Var = (ka7) list;
        int iK2 = 0;
        while (i < size) {
            ka7Var.f(i);
            long j = ka7Var.b[i];
            iK2 += aq1.k((j >> 63) ^ (j << 1));
            i++;
        }
        return iK2;
    }

    public static int q(int i, List list) {
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        int iH = aq1.h(i) * size;
        if (!(list instanceof uw6)) {
            while (i2 < size) {
                Object obj = list.get(i2);
                if (obj instanceof f21) {
                    int size2 = ((f21) obj).size();
                    iH = aq1.j(size2) + size2 + iH;
                } else {
                    iH = aq1.g((String) obj) + iH;
                }
                i2++;
            }
            return iH;
        }
        uw6 uw6Var = (uw6) list;
        while (i2 < size) {
            Object objO = uw6Var.o(i2);
            if (objO instanceof f21) {
                int size3 = ((f21) objO).size();
                iH = aq1.j(size3) + size3 + iH;
            } else {
                iH = aq1.g((String) objO) + iH;
            }
            i2++;
        }
        return iH;
    }

    public static int r(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + s(list);
    }

    public static int s(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof b46)) {
            int iJ = 0;
            while (i < size) {
                iJ += aq1.j(((Integer) list.get(i)).intValue());
                i++;
            }
            return iJ;
        }
        b46 b46Var = (b46) list;
        int iJ2 = 0;
        while (i < size) {
            b46Var.f(i);
            iJ2 += aq1.j(b46Var.b[i]);
            i++;
        }
        return iJ2;
    }

    public static int t(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (aq1.h(i) * size) + u(list);
    }

    public static int u(List list) {
        int size = list.size();
        int i = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof ka7)) {
            int iK = 0;
            while (i < size) {
                iK += aq1.k(((Long) list.get(i)).longValue());
                i++;
            }
            return iK;
        }
        ka7 ka7Var = (ka7) list;
        int iK2 = 0;
        while (i < size) {
            ka7Var.f(i);
            iK2 += aq1.k(ka7Var.b[i]);
            i++;
        }
        return iK2;
    }

    public static j v(boolean z) {
        Class<?> cls;
        try {
            cls = Class.forName("com.google.protobuf.UnknownFieldSetSchema");
        } catch (Throwable unused) {
            cls = null;
        }
        if (cls != null) {
            try {
                return (j) cls.getConstructor(Boolean.TYPE).newInstance(Boolean.valueOf(z));
            } catch (Throwable unused2) {
            }
        }
        return null;
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
    public static void w(j jVar, Object obj, Object obj2) {
        ((l) jVar).getClass();
        e eVar = (e) obj;
        k kVarE = eVar.unknownFields;
        k kVar = ((e) obj2).unknownFields;
        k kVar2 = k.f;
        if (!kVar2.equals(kVar)) {
            if (kVar2.equals(kVarE)) {
                kVarE = k.e(kVarE, kVar);
            } else {
                kVarE.getClass();
                if (!kVar.equals(kVar2)) {
                    kVarE.a();
                    int i = kVarE.a + kVar.a;
                    kVarE.b(i);
                    System.arraycopy(kVar.b, 0, kVarE.b, kVarE.a, kVar.a);
                    System.arraycopy(kVar.c, 0, kVarE.c, kVarE.a, kVar.a);
                    kVarE.a = i;
                }
            }
        }
        eVar.unknownFields = kVarE;
    }

    public static boolean x(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void y(int i, List list, zm7 zm7Var, boolean z) {
        if (list == null || list.isEmpty()) {
            return;
        }
        aq1 aq1Var = (aq1) zm7Var.b;
        int i2 = 0;
        if (!z) {
            while (i2 < list.size()) {
                aq1Var.n(i, ((Boolean) list.get(i2)).booleanValue());
                i2++;
            }
            return;
        }
        aq1Var.C(i, 2);
        int i3 = 0;
        for (int i4 = 0; i4 < list.size(); i4++) {
            ((Boolean) list.get(i4)).getClass();
            i3++;
        }
        aq1Var.E(i3);
        while (i2 < list.size()) {
            aq1Var.m(((Boolean) list.get(i2)).booleanValue() ? (byte) 1 : (byte) 0);
            i2++;
        }
    }

    public static void z(int i, List list, zm7 zm7Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        zm7Var.getClass();
        for (int i2 = 0; i2 < list.size(); i2++) {
            ((aq1) zm7Var.b).p(i, (f21) list.get(i2));
        }
    }
}
