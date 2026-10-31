package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.3d, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC06083d<K, V> extends AbstractC06354f<K, V> implements InterfaceC07519i<K, V> {
    public static final long serialVersionUID = 6588350623831699109L;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC06354f
    public final Collection<V> A0F(@ParametricNullness K key, Collection<V> collection) {
        return A0H(key, (List) collection, null);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3d != com.google.common.collect.AbstractListMultimap<K, V> */
    public AbstractC06083d(Map<K, Collection<V>> map) {
        super(map);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3d != com.google.common.collect.AbstractListMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC06354f
    public final <E> Collection<E> A0G(Collection<E> collection) {
        return Collections.unmodifiableList((List) collection);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3d != com.google.common.collect.AbstractListMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07669x, com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public Map<K, Collection<V>> A4i() {
        return super.A4i();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3d != com.google.common.collect.AbstractListMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC06354f, com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public boolean AIR(@ParametricNullness K key, @ParametricNullness V value) {
        return super.AIR(key, value);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3d != com.google.common.collect.AbstractListMultimap<K, V> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07669x
    public boolean equals(@CheckForNull Object object) {
        return super.equals(object);
    }
}
