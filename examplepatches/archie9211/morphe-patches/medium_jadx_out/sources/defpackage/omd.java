package defpackage;

import java.util.concurrent.ExecutionException;
import kotlin.KotlinNullPointerException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class omd implements Runnable {
    public final /* synthetic */ int a;
    public final d37 b;
    public final x51 c;

    public /* synthetic */ omd(d37 d37Var, x51 x51Var, int i) {
        this.a = i;
        this.b = d37Var;
        this.c = x51Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        x51 x51Var = this.c;
        d37 d37Var = this.b;
        switch (i) {
            case 0:
                if (d37Var.isCancelled()) {
                    x51Var.l(null);
                    return;
                }
                boolean z = false;
                while (true) {
                    try {
                        try {
                            Object obj = d37Var.get();
                            if (z) {
                                Thread.currentThread().interrupt();
                            }
                            x51Var.resumeWith(obj);
                            return;
                        } catch (ExecutionException e) {
                            Throwable cause = e.getCause();
                            cause.getClass();
                            x51Var.resumeWith(new ajb(cause));
                            return;
                        }
                    } catch (InterruptedException unused) {
                        z = true;
                    } catch (Throwable th) {
                        if (z) {
                            Thread.currentThread().interrupt();
                        }
                        throw th;
                    }
                }
                break;
            default:
                if (d37Var.isCancelled()) {
                    x51Var.l(null);
                    return;
                }
                try {
                    x51Var.resumeWith(j2.h(d37Var));
                    return;
                } catch (ExecutionException e2) {
                    Throwable cause2 = e2.getCause();
                    if (cause2 != null) {
                        x51Var.resumeWith(new ajb(cause2));
                        return;
                    } else {
                        KotlinNullPointerException kotlinNullPointerException = new KotlinNullPointerException();
                        g76.d0(kotlinNullPointerException, g76.class.getName());
                        throw kotlinNullPointerException;
                    }
                }
        }
    }
}
