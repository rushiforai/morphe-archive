package defpackage;

import android.util.Log;
import java.lang.Thread;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wc7 extends FutureTask {
    public final /* synthetic */ int a = 2;
    public Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wc7(ifg ifgVar, Runnable runnable, Object obj) {
        super(runnable, obj);
        this.b = ifgVar;
    }

    @Override // java.util.concurrent.FutureTask
    public void done() {
        switch (this.a) {
            case 0:
                try {
                    if (!isCancelled()) {
                        try {
                            ((xc7) this.b).e((vc7) get());
                        } catch (InterruptedException | ExecutionException e) {
                            ((xc7) this.b).e(new vc7(e));
                        }
                        break;
                    }
                    return;
                } finally {
                    this.b = null;
                }
            case 1:
                o90 o90Var = (o90) this.b;
                AtomicBoolean atomicBoolean = o90Var.d;
                try {
                    Object obj = get();
                    if (atomicBoolean.get()) {
                        return;
                    }
                    o90Var.a(obj);
                    return;
                } catch (InterruptedException e2) {
                    Log.w("AsyncTask", e2);
                    return;
                } catch (CancellationException unused) {
                    if (atomicBoolean.get()) {
                        return;
                    }
                    o90Var.a(null);
                    return;
                } catch (ExecutionException e3) {
                    lg8.p("An error occurred while executing doInBackground()", e3.getCause());
                    return;
                } catch (Throwable th) {
                    lg8.p("An error occurred while executing doInBackground()", th);
                    return;
                }
            default:
                super.done();
                return;
        }
    }

    @Override // java.util.concurrent.FutureTask
    public void setException(Throwable th) {
        switch (this.a) {
            case 2:
                Thread.UncaughtExceptionHandler uncaughtExceptionHandler = ((ifg) this.b).a.d;
                if (uncaughtExceptionHandler != null) {
                    uncaughtExceptionHandler.uncaughtException(Thread.currentThread(), th);
                } else if (Log.isLoggable("GAv4", 6)) {
                    Log.e("GAv4", "MeasurementExecutor: job failed with ".concat(String.valueOf(th)));
                }
                super.setException(th);
                break;
            default:
                super.setException(th);
                break;
        }
    }

    public /* synthetic */ wc7(Callable callable) {
        super(callable);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wc7(o90 o90Var, wf3 wf3Var) {
        super(wf3Var);
        this.b = o90Var;
    }
}
