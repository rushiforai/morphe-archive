package oh;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class o implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final o f80440a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ o[] f80441b;

    static {
        o oVar = new o("INSTANCE", 0);
        f80440a = oVar;
        f80441b = new o[]{oVar};
    }

    public static o[] values() {
        return (o[]) f80441b.clone();
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.run();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "MoreExecutors.directExecutor()";
    }
}
