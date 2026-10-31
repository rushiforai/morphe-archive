package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.errorprone.annotations.DoNotMock;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Arrays;
import java.util.Collection;
import java.util.Spliterator;
import java.util.Spliterators;
import javax.annotation.CheckForNull;

@DoNotMock
@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1310Vt<E> extends AbstractCollection<E> implements Serializable {
    public static byte[] A00 = null;
    public static String[] A01 = {"u8nI3rP8waEFF50gudtdvqiZeD9Ba8dI", "05FyFmHWetNxvZdmWBLJPFysaOz7MN8X", "zZF3qC0a6jHeshAogRK9oZS2YEEg1rGk", "CbhMCY8xhFUewhWN8dH1rmkn7e5tuaWn", "I8QdI0Vm6nLgUxchwAtVcu1u6g0Lhkl1", "Xm1MCZdI210Z7PKAI", "sNasjI4N2l9GDDEv5SgvaMIbY3z8EC9H", "4iEQ159qNFG4iIbhsjgLFlIcefV1FQSF"};
    public static final Object[] A02;
    public static final long serialVersionUID = 912559;

    public static String A0E(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[5].length() != 17) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[2] = "lieiHKZfuIcY61xmAmaqGGyKYrJDPufs";
            strArr[6] = "CmOnSMQUslfkeybEcmzezPx2YZsSQI5U";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 74);
            i13++;
        }
    }

    public static void A0F() {
        A00 = new byte[]{124, 90, 76, 9, 122, 76, 91, 64, 72, 69, 64, 83, 76, 77, 111, 70, 91, 68};
    }

    public abstract int A0I(Object[] dst, int offset);

    public abstract AbstractC07549l<E> A0J();

    public abstract boolean A0K();

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public abstract boolean contains(@CheckForNull Object object);

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final <T> T[] toArray(T[] tArr) {
        AbstractC1335Wu.A04(tArr);
        int size = size();
        if (tArr.length < size) {
            Object[] objArrA0L = A0L();
            if (objArrA0L != null) {
                return (T[]) AbstractC1293Va.A02(objArrA0L, A0H(), A0G(), tArr);
            }
            tArr = (T[]) AbstractC1295Vd.A05(tArr, size);
        } else if (tArr.length > size) {
            tArr[size] = null;
        }
        A0I(tArr, 0);
        return tArr;
    }

    static {
        A0F();
        A02 = new Object[0];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    public int A0G() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    public int A0H() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @CheckForNull
    public Object[] A0L() {
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean add(E e3) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean addAll(Collection<? extends E> newElements) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    private void readObject(ObjectInputStream stream) throws InvalidObjectException {
        throw new InvalidObjectException(A0E(0, 18, 99));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean remove(@CheckForNull Object object) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean removeAll(Collection<?> oldElements) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    @Deprecated
    public final boolean retainAll(Collection<?> elementsToKeep) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.Collection, java.lang.Iterable
    public final Spliterator<E> spliterator() {
        return Spliterators.spliterator(this, 1296);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vt != com.google.common.collect.ImmutableCollection<E> */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(A02);
    }
}
