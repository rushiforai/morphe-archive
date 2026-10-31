package com.facebook.ads.redexgen.X;

import android.view.View;
import com.facebook.ads.InterstitialAd;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class K1 extends AbstractC1709eo {
    public static byte[] A01;
    public static String[] A02 = {b.f42142b, "lR4UvBki6PSdVcLREjEHAbqRd1OmLUQf", "DjKPGQUWmMf7x", "ODfaPUPPzX7KhktdCz15RADFZIjUcUTH", "SOtQhTlfKwNvvZXzwoqU2I3z2iEV30z7", "BHtVd6ktyCMEATMZK8J5wjGrCvXYI9tG", "P8UTzFKpwpJ94", "IxNcf87J3g"};
    public final /* synthetic */ C1024Jz A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{99, 114, 107, 29, 17, 16, 10, 12, 17, 18, 18, 27, 12, 94, 23, 13, 94, 16, 11, 18, 18};
    }

    static {
        A01();
    }

    public K1(C1024Jz c1024Jz) {
        this.A00 = c1024Jz;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A02() {
        if (this.A00.A01 == null) {
            this.A00.A06.A0F().AAx();
            this.A00.A04 = false;
            this.A00.A07.onInterstitialActivityDestroyed();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A04() {
        if (this.A00.A01 != null) {
            this.A00.A01.show();
            return;
        }
        this.A00.A06.A0F().AAy();
        this.A00.A04 = false;
        if (this.A00.A03 != null && C2203mv.A2D(this.A00.A06)) {
            this.A00.A03.A0R(new K2(this));
            this.A00.A03.A0M();
            this.A00.A03.A0J();
            this.A00.A03 = null;
        }
        this.A00.A07.onInterstitialDismissed(this.A00.A08.A7K());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A05() {
        this.A00.A06.A0F().AAz();
        this.A00.A07.onInterstitialDisplayed(this.A00.A08.A7K());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A06() {
        this.A00.A07.onRewardedAdServerFailed();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A07() {
        this.A00.A07.onRewardedAdServerSucceeded();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A08() {
        this.A00.A07.onRewardedAdCompleted();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0C() {
        this.A00.A06.A0F().A3g();
        this.A00.A07.onAdClicked(this.A00.A08.A7K());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0D() {
        this.A00.A07.onLoggingImpression(this.A00.A08.A7K());
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0E(View view) {
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x009a  */
    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0F(InterfaceC1708en interfaceC1708en) {
        if (this.A00.A03 != null) {
            this.A00.A05 = true;
            this.A00.A02 = this.A00.A03.A0H();
            boolean z11 = this.A00.A02 instanceof LA;
            String[] strArr = A02;
            if (strArr[6].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[1] = "VeASnUkJuhfeOmGjJqk9CbDFf3FFhRFx";
            strArr2[5] = "TZLIDWk0RuIbUDThQePy8NEYvQ7OtG1H";
            if (z11) {
                LA la2 = (LA) this.A00.A02;
                int iA2y = la2.A2y();
                String[] strArr3 = A02;
                if (strArr3[0].length() != strArr3[3].length()) {
                    String[] strArr4 = A02;
                    strArr4[6] = "g2LThTD3HDKTh";
                    strArr4[2] = "DwNNkt8z8VoEk";
                    if (iA2y > 0) {
                        C2352pQ c2352pQ = new C2352pQ();
                        if (c2352pQ.A09(this.A00.A06, this.A00.A08.A08(), la2.A2y())) {
                            c2352pQ.A08(this.A00.A06, true);
                            this.A00.A01 = c2352pQ.A06(this.A00.A06, this.A00.A08.A0A(), this.A00.A08.A08());
                        } else {
                            c2352pQ.A08(this.A00.A06, false);
                        }
                    }
                } else if (iA2y > 0) {
                }
                if (this.A00.A01 == null) {
                    this.A00.A07.onAdLoaded(this.A00.A08.A7K());
                    return;
                }
                la2.A3C(true);
                InterstitialAd.InterstitialLoadAdConfig loadAdConfig = this.A00.A01.buildLoadAdConfig().withAdListener(new C1791g8(this, la2)).withCacheFlags(this.A00.A08.A0B()).withRewardData(this.A00.A08.A03()).build();
                this.A00.A01.loadAd(loadAdConfig);
                return;
            }
            this.A00.A07.onAdLoaded(this.A00.A08.A7K());
            return;
        }
        this.A00.A06.A08().ABz(A00(0, 3, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), AbstractC2126lf.A0N, new C2127lg(A00(3, 18, 0)));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1709eo
    public final void A0G(C2262nt c2262nt) {
        this.A00.A06.A0F().A3j(C2416qS.A01(this.A00.A00), c2262nt.A03().getErrorCode(), c2262nt.A04());
        this.A00.A07.onError(this.A00.A08.A7K(), AbstractC2354pS.A00(c2262nt));
    }
}
