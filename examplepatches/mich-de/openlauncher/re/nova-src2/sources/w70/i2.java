package w70;

import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i2 extends x70.a implements m1, d, x70.s {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f93935f = AtomicReferenceFieldUpdater.newUpdater(i2.class, Object.class, "_state$volatile");
    private volatile /* synthetic */ Object _state$volatile;

    /* renamed from: e, reason: collision with root package name */
    public int f93936e;

    public i2(Object obj) {
        this._state$volatile = obj;
    }

    @Override // x70.s
    public final m a(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return (((i5 < 0 || i5 >= 2) && i5 != -2) || aVar != v70.a.f92142b) ? u1.t(this, coroutineContext, i5, aVar) : this;
    }

    @Override // w70.l1
    public final boolean c(Object obj) {
        j(obj);
        return true;
    }

    /* JADX WARN: Path cross not found for [B:36:0x008f, B:38:0x0095], limit reached: 66 */
    /* JADX WARN: Path cross not found for [B:38:0x0095, B:36:0x008f], limit reached: 66 */
    /* JADX WARN: Path cross not found for [B:38:0x0095, B:46:0x00b3], limit reached: 66 */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0081 A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:14:0x0036, B:28:0x0079, B:30:0x0081, B:33:0x0088, B:34:0x008c, B:36:0x008f, B:46:0x00b3, B:49:0x00c3, B:50:0x00e0, B:56:0x00f4, B:59:0x00fd, B:53:0x00e7, B:55:0x00ed, B:38:0x0095, B:42:0x009c, B:21:0x0051, B:24:0x005b, B:27:0x006a), top: B:64:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x008f A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:14:0x0036, B:28:0x0079, B:30:0x0081, B:33:0x0088, B:34:0x008c, B:36:0x008f, B:46:0x00b3, B:49:0x00c3, B:50:0x00e0, B:56:0x00f4, B:59:0x00fd, B:53:0x00e7, B:55:0x00ed, B:38:0x0095, B:42:0x009c, B:21:0x0051, B:24:0x005b, B:27:0x006a), top: B:64:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00c3 A[Catch: all -> 0x003a, TryCatch #0 {all -> 0x003a, blocks: (B:14:0x0036, B:28:0x0079, B:30:0x0081, B:33:0x0088, B:34:0x008c, B:36:0x008f, B:46:0x00b3, B:49:0x00c3, B:50:0x00e0, B:56:0x00f4, B:59:0x00fd, B:53:0x00e7, B:55:0x00ed, B:38:0x0095, B:42:0x009c, B:21:0x0051, B:24:0x005b, B:27:0x006a), top: B:64:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x00c2 -> B:28:0x0079). Please report as a decompilation issue!!! */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(n nVar, Continuation continuation) {
        h2 h2Var;
        i2 i2Var;
        j2 j2Var;
        n nVar2;
        t70.r1 r1Var;
        Object obj;
        Object andSet;
        Object obj2;
        Object obj3;
        if (continuation instanceof h2) {
            h2Var = (h2) continuation;
            int i5 = h2Var.A;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h2Var.A = i5 - Integer.MIN_VALUE;
            } else {
                h2Var = new h2(this, continuation);
            }
        }
        Object obj4 = h2Var.f93920y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h2Var.A;
        try {
            if (i11 == 0) {
                ResultKt.b(obj4);
                i2Var = this;
                j2Var = (j2) b();
            } else if (i11 == 1) {
                j2Var = h2Var.f93917v;
                nVar = h2Var.f93916u;
                i2Var = h2Var.f93915t;
                ResultKt.b(obj4);
            } else if (i11 == 2) {
                obj = h2Var.f93919x;
                r1Var = h2Var.f93918w;
                j2Var = h2Var.f93917v;
                nVar2 = h2Var.f93916u;
                i2Var = h2Var.f93915t;
                ResultKt.b(obj4);
                AtomicReference atomicReference = j2Var.f93945a;
                w50.g gVar = u1.f94042b;
                andSet = atomicReference.getAndSet(gVar);
                Intrinsics.d(andSet);
                if (andSet == u1.f94043c) {
                }
                obj2 = f93935f.get(i2Var);
                if (r1Var != null) {
                }
                if (obj != null) {
                }
                if (obj2 != x70.b.f95216b) {
                }
                h2Var.f93915t = i2Var;
                h2Var.f93916u = nVar2;
                h2Var.f93917v = j2Var;
                h2Var.f93918w = r1Var;
                h2Var.f93919x = obj2;
                h2Var.A = 2;
                if (nVar2.emit(obj3, h2Var) != coroutineSingletons) {
                }
            } else {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                obj = h2Var.f93919x;
                r1Var = h2Var.f93918w;
                j2Var = h2Var.f93917v;
                nVar2 = h2Var.f93916u;
                i2Var = h2Var.f93915t;
                ResultKt.b(obj4);
                obj2 = f93935f.get(i2Var);
                if (r1Var != null && !r1Var.b()) {
                    throw r1Var.h();
                }
                if (obj != null || !obj.equals(obj2)) {
                    obj3 = obj2 != x70.b.f95216b ? null : obj2;
                    h2Var.f93915t = i2Var;
                    h2Var.f93916u = nVar2;
                    h2Var.f93917v = j2Var;
                    h2Var.f93918w = r1Var;
                    h2Var.f93919x = obj2;
                    h2Var.A = 2;
                    if (nVar2.emit(obj3, h2Var) != coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    obj = obj2;
                }
                AtomicReference atomicReference2 = j2Var.f93945a;
                w50.g gVar2 = u1.f94042b;
                andSet = atomicReference2.getAndSet(gVar2);
                Intrinsics.d(andSet);
                if (andSet == u1.f94043c) {
                    h2Var.f93915t = i2Var;
                    h2Var.f93916u = nVar2;
                    h2Var.f93917v = j2Var;
                    h2Var.f93918w = r1Var;
                    h2Var.f93919x = obj;
                    h2Var.A = 3;
                    t70.m mVar = new t70.m(1, IntrinsicsKt.b(h2Var));
                    mVar.t();
                    AtomicReference atomicReference3 = j2Var.f93945a;
                    while (true) {
                        if (atomicReference3.compareAndSet(gVar2, mVar)) {
                            break;
                        }
                        if (atomicReference3.get() != gVar2) {
                            int i12 = Result.f71687b;
                            mVar.resumeWith(Unit.f71706a);
                            break;
                        }
                    }
                    Object objS = mVar.s();
                    if (objS != CoroutineSingletons.f71806a) {
                        if (Unit.f71706a != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    }
                    if (objS != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                obj2 = f93935f.get(i2Var);
                if (r1Var != null) {
                    throw r1Var.h();
                }
                if (obj != null) {
                }
                if (obj2 != x70.b.f95216b) {
                }
                h2Var.f93915t = i2Var;
                h2Var.f93916u = nVar2;
                h2Var.f93917v = j2Var;
                h2Var.f93918w = r1Var;
                h2Var.f93919x = obj2;
                h2Var.A = 2;
                if (nVar2.emit(obj3, h2Var) != coroutineSingletons) {
                }
            }
            nVar2 = nVar;
            r1Var = (t70.r1) h2Var.getContext().get(t70.q1.f88853a);
            obj = null;
            obj2 = f93935f.get(i2Var);
            if (r1Var != null) {
            }
            if (obj != null) {
            }
            if (obj2 != x70.b.f95216b) {
            }
            h2Var.f93915t = i2Var;
            h2Var.f93916u = nVar2;
            h2Var.f93917v = j2Var;
            h2Var.f93918w = r1Var;
            h2Var.f93919x = obj2;
            h2Var.A = 2;
            if (nVar2.emit(obj3, h2Var) != coroutineSingletons) {
            }
        } catch (Throwable th2) {
            i2Var.g(j2Var);
            throw th2;
        }
    }

    @Override // w70.l1
    public final void d() {
        throw new UnsupportedOperationException("MutableStateFlow.resetReplayCache is not supported");
    }

    @Override // x70.a
    public final x70.c e() {
        return new j2();
    }

    @Override // w70.l1, w70.n
    public final Object emit(Object obj, Continuation continuation) {
        j(obj);
        return Unit.f71706a;
    }

    @Override // x70.a
    public final x70.c[] f() {
        return new j2[2];
    }

    @Override // w70.q1
    public final List getReplayCache() {
        return ul.b.P(getValue());
    }

    @Override // w70.g2
    public final Object getValue() {
        w50.g gVar = x70.b.f95216b;
        Object obj = f93935f.get(this);
        if (obj == gVar) {
            return null;
        }
        return obj;
    }

    public final boolean i(Object obj, Object obj2) {
        w50.g gVar = x70.b.f95216b;
        if (obj == null) {
            obj = gVar;
        }
        if (obj2 == null) {
            obj2 = gVar;
        }
        return k(obj, obj2);
    }

    public final void j(Object obj) {
        if (obj == null) {
            obj = x70.b.f95216b;
        }
        k(null, obj);
    }

    public final boolean k(Object obj, Object obj2) {
        int i5;
        x70.c[] cVarArr;
        w50.g gVar;
        synchronized (this) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f93935f;
            Object obj3 = atomicReferenceFieldUpdater.get(this);
            if (obj != null && !Intrinsics.b(obj3, obj)) {
                return false;
            }
            if (Intrinsics.b(obj3, obj2)) {
                return true;
            }
            atomicReferenceFieldUpdater.set(this, obj2);
            int i11 = this.f93936e;
            if ((i11 & 1) != 0) {
                this.f93936e = i11 + 2;
                return true;
            }
            int i12 = i11 + 1;
            this.f93936e = i12;
            x70.c[] cVarArr2 = this.f95211a;
            Unit unit = Unit.f71706a;
            while (true) {
                j2[] j2VarArr = (j2[]) cVarArr2;
                if (j2VarArr != null) {
                    for (j2 j2Var : j2VarArr) {
                        if (j2Var != null) {
                            AtomicReference atomicReference = j2Var.f93945a;
                            while (true) {
                                Object obj4 = atomicReference.get();
                                if (obj4 != null && obj4 != (gVar = u1.f94043c)) {
                                    w50.g gVar2 = u1.f94042b;
                                    if (obj4 != gVar2) {
                                        while (!atomicReference.compareAndSet(obj4, gVar2)) {
                                            if (atomicReference.get() != obj4) {
                                                break;
                                            }
                                        }
                                        int i13 = Result.f71687b;
                                        ((t70.m) obj4).resumeWith(Unit.f71706a);
                                        break;
                                    }
                                    while (!atomicReference.compareAndSet(obj4, gVar)) {
                                        if (atomicReference.get() != obj4) {
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                synchronized (this) {
                    i5 = this.f93936e;
                    if (i5 == i12) {
                        this.f93936e = i12 + 1;
                        return true;
                    }
                    cVarArr = this.f95211a;
                    Unit unit2 = Unit.f71706a;
                }
                cVarArr2 = cVarArr;
                i12 = i5;
            }
        }
    }
}
