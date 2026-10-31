package v70;

import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlinx.coroutines.JobCancellationException;
import t70.g0;

/* loaded from: classes.dex */
public final class w extends t70.a implements x, m {

    /* renamed from: d, reason: collision with root package name */
    public final i f92201d;

    public w(CoroutineContext coroutineContext, i iVar) {
        super(coroutineContext, true);
        this.f92201d = iVar;
    }

    @Override // t70.x1
    public final void B(CancellationException cancellationException) {
        this.f92201d.g(true, cancellationException);
        z(cancellationException);
    }

    @Override // t70.x1, t70.r1
    public final void c(CancellationException cancellationException) {
        if (isCancelled()) {
            return;
        }
        if (cancellationException == null) {
            cancellationException = new JobCancellationException(E(), null, this);
        }
        B(cancellationException);
    }

    @Override // v70.z
    public final n iterator() {
        i iVar = this.f92201d;
        iVar.getClass();
        return new b(iVar);
    }

    @Override // v70.a0
    public final Object j(Object obj) {
        return this.f92201d.j(obj);
    }

    @Override // t70.a
    public final void j0(boolean z11, Throwable th2) {
        if (this.f92201d.g(false, th2) || z11) {
            return;
        }
        g0.a(this.f88769c, th2);
    }

    @Override // v70.z
    public final x7.h k() {
        return this.f92201d.k();
    }

    @Override // t70.a
    public final void k0(Object obj) {
        this.f92201d.r(null);
    }

    @Override // v70.z
    public final Object m(SuspendLambda suspendLambda) {
        i iVar = this.f92201d;
        iVar.getClass();
        Object objF = i.F(iVar, suspendLambda);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objF;
    }

    public final void m0(f20.h hVar) {
        i iVar = this.f92201d;
        iVar.getClass();
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = i.f92167l;
        while (!atomicReferenceFieldUpdater.compareAndSet(iVar, null, hVar)) {
            if (atomicReferenceFieldUpdater.get(iVar) != null) {
                while (true) {
                    Object obj = atomicReferenceFieldUpdater.get(iVar);
                    w50.g gVar = k.f92186q;
                    if (obj != gVar) {
                        if (obj == k.f92187r) {
                            throw new IllegalStateException("Another handler was already registered and successfully invoked");
                        }
                        throw new IllegalStateException(("Another handler is already registered: " + obj).toString());
                    }
                    w50.g gVar2 = k.f92187r;
                    while (!atomicReferenceFieldUpdater.compareAndSet(iVar, gVar, gVar2)) {
                        if (atomicReferenceFieldUpdater.get(iVar) != gVar) {
                            break;
                        }
                    }
                    hVar.invoke(iVar.p());
                    return;
                }
            }
        }
    }

    @Override // v70.z
    public final Object n() {
        return this.f92201d.n();
    }

    @Override // v70.z
    public final Object q(Continuation continuation) {
        return this.f92201d.q(continuation);
    }

    @Override // v70.a0
    public final boolean r(Throwable th2) {
        return this.f92201d.g(false, th2);
    }

    @Override // v70.a0
    public final Object t(Object obj, Continuation continuation) {
        return this.f92201d.t(obj, continuation);
    }
}
