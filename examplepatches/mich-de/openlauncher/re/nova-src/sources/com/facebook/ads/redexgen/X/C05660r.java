package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0r, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05660r implements Set, Serializable {
    public static byte[] A00 = null;
    public static String[] A01 = {"O45ZwpGBv0akYkVqgPvslGGrsSvfKAyM", "5NEQ473", "BxzjeCv7ZN6igdaQI9b", "JhZInNsp6Nr1yjZEv4oJzPdbV0ahTOvv", "uiuOd1skgOBDPmwa3b2Ey", "x3lMwpWicyIGKl3WPILPVfAsnbiMHAof", "8DHbGHWVfFNVXqdhdsO", "BtOzf3"};
    public static final C05660r A02;
    public static final long serialVersionUID = 3406603774387020532L;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[4].length() == 26) {
                throw new RuntimeException();
            }
            A01[1] = "rbdgGJA4k";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 27);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{-69, -36, -47, -34, -51, -32, -43, -37, -38, -116, -43, -33, -116, -38, -37, -32, -116, -33, -31, -36, -36, -37, -34, -32, -47, -48, -116, -46, -37, -34, -116, -34, -47, -51, -48, -103, -37, -38, -40, -27, -116, -49, -37, -40, -40, -47, -49, -32, -43, -37, -38, -55, -53, -52, -35, -35, -52, -28, -102, -95, -102, -94, -102, -93, -87, -95, -88, -95, -87, -95, -86, -80, -81};
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException(A01(0, 51, 81));
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return AbstractC05821j.A02(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final <T> T[] toArray(T[] tArr) {
        C1h.A09(tArr, A01(53, 5, 80));
        return (T[]) AbstractC05821j.A03(this, tArr);
    }

    static {
        A02();
        A02 = new C05660r();
    }

    private final int A00() {
        return 0;
    }

    private final boolean A03(Void r42) {
        C1h.A09(r42, A01(58, 7, 26));
        return false;
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ boolean contains(Object obj) {
        if (0 == 0) {
            return false;
        }
        return A03(null);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection collection) {
        C1h.A09(collection, A01(65, 8, 33));
        return collection.isEmpty();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        return (obj instanceof Set) && ((Set) obj).isEmpty();
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return 0;
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return true;
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return C05690u.A02;
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ int size() {
        return A00();
    }

    public final String toString() {
        return A01(51, 2, 83);
    }
}
