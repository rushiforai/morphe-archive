package v70;

import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.ExceptionsKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlinx.coroutines.channels.ClosedReceiveChannelException;
import kotlinx.coroutines.channels.ClosedSendChannelException;
import kotlinx.coroutines.internal.UndeliveredElementException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import t70.m0;
import t70.t2;

/* loaded from: classes.dex */
public class i implements m {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f92159d = AtomicLongFieldUpdater.newUpdater(i.class, "sendersAndCloseStatus$volatile");

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f92160e = AtomicLongFieldUpdater.newUpdater(i.class, "receivers$volatile");

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f92161f = AtomicLongFieldUpdater.newUpdater(i.class, "bufferEnd$volatile");

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicLongFieldUpdater f92162g = AtomicLongFieldUpdater.newUpdater(i.class, "completedExpandBuffersAndPauseFlag$volatile");

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f92163h = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "sendSegment$volatile");

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f92164i = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "receiveSegment$volatile");

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f92165j = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "bufferEndSegment$volatile");

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f92166k = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "_closeCause$volatile");

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f92167l = AtomicReferenceFieldUpdater.newUpdater(i.class, Object.class, "closeHandler$volatile");
    private volatile /* synthetic */ Object _closeCause$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final int f92168a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f92169b;
    private volatile /* synthetic */ long bufferEnd$volatile;
    private volatile /* synthetic */ Object bufferEndSegment$volatile;

    /* renamed from: c, reason: collision with root package name */
    public final c80.b f92170c;
    private volatile /* synthetic */ Object closeHandler$volatile;
    private volatile /* synthetic */ long completedExpandBuffersAndPauseFlag$volatile;
    private volatile /* synthetic */ Object receiveSegment$volatile;
    private volatile /* synthetic */ long receivers$volatile;
    private volatile /* synthetic */ Object sendSegment$volatile;
    private volatile /* synthetic */ long sendersAndCloseStatus$volatile;

    public i(int i5, Function1 function1) {
        this.f92168a = i5;
        this.f92169b = function1;
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Invalid channel capacity: ", ", should be >=0").toString());
        }
        s sVar = k.f92172a;
        this.bufferEnd$volatile = i5 != 0 ? i5 != Integer.MAX_VALUE ? i5 : Long.MAX_VALUE : 0L;
        this.completedExpandBuffersAndPauseFlag$volatile = f92161f.get(this);
        s sVar2 = new s(0L, null, this, 3);
        this.sendSegment$volatile = sVar2;
        this.receiveSegment$volatile = sVar2;
        if (C()) {
            sVar2 = k.f92172a;
            Intrinsics.e(sVar2, "null cannot be cast to non-null type kotlinx.coroutines.channels.ChannelSegment<E of kotlinx.coroutines.channels.BufferedChannel>");
        }
        this.bufferEndSegment$volatile = sVar2;
        this.f92170c = function1 != null ? new c80.b(this, 4) : null;
        this._closeCause$volatile = k.f92188s;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object F(i iVar, ContinuationImpl continuationImpl) {
        g gVar;
        s sVar;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f92155v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f92155v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(iVar, continuationImpl);
            }
        }
        g gVar2 = gVar;
        Object obj = gVar2.f92153t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar2.f92155v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((r) obj).f92194a;
        }
        ResultKt.b(obj);
        s sVar2 = (s) f92164i.get(iVar);
        while (!iVar.z()) {
            long andIncrement = f92160e.getAndIncrement(iVar);
            long j11 = k.f92173b;
            long j12 = andIncrement / j11;
            int i12 = (int) (andIncrement % j11);
            if (sVar2.f96826c != j12) {
                s sVarO = iVar.o(j12, sVar2);
                if (sVarO == null) {
                    continue;
                } else {
                    sVar = sVarO;
                }
            } else {
                sVar = sVar2;
            }
            i iVar2 = iVar;
            Object objK = iVar2.K(sVar, i12, andIncrement, null);
            if (objK == k.f92184m) {
                throw new IllegalStateException("unexpected");
            }
            if (objK != k.o) {
                if (objK != k.n) {
                    sVar.b();
                    return objK;
                }
                gVar2.f92155v = 1;
                Object objG = iVar2.G(sVar, i12, andIncrement, gVar2);
                return objG == coroutineSingletons ? coroutineSingletons : objG;
            }
            if (andIncrement < iVar2.w()) {
                sVar.b();
            }
            iVar = iVar2;
            sVar2 = sVar;
        }
        return new p(iVar.p());
    }

    public static final s a(i iVar, long j11, s sVar) {
        Object objA;
        i iVar2;
        s sVar2 = k.f92172a;
        j jVar = j.f92171d;
        loop0: while (true) {
            objA = y70.b.a(sVar, j11, jVar);
            if (!y70.g.c(objA)) {
                y70.t tVarB = y70.g.b(objA);
                while (true) {
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92163h;
                    y70.t tVar = (y70.t) atomicReferenceFieldUpdater.get(iVar);
                    if (tVar.f96826c >= tVarB.f96826c) {
                        break loop0;
                    }
                    if (!tVarB.j()) {
                        break;
                    }
                    while (!atomicReferenceFieldUpdater.compareAndSet(iVar, tVar, tVarB)) {
                        if (atomicReferenceFieldUpdater.get(iVar) != tVar) {
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
        boolean zC = y70.g.c(objA);
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92160e;
        if (zC) {
            iVar.A();
            if (sVar.f96826c * k.f92173b < atomicLongFieldUpdater.get(iVar)) {
                sVar.b();
                return null;
            }
        } else {
            s sVar3 = (s) y70.g.b(objA);
            long j12 = sVar3.f96826c;
            if (j12 <= j11) {
                return sVar3;
            }
            long j13 = k.f92173b * j12;
            while (true) {
                long j14 = f92159d.get(iVar);
                long j15 = 1152921504606846975L & j14;
                if (j15 >= j13) {
                    iVar2 = iVar;
                    break;
                }
                iVar2 = iVar;
                if (f92159d.compareAndSet(iVar2, j14, (((int) (j14 >> 60)) << 60) + j15)) {
                    break;
                }
                iVar = iVar2;
            }
            if (j12 * k.f92173b < atomicLongFieldUpdater.get(iVar2)) {
                sVar3.b();
            }
        }
        return null;
    }

    public static final void b(i iVar, Object obj, t70.m mVar) {
        Function1 function1 = iVar.f92169b;
        if (function1 != null) {
            ps.c.j(function1, obj, mVar.f88824e);
        }
        Throwable thV = iVar.v();
        int i5 = Result.f71687b;
        mVar.resumeWith(ResultKt.a(thV));
    }

    public static final void d(i iVar, b80.g gVar) {
        s sVar;
        i iVar2;
        b80.g gVar2;
        int i5;
        iVar.getClass();
        s sVar2 = (s) f92164i.get(iVar);
        while (!iVar.z()) {
            long andIncrement = f92160e.getAndIncrement(iVar);
            long j11 = k.f92173b;
            long j12 = andIncrement / j11;
            int i11 = (int) (andIncrement % j11);
            if (sVar2.f96826c != j12) {
                s sVarO = iVar.o(j12, sVar2);
                if (sVarO == null) {
                    continue;
                } else {
                    sVar = sVarO;
                    gVar2 = gVar;
                    i5 = i11;
                    iVar2 = iVar;
                }
            } else {
                sVar = sVar2;
                iVar2 = iVar;
                gVar2 = gVar;
                i5 = i11;
            }
            Object objK = iVar2.K(sVar, i5, andIncrement, gVar2);
            sVar2 = sVar;
            if (objK == k.f92184m) {
                t2 t2Var = gVar2 instanceof t2 ? (t2) gVar2 : null;
                if (t2Var != null) {
                    t2Var.c(sVar2, i5);
                    return;
                }
                return;
            }
            if (objK != k.o) {
                if (objK == k.n) {
                    throw new IllegalStateException("unexpected");
                }
                sVar2.b();
                ((b80.f) gVar2).f17629e = objK;
                return;
            }
            if (andIncrement < iVar2.w()) {
                sVar2.b();
            }
            iVar = iVar2;
            gVar = gVar2;
        }
        ((b80.f) gVar).f17629e = k.f92183l;
    }

    public static final int e(i iVar, s sVar, int i5, Object obj, long j11, Object obj2, boolean z11) {
        sVar.n(i5, obj);
        if (z11) {
            return iVar.L(sVar, i5, obj, j11, obj2, z11);
        }
        Object objL = sVar.l(i5);
        if (objL == null) {
            if (iVar.f(j11)) {
                if (sVar.k(i5, null, k.f92175d)) {
                    return 1;
                }
            } else {
                if (obj2 == null) {
                    return 3;
                }
                if (sVar.k(i5, null, obj2)) {
                    return 2;
                }
            }
        } else if (objL instanceof t2) {
            sVar.n(i5, null);
            if (iVar.I(objL, obj)) {
                sVar.o(i5, k.f92180i);
                return 0;
            }
            w50.g gVar = k.f92182k;
            if (sVar.f92196f.getAndSet((i5 * 2) + 1, gVar) == gVar) {
                return 5;
            }
            sVar.m(i5, true);
            return 5;
        }
        return iVar.L(sVar, i5, obj, j11, obj2, z11);
    }

    public static void x(i iVar) {
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92162g;
        if ((atomicLongFieldUpdater.addAndGet(iVar, 1L) & 4611686018427387904L) != 0) {
            while ((atomicLongFieldUpdater.get(iVar) & 4611686018427387904L) != 0) {
            }
        }
    }

    public final boolean A() {
        return y(f92159d.get(this), false);
    }

    public boolean B() {
        return false;
    }

    public final boolean C() {
        long j11 = f92161f.get(this);
        return j11 == 0 || j11 == Long.MAX_VALUE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x0011, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void D(long j11, s sVar) {
        s sVar2;
        s sVar3;
        while (sVar.f96826c < j11 && (sVar3 = (s) sVar.c()) != null) {
            sVar = sVar3;
        }
        while (true) {
            if (!sVar.d() || (sVar2 = (s) sVar.c()) == null) {
                while (true) {
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92165j;
                    y70.t tVar = (y70.t) atomicReferenceFieldUpdater.get(this);
                    if (tVar.f96826c >= sVar.f96826c) {
                        return;
                    }
                    if (!sVar.j()) {
                        break;
                    }
                    if (qm.e.p(atomicReferenceFieldUpdater, this, tVar, sVar)) {
                        if (tVar.f()) {
                            tVar.e();
                            return;
                        }
                        return;
                    } else if (sVar.f()) {
                        sVar.e();
                    }
                }
            } else {
                sVar = sVar2;
            }
        }
    }

    public final Object E(Object obj, Continuation continuation) {
        UndeliveredElementException undeliveredElementExceptionK;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        Function1 function1 = this.f92169b;
        if (function1 == null || (undeliveredElementExceptionK = ps.c.k(function1, obj, null)) == null) {
            Throwable thV = v();
            int i5 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(thV));
        } else {
            ExceptionsKt.a(undeliveredElementExceptionK, v());
            int i11 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(undeliveredElementExceptionK));
        }
        Object objS = mVar.s();
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object G(s sVar, int i5, long j11, ContinuationImpl continuationImpl) {
        h hVar;
        r rVar;
        s sVarO;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i11 = hVar.f92158v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                hVar.f92158v = i11 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object objS = hVar.f92156t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = hVar.f92158v;
        if (i12 == 0) {
            ResultKt.b(objS);
            hVar.f92158v = 1;
            t70.m mVarO = m0.o(IntrinsicsKt.b(hVar));
            try {
                y yVar = new y(mVarO);
                Object objK = K(sVar, i5, j11, yVar);
                if (objK == k.f92184m) {
                    yVar.c(sVar, i5);
                } else {
                    Object obj = k.o;
                    fx.f fVar = null;
                    Function1 function1 = this.f92169b;
                    if (objK == obj) {
                        if (j11 < w()) {
                            sVar.b();
                        }
                        s sVar2 = (s) f92164i.get(this);
                        while (true) {
                            if (z()) {
                                int i13 = Result.f71687b;
                                mVarO.resumeWith(new r(new p(p())));
                                break;
                            }
                            long andIncrement = f92160e.getAndIncrement(this);
                            long j12 = k.f92173b;
                            long j13 = andIncrement / j12;
                            int i14 = (int) (andIncrement % j12);
                            if (sVar2.f96826c != j13) {
                                sVarO = o(j13, sVar2);
                                if (sVarO == null) {
                                }
                            } else {
                                sVarO = sVar2;
                            }
                            Object objK2 = K(sVarO, i14, andIncrement, yVar);
                            if (objK2 == k.f92184m) {
                                yVar.c(sVarO, i14);
                                break;
                            }
                            if (objK2 == k.o) {
                                if (andIncrement < w()) {
                                    sVarO.b();
                                }
                                sVar2 = sVarO;
                            } else {
                                if (objK2 == k.n) {
                                    throw new IllegalStateException("unexpected");
                                }
                                sVarO.b();
                                rVar = new r(objK2);
                                if (function1 != null) {
                                    fVar = new fx.f(this, 5);
                                }
                            }
                        }
                    } else {
                        sVar.b();
                        rVar = new r(objK);
                        if (function1 != null) {
                            fVar = new fx.f(this, 5);
                        }
                    }
                    mVarO.o(rVar, fVar);
                }
                objS = mVarO.s();
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                if (objS == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } catch (Throwable th2) {
                mVarO.B();
                throw th2;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
        }
        return ((r) objS).f92194a;
    }

    public final void H(t2 t2Var, boolean z11) {
        if (t2Var instanceof t70.l) {
            Continuation continuation = (Continuation) t2Var;
            int i5 = Result.f71687b;
            continuation.resumeWith(ResultKt.a(z11 ? u() : v()));
            return;
        }
        if (t2Var instanceof y) {
            t70.m mVar = ((y) t2Var).f92202a;
            int i11 = Result.f71687b;
            mVar.resumeWith(new r(new p(p())));
            return;
        }
        if (!(t2Var instanceof b)) {
            if (t2Var instanceof b80.g) {
                ((b80.f) ((b80.g) t2Var)).h(this, k.f92183l);
                return;
            } else {
                throw new IllegalStateException(("Unexpected waiter: " + t2Var).toString());
            }
        }
        b bVar = (b) t2Var;
        t70.m mVar2 = bVar.f92146b;
        Intrinsics.d(mVar2);
        bVar.f92146b = null;
        bVar.f92145a = k.f92183l;
        Throwable thP = bVar.f92147c.p();
        if (thP == null) {
            int i12 = Result.f71687b;
            mVar2.resumeWith(Boolean.FALSE);
        } else {
            int i13 = Result.f71687b;
            mVar2.resumeWith(ResultKt.a(thP));
        }
    }

    public final boolean I(Object obj, Object obj2) {
        if (obj instanceof b80.g) {
            return ((b80.f) ((b80.g) obj)).h(this, obj2) == 0;
        }
        boolean z11 = obj instanceof y;
        Function1 function1 = this.f92169b;
        if (z11) {
            return k.a(((y) obj).f92202a, new r(obj2), function1 != null ? new fx.f(this, 5) : null);
        }
        if (!(obj instanceof b)) {
            if (obj instanceof t70.l) {
                return k.a((t70.l) obj, obj2, function1 != null ? new fx.f(this, 4) : null);
            }
            throw new IllegalStateException(("Unexpected receiver type: " + obj).toString());
        }
        b bVar = (b) obj;
        t70.m mVar = bVar.f92146b;
        Intrinsics.d(mVar);
        bVar.f92146b = null;
        bVar.f92145a = obj2;
        Boolean bool = Boolean.TRUE;
        Function1 function12 = bVar.f92147c.f92169b;
        return k.a(mVar, bool, function12 != null ? new g0.y(2, function12, obj2) : null);
    }

    public final boolean J(Object obj, s sVar, int i5) {
        b80.j jVar;
        if (obj instanceof t70.l) {
            return k.a((t70.l) obj, Unit.f71706a, null);
        }
        if (!(obj instanceof b80.g)) {
            throw new IllegalStateException(("Unexpected waiter: " + obj).toString());
        }
        int iH = ((b80.f) obj).h(this, Unit.f71706a);
        if (iH == 0) {
            jVar = b80.j.f17636a;
        } else if (iH == 1) {
            jVar = b80.j.f17637b;
        } else if (iH == 2) {
            jVar = b80.j.f17638c;
        } else {
            if (iH != 3) {
                throw new IllegalStateException(("Unexpected internal result: " + iH).toString());
            }
            jVar = b80.j.f17639d;
        }
        if (jVar == b80.j.f17637b) {
            sVar.n(i5, null);
        }
        return jVar == b80.j.f17636a;
    }

    public final Object K(s sVar, int i5, long j11, Object obj) {
        Object objL = sVar.l(i5);
        AtomicReferenceArray atomicReferenceArray = sVar.f92196f;
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92159d;
        if (objL == null) {
            if (j11 >= (atomicLongFieldUpdater.get(this) & 1152921504606846975L)) {
                if (obj == null) {
                    return k.n;
                }
                if (sVar.k(i5, objL, obj)) {
                    l();
                    return k.f92184m;
                }
            }
        } else if (objL == k.f92175d && sVar.k(i5, objL, k.f92180i)) {
            l();
            Object obj2 = atomicReferenceArray.get(i5 * 2);
            sVar.n(i5, null);
            return obj2;
        }
        while (true) {
            Object objL2 = sVar.l(i5);
            if (objL2 == null || objL2 == k.f92176e) {
                if (j11 < (atomicLongFieldUpdater.get(this) & 1152921504606846975L)) {
                    if (sVar.k(i5, objL2, k.f92179h)) {
                        l();
                        return k.o;
                    }
                } else {
                    if (obj == null) {
                        return k.n;
                    }
                    if (sVar.k(i5, objL2, obj)) {
                        l();
                        return k.f92184m;
                    }
                }
            } else {
                if (objL2 != k.f92175d) {
                    w50.g gVar = k.f92181j;
                    if (objL2 != gVar && objL2 != k.f92179h) {
                        if (objL2 == k.f92183l) {
                            l();
                            return k.o;
                        }
                        if (objL2 != k.f92178g && sVar.k(i5, objL2, k.f92177f)) {
                            boolean z11 = objL2 instanceof b0;
                            if (z11) {
                                objL2 = ((b0) objL2).f92148a;
                            }
                            if (J(objL2, sVar, i5)) {
                                sVar.o(i5, k.f92180i);
                                l();
                                Object obj3 = atomicReferenceArray.get(i5 * 2);
                                sVar.n(i5, null);
                                return obj3;
                            }
                            sVar.o(i5, gVar);
                            sVar.i();
                            if (z11) {
                                l();
                            }
                            return k.o;
                        }
                    }
                    return k.o;
                }
                if (sVar.k(i5, objL2, k.f92180i)) {
                    l();
                    Object obj4 = atomicReferenceArray.get(i5 * 2);
                    sVar.n(i5, null);
                    return obj4;
                }
            }
        }
    }

    public final int L(s sVar, int i5, Object obj, long j11, Object obj2, boolean z11) {
        while (true) {
            Object objL = sVar.l(i5);
            if (objL == null) {
                if (!f(j11) || z11) {
                    if (z11) {
                        if (sVar.k(i5, null, k.f92181j)) {
                            sVar.i();
                            return 4;
                        }
                    } else {
                        if (obj2 == null) {
                            return 3;
                        }
                        if (sVar.k(i5, null, obj2)) {
                            return 2;
                        }
                    }
                } else if (sVar.k(i5, null, k.f92175d)) {
                    break;
                }
            } else {
                if (objL != k.f92176e) {
                    w50.g gVar = k.f92182k;
                    if (objL == gVar) {
                        sVar.n(i5, null);
                        return 5;
                    }
                    if (objL == k.f92179h) {
                        sVar.n(i5, null);
                        return 5;
                    }
                    if (objL == k.f92183l) {
                        sVar.n(i5, null);
                        A();
                        return 4;
                    }
                    sVar.n(i5, null);
                    if (objL instanceof b0) {
                        objL = ((b0) objL).f92148a;
                    }
                    if (I(objL, obj)) {
                        sVar.o(i5, k.f92180i);
                        return 0;
                    }
                    if (sVar.f92196f.getAndSet((i5 * 2) + 1, gVar) != gVar) {
                        sVar.m(i5, true);
                    }
                    return 5;
                }
                if (sVar.k(i5, objL, k.f92175d)) {
                    break;
                }
            }
        }
        return 1;
    }

    public final void M(long j11) {
        AtomicLongFieldUpdater atomicLongFieldUpdater;
        i iVar = this;
        if (iVar.C()) {
            return;
        }
        while (true) {
            atomicLongFieldUpdater = f92161f;
            if (atomicLongFieldUpdater.get(iVar) > j11) {
                break;
            } else {
                iVar = this;
            }
        }
        int i5 = k.f92174c;
        int i11 = 0;
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater2 = f92162g;
            if (i11 < i5) {
                long j12 = atomicLongFieldUpdater.get(iVar);
                if (j12 == (4611686018427387903L & atomicLongFieldUpdater2.get(iVar)) && j12 == atomicLongFieldUpdater.get(iVar)) {
                    return;
                } else {
                    i11++;
                }
            } else {
                while (true) {
                    long j13 = atomicLongFieldUpdater2.get(iVar);
                    if (atomicLongFieldUpdater2.compareAndSet(iVar, j13, (j13 & 4611686018427387903L) + 4611686018427387904L)) {
                        break;
                    } else {
                        iVar = this;
                    }
                }
                while (true) {
                    long j14 = atomicLongFieldUpdater.get(iVar);
                    long j15 = atomicLongFieldUpdater2.get(iVar);
                    long j16 = j15 & 4611686018427387903L;
                    boolean z11 = (j15 & 4611686018427387904L) != 0;
                    if (j14 == j16 && j14 == atomicLongFieldUpdater.get(iVar)) {
                        break;
                    }
                    if (z11) {
                        iVar = this;
                    } else {
                        iVar = this;
                        atomicLongFieldUpdater2.compareAndSet(iVar, j15, 4611686018427387904L + j16);
                    }
                }
                while (true) {
                    long j17 = atomicLongFieldUpdater2.get(iVar);
                    if (atomicLongFieldUpdater2.compareAndSet(iVar, j17, j17 & 4611686018427387903L)) {
                        return;
                    } else {
                        iVar = this;
                    }
                }
            }
        }
    }

    @Override // v70.z
    public final void c(CancellationException cancellationException) {
        if (cancellationException == null) {
            cancellationException = new CancellationException("Channel was cancelled");
        }
        g(true, cancellationException);
    }

    public final boolean f(long j11) {
        return j11 < f92161f.get(this) || j11 < f92160e.get(this) + ((long) this.f92168a);
    }

    public final boolean g(boolean z11, Throwable th2) {
        i iVar;
        long j11;
        long j12;
        long j13;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        Object obj;
        long j14;
        long j15;
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92159d;
        if (!z11) {
            iVar = this;
            break;
        }
        do {
            j15 = atomicLongFieldUpdater.get(this);
            if (((int) (j15 >> 60)) != 0) {
                iVar = this;
                break;
            }
            s sVar = k.f92172a;
            iVar = this;
        } while (!atomicLongFieldUpdater.compareAndSet(iVar, j15, (j15 & 1152921504606846975L) + (1 << 60)));
        boolean zN = qm.e.n(f92166k, this, k.f92188s, th2);
        if (z11) {
            do {
                j14 = atomicLongFieldUpdater.get(this);
            } while (!atomicLongFieldUpdater.compareAndSet(iVar, j14, (j14 & 1152921504606846975L) + (3 << 60)));
        } else {
            do {
                j11 = atomicLongFieldUpdater.get(this);
                int i5 = (int) (j11 >> 60);
                if (i5 == 0) {
                    j12 = j11 & 1152921504606846975L;
                    j13 = 2;
                } else {
                    if (i5 != 1) {
                        break;
                    }
                    j12 = j11 & 1152921504606846975L;
                    j13 = 3;
                }
            } while (!atomicLongFieldUpdater.compareAndSet(iVar, j11, (j13 << 60) + j12));
        }
        A();
        if (zN) {
            do {
                atomicReferenceFieldUpdater = f92167l;
                obj = atomicReferenceFieldUpdater.get(this);
            } while (!qm.e.o(atomicReferenceFieldUpdater, this, obj, obj == null ? k.f92186q : k.f92187r));
            if (obj != null) {
                TypeIntrinsics.e(1, obj);
                ((Function1) obj).invoke(p());
            }
        }
        return zN;
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x008c, code lost:
    
        r1 = (v70.s) ((y70.c) y70.c.f96789b.get(r1));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final s h(long j11) {
        long j12;
        Object obj = f92165j.get(this);
        s sVar = (s) f92163h.get(this);
        if (sVar.f96826c > ((s) obj).f96826c) {
            obj = sVar;
        }
        s sVar2 = (s) f92164i.get(this);
        if (sVar2.f96826c > ((s) obj).f96826c) {
            obj = sVar2;
        }
        y70.c cVar = (y70.c) obj;
        while (true) {
            cVar.getClass();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.c.f96788a;
            Object obj2 = atomicReferenceFieldUpdater.get(cVar);
            if (obj2 == y70.b.f96787a) {
                break;
            }
            y70.c cVar2 = (y70.c) obj2;
            if (cVar2 == null) {
                if (x8.h.g(atomicReferenceFieldUpdater, cVar)) {
                    break;
                }
            } else {
                cVar = cVar2;
            }
        }
        s sVar3 = (s) cVar;
        if (B()) {
            s sVar4 = sVar3;
            loop1: do {
                int i5 = k.f92173b - 1;
                while (true) {
                    if (-1 >= i5) {
                        break;
                    }
                    j12 = (sVar4.f96826c * k.f92173b) + i5;
                    if (j12 < f92160e.get(this)) {
                        break loop1;
                    }
                    while (true) {
                        Object objL = sVar4.l(i5);
                        if (objL != null && objL != k.f92176e) {
                            if (objL == k.f92175d) {
                                break loop1;
                            }
                        } else {
                            if (sVar4.k(i5, objL, k.f92183l)) {
                                sVar4.i();
                                break;
                            }
                        }
                    }
                    i5--;
                }
            } while (sVar4 != null);
            j12 = -1;
            if (j12 != -1) {
                i(j12);
            }
        }
        Object objU = null;
        loop4: for (s sVar5 = sVar3; sVar5 != null; sVar5 = (s) ((y70.c) y70.c.f96789b.get(sVar5))) {
            for (int i11 = k.f92173b - 1; -1 < i11; i11--) {
                if ((sVar5.f96826c * k.f92173b) + i11 < j11) {
                    break loop4;
                }
                while (true) {
                    Object objL2 = sVar5.l(i11);
                    if (objL2 != null && objL2 != k.f92176e) {
                        if (!(objL2 instanceof b0)) {
                            if (!(objL2 instanceof t2)) {
                                break;
                            }
                            if (sVar5.k(i11, objL2, k.f92183l)) {
                                objU = ph.a.u(objU, objL2);
                                sVar5.m(i11, true);
                                break;
                            }
                        } else {
                            if (sVar5.k(i11, objL2, k.f92183l)) {
                                objU = ph.a.u(objU, ((b0) objL2).f92148a);
                                sVar5.m(i11, true);
                                break;
                            }
                        }
                    } else {
                        if (sVar5.k(i11, objL2, k.f92183l)) {
                            sVar5.i();
                            break;
                        }
                    }
                }
            }
        }
        if (objU != null) {
            if (!(objU instanceof ArrayList)) {
                H((t2) objU, true);
                return sVar3;
            }
            ArrayList arrayList = (ArrayList) objU;
            for (int size = arrayList.size() - 1; -1 < size; size--) {
                H((t2) arrayList.get(size), true);
            }
        }
        return sVar3;
    }

    public final void i(long j11) {
        UndeliveredElementException undeliveredElementExceptionK;
        s sVar = (s) f92164i.get(this);
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = f92160e;
            long j12 = atomicLongFieldUpdater.get(this);
            if (j11 < Math.max(this.f92168a + j12, f92161f.get(this))) {
                return;
            }
            if (atomicLongFieldUpdater.compareAndSet(this, j12, 1 + j12)) {
                long j13 = k.f92173b;
                long j14 = j12 / j13;
                int i5 = (int) (j12 % j13);
                if (sVar.f96826c != j14) {
                    s sVarO = o(j14, sVar);
                    if (sVarO == null) {
                        continue;
                    } else {
                        sVar = sVarO;
                    }
                }
                s sVar2 = sVar;
                Object objK = K(sVar2, i5, j12, null);
                if (objK != k.o) {
                    sVar2.b();
                    Function1 function1 = this.f92169b;
                    if (function1 != null && (undeliveredElementExceptionK = ps.c.k(function1, objK, null)) != null) {
                        throw undeliveredElementExceptionK;
                    }
                } else if (j12 < w()) {
                    sVar2.b();
                }
                sVar = sVar2;
            }
        }
    }

    @Override // v70.z
    public final n iterator() {
        return new b(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00bf A[SYNTHETIC] */
    @Override // v70.a0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object j(Object obj) {
        int iE;
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92159d;
        boolean z11 = false;
        long j11 = 1152921504606846975L;
        boolean z12 = y(atomicLongFieldUpdater.get(this), false) ? false : !f(r1 & 1152921504606846975L);
        q qVar = r.f92193b;
        if (z12) {
            return qVar;
        }
        Object obj2 = k.f92181j;
        s sVar = (s) f92163h.get(this);
        while (true) {
            long andIncrement = atomicLongFieldUpdater.getAndIncrement(this);
            long j12 = andIncrement & j11;
            boolean zY = y(andIncrement, z11);
            int i5 = k.f92173b;
            long j13 = i5;
            long j14 = j12 / j13;
            int i11 = (int) (j12 % j13);
            if (sVar.f96826c == j14) {
                iE = e(this, sVar, i11, obj, j12, obj2, zY);
                if (iE != 0) {
                    sVar.b();
                    return Unit.f71706a;
                }
                if (iE == 1) {
                    return Unit.f71706a;
                }
                if (iE == 2) {
                    if (zY) {
                        sVar.i();
                        return new p(v());
                    }
                    t2 t2Var = obj2 instanceof t2 ? (t2) obj2 : null;
                    if (t2Var != null) {
                        t2Var.c(sVar, i11 + i5);
                    }
                    sVar.i();
                    return qVar;
                }
                if (iE == 3) {
                    throw new IllegalStateException("unexpected");
                }
                if (iE == 4) {
                    if (j12 < f92160e.get(this)) {
                        sVar.b();
                    }
                    return new p(v());
                }
                if (iE == 5) {
                    sVar.b();
                }
                z11 = false;
            } else {
                s sVarA = a(this, j14, sVar);
                if (sVarA != null) {
                    sVar = sVarA;
                    iE = e(this, sVar, i11, obj, j12, obj2, zY);
                    if (iE != 0) {
                    }
                } else {
                    if (zY) {
                        return new p(v());
                    }
                    z11 = false;
                }
            }
            j11 = 1152921504606846975L;
        }
    }

    @Override // v70.z
    public final x7.h k() {
        e eVar = e.f92151d;
        TypeIntrinsics.e(3, eVar);
        f fVar = f.f92152d;
        TypeIntrinsics.e(3, fVar);
        return new x7.h(this, eVar, fVar, this.f92170c, 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x0188, code lost:
    
        x(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x018b, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l() {
        Object objA;
        if (C()) {
            return;
        }
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92165j;
        s sVar = (s) atomicReferenceFieldUpdater.get(this);
        loop0: while (true) {
            long andIncrement = f92161f.getAndIncrement(this);
            long j11 = andIncrement / k.f92173b;
            if (w() <= andIncrement) {
                if (sVar.f96826c < j11 && sVar.c() != null) {
                    D(j11, sVar);
                }
                x(this);
                return;
            }
            if (sVar.f96826c != j11) {
                j jVar = j.f92171d;
                while (true) {
                    objA = y70.b.a(sVar, j11, jVar);
                    if (!y70.g.c(objA)) {
                        y70.t tVarB = y70.g.b(objA);
                        while (true) {
                            y70.t tVar = (y70.t) atomicReferenceFieldUpdater.get(this);
                            if (tVar.f96826c >= tVarB.f96826c) {
                                break;
                            }
                            if (!tVarB.j()) {
                                break;
                            }
                            if (qm.e.q(atomicReferenceFieldUpdater, this, tVar, tVarB)) {
                                if (tVar.f()) {
                                    tVar.e();
                                }
                            } else if (tVarB.f()) {
                                tVarB.e();
                            }
                        }
                    } else {
                        break;
                    }
                }
                s sVar2 = null;
                if (y70.g.c(objA)) {
                    A();
                    D(j11, sVar);
                    x(this);
                } else {
                    s sVar3 = (s) y70.g.b(objA);
                    long j12 = sVar3.f96826c;
                    if (j12 > j11) {
                        long j13 = j12 * k.f92173b;
                        if (f92161f.compareAndSet(this, 1 + andIncrement, j13)) {
                            AtomicLongFieldUpdater atomicLongFieldUpdater = f92162g;
                            if ((atomicLongFieldUpdater.addAndGet(this, j13 - andIncrement) & 4611686018427387904L) != 0) {
                                while ((atomicLongFieldUpdater.get(this) & 4611686018427387904L) != 0) {
                                }
                            }
                        } else {
                            x(this);
                        }
                    } else {
                        sVar2 = sVar3;
                    }
                }
                if (sVar2 == null) {
                    continue;
                } else {
                    sVar = sVar2;
                }
            }
            int i5 = (int) (andIncrement % k.f92173b);
            Object objL = sVar.l(i5);
            boolean z11 = objL instanceof t2;
            AtomicLongFieldUpdater atomicLongFieldUpdater2 = f92160e;
            if (!z11 || andIncrement < atomicLongFieldUpdater2.get(this) || !sVar.k(i5, objL, k.f92178g)) {
                while (true) {
                    Object objL2 = sVar.l(i5);
                    if (!(objL2 instanceof t2)) {
                        if (objL2 != k.f92181j) {
                            if (objL2 != null) {
                                if (objL2 == k.f92175d || objL2 == k.f92179h || objL2 == k.f92180i || objL2 == k.f92182k || objL2 == k.f92183l) {
                                    break loop0;
                                }
                                if (objL2 != k.f92177f) {
                                    throw new IllegalStateException(("Unexpected cell state: " + objL2).toString());
                                }
                            } else if (sVar.k(i5, objL2, k.f92176e)) {
                                break loop0;
                            }
                        } else {
                            break;
                        }
                    } else if (andIncrement < atomicLongFieldUpdater2.get(this)) {
                        if (sVar.k(i5, objL2, new b0((t2) objL2))) {
                            break loop0;
                        }
                    } else if (sVar.k(i5, objL2, k.f92178g)) {
                        if (J(objL2, sVar, i5)) {
                            sVar.o(i5, k.f92175d);
                            break;
                        } else {
                            sVar.o(i5, k.f92181j);
                            sVar.i();
                        }
                    }
                }
            } else if (J(objL, sVar, i5)) {
                sVar.o(i5, k.f92175d);
                break;
            } else {
                sVar.o(i5, k.f92181j);
                sVar.i();
                x(this);
            }
        }
    }

    @Override // v70.z
    public final Object m(SuspendLambda suspendLambda) {
        return F(this, suspendLambda);
    }

    @Override // v70.z
    public final Object n() {
        s sVar;
        AtomicLongFieldUpdater atomicLongFieldUpdater = f92160e;
        long j11 = atomicLongFieldUpdater.get(this);
        long j12 = f92159d.get(this);
        if (y(j12, true)) {
            return new p(p());
        }
        long j13 = j12 & 1152921504606846975L;
        q qVar = r.f92193b;
        if (j11 >= j13) {
            return qVar;
        }
        Object obj = k.f92182k;
        s sVar2 = (s) f92164i.get(this);
        while (!z()) {
            long andIncrement = atomicLongFieldUpdater.getAndIncrement(this);
            long j14 = k.f92173b;
            long j15 = andIncrement / j14;
            int i5 = (int) (andIncrement % j14);
            if (sVar2.f96826c != j15) {
                s sVarO = o(j15, sVar2);
                if (sVarO == null) {
                    continue;
                } else {
                    sVar = sVarO;
                }
            } else {
                sVar = sVar2;
            }
            Object objK = K(sVar, i5, andIncrement, obj);
            s sVar3 = sVar;
            if (objK == k.f92184m) {
                t2 t2Var = obj instanceof t2 ? (t2) obj : null;
                if (t2Var != null) {
                    t2Var.c(sVar3, i5);
                }
                M(andIncrement);
                sVar3.i();
                return qVar;
            }
            if (objK != k.o) {
                if (objK == k.n) {
                    throw new IllegalStateException("unexpected");
                }
                sVar3.b();
                return objK;
            }
            if (andIncrement < w()) {
                sVar3.b();
            }
            sVar2 = sVar3;
        }
        return new p(p());
    }

    public final s o(long j11, s sVar) {
        Object objA;
        long j12;
        s sVar2 = k.f92172a;
        j jVar = j.f92171d;
        loop0: while (true) {
            objA = y70.b.a(sVar, j11, jVar);
            if (!y70.g.c(objA)) {
                y70.t tVarB = y70.g.b(objA);
                while (true) {
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92164i;
                    y70.t tVar = (y70.t) atomicReferenceFieldUpdater.get(this);
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
        if (y70.g.c(objA)) {
            A();
            if (sVar.f96826c * k.f92173b < w()) {
                sVar.b();
                return null;
            }
        } else {
            s sVar3 = (s) y70.g.b(objA);
            long j13 = sVar3.f96826c;
            if (!C() && j11 <= f92161f.get(this) / k.f92173b) {
                while (true) {
                    AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f92165j;
                    y70.t tVar2 = (y70.t) atomicReferenceFieldUpdater2.get(this);
                    if (tVar2.f96826c >= j13 || !sVar3.j()) {
                        break;
                    }
                    while (!atomicReferenceFieldUpdater2.compareAndSet(this, tVar2, sVar3)) {
                        if (atomicReferenceFieldUpdater2.get(this) != tVar2) {
                            if (sVar3.f()) {
                                sVar3.e();
                            }
                        }
                    }
                    if (tVar2.f()) {
                        tVar2.e();
                    }
                }
            }
            if (j13 <= j11) {
                return sVar3;
            }
            long j14 = j13 * k.f92173b;
            do {
                j12 = f92160e.get(this);
                if (j12 >= j14) {
                    break;
                }
            } while (!f92160e.compareAndSet(this, j12, j14));
            if (j13 * k.f92173b < w()) {
                sVar3.b();
            }
        }
        return null;
    }

    public final Throwable p() {
        return (Throwable) f92166k.get(this);
    }

    @Override // v70.z
    public final Object q(Continuation continuation) throws Throwable {
        s sVar;
        Throwable th2;
        long andIncrement;
        long j11;
        int i5;
        s sVar2;
        i iVar;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92164i;
        s sVar3 = (s) atomicReferenceFieldUpdater.get(this);
        while (!z()) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = f92160e;
            long andIncrement2 = atomicLongFieldUpdater.getAndIncrement(this);
            long j12 = k.f92173b;
            long j13 = andIncrement2 / j12;
            int i11 = (int) (andIncrement2 % j12);
            if (sVar3.f96826c != j13) {
                s sVarO = o(j13, sVar3);
                if (sVarO == null) {
                    continue;
                } else {
                    sVar = sVarO;
                }
            } else {
                sVar = sVar3;
            }
            Object objK = K(sVar, i11, andIncrement2, null);
            w50.g gVar = k.f92184m;
            if (objK == gVar) {
                throw new IllegalStateException("unexpected");
            }
            w50.g gVar2 = k.o;
            if (objK == gVar2) {
                if (andIncrement2 < w()) {
                    sVar.b();
                }
                sVar3 = sVar;
            } else {
                if (objK != k.n) {
                    sVar.b();
                    return objK;
                }
                t70.m mVarO = m0.o(IntrinsicsKt.b(continuation));
                i iVar2 = this;
                try {
                    Object objK2 = iVar2.K(sVar, i11, andIncrement2, mVarO);
                    if (objK2 == gVar) {
                        mVarO.c(sVar, i11);
                    } else {
                        fx.f fVar = null;
                        Function1 function1 = iVar2.f92169b;
                        if (objK2 == gVar2) {
                            if (andIncrement2 < w()) {
                                sVar.b();
                            }
                            s sVar4 = (s) atomicReferenceFieldUpdater.get(this);
                            while (true) {
                                if (z()) {
                                    int i12 = Result.f71687b;
                                    mVarO.resumeWith(ResultKt.a(u()));
                                    break;
                                }
                                t70.m mVar = mVarO;
                                try {
                                    andIncrement = atomicLongFieldUpdater.getAndIncrement(this);
                                    long j14 = k.f92173b;
                                    j11 = andIncrement / j14;
                                    i5 = (int) (andIncrement % j14);
                                } catch (Throwable th3) {
                                    th = th3;
                                }
                                try {
                                    if (sVar4.f96826c != j11) {
                                        try {
                                            s sVarO2 = o(j11, sVar4);
                                            if (sVarO2 == null) {
                                                mVarO = mVar;
                                            } else {
                                                sVar2 = sVarO2;
                                            }
                                        } catch (Throwable th4) {
                                            th2 = th4;
                                            mVarO = mVar;
                                            mVarO.B();
                                            throw th2;
                                        }
                                    } else {
                                        sVar2 = sVar4;
                                    }
                                    objK2 = iVar.K(sVar2, i5, andIncrement, mVar);
                                    iVar2 = iVar;
                                    s sVar5 = sVar2;
                                    mVarO = mVar;
                                    if (objK2 == k.f92184m) {
                                        mVarO.c(sVar5, i5);
                                        break;
                                    }
                                    if (objK2 == k.o) {
                                        if (andIncrement < w()) {
                                            sVar5.b();
                                        }
                                        sVar4 = sVar5;
                                    } else {
                                        if (objK2 == k.n) {
                                            throw new IllegalStateException("unexpected");
                                        }
                                        sVar5.b();
                                        if (function1 != null) {
                                            fVar = new fx.f(this, 4);
                                        }
                                    }
                                } catch (Throwable th5) {
                                    th = th5;
                                    mVarO = mVar;
                                    th2 = th;
                                    mVarO.B();
                                    throw th2;
                                }
                                iVar = iVar2;
                            }
                        } else {
                            sVar.b();
                            if (function1 != null) {
                                fVar = new fx.f(this, 4);
                            }
                        }
                        mVarO.o(objK2, fVar);
                    }
                    Object objS = mVarO.s();
                    CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                    return objS;
                } catch (Throwable th6) {
                    th = th6;
                }
            }
        }
        Throwable thU = u();
        int i13 = y70.u.f96827a;
        throw thU;
    }

    @Override // v70.a0
    public final boolean r(Throwable th2) {
        return g(false, th2);
    }

    public final x7.h s() {
        c cVar = c.f92149d;
        TypeIntrinsics.e(3, cVar);
        d dVar = d.f92150d;
        TypeIntrinsics.e(3, dVar);
        return new x7.h(this, cVar, dVar, this.f92170c, 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:106:0x018f, code lost:
    
        return kotlin.Unit.f71706a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c0, code lost:
    
        b(r1, r4, r7);
     */
    /* JADX WARN: Removed duplicated region for block: B:94:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0173 A[RETURN] */
    @Override // v70.a0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object t(Object obj, Continuation continuation) throws Throwable {
        int iE;
        Object objS;
        CoroutineSingletons coroutineSingletons;
        Object obj2;
        i iVar;
        s sVar;
        int i5;
        int i11;
        boolean z11;
        i iVar2 = this;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92163h;
        s sVar2 = (s) atomicReferenceFieldUpdater.get(iVar2);
        while (true) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = f92159d;
            long andIncrement = atomicLongFieldUpdater.getAndIncrement(iVar2);
            long j11 = andIncrement & 1152921504606846975L;
            boolean zY = iVar2.y(andIncrement, false);
            int i12 = k.f92173b;
            long j12 = i12;
            long j13 = j11 / j12;
            int i13 = (int) (j11 % j12);
            if (sVar2.f96826c != j13) {
                s sVarA = a(iVar2, j13, sVar2);
                if (sVarA != null) {
                    sVar2 = sVarA;
                } else if (zY) {
                    Object objE = E(obj, continuation);
                    if (objE == CoroutineSingletons.f71806a) {
                        return objE;
                    }
                }
            }
            int iE2 = e(iVar2, sVar2, i13, obj, j11, null, zY);
            if (iE2 == 0) {
                sVar2.b();
                break;
            }
            if (iE2 == 1) {
                break;
            }
            if (iE2 != 2) {
                AtomicLongFieldUpdater atomicLongFieldUpdater2 = f92160e;
                if (iE2 == 3) {
                    t70.m mVarO = m0.o(IntrinsicsKt.b(continuation));
                    Object obj3 = obj;
                    try {
                        iE = e(iVar2, sVar2, i13, obj3, j11, mVarO, false);
                    } catch (Throwable th2) {
                        th = th2;
                    }
                    try {
                        if (iE == 0) {
                            sVar2.b();
                            int i14 = Result.f71687b;
                        } else if (iE != 1) {
                            if (iE != 2) {
                                if (iE != 4) {
                                    String str = "unexpected";
                                    if (iE != 5) {
                                        throw new IllegalStateException("unexpected");
                                    }
                                    sVar2.b();
                                    s sVar3 = (s) atomicReferenceFieldUpdater.get(iVar2);
                                    while (true) {
                                        long andIncrement2 = atomicLongFieldUpdater.getAndIncrement(iVar2);
                                        long j14 = andIncrement2 & 1152921504606846975L;
                                        boolean zY2 = iVar2.y(andIncrement2, false);
                                        int i15 = k.f92173b;
                                        AtomicLongFieldUpdater atomicLongFieldUpdater3 = atomicLongFieldUpdater;
                                        long j15 = i15;
                                        String str2 = str;
                                        long j16 = j14 / j15;
                                        int i16 = (int) (j14 % j15);
                                        if (sVar3.f96826c != j16) {
                                            s sVarA2 = a(iVar2, j16, sVar3);
                                            if (sVarA2 != null) {
                                                i5 = i15;
                                                i11 = i16;
                                                z11 = zY2;
                                                sVar = sVarA2;
                                            } else {
                                                if (zY2) {
                                                    break;
                                                }
                                                atomicLongFieldUpdater = atomicLongFieldUpdater3;
                                                str = str2;
                                            }
                                        } else {
                                            sVar = sVar3;
                                            i5 = i15;
                                            i11 = i16;
                                            z11 = zY2;
                                        }
                                        int iE3 = e(iVar2, sVar, i11, obj3, j14, mVarO, z11);
                                        Object obj4 = obj3;
                                        iVar = iVar2;
                                        s sVar4 = sVar;
                                        int i17 = i11;
                                        obj2 = obj4;
                                        if (iE3 == 0) {
                                            sVar4.b();
                                            int i18 = Result.f71687b;
                                            break;
                                        }
                                        if (iE3 == 1) {
                                            int i19 = Result.f71687b;
                                            break;
                                        }
                                        if (iE3 != 2) {
                                            if (iE3 == 3) {
                                                throw new IllegalStateException(str2);
                                            }
                                            if (iE3 != 4) {
                                                if (iE3 == 5) {
                                                    sVar4.b();
                                                }
                                                sVar3 = sVar4;
                                                iVar2 = iVar;
                                                atomicLongFieldUpdater = atomicLongFieldUpdater3;
                                                str = str2;
                                                obj3 = obj2;
                                            } else if (j14 < atomicLongFieldUpdater2.get(iVar)) {
                                                sVar4.b();
                                            }
                                        } else if (z11) {
                                            sVar4.i();
                                        } else {
                                            mVarO.c(sVar4, i17 + i5);
                                        }
                                    }
                                } else {
                                    obj2 = obj3;
                                    iVar = iVar2;
                                    if (j11 < atomicLongFieldUpdater2.get(iVar)) {
                                        sVar2.b();
                                    }
                                }
                                b(iVar, obj2, mVarO);
                            } else {
                                mVarO.c(sVar2, i13 + i12);
                            }
                            objS = mVarO.s();
                            coroutineSingletons = CoroutineSingletons.f71806a;
                            if (objS != coroutineSingletons) {
                                objS = Unit.f71706a;
                            }
                            if (objS == coroutineSingletons) {
                                return objS;
                            }
                        } else {
                            int i21 = Result.f71687b;
                        }
                        mVarO.resumeWith(Unit.f71706a);
                        objS = mVarO.s();
                        coroutineSingletons = CoroutineSingletons.f71806a;
                        if (objS != coroutineSingletons) {
                        }
                        if (objS == coroutineSingletons) {
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        mVarO.B();
                        throw th;
                    }
                } else if (iE2 == 4) {
                    if (j11 < atomicLongFieldUpdater2.get(iVar2)) {
                        sVar2.b();
                    }
                    Object objE2 = E(obj, continuation);
                    if (objE2 == CoroutineSingletons.f71806a) {
                        return objE2;
                    }
                } else if (iE2 == 5) {
                    sVar2.b();
                }
            } else if (zY) {
                sVar2.i();
                Object objE3 = E(obj, continuation);
                if (objE3 == CoroutineSingletons.f71806a) {
                    return objE3;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:85:0x01b9, code lost:
    
        r16 = r7;
        r3 = (v70.s) r3.c();
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01c2, code lost:
    
        if (r3 != null) goto L92;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        boolean z11;
        String string;
        StringBuilder sb2 = new StringBuilder();
        int i5 = (int) (f92159d.get(this) >> 60);
        if (i5 == 2) {
            sb2.append("closed,");
        } else if (i5 == 3) {
            sb2.append("cancelled,");
        }
        sb2.append("capacity=" + this.f92168a + AbstractJsonLexerKt.COMMA);
        sb2.append("data=[");
        int i11 = 0;
        boolean z12 = true;
        List listQ = ul.b.Q(f92164i.get(this), f92163h.get(this), f92165j.get(this));
        ArrayList arrayList = new ArrayList();
        for (Object obj : listQ) {
            if (((s) obj) != k.f92172a) {
                arrayList.add(obj);
            }
        }
        Iterator it = arrayList.iterator();
        if (!it.hasNext()) {
            throw new NoSuchElementException();
        }
        Object next = it.next();
        if (it.hasNext()) {
            long j11 = ((s) next).f96826c;
            do {
                Object next2 = it.next();
                long j12 = ((s) next2).f96826c;
                if (j11 > j12) {
                    next = next2;
                    j11 = j12;
                }
            } while (it.hasNext());
        }
        s sVar = (s) next;
        long j13 = f92160e.get(this);
        long jW = w();
        loop2: while (true) {
            int i12 = k.f92173b;
            int i13 = i11;
            while (true) {
                if (i13 >= i12) {
                    break;
                }
                long j14 = (sVar.f96826c * k.f92173b) + i13;
                if (j14 >= jW && j14 >= j13) {
                    break loop2;
                }
                Object objL = sVar.l(i13);
                boolean z13 = z12;
                Object obj2 = sVar.f92196f.get(i13 * 2);
                if (objL instanceof t70.l) {
                    string = (j14 >= j13 || j14 < jW) ? (j14 >= jW || j14 < j13) ? "cont" : "send" : "receive";
                } else if (objL instanceof b80.g) {
                    string = (j14 >= j13 || j14 < jW) ? (j14 >= jW || j14 < j13) ? "select" : "onSend" : "onReceive";
                } else if (objL instanceof y) {
                    string = "receiveCatching";
                } else if (objL instanceof b0) {
                    string = "EB(" + objL + ')';
                } else if (Intrinsics.b(objL, k.f92177f) || Intrinsics.b(objL, k.f92178g)) {
                    string = "resuming_sender";
                } else if (objL == null || objL.equals(k.f92176e) || objL.equals(k.f92180i) || objL.equals(k.f92179h) || objL.equals(k.f92182k) || objL.equals(k.f92181j) || objL.equals(k.f92183l)) {
                    i13++;
                    z12 = z13;
                } else {
                    string = objL.toString();
                }
                if (obj2 != null) {
                    sb2.append("(" + string + AbstractJsonLexerKt.COMMA + obj2 + "),");
                } else {
                    sb2.append(string + AbstractJsonLexerKt.COMMA);
                }
                i13++;
                z12 = z13;
            }
            z12 = z11;
            i11 = 0;
        }
        if (r70.l.F1(sb2) == ',') {
            Intrinsics.f(sb2.deleteCharAt(sb2.length() - 1), "deleteCharAt(...)");
        }
        sb2.append("]");
        return sb2.toString();
    }

    public final Throwable u() {
        Throwable thP = p();
        return thP == null ? new ClosedReceiveChannelException() : thP;
    }

    public final Throwable v() {
        Throwable thP = p();
        return thP == null ? new ClosedSendChannelException("Channel was closed") : thP;
    }

    public final long w() {
        return f92159d.get(this) & 1152921504606846975L;
    }

    /* JADX WARN: Code restructure failed: missing block: B:121:0x01a4, code lost:
    
        v70.i.f92160e.compareAndSet(r1, r3, 1 + r3);
        r1 = r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0063, code lost:
    
        r16 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0067, code lost:
    
        r16 = r7;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r16v2 */
    /* JADX WARN: Type inference failed for: r16v3 */
    /* JADX WARN: Type inference failed for: r16v4 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean y(long j11, boolean z11) {
        ?? r16;
        int i5;
        i iVar = this;
        int i11 = (int) (j11 >> 60);
        if (i11 != 0) {
            int i12 = 1;
            if (i11 != 1) {
                AtomicLongFieldUpdater atomicLongFieldUpdater = f92160e;
                if (i11 == 2) {
                    r16 = 1;
                    iVar.h(j11 & 1152921504606846975L);
                    if (z11) {
                        while (true) {
                            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f92164i;
                            s sVarO = (s) atomicReferenceFieldUpdater.get(iVar);
                            long j12 = atomicLongFieldUpdater.get(iVar);
                            if (iVar.w() <= j12) {
                                break;
                            }
                            long j13 = k.f92173b;
                            long j14 = j12 / j13;
                            if (sVarO.f96826c != j14 && (sVarO = iVar.o(j14, sVarO)) == null) {
                                if (((s) atomicReferenceFieldUpdater.get(iVar)).f96826c < j14) {
                                    break;
                                }
                            } else {
                                sVarO.b();
                                int i13 = (int) (j12 % j13);
                                while (true) {
                                    Object objL = sVarO.l(i13);
                                    if (objL != null && objL != k.f92176e) {
                                        if (objL == k.f92175d || (objL != k.f92181j && objL != k.f92183l && objL != k.f92180i && objL != k.f92179h && (objL == k.f92178g || (objL != k.f92177f && j12 == atomicLongFieldUpdater.get(iVar))))) {
                                            break;
                                        }
                                    } else {
                                        if (sVarO.k(i13, objL, k.f92179h)) {
                                            iVar.l();
                                            break;
                                        }
                                        iVar = this;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if (i11 != 3) {
                        throw new IllegalStateException(c0.h(i11, "unexpected close status: ").toString());
                    }
                    s sVarH = iVar.h(j11 & 1152921504606846975L);
                    UndeliveredElementException undeliveredElementExceptionK = null;
                    Object objU = null;
                    loop0: while (true) {
                        AtomicReferenceArray atomicReferenceArray = sVarH.f92196f;
                        int i14 = k.f92173b - i12;
                        while (-1 < i14) {
                            long j15 = (sVarH.f96826c * k.f92173b) + i14;
                            while (true) {
                                Object objL2 = sVarH.l(i14);
                                if (objL2 == k.f92180i) {
                                    break loop0;
                                }
                                w50.g gVar = k.f92175d;
                                Function1 function1 = iVar.f92169b;
                                if (objL2 == gVar) {
                                    if (j15 < atomicLongFieldUpdater.get(iVar)) {
                                        break loop0;
                                    }
                                    if (sVarH.k(i14, objL2, k.f92183l)) {
                                        if (function1 != null) {
                                            undeliveredElementExceptionK = ps.c.k(function1, atomicReferenceArray.get(i14 * 2), undeliveredElementExceptionK);
                                        }
                                        sVarH.n(i14, null);
                                        sVarH.i();
                                    }
                                } else if (objL2 == k.f92176e || objL2 == null) {
                                    i5 = i12;
                                    if (sVarH.k(i14, objL2, k.f92183l)) {
                                        sVarH.i();
                                        break;
                                    }
                                    i12 = i5;
                                } else if (!(objL2 instanceof t2) && !(objL2 instanceof b0)) {
                                    w50.g gVar2 = k.f92178g;
                                    if (objL2 == gVar2 || objL2 == k.f92177f) {
                                        break loop0;
                                    }
                                    if (objL2 != gVar2) {
                                        break;
                                    }
                                } else {
                                    if (j15 < atomicLongFieldUpdater.get(iVar)) {
                                        break loop0;
                                    }
                                    t2 t2Var = objL2 instanceof b0 ? ((b0) objL2).f92148a : (t2) objL2;
                                    i5 = i12;
                                    if (sVarH.k(i14, objL2, k.f92183l)) {
                                        if (function1 != null) {
                                            undeliveredElementExceptionK = ps.c.k(function1, atomicReferenceArray.get(i14 * 2), undeliveredElementExceptionK);
                                        }
                                        objU = ph.a.u(objU, t2Var);
                                        sVarH.n(i14, null);
                                        sVarH.i();
                                    }
                                    i12 = i5;
                                }
                            }
                            i14--;
                            i12 = i5;
                        }
                        r16 = i12;
                        sVarH = (s) ((y70.c) y70.c.f96789b.get(sVarH));
                        if (sVarH == null) {
                            break;
                        }
                        i12 = r16 == true ? 1 : 0;
                    }
                    if (objU != null) {
                        if (objU instanceof ArrayList) {
                            ArrayList arrayList = (ArrayList) objU;
                            for (int size = arrayList.size() - 1; -1 < size; size--) {
                                iVar.H((t2) arrayList.get(size), false);
                            }
                        } else {
                            iVar.H((t2) objU, false);
                        }
                    }
                    if (undeliveredElementExceptionK != null) {
                        throw undeliveredElementExceptionK;
                    }
                }
                return r16;
            }
        }
        return false;
    }

    public final boolean z() {
        return y(f92159d.get(this), true);
    }
}
