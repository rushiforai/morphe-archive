package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V, K] */
/* renamed from: com.facebook.ads.redexgen.X.3c, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06073c<K, V> extends AbstractC06354f<K, V>.SortedAsMap implements NavigableMap<K, Collection<V>> {
    public final /* synthetic */ AbstractC06354f A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @CheckForNull
    private final Map.Entry<K, Collection<V>> A01(Iterator<Map.Entry<K, Collection<V>>> entryIterator) {
        if (!entryIterator.hasNext()) {
            return null;
        }
        Map.Entry<K, Collection<V>> next = entryIterator.next();
        Collection<V> collectionA0D = this.A00.A0D();
        collectionA0D.addAll(next.getValue());
        entryIterator.remove();
        return AbstractC1300Vj.A01(next.getKey(), this.A00.A0G(collectionA0D));
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> ceilingEntry(@ParametricNullness K key) {
        Map.Entry<K, Collection<V>> entryCeilingEntry = A0B().ceilingEntry(key);
        if (entryCeilingEntry == null) {
            return null;
        }
        return A0A(entryCeilingEntry);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> firstEntry() {
        Map.Entry<K, Collection<V>> entryFirstEntry = A0B().firstEntry();
        if (entryFirstEntry == null) {
            return null;
        }
        return A0A(entryFirstEntry);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> floorEntry(@ParametricNullness K key) {
        Map.Entry<K, Collection<V>> entryFloorEntry = A0B().floorEntry(key);
        if (entryFloorEntry == null) {
            return null;
        }
        return A0A(entryFloorEntry);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> higherEntry(@ParametricNullness K key) {
        Map.Entry<K, Collection<V>> entryHigherEntry = A0B().higherEntry(key);
        if (entryHigherEntry == null) {
            return null;
        }
        return A0A(entryHigherEntry);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> lastEntry() {
        Map.Entry<K, Collection<V>> entryLastEntry = A0B().lastEntry();
        if (entryLastEntry == null) {
            return null;
        }
        return A0A(entryLastEntry);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> lowerEntry(@ParametricNullness K key) {
        Map.Entry<K, Collection<V>> entryLowerEntry = A0B().lowerEntry(key);
        if (entryLowerEntry == null) {
            return null;
        }
        return A0A(entryLowerEntry);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    public C06073c(final AbstractC06354f this$0, NavigableMap<K, Collection<V>> submap) {
        super(this$0, submap);
        this.A00 = this$0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final NavigableSet<K> A0C() {
        return new C3R(this.A00, A0B());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final NavigableMap<K, Collection<V>> A0B() {
        return (NavigableMap) super.A0B();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap, java.util.SortedMap
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public final NavigableMap<K, Collection<V>> headMap(@ParametricNullness K toKey) {
        return headMap(toKey, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap, java.util.SortedMap
    /* renamed from: A04, reason: merged with bridge method [inline-methods] */
    public final NavigableMap<K, Collection<V>> tailMap(@ParametricNullness K fromKey) {
        return tailMap(fromKey, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap, java.util.SortedMap
    /* renamed from: A05, reason: merged with bridge method [inline-methods] */
    public final NavigableMap<K, Collection<V>> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
        return subMap(fromKey, true, toKey, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.SortedMap, java.util.Map
    /* renamed from: A06, reason: merged with bridge method [inline-methods] and merged with bridge method [inline-methods] */
    public final NavigableSet<K> keySet() {
        return (NavigableSet) super.keySet();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final K ceilingKey(@ParametricNullness K key) {
        return A0B().ceilingKey(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableSet<K> descendingKeySet() {
        return descendingMap().navigableKeySet();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableMap<K, Collection<V>> descendingMap() {
        return new C06073c(this.A00, A0B().descendingMap());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final K floorKey(@ParametricNullness K key) {
        return A0B().floorKey(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableMap<K, Collection<V>> headMap(@ParametricNullness K toKey, boolean inclusive) {
        return new C06073c(this.A00, A0B().headMap(toKey, inclusive));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final K higherKey(@ParametricNullness K key) {
        return A0B().higherKey(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final K lowerKey(@ParametricNullness K key) {
        return A0B().lowerKey(key);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableSet<K> navigableKeySet() {
        return keySet();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> pollFirstEntry() {
        return A01(entrySet().iterator());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    @CheckForNull
    public final Map.Entry<K, Collection<V>> pollLastEntry() {
        return A01(descendingMap().entrySet().iterator());
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableMap<K, Collection<V>> subMap(@ParametricNullness K fromKey, @ParametricNullness boolean fromInclusive, K toKey, boolean toInclusive) {
        return new C06073c(this.A00, A0B().subMap(fromKey, fromInclusive, toKey, toInclusive));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3c != com.google.common.collect.AbstractMapBasedMultimap<K, V>$NavigableAsMap */
    @Override // java.util.NavigableMap
    public final NavigableMap<K, Collection<V>> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
        return new C06073c(this.A00, A0B().tailMap(fromKey, inclusive));
    }
}
