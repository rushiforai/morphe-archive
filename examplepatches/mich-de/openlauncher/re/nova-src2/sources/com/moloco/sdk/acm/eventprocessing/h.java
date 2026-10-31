package com.moloco.sdk.acm.eventprocessing;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface h {
    @Nullable
    Object a(@NotNull CountEvent countEvent, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull TimerEvent timerEvent, @NotNull Continuation<? super Unit> continuation);
}
