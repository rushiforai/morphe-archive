package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9o, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC07579o<K, V> extends AbstractC1313Vw implements Map<K, V> {
    public abstract Map<K, V> A05();

    public abstract boolean containsValue(@CheckForNull Object value);

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public final int A04() {
        return VX.A00(entrySet());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public final boolean A06(@CheckForNull Object value) {
        return AbstractC1300Vj.A0A(this, value);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public final boolean A07(@CheckForNull Object object) {
        return AbstractC1300Vj.A0B(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @Override // java.util.Map
    public void clear() {
        A05().clear();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public boolean containsKey(@CheckForNull Object key) {
        return A05().containsKey(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public Set<Map.Entry<K, V>> entrySet() {
        return A05().entrySet();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @CheckForNull
    public V get(@CheckForNull Object key) {
        return A05().get(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public boolean isEmpty() {
        return A05().isEmpty();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public Set<K> keySet() {
        return A05().keySet();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @Override // java.util.Map
    @CheckForNull
    public V put(@ParametricNullness K key, @ParametricNullness V value) {
        return A05().put(key, value);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> map) {
        A05().putAll(map);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @Override // java.util.Map
    @CheckForNull
    public V remove(@CheckForNull Object key) {
        return A05().remove(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    public int size() {
        return A05().size();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9o != com.google.common.collect.ForwardingMap<K, V> */
    @Override // java.util.Map
    public Collection<V> values() {
        return A05().values();
    }
}
