package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import java.util.RandomAccess;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0O, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C0O<E> extends AbstractC05490a<E> implements RandomAccess {
    public static byte[] A03;
    public int A00;
    public final int A01;
    public final AbstractC05490a<E> A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{15, 10, 16, 23};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C0O(AbstractC05490a<? extends E> abstractC05490a, int i5, int i11) {
        C1h.A09(abstractC05490a, A00(0, 4, 90));
        this.A02 = abstractC05490a;
        this.A01 = i5;
        AbstractC05490a.A02.A05(this.A01, i11, this.A02.size());
        this.A00 = i11 - this.A01;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05730y
    public final int A0C() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05490a, java.util.List
    public final E get(int i5) {
        AbstractC05490a.A02.A03(i5, this.A00);
        return this.A02.get(this.A01 + i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC05490a, java.util.List
    public final List<E> subList(int i5, int i11) {
        AbstractC05490a.A02.A05(i5, i11, this.A00);
        return new C0O(this.A02, this.A01 + i5, this.A01 + i11);
    }
}
