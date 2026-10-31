package o7;

import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class h implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final h f79669a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ h[] f79670b;

    static {
        h hVar = new h("INSTANCE", 0);
        f79669a = hVar;
        f79670b = new h[]{hVar};
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f79670b.clone();
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable command) {
        Intrinsics.g(command, "command");
        command.run();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "DirectExecutor";
    }
}
