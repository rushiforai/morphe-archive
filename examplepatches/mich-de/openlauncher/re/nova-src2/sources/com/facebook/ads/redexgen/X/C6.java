package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class C6 implements InterfaceC2617th {
    public static byte[] A01;
    public final WeakReference<AbstractC06635h> A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{3, 1, 18, 4, 44, 1, 25, 15, 21, 20, 20, 3, 21, 19, 10, 18};
    }

    public C6(AbstractC06635h abstractC06635h) {
        C1h.A09(abstractC06635h, A00(0, 10, 22));
        this.A00 = new WeakReference<>(abstractC06635h);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2617th
    public final void AFA(C2616tg c2616tg) {
        C1h.A09(c2616tg, A00(10, 6, 16));
        AbstractC06635h abstractC06635h = this.A00.get();
        if (abstractC06635h != null) {
            abstractC06635h.A1r();
        }
    }
}
