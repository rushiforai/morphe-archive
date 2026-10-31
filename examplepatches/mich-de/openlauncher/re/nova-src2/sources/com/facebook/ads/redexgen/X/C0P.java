package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0P, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C0P extends C0V implements InterfaceC05610m<C05912l<?, ?>, AnonymousClass22> {
    public static byte[] A02;
    public final /* synthetic */ C05882b A00;
    public final /* synthetic */ C2K A01;

    static {
        A01();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0P(C05882b c05882b, C2K c2k) {
        super(1);
        this.A00 = c05882b;
        this.A01 = c2k;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 92);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{AbstractJsonLexerKt.TC_INVALID, 96, 108, 126, 121, 102, 96, 103, 125, 77, 104, 125, 104};
    }

    private final void A02(C05912l<?, ?> c05912l) {
        C1h.A09(c05912l, A00(0, 13, 85));
        this.A00.A0B(this.A01, c05912l);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC05610m
    public final /* bridge */ /* synthetic */ AnonymousClass22 AB1(C05912l<?, ?> c05912l) {
        A02(c05912l);
        return AnonymousClass22.A01;
    }
}
