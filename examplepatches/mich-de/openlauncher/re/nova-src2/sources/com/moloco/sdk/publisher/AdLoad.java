package com.moloco.sdk.publisher;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001:\u0001\u000bJ\u001a\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\nH&R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0002\u0010\u0004¨\u0006\f"}, d2 = {"Lcom/moloco/sdk/publisher/AdLoad;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isLoaded", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()Z", "load", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bidResponseJson", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "listener", "Lcom/moloco/sdk/publisher/AdLoad$Listener;", "Listener", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AdLoad {

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\bH&¨\u0006\t"}, d2 = {"Lcom/moloco/sdk/publisher/AdLoad$Listener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onAdLoadSuccess", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "molocoAd", "Lcom/moloco/sdk/publisher/MolocoAd;", "onAdLoadFailed", "molocoAdError", "Lcom/moloco/sdk/publisher/MolocoAdError;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public interface Listener {
        void onAdLoadFailed(@NotNull MolocoAdError molocoAdError);

        void onAdLoadSuccess(@NotNull MolocoAd molocoAd);
    }

    boolean isLoaded();

    void load(@NotNull String bidResponseJson, @Nullable Listener listener);
}
