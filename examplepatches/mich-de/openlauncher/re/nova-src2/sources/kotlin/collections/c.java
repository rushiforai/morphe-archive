package kotlin.collections;

import ab.e0;
import b.c0;
import b70.k;
import bh.g;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.sequences.Sequence;

/* loaded from: classes.dex */
public abstract class c extends u90.b {
    public static IntRange A0(int[] iArr) {
        return new IntRange(0, iArr.length - 1, 1);
    }

    public static int B0(long[] jArr) {
        Intrinsics.g(jArr, "<this>");
        return jArr.length - 1;
    }

    public static int C0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        return objArr.length - 1;
    }

    public static Integer D0(int[] iArr, int i5) {
        Intrinsics.g(iArr, "<this>");
        if (i5 < 0 || i5 >= iArr.length) {
            return null;
        }
        return Integer.valueOf(iArr[i5]);
    }

    public static Object E0(int i5, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (i5 < 0 || i5 >= objArr.length) {
            return null;
        }
        return objArr[i5];
    }

    public static int F0(Object obj, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        int i5 = 0;
        if (obj == null) {
            int length = objArr.length;
            while (i5 < length) {
                if (objArr[i5] == null) {
                    return i5;
                }
                i5++;
            }
            return -1;
        }
        int length2 = objArr.length;
        while (i5 < length2) {
            if (obj.equals(objArr[i5])) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    public static int G0(byte[] bArr, byte b11) {
        Intrinsics.g(bArr, "<this>");
        int length = bArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (b11 == bArr[i5]) {
                return i5;
            }
        }
        return -1;
    }

    public static int H0(char[] cArr, char c11) {
        Intrinsics.g(cArr, "<this>");
        int length = cArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (c11 == cArr[i5]) {
                return i5;
            }
        }
        return -1;
    }

    public static int I0(int[] iArr, int i5) {
        Intrinsics.g(iArr, "<this>");
        int length = iArr.length;
        for (int i11 = 0; i11 < length; i11++) {
            if (i5 == iArr[i11]) {
                return i11;
            }
        }
        return -1;
    }

    public static int J0(long[] jArr, long j11) {
        Intrinsics.g(jArr, "<this>");
        int length = jArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (j11 == jArr[i5]) {
                return i5;
            }
        }
        return -1;
    }

    public static int K0(short[] sArr, short s11) {
        Intrinsics.g(sArr, "<this>");
        int length = sArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            if (s11 == sArr[i5]) {
                return i5;
            }
        }
        return -1;
    }

    public static final void L0(Object[] objArr, StringBuilder sb2, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, CharSequence charSequence4, Function1 function1) {
        Intrinsics.g(objArr, "<this>");
        sb2.append(charSequence2);
        int i5 = 0;
        for (Object obj : objArr) {
            i5++;
            if (i5 > 1) {
                sb2.append(charSequence);
            }
            g.B(sb2, obj, function1);
        }
        sb2.append(charSequence3);
    }

    public static String M0(byte[] bArr, String str, Function1 function1, int i5) {
        int i11 = i5 & 2;
        String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        String str3 = i11 != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : "[";
        if ((i5 & 4) == 0) {
            str2 = "]";
        }
        if ((i5 & 32) != 0) {
            function1 = null;
        }
        Intrinsics.g(bArr, "<this>");
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) str3);
        int i12 = 0;
        for (byte b11 : bArr) {
            i12++;
            if (i12 > 1) {
                sb2.append((CharSequence) str);
            }
            if (function1 != null) {
                sb2.append((CharSequence) function1.invoke(Byte.valueOf(b11)));
            } else {
                sb2.append((CharSequence) String.valueOf((int) b11));
            }
        }
        sb2.append((CharSequence) str2);
        return sb2.toString();
    }

    public static String N0(long[] jArr) {
        Intrinsics.g(jArr, "<this>");
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        int i5 = 0;
        for (long j11 : jArr) {
            i5++;
            if (i5 > 1) {
                sb2.append((CharSequence) ", ");
            }
            sb2.append((CharSequence) String.valueOf(j11));
        }
        sb2.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        return sb2.toString();
    }

    public static String O0(Object[] objArr, String str, String str2, String str3, Function1 function1, int i5) {
        if ((i5 & 1) != 0) {
            str = ", ";
        }
        String str4 = str;
        String str5 = (i5 & 2) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str2;
        String str6 = (i5 & 4) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str3;
        if ((i5 & 32) != 0) {
            function1 = null;
        }
        Intrinsics.g(objArr, "<this>");
        StringBuilder sb2 = new StringBuilder();
        L0(objArr, sb2, str4, str5, str6, "...", function1);
        return sb2.toString();
    }

    public static int P0(int[] iArr) {
        if (iArr.length != 0) {
            return iArr[iArr.length - 1];
        }
        throw new NoSuchElementException("Array is empty.");
    }

    public static Object Q0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (objArr.length != 0) {
            return objArr[objArr.length - 1];
        }
        throw new NoSuchElementException("Array is empty.");
    }

    public static Long R0(long[] jArr) {
        Intrinsics.g(jArr, "<this>");
        if (jArr.length == 0) {
            return null;
        }
        return Long.valueOf(jArr[jArr.length - 1]);
    }

    public static int S0(int[] iArr) {
        if (iArr.length == 0) {
            throw new NoSuchElementException();
        }
        int i5 = iArr[0];
        int i11 = 1;
        int length = iArr.length - 1;
        if (1 <= length) {
            while (true) {
                int i12 = iArr[i11];
                if (i5 < i12) {
                    i5 = i12;
                }
                if (i11 == length) {
                    break;
                }
                i11++;
            }
        }
        return i5;
    }

    public static char T0(char[] cArr) {
        Intrinsics.g(cArr, "<this>");
        int length = cArr.length;
        if (length == 0) {
            throw new NoSuchElementException("Array is empty.");
        }
        if (length == 1) {
            return cArr[0];
        }
        throw new IllegalArgumentException("Array has more than one element.");
    }

    public static Object U0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        int length = objArr.length;
        if (length == 0) {
            throw new NoSuchElementException("Array is empty.");
        }
        if (length == 1) {
            return objArr[0];
        }
        throw new IllegalArgumentException("Array has more than one element.");
    }

    public static List V0(long[] jArr) {
        Intrinsics.g(jArr, "<this>");
        Intrinsics.g(jArr, "<this>");
        Long[] lArr = new Long[jArr.length];
        int length = jArr.length;
        for (int i5 = 0; i5 < length; i5++) {
            lArr[i5] = Long.valueOf(jArr[i5]);
        }
        u90.b.e0(lArr);
        return u90.b.f(lArr);
    }

    public static List W0(Object[] objArr, Comparator comparator) {
        Intrinsics.g(objArr, "<this>");
        if (objArr.length != 0) {
            objArr = Arrays.copyOf(objArr, objArr.length);
            Intrinsics.f(objArr, "copyOf(...)");
            u90.b.f0(objArr, comparator);
        }
        return u90.b.f(objArr);
    }

    public static List X0(int i5, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        if (i5 == 0) {
            return EmptyList.f71733a;
        }
        if (i5 >= objArr.length) {
            return b1(objArr);
        }
        if (i5 == 1) {
            return ul.b.P(objArr[0]);
        }
        ArrayList arrayList = new ArrayList(i5);
        int i11 = 0;
        for (Object obj : objArr) {
            arrayList.add(obj);
            i11++;
            if (i11 == i5) {
                break;
            }
        }
        return arrayList;
    }

    public static List Y0(long[] jArr, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        if (i5 == 0) {
            return EmptyList.f71733a;
        }
        int length = jArr.length;
        if (i5 >= length) {
            return a1(jArr);
        }
        if (i5 == 1) {
            return ul.b.P(Long.valueOf(jArr[length - 1]));
        }
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = length - i5; i11 < length; i11++) {
            arrayList.add(Long.valueOf(jArr[i11]));
        }
        return arrayList;
    }

    public static final void Z0(Object[] objArr, HashSet hashSet) {
        Intrinsics.g(objArr, "<this>");
        for (Object obj : objArr) {
            hashSet.add(obj);
        }
    }

    public static List a1(long[] jArr) {
        Intrinsics.g(jArr, "<this>");
        int length = jArr.length;
        if (length == 0) {
            return EmptyList.f71733a;
        }
        if (length == 1) {
            return ul.b.P(Long.valueOf(jArr[0]));
        }
        ArrayList arrayList = new ArrayList(jArr.length);
        for (long j11 : jArr) {
            arrayList.add(Long.valueOf(j11));
        }
        return arrayList;
    }

    public static List b1(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        int length = objArr.length;
        return length != 0 ? length != 1 ? d1(objArr) : ul.b.P(objArr[0]) : EmptyList.f71733a;
    }

    public static List c1(boolean[] zArr) {
        Intrinsics.g(zArr, "<this>");
        int length = zArr.length;
        if (length == 0) {
            return EmptyList.f71733a;
        }
        if (length == 1) {
            return ul.b.P(Boolean.valueOf(zArr[0]));
        }
        ArrayList arrayList = new ArrayList(zArr.length);
        for (boolean z11 : zArr) {
            arrayList.add(Boolean.valueOf(z11));
        }
        return arrayList;
    }

    public static ArrayList d1(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        return new ArrayList(new b70.b(objArr, false));
    }

    public static Set e1(int[] iArr) {
        Intrinsics.g(iArr, "<this>");
        int length = iArr.length;
        if (length == 0) {
            return EmptySet.f71734a;
        }
        if (length == 1) {
            return e0.U(Integer.valueOf(iArr[0]));
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(k.d0(iArr.length));
        for (int i5 : iArr) {
            linkedHashSet.add(Integer.valueOf(i5));
        }
        return linkedHashSet;
    }

    public static Set f1(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        int length = objArr.length;
        if (length == 0) {
            return EmptySet.f71734a;
        }
        if (length == 1) {
            return e0.U(objArr[0]);
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(k.d0(objArr.length));
        Z0(objArr, linkedHashSet);
        return linkedHashSet;
    }

    public static ArrayList g1(Object[] objArr, Object[] other) {
        Intrinsics.g(objArr, "<this>");
        Intrinsics.g(other, "other");
        int iMin = Math.min(objArr.length, other.length);
        ArrayList arrayList = new ArrayList(iMin);
        for (int i5 = 0; i5 < iMin; i5++) {
            arrayList.add(new Pair(objArr[i5], other[i5]));
        }
        return arrayList;
    }

    public static Iterable m0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        return objArr.length == 0 ? EmptyList.f71733a : new ArraysKt___ArraysKt$asIterable$$inlined$Iterable$1(objArr);
    }

    public static Sequence n0(final Object[] objArr) {
        return objArr.length == 0 ? q70.a.f83782a : new Sequence<Object>() { // from class: kotlin.collections.ArraysKt___ArraysKt$asSequence$$inlined$Sequence$1
            @Override // kotlin.sequences.Sequence
            public final Iterator iterator() {
                return ArrayIteratorKt.a(objArr);
            }
        };
    }

    public static boolean o0(Object obj, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        return F0(obj, objArr) >= 0;
    }

    public static boolean p0(byte[] bArr, byte b11) {
        Intrinsics.g(bArr, "<this>");
        return G0(bArr, b11) >= 0;
    }

    public static boolean q0(char[] cArr, char c11) {
        Intrinsics.g(cArr, "<this>");
        return H0(cArr, c11) >= 0;
    }

    public static boolean r0(int[] iArr, int i5) {
        Intrinsics.g(iArr, "<this>");
        return I0(iArr, i5) >= 0;
    }

    public static boolean s0(long[] jArr, long j11) {
        Intrinsics.g(jArr, "<this>");
        return J0(jArr, j11) >= 0;
    }

    public static boolean t0(short[] sArr, short s11) {
        Intrinsics.g(sArr, "<this>");
        return K0(sArr, s11) >= 0;
    }

    public static List u0(int i5, Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested element count ", " is less than zero.").toString());
        }
        int length = objArr.length - i5;
        if (length < 0) {
            length = 0;
        }
        if (length < 0) {
            throw new IllegalArgumentException(c0.i(length, "Requested element count ", " is less than zero.").toString());
        }
        if (length == 0) {
            return EmptyList.f71733a;
        }
        int length2 = objArr.length;
        if (length >= length2) {
            return b1(objArr);
        }
        if (length == 1) {
            return ul.b.P(objArr[length2 - 1]);
        }
        ArrayList arrayList = new ArrayList(length);
        for (int i11 = length2 - length; i11 < length2; i11++) {
            arrayList.add(objArr[i11]);
        }
        return arrayList;
    }

    public static List v0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        ArrayList arrayList = new ArrayList();
        for (Object obj : objArr) {
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static int w0(int[] iArr) {
        if (iArr.length != 0) {
            return iArr[0];
        }
        throw new NoSuchElementException("Array is empty.");
    }

    public static Object x0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (objArr.length != 0) {
            return objArr[0];
        }
        throw new NoSuchElementException("Array is empty.");
    }

    public static Integer y0(int[] iArr) {
        Intrinsics.g(iArr, "<this>");
        if (iArr.length == 0) {
            return null;
        }
        return Integer.valueOf(iArr[0]);
    }

    public static Object z0(Object[] objArr) {
        Intrinsics.g(objArr, "<this>");
        if (objArr.length == 0) {
            return null;
        }
        return objArr[0];
    }
}
