package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.9n, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC07569n<E> extends AbstractC1311Vu<E> {
    public static byte[] A03;
    public static String[] A04 = {"5WA4o", "kLEm7uQrw7wXVeOTBlB901JKynqSVQKC", "92QNMMwB5tdcBroQcmhj13poNxwhGWqK", "4qtFDuytyeSziXURfqWjdFmUvI8NTbm7", "H6nlSewXnv5VCNeVwKxgWQjoP0FQ2GNY", "80AOtROsDD", "V", "eyu6VUc1NfxvoYaLMC3xI4ViJIkpz0xI"};
    public int A00;
    public boolean A01;
    public Object[] A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 117);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{66, 71, 66, 77, 66, 58, 69, 28, 58, 73, 58, 60, 66, 77, 82};
    }

    static {
        A01();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9n != com.google.common.collect.ImmutableCollection$ArrayBasedBuilder<E> */
    public AbstractC07569n(int initialCapacity) {
        W7.A00(initialCapacity, A00(0, 15, 100));
        this.A02 = new Object[initialCapacity];
        this.A00 = 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9n != com.google.common.collect.ImmutableCollection$ArrayBasedBuilder<E> */
    private void A02(int newElements) {
        Object[] objArr = this.A02;
        int iA03 = AbstractC1311Vu.A03(objArr.length, this.A00 + newElements);
        if (iA03 <= objArr.length) {
            boolean z11 = this.A01;
            int newCapacity = A04[3].charAt(24);
            if (newCapacity == 66) {
                throw new RuntimeException();
            }
            A04[5] = "Z8cvLeIpo1";
            if (!z11) {
                return;
            }
        }
        Object[] contents = this.A02;
        this.A02 = Arrays.copyOf(contents, iA03);
        this.A01 = false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9n != com.google.common.collect.ImmutableCollection$ArrayBasedBuilder<E> */
    public AbstractC07569n<E> A03(E element) {
        AbstractC1335Wu.A04(element);
        A02(1);
        Object[] objArr = this.A02;
        int i5 = this.A00;
        this.A00 = i5 + 1;
        objArr[i5] = element;
        return this;
    }
}
