package com.moloco.sdk.internal.services.init;

import com.moloco.sdk.Init;
import com.moloco.sdk.internal.x;
import com.moloco.sdk.publisher.MediationInfo;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface k {
    @Nullable
    Init.SDKInitResponse a();

    @Nullable
    Object a(@NotNull String str, @NotNull MediationInfo mediationInfo, @NotNull Continuation<? super x<Init.SDKInitResponse, j>> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);
}
