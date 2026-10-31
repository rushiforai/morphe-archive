package v70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.t2;

/* loaded from: classes.dex */
public final class b implements n, t2 {

    /* renamed from: a, reason: collision with root package name */
    public Object f92145a = k.f92185p;

    /* renamed from: b, reason: collision with root package name */
    public t70.m f92146b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i f92147c;

    public b(i iVar) {
        this.f92147c = iVar;
    }

    public final Object a(Continuation continuation) throws Throwable {
        s sVarO;
        Boolean bool;
        Object obj = this.f92145a;
        boolean z11 = true;
        if (obj == k.f92185p || obj == k.f92183l) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = i.f92164i;
            i iVar = this.f92147c;
            s sVar = (s) atomicReferenceFieldUpdater.get(iVar);
            while (true) {
                if (iVar.z()) {
                    this.f92145a = k.f92183l;
                    Throwable thP = iVar.p();
                    if (thP != null) {
                        int i5 = y70.u.f96827a;
                        throw thP;
                    }
                    z11 = false;
                } else {
                    long andIncrement = i.f92160e.getAndIncrement(iVar);
                    long j11 = k.f92173b;
                    long j12 = andIncrement / j11;
                    int i11 = (int) (andIncrement % j11);
                    if (sVar.f96826c != j12) {
                        sVarO = iVar.o(j12, sVar);
                        if (sVarO == null) {
                            continue;
                        }
                    } else {
                        sVarO = sVar;
                    }
                    Object objK = iVar.K(sVarO, i11, andIncrement, null);
                    w50.g gVar = k.f92184m;
                    if (objK == gVar) {
                        throw new IllegalStateException("unreachable");
                    }
                    w50.g gVar2 = k.o;
                    if (objK == gVar2) {
                        if (andIncrement < iVar.w()) {
                            sVarO.b();
                        }
                        sVar = sVarO;
                    } else {
                        if (objK == k.n) {
                            i iVar2 = this.f92147c;
                            t70.m mVarO = m0.o(IntrinsicsKt.b(continuation));
                            try {
                                this.f92146b = mVarO;
                                Object objK2 = iVar2.K(sVarO, i11, andIncrement, this);
                                Function1 function1 = iVar2.f92169b;
                                if (objK2 == gVar) {
                                    c(sVarO, i11);
                                } else {
                                    int i12 = 2;
                                    g0.y yVar = null;
                                    if (objK2 == gVar2) {
                                        if (andIncrement < iVar2.w()) {
                                            sVarO.b();
                                        }
                                        s sVar2 = (s) i.f92164i.get(iVar2);
                                        while (true) {
                                            if (iVar2.z()) {
                                                t70.m mVar = this.f92146b;
                                                Intrinsics.d(mVar);
                                                this.f92146b = null;
                                                this.f92145a = k.f92183l;
                                                Throwable thP2 = iVar.p();
                                                if (thP2 == null) {
                                                    int i13 = Result.f71687b;
                                                    mVar.resumeWith(Boolean.FALSE);
                                                } else {
                                                    int i14 = Result.f71687b;
                                                    mVar.resumeWith(ResultKt.a(thP2));
                                                }
                                            } else {
                                                long andIncrement2 = i.f92160e.getAndIncrement(iVar2);
                                                long j13 = k.f92173b;
                                                long j14 = andIncrement2 / j13;
                                                int i15 = (int) (andIncrement2 % j13);
                                                if (sVar2.f96826c != j14) {
                                                    s sVarO2 = iVar2.o(j14, sVar2);
                                                    if (sVarO2 != null) {
                                                        sVar2 = sVarO2;
                                                    }
                                                }
                                                Object objK3 = iVar2.K(sVar2, i15, andIncrement2, this);
                                                if (objK3 == k.f92184m) {
                                                    c(sVar2, i15);
                                                    break;
                                                }
                                                if (objK3 == k.o) {
                                                    if (andIncrement2 < iVar2.w()) {
                                                        sVar2.b();
                                                    }
                                                } else {
                                                    if (objK3 == k.n) {
                                                        throw new IllegalStateException("unexpected");
                                                    }
                                                    sVar2.b();
                                                    this.f92145a = objK3;
                                                    this.f92146b = null;
                                                    bool = Boolean.TRUE;
                                                    if (function1 != null) {
                                                        yVar = new g0.y(i12, function1, objK3);
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        sVarO.b();
                                        this.f92145a = objK2;
                                        this.f92146b = null;
                                        bool = Boolean.TRUE;
                                        if (function1 != null) {
                                            yVar = new g0.y(i12, function1, objK2);
                                        }
                                    }
                                    mVarO.o(bool, yVar);
                                }
                                Object objS = mVarO.s();
                                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                                return objS;
                            } catch (Throwable th2) {
                                mVarO.B();
                                throw th2;
                            }
                        }
                        sVarO.b();
                        this.f92145a = objK;
                    }
                }
            }
        }
        return Boolean.valueOf(z11);
    }

    public final Object b() throws Throwable {
        Object obj = this.f92145a;
        w50.g gVar = k.f92185p;
        if (obj == gVar) {
            throw new IllegalStateException("`hasNext()` has not been invoked");
        }
        this.f92145a = gVar;
        if (obj != k.f92183l) {
            return obj;
        }
        Throwable thU = this.f92147c.u();
        int i5 = y70.u.f96827a;
        throw thU;
    }

    @Override // t70.t2
    public final void c(y70.t tVar, int i5) {
        t70.m mVar = this.f92146b;
        if (mVar != null) {
            mVar.c(tVar, i5);
        }
    }
}
