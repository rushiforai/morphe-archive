package nova.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\"\u0010\u0005\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/State;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lr80/p;", "log", "Lr80/p;", "getLog", "()Lr80/p;", "setLog", "(Lr80/p;)V", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class State {

    @NotNull
    public static final State INSTANCE = new State();

    @NotNull
    private static r80.p log = r80.f.f85665a;

    private State() {
    }

    @NotNull
    public final r80.p getLog() {
        return log;
    }

    public final void setLog(@NotNull r80.p pVar) {
        Intrinsics.g(pVar, "<set-?>");
        log = pVar;
    }
}
