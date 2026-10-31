package com.google.android.gms.internal.play_billing;

import java.util.Arrays;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class y3 {

    /* renamed from: a, reason: collision with root package name */
    public static final u2 f33663a;

    static {
        int i5 = i2.f33421a;
        f33663a = new u2(6);
    }

    public static void a(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j3) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.t0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        n2Var.A0(i12);
        while (i11 < list.size()) {
            n2Var.u0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void b(int i5, List list, k3 k3Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    int iIntValue = ((Integer) list.get(i11)).intValue();
                    n2Var.z0(i5, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int iD0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                int iIntValue2 = ((Integer) list.get(i12)).intValue();
                iD0 += n2.D0((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
            }
            n2Var.A0(iD0);
            while (i11 < list.size()) {
                int iIntValue3 = ((Integer) list.get(i11)).intValue();
                n2Var.A0((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                int iD = y2Var.d(i11);
                n2Var.z0(i5, (iD >> 31) ^ (iD + iD));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iD02 = 0;
        for (int i13 = 0; i13 < y2Var.f33662c; i13++) {
            int iD2 = y2Var.d(i13);
            iD02 += n2.D0((iD2 >> 31) ^ (iD2 + iD2));
        }
        n2Var.A0(iD02);
        while (i11 < y2Var.f33662c) {
            int iD3 = y2Var.d(i11);
            n2Var.A0((iD3 >> 31) ^ (iD3 + iD3));
            i11++;
        }
    }

    public static void c(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j3) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                long jLongValue = ((Long) list.get(i11)).longValue();
                n2Var.B0(i5, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iE0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            long jLongValue2 = ((Long) list.get(i12)).longValue();
            iE0 += n2.E0((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
        }
        n2Var.A0(iE0);
        while (i11 < list.size()) {
            long jLongValue3 = ((Long) list.get(i11)).longValue();
            n2Var.C0((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
            i11++;
        }
    }

    public static void d(int i5, List list, k3 k3Var, boolean z11) {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    n2Var.z0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int iD0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iD0 += n2.D0(((Integer) list.get(i12)).intValue());
            }
            n2Var.A0(iD0);
            while (i11 < list.size()) {
                n2Var.A0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                n2Var.z0(i5, y2Var.d(i11));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iD02 = 0;
        for (int i13 = 0; i13 < y2Var.f33662c; i13++) {
            iD02 += n2.D0(y2Var.d(i13));
        }
        n2Var.A0(iD02);
        while (i11 < y2Var.f33662c) {
            n2Var.A0(y2Var.d(i11));
            i11++;
        }
    }

    public static void e(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j3) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.B0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iE0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iE0 += n2.E0(((Long) list.get(i12)).longValue());
        }
        n2Var.A0(iE0);
        while (i11 < list.size()) {
            n2Var.C0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static boolean f(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static int g(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y2)) {
            int iE0 = 0;
            while (i5 < size) {
                iE0 += n2.E0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iE0;
        }
        y2 y2Var = (y2) list;
        int iE02 = 0;
        while (i5 < size) {
            iE02 += n2.E0(y2Var.d(i5));
            i5++;
        }
        return iE02;
    }

    public static int h(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (n2.D0(i5 << 3) + 4) * size;
    }

    public static int i(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (n2.D0(i5 << 3) + 8) * size;
    }

    public static int j(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y2)) {
            int iE0 = 0;
            while (i5 < size) {
                iE0 += n2.E0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iE0;
        }
        y2 y2Var = (y2) list;
        int iE02 = 0;
        while (i5 < size) {
            iE02 += n2.E0(y2Var.d(i5));
            i5++;
        }
        return iE02;
    }

    public static int k(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof j3) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iE0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iE0 += n2.E0(((Long) list.get(i5)).longValue());
        }
        return iE0;
    }

    public static int l(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y2)) {
            int iD0 = 0;
            while (i5 < size) {
                int iIntValue = ((Integer) list.get(i5)).intValue();
                iD0 += n2.D0((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i5++;
            }
            return iD0;
        }
        y2 y2Var = (y2) list;
        int iD02 = 0;
        while (i5 < size) {
            int iD = y2Var.d(i5);
            iD02 += n2.D0((iD >> 31) ^ (iD + iD));
            i5++;
        }
        return iD02;
    }

    public static int m(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof j3) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iE0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            long jLongValue = ((Long) list.get(i5)).longValue();
            iE0 += n2.E0((jLongValue >> 63) ^ (jLongValue + jLongValue));
        }
        return iE0;
    }

    public static int n(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y2)) {
            int iD0 = 0;
            while (i5 < size) {
                iD0 += n2.D0(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iD0;
        }
        y2 y2Var = (y2) list;
        int iD02 = 0;
        while (i5 < size) {
            iD02 += n2.D0(y2Var.d(i5));
            i5++;
        }
        return iD02;
    }

    public static int o(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof j3) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iE0 = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iE0 += n2.E0(((Long) list.get(i5)).longValue());
        }
        return iE0;
    }

    public static void p(Object obj, Object obj2) {
        x2 x2Var = (x2) obj;
        e4 e4Var = x2Var.zzc;
        e4 e4Var2 = ((x2) obj2).zzc;
        e4 e4Var3 = e4.f33387f;
        if (!e4Var3.equals(e4Var2)) {
            if (e4Var3.equals(e4Var)) {
                int i5 = e4Var.f33388a + e4Var2.f33388a;
                int[] iArrCopyOf = Arrays.copyOf(e4Var.f33389b, i5);
                System.arraycopy(e4Var2.f33389b, 0, iArrCopyOf, e4Var.f33388a, e4Var2.f33388a);
                Object[] objArrCopyOf = Arrays.copyOf(e4Var.f33390c, i5);
                System.arraycopy(e4Var2.f33390c, 0, objArrCopyOf, e4Var.f33388a, e4Var2.f33388a);
                e4Var = new e4(i5, iArrCopyOf, objArrCopyOf, true);
            } else {
                e4Var.getClass();
                if (!e4Var2.equals(e4Var3)) {
                    if (!e4Var.f33392e) {
                        throw new UnsupportedOperationException();
                    }
                    int i11 = e4Var.f33388a + e4Var2.f33388a;
                    e4Var.e(i11);
                    System.arraycopy(e4Var2.f33389b, 0, e4Var.f33389b, e4Var.f33388a, e4Var2.f33388a);
                    System.arraycopy(e4Var2.f33390c, 0, e4Var.f33390c, e4Var.f33388a, e4Var2.f33388a);
                    e4Var.f33388a = i11;
                }
            }
        }
        x2Var.zzc = e4Var;
    }

    public static void q(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j2) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                boolean zBooleanValue = ((Boolean) list.get(i11)).booleanValue();
                n2Var.A0(i5 << 3);
                n2Var.o0(zBooleanValue ? (byte) 1 : (byte) 0);
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Boolean) list.get(i13)).getClass();
            i12++;
        }
        n2Var.A0(i12);
        while (i11 < list.size()) {
            n2Var.o0(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public static void r(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof o2) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.t0(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Double) list.get(i13)).getClass();
            i12 += 8;
        }
        n2Var.A0(i12);
        while (i11 < list.size()) {
            n2Var.u0(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
            i11++;
        }
    }

    public static void s(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    n2Var.v0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int iE0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iE0 += n2.E0(((Integer) list.get(i12)).intValue());
            }
            n2Var.A0(iE0);
            while (i11 < list.size()) {
                n2Var.w0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                n2Var.v0(i5, y2Var.d(i11));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iE02 = 0;
        for (int i13 = 0; i13 < y2Var.f33662c; i13++) {
            iE02 += n2.E0(y2Var.d(i13));
        }
        n2Var.A0(iE02);
        while (i11 < y2Var.f33662c) {
            n2Var.w0(y2Var.d(i11));
            i11++;
        }
    }

    public static void t(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    n2Var.r0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            n2Var.A0(i12);
            while (i11 < list.size()) {
                n2Var.s0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                n2Var.r0(i5, y2Var.d(i11));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < y2Var.f33662c; i15++) {
            y2Var.d(i15);
            i14 += 4;
        }
        n2Var.A0(i14);
        while (i11 < y2Var.f33662c) {
            n2Var.s0(y2Var.d(i11));
            i11++;
        }
    }

    public static void u(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j3) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.t0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        n2Var.A0(i12);
        while (i11 < list.size()) {
            n2Var.u0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void v(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof t2) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.r0(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Float) list.get(i13)).getClass();
            i12 += 4;
        }
        n2Var.A0(i12);
        while (i11 < list.size()) {
            n2Var.s0(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
            i11++;
        }
    }

    public static void w(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    n2Var.v0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int iE0 = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iE0 += n2.E0(((Integer) list.get(i12)).intValue());
            }
            n2Var.A0(iE0);
            while (i11 < list.size()) {
                n2Var.w0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                n2Var.v0(i5, y2Var.d(i11));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iE02 = 0;
        for (int i13 = 0; i13 < y2Var.f33662c; i13++) {
            iE02 += n2.E0(y2Var.d(i13));
        }
        n2Var.A0(iE02);
        while (i11 < y2Var.f33662c) {
            n2Var.w0(y2Var.d(i11));
            i11++;
        }
    }

    public static void x(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        if (list instanceof j3) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                n2Var.B0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int iE0 = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iE0 += n2.E0(((Long) list.get(i12)).longValue());
        }
        n2Var.A0(iE0);
        while (i11 < list.size()) {
            n2Var.C0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void y(int i5, List list, k3 k3Var, boolean z11) throws zzfa {
        if (list == null || list.isEmpty()) {
            return;
        }
        n2 n2Var = (n2) k3Var.f33440a;
        int i11 = 0;
        if (!(list instanceof y2)) {
            if (!z11) {
                while (i11 < list.size()) {
                    n2Var.r0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            n2Var.y0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            n2Var.A0(i12);
            while (i11 < list.size()) {
                n2Var.s0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y2 y2Var = (y2) list;
        if (!z11) {
            while (i11 < y2Var.f33662c) {
                n2Var.r0(i5, y2Var.d(i11));
                i11++;
            }
            return;
        }
        n2Var.y0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < y2Var.f33662c; i15++) {
            y2Var.d(i15);
            i14 += 4;
        }
        n2Var.A0(i14);
        while (i11 < y2Var.f33662c) {
            n2Var.s0(y2Var.d(i11));
            i11++;
        }
    }
}
