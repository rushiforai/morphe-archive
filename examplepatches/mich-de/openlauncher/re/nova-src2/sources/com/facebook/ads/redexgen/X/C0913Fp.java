package com.facebook.ads.redexgen.X;

import android.content.ComponentName;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Fp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0913Fp extends JF {
    public static byte[] A02;
    public static String[] A03 = {"SNzwiLCcBVT", "lBBSNQeHNhzN97Lsr4Gz5yI6XdTr9XLU", "qNwn9Lo5HTniBAGW", "OTuViqXRSLcaPcIt", "ElCZIPeb4VH4pQsAXsIXPyng7MH", "ZVU732f4N5flnRJCEETjSpOJSwEMiNps", "Tf2G3pXdbdtlKNYxpXmQ9LjANxiCf5w5", "IuGoeKqkLwAppMI3u"};
    public final /* synthetic */ C0912Fo A00;
    public final /* synthetic */ String A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        String[] strArr = A03;
        if (strArr[0].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A03;
        strArr2[2] = "iZXWUr3mYva6m39Y";
        strArr2[3] = "Oov2RJyKuS5sp3Nz";
        A02 = new byte[]{116, 123, 126, 114, 121, 99, 52, 59, 55, 63};
    }

    static {
        A01();
    }

    public C0913Fp(C0912Fo c0912Fo, String str) {
        this.A00 = c0912Fo;
        this.A01 = str;
    }

    @Override // com.facebook.ads.redexgen.X.JF
    public final void A04(ComponentName componentName, AbstractC0990Io abstractC0990Io) throws SecurityException {
        C1h.A09(componentName, A00(6, 4, 33));
        C1h.A09(abstractC0990Io, A00(0, 6, 108));
        this.A00.A03 = abstractC0990Io;
        abstractC0990Io.A08(0L);
        this.A00.A05 = abstractC0990Io.A07(this.A00.A0G);
        this.A00.A0C(this.A01);
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        C1h.A09(componentName, A00(6, 4, 33));
        this.A00.A03 = null;
        this.A00.A05 = null;
    }
}
