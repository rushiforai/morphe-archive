package cm;

import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class i implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final i f20118a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i[] f20119b;

    static {
        i iVar = new i("INSTANCE", 0);
        f20118a = iVar;
        f20119b = new i[]{iVar};
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f20119b.clone();
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        runnable.run();
    }
}
