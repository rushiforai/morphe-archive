package androidx.work;

import android.content.Context;
import defpackage.bo;
import defpackage.c1e;
import defpackage.d37;
import defpackage.dm2;
import defpackage.dt2;
import defpackage.flb;
import defpackage.g76;
import defpackage.gx1;
import defpackage.ib2;
import defpackage.k05;
import defpackage.k37;
import defpackage.kb2;
import defpackage.n92;
import defpackage.tb2;
import defpackage.wa6;
import defpackage.xb2;
import defpackage.yb2;
import defpackage.z73;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0007\b&\u0018\u00002\u00020\u0001:\u0001!B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0013\u0010\n\u001a\b\u0012\u0004\u0012\u00020\t0\b¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\fH\u0096@¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0010\u001a\u00020\u000fH\u0086@¢\u0006\u0004\b\u0012\u0010\u0013J\u0018\u0010\u0015\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\fH\u0086@¢\u0006\u0004\b\u0015\u0010\u0016J\u0013\u0010\u0017\u001a\b\u0012\u0004\u0012\u00020\f0\b¢\u0006\u0004\b\u0017\u0010\u000bJ\r\u0010\u0018\u001a\u00020\u0011¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001aR \u0010\u001c\u001a\u00020\u001b8\u0016X\u0097\u0004¢\u0006\u0012\n\u0004\b\u001c\u0010\u001d\u0012\u0004\b \u0010\u0019\u001a\u0004\b\u001e\u0010\u001f¨\u0006\""}, d2 = {"Landroidx/work/CoroutineWorker;", "Lk37;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "Ld37;", "Lj37;", "startWork", "()Ld37;", "Lk05;", "getForegroundInfo", "(Ln92;)Ljava/lang/Object;", "Ldt2;", "data", "Lc1e;", "setProgress", "(Ldt2;Ln92;)Ljava/lang/Object;", "foregroundInfo", "setForeground", "(Lk05;Ln92;)Ljava/lang/Object;", "getForegroundInfoAsync", "onStopped", "()V", "Landroidx/work/WorkerParameters;", "Lkb2;", "coroutineContext", "Lkb2;", "getCoroutineContext", "()Lkb2;", "getCoroutineContext$annotations", "xb2", "work-runtime_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
public abstract class CoroutineWorker extends k37 {
    private final kb2 coroutineContext;
    private final WorkerParameters params;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CoroutineWorker(Context context, WorkerParameters workerParameters) {
        super(context, workerParameters);
        context.getClass();
        workerParameters.getClass();
        this.params = workerParameters;
        this.coroutineContext = xb2.c;
    }

    public static /* synthetic */ Object getForegroundInfo$suspendImpl(CoroutineWorker coroutineWorker, n92<? super k05> n92Var) {
        throw new IllegalStateException("Not implemented");
    }

    public abstract Object doWork(n92 n92Var);

    public kb2 getCoroutineContext() {
        return this.coroutineContext;
    }

    public Object getForegroundInfo(n92<? super k05> n92Var) {
        return getForegroundInfo$suspendImpl(this, n92Var);
    }

    @Override // defpackage.k37
    public final d37 getForegroundInfoAsync() {
        kb2 coroutineContext = getCoroutineContext();
        wa6 wa6VarQ = bo.q();
        coroutineContext.getClass();
        return gx1.P(flb.p0(coroutineContext, wa6VarQ), new yb2(this, null, 0));
    }

    public final Object setForeground(k05 k05Var, n92<? super c1e> n92Var) throws Throwable {
        d37 foregroundAsync = setForegroundAsync(k05Var);
        foregroundAsync.getClass();
        Object objZ = dm2.z(foregroundAsync, n92Var);
        return objZ == tb2.COROUTINE_SUSPENDED ? objZ : c1e.a;
    }

    public final Object setProgress(dt2 dt2Var, n92<? super c1e> n92Var) throws Throwable {
        d37 progressAsync = setProgressAsync(dt2Var);
        progressAsync.getClass();
        Object objZ = dm2.z(progressAsync, n92Var);
        return objZ == tb2.COROUTINE_SUSPENDED ? objZ : c1e.a;
    }

    @Override // defpackage.k37
    public final d37 startWork() {
        ib2 coroutineContext = !g76.L(getCoroutineContext(), xb2.c) ? getCoroutineContext() : this.params.g;
        coroutineContext.getClass();
        return gx1.P(coroutineContext.j0(bo.q()), new yb2(this, null, 1));
    }

    @z73
    public static /* synthetic */ void getCoroutineContext$annotations() {
    }

    @Override // defpackage.k37
    public final void onStopped() {
    }
}
