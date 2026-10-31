package io.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import u40.l;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\"\u0010\u0005\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lio/branch/engage/sesame_lite/internal/State;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lu40/l;", "log", "Lu40/l;", "getLog", "()Lu40/l;", "setLog", "(Lu40/l;)V", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class State {

    @NotNull
    public static final State INSTANCE = new State();

    @NotNull
    private static l log = u40.b.f90563b;

    private State() {
    }

    @NotNull
    public final l getLog() {
        return log;
    }

    public final void setLog(@NotNull l lVar) {
        Intrinsics.g(lVar, "<set-?>");
        log = lVar;
    }
}
