package defpackage;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dm0 extends ThreadPoolExecutor implements AutoCloseable, ExecutorService {
    public final f66 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dm0(f66 f66Var, fm0 fm0Var, rv8 rv8Var) {
        super(1, 1, 5000L, TimeUnit.MILLISECONDS, new im0(f66Var, "storage", 1024, 1024, x22.v, fn.x, fm0Var.a, rv8Var), new lv2("storage", 0));
        f66Var.getClass();
        rv8Var.getClass();
        this.a = f66Var;
    }

    @Override // java.util.concurrent.ThreadPoolExecutor
    public final void afterExecute(Runnable runnable, Throwable th) {
        super.afterExecute(runnable, th);
        mo7.Q(runnable, th, this.a);
    }

    @Override // java.lang.AutoCloseable
    public final /* synthetic */ void close() {
        cm0.d(this);
    }
}
