package com.moloco.sdk.publisher;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\bH&J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\n\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&¨\u0006\u000b"}, d2 = {"Lcom/moloco/sdk/publisher/AdShowListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onAdShowSuccess", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "molocoAd", "Lcom/moloco/sdk/publisher/MolocoAd;", "onAdShowFailed", "molocoAdError", "Lcom/moloco/sdk/publisher/MolocoAdError;", "onAdHidden", "onAdClicked", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AdShowListener {
    void onAdClicked(@NotNull MolocoAd molocoAd);

    void onAdHidden(@NotNull MolocoAd molocoAd);

    void onAdShowFailed(@NotNull MolocoAdError molocoAdError);

    void onAdShowSuccess(@NotNull MolocoAd molocoAd);
}
