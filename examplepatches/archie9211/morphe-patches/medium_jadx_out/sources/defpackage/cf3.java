package defpackage;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cf3 implements Executor {
    public static final cf3 INSTANCE;
    public static final /* synthetic */ cf3[] a;

    static {
        cf3 cf3Var = new cf3("INSTANCE", 0);
        INSTANCE = cf3Var;
        a = new cf3[]{cf3Var};
    }

    public static cf3 valueOf(String str) {
        return (cf3) Enum.valueOf(cf3.class, str);
    }

    public static cf3[] values() {
        return (cf3[]) a.clone();
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        runnable.run();
    }

    @Override // java.lang.Enum
    public String toString() {
        return "DirectExecutor";
    }
}
