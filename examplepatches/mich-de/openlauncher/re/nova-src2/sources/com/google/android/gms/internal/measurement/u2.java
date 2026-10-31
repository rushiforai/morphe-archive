package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class u2 {

    /* renamed from: a, reason: collision with root package name */
    public static final k1 f33101a;

    static {
        int i5 = p0.f32944a;
        f33101a = new k1(1);
    }

    public static boolean a(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void b(Object obj, Object obj2) {
        o1 o1Var = (o1) obj;
        y2 y2Var = o1Var.zzc;
        y2 y2Var2 = ((o1) obj2).zzc;
        y2 y2Var3 = y2.f33241f;
        if (!y2Var3.equals(y2Var2)) {
            if (y2Var3.equals(y2Var)) {
                int i5 = y2Var.f33242a + y2Var2.f33242a;
                int[] iArrCopyOf = Arrays.copyOf(y2Var.f33243b, i5);
                System.arraycopy(y2Var2.f33243b, 0, iArrCopyOf, y2Var.f33242a, y2Var2.f33242a);
                Object[] objArrCopyOf = Arrays.copyOf(y2Var.f33244c, i5);
                System.arraycopy(y2Var2.f33244c, 0, objArrCopyOf, y2Var.f33242a, y2Var2.f33242a);
                y2Var = new y2(i5, iArrCopyOf, objArrCopyOf, true);
            } else {
                y2Var.getClass();
                if (!y2Var2.equals(y2Var3)) {
                    if (!y2Var.f33246e) {
                        throw new UnsupportedOperationException();
                    }
                    int i11 = y2Var.f33242a + y2Var2.f33242a;
                    y2Var.e(i11);
                    System.arraycopy(y2Var2.f33243b, 0, y2Var.f33243b, y2Var.f33242a, y2Var2.f33242a);
                    System.arraycopy(y2Var2.f33244c, 0, y2Var.f33244c, y2Var.f33242a, y2Var2.f33242a);
                    y2Var.f33242a = i11;
                }
            }
        }
        o1Var.zzc = y2Var;
    }

    public static Object c(Object obj, int i5, y1 y1Var, r1 r1Var, Object obj2, k1 k1Var) {
        if (r1Var == null) {
            return obj2;
        }
        if (y1Var == null) {
            Iterator it = y1Var.iterator();
            while (it.hasNext()) {
                int iIntValue = ((Integer) it.next()).intValue();
                if (!r1Var.zza(iIntValue)) {
                    if (obj2 == null) {
                        k1Var.getClass();
                        obj2 = k1.d(obj);
                    }
                    k1Var.getClass();
                    ((y2) obj2).d(i5 << 3, Long.valueOf(iIntValue));
                    it.remove();
                }
            }
            return obj2;
        }
        int size = y1Var.size();
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            Integer num = (Integer) y1Var.get(i12);
            int iIntValue2 = num.intValue();
            if (r1Var.zza(iIntValue2)) {
                if (i12 != i11) {
                    y1Var.set(i11, num);
                }
                i11++;
            } else {
                if (obj2 == null) {
                    k1Var.getClass();
                    obj2 = k1.d(obj);
                }
                k1Var.getClass();
                ((y2) obj2).d(i5 << 3, Long.valueOf(iIntValue2));
            }
        }
        if (i11 != size) {
            y1Var.subList(i11, size).clear();
        }
        return obj2;
    }

    public static void d(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        if (list instanceof d1) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                c1Var.w(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Double) list.get(i13)).getClass();
            i12 += 8;
        }
        c1Var.F(i12);
        while (i11 < list.size()) {
            c1Var.I(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
            i11++;
        }
    }

    public static void e(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        if (list instanceof i1) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                c1Var.u(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Float) list.get(i13)).getClass();
            i12 += 4;
        }
        c1Var.F(i12);
        while (i11 < list.size()) {
            c1Var.G(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
            i11++;
        }
    }

    public static void f(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof c2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.v(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iQ = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iQ += c1.q(((Long) list.get(i12)).longValue());
            }
            c1Var.F(iQ);
            while (i11 < list.size()) {
                c1Var.H(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        c2 c2Var = (c2) list;
        if (!z11) {
            while (i11 < c2Var.f32422c) {
                c1Var.v(i5, c2Var.e(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iQ2 = 0;
        for (int i13 = 0; i13 < c2Var.f32422c; i13++) {
            iQ2 += c1.q(c2Var.e(i13));
        }
        c1Var.F(iQ2);
        while (i11 < c2Var.f32422c) {
            c1Var.H(c2Var.e(i11));
            i11++;
        }
    }

    public static void g(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof c2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.v(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iQ = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iQ += c1.q(((Long) list.get(i12)).longValue());
            }
            c1Var.F(iQ);
            while (i11 < list.size()) {
                c1Var.H(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        c2 c2Var = (c2) list;
        if (!z11) {
            while (i11 < c2Var.f32422c) {
                c1Var.v(i5, c2Var.e(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iQ2 = 0;
        for (int i13 = 0; i13 < c2Var.f32422c; i13++) {
            iQ2 += c1.q(c2Var.e(i13));
        }
        c1Var.F(iQ2);
        while (i11 < c2Var.f32422c) {
            c1Var.H(c2Var.e(i11));
            i11++;
        }
    }

    public static void h(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof c2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    long jLongValue = ((Long) list.get(i11)).longValue();
                    c1Var.v(i5, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iQ = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                long jLongValue2 = ((Long) list.get(i12)).longValue();
                iQ += c1.q((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
            }
            c1Var.F(iQ);
            while (i11 < list.size()) {
                long jLongValue3 = ((Long) list.get(i11)).longValue();
                c1Var.H((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
                i11++;
            }
            return;
        }
        c2 c2Var = (c2) list;
        if (!z11) {
            while (i11 < c2Var.f32422c) {
                long jE = c2Var.e(i11);
                c1Var.v(i5, (jE >> 63) ^ (jE + jE));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iQ2 = 0;
        for (int i13 = 0; i13 < c2Var.f32422c; i13++) {
            long jE2 = c2Var.e(i13);
            iQ2 += c1.q((jE2 >> 63) ^ (jE2 + jE2));
        }
        c1Var.F(iQ2);
        while (i11 < c2Var.f32422c) {
            long jE3 = c2Var.e(i11);
            c1Var.H((jE3 >> 63) ^ (jE3 + jE3));
            i11++;
        }
    }

    public static void i(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof c2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.w(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                i12 += 8;
            }
            c1Var.F(i12);
            while (i11 < list.size()) {
                c1Var.I(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        c2 c2Var = (c2) list;
        if (!z11) {
            while (i11 < c2Var.f32422c) {
                c1Var.w(i5, c2Var.e(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < c2Var.f32422c; i15++) {
            c2Var.e(i15);
            i14 += 8;
        }
        c1Var.F(i14);
        while (i11 < c2Var.f32422c) {
            c1Var.I(c2Var.e(i11));
            i11++;
        }
    }

    public static void j(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof c2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.w(i5, ((Long) list.get(i11)).longValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Long) list.get(i13)).getClass();
                i12 += 8;
            }
            c1Var.F(i12);
            while (i11 < list.size()) {
                c1Var.I(((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        c2 c2Var = (c2) list;
        if (!z11) {
            while (i11 < c2Var.f32422c) {
                c1Var.w(i5, c2Var.e(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < c2Var.f32422c; i15++) {
            c2Var.e(i15);
            i14 += 8;
        }
        c1Var.F(i14);
        while (i11 < c2Var.f32422c) {
            c1Var.I(c2Var.e(i11));
            i11++;
        }
    }

    public static void k(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.s(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iQ = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iQ += c1.q(((Integer) list.get(i12)).intValue());
            }
            c1Var.F(iQ);
            while (i11 < list.size()) {
                c1Var.E(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                c1Var.s(i5, p1Var.f(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iQ2 = 0;
        for (int i13 = 0; i13 < p1Var.f32948c; i13++) {
            iQ2 += c1.q(p1Var.f(i13));
        }
        c1Var.F(iQ2);
        while (i11 < p1Var.f32948c) {
            c1Var.E(p1Var.f(i11));
            i11++;
        }
    }

    public static void l(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.t(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iP = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iP += c1.p(((Integer) list.get(i12)).intValue());
            }
            c1Var.F(iP);
            while (i11 < list.size()) {
                c1Var.F(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                c1Var.t(i5, p1Var.f(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iP2 = 0;
        for (int i13 = 0; i13 < p1Var.f32948c; i13++) {
            iP2 += c1.p(p1Var.f(i13));
        }
        c1Var.F(iP2);
        while (i11 < p1Var.f32948c) {
            c1Var.F(p1Var.f(i11));
            i11++;
        }
    }

    public static void m(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    int iIntValue = ((Integer) list.get(i11)).intValue();
                    c1Var.t(i5, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iP = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                int iIntValue2 = ((Integer) list.get(i12)).intValue();
                iP += c1.p((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
            }
            c1Var.F(iP);
            while (i11 < list.size()) {
                int iIntValue3 = ((Integer) list.get(i11)).intValue();
                c1Var.F((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                int iF = p1Var.f(i11);
                c1Var.t(i5, (iF >> 31) ^ (iF + iF));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iP2 = 0;
        for (int i13 = 0; i13 < p1Var.f32948c; i13++) {
            int iF2 = p1Var.f(i13);
            iP2 += c1.p((iF2 >> 31) ^ (iF2 + iF2));
        }
        c1Var.F(iP2);
        while (i11 < p1Var.f32948c) {
            int iF3 = p1Var.f(i11);
            c1Var.F((iF3 >> 31) ^ (iF3 + iF3));
            i11++;
        }
    }

    public static void n(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.u(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            c1Var.F(i12);
            while (i11 < list.size()) {
                c1Var.G(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                c1Var.u(i5, p1Var.f(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < p1Var.f32948c; i15++) {
            p1Var.f(i15);
            i14 += 4;
        }
        c1Var.F(i14);
        while (i11 < p1Var.f32948c) {
            c1Var.G(p1Var.f(i11));
            i11++;
        }
    }

    public static void o(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.u(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            c1Var.F(i12);
            while (i11 < list.size()) {
                c1Var.G(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                c1Var.u(i5, p1Var.f(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < p1Var.f32948c; i15++) {
            p1Var.f(i15);
            i14 += 4;
        }
        c1Var.F(i14);
        while (i11 < p1Var.f32948c) {
            c1Var.G(p1Var.f(i11));
            i11++;
        }
    }

    public static void p(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        int i11 = 0;
        if (!(list instanceof p1)) {
            if (!z11) {
                while (i11 < list.size()) {
                    c1Var.s(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            c1Var.r(i5, 2);
            int iQ = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iQ += c1.q(((Integer) list.get(i12)).intValue());
            }
            c1Var.F(iQ);
            while (i11 < list.size()) {
                c1Var.E(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        p1 p1Var = (p1) list;
        if (!z11) {
            while (i11 < p1Var.f32948c) {
                c1Var.s(i5, p1Var.f(i11));
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int iQ2 = 0;
        for (int i13 = 0; i13 < p1Var.f32948c; i13++) {
            iQ2 += c1.q(p1Var.f(i13));
        }
        c1Var.F(iQ2);
        while (i11 < p1Var.f32948c) {
            c1Var.E(p1Var.f(i11));
            i11++;
        }
    }

    public static void q(int i5, List list, d2 d2Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        c1 c1Var = (c1) d2Var.f32451b;
        if (list instanceof r0) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                c1Var.x(i5, ((Boolean) list.get(i11)).booleanValue());
                i11++;
            }
            return;
        }
        c1Var.r(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Boolean) list.get(i13)).getClass();
            i12++;
        }
        c1Var.F(i12);
        while (i11 < list.size()) {
            c1Var.D(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public static int r(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof c2)) {
            int iQ = 0;
            while (i5 < size) {
                iQ += c1.q(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iQ;
        }
        c2 c2Var = (c2) list;
        int iQ2 = 0;
        while (i5 < size) {
            iQ2 += c1.q(c2Var.e(i5));
            i5++;
        }
        return iQ2;
    }

    public static int s(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof c2)) {
            int iQ = 0;
            while (i5 < size) {
                iQ += c1.q(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iQ;
        }
        c2 c2Var = (c2) list;
        int iQ2 = 0;
        while (i5 < size) {
            iQ2 += c1.q(c2Var.e(i5));
            i5++;
        }
        return iQ2;
    }

    public static int t(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof c2)) {
            int iQ = 0;
            while (i5 < size) {
                long jLongValue = ((Long) list.get(i5)).longValue();
                iQ += c1.q((jLongValue >> 63) ^ (jLongValue + jLongValue));
                i5++;
            }
            return iQ;
        }
        c2 c2Var = (c2) list;
        int iQ2 = 0;
        while (i5 < size) {
            long jE = c2Var.e(i5);
            iQ2 += c1.q((jE >> 63) ^ (jE + jE));
            i5++;
        }
        return iQ2;
    }

    public static int u(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof p1)) {
            int iQ = 0;
            while (i5 < size) {
                iQ += c1.q(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iQ;
        }
        p1 p1Var = (p1) list;
        int iQ2 = 0;
        while (i5 < size) {
            iQ2 += c1.q(p1Var.f(i5));
            i5++;
        }
        return iQ2;
    }

    public static int v(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof p1)) {
            int iQ = 0;
            while (i5 < size) {
                iQ += c1.q(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iQ;
        }
        p1 p1Var = (p1) list;
        int iQ2 = 0;
        while (i5 < size) {
            iQ2 += c1.q(p1Var.f(i5));
            i5++;
        }
        return iQ2;
    }

    public static int w(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof p1)) {
            int iP = 0;
            while (i5 < size) {
                iP += c1.p(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iP;
        }
        p1 p1Var = (p1) list;
        int iP2 = 0;
        while (i5 < size) {
            iP2 += c1.p(p1Var.f(i5));
            i5++;
        }
        return iP2;
    }

    public static int x(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof p1)) {
            int iP = 0;
            while (i5 < size) {
                int iIntValue = ((Integer) list.get(i5)).intValue();
                iP += c1.p((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i5++;
            }
            return iP;
        }
        p1 p1Var = (p1) list;
        int iP2 = 0;
        while (i5 < size) {
            int iF = p1Var.f(i5);
            iP2 += c1.p((iF >> 31) ^ (iF + iF));
            i5++;
        }
        return iP2;
    }

    public static int y(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (c1.p(i5 << 3) + 4) * size;
    }

    public static int z(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (c1.p(i5 << 3) + 8) * size;
    }
}
