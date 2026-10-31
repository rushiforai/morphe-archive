package com.moloco.sdk.publisher;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\u0010\u0010\b\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\nH&¨\u0006\u000b"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoAdapterBannerListener;", "Lcom/moloco/sdk/publisher/BannerAdShowListener;", "onAdLoaded", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ad", "Lcom/moloco/sdk/publisher/MolocoAd;", "view", "Lcom/moloco/sdk/publisher/Banner;", "onAdLoadFailed", "error", "Lcom/moloco/sdk/publisher/MolocoAdError;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface MolocoAdapterBannerListener extends BannerAdShowListener {
    void onAdLoadFailed(@NotNull MolocoAdError error);

    void onAdLoaded(@NotNull MolocoAd ad, @NotNull Banner view);
}
