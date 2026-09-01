package defpackage;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class k80 extends hlg {
    public static int A0(Object obj, Object[] objArr) {
        objArr.getClass();
        int i = 0;
        if (obj == null) {
            int length = objArr.length;
            while (i < length) {
                if (objArr[i] == null) {
                    return i;
                }
                i++;
            }
            return -1;
        }
        int length2 = objArr.length;
        while (i < length2) {
            if (obj.equals(objArr[i])) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public static final void B0(Object[] objArr, StringBuilder sb, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, CharSequence charSequence4, x45 x45Var) {
        objArr.getClass();
        sb.append(charSequence2);
        int i = 0;
        for (Object obj : objArr) {
            i++;
            if (i > 1) {
                sb.append(charSequence);
            }
            yo7.o(sb, obj, x45Var);
        }
        sb.append(charSequence3);
    }

    public static String C0(byte[] bArr, String str, int i) {
        ox8 ox8Var = ox8.i;
        String str2 = (i & 2) != 0 ? "" : "[";
        String str3 = (i & 4) == 0 ? "]" : "";
        if ((i & 32) != 0) {
            ox8Var = null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append((CharSequence) str2);
        int i2 = 0;
        for (byte b : bArr) {
            i2++;
            if (i2 > 1) {
                sb.append((CharSequence) str);
            }
            if (ox8Var != null) {
                sb.append((CharSequence) ox8Var.invoke(Byte.valueOf(b)));
            } else {
                sb.append((CharSequence) String.valueOf((int) b));
            }
        }
        sb.append((CharSequence) str3);
        return sb.toString();
    }

    public static String D0(Object[] objArr, String str, String str2, String str3, x45 x45Var, int i) {
        if ((i & 1) != 0) {
            str = ", ";
        }
        String str4 = str;
        String str5 = (i & 2) != 0 ? "" : str2;
        String str6 = (i & 4) != 0 ? "" : str3;
        if ((i & 32) != 0) {
            x45Var = null;
        }
        objArr.getClass();
        StringBuilder sb = new StringBuilder();
        B0(objArr, sb, str4, str5, str6, "...", x45Var);
        return sb.toString();
    }

    public static Object E0(Object[] objArr) {
        objArr.getClass();
        if (objArr.length != 0) {
            return objArr[objArr.length - 1];
        }
        ywb.h("Array is empty.");
        return null;
    }

    public static int F0(Object obj, Object[] objArr) {
        if (obj == null) {
            int length = objArr.length - 1;
            if (length >= 0) {
                while (true) {
                    int i = length - 1;
                    if (objArr[length] == null) {
                        return length;
                    }
                    if (i < 0) {
                        break;
                    }
                    length = i;
                }
            }
        } else {
            int length2 = objArr.length - 1;
            if (length2 >= 0) {
                while (true) {
                    int i2 = length2 - 1;
                    if (obj.equals(objArr[length2])) {
                        return length2;
                    }
                    if (i2 < 0) {
                        break;
                    }
                    length2 = i2;
                }
            }
        }
        return -1;
    }

    public static Float G0(float[] fArr) {
        fArr.getClass();
        if (fArr.length == 0) {
            return null;
        }
        return Float.valueOf(fArr[fArr.length - 1]);
    }

    public static int H0(int[] iArr) {
        if (iArr.length == 0) {
            ywb.n();
            return 0;
        }
        int i = iArr[0];
        int i2 = 1;
        int length = iArr.length - 1;
        if (1 <= length) {
            while (true) {
                int i3 = iArr[i2];
                if (i < i3) {
                    i = i3;
                }
                if (i2 == length) {
                    break;
                }
                i2++;
            }
        }
        return i;
    }

    public static void I0(Object[] objArr) {
        objArr.getClass();
        int length = (objArr.length / 2) - 1;
        if (length < 0) {
            return;
        }
        int length2 = objArr.length - 1;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            Object obj = objArr[i];
            objArr[i] = objArr[length2];
            objArr[length2] = obj;
            length2--;
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    public static char J0(char[] cArr) {
        int length = cArr.length;
        if (length == 0) {
            ywb.h("Array is empty.");
            return (char) 0;
        }
        if (length == 1) {
            return cArr[0];
        }
        ay0.e("Array has more than one element.");
        return (char) 0;
    }

    public static Object K0(Object[] objArr) {
        int length = objArr.length;
        if (length == 0) {
            ywb.h("Array is empty.");
            return null;
        }
        if (length == 1) {
            return objArr[0];
        }
        ay0.e("Array has more than one element.");
        return null;
    }

    public static final void L0(Object[] objArr, HashSet hashSet) {
        objArr.getClass();
        for (Object obj : objArr) {
            hashSet.add(obj);
        }
    }

    public static List M0(byte[] bArr) {
        int length = bArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return d46.Q(Byte.valueOf(bArr[0]));
        }
        ArrayList arrayList = new ArrayList(bArr.length);
        for (byte b : bArr) {
            arrayList.add(Byte.valueOf(b));
        }
        return arrayList;
    }

    public static List N0(float[] fArr) {
        int length = fArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return d46.Q(Float.valueOf(fArr[0]));
        }
        ArrayList arrayList = new ArrayList(fArr.length);
        for (float f : fArr) {
            arrayList.add(Float.valueOf(f));
        }
        return arrayList;
    }

    public static List O0(int[] iArr) {
        int length = iArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return d46.Q(Integer.valueOf(iArr[0]));
        }
        ArrayList arrayList = new ArrayList(iArr.length);
        for (int i : iArr) {
            arrayList.add(Integer.valueOf(i));
        }
        return arrayList;
    }

    public static List P0(long[] jArr) {
        int length = jArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return d46.Q(Long.valueOf(jArr[0]));
        }
        ArrayList arrayList = new ArrayList(jArr.length);
        for (long j : jArr) {
            arrayList.add(Long.valueOf(j));
        }
        return arrayList;
    }

    public static List Q0(Object[] objArr) {
        objArr.getClass();
        int length = objArr.length;
        return length != 0 ? length != 1 ? new ArrayList(new k70(objArr, false)) : d46.Q(objArr[0]) : ey3.a;
    }

    public static List R0(boolean[] zArr) {
        int length = zArr.length;
        if (length == 0) {
            return ey3.a;
        }
        if (length == 1) {
            return d46.Q(Boolean.valueOf(zArr[0]));
        }
        ArrayList arrayList = new ArrayList(zArr.length);
        for (boolean z : zArr) {
            arrayList.add(Boolean.valueOf(z));
        }
        return arrayList;
    }

    public static Set S0(Object[] objArr) {
        objArr.getClass();
        int length = objArr.length;
        if (length == 0) {
            return ny3.a;
        }
        if (length == 1) {
            return qo7.B(objArr[0]);
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet(ei7.P(objArr.length));
        L0(objArr, linkedHashSet);
        return linkedHashSet;
    }

    public static List a0(Object[] objArr) {
        objArr.getClass();
        List listAsList = Arrays.asList(objArr);
        listAsList.getClass();
        return listAsList;
    }

    public static mzb b0(Object[] objArr) {
        return objArr.length == 0 ? my3.a : new j80(0, objArr);
    }

    public static boolean c0(int i, int[] iArr) {
        iArr.getClass();
        return z0(i, iArr) >= 0;
    }

    public static boolean d0(Object obj, Object[] objArr) {
        objArr.getClass();
        return A0(obj, objArr) >= 0;
    }

    public static boolean e0(Object[] objArr, Object[] objArr2) {
        if (objArr == objArr2) {
            return true;
        }
        if (objArr != null && objArr2 != null && objArr.length == objArr2.length) {
            int length = objArr.length;
            for (int i = 0; i < length; i++) {
                Object obj = objArr[i];
                Object obj2 = objArr2[i];
                if (obj != obj2) {
                    if (obj != null && obj2 != null) {
                        if ((obj instanceof Object[]) && (obj2 instanceof Object[])) {
                            if (!e0((Object[]) obj, (Object[]) obj2)) {
                            }
                        } else if ((obj instanceof byte[]) && (obj2 instanceof byte[])) {
                            if (!Arrays.equals((byte[]) obj, (byte[]) obj2)) {
                            }
                        } else if ((obj instanceof short[]) && (obj2 instanceof short[])) {
                            if (!Arrays.equals((short[]) obj, (short[]) obj2)) {
                            }
                        } else if ((obj instanceof int[]) && (obj2 instanceof int[])) {
                            if (!Arrays.equals((int[]) obj, (int[]) obj2)) {
                            }
                        } else if ((obj instanceof long[]) && (obj2 instanceof long[])) {
                            if (!Arrays.equals((long[]) obj, (long[]) obj2)) {
                            }
                        } else if ((obj instanceof float[]) && (obj2 instanceof float[])) {
                            if (!Arrays.equals((float[]) obj, (float[]) obj2)) {
                            }
                        } else if ((obj instanceof double[]) && (obj2 instanceof double[])) {
                            if (!Arrays.equals((double[]) obj, (double[]) obj2)) {
                            }
                        } else if ((obj instanceof char[]) && (obj2 instanceof char[])) {
                            if (!Arrays.equals((char[]) obj, (char[]) obj2)) {
                            }
                        } else if ((obj instanceof boolean[]) && (obj2 instanceof boolean[])) {
                            if (!Arrays.equals((boolean[]) obj, (boolean[]) obj2)) {
                            }
                        } else if ((obj instanceof uyd) && (obj2 instanceof uyd)) {
                            if (!Arrays.equals(((uyd) obj).a, ((uyd) obj2).a)) {
                            }
                        } else if ((obj instanceof lzd) && (obj2 instanceof lzd)) {
                            if (!Arrays.equals(((lzd) obj).a, ((lzd) obj2).a)) {
                            }
                        } else if ((obj instanceof azd) && (obj2 instanceof azd)) {
                            if (!Arrays.equals(((azd) obj).a, ((azd) obj2).a)) {
                            }
                        } else if ((obj instanceof fzd) && (obj2 instanceof fzd)) {
                            if (!Arrays.equals(((fzd) obj).a, ((fzd) obj2).a)) {
                            }
                        } else if (!obj.equals(obj2)) {
                        }
                    }
                }
            }
            return true;
        }
        return false;
    }

    public static void f0(int i, int i2, int i3, byte[] bArr, byte[] bArr2) {
        bArr.getClass();
        bArr2.getClass();
        System.arraycopy(bArr, i2, bArr2, i, i3 - i2);
    }

    public static void g0(int i, int i2, int i3, Object[] objArr, Object[] objArr2) {
        objArr.getClass();
        objArr2.getClass();
        System.arraycopy(objArr, i2, objArr2, i, i3 - i2);
    }

    public static void h0(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        iArr.getClass();
        iArr2.getClass();
        System.arraycopy(iArr, i2, iArr2, i, i3 - i2);
    }

    public static void i0(long[] jArr, long[] jArr2, int i, int i2, int i3) {
        jArr.getClass();
        jArr2.getClass();
        System.arraycopy(jArr, i2, jArr2, i, i3 - i2);
    }

    public static /* synthetic */ void j0(int i, int i2, int i3, Object[] objArr, Object[] objArr2) {
        if ((i3 & 4) != 0) {
            i = 0;
        }
        if ((i3 & 8) != 0) {
            i2 = objArr.length;
        }
        g0(0, i, i2, objArr, objArr2);
    }

    public static /* synthetic */ void k0(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        if ((i3 & 2) != 0) {
            i = 0;
        }
        if ((i3 & 8) != 0) {
            i2 = iArr.length;
        }
        h0(i, 0, iArr, iArr2, i2);
    }

    public static byte[] l0(byte[] bArr, int i, int i2) {
        bArr.getClass();
        hlg.u(i2, bArr.length);
        byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, i, i2);
        bArrCopyOfRange.getClass();
        return bArrCopyOfRange;
    }

    public static Object[] m0(int i, int i2, Object[] objArr) {
        objArr.getClass();
        hlg.u(i2, objArr.length);
        Object[] objArrCopyOfRange = Arrays.copyOfRange(objArr, i, i2);
        objArrCopyOfRange.getClass();
        return objArrCopyOfRange;
    }

    public static List n0(int i, Object[] objArr) {
        if (i < 0) {
            ywb.g(ev6.w("Requested element count ", i, " is less than zero."));
            return null;
        }
        int length = objArr.length - i;
        if (length < 0) {
            length = 0;
        }
        if (length < 0) {
            ywb.g(ev6.w("Requested element count ", length, " is less than zero."));
            return null;
        }
        if (length == 0) {
            return ey3.a;
        }
        int length2 = objArr.length;
        if (length >= length2) {
            return Q0(objArr);
        }
        if (length == 1) {
            return d46.Q(objArr[length2 - 1]);
        }
        ArrayList arrayList = new ArrayList(length);
        for (int i2 = length2 - length; i2 < length2; i2++) {
            arrayList.add(objArr[i2]);
        }
        return arrayList;
    }

    public static void o0(int i, int i2, Object obj, Object[] objArr) {
        objArr.getClass();
        Arrays.fill(objArr, i, i2, obj);
    }

    public static void p0(int i, int i2, int i3, int[] iArr) {
        if ((i3 & 4) != 0) {
            i2 = iArr.length;
        }
        Arrays.fill(iArr, 0, i2, i);
    }

    public static void r0(long[] jArr, long j) {
        int length = jArr.length;
        jArr.getClass();
        Arrays.fill(jArr, 0, length, j);
    }

    public static ArrayList s0(Object[] objArr) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : objArr) {
            if (obj != null) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static Object t0(Object[] objArr) {
        objArr.getClass();
        if (objArr.length != 0) {
            return objArr[0];
        }
        ywb.h("Array is empty.");
        return null;
    }

    public static Object u0(Object[] objArr) {
        objArr.getClass();
        if (objArr.length == 0) {
            return null;
        }
        return objArr[0];
    }

    public static n46 v0(int[] iArr) {
        return new n46(0, iArr.length - 1, 1);
    }

    public static int w0(long[] jArr) {
        jArr.getClass();
        return jArr.length - 1;
    }

    public static Integer x0(int i, int[] iArr) {
        iArr.getClass();
        if (i < 0 || i >= iArr.length) {
            return null;
        }
        return Integer.valueOf(iArr[i]);
    }

    public static Object y0(int i, Object[] objArr) {
        objArr.getClass();
        if (i < 0 || i >= objArr.length) {
            return null;
        }
        return objArr[i];
    }

    public static int z0(int i, int[] iArr) {
        iArr.getClass();
        int length = iArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            if (i == iArr[i2]) {
                return i2;
            }
        }
        return -1;
    }
}
