package io.ktor.utils.io;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m implements t, j0 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f66608f = AtomicReferenceFieldUpdater.newUpdater(m.class, Object.class, "suspensionSlot");

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f66609g = AtomicReferenceFieldUpdater.newUpdater(m.class, Object.class, "_closedCause");
    private volatile int flushBufferSize;

    /* renamed from: b, reason: collision with root package name */
    public final e80.a f66610b = new e80.a();

    /* renamed from: c, reason: collision with root package name */
    public final Object f66611c = new Object();

    @NotNull
    volatile /* synthetic */ Object suspensionSlot = c.f66560b;

    /* renamed from: d, reason: collision with root package name */
    public final e80.a f66612d = new e80.a();

    /* renamed from: e, reason: collision with root package name */
    public final e80.a f66613e = new e80.a();

    @NotNull
    volatile /* synthetic */ Object _closedCause = null;

    @Override // io.ktor.utils.io.t
    public final void a(Throwable th2) {
        if (this._closedCause != null) {
            return;
        }
        q0 q0Var = new q0(th2);
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f66609g;
        while (!atomicReferenceFieldUpdater.compareAndSet(this, null, q0Var) && atomicReferenceFieldUpdater.get(this) == null) {
        }
        i(q0Var.a(p0.f66630d));
    }

    @Override // io.ktor.utils.io.t
    public final Throwable b() {
        q0 q0Var = (q0) this._closedCause;
        if (q0Var != null) {
            return q0Var.a(p0.f66630d);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // io.ktor.utils.io.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) throws Throwable {
        i iVar;
        m mVar;
        g gVar;
        c cVar = c.f66560b;
        if (continuationImpl instanceof i) {
            iVar = (i) continuationImpl;
            int i5 = iVar.f66599w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                iVar.f66599w = i5 - Integer.MIN_VALUE;
            } else {
                iVar = new i(this, continuationImpl);
            }
        }
        Object obj = iVar.f66597u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = iVar.f66599w;
        if (i11 == 0) {
            ResultKt.b(obj);
            Throwable thB = b();
            if (thB != null) {
                throw thB;
            }
            j();
            if (this.flushBufferSize < 1048576) {
                return Unit.f71706a;
            }
            mVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mVar = iVar.f66596t;
            ResultKt.b(obj);
        }
        while (this.flushBufferSize >= 1048576 && this._closedCause == null) {
            iVar.f66596t = mVar;
            iVar.f66599w = 1;
            t70.m mVar2 = new t70.m(1, IntrinsicsKt.b(iVar));
            mVar2.t();
            f fVar = new f(mVar2);
            g gVar2 = (g) mVar.suspensionSlot;
            boolean z11 = gVar2 instanceof a;
            if (z11) {
                if (!(gVar2 instanceof f)) {
                }
                if (this.flushBufferSize >= 1048576) {
                    gVar = (g) mVar.suspensionSlot;
                    if (gVar instanceof f) {
                    }
                }
            } else {
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f66608f;
                while (!atomicReferenceFieldUpdater.compareAndSet(mVar, gVar2, fVar)) {
                    if (atomicReferenceFieldUpdater.get(mVar) != gVar2) {
                        fVar.b();
                        break;
                    }
                }
                if (!(gVar2 instanceof f)) {
                    e eVar = (e) gVar2;
                    eVar.a(new ConcurrentIOException("write", eVar.c()));
                } else if (gVar2 instanceof e) {
                    ((e) gVar2).b();
                } else if (z11) {
                    fVar.a(((a) gVar2).f66547b);
                } else if (!Intrinsics.b(gVar2, cVar)) {
                    throw new NoWhenBranchMatchedException();
                }
                if (this.flushBufferSize >= 1048576 || this._closedCause != null) {
                    gVar = (g) mVar.suspensionSlot;
                    if (gVar instanceof f) {
                        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f66608f;
                        while (true) {
                            if (atomicReferenceFieldUpdater2.compareAndSet(mVar, gVar, cVar)) {
                                ((e) gVar).b();
                                break;
                            }
                            if (atomicReferenceFieldUpdater2.get(mVar) != gVar) {
                                break;
                            }
                        }
                    }
                }
            }
            Object objS = mVar2.s();
            CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.ktor.utils.io.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        j jVar;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        if (continuation instanceof j) {
            jVar = (j) continuation;
            int i5 = jVar.f66602v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f66602v = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuation);
            }
        }
        Object obj = jVar.f66600t;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = jVar.f66602v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                int i12 = Result.f71687b;
                jVar.f66602v = 1;
                if (c(jVar) == obj2) {
                    return obj2;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            Unit unit = Unit.f71706a;
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            ResultKt.a(th2);
        }
        do {
            atomicReferenceFieldUpdater = f66609g;
            if (atomicReferenceFieldUpdater.compareAndSet(this, null, r0.f66642a)) {
                i(null);
                return Unit.f71706a;
            }
        } while (atomicReferenceFieldUpdater.get(this) == null);
        return Unit.f71706a;
    }

    @Override // io.ktor.utils.io.j0
    public final e80.j e() throws Throwable {
        Throwable thA;
        if (this._closedCause == null) {
            return this.f66613e;
        }
        q0 q0Var = (q0) this._closedCause;
        if (q0Var == null || (thA = q0Var.a(l.f66606d)) == null) {
            throw new ClosedWriteChannelException(null, null);
        }
        throw thA;
    }

    @Override // io.ktor.utils.io.t
    public final e80.a f() throws Throwable {
        Throwable thA;
        q0 q0Var = (q0) this._closedCause;
        if (q0Var != null && (thA = q0Var.a(k.f66603d)) != null) {
            throw thA;
        }
        if (this.f66612d.N()) {
            k();
        }
        return this.f66612d;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    @Override // io.ktor.utils.io.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(int i5, ContinuationImpl continuationImpl) throws Throwable {
        h hVar;
        m mVar;
        g gVar;
        Object objS;
        c cVar = c.f66560b;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i11 = hVar.f66588x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                hVar.f66588x = i11 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f66586v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = hVar.f66588x;
        if (i12 == 0) {
            ResultKt.b(obj);
            Throwable thB = b();
            if (thB != null) {
                throw thB;
            }
            if (this.f66612d.f52247c >= i5) {
                return Boolean.TRUE;
            }
            mVar = this;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = hVar.f66584t;
            mVar = hVar.f66585u;
            ResultKt.b(obj);
        }
        do {
            long j11 = i5;
            if (this.flushBufferSize + this.f66612d.f52247c >= j11 || this._closedCause != null) {
                if (this.f66612d.f52247c < 1048576) {
                    k();
                }
                return Boolean.valueOf(this.f66612d.f52247c >= j11);
            }
            hVar.f66585u = mVar;
            hVar.f66584t = i5;
            hVar.f66588x = 1;
            t70.m mVar2 = new t70.m(1, IntrinsicsKt.b(hVar));
            mVar2.t();
            d dVar = new d(mVar2);
            g gVar2 = (g) mVar.suspensionSlot;
            boolean z11 = gVar2 instanceof a;
            if (z11) {
                if (!(gVar2 instanceof d)) {
                }
                if (this.flushBufferSize + this.f66612d.f52247c < j11) {
                    gVar = (g) mVar.suspensionSlot;
                    if (gVar instanceof d) {
                    }
                }
            } else {
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f66608f;
                while (!atomicReferenceFieldUpdater.compareAndSet(mVar, gVar2, dVar)) {
                    if (atomicReferenceFieldUpdater.get(mVar) != gVar2) {
                        dVar.b();
                        break;
                    }
                }
                if (!(gVar2 instanceof d)) {
                    e eVar = (e) gVar2;
                    eVar.a(new ConcurrentIOException("read", eVar.c()));
                } else if (gVar2 instanceof e) {
                    ((e) gVar2).b();
                } else if (z11) {
                    dVar.a(((a) gVar2).f66547b);
                } else if (!Intrinsics.b(gVar2, cVar)) {
                    throw new NoWhenBranchMatchedException();
                }
                if (this.flushBufferSize + this.f66612d.f52247c < j11 || this._closedCause != null) {
                    gVar = (g) mVar.suspensionSlot;
                    if (gVar instanceof d) {
                        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f66608f;
                        while (true) {
                            if (atomicReferenceFieldUpdater2.compareAndSet(mVar, gVar, cVar)) {
                                ((e) gVar).b();
                                break;
                            }
                            if (atomicReferenceFieldUpdater2.get(mVar) != gVar) {
                                break;
                            }
                        }
                    }
                }
            }
            objS = mVar2.s();
            CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        } while (objS != coroutineSingletons);
        return coroutineSingletons;
    }

    @Override // io.ktor.utils.io.t
    public final boolean h() {
        if (b() == null) {
            return this._closedCause != null && this.flushBufferSize == 0 && this.f66612d.N();
        }
        return true;
    }

    public final void i(Throwable th2) {
        a aVar;
        if (th2 != null) {
            aVar = new a(th2);
        } else {
            g.f66579a.getClass();
            aVar = b.f66553b;
        }
        g gVar = (g) f66608f.getAndSet(this, aVar);
        if (gVar instanceof e) {
            ((e) gVar).a(th2);
        }
    }

    public final void j() {
        if (this.f66613e.N()) {
            return;
        }
        synchronized (this.f66611c) {
            e80.a aVar = this.f66613e;
            int i5 = (int) aVar.f52247c;
            this.f66610b.e(aVar);
            this.flushBufferSize += i5;
            Unit unit = Unit.f71706a;
        }
        g gVar = (g) this.suspensionSlot;
        if (gVar instanceof d) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f66608f;
            c cVar = c.f66560b;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, gVar, cVar)) {
                if (atomicReferenceFieldUpdater.get(this) != gVar) {
                    return;
                }
            }
            ((e) gVar).b();
        }
    }

    public final void k() {
        synchronized (this.f66611c) {
            this.f66610b.f(this.f66612d);
            this.flushBufferSize = 0;
            Unit unit = Unit.f71706a;
        }
        g gVar = (g) this.suspensionSlot;
        if (gVar instanceof f) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f66608f;
            c cVar = c.f66560b;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, gVar, cVar)) {
                if (atomicReferenceFieldUpdater.get(this) != gVar) {
                    return;
                }
            }
            ((e) gVar).b();
        }
    }

    public final String toString() {
        return "ByteChannel[" + hashCode() + AbstractJsonLexerKt.END_LIST;
    }
}
