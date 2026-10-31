package com.facebook.ads.redexgen.X;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V, K] */
/* loaded from: assets/audience_network/classes.dex */
public class A0<K, V> extends AbstractC1301Vk<K, Collection<V>> {
    public static String[] A02 = {"1zW1u388zuzGyhMuMzs3oivw7wochIWY", "jnUfZ58N5wHVQnYSRb", "g", "9tzpVYV6coB4HDeDmOKgWYaPOfRBTrER", "x6ru3GW0ey7gIsLkoWFiPV2pltA863QY", "1RvHULj5Fnt35CqaccWf9yltGIitj2uw", "D8UCDKgUWClzfEB1azVrkyvbFoEj9kF8", "XnO6jOZJ79d9MfY79AgITZOyNOx"};
    public final transient Map<K, Collection<V>> A00;
    public final /* synthetic */ AbstractC06354f A01;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    public A0(final AbstractC06354f this$0, Map<K, Collection<V>> submap) {
        this.A01 = this$0;
        this.A00 = submap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    @CheckForNull
    /* renamed from: A07, reason: merged with bridge method [inline-methods] */
    public final Collection<V> get(@CheckForNull Object key) {
        Collection<V> collection = (Collection) AbstractC1300Vj.A05(this.A00, key);
        if (collection == null) {
            return null;
        }
        Collection<V> collection2 = this.A01.A0F(key, collection);
        return collection2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    @CheckForNull
    /* renamed from: A08, reason: merged with bridge method [inline-methods] */
    public final Collection<V> remove(@CheckForNull Object key) {
        Collection<V> collectionRemove = this.A00.remove(key);
        if (collectionRemove == null) {
            return null;
        }
        AbstractC06354f abstractC06354f = this.A01;
        if (A02[4].charAt(7) != '0') {
            throw new RuntimeException();
        }
        A02[3] = "eLCmSzstXWgN5PgJDOx4epK2D7opO4DE";
        Collection<V> collectionA0D = abstractC06354f.A0D();
        collectionA0D.addAll(collectionRemove);
        AbstractC06354f.A03(this.A01, collectionRemove.size());
        collectionRemove.clear();
        return collectionA0D;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // com.facebook.ads.redexgen.X.AbstractC1301Vk
    public final Set<Map.Entry<K, Collection<V>>> A09() {
        return new AbstractC07479e<K, Collection<V>>() { // from class: com.facebook.ads.redexgen.X.4j
            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4j != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapEntries */
            @Override // com.facebook.ads.redexgen.X.AbstractC07479e
            public final Map<K, Collection<V>> A00() {
                return this.A00;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4j != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapEntries */
            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public final boolean contains(@CheckForNull Object o) {
                return W5.A03(this.A00.A00.entrySet(), o);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4j != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapEntries */
            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public final Iterator<Map.Entry<K, Collection<V>>> iterator() {
                return new WW(this.A00);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4j != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapEntries */
            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public final boolean remove(@CheckForNull Object o) {
                if (!contains(o)) {
                    return false;
                }
                this.A00.A01.A0A(((Map.Entry) Objects.requireNonNull((Map.Entry) o)).getKey());
                return true;
            }
        };
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    public final Map.Entry<K, Collection<V>> A0A(Map.Entry<K, Collection<V>> entry) {
        K key = entry.getKey();
        return AbstractC1300Vj.A01(key, this.A01.A0F(key, entry.getValue()));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        if (this.A00 == this.A01.A01) {
            AbstractC06354f abstractC06354f = this.A01;
            String[] strArr = A02;
            if (strArr[0].charAt(12) == strArr[6].charAt(12)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[0] = "m6HJJRfAGZhiIxyke3hlcjdWYhHcU4vo";
            strArr2[6] = "5qDNUyxtlCQ6d2lWPTkfAZ6v5z79leRg";
            abstractC06354f.clear();
            return;
        }
        AbstractC1304Vn.A09(new WW(this));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(@CheckForNull Object key) {
        return AbstractC1300Vj.A0C(this.A00, key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(@CheckForNull Object object) {
        return this == object || this.A00.equals(object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        return this.A00.hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public Set<K> keySet() {
        return this.A01.A01();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.A00.size();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.A0 != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap */
    @Override // java.util.AbstractMap
    public final String toString() {
        return this.A00.toString();
    }
}
