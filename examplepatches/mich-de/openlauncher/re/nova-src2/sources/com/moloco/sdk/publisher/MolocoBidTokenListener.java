package com.moloco.sdk.publisher;

import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007H&¨\u0006\b"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoBidTokenListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onBidTokenResult", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bidToken", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "error", "Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public interface MolocoBidTokenListener {
    void onBidTokenResult(@NotNull String bidToken, @Nullable MolocoAdError.ErrorType error);
}
