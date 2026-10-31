package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import com.google.errorprone.annotations.concurrent.LazyInit;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public class W0<K, V> extends AbstractMap<K, V> implements Serializable {
    public static byte[] A09;
    public static String[] A0A = {"UsCaWrpdB1tTF77WGTK8mFGQ0Mib8oUf", "3s3aN8tYra1e31e7A7NVf3fajE95FwLN", "r", "BgqZmAdPBvt7gecTqu2inC67kC4iiPhA", "u", "HTdVpPx1o5", "kYQl8LVoex1ahuHtTMzHI9ZfeCqPvw6a", "NGnZ5pZhlRv718VqGStD7Z9"};
    public static final Object A0B;

    @CheckForNull
    public transient int[] A00;

    @CheckForNull
    public transient Object[] A01;

    @CheckForNull
    public transient Object[] A02;
    public transient int A03;
    public transient int A04;

    @CheckForNull
    public transient Object A05;

    @CheckForNull
    @LazyInit
    public transient Collection<V> A06;

    @CheckForNull
    @LazyInit
    public transient Set<Map.Entry<K, V>> A07;

    @CheckForNull
    @LazyInit
    public transient Set<K> A08;

    public static String A0L(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 55);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        String[] strArr = A0A;
        if (strArr[4].length() != strArr[2].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[4] = "7";
        strArr2[2] = "J";
        A09 = new byte[]{-124, -75, -75, -92, -68, -74, 99, -92, -81, -75, -88, -92, -89, -68, 99, -92, -81, -81, -78, -90, -92, -73, -88, -89, 125, -80, -88, -99, -101, -84, -99, -100, 88, -85, -95, -78, -99, 88, -91, -83, -85, -84, 88, -102, -99, 88, 118, 117, 88, 104, -101, -64, -56, -77, -66, -69, -74, 114, -59, -69, -52, -73, -116, 114};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final Iterator<Map.Entry<K, V>> A0d() {
        Map<K, V> mapA0h = A0h();
        return mapA0h != null ? mapA0h.entrySet().iterator() : new W0<K, V>.Itr<Map.Entry<K, V>>() { // from class: com.facebook.ads.redexgen.X.9u
            {
                super(this.A00, null);
            }

            /* JADX INFO: Access modifiers changed from: private */
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final Map.Entry<K, V> A03(int entry) {
                return new W9<K, V>(entry) { // from class: com.facebook.ads.redexgen.X.9s
                    public static String[] A03 = {"5HV08nfivpuF2eIXtCYynApnrHInEgXm", "S0CYH", "Ox0", "O5yTfQQSp", "P8DtKUwo9FLdaPpyJyJxB8WXnRTz3nie", "p7TMPbd2l0YsDmKAosKD3ZfifhLQqvYM", "dnU8s", "9fQ0aDK3mHVsJ1NLC1qlrD"};
                    public int A00;

                    @ParametricNullness
                    public final K A01;

                    /* JADX WARN: Failed to parse debug info
                    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
                    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
                    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
                    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
                    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
                    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
                     */
                    @Override // com.facebook.ads.redexgen.X.W9, java.util.Map.Entry
                    @ParametricNullness
                    public final V getValue() {
                        Map<K, V> mapA0h2 = this.A02.A0h();
                        if (mapA0h2 != null) {
                            return (V) Ve.A01(mapA0h2.get(this.A01));
                        }
                        A00();
                        return this.A00 == -1 ? (V) Ve.A00() : (V) this.A02.A0F(this.A00);
                    }

                    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9s != com.google.common.collect.CompactHashMap<K, V>$MapEntry */
                    {
                        this.A01 = (K) this.A02.A0E(entry);
                        this.A00 = entry;
                    }

                    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9s != com.google.common.collect.CompactHashMap<K, V>$MapEntry */
                    private void A00() {
                        if (this.A00 == -1 || this.A00 >= this.A02.size() || !A6.A01(this.A01, this.A02.A0E(this.A00))) {
                            W0 w02 = this.A02;
                            String[] strArr = A03;
                            if (strArr[4].length() == strArr[7].length()) {
                                throw new RuntimeException();
                            }
                            A03[3] = "rF";
                            this.A00 = w02.A07(this.A01);
                        }
                    }

                    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9s != com.google.common.collect.CompactHashMap<K, V>$MapEntry */
                    @Override // com.facebook.ads.redexgen.X.W9, java.util.Map.Entry
                    @ParametricNullness
                    public final K getKey() {
                        return this.A01;
                    }

                    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9s != com.google.common.collect.CompactHashMap<K, V>$MapEntry */
                    @Override // com.facebook.ads.redexgen.X.W9, java.util.Map.Entry
                    @ParametricNullness
                    public final V setValue(@ParametricNullness V v11) {
                        Map<K, V> mapA0h2 = this.A02.A0h();
                        if (mapA0h2 != null) {
                            V v12 = (V) Ve.A01(mapA0h2.put(this.A01, v11));
                            if (A03[2].length() == 8) {
                                throw new RuntimeException();
                            }
                            A03[2] = "2v2w2kMa6sbMxB8mHbrluY4Y";
                            return v12;
                        }
                        A00();
                        if (this.A00 == -1) {
                            this.A02.put(this.A01, v11);
                            return (V) Ve.A00();
                        }
                        V v13 = (V) this.A02.A0F(this.A00);
                        this.A02.A0R(this.A00, v11);
                        return v13;
                    }
                };
            }
        };
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final Iterator<V> A0f() {
        Map<K, V> mapA0h = A0h();
        return mapA0h != null ? mapA0h.values().iterator() : new W0<K, V>.Itr<V>() { // from class: com.facebook.ads.redexgen.X.9t
            {
                super(this.A00, null);
            }

            @ParametricNullness
            public final V A03(int i5) {
                return (V) this.A00.A0F(i5);
            }
        };
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public void A0n(int dstIndex, int mask) {
        int i5;
        int i11;
        Object objA0C = A0C();
        int[] iArrA0T = A0T();
        Object[] objArrA0V = A0V();
        Object[] objArrA0W = A0W();
        int size = size() - 1;
        if (dstIndex >= size) {
            objArrA0V[dstIndex] = null;
            objArrA0W[dstIndex] = null;
            iArrA0T[dstIndex] = 0;
            return;
        }
        Object obj = objArrA0V[size];
        objArrA0V[dstIndex] = obj;
        objArrA0W[dstIndex] = objArrA0W[size];
        objArrA0V[size] = null;
        objArrA0W[size] = null;
        iArrA0T[dstIndex] = iArrA0T[size];
        iArrA0T[size] = 0;
        int iA02 = AbstractC1312Vv.A02(obj) & mask;
        int iA05 = AbstractC1315Vz.A05(objA0C, iA02);
        int i12 = size + 1;
        if (iA05 == i12) {
            AbstractC1315Vz.A0B(objA0C, iA02, dstIndex + 1);
            return;
        }
        do {
            i5 = iA05 - 1;
            i11 = iArrA0T[i5];
            iA05 = AbstractC1315Vz.A03(i11, mask);
        } while (iA05 != i12);
        iArrA0T[i5] = AbstractC1315Vz.A04(i11, dstIndex + 1, mask);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 19 out of bounds for length 18
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractMap, java.util.Map
    @CheckForNull
    public final V put(@ParametricNullness K k11, @ParametricNullness V v11) {
        int i5;
        int i11;
        if (A0p()) {
            A0Z();
        }
        Map<K, V> mapA0h = A0h();
        if (mapA0h != null) {
            return mapA0h.put(k11, v11);
        }
        int[] iArrA0T = A0T();
        Object[] objArrA0V = A0V();
        Object[] objArrA0W = A0W();
        int i12 = this.A04;
        int i13 = i12 + 1;
        int iA02 = AbstractC1312Vv.A02(k11);
        int iA00 = A00();
        int i14 = iA02 & iA00;
        int iA05 = AbstractC1315Vz.A05(A0C(), i14);
        if (iA05 != 0) {
            int iA022 = AbstractC1315Vz.A02(iA02, iA00);
            int i15 = 0;
            do {
                i5 = iA05 - 1;
                i11 = iArrA0T[i5];
                if (AbstractC1315Vz.A02(i11, iA00) == iA022 && A6.A01(k11, objArrA0V[i5])) {
                    V v12 = (V) objArrA0W[i5];
                    objArrA0W[i5] = v11;
                    A0k(i5);
                    return v12;
                }
                iA05 = AbstractC1315Vz.A03(i11, iA00);
                i15++;
            } while (iA05 != 0);
            if (i15 >= 9) {
                V vPut = A0g().put(k11, v11);
                if (A0A[7].length() != 23) {
                    throw new RuntimeException();
                }
                String[] strArr = A0A;
                strArr[0] = "A7LBJNyTByumJxPJbJj7vdrx0LSH2pwL";
                strArr[3] = "wP0aYqOOB84oVOZQj8DGwQj7CYv0t5Ri";
                return vPut;
            }
            if (i13 > iA00) {
                iA00 = A02(iA00, AbstractC1315Vz.A00(iA00), iA02, i12);
            } else {
                iArrA0T[i5] = AbstractC1315Vz.A04(i11, i12 + 1, iA00);
            }
        } else if (i13 > iA00) {
            iA00 = A02(iA00, AbstractC1315Vz.A00(iA00), iA02, i12);
        } else {
            AbstractC1315Vz.A0B(A0C(), i14, i12 + 1);
        }
        A0N(i13);
        A0o(i12, k11, v11, iA02, iA00);
        this.A04 = i13;
        A0j();
        return null;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        Map<K, V> mapA0h = A0h();
        return mapA0h != null ? mapA0h.size() : this.A04;
    }

    static {
        A0M();
        A0B = new Object();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public W0() {
        A0l(3);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public W0(int expectedSize) {
        A0l(expectedSize);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A00() {
        return (1 << (this.A03 & 31)) - 1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private int A01(int i5) {
        return A0T()[i5];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private int A02(int oldMask, int newCapacity, int targetHash, int targetEntryIndex) {
        Object objA07 = AbstractC1315Vz.A07(newCapacity);
        int hash = newCapacity - 1;
        if (targetEntryIndex != 0) {
            AbstractC1315Vz.A0B(objA07, targetHash & hash, targetEntryIndex + 1);
        }
        Object objA0C = A0C();
        int[] iArrA0T = A0T();
        for (int oldTableIndex = 0; oldTableIndex <= oldMask; oldTableIndex++) {
            int iA05 = AbstractC1315Vz.A05(objA0C, oldTableIndex);
            while (iA05 != 0) {
                int i5 = iA05 - 1;
                int newMask = iArrA0T[i5];
                int iA02 = AbstractC1315Vz.A02(newMask, oldMask) | oldTableIndex;
                int i11 = iA02 & hash;
                int iA052 = AbstractC1315Vz.A05(objA07, i11);
                AbstractC1315Vz.A0B(objA07, i11, iA05);
                iArrA0T[i5] = AbstractC1315Vz.A04(iA02, iA052, hash);
                iA05 = AbstractC1315Vz.A03(newMask, oldMask);
            }
        }
        this.A05 = objA07;
        A0O(hash);
        return hash;
    }

    public static /* synthetic */ int A04(W0 w02) {
        int i5 = w02.A04;
        w02.A04 = i5 - 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A07(@CheckForNull Object key) {
        if (A0p()) {
            return -1;
        }
        int mask = AbstractC1312Vv.A02(key);
        int entry = A00();
        int hash = AbstractC1315Vz.A05(A0C(), mask & entry);
        if (hash == 0) {
            return -1;
        }
        int entryIndex = AbstractC1315Vz.A02(mask, entry);
        do {
            int hashPrefix = hash - 1;
            int next = A01(hashPrefix);
            if (AbstractC1315Vz.A02(next, entry) == entryIndex) {
                K kA0E = A0E(hashPrefix);
                if (A0A[7].length() != 23) {
                    throw new RuntimeException();
                }
                String[] strArr = A0A;
                strArr[0] = "PEzGMTL5BCkQPricWMENMzLCtYEroNn0";
                strArr[3] = "jB1dvidXB0hgraUTqBacXOglJ6BP9uJD";
                if (A6.A01(key, kA0E)) {
                    return hashPrefix;
                }
            }
            hash = AbstractC1315Vz.A03(next, entry);
        } while (hash != 0);
        return -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private final Set<Map.Entry<K, V>> A08() {
        return new W4(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private final Set<K> A09() {
        return new W2(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private final Collection<V> A0A() {
        return new W1(this);
    }

    public static <K, V> W0<K, V> A0B(int expectedSize) {
        return new W0<>(expectedSize);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Object A0C() {
        return Objects.requireNonNull(this.A05);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public K A0E(int i5) {
        return (K) A0V()[i5];
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public V A0F(int i5) {
        return (V) A0W()[i5];
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Object A0K(@CheckForNull Object key) {
        if (A0p()) {
            return A0B;
        }
        int iA00 = A00();
        Object objA0C = A0C();
        int[] iArrA0T = A0T();
        Object[] objArrA0V = A0V();
        String[] strArr = A0A;
        String str = strArr[0];
        String str2 = strArr[3];
        int iCharAt = str.charAt(8);
        int mask = str2.charAt(8);
        if (iCharAt != mask) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[0] = "2dOGJDLEBwCbV7U3v9dBzdAkFKwBrrZx";
        strArr2[3] = "uaP3M6whB8wVrGKee0wzJxkh8mE5mkCc";
        int iA06 = AbstractC1315Vz.A06(key, null, iA00, objA0C, iArrA0T, objArrA0V, null);
        if (iA06 == -1) {
            return A0B;
        }
        V vA0F = A0F(iA06);
        String[] strArr3 = A0A;
        String str3 = strArr3[0];
        String str4 = strArr3[3];
        int index = str3.charAt(8);
        int mask2 = str4.charAt(8);
        if (index != mask2) {
            A0A[7] = "4EfZxyziITZrCVNwevuOvtz";
            A0n(iA06, iA00);
            int mask3 = this.A04;
            this.A04 = mask3 - 1;
            A0j();
            return vA0F;
        }
        A0A[7] = "CVeuuyzdAxMOtDfTHNbTRt4";
        A0n(iA06, iA00);
        int mask4 = this.A04;
        this.A04 = mask4 - 1;
        A0j();
        return vA0F;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private void A0N(int newSize) {
        int entriesSize;
        int length = A0T().length;
        if (newSize > length && (entriesSize = Math.min(1073741823, (Math.max(1, length >>> 1) + length) | 1)) != length) {
            A0m(entriesSize);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private void A0O(int mask) {
        int hashTableBits = AbstractC1315Vz.A04(this.A03, 32 - Integer.numberOfLeadingZeros(mask), 31);
        this.A03 = hashTableBits;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private void A0P(int i5, int value) {
        A0T()[i5] = value;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private void A0Q(int i5, K key) {
        A0V()[i5] = key;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public void A0R(int i5, V value) {
        A0W()[i5] = value;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int[] A0T() {
        return (int[]) Objects.requireNonNull(this.A00);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Object[] A0V() {
        return (Object[]) Objects.requireNonNull(this.A01);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Object[] A0W() {
        return (Object[]) Objects.requireNonNull(this.A02);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A0Z() {
        AbstractC1335Wu.A0F(A0p(), A0L(0, 24, 12));
        int i5 = this.A03;
        int buckets = AbstractC1315Vz.A01(i5);
        this.A05 = AbstractC1315Vz.A07(buckets);
        int expectedSize = buckets - 1;
        A0O(expectedSize);
        this.A00 = new int[i5];
        this.A01 = new Object[i5];
        this.A02 = new Object[i5];
        return i5;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A0a() {
        return isEmpty() ? -1 : 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A0b(int entryIndex) {
        if (entryIndex + 1 < this.A04) {
            return entryIndex + 1;
        }
        return -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public int A0c(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove - 1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public final Iterator<K> A0e() {
        Map<K, V> delegate = A0h();
        if (delegate != null) {
            Iterator<K> it = delegate.keySet().iterator();
            if (A0A[5].length() != 10) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[0] = "5hoqquUsBOpyCTFMYsXqFIKVC8F5JZ4x";
            strArr[3] = "3KFyYZ54BaIItHukIWtc8ZgRFtiEzDrv";
            return it;
        }
        return new W0<K, V>.Itr<K>() { // from class: com.facebook.ads.redexgen.X.9v
            {
                super(this.A00, null);
            }

            @ParametricNullness
            public final K A03(int i5) {
                return (K) this.A00.A0E(i5);
            }
        };
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Map<K, V> A0g() {
        Map<K, V> mapA0i = A0i(A00() + 1);
        int iA0a = A0a();
        while (iA0a >= 0) {
            mapA0i.put(A0E(iA0a), A0F(iA0a));
            int i5 = A0A[7].length();
            if (i5 != 23) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[0] = "c3M4jpS2BzPh3fY9HrYVv7MOn3pA4wzC";
            strArr[3] = "duOZhIUEB6vfWFeN9fWBClK5buuxXwSC";
            iA0a = A0b(iA0a);
        }
        this.A05 = mapA0i;
        this.A00 = null;
        this.A01 = null;
        this.A02 = null;
        A0j();
        return mapA0i;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @CheckForNull
    public final Map<K, V> A0h() {
        if (this.A05 instanceof Map) {
            return (Map) this.A05;
        }
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public Map<K, V> A0i(int tableSize) {
        return new LinkedHashMap(tableSize, 1.0f);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public final void A0j() {
        this.A03 += 32;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public void A0k(int index) {
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public void A0l(int expectedSize) {
        AbstractC1335Wu.A0E(expectedSize >= 0, A0L(24, 26, 1));
        this.A03 = AnonymousClass19.A01(expectedSize, 1, 1073741823);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public void A0m(int newCapacity) {
        this.A00 = Arrays.copyOf(A0T(), newCapacity);
        this.A01 = Arrays.copyOf(A0V(), newCapacity);
        this.A02 = Arrays.copyOf(A0W(), newCapacity);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public void A0o(@ParametricNullness int entryIndex, @ParametricNullness K key, V value, int hash, int mask) {
        A0P(entryIndex, AbstractC1315Vz.A04(hash, 0, mask));
        A0Q(entryIndex, key);
        A0R(entryIndex, value);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    public final boolean A0p() {
        return this.A05 == null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public void clear() {
        if (A0p()) {
            return;
        }
        A0j();
        Map<K, V> mapA0h = A0h();
        if (mapA0h == null) {
            Arrays.fill(A0V(), 0, this.A04, (Object) null);
            Arrays.fill(A0W(), 0, this.A04, (Object) null);
            AbstractC1315Vz.A0A(A0C());
            Arrays.fill(A0T(), 0, this.A04, 0);
            this.A04 = 0;
            return;
        }
        this.A03 = AnonymousClass19.A01(size(), 3, 1073741823);
        mapA0h.clear();
        if (A0A[5].length() != 10) {
            throw new RuntimeException();
        }
        A0A[5] = "7UyVTLp39D";
        this.A05 = null;
        this.A04 = 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(@CheckForNull Object key) {
        Map<K, V> delegate = A0h();
        return delegate != null ? delegate.containsKey(key) : A07(key) != -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsValue(@CheckForNull Object value) {
        Map<K, V> delegate = A0h();
        if (delegate != null) {
            return delegate.containsValue(value);
        }
        for (int i5 = 0; i5 < this.A04; i5++) {
            V vA0F = A0F(i5);
            String[] strArr = A0A;
            String str = strArr[4];
            String str2 = strArr[2];
            int i11 = str.length();
            if (i11 != str2.length()) {
                throw new RuntimeException();
            }
            A0A[7] = "jhK3uk1fEgjelnfpKfXV873";
            if (A6.A01(value, vA0F)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        if (this.A07 != null) {
            return this.A07;
        }
        Set<Map.Entry<K, V>> setA08 = A08();
        this.A07 = setA08;
        return setA08;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    @CheckForNull
    public final V get(@CheckForNull Object key) {
        Map<K, V> delegate = A0h();
        if (delegate != null) {
            return delegate.get(key);
        }
        int iA07 = A07(key);
        int index = A0A[5].length();
        if (index != 10) {
            throw new RuntimeException();
        }
        A0A[5] = "VoGkazUuID";
        if (iA07 == -1) {
            return null;
        }
        A0k(iA07);
        return A0F(iA07);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final Set<K> keySet() {
        if (this.A08 != null) {
            return this.A08;
        }
        Set<K> setA09 = A09();
        this.A08 = setA09;
        return setA09;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    /* JADX WARN: Multi-variable type inference failed */
    private void readObject(ObjectInputStream stream) throws ClassNotFoundException, IOException {
        stream.defaultReadObject();
        int i5 = stream.readInt();
        if (i5 >= 0) {
            A0l(i5);
            for (int i11 = 0; i11 < i5; i11++) {
                put(stream.readObject(), stream.readObject());
            }
            return;
        }
        throw new InvalidObjectException(A0L(50, 14, 27) + i5);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    @CheckForNull
    public final V remove(@CheckForNull Object obj) {
        Map<K, V> mapA0h = A0h();
        if (mapA0h != null) {
            return mapA0h.remove(obj);
        }
        V v11 = (V) A0K(obj);
        if (v11 == A0B) {
            return null;
        }
        return v11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    @Override // java.util.AbstractMap, java.util.Map
    public final Collection<V> values() {
        if (this.A06 != null) {
            return this.A06;
        }
        Collection<V> collectionA0A = A0A();
        this.A06 = collectionA0A;
        return collectionA0A;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W0 != com.google.common.collect.CompactHashMap<K, V> */
    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeInt(size());
        Iterator<Map.Entry<K, V>> itA0d = A0d();
        while (itA0d.hasNext()) {
            Map.Entry<K, V> e3 = itA0d.next();
            stream.writeObject(e3.getKey());
            stream.writeObject(e3.getValue());
        }
    }
}
