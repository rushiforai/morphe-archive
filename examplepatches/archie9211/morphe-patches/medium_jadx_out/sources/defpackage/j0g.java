package defpackage;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j0g implements Executor {
    public static final /* synthetic */ j0g[] a;
    public static final j0g zza;

    static {
        j0g j0gVar = new j0g("INSTANCE", 0);
        zza = j0gVar;
        a = new j0g[]{j0gVar};
    }

    public static j0g[] values() {
        return (j0g[]) a.clone();
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
