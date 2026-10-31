package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2L, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2L {
    public static byte[] A03;
    public static final C2M A04;
    public static final C2L A05 = null;
    public final AnonymousClass13 A00;
    public final C05892e A01;
    public final C05882b A02;

    static {
        A01();
        A04 = new C2M(null);
    }

    public /* synthetic */ C2L(AnonymousClass13 anonymousClass13, C2j c2j, C05882b c05882b, C05892e c05892e, AbstractC05811i abstractC05811i) {
        this(anonymousClass13, c2j, c05882b, c05892e);
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 35);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{2, 3, -8, -7, -87, -103, -105, -92, -126, -97, -87, -86, -101, -92, -101, -88, 21, 8, 4, 22, 15, 14, 8, 13, 19, -29, 0, 19, 0};
    }

    public C2L(AnonymousClass13 anonymousClass13, C2j c2j, C05882b c05882b, C05892e c05892e) {
        this.A00 = anonymousClass13;
        this.A02 = c05882b;
        this.A01 = c05892e;
        final C05882b c05882b2 = this.A02;
        c2j.A05(new InterfaceC05902k(c05882b2) { // from class: com.facebook.ads.redexgen.X.10
            public static byte[] A01;
            public final C05882b A00;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 34);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{-33, -56, -37, -41, -23, -30, -31, -37, -32, -26, -59, -43, -45, -32, -32, -41, -28};
            }

            {
                C1h.A09(c05882b2, A00(0, 17, 80));
                this.A00 = c05882b2;
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC05902k
            public final void onStart() {
                this.A00.A0G();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC05902k
            public final void onStop() {
                this.A00.A0F();
            }
        });
    }

    public static /* synthetic */ void A02(C2L c2l, C2K c2k, C06042y c06042y, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            c06042y = null;
        }
        c2l.A05(c2k, c06042y);
    }

    public final void A03(C2i c2i) {
        this.A02.A0H(c2i);
    }

    public final void A04(C2f c2f) {
        C1h.A09(c2f, A00(4, 12, 19));
        this.A02.A0I(c2f);
    }

    public final void A05(C2K c2k, C06042y c06042y) {
        C1h.A09(c2k, A00(0, 4, 113));
        if (this.A00.A01 && c06042y != null) {
            this.A01.A08(c2k, c06042y);
        } else {
            this.A01.A07(c2k);
        }
    }

    public final void A06(C2K c2k, C06042y c06042y, C05912l<?, ?> c05912l) {
        C1h.A09(c2k, A00(0, 4, 113));
        C1h.A09(c05912l, A00(16, 13, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        if (this.A00.A01 && c06042y != null) {
            this.A01.A09(c2k, c06042y, c05912l);
        } else {
            this.A01.A0A(c2k, c05912l);
        }
    }

    public final void A07(C2K c2k, C05912l<?, ?> c05912l) {
        C1h.A09(c2k, A00(0, 4, 113));
        C1h.A09(c05912l, A00(16, 13, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        A06(c2k, null, c05912l);
    }
}
