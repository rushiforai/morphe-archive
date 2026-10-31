package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V] */
/* loaded from: assets/audience_network/classes.dex */
public class WA<V> extends AbstractCollection<V> {
    public static String[] A05 = {"hAKsIPREBwvb1ph2MU4g11phNTOhrko4", "fZHlxnJImuFrwRZMjWBgdoWYIrFojPHg", "C8ik00q", "cBq9Ux8kTvo4CGVS7gbnYEXe2xnQSvgt", "h1VWh76mYtGF9mOosL5WpzReHjb0yPxr", "vksan3l0tiq8e7QtqT31ToCQuT2wIfeJ", "GlsRgUvJdphSZxaGndpdzYK6LFAZFcf9", "WF39wDJVpxrezVU4gxWdxtxi"};
    public Collection<V> A00;

    /* JADX WARN: Incorrect inner types in field signature: Lcom/facebook/ads/redexgen/X/4f<TK;TV;>.WrappedCollection; */
    @CheckForNull
    public final WA A01;

    @ParametricNullness
    public final K A02;

    @CheckForNull
    public final Collection<V> A03;
    public final /* synthetic */ AbstractC06354f A04;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean addAll(Collection<? extends V> collection) {
        if (collection.isEmpty()) {
            if (A05[5].charAt(6) != 'l') {
                throw new RuntimeException();
            }
            A05[5] = "x0OCRKlqzqKIlSwWVID68fWzrWPKd3Ke";
            return false;
        }
        int size = size();
        boolean zAddAll = this.A00.addAll(collection);
        if (zAddAll) {
            AbstractC06354f.A02(this.A04, this.A00.size() - size);
            if (size == 0) {
                A03();
            }
        }
        return zAddAll;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean removeAll(Collection<?> c11) {
        if (c11.isEmpty()) {
            return false;
        }
        int size = size();
        boolean zRemoveAll = this.A00.removeAll(c11);
        if (zRemoveAll) {
            AbstractC06354f.A02(this.A04, this.A00.size() - size);
            A05();
        }
        return zRemoveAll;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 6
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean retainAll(Collection<?> c11) {
        AbstractC1335Wu.A04(c11);
        int size = size();
        boolean zRetainAll = this.A00.retainAll(c11);
        if (zRetainAll) {
            AbstractC06354f.A02(this.A04, this.A00.size() - size);
            A05();
        }
        return zRetainAll;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    /* JADX WARN: Incorrect inner types in method signature: (TK;Ljava/util/Collection<TV;>;Lcom/facebook/ads/redexgen/X/4f<TK;TV;>.WrappedCollection;)V */
    /* JADX WARN: Multi-variable type inference failed */
    public WA(@ParametricNullness final AbstractC06354f this$0, @CheckForNull Object key, Collection delegate, WA ancestor) {
        this.A04 = this$0;
        this.A02 = key;
        this.A00 = delegate;
        this.A01 = ancestor;
        this.A03 = ancestor == null ? null : ancestor.A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    /* JADX WARN: Incorrect inner types in method signature: ()Lcom/facebook/ads/redexgen/X/4f<TK;TV;>.WrappedCollection; */
    @CheckForNull
    public final WA A00() {
        return this.A01;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @ParametricNullness
    public final K A01() {
        return this.A02;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    public final Collection<V> A02() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    public final void A03() {
        if (this.A01 == null) {
            this.A04.A01.put(this.A02, this.A00);
        } else {
            this.A01.A03();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    public final void A04() {
        Collection<V> newDelegate;
        if (this.A01 != null) {
            this.A01.A04();
            if (this.A01.A02() == this.A03) {
            } else {
                throw new ConcurrentModificationException();
            }
        } else {
            if (!this.A00.isEmpty() || (newDelegate = (Collection) this.A04.A01.get(this.A02)) == null) {
                return;
            }
            this.A00 = newDelegate;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    public final void A05() {
        if (this.A01 != null) {
            this.A01.A05();
        } else if (this.A00.isEmpty()) {
            this.A04.A01.remove(this.A02);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(@ParametricNullness V value) {
        A04();
        boolean zIsEmpty = this.A00.isEmpty();
        boolean changed = this.A00.add(value);
        if (changed) {
            AbstractC06354f.A00(this.A04);
            if (zIsEmpty) {
                A03();
            }
        }
        return changed;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        int size = size();
        if (size == 0) {
            return;
        }
        this.A00.clear();
        AbstractC06354f.A03(this.A04, size);
        A05();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(@CheckForNull Object o) {
        A04();
        return this.A00.contains(o);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean containsAll(Collection<?> c11) {
        A04();
        return this.A00.containsAll(c11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.Collection
    public final boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        A04();
        return this.A00.equals(object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.Collection
    public final int hashCode() {
        A04();
        return this.A00.hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator<V> iterator() {
        A04();
        return new WC(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean remove(@CheckForNull Object o) {
        A04();
        boolean zRemove = this.A00.remove(o);
        if (zRemove) {
            AbstractC06354f.A01(this.A04);
            A05();
        }
        return zRemove;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        A04();
        return this.A00.size();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    @Override // java.util.AbstractCollection
    public final String toString() {
        A04();
        return this.A00.toString();
    }
}
