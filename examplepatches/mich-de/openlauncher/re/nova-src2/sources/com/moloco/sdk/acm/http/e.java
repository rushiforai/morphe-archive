package com.moloco.sdk.acm.http;

import kotlin.Result;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import o50.n;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes3.dex */
public interface e {
    @Nullable
    Object a(@NotNull d dVar, @NotNull Function1<? super n, Unit> function1, @NotNull Continuation<? super Result<String>> continuation);
}
