package cl;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class m0 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final m0 f20038a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ m0[] f20039b;

    static {
        m0 m0Var = new m0("INSTANCE", 0);
        f20038a = m0Var;
        f20039b = new m0[]{m0Var};
    }

    public static m0 valueOf(String str) {
        return (m0) Enum.valueOf(m0.class, str);
    }

    public static m0[] values() {
        return (m0[]) f20039b.clone();
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
