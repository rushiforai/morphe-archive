package com.google.android.gms.internal.consent_sdk;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class u6 {

    /* renamed from: a, reason: collision with root package name */
    public static final z6 f32258a;

    static {
        int i5 = k5.f32121a;
        f32258a = new z6();
    }

    public static void a(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    int iIntValue = ((Integer) list.get(i11)).intValue();
                    o5Var.o0(i5, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int iW = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                int iIntValue2 = ((Integer) list.get(i12)).intValue();
                iW += o5.W((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
            }
            o5Var.p0(iW);
            while (i11 < list.size()) {
                int iIntValue3 = ((Integer) list.get(i11)).intValue();
                o5Var.p0((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                int iD = y5Var.d(i11);
                o5Var.o0(i5, (iD >> 31) ^ (iD + iD));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iW2 = 0;
        for (int i13 = 0; i13 < y5Var.f32320c; i13++) {
            int iD2 = y5Var.d(i13);
            iW2 += o5.W((iD2 >> 31) ^ (iD2 + iD2));
        }
        o5Var.p0(iW2);
        while (i11 < y5Var.f32320c) {
            int iD3 = y5Var.d(i11);
            o5Var.p0((iD3 >> 31) ^ (iD3 + iD3));
            i11++;
        }
    }

    public static void b(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof g6) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                long jLongValue = ((Long) list.get(i11)).longValue();
                o5Var.q0(i5, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iX = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            long jLongValue2 = ((Long) list.get(i12)).longValue();
            iX += o5.X((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
        }
        o5Var.p0(iX);
        while (i11 < list.size()) {
            long jLongValue3 = ((Long) list.get(i11)).longValue();
            o5Var.r0((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
            i11++;
        }
    }

    public static void c(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    o5Var.o0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int iW = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iW += o5.W(((Integer) list.get(i12)).intValue());
            }
            o5Var.p0(iW);
            while (i11 < list.size()) {
                o5Var.p0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                o5Var.o0(i5, y5Var.d(i11));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iW2 = 0;
        for (int i13 = 0; i13 < y5Var.f32320c; i13++) {
            iW2 += o5.W(y5Var.d(i13));
        }
        o5Var.p0(iW2);
        while (i11 < y5Var.f32320c) {
            o5Var.p0(y5Var.d(i11));
            i11++;
        }
    }

    public static void d(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof g6) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.q0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iX = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iX += o5.X(((Long) list.get(i12)).longValue());
        }
        o5Var.p0(iX);
        while (i11 < list.size()) {
            o5Var.r0(((Long) list.get(i11)).longValue());
            i11++;
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
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y5)) {
            int iX = 0;
            while (i5 < size) {
                iX += o5.X(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iX;
        }
        y5 y5Var = (y5) list;
        int iX2 = 0;
        while (i5 < size) {
            iX2 += o5.X(y5Var.d(i5));
            i5++;
        }
        return iX2;
    }

    public static int g(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (o5.W(i5 << 3) + 4) * size;
    }

    public static int h(int i5, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (o5.W(i5 << 3) + 8) * size;
    }

    public static int i(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y5)) {
            int iX = 0;
            while (i5 < size) {
                iX += o5.X(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iX;
        }
        y5 y5Var = (y5) list;
        int iX2 = 0;
        while (i5 < size) {
            iX2 += o5.X(y5Var.d(i5));
            i5++;
        }
        return iX2;
    }

    public static int j(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof g6) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iX = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iX += o5.X(((Long) list.get(i5)).longValue());
        }
        return iX;
    }

    public static int k(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y5)) {
            int iW = 0;
            while (i5 < size) {
                int iIntValue = ((Integer) list.get(i5)).intValue();
                iW += o5.W((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i5++;
            }
            return iW;
        }
        y5 y5Var = (y5) list;
        int iW2 = 0;
        while (i5 < size) {
            int iD = y5Var.d(i5);
            iW2 += o5.W((iD >> 31) ^ (iD + iD));
            i5++;
        }
        return iW2;
    }

    public static int l(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof g6) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iX = 0;
        for (int i5 = 0; i5 < size; i5++) {
            long jLongValue = ((Long) list.get(i5)).longValue();
            iX += o5.X((jLongValue >> 63) ^ (jLongValue + jLongValue));
        }
        return iX;
    }

    public static int m(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof y5)) {
            int iW = 0;
            while (i5 < size) {
                iW += o5.W(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iW;
        }
        y5 y5Var = (y5) list;
        int iW2 = 0;
        while (i5 < size) {
            iW2 += o5.W(y5Var.d(i5));
            i5++;
        }
        return iW2;
    }

    public static int n(List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        if (list instanceof g6) {
            if (size <= 0) {
                return 0;
            }
            throw null;
        }
        int iX = 0;
        for (int i5 = 0; i5 < size; i5++) {
            iX += o5.X(((Long) list.get(i5)).longValue());
        }
        return iX;
    }

    public static void o(Object obj, Object obj2) {
        x5 x5Var = (x5) obj;
        y6 y6Var = x5Var.zzc;
        y6 y6Var2 = ((x5) obj2).zzc;
        y6 y6Var3 = y6.f32321e;
        if (!y6Var3.equals(y6Var2)) {
            if (y6Var3.equals(y6Var)) {
                y6Var.getClass();
                y6Var2.getClass();
                int[] iArrCopyOf = Arrays.copyOf(y6Var.f32322a, 0);
                System.arraycopy(y6Var2.f32322a, 0, iArrCopyOf, 0, 0);
                Object[] objArrCopyOf = Arrays.copyOf(y6Var.f32323b, 0);
                System.arraycopy(y6Var2.f32323b, 0, objArrCopyOf, 0, 0);
                y6Var = new y6(iArrCopyOf, objArrCopyOf, true);
            } else {
                y6Var.getClass();
                if (!y6Var2.equals(y6Var3)) {
                    if (!y6Var.f32325d) {
                        throw new UnsupportedOperationException();
                    }
                    int[] iArr = y6Var.f32322a;
                    int length = iArr.length;
                    System.arraycopy(y6Var2.f32322a, 0, iArr, 0, 0);
                    System.arraycopy(y6Var2.f32323b, 0, y6Var.f32323b, 0, 0);
                }
            }
        }
        x5Var.zzc = y6Var;
    }

    public static void p(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof l5) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                byte bBooleanValue = ((Boolean) list.get(i11)).booleanValue();
                o5Var.Z(11);
                o5Var.c0(i5 << 3);
                byte[] bArr = o5Var.f32200e;
                int i12 = o5Var.f32202g;
                bArr[i12] = bBooleanValue;
                o5Var.f32202g = i12 + 1;
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i13 = 0;
        for (int i14 = 0; i14 < list.size(); i14++) {
            ((Boolean) list.get(i14)).getClass();
            i13++;
        }
        o5Var.p0(i13);
        while (i11 < list.size()) {
            byte bBooleanValue2 = ((Boolean) list.get(i11)).booleanValue();
            if (o5Var.f32202g == o5Var.f32201f) {
                o5Var.Y();
            }
            byte[] bArr2 = o5Var.f32200e;
            int i15 = o5Var.f32202g;
            bArr2[i15] = bBooleanValue2;
            o5Var.f32202g = i15 + 1;
            i11++;
        }
    }

    public static void q(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof p5) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.i0(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Double) list.get(i13)).getClass();
            i12 += 8;
        }
        o5Var.p0(i12);
        while (i11 < list.size()) {
            o5Var.j0(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
            i11++;
        }
    }

    public static void r(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    o5Var.k0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int iX = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iX += o5.X(((Integer) list.get(i12)).intValue());
            }
            o5Var.p0(iX);
            while (i11 < list.size()) {
                o5Var.l0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                o5Var.k0(i5, y5Var.d(i11));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iX2 = 0;
        for (int i13 = 0; i13 < y5Var.f32320c; i13++) {
            iX2 += o5.X(y5Var.d(i13));
        }
        o5Var.p0(iX2);
        while (i11 < y5Var.f32320c) {
            o5Var.l0(y5Var.d(i11));
            i11++;
        }
    }

    public static void s(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    o5Var.g0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            o5Var.p0(i12);
            while (i11 < list.size()) {
                o5Var.h0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                o5Var.g0(i5, y5Var.d(i11));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < y5Var.f32320c; i15++) {
            y5Var.d(i15);
            i14 += 4;
        }
        o5Var.p0(i14);
        while (i11 < y5Var.f32320c) {
            o5Var.h0(y5Var.d(i11));
            i11++;
        }
    }

    public static void t(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof g6) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.i0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        o5Var.p0(i12);
        while (i11 < list.size()) {
            o5Var.j0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void u(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof u5) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.g0(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Float) list.get(i13)).getClass();
            i12 += 4;
        }
        o5Var.p0(i12);
        while (i11 < list.size()) {
            o5Var.h0(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
            i11++;
        }
    }

    public static void v(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    o5Var.k0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int iX = 0;
            for (int i12 = 0; i12 < list.size(); i12++) {
                iX += o5.X(((Integer) list.get(i12)).intValue());
            }
            o5Var.p0(iX);
            while (i11 < list.size()) {
                o5Var.l0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                o5Var.k0(i5, y5Var.d(i11));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iX2 = 0;
        for (int i13 = 0; i13 < y5Var.f32320c; i13++) {
            iX2 += o5.X(y5Var.d(i13));
        }
        o5Var.p0(iX2);
        while (i11 < y5Var.f32320c) {
            o5Var.l0(y5Var.d(i11));
            i11++;
        }
    }

    public static void w(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof g6) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.q0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int iX = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iX += o5.X(((Long) list.get(i12)).longValue());
        }
        o5Var.p0(iX);
        while (i11 < list.size()) {
            o5Var.r0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public static void x(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        int i11 = 0;
        if (!(list instanceof y5)) {
            if (!z11) {
                while (i11 < list.size()) {
                    o5Var.g0(i5, ((Integer) list.get(i11)).intValue());
                    i11++;
                }
                return;
            }
            o5Var.n0(i5, 2);
            int i12 = 0;
            for (int i13 = 0; i13 < list.size(); i13++) {
                ((Integer) list.get(i13)).getClass();
                i12 += 4;
            }
            o5Var.p0(i12);
            while (i11 < list.size()) {
                o5Var.h0(((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        y5 y5Var = (y5) list;
        if (!z11) {
            while (i11 < y5Var.f32320c) {
                o5Var.g0(i5, y5Var.d(i11));
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i14 = 0;
        for (int i15 = 0; i15 < y5Var.f32320c; i15++) {
            y5Var.d(i15);
            i14 += 4;
        }
        o5Var.p0(i14);
        while (i11 < y5Var.f32320c) {
            o5Var.h0(y5Var.d(i11));
            i11++;
        }
    }

    public static void y(int i5, List list, h6 h6Var, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        o5 o5Var = (o5) h6Var.f32089b;
        if (list instanceof g6) {
            throw new ClassCastException();
        }
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                o5Var.i0(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        o5Var.n0(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        o5Var.p0(i12);
        while (i11 < list.size()) {
            o5Var.j0(((Long) list.get(i11)).longValue());
            i11++;
        }
    }
}
