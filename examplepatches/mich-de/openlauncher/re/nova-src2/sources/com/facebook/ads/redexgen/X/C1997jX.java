package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.res.Configuration;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.facebook.ads.AdListener;
import com.facebook.ads.AdSize;
import com.facebook.ads.AdView;
import com.facebook.ads.ExtraHints;
import com.facebook.ads.internal.api.AdViewApi;
import com.facebook.ads.internal.api.AdViewParentApi;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.jX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1997jX implements AdViewApi {
    public static byte[] A0D;
    public static String[] A0E = {"of0bzA7MwNGTia9F31tAkieNA09H6OOQ", "TyTQj7xFBxvma6AaZ1TUwVS6lItsexiQ", "kN9yyhhGlFuDqh5wulKzoOOSsFZblOVu", "DXKKP4SSVuW5x9unPZpKCS00jdGSX4q", "ceBkREnsnDPWKQGMERGG6oDocc2kf8dJ", "ULZujO58Hn4sCnlurEwExiI5FfKtYml", "oBzM86F4GMvLYp6iWCqbmyfPVfF4ncm8", "8s2Qgj6JQYkd4IbFNTxV1lfTN5yJUxqm"};
    public long A00;
    public View A01;
    public AdListener A02;
    public C07137f A03;
    public C2615tf A04;
    public String A05;
    public String A06;
    public final DisplayMetrics A07;
    public final AdView A08;
    public final AdViewParentApi A09;
    public final C7D A0A;
    public final EnumC2264nw A0B;
    public final String A0C;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 64);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        byte[] bArr = {-77, -74, -27, -72, -76, -73, -71, -75, 122, 122, -89, -88, 120, -86, -90, -89, -11, -10, -13, -10, 37, 37, 34, -11, -17, 14, 27, 27, 18, 31, -51, 14, 17, -51, 17, 18, 32, 33, 31, 28, 38, 18, 17, -14, 17, 30, 30, 21, 34, -48, 17, 20, -48, 28, 31, 17, 20, -48, 34, 21, 33, 37, 21, 35, 36, 21, 20, -118, -88, -75, -75, -74, -69, 103, -83, -80, -75, -85, 103, -88, 103, -69, -84, -76, -73, -77, -88, -69, -84, 103, -69, -81, -88, -69, 103, -77, -74, -88, -85, 103, -87, -80, -85, 103, 110, 108, -70, 110, -77, -74, -91, -69, -52, -73, -20, -19, -5, -4, -6, -9, 1, -40, -37, -51, -48, -83, -48};
        if (A0E[2].charAt(11) != 'D') {
            throw new RuntimeException();
        }
        String[] strArr = A0E;
        strArr[7] = "i0zr3oWhaZ1ZQYjulO9yltnfKtDweGPM";
        strArr[6] = "f16HnFk6V4WfoRTY4RGQrwGHYb77b2mz";
        A0D = bArr;
    }

    static {
        A02();
    }

    public C1997jX(Context context, String str, AdSize adSize, AdViewParentApi adViewParentApi, AdView adView) {
        this.A00 = -1L;
        if (adSize != null && adSize != AdSize.INTERSTITIAL) {
            this.A07 = adView.getContext().getResources().getDisplayMetrics();
            this.A0B = AbstractC2356pU.A04(adSize);
            this.A0C = str;
            this.A09 = adViewParentApi;
            this.A08 = adView;
            this.A0A = C2013jn.A08(context);
            this.A0A.A0F().A3p(AdPlacementType.BANNER.toString(), str);
            C1781fy c1781fy = new C1781fy(str, AbstractC2356pU.A05(this.A0B), AdPlacementType.BANNER, AbstractC2356pU.A04(adSize), 1, new K5());
            c1781fy.A06(this.A05);
            c1781fy.A07(this.A06);
            this.A03 = new C07137f(this.A0A, c1781fy);
            this.A03.A0R(new IM(this));
            return;
        }
        throw new IllegalArgumentException(A01(108, 6, 18));
    }

    public C1997jX(Context context, String str, String str2, AdViewParentApi adViewParentApi, AdView adView) throws C2263nu {
        this(context, str, A00(str2), adViewParentApi, adView);
        this.A0A.A0F().A4u();
    }

    public static AdSize A00(String str) throws C2263nu {
        EnumC2265nx template = C2269o1.A00(str);
        if (template != null) {
            C2269o1.A03(template);
            return AbstractC2356pU.A01(template);
        }
        throw new C2263nu(AdErrorType.BID_PAYLOAD_ERROR, String.format(Locale.US, A01(67, 41, 7), str));
    }

    private void A03(String str) {
        this.A00 = System.currentTimeMillis();
        if (str == null) {
            this.A0A.A0F().A3m();
        } else {
            this.A0A.A0F().A3l();
        }
        C07137f c07137f = this.A03;
        String[] strArr = A0E;
        if (strArr[3].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[3] = "8EJDtH9EjlwutgZO3WtzB3nx702AY4O";
        strArr2[5] = "dTiKD7UwUCw1SvcKYJrEphBgoR9CLtC";
        if (c07137f != null) {
            this.A03.A0V(str);
        }
        this.A0A.A0F().A3k();
    }

    public final long A04() {
        return this.A00;
    }

    public final DisplayMetrics A05() {
        return this.A07;
    }

    public final AdListener A06() {
        return this.A02;
    }

    public final AdView A07() {
        return this.A08;
    }

    public final C07137f A08() {
        return this.A03;
    }

    public final C7D A09() {
        return this.A0A;
    }

    public final EnumC2264nw A0A() {
        return this.A0B;
    }

    public final void A0B(RelativeLayout relativeLayout, View view) {
        C1908i4 c1908i4A01;
        this.A0A.A0F().A57(this.A06 != null);
        if (this.A06 != null && (c1908i4A01 = AbstractC1909i5.A01(this.A0A, this.A06)) != null) {
            ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
            relativeLayout.addView(c1908i4A01, new RelativeLayout.LayoutParams(layoutParams.width, layoutParams.height));
        }
    }

    public final void A0C(AdListener adListener) {
        this.A0A.A0F().A3i(adListener != null);
        this.A02 = adListener;
    }

    public final void A0D(C2615tf c2615tf) {
        this.A04 = c2615tf;
    }

    @Override // com.facebook.ads.internal.api.AdViewApi
    public final AdView.AdViewLoadConfigBuilder buildLoadAdConfig() {
        return new C2238nU(this);
    }

    @Override // com.facebook.ads.Ad
    public final void destroy() {
        AbstractC2273o5.A05(A01(114, 7, 72), A01(24, 19, 109), A01(0, 8, 65));
        this.A0A.A0F().A3q();
        if (this.A03 != null) {
            this.A03.A0X(true);
            this.A03.A0J();
            this.A03 = null;
        }
        if (this.A04 != null && C2203mv.A1B(this.A08.getContext())) {
            this.A04.A07();
            if (this.A01 != null) {
                View view = this.A01;
                String[] strArr = A0E;
                if (strArr[3].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0E;
                strArr2[7] = "fmi4ltQko56R0Ot1hIU3uMuoiOam3SD1";
                strArr2[6] = "7H1g3sSDF1cZj7eOXlokIXc1uirRZwhG";
                view.getOverlay().remove(this.A04);
            }
        }
        this.A08.removeAllViews();
        this.A01 = null;
        this.A02 = null;
    }

    @Override // com.facebook.ads.Ad
    public final String getPlacementId() {
        return this.A0C;
    }

    @Override // com.facebook.ads.Ad
    public final boolean isAdInvalidated() {
        boolean z11 = this.A03 == null || this.A03.A0Y();
        this.A0A.A0F().A6E(z11);
        return z11;
    }

    @Override // com.facebook.ads.Ad
    public final void loadAd() {
        AbstractC2273o5.A05(A01(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 6, 44), A01(43, 24, 112), A01(16, 8, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        A03(null);
    }

    @Override // com.facebook.ads.internal.api.AdViewApi
    public final void loadAd(AdView.AdViewLoadConfig adViewLoadConfig) {
        AbstractC2273o5.A05(A01(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 6, 44), A01(43, 24, 112), A01(8, 8, 5));
        A03(((C2238nU) adViewLoadConfig).A00());
    }

    @Override // com.facebook.ads.internal.api.AdViewApi, com.facebook.ads.internal.api.AdViewParentApi
    public final void onConfigurationChanged(Configuration configuration) {
        this.A09.onConfigurationChanged(configuration);
        if (this.A01 != null) {
            AbstractC2267nz.A01(this.A07, this.A01, this.A0B);
        }
    }

    @Override // com.facebook.ads.internal.api.AdViewApi, com.facebook.ads.Ad
    @Deprecated
    public final void setExtraHints(ExtraHints extraHints) {
        this.A05 = extraHints.getHints();
        this.A06 = extraHints.getMediationData();
        if (C2203mv.A0j(this.A0A) && this.A03 != null) {
            this.A03.A08.A06(this.A05);
            this.A03.A08.A07(this.A06);
        }
    }
}
