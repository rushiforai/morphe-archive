package cl;

import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* loaded from: classes.dex */
public final class f1 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Executor f20000a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q0 f20001b;

    public f1(Executor executor, q0 q0Var) {
        this.f20000a = executor;
        this.f20001b = q0Var;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        try {
            this.f20000a.execute(runnable);
        } catch (RejectedExecutionException e3) {
            this.f20001b.o(e3);
        }
    }
}
