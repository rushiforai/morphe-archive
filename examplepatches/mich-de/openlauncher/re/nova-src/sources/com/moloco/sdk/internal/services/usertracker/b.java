package com.moloco.sdk.internal.services.usertracker;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface b {
    @Nullable
    Object a(@NotNull String str, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object b(@NotNull Continuation<? super String> continuation);
}
