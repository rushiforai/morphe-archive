package defpackage;

import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ud2 implements Executor {
    public final ExecutorService a;
    public final Object b = new Object();
    public jrg c = vp7.x(null);

    public ud2(ExecutorService executorService) {
        this.a = executorService;
    }

    public final jrg a(Runnable runnable) {
        jrg jrgVarG;
        synchronized (this.b) {
            jrgVarG = this.c.g(this.a, new f70(9, runnable));
            this.c = jrgVarG;
        }
        return jrgVarG;
    }

    public final jrg b(Callable callable) {
        jrg jrgVarG;
        synchronized (this.b) {
            jrgVarG = this.c.g(this.a, new f70(8, callable));
            this.c = jrgVarG;
        }
        return jrgVarG;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.a.execute(runnable);
    }
}
