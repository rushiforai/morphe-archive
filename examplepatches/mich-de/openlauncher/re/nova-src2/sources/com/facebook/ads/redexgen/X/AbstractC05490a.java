package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.Metadata;

/* JADX WARN: Unexpected interfaces in signature: [kotlin.jvm.internal.markers.KMappedMarker] */
@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0a, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05490a<E> extends AbstractC05730y<E> implements List<E> {
    public static byte[] A00;
    public static String[] A01 = {"8MJW7qL63X9", "G9aG2oIn1Y4", "HqPOsgzYagb9l4J9VzVkZ8o4DQz4V9lO", "xJmplYEd", "tRQ4jDSCys0NBNjWiBDDhKLDNc3mQFOg", "4p2K0RIvYgiFEE4cJyGXuzJhjREv5DiA", "7kO1qpo2YPdStit", "T7n9PzVqaAEs33V"};
    public static final C1v A02;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[4].charAt(17) != 'B') {
                throw new RuntimeException();
            }
            A01[5] = "g090LmixS2shdtXN00k1fUpYmTec5Rl3";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 118);
            i13++;
        }
    }

    public static void A07() {
        byte[] bArr = {-21, 12, 1, 14, -3, 16, 5, 11, 10, -68, 5, 15, -68, 10, 11, 16, -68, 15, 17, 12, 12, 11, 14, 16, 1, 0, -68, 2, 11, 14, -68, 14, 1, -3, 0, -55, 11, 10, 8, 21, -68, -1, 11, 8, 8, 1, -1, 16, 5, 11, 10};
        if (A01[3].length() == 24) {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[0] = "JUfY89Gw2s4";
        strArr[1] = "2A8vB3DQCih";
        A00 = bArr;
    }

    @Override // java.util.List
    public final void add(int i5, E e3) {
        throw new UnsupportedOperationException(A06(0, 51, 38));
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection<? extends E> collection) {
        throw new UnsupportedOperationException(A06(0, 51, 38));
    }

    public abstract E get(int i5);

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public int indexOf(Object obj) {
        int i5 = 0;
        Iterator<E> it = iterator();
        while (it.hasNext()) {
            if (C1h.A0C(it.next(), obj)) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public int lastIndexOf(Object obj) {
        AbstractC05490a<E> abstractC05490a = this;
        ListIterator<E> listIterator = abstractC05490a.listIterator(abstractC05490a.size());
        while (listIterator.hasPrevious()) {
            if (C1h.A0C(listIterator.previous(), obj)) {
                return listIterator.nextIndex();
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final E remove(int i5) {
        throw new UnsupportedOperationException(A06(0, 51, 38));
    }

    @Override // java.util.List
    public final E set(int i5, E e3) {
        throw new UnsupportedOperationException(A06(0, 51, 38));
    }

    static {
        A07();
        A02 = new C1v(null);
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            return A02.A06(this, (Collection) obj);
        }
        return false;
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        return A02.A02(this);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05730y, java.util.Collection, java.lang.Iterable, java.util.List
    public Iterator<E> iterator() {
        return new C05720x(this);
    }

    @Override // java.util.List
    public ListIterator<E> listIterator() {
        return new C05500b(this, 0);
    }

    @Override // java.util.List
    public ListIterator<E> listIterator(int i5) {
        return new C05500b(this, i5);
    }

    public List<E> subList(int i5, int i11) {
        return new C0O(this, i5, i11);
    }
}
