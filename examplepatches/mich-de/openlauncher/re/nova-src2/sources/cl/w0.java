package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;

/* loaded from: classes.dex */
public abstract class w0 {
    public static Object a(Future future) {
        Object obj;
        if (!future.isDone()) {
            throw new IllegalStateException(vk.b0.p("Future was expected to be done: %s", future));
        }
        boolean z11 = false;
        while (true) {
            try {
                obj = future.get();
                break;
            } catch (InterruptedException unused) {
                z11 = true;
            } catch (Throwable th2) {
                if (z11) {
                    Thread.currentThread().interrupt();
                }
                throw th2;
            }
        }
        if (z11) {
            Thread.currentThread().interrupt();
        }
        return obj;
    }

    public static z0 b(Object obj) {
        return obj == null ? z0.f20092b : new z0(obj);
    }

    public static ListenableFuture c(ListenableFuture listenableFuture) {
        if (listenableFuture.isDone()) {
            return listenableFuture;
        }
        v0 v0Var = new v0(listenableFuture);
        listenableFuture.b(v0Var, m0.f20038a);
        return v0Var;
    }

    public static p1 d(Callable callable, Executor executor) {
        p1 p1Var = new p1(callable);
        executor.execute(p1Var);
        return p1Var;
    }

    public static v e(ListenableFuture listenableFuture, vk.g gVar, Executor executor) {
        int i5 = w.f20081j;
        v vVar = new v(listenableFuture, gVar);
        listenableFuture.b(vVar, fg.a.M(executor, vVar));
        return vVar;
    }

    public static u f(ListenableFuture listenableFuture, d0 d0Var, Executor executor) {
        int i5 = w.f20081j;
        executor.getClass();
        u uVar = new u(listenableFuture, d0Var);
        listenableFuture.b(uVar, fg.a.M(executor, uVar));
        return uVar;
    }
}
