package io.branch.search.internal;

import io.branch.search.internal.client.ads.ImpressionInfo;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface P9 {
    @Nullable
    Object a(@NotNull String str, @NotNull ImpressionInfo impressionInfo, @NotNull Continuation<? super Unit> continuation);
}
