package c80;

import b.c0;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.m;
import t70.m0;
import t70.t2;
import y70.t;

/* loaded from: classes.dex */
public class i {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f19839c = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "head$volatile");

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f19840d = AtomicLongFieldUpdater.newUpdater(i.class, "deqIdx$volatile");

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f19841e = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "tail$volatile");

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f19842f = AtomicLongFieldUpdater.newUpdater(i.class, "enqIdx$volatile");

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f19843g = AtomicIntegerFieldUpdater.newUpdater(i.class, "_availablePermits$volatile");
    private volatile /* synthetic */ int _availablePermits$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final int f19844a;

    /* renamed from: b, reason: collision with root package name */
    public final b f19845b;
    private volatile /* synthetic */ long deqIdx$volatile;
    private volatile /* synthetic */ long enqIdx$volatile;
    private volatile /* synthetic */ Object head$volatile;
    private volatile /* synthetic */ Object tail$volatile;

    public i(int i5) {
        this.f19844a = i5;
        if (i5 <= 0) {
            throw new IllegalArgumentException(c0.h(i5, "Semaphore should have at least 1 permit, but had ").toString());
        }
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "The number of acquired permits should be in 0..").toString());
        }
        l lVar = new l(0L, null, 2);
        this.head$volatile = lVar;
        this.tail$volatile = lVar;
        this._availablePermits$volatile = i5;
        this.f19845b = new b(this, 1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        r4.o(kotlin.Unit.f71706a, r3.f19845b);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int andDecrement;
        int i5;
        do {
            atomicIntegerFieldUpdater = f19843g;
            andDecrement = atomicIntegerFieldUpdater.getAndDecrement(this);
            i5 = this.f19844a;
        } while (andDecrement > i5);
        if (andDecrement > 0) {
            return Unit.f71706a;
        }
        m mVarO = m0.o(IntrinsicsKt.b(continuationImpl));
        try {
            if (!b(mVarO)) {
                while (true) {
                    int andDecrement2 = atomicIntegerFieldUpdater.getAndDecrement(this);
                    if (andDecrement2 <= i5) {
                        if (andDecrement2 > 0) {
                            break;
                        }
                        if (b(mVarO)) {
                            break;
                        }
                    }
                }
            }
            Object objS = mVarO.s();
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (objS != coroutineSingletons) {
                objS = Unit.f71706a;
            }
            return objS == coroutineSingletons ? objS : Unit.f71706a;
        } catch (Throwable th2) {
            mVarO.B();
            throw th2;
        }
    }

    public final boolean b(t2 t2Var) {
        Object objA;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f19841e;
        l lVar = (l) atomicReferenceFieldUpdater.get(this);
        long andIncrement = f19842f.getAndIncrement(this);
        g gVar = g.f19837d;
        long j11 = andIncrement / k.f19851f;
        loop0: while (true) {
            objA = y70.b.a(lVar, j11, gVar);
            if (!y70.g.c(objA)) {
                t tVarB = y70.g.b(objA);
                while (true) {
                    t tVar = (t) atomicReferenceFieldUpdater.get(this);
                    if (tVar.f96826c >= tVarB.f96826c) {
                        break loop0;
                    }
                    if (!tVarB.j()) {
                        break;
                    }
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, tVar, tVarB)) {
                        if (atomicReferenceFieldUpdater.get(this) != tVar) {
                            if (tVarB.f()) {
                                tVarB.e();
                            }
                        }
                    }
                    if (tVar.f()) {
                        tVar.e();
                    }
                }
            } else {
                break;
            }
        }
        l lVar2 = (l) y70.g.b(objA);
        AtomicReferenceArray atomicReferenceArray = lVar2.f19852e;
        int i5 = (int) (andIncrement % k.f19851f);
        while (!atomicReferenceArray.compareAndSet(i5, null, t2Var)) {
            if (atomicReferenceArray.get(i5) != null) {
                w50.g gVar2 = k.f19847b;
                w50.g gVar3 = k.f19848c;
                while (!atomicReferenceArray.compareAndSet(i5, gVar2, gVar3)) {
                    if (atomicReferenceArray.get(i5) != gVar2) {
                        return false;
                    }
                }
                ((t70.l) t2Var).o(Unit.f71706a, this.f19845b);
                return true;
            }
        }
        t2Var.c(lVar2, i5);
        return true;
    }

    public final void c() {
        int i5;
        Object objA;
        boolean z11;
        do {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = f19843g;
            int andIncrement = atomicIntegerFieldUpdater.getAndIncrement(this);
            int i11 = this.f19844a;
            if (andIncrement >= i11) {
                do {
                    i5 = atomicIntegerFieldUpdater.get(this);
                    if (i5 <= i11) {
                        break;
                    }
                } while (!atomicIntegerFieldUpdater.compareAndSet(this, i5, i11));
                throw new IllegalStateException(("The number of released permits cannot be greater than " + i11).toString());
            }
            if (andIncrement >= 0) {
                return;
            }
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f19839c;
            l lVar = (l) atomicReferenceFieldUpdater.get(this);
            long andIncrement2 = f19840d.getAndIncrement(this);
            long j11 = andIncrement2 / k.f19851f;
            h hVar = h.f19838d;
            while (true) {
                objA = y70.b.a(lVar, j11, hVar);
                if (y70.g.c(objA)) {
                    break;
                }
                t tVarB = y70.g.b(objA);
                while (true) {
                    t tVar = (t) atomicReferenceFieldUpdater.get(this);
                    if (tVar.f96826c >= tVarB.f96826c) {
                        break;
                    }
                    if (!tVarB.j()) {
                        break;
                    }
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, tVar, tVarB)) {
                        if (atomicReferenceFieldUpdater.get(this) != tVar) {
                            if (tVarB.f()) {
                                tVarB.e();
                            }
                        }
                    }
                    if (tVar.f()) {
                        tVar.e();
                    }
                }
            }
            l lVar2 = (l) y70.g.b(objA);
            AtomicReferenceArray atomicReferenceArray = lVar2.f19852e;
            lVar2.b();
            z11 = false;
            if (lVar2.f96826c <= j11) {
                int i12 = (int) (andIncrement2 % k.f19851f);
                Object andSet = atomicReferenceArray.getAndSet(i12, k.f19847b);
                if (andSet == null) {
                    int i13 = k.f19846a;
                    for (int i14 = 0; i14 < i13; i14++) {
                        if (atomicReferenceArray.get(i12) == k.f19848c) {
                            z11 = true;
                            break;
                        }
                    }
                    w50.g gVar = k.f19847b;
                    w50.g gVar2 = k.f19849d;
                    while (true) {
                        if (!atomicReferenceArray.compareAndSet(i12, gVar, gVar2)) {
                            if (atomicReferenceArray.get(i12) != gVar) {
                                break;
                            }
                        } else {
                            z11 = true;
                            break;
                        }
                    }
                    z11 = !z11;
                } else if (andSet != k.f19850e) {
                    if (!(andSet instanceof t70.l)) {
                        if (!(andSet instanceof b80.g)) {
                            throw new IllegalStateException(("unexpected: " + andSet).toString());
                        }
                        if (((b80.f) ((b80.g) andSet)).h(this, Unit.f71706a) == 0) {
                            z11 = true;
                            break;
                            break;
                        }
                    } else {
                        t70.l lVar3 = (t70.l) andSet;
                        w50.g gVarG = lVar3.g(Unit.f71706a, this.f19845b);
                        if (gVarG != null) {
                            lVar3.x(gVarG);
                            z11 = true;
                            break;
                            break;
                        }
                    }
                }
            }
        } while (!z11);
    }
}
