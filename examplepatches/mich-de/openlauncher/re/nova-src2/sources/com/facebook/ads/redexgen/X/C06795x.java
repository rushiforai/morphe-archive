package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.widget.FrameLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.5x, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06795x extends D8 {
    public static byte[] A03;
    public static final C2517s5 A04;
    public static final D7 A05;
    public C6M A00;
    public final int A01;
    public final D6 A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 23);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{80, 82, 69, 88, 71, 88, 69, 72, 112, 65, 88, 37, 32, 6, 33, 44, 37, 50, 45, 43, 54, 95, 90, 125, 95, 93, 86, 91, 115, 95, 80, 95, 89, 91, 76, 47, 42, 13, 33, 32, 58, 43, 54, 58, 25, 60, 47, 62, 62, 43, 60, 59, 62, 30, 59, 46, 59, 24, 47, 52, 62, 54, 63, 82, 87, 118, 69, 86, 93, 71, 126, 82, 93, 82, 84, 86, 65, 78, 66, 67, 75, 68, 74, 16, 18, 3, 39, 24, 5, 3, 5, 22, 30, 3, 52, 24, 27, 24, 5, 62, 25, 17, 24, 95, 89, 89, 89, 94, 101, 96, 122, 125, 108, 103, 108, 123, 57, 21, 48, 22, 49, 60, 53, 34, 61, 59, 38, 118, 90, AbstractJsonLexerKt.TC_INVALID, 88, 122, 120, 115, 126, 86, 122, 117, 122, 124, 126, 105, 74, 102, 67, 100, 72, 73, 83, 66, 95, 83, 112, 85, 70, 87, 87, 66, 85, 83, AbstractJsonLexerKt.TC_INVALID, 90, 122, 95, 74, 95, 124, 75, 80, 90, 82, 91, 21, 57, 28, 61, 14, 29, 22, 12, 53, 25, 22, 25, 31, 29, 10, 6, 45, 30, 5, 5, 14, 7, 39, 4, 12, 12, 2, 5, 12, 35, 10, 5, 15, 7, 14, 25, 77, 108, 73, 83, 84, 69, 78, 69, 82, 104, 81, 106, 106, 105, 103, 100, 119};
    }

    static {
        A01();
        A04 = new C2517s5(null);
        A05 = new D7();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C06795x(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, c2086kz, interfaceC2459r9);
        C1h.A09(c0958Hi, A00(35, 16, 89));
        C1h.A09(interfaceC2515s3, A00(11, 10, 83));
        C1h.A09(interfaceC2224nG, A00(63, 14, 36));
        C1h.A09(la2, A00(51, 12, 77));
        C1h.A09(c2086kz, A00(21, 14, 41));
        C1h.A09(interfaceC2459r9, A00(108, 8, 30));
        this.A01 = la2.A32().A0T() ? la2.A32().A0I().A03() : la2.A32().A0I().A04();
        this.A02 = new D6(this);
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0p() {
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.A1s();
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0q() {
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.A1h();
        }
        if (this.A01 <= 0) {
            this.A09.setToolbarActionMode(0);
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0s(C1998jY c1998jY) {
        C1h.A09(c1998jY, A00(0, 11, 38));
        c1998jY.A0A(this.A02);
        C0958Hi c0958Hi = this.A05;
        C1h.A08(c0958Hi, A00(142, 17, 48));
        InterfaceC2515s3 interfaceC2515s3 = this.A0B;
        C1h.A08(interfaceC2515s3, A00(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 11, 67));
        InterfaceC2224nG interfaceC2224nG = this.A06;
        C1h.A08(interfaceC2224nG, A00(172, 15, 111));
        LA la2 = this.A03;
        C1h.A08(la2, A00(159, 13, 41));
        InterfaceC2459r9 interfaceC2459r9 = this.A0A;
        C1h.A08(interfaceC2459r9, A00(Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, 9, 55));
        AbstractC2452r2 abstractC2452r2 = this.A09;
        C1h.A08(abstractC2452r2, A00(Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, 8, 18));
        C2232nO c2232nO = this.A07;
        C1h.A08(c2232nO, A00(187, 21, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        C2086kz c2086kz = this.A04;
        C1h.A08(c2086kz, A00(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 15, 12));
        this.A00 = new C6M(c0958Hi, interfaceC2515s3, 0, interfaceC2224nG, la2, interfaceC2459r9, abstractC2452r2, c2232nO, c2086kz, false, false, A05, this.A01, 1, false);
        C1744fN c1744fNA01 = this.A03.A31().A01();
        C1h.A08(c1744fNA01, A00(83, 25, 96));
        AbstractC2426qc.A0O(this, c1744fNA01.A08(false));
        addView(this.A00, D8.A0H);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.setMargins(0, AbstractC2383pv.A0u, 0, 0);
        addView(this.A09, layoutParams);
        setUpFullscreenMode(true);
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0t() {
        C6M c6m = this.A00;
        if (!((c6m == null || c6m.A1t()) ? false : true)) {
            return true;
        }
        this.A05.A0F().ABl();
        this.A0A.A5C(this.A0B.A7L());
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0u() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.A1j(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.A1k(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        C1h.A09(configuration, A00(77, 6, 58));
        super.onConfigurationChanged(configuration);
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.onConfigurationChanged(configuration);
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        C6M c6m = this.A00;
        if (c6m != null) {
            c6m.A1b();
        }
        super.onDestroy();
    }
}
