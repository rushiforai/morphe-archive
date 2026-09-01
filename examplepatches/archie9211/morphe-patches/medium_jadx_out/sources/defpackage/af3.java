package defpackage;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class af3 implements Executor {
    public static final af3 INSTANCE;
    public static final /* synthetic */ af3[] a;
    public static final /* synthetic */ i04 b;

    static {
        af3 af3Var = new af3("INSTANCE", 0);
        INSTANCE = af3Var;
        af3[] af3VarArr = {af3Var};
        a = af3VarArr;
        b = new i04(af3VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static af3 valueOf(String str) {
        return (af3) Enum.valueOf(af3.class, str);
    }

    public static af3[] values() {
        return (af3[]) a.clone();
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        runnable.getClass();
        runnable.run();
    }

    @Override // java.lang.Enum
    public String toString() {
        return "DirectExecutor";
    }
}
