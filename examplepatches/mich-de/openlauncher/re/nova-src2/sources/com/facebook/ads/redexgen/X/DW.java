package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public class DW extends AbstractRunnableC2319oq {
    public static byte[] A02;
    public final /* synthetic */ C6C A00;
    public final /* synthetic */ C5V A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 102);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{88, 111, 124, 124, AbstractJsonLexerKt.TC_INVALID, 104, 115, 116, 125, 58, 115, 116, 126, AbstractJsonLexerKt.TC_INVALID, 124, 115, 116, 115, 110, AbstractJsonLexerKt.TC_INVALID, 118, 99};
    }

    public DW(C6C c6c, C5V c5v) {
        this.A00 = c6c;
        this.A01 = c5v;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (this.A00.A0X.getState() == EnumC1549cC.A02 && this.A00.A0X.getCurrentPositionInMillis() == A00()) {
            this.A00.A0W(A00(0, 22, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        }
    }
}
