package defpackage;

import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.chromium.net.impl.CallbackExceptionImpl;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ea6 implements Executor {
    public final /* synthetic */ Executor a;
    public final /* synthetic */ la6 b;

    public ea6(la6 la6Var, Executor executor) {
        this.a = executor;
        this.b = la6Var;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        try {
            this.a.execute(runnable);
        } catch (RejectedExecutionException e) {
            this.b.p.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", e));
        }
    }
}
