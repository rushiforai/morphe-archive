package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.List;
import java.util.ListIterator;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V] */
/* renamed from: com.facebook.ads.redexgen.X.9y, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C07679y<V> extends AbstractC06354f<K, V>.WrappedCollection implements List<V> {
    public static String[] A01 = {"yqiMvUs1v7eVluXRUxsEyPEsBjsKjM5l", "OXPfcqd4GeIxC6iUCtvWyfUHbt36pBie", "sM6yaTXzMiDSK7ONVrY0vOid0gAsyXBa", "A8UY2RcLB4Vmv23vg0I8MPnUhN", "EQDms4pnRjFW6iPAffoEoOHe6uiWZ", "1OXOubA3adqIwS", "7KHC7W8Of3", "P6tltmPTrk6wEN"};
    public final /* synthetic */ AbstractC06354f A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.List
    public final boolean addAll(int index, Collection<? extends V> c11) {
        if (!c11.isEmpty()) {
            int size = size();
            boolean zAddAll = A06().addAll(index, c11);
            if (zAddAll) {
                AbstractC06354f.A02(this.A00, A02().size() - size);
                if (size == 0) {
                    A03();
                }
            }
            return zAddAll;
        }
        String[] strArr = A01;
        if (strArr[5].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[5] = "3Anz8TE5XMZeXm";
        strArr2[7] = "28afxSHAwq7bUv";
        return false;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WA != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection */
    /* JADX WARN: Incorrect inner types in method signature: (TK;Ljava/util/List<TV;>;Lcom/facebook/ads/redexgen/X/4f<TK;TV;>.WrappedCollection;)V */
    public C07679y(@ParametricNullness final AbstractC06354f this$0, @CheckForNull Object key, List delegate, WA ancestor) {
        super(this$0, key, delegate, ancestor);
        this.A00 = this$0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    public final List<V> A06() {
        return (List) A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final void add(@ParametricNullness int index, V element) {
        A04();
        boolean zIsEmpty = A02().isEmpty();
        A06().add(index, element);
        AbstractC06354f.A00(this.A00);
        if (zIsEmpty) {
            A03();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    @ParametricNullness
    public final V get(int index) {
        A04();
        return A06().get(index);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final int indexOf(@CheckForNull Object o) {
        A04();
        return A06().indexOf(o);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final int lastIndexOf(@CheckForNull Object o) {
        A04();
        return A06().lastIndexOf(o);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final ListIterator<V> listIterator() {
        A04();
        return new C07689z(this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final ListIterator<V> listIterator(int index) {
        A04();
        return new C07689z(this, index);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    @ParametricNullness
    public final V remove(int index) {
        A04();
        V vRemove = A06().remove(index);
        AbstractC06354f.A01(this.A00);
        A05();
        return vRemove;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    @ParametricNullness
    public final V set(@ParametricNullness int index, V element) {
        A04();
        return A06().set(index, element);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9y != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList */
    @Override // java.util.List
    public final List<V> subList(int fromIndex, int toIndex) {
        A04();
        return this.A00.A0H(A01(), A06().subList(fromIndex, toIndex), A00() == null ? this : A00());
    }
}
