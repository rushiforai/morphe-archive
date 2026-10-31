package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.BuildConfigApi;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.Hw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0972Hw {
    public static byte[] A02;
    public static final String A03;
    public final InterfaceC2055kT A00;
    public final C2086kz A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{50, 84, 71, 78, 81, 67, 70, 75, 80, 73, 2, 7, 70, 2, 67, 85, 85, 71, 86, 85, 58, 92, 79, 86, 89, 75, 78, 83, 88, 81, 10, 83, 87, 75, 81, 79, 36, 10, 15, 93, 35, 69, 56, 63, 66, 52, 55, 60, 65, 58, -13, 64, 52, 69, 62, 72, 67, 13, -13, -8, 70, 25, 59, 46, 53, 56, 42, 45, 50, 55, 48, -23, 63, 50, 45, 46, 56, 3, -23, -18, 60, -33, -82, -31, -31, -79, -78, -81, -81, -88, -35, -77, -82, -83, -88, -84, -84, -32, -76, -88, -36, -83, -36, -82, -88, -83, -36, -83, -36, -32, -83, -33, -35, -34, -34, -32, -81, 58, 60, 47, 48, 47, 62, 45, 50, 19, 12, 9, 12, 13, 21, 12};
    }

    static {
        A02();
        A03 = C0972Hw.class.getSimpleName();
    }

    public C0972Hw(InterfaceC2055kT interfaceC2055kT, C0957Hh c0957Hh) {
        this.A00 = interfaceC2055kT;
        this.A00.A4Q(new C0974Hy(this));
        this.A01 = new C2086kz(c0957Hh);
        A01();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A01() {
        if (BuildConfigApi.isDebug()) {
            String.format(Locale.US, A00(0, 20, 114), Integer.valueOf(this.A00.A7X().size()));
        }
        for (InterfaceC2058kW interfaceC2058kW : this.A00.A7X()) {
            switch (C2054kS.A00[interfaceC2058kW.AA1().ordinal()]) {
                case 1:
                    A04(interfaceC2058kW.getUrl());
                    break;
                case 2:
                    A06(interfaceC2058kW.getUrl());
                    break;
                case 3:
                    A05(interfaceC2058kW.getUrl());
                    break;
            }
        }
        this.A01.A0X(new C0973Hx(this), new C2079ks(A00(81, 36, 11), A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 7, 46)));
    }

    private void A04(String str) {
        if (BuildConfigApi.isDebug()) {
            String.format(Locale.US, A00(20, 20, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), str);
        }
        C2084kx c2084kx = new C2084kx(str, -1, -1, A00(81, 36, 11), A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 7, 46));
        c2084kx.A02 = A00(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 8, 90);
        this.A01.A0c(c2084kx);
    }

    private void A05(String str) {
        if (BuildConfigApi.isDebug()) {
            String.format(Locale.US, A00(40, 21, 99), str);
        }
        C2082kv c2082kv = new C2082kv(str, A00(81, 36, 11), A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 7, 46));
        c2082kv.A04 = true;
        c2082kv.A02 = A00(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 8, 90);
        this.A01.A0Y(c2082kv);
    }

    private void A06(String str) {
        if (BuildConfigApi.isDebug()) {
            String.format(Locale.US, A00(61, 20, 89), str);
        }
        C2082kv c2082kv = new C2082kv(str, A00(81, 36, 11), A00(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 7, 46));
        c2082kv.A04 = false;
        c2082kv.A02 = A00(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 8, 90);
        this.A01.A0b(c2082kv);
    }
}
