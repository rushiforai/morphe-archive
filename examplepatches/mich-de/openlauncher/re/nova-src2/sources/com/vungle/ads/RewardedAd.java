package com.vungle.ads;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.r1;
import com.vungle.ads.internal.s;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0014\u001a\u00020\b\u0012\b\b\u0002\u0010\u0016\u001a\u00020\u0015¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0010¢\u0006\u0004\b\u0005\u0010\u0006J\u000e\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\bJ\u000e\u0010\r\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\bJ\u000e\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\bJ\u000e\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\bJ\u000e\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\b¨\u0006\u0019"}, d2 = {"Lcom/vungle/ads/RewardedAd;", "Lcom/vungle/ads/BaseFullscreenAd;", "Landroid/content/Context;", "context", "Lcom/vungle/ads/internal/r1;", "constructAdInternal$vungle_ads_release", "(Landroid/content/Context;)Lcom/vungle/ads/internal/r1;", "constructAdInternal", b.f42142b, "userId", b.f42142b, "setUserId", "titleText", "setAlertTitleText", "bodyText", "setAlertBodyText", "closeButtonText", "setAlertCloseButtonText", "continueButtonText", "setAlertContinueButtonText", "placementId", "Lcom/vungle/ads/AdConfig;", "adConfig", "<init>", "(Landroid/content/Context;Ljava/lang/String;Lcom/vungle/ads/AdConfig;)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class RewardedAd extends BaseFullscreenAd {
    public /* synthetic */ RewardedAd(Context context, String str, AdConfig adConfig, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, str, (i5 & 4) != 0 ? new AdConfig() : adConfig);
    }

    public final void setAlertBodyText(@NotNull String bodyText) {
        Intrinsics.g(bodyText, "bodyText");
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.RewardedAdInternal");
        ((r1) adInternal$vungle_ads_release).a(bodyText);
    }

    public final void setAlertCloseButtonText(@NotNull String closeButtonText) {
        Intrinsics.g(closeButtonText, "closeButtonText");
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.RewardedAdInternal");
        ((r1) adInternal$vungle_ads_release).b(closeButtonText);
    }

    public final void setAlertContinueButtonText(@NotNull String continueButtonText) {
        Intrinsics.g(continueButtonText, "continueButtonText");
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.RewardedAdInternal");
        ((r1) adInternal$vungle_ads_release).c(continueButtonText);
    }

    public final void setAlertTitleText(@NotNull String titleText) {
        Intrinsics.g(titleText, "titleText");
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.RewardedAdInternal");
        ((r1) adInternal$vungle_ads_release).d(titleText);
    }

    public final void setUserId(@NotNull String userId) {
        Intrinsics.g(userId, "userId");
        s adInternal$vungle_ads_release = getAdInternal$vungle_ads_release();
        Intrinsics.e(adInternal$vungle_ads_release, "null cannot be cast to non-null type com.vungle.ads.internal.RewardedAdInternal");
        ((r1) adInternal$vungle_ads_release).e(userId);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RewardedAd(@NotNull Context context, @NotNull String placementId, @NotNull AdConfig adConfig) {
        super(context, placementId, adConfig);
        Intrinsics.g(context, "context");
        Intrinsics.g(placementId, "placementId");
        Intrinsics.g(adConfig, "adConfig");
    }

    @Override // com.vungle.ads.BaseAd
    @NotNull
    public r1 constructAdInternal$vungle_ads_release(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return new r1(context);
    }
}
