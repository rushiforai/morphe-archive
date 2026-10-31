package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.h9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1853h9<K, V> {
    public static int A03;
    public static int A04;
    public static Object[] A05;
    public static Object[] A06;
    public static byte[] A07;
    public static String[] A08 = {"BrVHgBkmBksyBnnjIq0pHnqXAu9AUg3j", "iIth6RrlZFIJsCIcgsKekGbs32ChyRjv", "Uwdt1z4SmD1Mf7UvGeSYdNXOfhFYTYnY", "QITUqyWPG2VnlGrB2a6hYhF3R3KaavLD", "arDW8RiIBmWFNCZvgTvY8WvuJ76u3VTs", "pOGA2rk9V0ZEl", "438Cia9wbNYnLnXWpHR8BTCUnyjltaF2", "slnYcYZFDBEgJMtczrpzy3D6NQdPiCOq"};
    public int[] A01 = AbstractC1843gz.A00;
    public Object[] A02 = AbstractC1843gz.A02;
    public int A00 = 0;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        if (A08[5].length() == 11) {
            throw new RuntimeException();
        }
        String[] strArr = A08;
        strArr[0] = "Xtbm9MFCOkvOfDux5Me3XhO5K6Bs7EUd";
        strArr[1] = "PZcI0QBOeZ0LYFf6gJzuFWLZdUoY6utj";
        A07 = new byte[]{-69, 7, -5, -4, 6, -77, -32, -12, 3, -68, -62, -74, 3, 5};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 11 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final V A0B(int i5) {
        int i11;
        V v11 = (V) this.A02[(i5 << 1) + 1];
        int i12 = this.A00;
        if (i12 <= 1) {
            A07(this.A01, this.A02, i12);
            this.A01 = AbstractC1843gz.A00;
            this.A02 = AbstractC1843gz.A02;
            i11 = 0;
        } else {
            i11 = i12 - 1;
            if (this.A01.length <= 8 || this.A00 >= this.A01.length / 3) {
                if (i5 < i11) {
                    System.arraycopy(this.A01, i5 + 1, this.A01, i5, i11 - i5);
                    System.arraycopy(this.A02, (i5 + 1) << 1, this.A02, i5 << 1, (i11 - i5) << 1);
                }
                this.A02[i11 << 1] = null;
                if (A08[7].charAt(6) != 'Z') {
                    this.A02[(i11 << 1) + 1] = null;
                } else {
                    A08[7] = "0xLePTZxplzExTmCw9shJwlSbcl2kqEb";
                    this.A02[(i11 << 1) + 1] = null;
                }
            } else {
                int i13 = i12 > 8 ? i12 + (i12 >> 1) : 8;
                int[] iArr = this.A01;
                Object[] objArr = this.A02;
                A06(i13);
                if (i12 != this.A00) {
                    throw new ConcurrentModificationException();
                }
                if (i5 > 0) {
                    System.arraycopy(iArr, 0, this.A01, 0, i5);
                    System.arraycopy(objArr, 0, this.A02, 0, i5 << 1);
                }
                if (i5 < i11) {
                    System.arraycopy(iArr, i5 + 1, this.A01, i5, i11 - i5);
                    System.arraycopy(objArr, (i5 + 1) << 1, this.A02, i5 << 1, (i11 - i5) << 1);
                }
            }
        }
        int i14 = this.A00;
        String[] strArr = A08;
        if (strArr[0].charAt(11) == strArr[1].charAt(11)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A08;
        strArr2[0] = "xFHRCOjHDqSI1UlNRZSx5FadcPcGQITj";
        strArr2[1] = "4ZMke5GLOi53P3lo3UgzHK3l5Qzb3367";
        if (i12 != i14) {
            throw new ConcurrentModificationException();
        }
        this.A00 = i11;
        return v11;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 8
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof C1853h9) {
            C1853h9 c1853h9 = (C1853h9) obj;
            if (size() != c1853h9.size()) {
                return false;
            }
            for (int i5 = 0; i5 < this.A00; i5++) {
                try {
                    K kA0A = A0A(i5);
                    V vA0C = A0C(i5);
                    Object obj2 = c1853h9.get(kA0A);
                    if (vA0C == null) {
                        if (obj2 == null && c1853h9.containsKey(kA0A)) {
                        }
                        return false;
                    }
                    if (!vA0C.equals(obj2)) {
                        return false;
                    }
                } catch (ClassCastException unused) {
                    return false;
                } catch (NullPointerException unused2) {
                    return false;
                }
            }
            return true;
        }
        if (!(obj instanceof Map)) {
            return false;
        }
        Map map = (Map) obj;
        if (size() != map.size()) {
            return false;
        }
        for (int i11 = 0; i11 < this.A00; i11++) {
            try {
                K kA0A2 = A0A(i11);
                V vA0C2 = A0C(i11);
                Object obj3 = map.get(kA0A2);
                if (vA0C2 == null) {
                    if (obj3 == null && map.containsKey(kA0A2)) {
                    }
                    return false;
                }
                if (!vA0C2.equals(obj3)) {
                    return false;
                }
            } catch (ClassCastException unused3) {
                return false;
            } catch (NullPointerException unused4) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 9 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final int hashCode() {
        int[] iArr = this.A01;
        Object[] objArr = this.A02;
        int iHashCode = 0;
        int i5 = 0;
        int i11 = 1;
        int i12 = this.A00;
        while (i5 < i12) {
            Object obj = objArr[i11];
            iHashCode += iArr[i5] ^ (obj == null ? 0 : obj.hashCode());
            i5++;
            i11 += 2;
        }
        return iHashCode;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 11 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final V put(K k11, V v11) {
        int iHashCode;
        int iA02;
        int i5 = this.A00;
        if (k11 == null) {
            iHashCode = 0;
            iA02 = A01();
        } else {
            iHashCode = k11.hashCode();
            iA02 = A02(k11, iHashCode);
        }
        if (iA02 >= 0) {
            int i11 = (iA02 << 1) + 1;
            V v12 = (V) this.A02[i11];
            this.A02[i11] = v11;
            return v12;
        }
        int i12 = ~iA02;
        if (i5 >= this.A01.length) {
            int i13 = 8;
            if (i5 >= 8) {
                i13 = (i5 >> 1) + i5;
            } else if (i5 < 4) {
                i13 = 4;
            }
            int[] iArr = this.A01;
            Object[] objArr = this.A02;
            A06(i13);
            if (i5 != this.A00) {
                throw new ConcurrentModificationException();
            }
            if (this.A01.length > 0) {
                System.arraycopy(iArr, 0, this.A01, 0, iArr.length);
                System.arraycopy(objArr, 0, this.A02, 0, objArr.length);
            }
            A07(iArr, objArr, i5);
        }
        if (i12 < i5) {
            System.arraycopy(this.A01, i12, this.A01, i12 + 1, i5 - i12);
            System.arraycopy(this.A02, i12 << 1, this.A02, (i12 + 1) << 1, (this.A00 - i12) << 1);
        }
        if (i5 != this.A00 || i12 >= this.A01.length) {
            throw new ConcurrentModificationException();
        }
        this.A01[i12] = iHashCode;
        this.A02[i12 << 1] = k11;
        this.A02[(i12 << 1) + 1] = v11;
        this.A00++;
        return null;
    }

    static {
        A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    private final int A01() {
        int i5 = this.A00;
        if (i5 == 0) {
            return -1;
        }
        int iA03 = A03(this.A01, i5, 0);
        if (iA03 < 0) {
            return iA03;
        }
        int N = iA03 << 1;
        if (this.A02[N] == null) {
            return iA03;
        }
        int i11 = iA03 + 1;
        while (i11 < i5) {
            int N2 = this.A01[i11];
            if (N2 != 0) {
                break;
            }
            Object[] objArr = this.A02;
            String[] strArr = A08;
            String str = strArr[2];
            String str2 = strArr[4];
            int index = str.charAt(15);
            int N3 = str2.charAt(15);
            if (index != N3) {
                throw new RuntimeException();
            }
            A08[5] = "5BliZlAS3QBBz9o";
            int N4 = i11 << 1;
            if (objArr[N4] == null) {
                return i11;
            }
            i11++;
        }
        for (int end = iA03 - 1; end >= 0; end--) {
            int N5 = this.A01[end];
            if (N5 != 0) {
                break;
            }
            int N6 = end << 1;
            if (this.A02[N6] == null) {
                return end;
            }
        }
        int N7 = ~i11;
        return N7;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    private final int A02(Object obj, int i5) {
        int i11 = this.A00;
        if (i11 == 0) {
            if (A08[7].charAt(6) != 'Z') {
                throw new RuntimeException();
            }
            A08[7] = "y399iLZYsEEz0hzdxnUhzykHYZJwaaUE";
            return -1;
        }
        int end = A03(this.A01, i11, i5);
        if (end < 0) {
            return end;
        }
        int N = end << 1;
        if (obj.equals(this.A02[N])) {
            return end;
        }
        int i12 = end + 1;
        while (i12 < i11) {
            int N2 = this.A01[i12];
            if (N2 != i5) {
                break;
            }
            int N3 = i12 << 1;
            if (obj.equals(this.A02[N3])) {
                return i12;
            }
            i12++;
        }
        for (int end2 = end - 1; end2 >= 0; end2--) {
            int N4 = this.A01[end2];
            if (N4 != i5) {
                break;
            }
            int N5 = end2 << 1;
            if (obj.equals(this.A02[N5])) {
                return end2;
            }
        }
        int N6 = ~i12;
        return N6;
    }

    public static int A03(int[] iArr, int i5, int i11) {
        try {
            return AbstractC1843gz.A02(iArr, i5, i11);
        } catch (ArrayIndexOutOfBoundsException unused) {
            throw new ConcurrentModificationException();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    private void A06(int i5) {
        if (i5 == 8) {
            synchronized (JR.class) {
                if (A06 != null) {
                    Object[] objArr = A06;
                    this.A02 = objArr;
                    A06 = (Object[]) objArr[0];
                    this.A01 = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    A04--;
                    return;
                }
            }
        } else if (i5 == 4) {
            synchronized (JR.class) {
                if (A05 != null) {
                    Object[] objArr2 = A05;
                    this.A02 = objArr2;
                    A05 = (Object[]) objArr2[0];
                    this.A01 = (int[]) objArr2[1];
                    objArr2[1] = null;
                    objArr2[0] = null;
                    A03--;
                    return;
                }
            }
        }
        this.A01 = new int[i5];
        this.A02 = new Object[i5 << 1];
    }

    public static void A07(int[] iArr, Object[] objArr, int i5) {
        if (iArr.length == 8) {
            synchronized (JR.class) {
                if (A04 < 10) {
                    objArr[0] = A06;
                    objArr[1] = iArr;
                    for (int i11 = (i5 << 1) - 1; i11 >= 2; i11--) {
                        objArr[i11] = null;
                    }
                    A06 = objArr;
                    A04++;
                }
            }
            return;
        }
        if (iArr.length == 4) {
            synchronized (JR.class) {
                if (A03 < 10) {
                    objArr[0] = A05;
                    objArr[1] = iArr;
                    for (int i12 = (i5 << 1) - 1; i12 >= 2; i12--) {
                        objArr[i12] = null;
                    }
                    A05 = objArr;
                    A03++;
                }
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final int A08(Object obj) {
        int i5 = this.A00 * 2;
        Object[] objArr = this.A02;
        if (obj == null) {
            for (int i11 = 1; i11 < i5; i11 += 2) {
                if (objArr[i11] == null) {
                    int N = i11 >> 1;
                    return N;
                }
            }
            return -1;
        }
        for (int i12 = 1; i12 < i5; i12 += 2) {
            if (obj.equals(objArr[i12])) {
                int N2 = i12 >> 1;
                return N2;
            }
        }
        return -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final int A09(Object obj) {
        return obj == null ? A01() : A02(obj, obj.hashCode());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final K A0A(int i5) {
        return (K) this.A02[i5 << 1];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final V A0C(int i5) {
        return (V) this.A02[(i5 << 1) + 1];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final V A0D(int i5, V v11) {
        int i11 = (i5 << 1) + 1;
        V v12 = (V) this.A02[i11];
        this.A02[i11] = v11;
        return v12;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final void A0E(int i5) {
        int i11 = this.A00;
        int osize = this.A01.length;
        if (osize < i5) {
            int[] iArr = this.A01;
            Object[] objArr = this.A02;
            A06(i5);
            int osize2 = this.A00;
            if (osize2 > 0) {
                System.arraycopy(iArr, 0, this.A01, 0, i11);
                int osize3 = i11 << 1;
                System.arraycopy(objArr, 0, this.A02, 0, osize3);
            }
            A07(iArr, objArr, i11);
        }
        int osize4 = this.A00;
        if (osize4 == i11) {
        } else {
            throw new ConcurrentModificationException();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final void clear() {
        if (this.A00 > 0) {
            int[] iArr = this.A01;
            Object[] objArr = this.A02;
            int i5 = this.A00;
            int[] ohashes = AbstractC1843gz.A00;
            this.A01 = ohashes;
            this.A02 = AbstractC1843gz.A02;
            this.A00 = 0;
            A07(iArr, objArr, i5);
        }
        if (this.A00 <= 0) {
        } else {
            throw new ConcurrentModificationException();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final boolean containsKey(Object obj) {
        return A09(obj) >= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final boolean containsValue(Object obj) {
        return A08(obj) >= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final V get(Object obj) {
        int iA09 = A09(obj);
        if (iA09 >= 0) {
            return (V) this.A02[(iA09 << 1) + 1];
        }
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final boolean isEmpty() {
        return this.A00 <= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final V remove(Object obj) {
        int index = A09(obj);
        if (index >= 0) {
            return A0B(index);
        }
        String[] strArr = A08;
        if (strArr[2].charAt(15) != strArr[4].charAt(15)) {
            throw new RuntimeException();
        }
        A08[5] = "POG7nMkVNzdGaGlGxNMu0E80q";
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final int size() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h9 != com.facebook.ads.internal.androidx.support.v4.util.SimpleArrayMap<K, V> */
    public final String toString() {
        if (isEmpty()) {
            return A04(12, 2, 31);
        }
        StringBuilder sb2 = new StringBuilder(this.A00 * 28);
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        for (int i5 = 0; i5 < this.A00; i5++) {
            if (i5 > 0) {
                sb2.append(A04(10, 2, 45));
            }
            K kA0A = A0A(i5);
            int i11 = A08[5].length();
            if (i11 == 11) {
                throw new RuntimeException();
            }
            String[] strArr = A08;
            strArr[6] = "5MoFeGsxqoTSR8Y6IShdOiE5VevAoRo0";
            strArr[3] = "kGPruxXsJMcA49LPD5OztVvQJS4oto1Y";
            String strA04 = A04(0, 10, 42);
            if (kA0A != this) {
                sb2.append(kA0A);
            } else {
                sb2.append(strA04);
            }
            sb2.append('=');
            V vA0C = A0C(i5);
            if (vA0C != this) {
                sb2.append(vA0C);
            } else {
                sb2.append(strA04);
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
