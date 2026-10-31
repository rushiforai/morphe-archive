package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0u, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C05690u implements ListIterator {
    public static byte[] A00;
    public static String[] A01 = {"Lh1ctQGI3z0ICKY4sERIgObiaQXEE6st", b.f42142b, "YrUNUjPJhwTFPahOnKdKEZpQqkqmkMqf", "mt1at7u7GjasOkbUIdXphgeIXmOD3c5Y", "LyUo5DTjg5p2hVh4q93CeOXeBqCAIjFA", "hXpvjK4NhCfyo6HowYXGM", "i3NXtzFRw7DPnENsvqn328A3wBeLdhIf", "5LVzMNXxt"};
    public static final C05690u A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 29);
            String[] strArr = A01;
            if (strArr[3].charAt(4) != strArr[6].charAt(4)) {
                throw new RuntimeException();
            }
            A01[4] = "W86BrAWeae6d9FvxmGtwJGfWCGR1ExqG";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-42, -9, -20, -7, -24, -5, -16, -10, -11, -89, -16, -6, -89, -11, -10, -5, -89, -6, -4, -9, -9, -10, -7, -5, -20, -21, -89, -19, -10, -7, -89, -7, -20, -24, -21, -76, -10, -11, -13, 0, -89, -22, -10, -13, -13, -20, -22, -5, -16, -10, -11};
        if (A01[4].charAt(5) == 'L') {
            throw new RuntimeException();
        }
        A01[7] = "q3Fo83D1p5TcLhnq7hcGOS";
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void add(Object obj) {
        throw new UnsupportedOperationException(A00(0, 51, 106));
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException(A00(0, 51, 106));
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ void set(Object obj) {
        throw new UnsupportedOperationException(A00(0, 51, 106));
    }

    static {
        A03();
        A02 = new C05690u();
    }

    private final Void A01() {
        throw new NoSuchElementException();
    }

    private final Void A02() {
        throw new NoSuchElementException();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return false;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return false;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final /* bridge */ /* synthetic */ Object next() {
        A01();
        throw null;
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return 0;
    }

    @Override // java.util.ListIterator
    public final /* bridge */ /* synthetic */ Object previous() {
        A02();
        throw null;
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return -1;
    }
}
