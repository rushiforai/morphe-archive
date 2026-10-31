package com.facebook.ads.redexgen.X;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.h6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1850h6<K, V> {

    /* JADX WARN: Incorrect inner types in field signature: Lcom/facebook/ads/redexgen/X/h6<TK;TV;>.EntrySet; */
    @Nullable
    public C1846h2 A00;

    /* JADX WARN: Incorrect inner types in field signature: Lcom/facebook/ads/redexgen/X/h6<TK;TV;>.KeySet; */
    @Nullable
    public C1847h3 A01;

    /* JADX WARN: Incorrect inner types in field signature: Lcom/facebook/ads/redexgen/X/h6<TK;TV;>.ValuesCollection; */
    @Nullable
    public C1849h5 A02;

    public abstract int A04();

    public abstract int A05(Object obj);

    public abstract int A06(Object obj);

    public abstract Map<K, V> A07();

    public abstract Object A0B(int i5, int i11);

    public abstract V A0C(int i5, V v11);

    public abstract void A0D();

    public abstract void A0E(int i5);

    public abstract void A0F(K k11, V v11);

    public static <K, V> boolean A00(Map<K, V> map, Collection<?> collection) {
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            if (!map.containsKey(it.next())) {
                return false;
            }
        }
        return true;
    }

    public static <K, V> boolean A01(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            map.remove(it.next());
        }
        int oldSize = map.size();
        return size != oldSize;
    }

    public static <K, V> boolean A02(Map<K, V> map, Collection<?> collection) {
        int size = map.size();
        Iterator<K> it = map.keySet().iterator();
        while (it.hasNext()) {
            if (!collection.contains(it.next())) {
                it.remove();
            }
        }
        int oldSize = map.size();
        return size != oldSize;
    }

    public static <T> boolean A03(Set<T> set, Object obj) {
        if (set == obj) {
            return true;
        }
        if (!(obj instanceof Set)) {
            return false;
        }
        Set<T> set2 = (Set) obj;
        try {
            if (set.size() == set2.size()) {
                if (set.containsAll(set2)) {
                    return true;
                }
            }
            return false;
        } catch (ClassCastException unused) {
            return false;
        } catch (NullPointerException unused2) {
            return false;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h6 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V> */
    public final Set<Map.Entry<K, V>> A08() {
        if (this.A00 == null) {
            this.A00 = new C1846h2(this);
        }
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h6 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V> */
    public final Set<K> A09() {
        if (this.A01 == null) {
            this.A01 = new C1847h3(this);
        }
        return this.A01;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h6 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V> */
    public final Collection<V> A0A() {
        if (this.A02 == null) {
            this.A02 = new C1849h5(this);
        }
        return this.A02;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h6 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V> */
    public final Object[] A0G(int i5) {
        int iA04 = A04();
        Object[] objArr = new Object[iA04];
        for (int i11 = 0; i11 < iA04; i11++) {
            objArr[i11] = A0B(i11, i5);
        }
        return objArr;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h6 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V> */
    public final <T> T[] A0H(T[] tArr, int i5) {
        int iA04 = A04();
        if (tArr.length < iA04) {
            tArr = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), iA04));
        }
        for (int i11 = 0; i11 < iA04; i11++) {
            tArr[i11] = A0B(i11, i5);
        }
        if (tArr.length > iA04) {
            tArr[iA04] = null;
        }
        return tArr;
    }
}
