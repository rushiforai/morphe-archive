package b80;

import b.c9;
import b.u4;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.DispatchException;
import t70.k;
import t70.l;
import t70.m;
import t70.t2;
import y70.t;

/* loaded from: classes.dex */
public final class f implements k, g, t2 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f17624f = AtomicReferenceFieldUpdater.newUpdater(f.class, Object.class, "state$volatile");

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f17625a;

    /* renamed from: c, reason: collision with root package name */
    public Object f17627c;
    private volatile /* synthetic */ Object state$volatile = i.f17631a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f17626b = new ArrayList(2);

    /* renamed from: d, reason: collision with root package name */
    public int f17628d = -1;

    /* renamed from: e, reason: collision with root package name */
    public Object f17629e = i.f17634d;

    public f(CoroutineContext coroutineContext) {
        this.f17625a = coroutineContext;
    }

    @Override // t70.k
    public final void a(Throwable th2) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        Object obj;
        do {
            atomicReferenceFieldUpdater = f17624f;
            obj = atomicReferenceFieldUpdater.get(this);
            if (obj == i.f17632b) {
                return;
            }
        } while (!c9.w(atomicReferenceFieldUpdater, this, obj));
        ArrayList arrayList = this.f17626b;
        if (arrayList == null) {
            return;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((d) it.next()).a();
        }
        this.f17629e = i.f17634d;
        this.f17626b = null;
    }

    public final Object b(ContinuationImpl continuationImpl) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f17624f;
        Object obj = atomicReferenceFieldUpdater.get(this);
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.selects.SelectImplementation.ClauseData<R of kotlinx.coroutines.selects.SelectImplementation>");
        d dVar = (d) obj;
        Object obj2 = this.f17629e;
        ArrayList arrayList = this.f17626b;
        if (arrayList != null) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                d dVar2 = (d) it.next();
                if (dVar2 != dVar) {
                    dVar2.a();
                }
            }
            atomicReferenceFieldUpdater.set(this, i.f17632b);
            this.f17629e = i.f17634d;
            this.f17626b = null;
        }
        Object objInvoke = dVar.f17613c.invoke(dVar.f17611a, dVar.f17614d, obj2);
        Continuation continuation = dVar.f17615e;
        return dVar.f17614d == i.f17635e ? ((Function1) continuation).invoke(continuationImpl) : ((Function2) continuation).invoke(objInvoke, continuationImpl);
    }

    @Override // t70.t2
    public final void c(t tVar, int i5) {
        this.f17627c = tVar;
        this.f17628d = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(ContinuationImpl continuationImpl) throws DispatchException {
        e eVar;
        f fVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f17623w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f17623w = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f17621u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f17623w;
        if (i11 == 0) {
            ResultKt.b(obj);
            eVar.f17620t = this;
            eVar.f17623w = 1;
            m mVar = new m(1, IntrinsicsKt.b(eVar));
            mVar.t();
            loop0: while (true) {
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f17624f;
                Object obj2 = atomicReferenceFieldUpdater.get(this);
                w50.g gVar = i.f17631a;
                if (obj2 == gVar) {
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, obj2, mVar)) {
                        if (atomicReferenceFieldUpdater.get(this) != obj2) {
                            break;
                        }
                    }
                    mVar.w(this);
                    break loop0;
                }
                if (obj2 instanceof List) {
                    while (true) {
                        if (atomicReferenceFieldUpdater.compareAndSet(this, obj2, gVar)) {
                            Iterator it = ((Iterable) obj2).iterator();
                            while (it.hasNext()) {
                                d dVarE = e(it.next());
                                Intrinsics.d(dVarE);
                                dVarE.f17617g = null;
                                dVarE.f17618h = -1;
                                g(dVarE, true);
                            }
                        } else if (atomicReferenceFieldUpdater.get(this) != obj2) {
                            break;
                        }
                    }
                } else {
                    if (!(obj2 instanceof d)) {
                        throw new IllegalStateException(("unexpected state: " + obj2).toString());
                    }
                    Unit unit = Unit.f71706a;
                    d dVar = (d) obj2;
                    Object obj3 = this.f17629e;
                    Function3 function3 = dVar.f17616f;
                    mVar.o(unit, function3 != null ? (Function3) function3.invoke(this, dVar.f17614d, obj3) : null);
                }
            }
            Object objS = mVar.s();
            if (objS != CoroutineSingletons.f71806a) {
                objS = Unit.f71706a;
            }
            if (objS != coroutineSingletons) {
                fVar = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        fVar = eVar.f17620t;
        ResultKt.b(obj);
        eVar.f17620t = null;
        eVar.f17623w = 2;
        Object objB = fVar.b(eVar);
        return objB == coroutineSingletons ? coroutineSingletons : objB;
    }

    public final d e(Object obj) {
        ArrayList arrayList = this.f17626b;
        Object obj2 = null;
        if (arrayList == null) {
            return null;
        }
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Object next = it.next();
            if (((d) next).f17611a == obj) {
                obj2 = next;
                break;
            }
        }
        d dVar = (d) obj2;
        if (dVar != null) {
            return dVar;
        }
        throw new IllegalStateException(("Clause with object " + obj + " is not found").toString());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void f(x7.h hVar, Function2 function2) {
        g(new d(this, (v70.i) hVar.f95137b, (Function3) hVar.f95138c, (Function3) hVar.f95139d, null, (SuspendLambda) function2, (Function3) hVar.f95140e), false);
    }

    public final void g(d dVar, boolean z11) {
        Object obj = dVar.f17611a;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f17624f;
        if (atomicReferenceFieldUpdater.get(this) instanceof d) {
            return;
        }
        if (!z11) {
            ArrayList arrayList = this.f17626b;
            Intrinsics.d(arrayList);
            if (!arrayList.isEmpty()) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    if (((d) it.next()).f17611a == obj) {
                        throw new IllegalStateException(u4.h(obj, "Cannot use select clauses on the same object: ").toString());
                    }
                }
            }
        }
        dVar.f17612b.invoke(obj, this, dVar.f17614d);
        if (this.f17629e != i.f17634d) {
            atomicReferenceFieldUpdater.set(this, dVar);
            return;
        }
        if (!z11) {
            ArrayList arrayList2 = this.f17626b;
            Intrinsics.d(arrayList2);
            arrayList2.add(dVar);
        }
        dVar.f17617g = this.f17627c;
        dVar.f17618h = this.f17628d;
        this.f17627c = null;
        this.f17628d = -1;
    }

    public final int h(Object obj, Object obj2) {
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f17624f;
            Object obj3 = atomicReferenceFieldUpdater.get(this);
            if (!(obj3 instanceof l)) {
                if (Intrinsics.b(obj3, i.f17632b) || (obj3 instanceof d)) {
                    return 3;
                }
                if (Intrinsics.b(obj3, i.f17633c)) {
                    return 2;
                }
                if (Intrinsics.b(obj3, i.f17631a)) {
                    List listP = ul.b.P(obj);
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, obj3, listP)) {
                        if (atomicReferenceFieldUpdater.get(this) != obj3) {
                            break;
                        }
                    }
                    return 1;
                }
                if (!(obj3 instanceof List)) {
                    throw new IllegalStateException(("Unexpected state: " + obj3).toString());
                }
                ArrayList arrayListU1 = b70.g.u1((Collection) obj3, obj);
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj3, arrayListU1)) {
                    if (atomicReferenceFieldUpdater.get(this) != obj3) {
                        break;
                    }
                }
                return 1;
            }
            d dVarE = e(obj);
            if (dVarE != null) {
                Function3 function3 = dVarE.f17616f;
                Function3 function32 = function3 != null ? (Function3) function3.invoke(this, dVarE.f17614d, obj2) : null;
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj3, dVarE)) {
                    if (atomicReferenceFieldUpdater.get(this) != obj3) {
                        break;
                    }
                }
                l lVar = (l) obj3;
                this.f17629e = obj2;
                w50.g gVarG = lVar.g(Unit.f71706a, function32);
                if (gVarG == null) {
                    this.f17629e = i.f17634d;
                    return 2;
                }
                lVar.x(gVarG);
                return 0;
            }
            continue;
        }
    }
}
