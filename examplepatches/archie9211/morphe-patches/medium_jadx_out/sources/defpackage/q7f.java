package defpackage;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q7f implements xfd {
    public final s10 a;
    public final kb2 b;
    public final Handler c = new Handler(Looper.getMainLooper());
    public final p7f d = new p7f(this);

    public q7f(ExecutorService executorService) {
        s10 s10Var = new s10(executorService);
        this.a = s10Var;
        this.b = bgf.y(s10Var);
    }

    public final void a(Runnable runnable) {
        this.a.execute(runnable);
    }
}
