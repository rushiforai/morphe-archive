package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.errorprone.annotations.concurrent.LazyInit;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9x, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC07669x<K, V> implements InterfaceC1299Vi<K, V> {
    public static String[] A03 = {"pY59XPRp4tNirWz1ghoixW58NFg7RI0c", "IyOT8Z", "l8UXh6cOE74up", "OhSNgvBU0sczpivHlA4QJ0H7Gb6AO2y8", "VYCH2plaLeDfltW1Vx0kde4", "r6WRZMQ3CPYBEcCkL2xb4DrsBMNhEfcD", "zFwMVxB0AIJD6f3TMpWk78EUOZdSz4zC", "7i6eS7dJDtTa0Yo20PDIjfK"};

    @CheckForNull
    @LazyInit
    public transient Collection<V> A00;

    @CheckForNull
    @LazyInit
    public transient Map<K, Collection<V>> A01;

    @CheckForNull
    @LazyInit
    public transient Set<K> A02;

    public abstract Map<K, Collection<V>> A00();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public Set<K> A01() {
        Set<K> set = this.A02;
        if (set != null) {
            return set;
        }
        Set<K> setA02 = A02();
        this.A02 = setA02;
        return setA02;
    }

    public abstract Set<K> A02();

    public abstract Collection<V> A0B();

    public abstract Iterator<V> A0C();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public Map<K, Collection<V>> A4i() {
        Map<K, Collection<V>> map = this.A01;
        if (map != null) {
            return map;
        }
        Map<K, Collection<V>> mapA00 = A00();
        this.A01 = mapA00;
        return mapA00;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1299Vi
    public Collection<V> values() {
        Collection<V> collection = this.A00;
        if (collection != null) {
            return collection;
        }
        Collection<V> collectionA0B = A0B();
        this.A00 = collectionA0B;
        return collectionA0B;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9x != com.google.common.collect.AbstractMultimap<K, V> */
    public boolean A03(@CheckForNull Object value) {
        Iterator<Collection<V>> it = A4i().values().iterator();
        do {
            boolean zHasNext = it.hasNext();
            if (A03[1].length() == 4) {
                throw new RuntimeException();
            }
            A03[5] = "IYywPR8rxmf4UqfAt6QZVL84Q8I7eUCK";
            if (!zHasNext) {
                return false;
            }
        } while (!it.next().contains(value));
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9x != com.google.common.collect.AbstractMultimap<K, V> */
    public boolean equals(@CheckForNull Object object) {
        return AbstractC1296Vf.A01(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9x != com.google.common.collect.AbstractMultimap<K, V> */
    public int hashCode() {
        return A4i().hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9x != com.google.common.collect.AbstractMultimap<K, V> */
    public String toString() {
        return A4i().toString();
    }
}
