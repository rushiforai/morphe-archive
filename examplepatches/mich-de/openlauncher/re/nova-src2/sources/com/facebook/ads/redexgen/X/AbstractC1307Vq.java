package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.errorprone.annotations.DoNotMock;
import com.google.errorprone.annotations.concurrent.LazyInit;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.SortedMap;
import javax.annotation.CheckForNull;

@DoNotMock
@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1307Vq<K, V> implements Map<K, V>, Serializable {
    public static byte[] A03 = null;
    public static String[] A04 = {"RbFvzwdJEDOKyx8H1hRwr", "gLvi", "wJ4SG4DiMC070d1W", "PXkywC9TsqaxthLd", "RjnCDL70BkhAf2WJnrMAr66K4ZNhbVA1", "6uBDV4rzP2JvdhUhMQE7yjU5q6AF3V0d", "uAyDx2lRXdmrkzhY", "7PuuOn72NJ8xuE5lhqBHD629fv8hvq"};
    public static final Map.Entry<?, ?>[] A05;
    public static final long serialVersionUID = 912559;

    @CheckForNull
    @LazyInit
    public transient AbstractC1310Vt<V> A00;

    @CheckForNull
    @LazyInit
    public transient AbstractC07539k<Map.Entry<K, V>> A01;

    @CheckForNull
    @LazyInit
    public transient AbstractC07539k<K> A02;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <K, V> AbstractC1307Vq<K, V> A05(Iterable<? extends Map.Entry<? extends K, ? extends V>> entries) {
        C1308Vr c1308Vr = new C1308Vr(entries instanceof Collection ? ((Collection) entries).size() : 4);
        c1308Vr.A04(entries);
        return c1308Vr.A07();
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = (bArrCopyOfRange[i13] - i12) - 112;
            if (A04[7].length() != 30) {
                throw new RuntimeException();
            }
            A04[1] = "jPE";
            bArrCopyOfRange[i13] = (byte) i14;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A03 = new byte[]{-50, -20, -34, -103, -52, -34, -21, -30, -38, -27, -30, -13, -34, -35, -65, -24, -21, -26};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Map
    /* renamed from: A09, reason: merged with bridge method [inline-methods] */
    public AbstractC1310Vt<V> values() {
        AbstractC1310Vt<V> abstractC1310Vt = this.A00;
        if (abstractC1310Vt != null) {
            return abstractC1310Vt;
        }
        AbstractC1310Vt<V> abstractC1310VtA0A = A0A();
        this.A00 = abstractC1310VtA0A;
        return abstractC1310VtA0A;
    }

    public abstract AbstractC1310Vt<V> A0A();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Map
    /* renamed from: A0B, reason: merged with bridge method [inline-methods] */
    public AbstractC07539k<Map.Entry<K, V>> entrySet() {
        AbstractC07539k<Map.Entry<K, V>> abstractC07539k = this.A01;
        if (abstractC07539k != null) {
            return abstractC07539k;
        }
        AbstractC07539k<Map.Entry<K, V>> abstractC07539kA0D = A0D();
        this.A01 = abstractC07539kA0D;
        return abstractC07539kA0D;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Map
    /* renamed from: A0C, reason: merged with bridge method [inline-methods] */
    public AbstractC07539k<K> keySet() {
        AbstractC07539k<K> abstractC07539k = this.A02;
        if (abstractC07539k != null) {
            return abstractC07539k;
        }
        AbstractC07539k<K> abstractC07539kA0E = A0E();
        this.A02 = abstractC07539kA0E;
        return abstractC07539kA0E;
    }

    public abstract AbstractC07539k<Map.Entry<K, V>> A0D();

    public abstract AbstractC07539k<K> A0E();

    public abstract boolean A0F();

    @Override // java.util.Map
    @CheckForNull
    public abstract V get(@CheckForNull Object key);

    static {
        A08();
        A05 = new Map.Entry[0];
    }

    public static <K, V> C1308Vr<K, V> A03() {
        return new C1308Vr<>();
    }

    public static <K, V> AbstractC1307Vq<K, V> A04() {
        AbstractC1307Vq<K, V> abstractC1307Vq = (AbstractC1307Vq<K, V>) C9X.A04;
        if (A04[6].length() != 16) {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[2] = "KczvPZKCOxXZmzsX";
        strArr[3] = "z6iwHJiMzCNPGuEM";
        return abstractC1307Vq;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    public static <K, V> AbstractC1307Vq<K, V> A06(Map<? extends K, ? extends V> map) {
        if ((map instanceof AbstractC1307Vq) && !(map instanceof SortedMap)) {
            AbstractC1307Vq<K, V> abstractC1307Vq = (AbstractC1307Vq) map;
            if (!abstractC1307Vq.A0F()) {
                return abstractC1307Vq;
            }
        }
        return A05(map.entrySet());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    public boolean containsKey(@CheckForNull Object key) {
        return get(key) != null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    public final boolean containsValue(@CheckForNull Object value) {
        return values().contains(value);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    public boolean equals(@CheckForNull Object object) {
        return AbstractC1300Vj.A0B(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    @CheckForNull
    public final V getOrDefault(@CheckForNull Object key, @CheckForNull V defaultValue) {
        V result = get(key);
        if (result != null) {
            return result;
        }
        return defaultValue;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    public int hashCode() {
        return VX.A00(entrySet());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    public final boolean isEmpty() {
        return size() == 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    @CheckForNull
    @Deprecated
    public final V put(K k11, V v11) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    @Deprecated
    public final void putAll(Map<? extends K, ? extends V> map) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    private void readObject(ObjectInputStream stream) throws InvalidObjectException {
        throw new InvalidObjectException(A07(0, 18, 9));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    @Override // java.util.Map
    @CheckForNull
    @Deprecated
    public final V remove(@CheckForNull Object o) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vq != com.google.common.collect.ImmutableMap<K, V> */
    public final String toString() {
        return AbstractC1300Vj.A08(this);
    }
}
