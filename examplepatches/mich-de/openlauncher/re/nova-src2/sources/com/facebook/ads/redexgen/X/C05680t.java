package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0t, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05680t implements List, Serializable, RandomAccess {
    public static byte[] A00 = null;
    public static String[] A01 = {"k9ZzZ1cBuIGk0xZJYgRHtQUHu", "8haS1krON", "znf8DCOZs", "ZMxYCfvi9WuUDddmWblMZYVPAkvMwUDz", "R2yUt708fMCVn0dbeavb6cPXCCqIMhou", "XBnyXjlini4GNVGVFXrvp0WQTqYWSo5F", "KlLYvr3z7jMCyAWmrrkxwySNv", "nW4LfrwBKj43WODDmI32HmWf2C7iwmjL"};
    public static final C05680t A02;
    public static final long serialVersionUID = -7390468764508069838L;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{45, 33, 117, 110, 72, 111, 101, 100, 121, 59, 33, 6, 46, 51, 55, 58, 99, 47, 42, 48, 55, 99, 39, 44, 38, 48, 45, 100, 55, 99, 32, 44, 45, 55, 34, 42, 45, 99, 38, 47, 38, 46, 38, 45, 55, 99, 34, 55, 99, 42, 45, 39, 38, 59, 99, 43, 12, 6, 7, 26, 88, 66, 93, 98, 119, 96, 115, 102, 123, 125, 124, 50, 123, 97, 50, 124, 125, 102, 50, 97, 103, 98, 98, 125, 96, 102, 119, 118, 50, 116, 125, 96, 50, 96, 119, 115, 118, 63, 125, 124, 126, 107, 50, 113, 125, 126, 126, 119, 113, 102, 123, 125, 124, 102, 96, 6, 21, 21, 6, 30, 64, 73, 64, 72, 64, 75, 81, 92, 85, 92, 84, 92, 87, 77, 74, 23, 3, 30, 28, 56, 31, 21, 20, 9, 75, 81};
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ void add(int i5, Object obj) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        throw new UnsupportedOperationException(A03(62, 51, 107));
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return AbstractC05821j.A02(this);
    }

    @Override // java.util.List, java.util.Collection
    public final <T> T[] toArray(T[] tArr) {
        C1h.A09(tArr, A03(115, 5, 30));
        return (T[]) AbstractC05821j.A03(this, tArr);
    }

    static {
        A05();
        A02 = new C05680t();
    }

    private final int A00() {
        return 0;
    }

    private final int A01(Void r42) {
        C1h.A09(r42, A03(120, 7, 92));
        return -1;
    }

    private final int A02(Void r42) {
        C1h.A09(r42, A03(120, 7, 92));
        return -1;
    }

    private final Void A04(int i5) {
        throw new IndexOutOfBoundsException(A03(11, 44, 58) + i5 + '.');
    }

    private final boolean A06(Void r42) {
        C1h.A09(r42, A03(120, 7, 92));
        return false;
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ boolean contains(Object obj) {
        if (0 == 0) {
            return false;
        }
        return A06(null);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        C1h.A09(collection, A03(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 8, 64));
        return collection.isEmpty();
    }

    @Override // java.util.List, java.util.Collection
    public final boolean equals(Object obj) {
        return (obj instanceof List) && ((List) obj).isEmpty();
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object get(int i5) {
        A04(i5);
        throw null;
    }

    @Override // java.util.List, java.util.Collection
    public final int hashCode() {
        return 1;
    }

    @Override // java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (0 == 0) {
            return -1;
        }
        return A01(null);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return true;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return C05690u.A02;
    }

    @Override // java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (0 != 0) {
            return A02(null);
        }
        String[] strArr = A01;
        if (strArr[7].charAt(25) != strArr[4].charAt(25)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[6] = "W2d0lzCQvqhLN2OCBXEuBxfE2";
        strArr2[0] = "N76B7Y8TbLiorNvPcjFGl7PP3";
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return C05690u.A02;
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        if (i5 == 0) {
            return C05690u.A02;
        }
        throw new IndexOutOfBoundsException(A03(55, 7, 27) + i5);
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ int size() {
        return A00();
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        if (i5 == 0 && i11 == 0) {
            return this;
        }
        throw new IndexOutOfBoundsException(A03(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 11, 8) + i5 + A03(0, 11, 120) + i11);
    }

    public final String toString() {
        return A03(113, 2, 68);
    }
}
