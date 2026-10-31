package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.io.Serializable;
import java.util.Arrays;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9Y, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C9Y extends AbstractC1294Vc<Comparable<?>> implements Serializable {
    public static byte[] A00;
    public static final C9Y A01;
    public static final long serialVersionUID = 0;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 27);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{123, -98, -112, -111, -98, -107, -102, -109, 90, -102, -115, -96, -95, -98, -115, -104, 84, 85};
    }

    static {
        A02();
        A01 = new C9Y();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc, java.util.Comparator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compare(Comparable<?> left, Comparable<?> right) {
        AbstractC1335Wu.A04(left);
        AbstractC1335Wu.A04(right);
        return left.compareTo(right);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc
    public final <S extends Comparable<?>> AbstractC1294Vc<S> A06() {
        return C9W.A01;
    }

    public final String toString() {
        return A01(0, 18, 17);
    }
}
