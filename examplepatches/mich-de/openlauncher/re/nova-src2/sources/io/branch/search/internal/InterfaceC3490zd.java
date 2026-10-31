package io.branch.search.internal;

import io.branch.search.internal.Cd;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.zd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3490zd<T extends Cd> {
    @Nullable
    Boolean a(@NotNull F4 f42, @NotNull Cd cd2, @NotNull Exception exc);

    @Nullable
    Object a(@NotNull F4 f42, @NotNull T t6, @NotNull Continuation<? super Boolean> continuation);

    void a(@NotNull F4 f42, @NotNull Cd cd2);
}
