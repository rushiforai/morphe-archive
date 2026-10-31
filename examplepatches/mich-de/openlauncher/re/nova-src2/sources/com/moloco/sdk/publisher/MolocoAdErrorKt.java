package com.moloco.sdk.publisher;

import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0000¨\u0006\u0006"}, d2 = {"createAdErrorInfo", "Lcom/moloco/sdk/publisher/MolocoAdError;", "adUnitId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "errorType", "Lcom/moloco/sdk/publisher/MolocoAdError$ErrorType;", "moloco-sdk_release"}, k = 2, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class MolocoAdErrorKt {
    @NotNull
    public static final MolocoAdError createAdErrorInfo(@NotNull String adUnitId, @NotNull MolocoAdError.ErrorType errorType) {
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(errorType, "errorType");
        return new MolocoAdError("Moloco", adUnitId, errorType, null, 8, null);
    }
}
