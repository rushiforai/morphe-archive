package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;

/* JADX INFO: Add missing generic type declarations: [E] */
/* JADX WARN: Unexpected interfaces in signature: [kotlin.jvm.internal.markers.KMappedMarker] */
@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0b, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C05500b<E> extends AbstractC05490a<E>.IteratorImpl implements ListIterator<E> {
    public static byte[] A01;
    public final /* synthetic */ AbstractC05490a<E> A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 84);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{6, 39, 28, 41, 24, 43, 32, 38, 37, -41, 32, 42, -41, 37, 38, 43, -41, 42, 44, 39, 39, 38, 41, 43, 28, 27, -41, 29, 38, 41, -41, 41, 28, 24, 27, -28, 38, 37, 35, 48, -41, 26, 38, 35, 35, 28, 26, 43, 32, 38, 37};
    }

    @Override // java.util.ListIterator
    public final void add(E e3) {
        throw new UnsupportedOperationException(A00(0, 51, 99));
    }

    @Override // java.util.ListIterator
    public final void set(E e3) {
        throw new UnsupportedOperationException(A00(0, 51, 99));
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C05500b(AbstractC05490a abstractC05490a, int i5) {
        super(abstractC05490a);
        this.A00 = abstractC05490a;
        AbstractC05490a.A02.A04(i5, this.A00.size());
        A05(i5);
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return A04() > 0;
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return A04();
    }

    @Override // java.util.ListIterator
    public final E previous() {
        if (hasPrevious()) {
            AbstractC05490a<E> abstractC05490a = this.A00;
            A05(A04() - 1);
            return abstractC05490a.get(A04());
        }
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return A04() - 1;
    }
}
