package cl;

import android.util.Log;
import b.c9;
import com.google.android.gms.tasks.RuntimeExecutionException;
import com.google.android.gms.tasks.Task;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import kotlin.coroutines.EmptyCoroutineContext;

/* loaded from: classes.dex */
public final class u0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f20077a;

    /* renamed from: b, reason: collision with root package name */
    public Object f20078b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f20079c;

    public /* synthetic */ u0(int i5, Object obj, Object obj2) {
        this.f20077a = i5;
        this.f20078b = obj;
        this.f20079c = obj2;
    }

    private final void a() {
        fi.p pVar = (fi.p) this.f20079c;
        synchronized (pVar.f55154c) {
            try {
                fi.g gVar = (fi.g) pVar.f55155d;
                if (gVar != null) {
                    gVar.onSuccess(((Task) this.f20078b).m());
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void b() {
        try {
            ((Runnable) this.f20079c).run();
            synchronized (((androidx.room.x) this.f20078b).f15282e) {
                ((androidx.room.x) this.f20078b).a();
            }
        } catch (Throwable th2) {
            synchronized (((androidx.room.x) this.f20078b).f15282e) {
                ((androidx.room.x) this.f20078b).a();
                throw th2;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0043, code lost:
    
        if (r1 == false) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004c, code lost:
    
        r1 = r1 | java.lang.Thread.interrupted();
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x004e, code lost:
    
        ((java.lang.Runnable) r10.f20078b).run();
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x005a, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005c, code lost:
    
        r3 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x005d, code lost:
    
        cm.k.f20122f.log(java.util.logging.Level.SEVERE, "Exception while executing runnable " + ((java.lang.Runnable) r10.f20078b), (java.lang.Throwable) r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007a, code lost:
    
        r10.f20078b = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x007c, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:?, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:47:0x003c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void c() {
        Runnable runnable;
        boolean z11 = false;
        boolean zInterrupted = false;
        while (true) {
            try {
                synchronized (((cm.k) this.f20079c).f20124b) {
                    if (z11) {
                        runnable = (Runnable) ((cm.k) this.f20079c).f20124b.poll();
                        this.f20078b = runnable;
                        if (runnable != null) {
                        }
                    } else {
                        cm.k kVar = (cm.k) this.f20079c;
                        if (kVar.f20125c != 4) {
                            kVar.f20126d++;
                            kVar.f20125c = 4;
                            z11 = true;
                            runnable = (Runnable) ((cm.k) this.f20079c).f20124b.poll();
                            this.f20078b = runnable;
                            if (runnable != null) {
                                ((cm.k) this.f20079c).f20125c = 1;
                            }
                        }
                    }
                }
                if (!zInterrupted) {
                    return;
                }
            } finally {
                if (zInterrupted) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.lang.Runnable
    public final void run() {
        Throwable thA;
        switch (this.f20077a) {
            case 0:
                t0 t0Var = (t0) this.f20079c;
                ListenableFuture listenableFuture = (ListenableFuture) this.f20078b;
                if ((listenableFuture instanceof dl.a) && (thA = ((dl.a) listenableFuture).a()) != null) {
                    t0Var.onFailure(thA);
                    return;
                }
                try {
                    t0Var.onSuccess(w0.a(listenableFuture));
                    return;
                } catch (Error e3) {
                    e = e3;
                    t0Var.onFailure(e);
                    return;
                } catch (RuntimeException e11) {
                    e = e11;
                    t0Var.onFailure(e);
                    return;
                } catch (ExecutionException e12) {
                    t0Var.onFailure(e12.getCause());
                    return;
                }
            case 1:
                try {
                    c();
                    return;
                } catch (Error e13) {
                    synchronized (((cm.k) this.f20079c).f20124b) {
                        ((cm.k) this.f20079c).f20125c = 1;
                        throw e13;
                    }
                }
            case 2:
                fi.p pVar = (fi.p) this.f20079c;
                try {
                    Task task = (Task) ((fi.c) pVar.f55154c).then((Task) this.f20078b);
                    if (task == null) {
                        ((fi.t) pVar.f55155d).v(new NullPointerException("Continuation returned null"));
                        return;
                    }
                    fi.s sVar = fi.k.f55137b;
                    task.g(sVar, pVar);
                    task.e(sVar, pVar);
                    task.a(sVar, pVar);
                    return;
                } catch (RuntimeExecutionException e14) {
                    if (e14.getCause() instanceof Exception) {
                        ((fi.t) pVar.f55155d).v((Exception) e14.getCause());
                        return;
                    } else {
                        ((fi.t) pVar.f55155d).v(e14);
                        return;
                    }
                } catch (Exception e15) {
                    ((fi.t) pVar.f55155d).v(e15);
                    return;
                }
            case 3:
                fi.p pVar2 = (fi.p) this.f20079c;
                synchronized (pVar2.f55154c) {
                    ((fi.e) pVar2.f55155d).onComplete((Task) this.f20078b);
                }
                return;
            case 4:
                fi.p pVar3 = (fi.p) this.f20079c;
                synchronized (pVar3.f55154c) {
                    try {
                        fi.f fVar = (fi.f) pVar3.f55155d;
                        if (fVar != null) {
                            Exception excL = ((Task) this.f20078b).l();
                            sg.w.h(excL);
                            fVar.i(excL);
                        }
                    } finally {
                    }
                }
                return;
            case 5:
                a();
                return;
            case 6:
                fi.p pVar4 = (fi.p) this.f20079c;
                try {
                    Task taskThen = ((fi.i) pVar4.f55154c).then(((Task) this.f20078b).m());
                    if (taskThen == null) {
                        ((fi.t) pVar4.f55155d).v(new NullPointerException("Continuation returned null"));
                        return;
                    }
                    fi.s sVar2 = fi.k.f55137b;
                    taskThen.g(sVar2, pVar4);
                    taskThen.e(sVar2, pVar4);
                    taskThen.a(sVar2, pVar4);
                    return;
                } catch (RuntimeExecutionException e16) {
                    if (e16.getCause() instanceof Exception) {
                        pVar4.i((Exception) e16.getCause());
                        return;
                    } else {
                        ((fi.t) pVar4.f55155d).v(e16);
                        return;
                    }
                } catch (CancellationException unused) {
                    pVar4.onCanceled();
                    return;
                } catch (Exception e17) {
                    ((fi.t) pVar4.f55155d).v(e17);
                    return;
                }
            case 7:
                if (((p7.x) this.f20079c).f82408q.f98296a instanceof z7.a) {
                    return;
                }
                try {
                    ((ListenableFuture) this.f20078b).get();
                    o7.r rVarC = o7.r.c();
                    String str = p7.x.f82393s;
                    String str2 = ((p7.x) this.f20079c).f82397d.f95173c;
                    rVarC.getClass();
                    p7.x xVar = (p7.x) this.f20079c;
                    xVar.f82408q.l(xVar.f82398e.startWork());
                    return;
                } catch (Throwable th2) {
                    ((p7.x) this.f20079c).f82408q.k(th2);
                    return;
                }
            case 8:
                String str3 = (String) this.f20078b;
                p7.x xVar2 = (p7.x) this.f20079c;
                x7.q qVar = xVar2.f82397d;
                try {
                    try {
                        o7.p pVar5 = (o7.p) xVar2.f82408q.get();
                        if (pVar5 == null) {
                            o7.r.c().a(p7.x.f82393s, qVar.f95173c + " returned a null result. Treating it as a failure.");
                        } else {
                            o7.r rVarC2 = o7.r.c();
                            String str4 = p7.x.f82393s;
                            String str5 = qVar.f95173c;
                            pVar5.toString();
                            rVarC2.getClass();
                            xVar2.f82400g = pVar5;
                        }
                    } catch (Throwable th3) {
                        xVar2.b();
                        throw th3;
                    }
                } catch (InterruptedException e18) {
                    e = e18;
                    o7.r.c().b(p7.x.f82393s, str3 + " failed because it threw an exception/error", e);
                } catch (CancellationException e19) {
                    o7.r rVarC3 = o7.r.c();
                    String str6 = p7.x.f82393s;
                    String str7 = str3 + " was cancelled";
                    if (rVarC3.f79681a <= 4) {
                        Log.i(str6, str7, e19);
                    }
                } catch (ExecutionException e21) {
                    e = e21;
                    o7.r.c().b(p7.x.f82393s, str3 + " failed because it threw an exception/error", e);
                }
                xVar2.b();
                return;
            case 9:
                o7.r rVarC4 = o7.r.c();
                int i5 = q7.a.f83762e;
                x7.q qVar2 = (x7.q) this.f20078b;
                rVarC4.getClass();
                ((q7.a) this.f20079c).f83763a.e(qVar2);
                return;
            case 10:
                b();
                return;
            default:
                int i11 = 0;
                while (true) {
                    try {
                        ((Runnable) this.f20078b).run();
                    } catch (Throwable th4) {
                        t70.g0.a(EmptyCoroutineContext.f71803a, th4);
                    }
                    Runnable runnableG0 = ((y70.h) this.f20079c).g0();
                    if (runnableG0 == null) {
                        return;
                    }
                    try {
                        this.f20078b = runnableG0;
                        i11++;
                        if (i11 >= 16) {
                            y70.h hVar = (y70.h) this.f20079c;
                            if (y70.g.f(hVar.f96801d, hVar)) {
                                y70.h hVar2 = (y70.h) this.f20079c;
                                y70.g.e(hVar2.f96801d, hVar2, this);
                                return;
                            }
                        }
                    } catch (Throwable th5) {
                        y70.h hVar3 = (y70.h) this.f20079c;
                        synchronized (hVar3.f96805h) {
                            y70.h.f96799i.decrementAndGet(hVar3);
                            throw th5;
                        }
                    }
                }
        }
    }

    public String toString() {
        switch (this.f20077a) {
            case 0:
                vk.j jVar = new vk.j(u0.class.getSimpleName());
                jVar.p((t0) this.f20079c);
                return jVar.toString();
            case 1:
                Runnable runnable = (Runnable) this.f20078b;
                if (runnable != null) {
                    return "SequentialExecutorWorker{running=" + runnable + "}";
                }
                return "SequentialExecutorWorker{state=" + c9.z(((cm.k) this.f20079c).f20125c) + "}";
            default:
                return super.toString();
        }
    }

    public /* synthetic */ u0(Object obj, Object obj2, boolean z11, int i5) {
        this.f20077a = i5;
        this.f20078b = obj2;
        this.f20079c = obj;
    }

    public u0(cm.k kVar) {
        this.f20077a = 1;
        this.f20079c = kVar;
    }
}
