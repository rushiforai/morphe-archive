package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2278oA implements Serializable {
    public static byte[] A03 = null;
    public static final C2279oB A04;
    public static final long serialVersionUID = 7284619530127845624L;
    public final String A00;
    public final String A01;
    public final String A02;

    static {
        A01();
        A04 = new C2279oB(null);
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{91, 87, 7, 5, 24, 19, 2, 20, 3, 34, 5, 27, 74, 98, 110, 58, 39, 58, 34, 43, 115, 69, 113, 96, 68, 111, 101, 66, 96, 115, 101, 81, 115, 110, 101, 116, 98, 117, 41, 104, 108, 96, 102, 100, 84, 115, 109, 60, 100, 96, 108, 106, 104, 88, AbstractJsonLexerKt.TC_INVALID, 97, 68, 89, 68, 92, 85};
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2278oA)) {
            return false;
        }
        C2278oA c2278oA = (C2278oA) obj;
        return C1h.A0C(this.A00, c2278oA.A00) && C1h.A0C(this.A02, c2278oA.A02) && C1h.A0C(this.A01, c2278oA.A01);
    }

    public final int hashCode() {
        return (((this.A00.hashCode() * 31) + this.A02.hashCode()) * 31) + (this.A01 == null ? 0 : this.A01.hashCode());
    }

    public final String toString() {
        return A00(21, 27, 100) + this.A00 + A00(13, 8, 43) + this.A02 + A00(0, 13, 18) + this.A01 + ')';
    }

    public C2278oA(String str, String str2, String str3) {
        C1h.A09(str, A00(48, 8, 104));
        C1h.A09(str2, A00(56, 5, 85));
        this.A00 = str;
        this.A02 = str2;
        this.A01 = str3;
    }

    public final String A02() {
        return this.A00;
    }

    public final String A03() {
        return this.A01;
    }

    public final String A04() {
        return this.A02;
    }
}
