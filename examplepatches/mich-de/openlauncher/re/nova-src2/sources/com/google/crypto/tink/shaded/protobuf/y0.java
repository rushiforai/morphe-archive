package com.google.crypto.tink.shaded.protobuf;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public abstract class y0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f34684a;

    /* renamed from: b, reason: collision with root package name */
    public static final z0 f34685b;

    /* renamed from: c, reason: collision with root package name */
    public static final b1 f34686c;

    static {
        Class<?> cls;
        Class<?> cls2;
        u0 u0Var = u0.f34670c;
        z0 z0Var = null;
        try {
            cls = Class.forName("com.google.crypto.tink.shaded.protobuf.GeneratedMessage");
        } catch (Throwable unused) {
            cls = null;
        }
        f34684a = cls;
        try {
            u0 u0Var2 = u0.f34670c;
            try {
                cls2 = Class.forName("com.google.crypto.tink.shaded.protobuf.UnknownFieldSetSchema");
            } catch (Throwable unused2) {
                cls2 = null;
            }
            if (cls2 != null) {
                z0Var = (z0) cls2.getConstructor(null).newInstance(null);
            }
        } catch (Throwable unused3) {
        }
        f34685b = z0Var;
        f34686c = new b1();
    }

    public static void A(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof g0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    long jLongValue = ((Long) list.get(i11)).longValue();
                    mVar.C0(i5, (jLongValue >> 63) ^ (jLongValue << 1));
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iH0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iH0 += m.h0(((Long) list.get(i12)).longValue());
            }
            mVar.B0(iH0);
            while (i11 < list.size()) {
                long jLongValue2 = ((Long) list.get(i11)).longValue();
                mVar.D0((jLongValue2 >> 63) ^ (jLongValue2 << 1));
                i11++;
            }
            return;
        }
        g0 g0Var = (g0) list;
        if (!z11) {
            while (i11 < 0) {
                long jE = g0Var.e(i11);
                mVar.C0(i5, (jE >> 63) ^ (jE << 1));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iH02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iH02 += m.h0(g0Var.e(i13));
        }
        mVar.B0(iH02);
        while (i11 < 0) {
            long jE2 = g0Var.e(i11);
            mVar.D0((jE2 >> 63) ^ (jE2 << 1));
            i11++;
        }
    }

    public static void B(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.A0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iK0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iK0 += m.k0(((Integer) list.get(i12)).intValue());
            }
            mVar.B0(iK0);
            while (i11 < list.size()) {
                mVar.B0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.A0(i5, yVar.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iK02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iK02 += m.k0(yVar.e(i13));
        }
        mVar.B0(iK02);
        while (i11 < 0) {
            mVar.B0(yVar.e(i11));
            i11++;
        }
    }

    public static void C(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof g0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.C0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iM0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iM0 += m.m0(((Long) list.get(i12)).longValue());
            }
            mVar.B0(iM0);
            while (i11 < list.size()) {
                mVar.D0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        g0 g0Var = (g0) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.C0(i5, g0Var.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iM02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iM02 += m.m0(g0Var.e(i13));
        }
        mVar.B0(iM02);
        while (i11 < 0) {
            mVar.D0(g0Var.e(i11));
            i11++;
        }
    }

    public static int a(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y)) {
            int iM0 = 0;
            while (i5 < size) {
                iM0 += m.m0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iM0;
        }
        y yVar = (y) list;
        int iM02 = 0;
        while (i5 < size) {
            iM02 += m.m0(yVar.e(i5));
            i5++;
        }
        return iM02;
    }

    public static int b(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return m.e0(i5) * size;
    }

    public static int c(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return m.f0(i5) * size;
    }

    public static int d(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y)) {
            int iM0 = 0;
            while (i5 < size) {
                iM0 += m.m0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iM0;
        }
        y yVar = (y) list;
        int iM02 = 0;
        while (i5 < size) {
            iM02 += m.m0(yVar.e(i5));
            i5++;
        }
        return iM02;
    }

    public static int e(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof g0)) {
            int iM0 = 0;
            while (i5 < size) {
                iM0 += m.m0(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iM0;
        }
        g0 g0Var = (g0) list;
        int iM02 = 0;
        while (i5 < size) {
            iM02 += m.m0(g0Var.e(i5));
            i5++;
        }
        return iM02;
    }

    public static int f(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y)) {
            int iG0 = 0;
            while (i5 < size) {
                iG0 += m.g0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iG0;
        }
        y yVar = (y) list;
        int iG02 = 0;
        while (i5 < size) {
            iG02 += m.g0(yVar.e(i5));
            i5++;
        }
        return iG02;
    }

    public static int g(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof g0)) {
            int iH0 = 0;
            while (i5 < size) {
                iH0 += m.h0(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iH0;
        }
        g0 g0Var = (g0) list;
        int iH02 = 0;
        while (i5 < size) {
            iH02 += m.h0(g0Var.e(i5));
            i5++;
        }
        return iH02;
    }

    public static int h(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y)) {
            int iK0 = 0;
            while (i5 < size) {
                iK0 += m.k0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iK0;
        }
        y yVar = (y) list;
        int iK02 = 0;
        while (i5 < size) {
            iK02 += m.k0(yVar.e(i5));
            i5++;
        }
        return iK02;
    }

    public static int i(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof g0)) {
            int iM0 = 0;
            while (i5 < size) {
                iM0 += m.m0(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iM0;
        }
        g0 g0Var = (g0) list;
        int iM02 = 0;
        while (i5 < size) {
            iM02 += m.m0(g0Var.e(i5));
            i5++;
        }
        return iM02;
    }

    public static Object j(Object obj, int i5, a0 a0Var, Object obj2, z0 z0Var) {
        return obj2;
    }

    public static void k(z0 z0Var, Object obj, Object obj2) {
        ((b1) z0Var).getClass();
        x xVar = (x) obj;
        a1 a1Var = xVar.unknownFields;
        a1 a1Var2 = ((x) obj2).unknownFields;
        a1 a1Var3 = a1.f34568f;
        if (!a1Var3.equals(a1Var2)) {
            if (a1Var3.equals(a1Var)) {
                int i5 = a1Var.f34569a + a1Var2.f34569a;
                int[] iArrCopyOf = Arrays.copyOf(a1Var.f34570b, i5);
                System.arraycopy(a1Var2.f34570b, 0, iArrCopyOf, a1Var.f34569a, a1Var2.f34569a);
                Object[] objArrCopyOf = Arrays.copyOf(a1Var.f34571c, i5);
                System.arraycopy(a1Var2.f34571c, 0, objArrCopyOf, a1Var.f34569a, a1Var2.f34569a);
                a1Var = new a1(i5, iArrCopyOf, objArrCopyOf, true);
            } else {
                a1Var.getClass();
                if (!a1Var2.equals(a1Var3)) {
                    if (!a1Var.f34573e) {
                        throw new UnsupportedOperationException();
                    }
                    int i11 = a1Var.f34569a + a1Var2.f34569a;
                    a1Var.a(i11);
                    System.arraycopy(a1Var2.f34570b, 0, a1Var.f34570b, a1Var.f34569a, a1Var2.f34569a);
                    System.arraycopy(a1Var2.f34571c, 0, a1Var.f34571c, a1Var.f34569a, a1Var2.f34569a);
                    a1Var.f34569a = i11;
                }
            }
        }
        xVar.unknownFields = a1Var;
    }

    public static void l(Class cls) {
        if (x.class.isAssignableFrom(cls)) {
            return;
        }
        u0 u0Var = u0.f34670c;
        Class cls2 = f34684a;
        if (cls2 != null && !cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Message classes must extend GeneratedMessage or GeneratedMessageLite");
        }
    }

    public static boolean m(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static z0 n() {
        return f34685b;
    }

    public static b1 o() {
        return f34686c;
    }

    public static void p(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (list instanceof d) {
            if (z11) {
                mVar.z0(i5, 2);
                mVar.B0(0);
                return;
            }
            return;
        }
        if (!z11) {
            while (i11 < list.size()) {
                mVar.q0(i5, ((Boolean) list.get(i11)).booleanValue());
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Boolean) list.get(i13)).getClass();
            Logger logger = m.f34630k;
            i12++;
        }
        mVar.B0(i12);
        while (i11 < list.size()) {
            mVar.p0(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public static void q(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof n)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.u0(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Double) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 8;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.v0(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        n nVar = (n) list;
        if (!z11) {
            while (i11 < 0) {
                nVar.e(i11);
                mVar.u0(i5, Double.doubleToRawLongBits(nVar.f34636b[i11]));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            nVar.e(i15);
            double d5 = nVar.f34636b[i15];
            Logger logger2 = m.f34630k;
            i14 += 8;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            nVar.e(i11);
            mVar.v0(Double.doubleToRawLongBits(nVar.f34636b[i11]));
            i11++;
        }
    }

    public static void r(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.w0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iM0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iM0 += m.m0(((Integer) list.get(i12)).intValue());
            }
            mVar.B0(iM0);
            while (i11 < list.size()) {
                mVar.x0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.w0(i5, yVar.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iM02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iM02 += m.m0(yVar.e(i13));
        }
        mVar.B0(iM02);
        while (i11 < 0) {
            mVar.x0(yVar.e(i11));
            i11++;
        }
    }

    public static void s(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.s0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 4;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.t0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.s0(i5, yVar.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            yVar.e(i15);
            Logger logger2 = m.f34630k;
            i14 += 4;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            mVar.t0(yVar.e(i11));
            i11++;
        }
    }

    public static void t(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof g0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.u0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 8;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.v0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        g0 g0Var = (g0) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.u0(i5, g0Var.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            g0Var.e(i15);
            Logger logger2 = m.f34630k;
            i14 += 8;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            mVar.v0(g0Var.e(i11));
            i11++;
        }
    }

    public static void u(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof t)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.s0(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Float) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 4;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.t0(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        t tVar = (t) list;
        if (!z11) {
            while (i11 < 0) {
                tVar.e(i11);
                mVar.s0(i5, Float.floatToRawIntBits(tVar.f34667b[i11]));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            tVar.e(i15);
            float f11 = tVar.f34667b[i15];
            Logger logger2 = m.f34630k;
            i14 += 4;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            tVar.e(i11);
            mVar.t0(Float.floatToRawIntBits(tVar.f34667b[i11]));
            i11++;
        }
    }

    public static void v(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.w0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iM0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iM0 += m.m0(((Integer) list.get(i12)).intValue());
            }
            mVar.B0(iM0);
            while (i11 < list.size()) {
                mVar.x0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.w0(i5, yVar.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iM02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iM02 += m.m0(yVar.e(i13));
        }
        mVar.B0(iM02);
        while (i11 < 0) {
            mVar.x0(yVar.e(i11));
            i11++;
        }
    }

    public static void w(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof g0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.C0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iM0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iM0 += m.m0(((Long) list.get(i12)).longValue());
            }
            mVar.B0(iM0);
            while (i11 < list.size()) {
                mVar.D0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        g0 g0Var = (g0) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.C0(i5, g0Var.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iM02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iM02 += m.m0(g0Var.e(i13));
        }
        mVar.B0(iM02);
        while (i11 < 0) {
            mVar.D0(g0Var.e(i11));
            i11++;
        }
    }

    public static void x(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.s0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 4;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.t0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.s0(i5, yVar.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            yVar.e(i15);
            Logger logger2 = m.f34630k;
            i14 += 4;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            mVar.t0(yVar.e(i11));
            i11++;
        }
    }

    public static void y(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof g0)) {
            if (!z11) {
                while (i11 < list.size()) {
                    mVar.u0(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                Logger logger = m.f34630k;
                i12 += 8;
            }
            mVar.B0(i12);
            while (i11 < list.size()) {
                mVar.v0(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        g0 g0Var = (g0) list;
        if (!z11) {
            while (i11 < 0) {
                mVar.u0(i5, g0Var.e(i11));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < 0; i15++) {
            g0Var.e(i15);
            Logger logger2 = m.f34630k;
            i14 += 8;
        }
        mVar.B0(i14);
        while (i11 < 0) {
            mVar.v0(g0Var.e(i11));
            i11++;
        }
    }

    public static void z(int i5, List list, cm.f fVar, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) fVar.f20116b;
        int i11 = 0;
        if (!(list instanceof y)) {
            if (!z11) {
                while (i11 < list.size()) {
                    int iIntValue = ((Integer) list.get(i11)).intValue();
                    mVar.A0(i5, (iIntValue >> 31) ^ (iIntValue << 1));
                    i11++;
                }
                return;
            }
            mVar.z0(i5, 2);
            int iG0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iG0 += m.g0(((Integer) list.get(i12)).intValue());
            }
            mVar.B0(iG0);
            while (i11 < list.size()) {
                int iIntValue2 = ((Integer) list.get(i11)).intValue();
                mVar.B0((iIntValue2 >> 31) ^ (iIntValue2 << 1));
                i11++;
            }
            return;
        }
        y yVar = (y) list;
        if (!z11) {
            while (i11 < 0) {
                int iE = yVar.e(i11);
                mVar.A0(i5, (iE >> 31) ^ (iE << 1));
                i11++;
            }
            return;
        }
        mVar.z0(i5, 2);
        int iG02 = 0;
        for (int i13 = 0; i13 < 0; i13++) {
            iG02 += m.g0(yVar.e(i13));
        }
        mVar.B0(iG02);
        while (i11 < 0) {
            int iE2 = yVar.e(i11);
            mVar.B0((iE2 >> 31) ^ (iE2 << 1));
            i11++;
        }
    }
}
