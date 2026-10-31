package io.branch.search.internal;

import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.C4;
import io.branch.search.ui.ClickInfo;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.k4, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public interface InterfaceC3227k4 {
    @Nullable
    Object a(@NotNull ClickInfo clickInfo, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull AnalyticsEvent analyticsEvent, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull C4.d.a aVar, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull C4.i.d dVar, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull C4.j.b bVar, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull y40.b0 b0Var, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull y40.c cVar, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull y40.d0 d0Var, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull String str, @NotNull y40.e eVar, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull String str, @Nullable long[] jArr, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull List<String> list, @Nullable long[] jArr, boolean z11, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object b(@NotNull String str, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object b(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object c(@NotNull String str, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object c(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object d(@NotNull String str, @NotNull Continuation<? super y40.w> continuation);

    @Nullable
    Object e(@NotNull String str, @NotNull Continuation<? super Unit> continuation);
}
