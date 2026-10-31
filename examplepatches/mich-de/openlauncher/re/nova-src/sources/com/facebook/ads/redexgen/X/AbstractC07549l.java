package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9l, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC07549l<E> extends AbstractC1310Vt<E> implements List<E>, RandomAccess {
    public static byte[] A00 = null;
    public static String[] A01 = {"fA1fnNssArdKpNGuPvEGSzi7pOUZHm7v", "qns5CkO3MVDTshXVoTiVucy5w98kVhX8", "FBilluItLEFIj11sI", "xhOoaGlUfdtuNUXUR7COCy2p48irks40", "B9QowLQGlwGuP7x5xkpjNnYcMu4XR0jN", "IeItZmW1RXx", "W7RLvvUGiTAKxasjeCPHrioAHehOTeSb", "bhxfXmBriQ73PypRFft5YTIqbznKEvYb"};
    public static final C9R<Object> A02;
    public static final long serialVersionUID = -889275714;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <E> AbstractC07549l<E> A05(Collection<? extends E> elements) {
        if (!(elements instanceof AbstractC1310Vt)) {
            return A08(elements.toArray());
        }
        AbstractC07549l<E> abstractC07549lA0J = ((AbstractC1310Vt) elements).A0J();
        return abstractC07549lA0J.A0K() ? A06(abstractC07549lA0J.toArray()) : abstractC07549lA0J;
    }

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 84);
            String[] strArr = A01;
            if (strArr[1].charAt(21) == strArr[0].charAt(21)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "dhQRA9x0T6ID6JuO896L24zk9QRH59k7";
            strArr2[7] = "7htLPED1qaLsB4bVZYo3T5RxRWmBeLII";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A00 = new byte[]{-74, -44, -58, -127, -76, -58, -45, -54, -62, -51, -54, -37, -58, -59, -89, -48, -45, -50};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        int size = size();
        for (int i11 = 0; i11 < size; i11++) {
            i5 = ~(~((i5 * 31) + get(i11).hashCode()));
        }
        return i5;
    }

    static {
        A0B();
        A02 = new C06063a(C4Y.A02, 0);
    }

    public static <E> C06344e<E> A01() {
        return new C06344e<>();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    private final AbstractC07549l<E> A02(final int fromIndex, int toIndex) {
        final int i5 = toIndex - fromIndex;
        return new AbstractC07549l<E>(fromIndex, i5) { // from class: com.facebook.ads.redexgen.X.4d
            public final transient int A00;
            public final transient int A01;

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            {
                this.A01 = fromIndex;
                this.A00 = i5;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
            public final int A0G() {
                return this.A02.A0H() + this.A01 + this.A00;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
            public final int A0H() {
                return this.A02.A0H() + this.A01;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
            public final boolean A0K() {
                return true;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
            @CheckForNull
            public final Object[] A0L() {
                return this.A02.A0L();
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC07549l, java.util.List
            /* renamed from: A0M */
            public final AbstractC07549l<E> subList(int fromIndex2, int toIndex2) {
                AbstractC1335Wu.A0B(fromIndex2, toIndex2, this.A00);
                return this.A02.subList(this.A01 + fromIndex2, this.A01 + toIndex2);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // java.util.List
            public final E get(int index) {
                AbstractC1335Wu.A00(index, this.A00);
                return this.A02.get(this.A01 + index);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC07549l, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
            public final /* bridge */ /* synthetic */ Iterator iterator() {
                return iterator();
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC07549l, java.util.List
            public final /* bridge */ /* synthetic */ ListIterator listIterator() {
                return listIterator();
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // com.facebook.ads.redexgen.X.AbstractC07549l, java.util.List
            public final /* bridge */ /* synthetic */ ListIterator listIterator(int index) {
                return super.listIterator(index);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4d != com.google.common.collect.ImmutableList<E>$SubList */
            @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
            public final int size() {
                return this.A00;
            }
        };
    }

    public static <E> AbstractC07549l<E> A03() {
        return (AbstractC07549l<E>) C4Y.A02;
    }

    public static <E> AbstractC07549l<E> A04(E e12) {
        return A08(e12);
    }

    public static <E> AbstractC07549l<E> A06(Object[] elements) {
        return A09(elements, elements.length);
    }

    public static <E> AbstractC07549l<E> A07(E[] elements) {
        if (elements.length == 0) {
            return A03();
        }
        return A08((Object[]) elements.clone());
    }

    public static <E> AbstractC07549l<E> A08(Object... elements) {
        return A06(AbstractC1295Vd.A03(elements));
    }

    public static <E> AbstractC07549l<E> A09(Object[] elements, int length) {
        if (length == 0) {
            return A03();
        }
        return new C4Y(elements, length);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public int A0I(Object[] dst, int offset) {
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            int i11 = offset + i5;
            dst[i11] = get(i5);
        }
        return offset + size;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    @Deprecated
    public final AbstractC07549l<E> A0J() {
        return this;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    /* renamed from: A0M, reason: merged with bridge method [inline-methods] */
    public AbstractC07549l<E> subList(int fromIndex, int toIndex) {
        AbstractC1335Wu.A0B(fromIndex, toIndex, size());
        int i5 = toIndex - fromIndex;
        int length = size();
        if (i5 == length) {
            return this;
        }
        if (i5 == 0) {
            return A03();
        }
        return A02(fromIndex, toIndex);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    /* renamed from: A0N, reason: merged with bridge method [inline-methods] */
    public final VV<E> iterator() {
        return listIterator();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    /* renamed from: A0O, reason: merged with bridge method [inline-methods] */
    public final C9R<E> listIterator() {
        return listIterator(0);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    /* renamed from: A0P, reason: merged with bridge method [inline-methods] */
    public C9R<E> listIterator(int i5) {
        AbstractC1335Wu.A01(i5, size());
        if (isEmpty()) {
            return (C9R<E>) A02;
        }
        return new C06063a(this, i5);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    @Deprecated
    public final void add(int index, E element) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    @Deprecated
    public final boolean addAll(int index, Collection<? extends E> newElements) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(@CheckForNull Object object) {
        return indexOf(object) >= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.Collection, java.util.List
    public final boolean equals(@CheckForNull Object obj) {
        return AbstractC1303Vm.A06(this, obj);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    public int indexOf(@CheckForNull Object object) {
        if (object == null) {
            return -1;
        }
        return AbstractC1303Vm.A00(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    public int lastIndexOf(@CheckForNull Object object) {
        if (object == null) {
            return -1;
        }
        return AbstractC1303Vm.A01(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    private void readObject(ObjectInputStream stream) throws InvalidObjectException {
        throw new InvalidObjectException(A0A(0, 18, 13));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    @Deprecated
    public final E remove(int index) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    @Override // java.util.List
    @Deprecated
    public final E set(int index, E element) {
        throw new UnsupportedOperationException();
    }
}
