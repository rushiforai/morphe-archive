package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2M, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2M {
    public static byte[] A00;

    static {
        A02();
    }

    public /* synthetic */ C2M(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{10, 27, 12, 8, 29, 12, 95, 75, 109, 65, 64, 72, 71, 73, 69, 82, 83, 66, 84, 82, 69, 36, 59, 55, 37, 34, 61, 59, 60, 38, 17, 61, 60, 38, 51, 59, 60, 55, 32, 6, 25, 21, 7, 0, 31, 25, 30, 4, 60, 25, 22, 21, 19, 9, 19, 28, 21, 51, 31, 30, 4, 2, 31, 28, 28, 21, 2};
    }

    public C2M() {
    }

    private final AnonymousClass30 A00(int i5) {
        if (0 != 0) {
            throw new NullPointerException(A01(0, 6, 25));
        }
        return null;
    }

    @JvmStatic
    public final C2L A03(AnonymousClass13 anonymousClass13, C2j c2j, InterfaceC05942o interfaceC05942o, AnonymousClass12 anonymousClass12, InterfaceC05952p interfaceC05952p, AnonymousClass30 anonymousClass30) {
        AnonymousClass30 anonymousClass30A00 = anonymousClass30;
        C1h.A09(anonymousClass13, A01(6, 8, 94));
        C1h.A09(c2j, A01(39, 28, 0));
        C1h.A09(interfaceC05942o, A01(21, 18, 34));
        C1h.A09(anonymousClass12, A01(14, 7, 71));
        C2L c2l = C2L.A05;
        if (c2l != null) {
            return c2l;
        }
        C05892e c05892e = new C05892e(anonymousClass13);
        AC ac = AC.A00;
        Handler handler = new Handler(Looper.getMainLooper());
        if (anonymousClass30A00 == null) {
            anonymousClass30A00 = A00(100);
        }
        return new C2L(anonymousClass13, c2j, new C05882b(anonymousClass13, interfaceC05942o, ac, anonymousClass12, c05892e, interfaceC05952p, handler, anonymousClass30A00, 0, 256, null), c05892e, null);
    }
}
