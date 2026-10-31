package xm;

import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import fi.t;
import java.util.HashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: d, reason: collision with root package name */
    public static final HashMap f96097d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public static final f5.c f96098e = new f5.c(0);

    /* renamed from: a, reason: collision with root package name */
    public final Executor f96099a;

    /* renamed from: b, reason: collision with root package name */
    public final o f96100b;

    /* renamed from: c, reason: collision with root package name */
    public t f96101c = null;

    public c(Executor executor, o oVar) {
        this.f96099a = executor;
        this.f96100b = oVar;
    }

    public static Object a(Task task) throws ExecutionException, TimeoutException {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        fi.l lVar = new fi.l(2);
        Executor executor = f96098e;
        task.g(executor, lVar);
        task.e(executor, lVar);
        task.a(executor, lVar);
        if (!lVar.a()) {
            throw new TimeoutException("Task await timed out.");
        }
        if (task.q()) {
            return task.m();
        }
        throw new ExecutionException(task.l());
    }

    public final synchronized Task b() {
        try {
            t tVar = this.f96101c;
            if (tVar == null || (tVar.p() && !this.f96101c.q())) {
                this.f96101c = Tasks.b(new com.google.firebase.crashlytics.internal.common.m(this.f96100b, 3), this.f96099a);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.f96101c;
    }

    public final e c() {
        synchronized (this) {
            try {
                t tVar = this.f96101c;
                if (tVar != null && tVar.q()) {
                    return (e) this.f96101c.m();
                }
                try {
                    Task taskB = b();
                    TimeUnit timeUnit = TimeUnit.SECONDS;
                    return (e) a(taskB);
                } catch (InterruptedException | ExecutionException | TimeoutException unused) {
                    return null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final Task d(e eVar) {
        wm.a aVar = new wm.a(1, this, eVar);
        Executor executor = this.f96099a;
        return Tasks.b(aVar, executor).s(executor, new bm.o(4, this, eVar));
    }
}
