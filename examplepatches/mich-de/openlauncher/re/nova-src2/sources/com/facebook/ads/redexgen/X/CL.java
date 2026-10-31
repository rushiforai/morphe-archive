package com.facebook.ads.redexgen.X;

import android.util.SparseBooleanArray;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.HashMap;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CL extends AbstractC1978jE {
    public static byte[] A0A;
    public static final C2230nM A0B;
    public AbstractC1540c3 A00;
    public C1539c2 A01;
    public final SparseBooleanArray A02;
    public final C1750fT A03;
    public final C0958Hi A04;
    public final InterfaceC2224nG A05;
    public final C2417qT A06;
    public final C2280oC A07;
    public final C1539c2 A08;
    public final String A09;

    static {
        A09();
        A0B = new C2230nM(null);
    }

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0A = new byte[]{93, 88, AbstractJsonLexerKt.TC_INVALID, 83, 82, 72, 89, 68, 72, 107, 78, 93, 76, 76, 89, 78, 44, 41, 8, 59, 40, 35, 57, 0, 44, 35, 44, 42, 40, 63, 92, 94, 77, 91, 115, 94, 70, 80, 74, 75, 103, 101, 118, 96, 103, 106, 112, 81, 83, 64, 86, 91, 92, 86, 121, 123, 104, 126, 105, 83, 119, 106, 104, AbstractJsonLexerKt.TC_INVALID, 105, 105, 115, 117, 116, 105, 95, 80, 85, 89, 82, 72, 104, 83, 87, 89, 82, 28, 29, 48, 31, 26, 16, 24, 50, 16, 7, 26, 28, 29, 29, 12, 31, 8, 3, 25, 59, 4, 8, 26, 12, 15, 4, 1, 4, 25, 20, 46, 5, 8, 14, 6, 8, 31, 66, 64, 93, 86, 71, 81, 70, 123, 92, 84, 93, 56, 35, 57, 47, 36, 8, 45, 56, 45, 30, 41, 47, 35, 62, 40, 41, 62};
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CL(C2280oC c2280oC, SparseBooleanArray sparseBooleanArray, C1539c2 c1539c2, C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, C2417qT c2417qT, String str, C1750fT c1750fT) {
        super(c2280oC);
        C1h.A09(c2280oC, A07(30, 10, 46));
        C1h.A09(sparseBooleanArray, A07(54, 16, 11));
        C1h.A09(c1539c2, A07(94, 24, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        C1h.A09(c0958Hi, A07(0, 16, 45));
        C1h.A09(interfaceC2224nG, A07(16, 14, 92));
        C1h.A09(c2417qT, A07(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 17, 93));
        C1h.A09(str, A07(70, 11, 45));
        this.A07 = c2280oC;
        this.A02 = sparseBooleanArray;
        this.A08 = c1539c2;
        this.A04 = c0958Hi;
        this.A05 = interfaceC2224nG;
        this.A06 = c2417qT;
        this.A09 = str;
        this.A03 = c1750fT;
    }

    private final void A0A(int i5, int i11) {
        if (this.A02.get(i5)) {
            return;
        }
        C1539c2 c1539c2 = this.A01;
        if (c1539c2 != null) {
            c1539c2.A0V();
        }
        this.A01 = null;
        HashMap map = new HashMap();
        map.put(A07(47, 7, 35), String.valueOf(i5));
        map.put(A07(40, 7, 21), String.valueOf(i11));
        this.A00 = new CM(this, i5, map);
        this.A01 = new C1539c2(this.A07, 10, new WeakReference(this.A00), this.A04);
        C1539c2 $this$initializeViewabilityChecker_u24lambda_u240 = this.A01;
        if ($this$initializeViewabilityChecker_u24lambda_u240 != null) {
            $this$initializeViewabilityChecker_u24lambda_u240.A0Y(false);
            $this$initializeViewabilityChecker_u24lambda_u240.A0W(100);
            $this$initializeViewabilityChecker_u24lambda_u240.A0X(100);
        }
    }

    public final void A0w(C2278oA c2278oA, int i5, int i11, InterfaceC05620n<AnonymousClass22> interfaceC05620n) {
        C1h.A09(c2278oA, A07(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 11, 35));
        C1h.A09(interfaceC05620n, A07(81, 13, 98));
        this.A07.A02(c2278oA, interfaceC05620n, new C06173n(i5, this));
        A0A(i5, i11);
    }
}
