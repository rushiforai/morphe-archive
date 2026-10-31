package com.moloco.sdk.internal.unity_bridge;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0018\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0005H&J\u0010\u0010\b\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\n\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&¨\u0006\u000b"}, d2 = {"Lcom/moloco/sdk/internal/unity_bridge/MolocoUnityShowCallback;", b.f42142b, "onAdShowSuccess", b.f42142b, "adUnitId", b.f42142b, "onAdShowFailed", "error", "onAdHidden", "onAdClicked", "onAdRewarded", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface MolocoUnityShowCallback {
    void onAdClicked(@NotNull String adUnitId);

    void onAdHidden(@NotNull String adUnitId);

    void onAdRewarded(@NotNull String adUnitId);

    void onAdShowFailed(@NotNull String adUnitId, @NotNull String error);

    void onAdShowSuccess(@NotNull String adUnitId);
}
