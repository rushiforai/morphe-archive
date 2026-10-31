package com.facebook.ads.redexgen.X;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V, K] */
/* renamed from: com.facebook.ads.redexgen.X.4i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06384i<K, V> extends C07469d<K, Collection<V>> {
    public final /* synthetic */ AbstractC06354f A00;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    public C06384i(final AbstractC06354f this$0, final Map<K, Collection<V>> subMap) {
        super(subMap);
        this.A00 = this$0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // com.facebook.ads.redexgen.X.C07469d, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        AbstractC1304Vn.A09(iterator());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection<?> c11) {
        return A00().keySet().containsAll(c11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // java.util.AbstractSet, java.util.Collection, java.util.Set
    public final boolean equals(@CheckForNull Object object) {
        return this == object || A00().keySet().equals(object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // java.util.AbstractSet, java.util.Collection, java.util.Set
    public final int hashCode() {
        return A00().keySet().hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // com.facebook.ads.redexgen.X.C07469d, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator<K> iterator() {
        return new WF(this, A00().entrySet().iterator());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4i != com.google.common.collect.AbstractMapBasedMultimap<K, V>$KeySet */
    @Override // com.facebook.ads.redexgen.X.C07469d, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(@CheckForNull Object key) {
        int size = 0;
        Collection collection = (Collection) A00().remove(key);
        if (collection != null) {
            size = collection.size();
            collection.clear();
            AbstractC06354f.A03(this.A00, size);
        }
        return size > 0;
    }
}
