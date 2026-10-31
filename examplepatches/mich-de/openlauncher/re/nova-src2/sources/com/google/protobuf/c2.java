package com.google.protobuf;

import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class c2 {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f34831a;

    /* renamed from: b, reason: collision with root package name */
    public static final f2 f34832b;

    /* renamed from: c, reason: collision with root package name */
    public static final h2 f34833c;

    static {
        Class<?> cls;
        Class<?> cls2;
        x1 x1Var = x1.f35001c;
        f2 f2Var = null;
        try {
            cls = Class.forName("com.google.protobuf.GeneratedMessage");
        } catch (Throwable unused) {
            cls = null;
        }
        f34831a = cls;
        try {
            x1 x1Var2 = x1.f35001c;
            try {
                cls2 = Class.forName("com.google.protobuf.UnknownFieldSetSchema");
            } catch (Throwable unused2) {
                cls2 = null;
            }
            if (cls2 != null) {
                f2Var = (f2) cls2.getConstructor(null).newInstance(null);
            }
        } catch (Throwable unused3) {
        }
        f34832b = f2Var;
        f34833c = new h2();
    }

    public static void A(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof f1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.R(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 8;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.S(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        f1 f1Var = (f1) list;
        if (!z11) {
            while (i11 < f1Var.size()) {
                tVar.R(i5, f1Var.g(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < f1Var.size(); i15++) {
            f1Var.g(i15);
            Logger logger2 = t.f34970b;
            i14 += 8;
        }
        tVar.d0(i14);
        while (i11 < f1Var.size()) {
            tVar.S(f1Var.g(i11));
            i11++;
        }
    }

    public static void B(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    int iIntValue = ((Integer) list.get(i11)).intValue();
                    tVar.c0(i5, (iIntValue >> 31) ^ (iIntValue << 1));
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int iD = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iD += t.D(((Integer) list.get(i12)).intValue());
            }
            tVar.d0(iD);
            while (i11 < list.size()) {
                int iIntValue2 = ((Integer) list.get(i11)).intValue();
                tVar.d0((iIntValue2 >> 31) ^ (iIntValue2 << 1));
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                int iF = o0Var.f(i11);
                tVar.c0(i5, (iF >> 31) ^ (iF << 1));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int iD2 = 0;
        for (int i13 = 0; i13 < o0Var.f34935c; i13++) {
            iD2 += t.D(o0Var.f(i13));
        }
        tVar.d0(iD2);
        while (i11 < o0Var.f34935c) {
            int iF2 = o0Var.f(i11);
            tVar.d0((iF2 >> 31) ^ (iF2 << 1));
            i11++;
        }
    }

    public static void C(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof f1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    long jLongValue = ((Long) list.get(i11)).longValue();
                    tVar.e0(i5, (jLongValue >> 63) ^ (jLongValue << 1));
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int iE = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iE += t.E(((Long) list.get(i12)).longValue());
            }
            tVar.d0(iE);
            while (i11 < list.size()) {
                long jLongValue2 = ((Long) list.get(i11)).longValue();
                tVar.f0((jLongValue2 >> 63) ^ (jLongValue2 << 1));
                i11++;
            }
            return;
        }
        f1 f1Var = (f1) list;
        if (!z11) {
            while (i11 < f1Var.size()) {
                long jG = f1Var.g(i11);
                tVar.e0(i5, (jG >> 63) ^ (jG << 1));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int iE2 = 0;
        for (int i13 = 0; i13 < f1Var.size(); i13++) {
            iE2 += t.E(f1Var.g(i13));
        }
        tVar.d0(iE2);
        while (i11 < f1Var.size()) {
            long jG2 = f1Var.g(i11);
            tVar.f0((jG2 >> 63) ^ (jG2 << 1));
            i11++;
        }
    }

    public static void D(int i5, List list, h1 h1Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof c1)) {
            while (i11 < list.size()) {
                tVar.Z(i5, (String) list.get(i11));
                i11++;
            }
            return;
        }
        c1 c1Var = (c1) list;
        while (i11 < list.size()) {
            Object objI = c1Var.i();
            if (objI instanceof String) {
                tVar.Z(i5, (String) objI);
            } else {
                tVar.N(i5, (l) objI);
            }
            i11++;
        }
    }

    public static void E(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.c0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int iH = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iH += t.H(((Integer) list.get(i12)).intValue());
            }
            tVar.d0(iH);
            while (i11 < list.size()) {
                tVar.d0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                tVar.c0(i5, o0Var.f(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int iH2 = 0;
        for (int i13 = 0; i13 < o0Var.f34935c; i13++) {
            iH2 += t.H(o0Var.f(i13));
        }
        tVar.d0(iH2);
        while (i11 < o0Var.f34935c) {
            tVar.d0(o0Var.f(i11));
            i11++;
        }
    }

    public static void F(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof f1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.e0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int I = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                I += t.I(((Long) list.get(i12)).longValue());
            }
            tVar.d0(I);
            while (i11 < list.size()) {
                tVar.f0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        f1 f1Var = (f1) list;
        if (!z11) {
            while (i11 < f1Var.size()) {
                tVar.e0(i5, f1Var.g(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int I2 = 0;
        for (int i13 = 0; i13 < f1Var.size(); i13++) {
            I2 += t.I(f1Var.g(i13));
        }
        tVar.d0(I2);
        while (i11 < f1Var.size()) {
            tVar.f0(f1Var.g(i11));
            i11++;
        }
    }

    public static int a(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof o0)) {
            int I = 0;
            while (i5 < size) {
                I += t.I(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return I;
        }
        o0 o0Var = (o0) list;
        int I2 = 0;
        while (i5 < size) {
            I2 += t.I(o0Var.f(i5));
            i5++;
        }
        return I2;
    }

    public static int b(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (t.G(i5) + 4) * size;
    }

    public static int c(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (t.G(i5) + 8) * size;
    }

    public static int d(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof o0)) {
            int I = 0;
            while (i5 < size) {
                I += t.I(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return I;
        }
        o0 o0Var = (o0) list;
        int I2 = 0;
        while (i5 < size) {
            I2 += t.I(o0Var.f(i5));
            i5++;
        }
        return I2;
    }

    public static int e(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof f1)) {
            int I = 0;
            while (i5 < size) {
                I += t.I(((Long) list.get(i5)).longValue());
                i5++;
            }
            return I;
        }
        f1 f1Var = (f1) list;
        int I2 = 0;
        while (i5 < size) {
            I2 += t.I(f1Var.g(i5));
            i5++;
        }
        return I2;
    }

    public static int f(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof o0)) {
            int iD = 0;
            while (i5 < size) {
                iD += t.D(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iD;
        }
        o0 o0Var = (o0) list;
        int iD2 = 0;
        while (i5 < size) {
            iD2 += t.D(o0Var.f(i5));
            i5++;
        }
        return iD2;
    }

    public static int g(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof f1)) {
            int iE = 0;
            while (i5 < size) {
                iE += t.E(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iE;
        }
        f1 f1Var = (f1) list;
        int iE2 = 0;
        while (i5 < size) {
            iE2 += t.E(f1Var.g(i5));
            i5++;
        }
        return iE2;
    }

    public static int h(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof o0)) {
            int iH = 0;
            while (i5 < size) {
                iH += t.H(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iH;
        }
        o0 o0Var = (o0) list;
        int iH2 = 0;
        while (i5 < size) {
            iH2 += t.H(o0Var.f(i5));
            i5++;
        }
        return iH2;
    }

    public static int i(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof f1)) {
            int I = 0;
            while (i5 < size) {
                I += t.I(((Long) list.get(i5)).longValue());
                i5++;
            }
            return I;
        }
        f1 f1Var = (f1) list;
        int I2 = 0;
        while (i5 < size) {
            I2 += t.I(f1Var.g(i5));
            i5++;
        }
        return I2;
    }

    public static Object j(Object obj, int i5, z0 z0Var, t0 t0Var, Object obj2, f2 f2Var) {
        if (t0Var == null) {
            return obj2;
        }
        if (z0Var == null) {
            Iterator it = z0Var.iterator();
            while (it.hasNext()) {
                int iIntValue = ((Integer) it.next()).intValue();
                if (!t0Var.isInRange(iIntValue)) {
                    obj2 = n(obj, i5, iIntValue, obj2, f2Var);
                    it.remove();
                }
            }
            return obj2;
        }
        int size = z0Var.size();
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            Integer num = (Integer) z0Var.get(i12);
            int iIntValue2 = num.intValue();
            if (t0Var.isInRange(iIntValue2)) {
                if (i12 != i11) {
                    z0Var.set(i11, num);
                }
                i11++;
            } else {
                obj2 = n(obj, i5, iIntValue2, obj2, f2Var);
            }
        }
        if (i11 != size) {
            z0Var.subList(i11, size).clear();
        }
        return obj2;
    }

    public static Object k(Object obj, int i5, AbstractList abstractList, s0 s0Var, Object obj2, f2 f2Var) {
        if (s0Var == null) {
            return obj2;
        }
        int size = abstractList.size();
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            Integer num = (Integer) abstractList.get(i12);
            int iIntValue = num.intValue();
            if (s0Var.findValueByNumber(iIntValue) != null) {
                if (i12 != i11) {
                    abstractList.set(i11, num);
                }
                i11++;
            } else {
                obj2 = n(obj, i5, iIntValue, obj2, f2Var);
            }
        }
        if (i11 != size) {
            abstractList.subList(i11, size).clear();
        }
        return obj2;
    }

    public static void l(f2 f2Var, Object obj, Object obj2) {
        ((h2) f2Var).getClass();
        n0 n0Var = (n0) obj;
        g2 g2VarE = n0Var.unknownFields;
        g2 g2Var = ((n0) obj2).unknownFields;
        g2 g2Var2 = g2.f34861f;
        if (!g2Var2.equals(g2Var)) {
            if (g2Var2.equals(g2VarE)) {
                g2VarE = g2.e(g2VarE, g2Var);
            } else {
                g2VarE.getClass();
                if (!g2Var.equals(g2Var2)) {
                    g2VarE.a();
                    int i5 = g2VarE.f34862a + g2Var.f34862a;
                    g2VarE.b(i5);
                    System.arraycopy(g2Var.f34863b, 0, g2VarE.f34863b, g2VarE.f34862a, g2Var.f34862a);
                    System.arraycopy(g2Var.f34864c, 0, g2VarE.f34864c, g2VarE.f34862a, g2Var.f34862a);
                    g2VarE.f34862a = i5;
                }
            }
        }
        n0Var.unknownFields = g2VarE;
    }

    public static boolean m(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static Object n(Object obj, int i5, int i11, Object obj2, f2 f2Var) {
        if (obj2 == null) {
            obj2 = f2Var.a(obj);
        }
        ((h2) f2Var).getClass();
        ((g2) obj2).f(i5 << 3, Long.valueOf(i11));
        return obj2;
    }

    public static void o(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof h)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.L(i5, ((Boolean) list.get(i11)).booleanValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Boolean) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12++;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.K(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
                i11++;
            }
            return;
        }
        h hVar = (h) list;
        if (!z11) {
            while (i11 < hVar.size()) {
                tVar.L(i5, hVar.g(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < hVar.size(); i15++) {
            hVar.g(i15);
            Logger logger2 = t.f34970b;
            i14++;
        }
        tVar.d0(i14);
        while (i11 < hVar.size()) {
            tVar.K(hVar.g(i11) ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public static void p(int i5, List list, h1 h1Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        h1Var.getClass();
        for (int i11 = 0; i11 < list.size(); i11++) {
            ((t) h1Var.f34871a).N(i5, (l) list.get(i11));
        }
    }

    public static void q(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof u)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.R(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Double) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 8;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.S(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        u uVar = (u) list;
        if (!z11) {
            while (i11 < uVar.size()) {
                tVar.R(i5, Double.doubleToRawLongBits(uVar.g(i11)));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < uVar.size(); i15++) {
            uVar.g(i15);
            Logger logger2 = t.f34970b;
            i14 += 8;
        }
        tVar.d0(i14);
        while (i11 < uVar.size()) {
            tVar.S(Double.doubleToRawLongBits(uVar.g(i11)));
            i11++;
        }
    }

    public static void r(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.T(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int I = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                I += t.I(((Integer) list.get(i12)).intValue());
            }
            tVar.d0(I);
            while (i11 < list.size()) {
                tVar.U(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                tVar.T(i5, o0Var.f(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int I2 = 0;
        for (int i13 = 0; i13 < o0Var.f34935c; i13++) {
            I2 += t.I(o0Var.f(i13));
        }
        tVar.d0(I2);
        while (i11 < o0Var.f34935c) {
            tVar.U(o0Var.f(i11));
            i11++;
        }
    }

    public static void s(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.P(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 4;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.Q(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                tVar.P(i5, o0Var.f(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < o0Var.f34935c; i15++) {
            o0Var.f(i15);
            Logger logger2 = t.f34970b;
            i14 += 4;
        }
        tVar.d0(i14);
        while (i11 < o0Var.f34935c) {
            tVar.Q(o0Var.f(i11));
            i11++;
        }
    }

    public static void t(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof f1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.R(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 8;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.S(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        f1 f1Var = (f1) list;
        if (!z11) {
            while (i11 < f1Var.size()) {
                tVar.R(i5, f1Var.g(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < f1Var.size(); i15++) {
            f1Var.g(i15);
            Logger logger2 = t.f34970b;
            i14 += 8;
        }
        tVar.d0(i14);
        while (i11 < f1Var.size()) {
            tVar.S(f1Var.g(i11));
            i11++;
        }
    }

    public static void u(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof d0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.P(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Float) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 4;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.Q(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        d0 d0Var = (d0) list;
        if (!z11) {
            while (i11 < d0Var.size()) {
                tVar.P(i5, Float.floatToRawIntBits(d0Var.g(i11)));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < d0Var.size(); i15++) {
            d0Var.g(i15);
            Logger logger2 = t.f34970b;
            i14 += 4;
        }
        tVar.d0(i14);
        while (i11 < d0Var.size()) {
            tVar.Q(Float.floatToRawIntBits(d0Var.g(i11)));
            i11++;
        }
    }

    public static void v(int i5, List list, h1 h1Var, b2 b2Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        h1Var.getClass();
        for (int i11 = 0; i11 < list.size(); i11++) {
            h1Var.a(i5, list.get(i11), b2Var);
        }
    }

    public static void w(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.T(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int I = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                I += t.I(((Integer) list.get(i12)).intValue());
            }
            tVar.d0(I);
            while (i11 < list.size()) {
                tVar.U(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                tVar.T(i5, o0Var.f(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int I2 = 0;
        for (int i13 = 0; i13 < o0Var.f34935c; i13++) {
            I2 += t.I(o0Var.f(i13));
        }
        tVar.d0(I2);
        while (i11 < o0Var.f34935c) {
            tVar.U(o0Var.f(i11));
            i11++;
        }
    }

    public static void x(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof f1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.e0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int I = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                I += t.I(((Long) list.get(i12)).longValue());
            }
            tVar.d0(I);
            while (i11 < list.size()) {
                tVar.f0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        f1 f1Var = (f1) list;
        if (!z11) {
            while (i11 < f1Var.size()) {
                tVar.e0(i5, f1Var.g(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int I2 = 0;
        for (int i13 = 0; i13 < f1Var.size(); i13++) {
            I2 += t.I(f1Var.g(i13));
        }
        tVar.d0(I2);
        while (i11 < f1Var.size()) {
            tVar.f0(f1Var.g(i11));
            i11++;
        }
    }

    public static void y(int i5, List list, h1 h1Var, b2 b2Var) {
        if (list == null || list.isEmpty()) {
            return;
        }
        h1Var.getClass();
        for (int i11 = 0; i11 < list.size(); i11++) {
            ((t) h1Var.f34871a).V(i5, (o1) list.get(i11), b2Var);
        }
    }

    public static void z(int i5, List list, h1 h1Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        t tVar = (t) h1Var.f34871a;
        int i11 = 0;
        if (!(list instanceof o0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    tVar.P(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            tVar.b0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                Logger logger = t.f34970b;
                i12 += 4;
            }
            tVar.d0(i12);
            while (i11 < list.size()) {
                tVar.Q(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        o0 o0Var = (o0) list;
        if (!z11) {
            while (i11 < o0Var.f34935c) {
                tVar.P(i5, o0Var.f(i11));
                i11++;
            }
            return;
        }
        tVar.b0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < o0Var.f34935c; i15++) {
            o0Var.f(i15);
            Logger logger2 = t.f34970b;
            i14 += 4;
        }
        tVar.d0(i14);
        while (i11 < o0Var.f34935c) {
            tVar.Q(o0Var.f(i11));
            i11++;
        }
    }
}
