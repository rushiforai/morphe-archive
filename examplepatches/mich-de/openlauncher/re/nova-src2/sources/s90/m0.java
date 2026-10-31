package s90;

import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* loaded from: classes5.dex */
public final class m0 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Executor f86979a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f86980b;

    public m0(n0 n0Var, Executor executor) {
        this.f86979a = executor;
        this.f86980b = n0Var;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        try {
            this.f86979a.execute(runnable);
        } catch (RejectedExecutionException e3) {
            this.f86980b.c(e3);
        }
    }
}
