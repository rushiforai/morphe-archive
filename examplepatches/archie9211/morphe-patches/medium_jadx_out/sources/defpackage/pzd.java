package defpackage;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pzd implements Executor {
    public static final pzd INSTANCE;
    public static final Handler a;
    public static final /* synthetic */ pzd[] b;

    static {
        pzd pzdVar = new pzd("INSTANCE", 0);
        INSTANCE = pzdVar;
        b = new pzd[]{pzdVar};
        a = new Handler(Looper.getMainLooper());
    }

    public static pzd valueOf(String str) {
        return (pzd) Enum.valueOf(pzd.class, str);
    }

    public static pzd[] values() {
        return (pzd[]) b.clone();
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        a.post(runnable);
    }
}
