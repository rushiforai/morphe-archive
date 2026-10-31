package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.facebook.ads.AdError;
import com.facebook.ads.AdExperienceType;
import com.facebook.ads.ExtraHints;
import com.facebook.ads.RewardData;
import com.facebook.ads.RewardedVideoAd;
import com.facebook.ads.RewardedVideoAdListener;
import com.facebook.ads.internal.api.RewardedVideoAdApi;
import com.facebook.ads.internal.context.Repairable;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.kJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2045kJ implements RewardedVideoAdApi, Repairable {
    public static byte[] A04;
    public static String[] A05 = {"q8F3UYcndC8Ej6EzPObAfC2CDIoe743", "WHSSbjkejcnDJnmz9i28DmVQ7s5doV", "7Ae3C11G9ZnRQnjC1YEsbkjNlyvjMOhJ", "xIErM25UzhDXOZX5lXVK71ghnZu2uIsx", "TpWxEHvEZyAqJcOvGEooXr2tQ3t7MLKT", "CpjtrdZmrEbCE1OZgZlStH8uGVShpb", "AnU5GMoet7ZaRK4jG6aRRqRoHnPXG1EV", "P"};
    public final com.facebook.ads.Ad A00;
    public final C1003Jc A01;
    public final C7Y A02;
    public final C0958Hi A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 4);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{117, 121, 116, 119, 116, 120, 118, -90, -92, -92, -94, -95, -46, -42, -45, -95, -123, -78, -77, -124, -78, -79, -76, -128, 94, -125, -119, 122, -121, -125, 118, -127, 53, 122, -121, -121, -124, -121, 67, 31, 91, 110, -128, 106, 123, 109, 110, 109, 41, AbstractJsonLexerKt.TC_INVALID, 114, 109, 110, 120, 41, 106, 109, 41, 109, 110, 124, 125, 123, 120, -126, 110, 109, -51, -32, -14, -36, -19, -33, -32, -33, -101, -15, -28, -33, -32, -22, -101, -36, -33, -101, -25, -22, -36, -33, -101, -19, -32, -20, -16, -32, -18, -17, -32, -33, -81, -62, -44, -66, -49, -63, -62, -63, 125, -45, -58, -63, -62, -52, 125, -66, -63, 125, -48, -59, -52, -44, 125, -64, -66, -55, -55, -62, -63, -47, -97, -89, -43, -46, -47, -94, -86, -85, -71, -70, -72, -75, -65, -84, -81, -95, -92, -127, -92, -43, -54, -47, -39};
    }

    static {
        A01();
    }

    public C2045kJ(Context context, String str, com.facebook.ads.Ad ad) {
        String string;
        this.A00 = ad;
        if (context instanceof C0958Hi) {
            this.A03 = (C0958Hi) context;
            string = this.A03.A0F().getId();
        } else {
            string = UUID.randomUUID().toString();
            this.A03 = C2013jn.A07(context, string);
        }
        InterfaceC1640df interfaceC1640dfA0F = this.A03.A0F();
        String adId = AdPlacementType.REWARDED_VIDEO.toString();
        interfaceC1640dfA0F.A3p(adId, str);
        this.A01 = new C1003Jc(this.A03, str, this.A00, new K5());
        this.A03.A0O(this);
        this.A02 = new C7Y(this.A01, string);
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.FullScreenAd
    /* renamed from: A02, reason: merged with bridge method [inline-methods] */
    public final C2046kK buildLoadAdConfig() {
        return new C2046kK(this);
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.FullScreenAd
    /* renamed from: A03, reason: merged with bridge method [inline-methods] */
    public final C2047kL buildShowAdConfig() {
        return new C2047kL();
    }

    public final void A04() {
        if (C2203mv.A2N(this.A03)) {
            return;
        }
        this.A02.A08();
        this.A03.A0F().A3q();
    }

    public final void A05(RewardData rewardData) {
        this.A02.A0H(rewardData);
    }

    public final void A06(RewardedVideoAdListener rewardedVideoAdListener) {
        this.A01.A04 = rewardedVideoAdListener;
        this.A03.A0F().A3i(rewardedVideoAdListener != null);
    }

    public final void A07(String str, AdExperienceType adExperienceType, boolean z11) {
        if (str == null) {
            this.A03.A0F().A3m();
        } else {
            C0958Hi c0958Hi = this.A03;
            if (A05[1].length() != 30) {
                throw new RuntimeException();
            }
            A05[1] = "VbNMcinO8suVZXvBDeNnaTURWjAwCx";
            c0958Hi.A0F().A3l();
        }
        this.A02.A0G(this.A00, str, adExperienceType, z11);
        this.A03.A0F().A3k();
    }

    public final boolean A08(RewardedVideoAd.RewardedVideoShowAdConfig rewardedVideoShowAdConfig) {
        this.A03.A0F().A3w();
        boolean zA0K = this.A02.A0K(this.A00, rewardedVideoShowAdConfig);
        this.A03.A0F().A3v(zA0K);
        return zA0K;
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.Ad
    public final void destroy() {
        AbstractC2273o5.A05(A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 7, 66), A00(40, 27, 5), A00(128, 7, 107));
        A04();
    }

    public final void finalize() {
        this.A02.A07();
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.Ad
    public final String getPlacementId() {
        return this.A01.A0D;
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi
    public final int getVideoDuration() {
        return this.A01.A00;
    }

    @Override // com.facebook.ads.Ad
    public final boolean isAdInvalidated() {
        boolean zA0I = this.A02.A0I();
        this.A03.A0F().A6E(zA0I);
        return zA0I;
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi
    public final boolean isAdLoaded() {
        return this.A02.A0J();
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.Ad
    public final void loadAd() {
        AbstractC2273o5.A05(A00(142, 6, 60), A00(67, 32, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), A00(16, 8, 74));
        A07(null, null, true);
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi
    public final void loadAd(RewardedVideoAd.RewardedVideoLoadAdConfig rewardedVideoLoadAdConfig) {
        ((C2046kK) rewardedVideoLoadAdConfig).A00();
    }

    @Override // com.facebook.ads.internal.context.Repairable
    public final void repair(Throwable th2) {
        if (this.A01.A04 != null) {
            this.A01.A04.onError(this.A00, new AdError(2001, A00(24, 16, 17) + AbstractC2408qK.A03(this.A01.A0B, th2)));
        }
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.Ad
    @Deprecated
    public final void setExtraHints(ExtraHints extraHints) {
        this.A01.A06 = extraHints.getHints();
        this.A01.A07 = extraHints.getMediationData();
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi, com.facebook.ads.FullScreenAd
    public final boolean show() {
        AbstractC2273o5.A05(A00(148, 4, 94), A00(99, 29, 89), A00(8, 8, 108));
        return A08(new C2047kL().withAppOrientation(-1).build());
    }

    @Override // com.facebook.ads.internal.api.RewardedVideoAdApi
    public final boolean show(RewardedVideoAd.RewardedVideoShowAdConfig rewardedVideoShowAdConfig) {
        AbstractC2273o5.A05(A00(148, 4, 94), A00(99, 29, 89), A00(0, 8, 62));
        return A08(rewardedVideoShowAdConfig);
    }
}
