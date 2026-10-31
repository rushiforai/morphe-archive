package androidx.datastore.preferences.protobuf;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class a1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f14274a;

    /* renamed from: b, reason: collision with root package name */
    public static final f1 f14275b;

    /* renamed from: c, reason: collision with root package name */
    public static final h1 f14276c;

    static {
        Class<?> cls;
        Class<?> cls2;
        w0 w0Var = w0.f14415c;
        f1 f1Var = null;
        try {
            cls = Class.forName("androidx.datastore.preferences.protobuf.GeneratedMessage");
        } catch (Throwable unused) {
            cls = null;
        }
        f14274a = cls;
        try {
            w0 w0Var2 = w0.f14415c;
            try {
                cls2 = Class.forName("androidx.datastore.preferences.protobuf.UnknownFieldSetSchema");
            } catch (Throwable unused2) {
                cls2 = null;
            }
            if (cls2 != null) {
                f1Var = (f1) cls2.getConstructor(null).newInstance(null);
            }
        } catch (Throwable unused3) {
        }
        f14275b = f1Var;
        f14276c = new h1();
    }

    public static int a(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof z) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iJ0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iJ0 += m.j0(((Integer) list.get(i5)).intValue());
        }
        return iJ0;
    }

    public static int b(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (m.h0(i5) + 4) * size;
    }

    public static int c(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (m.h0(i5) + 8) * size;
    }

    public static int d(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof z) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iJ0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iJ0 += m.j0(((Integer) list.get(i5)).intValue());
        }
        return iJ0;
    }

    public static int e(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof h0) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iJ0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iJ0 += m.j0(((Long) list.get(i5)).longValue());
        }
        return iJ0;
    }

    public static int f(List list) {
        int size = list.size();
        if (size != 0) {
            if (!(list instanceof z)) {
                int iI0 = 0;
                for (int i5 = 0; i5 < size; i5++) {
                    int iIntValue = ((Integer) list.get(i5)).intValue();
                    iI0 += m.i0((iIntValue >> 31) ^ (iIntValue << 1));
                }
                return iI0;
            }
            if (size > 0) {
                throw null;
            }
        }
        return 0;
    }

    public static int g(List list) {
        int size = list.size();
        if (size != 0) {
            if (!(list instanceof h0)) {
                int iJ0 = 0;
                for (int i5 = 0; i5 < size; i5++) {
                    long jLongValue = ((Long) list.get(i5)).longValue();
                    iJ0 += m.j0((jLongValue >> 63) ^ (jLongValue << 1));
                }
                return iJ0;
            }
            if (size > 0) {
                throw null;
            }
        }
        return 0;
    }

    public static int h(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof z) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iI0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iI0 += m.i0(((Integer) list.get(i5)).intValue());
        }
        return iI0;
    }

    public static int i(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof h0) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iJ0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iJ0 += m.j0(((Long) list.get(i5)).longValue());
        }
        return iJ0;
    }

    public static Object j(Object obj, int i5, a0 a0Var, Object obj2, f1 f1Var) {
        return obj2;
    }

    public static void k(f1 f1Var, Object obj, Object obj2) {
        ((h1) f1Var).getClass();
        y yVar = (y) obj;
        g1 g1Var = yVar.unknownFields;
        g1 g1Var2 = ((y) obj2).unknownFields;
        g1 g1Var3 = g1.f14318f;
        if (!g1Var3.equals(g1Var2)) {
            if (g1Var3.equals(g1Var)) {
                int i5 = g1Var.f14319a + g1Var2.f14319a;
                int[] iArrCopyOf = Arrays.copyOf(g1Var.f14320b, i5);
                System.arraycopy(g1Var2.f14320b, 0, iArrCopyOf, g1Var.f14319a, g1Var2.f14319a);
                Object[] objArrCopyOf = Arrays.copyOf(g1Var.f14321c, i5);
                System.arraycopy(g1Var2.f14321c, 0, objArrCopyOf, g1Var.f14319a, g1Var2.f14319a);
                g1Var = new g1(i5, iArrCopyOf, objArrCopyOf, true);
            } else {
                g1Var.getClass();
                if (!g1Var2.equals(g1Var3)) {
                    if (!g1Var.f14323e) {
                        throw new UnsupportedOperationException();
                    }
                    int i11 = g1Var.f14319a + g1Var2.f14319a;
                    g1Var.a(i11);
                    System.arraycopy(g1Var2.f14320b, 0, g1Var.f14320b, g1Var.f14319a, g1Var2.f14319a);
                    System.arraycopy(g1Var2.f14321c, 0, g1Var.f14321c, g1Var.f14319a, g1Var2.f14319a);
                    g1Var.f14319a = i11;
                }
            }
        }
        yVar.unknownFields = g1Var;
    }

    public static boolean l(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void m(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof d) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.o0(i5, ((Boolean) list.get(i11)).booleanValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Boolean) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12++;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.m0(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public static void n(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof n) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.t0(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Double) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 8;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.u0(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
            i11++;
        }
    }

    public static void o(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.v0(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iJ0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iJ0 += m.j0(((Integer) list.get(i12)).intValue());
        }
        mVar.C0(iJ0);
        while (i11 < list.size()) {
            mVar.w0(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public static void p(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.r0(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Integer) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 4;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.s0(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public static void q(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof h0) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.t0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 8;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.u0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void r(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof u) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.r0(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Float) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 4;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.s0(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
            i11++;
        }
    }

    public static void s(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.v0(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iJ0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iJ0 += m.j0(((Integer) list.get(i12)).intValue());
        }
        mVar.C0(iJ0);
        while (i11 < list.size()) {
            mVar.w0(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public static void t(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof h0) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.D0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iJ0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iJ0 += m.j0(((Long) list.get(i12)).longValue());
        }
        mVar.C0(iJ0);
        while (i11 < list.size()) {
            mVar.E0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void u(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.r0(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Integer) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 4;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.s0(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public static void v(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof h0) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.t0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            Logger logger = m.f14353g;
            i12 += 8;
        }
        mVar.C0(i12);
        while (i11 < list.size()) {
            mVar.u0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void w(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                int iIntValue = ((Integer) list.get(i11)).intValue();
                mVar.B0(i5, (iIntValue >> 31) ^ (iIntValue << 1));
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iI0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            int iIntValue2 = ((Integer) list.get(i12)).intValue();
            iI0 += m.i0((iIntValue2 >> 31) ^ (iIntValue2 << 1));
        }
        mVar.C0(iI0);
        while (i11 < list.size()) {
            int iIntValue3 = ((Integer) list.get(i11)).intValue();
            mVar.C0((iIntValue3 >> 31) ^ (iIntValue3 << 1));
            i11++;
        }
    }

    public static void x(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof h0) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                long jLongValue = ((Long) list.get(i11)).longValue();
                mVar.D0(i5, (jLongValue >> 63) ^ (jLongValue << 1));
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iJ0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            long jLongValue2 = ((Long) list.get(i12)).longValue();
            iJ0 += m.j0((jLongValue2 >> 63) ^ (jLongValue2 << 1));
        }
        mVar.C0(iJ0);
        while (i11 < list.size()) {
            long jLongValue3 = ((Long) list.get(i11)).longValue();
            mVar.E0((jLongValue3 >> 63) ^ (jLongValue3 << 1));
            i11++;
        }
    }

    public static void y(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof z) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.B0(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iI0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iI0 += m.i0(((Integer) list.get(i12)).intValue());
        }
        mVar.C0(iI0);
        while (i11 < list.size()) {
            mVar.C0(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public static void z(int i5, List list, j0 j0Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        m mVar = (m) j0Var.f14337a;
        if (list instanceof h0) {
            a80.m.t(list);
            if (!z11) {
                throw null;
            }
            mVar.A0(i5, 2);
            throw null;
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                mVar.D0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        mVar.A0(i5, 2);
        int iJ0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iJ0 += m.j0(((Long) list.get(i12)).longValue());
        }
        mVar.C0(iJ0);
        while (i11 < list.size()) {
            mVar.E0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }
}
