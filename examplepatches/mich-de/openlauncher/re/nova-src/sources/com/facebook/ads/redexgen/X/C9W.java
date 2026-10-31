package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.io.Serializable;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9W, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C9W extends AbstractC1294Vc<Comparable<?>> implements Serializable {
    public static byte[] A00;
    public static final C9W A01;
    public static final long serialVersionUID = 0;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 56);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{68, 121, 111, 110, 121, 98, 101, 108, 37, 101, 106, AbstractJsonLexerKt.TC_INVALID, 126, 121, 106, 103, 35, 34, 37, 121, 110, 125, 110, 121, 120, 110, 35, 34};
    }

    static {
        A02();
        A01 = new C9W();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc, java.util.Comparator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compare(Comparable<?> left, Comparable<?> right) {
        AbstractC1335Wu.A04(left);
        if (left == right) {
            return 0;
        }
        return right.compareTo(left);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc
    public final <S extends Comparable<?>> AbstractC1294Vc<S> A06() {
        return AbstractC1294Vc.A03();
    }

    public final String toString() {
        return A01(0, 28, 51);
    }
}
