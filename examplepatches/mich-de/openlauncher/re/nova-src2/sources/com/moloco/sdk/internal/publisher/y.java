package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.publisher.MolocoInitStatus;
import com.moloco.sdk.publisher.MolocoInitializationListener;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class y {
    public static final void a(@NotNull MolocoInitializationListener molocoInitializationListener, @NotNull MolocoInitStatus initStatus) {
        Intrinsics.g(molocoInitializationListener, "<this>");
        Intrinsics.g(initStatus, "initStatus");
        com.moloco.sdk.internal.scheduling.d.a(new a2.g(8, molocoInitializationListener, initStatus));
    }

    public static final Unit b(MolocoInitializationListener molocoInitializationListener, MolocoInitStatus molocoInitStatus) {
        molocoInitializationListener.onMolocoInitializationStatus(molocoInitStatus);
        return Unit.f71706a;
    }
}
