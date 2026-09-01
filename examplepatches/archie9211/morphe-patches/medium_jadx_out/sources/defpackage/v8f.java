package defpackage;

import java.util.concurrent.ExecutionException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class v8f {
    public static final String a = d87.k("WorkerWrapper");

    public static final Object a(d37 d37Var, k37 k37Var, p4d p4dVar) {
        Object obj;
        try {
            int i = 0;
            if (!d37Var.isDone()) {
                x51 x51Var = new x51(1, pwd.Q(p4dVar));
                x51Var.s();
                d37Var.a(new omd(d37Var, x51Var, i), af3.INSTANCE);
                x51Var.v(new j8e(k37Var, 7, d37Var));
                return x51Var.q();
            }
            while (true) {
                try {
                    obj = d37Var.get();
                    break;
                } catch (InterruptedException unused) {
                    i = 1;
                } catch (Throwable th) {
                    if (i != 0) {
                        Thread.currentThread().interrupt();
                    }
                    throw th;
                }
            }
            if (i != 0) {
                Thread.currentThread().interrupt();
            }
            return obj;
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            cause.getClass();
            throw cause;
        }
    }
}
