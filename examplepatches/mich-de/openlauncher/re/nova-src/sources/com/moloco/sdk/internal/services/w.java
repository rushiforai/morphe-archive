package com.moloco.sdk.internal.services;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface w {
    @Nullable
    <T> Object a(@NotNull String str, T t6, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object b(@NotNull String str, @NotNull Continuation<? super Double> continuation);

    @Nullable
    Object c(@NotNull String str, @NotNull Continuation<? super Float> continuation);

    @Nullable
    Object d(@NotNull String str, @NotNull Continuation<? super String> continuation);

    @Nullable
    Object e(@NotNull String str, @NotNull Continuation<? super Integer> continuation);

    @Nullable
    Object f(@NotNull String str, @NotNull Continuation<? super Boolean> continuation);

    @Nullable
    Object g(@NotNull String str, @NotNull Continuation<? super Long> continuation);
}
