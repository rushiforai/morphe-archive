package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.27, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass27<A, B> implements Serializable {
    public static byte[] A02;
    public final A A00;
    public final B A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 59);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{88, 84};
    }

    public final A A02() {
        return this.A00;
    }

    public final B A03() {
        return this.A01;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AnonymousClass27)) {
            return false;
        }
        AnonymousClass27 anonymousClass27 = (AnonymousClass27) obj;
        return C1h.A0C(this.A00, anonymousClass27.A00) && C1h.A0C(this.A01, anonymousClass27.A01);
    }

    public final int hashCode() {
        return ((this.A00 == null ? 0 : this.A00.hashCode()) * 31) + (this.A01 != null ? this.A01.hashCode() : 0);
    }

    public AnonymousClass27(A a11, B b11) {
        this.A00 = a11;
        this.A01 = b11;
    }

    public final String toString() {
        return '(' + this.A00 + A00(0, 2, 79) + this.A01 + ')';
    }
}
