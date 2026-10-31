package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import java.util.RandomAccess;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.4f, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC06354f<K, V> extends AbstractC07669x<K, V> implements Serializable {
    public static byte[] A02 = null;
    public static String[] A03 = {"CFqdYrNFqozxVsEXuclWp5kj7BTcigVB", "3CwrOYcAVgjpR6iTz4fC", "UCIF93wXvJTfTAT1flu1ESoYD0usKOB", "cw", "hv", "dpJjIkRheSEpuKg7anQr689e1pRAvWlR", "r0FFbjKWsYq", "e4S8qg31usv4K8KGEqP3ThmJHIH8eUlE"};
    public static final long serialVersionUID = 2447537837011683357L;
    public transient int A00;
    public transient Map<K, Collection<V>> A01;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A02 = new byte[]{14, 37, 55, 96, 3, 47, 44, 44, 37, 35, 52, 41, 47, 46, 96, 54, 41, 47, 44, 33, 52, 37, 36, 96, 52, 40, 37, 96, 3, 47, 44, 44, 37, 35, 52, 41, 47, 46, 96, 51, 48, 37, 35};
    }

    public abstract Collection<V> A0D();

    public abstract Collection<V> A0F(@ParametricNullness K key, Collection<V> collection);

    public abstract <E> Collection<E> A0G(Collection<E> collection);

    static {
        A08();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public AbstractC06354f(Map<K, Collection<V>> map) {
        AbstractC1335Wu.A0C(map.isEmpty());
        this.A01 = map;
    }

    public static /* synthetic */ int A00(AbstractC06354f abstractC06354f) {
        int i5 = abstractC06354f.A00;
        abstractC06354f.A00 = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int A01(AbstractC06354f abstractC06354f) {
        int i5 = abstractC06354f.A00;
        abstractC06354f.A00 = i5 - 1;
        return i5;
    }

    public static /* synthetic */ int A02(AbstractC06354f abstractC06354f, int i5) {
        int i11 = abstractC06354f.A00 + i5;
        abstractC06354f.A00 = i11;
        return i11;
    }

    public static /* synthetic */ int A03(AbstractC06354f abstractC06354f, int i5) {
        int i11 = abstractC06354f.A00 - i5;
        abstractC06354f.A00 = i11;
        return i11;
    }

    public static <E> Iterator<E> A05(Collection<E> collection) {
        if (collection instanceof List) {
            return ((List) collection).listIterator();
        }
        return collection.iterator();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public void A0A(@CheckForNull Object key) {
        Collection<V> collection = (Collection) AbstractC1300Vj.A06(this.A01, key);
        if (collection != null) {
            int count = collection.size();
            collection.clear();
            this.A00 -= count;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07669x
    public final Collection<V> A0B() {
        return new W8(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07669x
    public Iterator<V> A0C() {
        return new A1(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public Collection<V> A0E(@ParametricNullness K key) {
        return A0D();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    /* JADX WARN: Incorrect inner types in method signature: (TK;Ljava/util/List<TV;>;Lcom/facebook/ads/redexgen/X/4f<TK;TV;>.WrappedCollection;)Ljava/util/List<TV;>; */
    public final List A0H(@ParametricNullness Object key, @CheckForNull List list, WA ancestor) {
        if (list instanceof RandomAccess) {
            return new C06374h(this, key, list, ancestor);
        }
        return new C07679y(this, key, list, ancestor);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public Map<K, Collection<V>> A0I() {
        return this.A01;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public final Map<K, Collection<V>> A0J() {
        if (this.A01 instanceof NavigableMap) {
            return new C06073c(this, (NavigableMap) this.A01);
        }
        if (this.A01 instanceof SortedMap) {
            return new C06364g(this, (SortedMap) this.A01);
        }
        return new A0(this, this.A01);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public final Set<K> A0K() {
        if (this.A01 instanceof NavigableMap) {
            return new C3R(this, (NavigableMap) this.A01);
        }
        if (this.A01 instanceof SortedMap) {
            return new C3b(this, (SortedMap) this.A01);
        }
        return new C06384i(this, this.A01);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    public final void A0L(Map<K, Collection<V>> map) {
        this.A01 = map;
        this.A00 = 0;
        for (Collection<V> collection : map.values()) {
            AbstractC1335Wu.A0C(!collection.isEmpty());
            this.A00 += collection.size();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public boolean AIR(@ParametricNullness K key, @ParametricNullness V value) {
        Collection<V> collection = this.A01.get(key);
        if (collection == null) {
            Collection<V> collectionA0E = A0E(key);
            if (collectionA0E.add(value)) {
                int i5 = this.A00 + 1;
                if (A03[6].length() == 10) {
                    throw new RuntimeException();
                }
                String[] strArr = A03;
                strArr[5] = "ChrSn2a1QTE4YKBA4wCmw8huk0G5mxlS";
                strArr[7] = "eqR5HWIv3WFZu0owXdjhPSRllQGx9dlV";
                this.A00 = i5;
                this.A01.put(key, collectionA0E);
                return true;
            }
            throw new AssertionError(A04(0, 43, 55));
        }
        if (collection.add(value)) {
            this.A00++;
            return true;
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public void clear() {
        Iterator<Collection<V>> it = this.A01.values().iterator();
        while (it.hasNext()) {
            it.next().clear();
        }
        this.A01.clear();
        this.A00 = 0;
        if (A03[6].length() == 10) {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[5] = "osYd2Adb7UzfwvNeM6F0OGAG4u191OlP";
        strArr[7] = "g3XaS2AWzMjDIPwUkus9IC2iuVkk2Rld";
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public int size() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4f != com.google.common.collect.AbstractMapBasedMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07669x, com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public Collection<V> values() {
        return super.values();
    }
}
