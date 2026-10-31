package w70;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.io.Serializable;
import java.util.NoSuchElementException;
import java.util.concurrent.CancellationException;
import kotlin.ExceptionsKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes.dex */
public abstract class u1 {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f94041a = new w50.g("NO_VALUE", 1);

    /* renamed from: b, reason: collision with root package name */
    public static final w50.g f94042b = new w50.g("NONE", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final w50.g f94043c = new w50.g("PENDING", 1);

    public static final x70.l A(m mVar, Function3 function3) {
        int i5 = s0.f94008a;
        return new x70.l(function3, mVar, EmptyCoroutineContext.f71803a, -2, v70.a.f92141a);
    }

    public static final t1 a(int i5, int i11, v70.a aVar) {
        if (i5 < 0) {
            throw new IllegalArgumentException(b.c0.h(i5, "replay cannot be negative, but was ").toString());
        }
        if (i11 < 0) {
            throw new IllegalArgumentException(b.c0.h(i11, "extraBufferCapacity cannot be negative, but was ").toString());
        }
        if (i5 <= 0 && i11 <= 0 && aVar != v70.a.f92141a) {
            throw new IllegalArgumentException(("replay or extraBufferCapacity must be positive with non-default onBufferOverflow strategy " + aVar).toString());
        }
        int i12 = i11 + i5;
        if (i12 < 0) {
            i12 = LayoutNode.NotPlacedPlaceOrder;
        }
        return new t1(i5, i12, aVar);
    }

    public static /* synthetic */ t1 b(int i5, int i11, v70.a aVar, int i12) {
        if ((i12 & 1) != 0) {
            i5 = 0;
        }
        if ((i12 & 2) != 0) {
            i11 = 0;
        }
        if ((i12 & 4) != 0) {
            aVar = v70.a.f92141a;
        }
        return a(i5, i11, aVar);
    }

    public static final i2 c(Object obj) {
        if (obj == null) {
            obj = x70.b.f95216b;
        }
        return new i2(obj);
    }

    public static final void d(Object[] objArr, long j11, Object obj) {
        objArr[((int) j11) & (objArr.length - 1)] = obj;
    }

    public static m e(m mVar, int i5) {
        v70.a aVar = v70.a.f92141a;
        if (i5 < 0 && i5 != -2 && i5 != -1) {
            throw new IllegalArgumentException(b.c0.h(i5, "Buffer size should be non-negative, BUFFERED, or CONFLATED, but was ").toString());
        }
        if (i5 == -1) {
            aVar = v70.a.f92142b;
            i5 = 0;
        }
        int i11 = i5;
        v70.a aVar2 = aVar;
        return mVar instanceof x70.s ? x70.b.b((x70.s) mVar, null, i11, aVar2, 1) : new x70.h(mVar, null, i11, aVar2, 2);
    }

    public static final c f(Function2 function2) {
        return new c(function2, EmptyCoroutineContext.f71803a, -2, v70.a.f92141a);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Serializable g(ContinuationImpl continuationImpl, m mVar, n nVar) throws Throwable {
        c0 c0Var;
        Ref.ObjectRef objectRef;
        Throwable th2;
        t70.r1 r1Var;
        CancellationException cancellationExceptionH;
        if (continuationImpl instanceof c0) {
            c0Var = (c0) continuationImpl;
            int i5 = c0Var.f93868v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c0Var.f93868v = i5 - Integer.MIN_VALUE;
            } else {
                c0Var = new c0(continuationImpl);
            }
        }
        Object obj = c0Var.f93867u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c0Var.f93868v;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            try {
                n e0Var = new e0(nVar, objectRefL);
                c0Var.f93866t = objectRefL;
                c0Var.f93868v = 1;
                if (mVar.collect(e0Var, c0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return null;
            } catch (Throwable th3) {
                objectRef = objectRefL;
                th2 = th3;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = c0Var.f93866t;
            try {
                ResultKt.b(obj);
                return null;
            } catch (Throwable th4) {
                th2 = th4;
            }
        }
        Throwable th5 = (Throwable) objectRef.f71863a;
        if ((th5 != null && th5.equals(th2)) || ((r1Var = (t70.r1) c0Var.getContext().get(t70.q1.f88853a)) != null && r1Var.isCancelled() && (cancellationExceptionH = r1Var.h()) != null && cancellationExceptionH.equals(th2))) {
            throw th2;
        }
        if (th5 == null) {
            return th2;
        }
        if (th2 instanceof CancellationException) {
            ExceptionsKt.a(th5, th2);
            throw th5;
        }
        ExceptionsKt.a(th2, th5);
        throw th2;
    }

    public static final h h(Function2 function2) {
        return new h(function2, EmptyCoroutineContext.f71803a, -2, v70.a.f92141a);
    }

    public static final Object i(m mVar, Function2 function2, Continuation continuation) {
        Object objCollect = e(v(function2, mVar), 0).collect(x70.u.f95267a, continuation);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (objCollect != coroutineSingletons) {
            objCollect = Unit.f71706a;
        }
        return objCollect == coroutineSingletons ? objCollect : Unit.f71706a;
    }

    public static final cw.u0 j(m mVar, m mVar2, m mVar3, Function4 function4) {
        return new cw.u0(11, new m[]{mVar, mVar2, mVar3}, function4);
    }

    public static final m k(m mVar) {
        return ((mVar instanceof g2) || (mVar instanceof k)) ? mVar : new k(mVar);
    }

    public static final f0 l(m mVar, int i5) {
        if (i5 >= 0) {
            return new f0(mVar, i5);
        }
        throw new IllegalArgumentException(b.c0.h(i5, "Drop count should be non-negative, but had ").toString());
    }

    public static final Object m(ContinuationImpl continuationImpl, m mVar, n nVar) throws Throwable {
        if (nVar instanceof k2) {
            throw ((k2) nVar).f93951a;
        }
        Object objCollect = mVar.collect(nVar, continuationImpl);
        return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0088, code lost:
    
        if (r2.emit(r9, r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0074 A[Catch: all -> 0x0034, TRY_LEAVE, TryCatch #0 {all -> 0x0034, blocks: (B:13:0x002e, B:25:0x0055, B:29:0x006c, B:31:0x0074, B:20:0x0046, B:24:0x0051), top: B:45:0x0020 }] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:32:0x0088 -> B:14:0x0031). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object n(n nVar, v70.z zVar, boolean z11, Continuation continuation) throws Throwable {
        q qVar;
        v70.n it;
        v70.n nVar2;
        n nVar3;
        Object objA;
        if (continuation instanceof q) {
            qVar = (q) continuation;
            int i5 = qVar.f93992y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f93992y = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(continuation);
            }
        }
        Object obj = qVar.f93991x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar.f93992y;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (nVar instanceof k2) {
                    throw ((k2) nVar).f93951a;
                }
                it = zVar.iterator();
                qVar.f93987t = nVar;
                qVar.f93988u = zVar;
                qVar.f93989v = it;
                qVar.f93990w = z11;
                qVar.f93992y = 1;
                v70.b bVar = (v70.b) it;
                objA = bVar.a(qVar);
                if (objA != coroutineSingletons) {
                }
            } else if (i11 == 1) {
                z11 = qVar.f93990w;
                nVar2 = qVar.f93989v;
                zVar = qVar.f93988u;
                nVar3 = qVar.f93987t;
                ResultKt.b(obj);
                if (((Boolean) obj).booleanValue()) {
                }
            } else {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z11 = qVar.f93990w;
                v70.n nVar4 = qVar.f93989v;
                zVar = qVar.f93988u;
                nVar3 = qVar.f93987t;
                ResultKt.b(obj);
                v70.n nVar5 = nVar4;
                it = nVar5;
                nVar = nVar3;
                qVar.f93987t = nVar;
                qVar.f93988u = zVar;
                qVar.f93989v = it;
                qVar.f93990w = z11;
                qVar.f93992y = 1;
                v70.b bVar2 = (v70.b) it;
                objA = bVar2.a(qVar);
                if (objA != coroutineSingletons) {
                    return coroutineSingletons;
                }
                nVar3 = nVar;
                nVar2 = bVar2;
                obj = objA;
                if (((Boolean) obj).booleanValue()) {
                    if (z11) {
                        p6.a1.d(zVar, null);
                    }
                    return Unit.f71706a;
                }
                v70.b bVar3 = (v70.b) nVar2;
                Object objB = bVar3.b();
                qVar.f93987t = nVar3;
                qVar.f93988u = zVar;
                qVar.f93989v = bVar3;
                qVar.f93990w = z11;
                qVar.f93992y = 2;
                nVar5 = bVar3;
            }
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0065 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object o(m mVar, Continuation continuation) {
        w0 w0Var;
        Ref.ObjectRef objectRef;
        AbortFlowException e3;
        t0 t0Var;
        Object obj;
        w50.g gVar = x70.b.f95216b;
        if (continuation instanceof w0) {
            w0Var = (w0) continuation;
            int i5 = w0Var.f94060w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w0Var.f94060w = i5 - Integer.MIN_VALUE;
            } else {
                w0Var = new w0(continuation);
            }
        }
        Object obj2 = w0Var.f94059v;
        Object obj3 = CoroutineSingletons.f71806a;
        int i11 = w0Var.f94060w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj2);
            objectRefL.f71863a = gVar;
            t0 t0Var2 = new t0(objectRefL, 0);
            try {
                w0Var.f94057t = objectRefL;
                w0Var.f94058u = t0Var2;
                w0Var.f94060w = 1;
                if (mVar.collect(t0Var2, w0Var) == obj3) {
                    return obj3;
                }
                objectRef = objectRefL;
            } catch (AbortFlowException e11) {
                objectRef = objectRefL;
                e3 = e11;
                t0Var = t0Var2;
                if (e3.f72062a == t0Var) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            t0Var = w0Var.f94058u;
            objectRef = w0Var.f94057t;
            try {
                ResultKt.b(obj2);
            } catch (AbortFlowException e12) {
                e3 = e12;
                if (e3.f72062a == t0Var) {
                    throw e3;
                }
                t70.m0.k(w0Var.getContext());
                obj = objectRef.f71863a;
                if (obj == gVar) {
                }
            }
        }
        obj = objectRef.f71863a;
        if (obj == gVar) {
            return obj;
        }
        throw new NoSuchElementException("Expected at least one element");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0065 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object p(m mVar, Function2 function2, Continuation continuation) {
        x0 x0Var;
        Ref.ObjectRef objectRef;
        AbortFlowException e3;
        v0 v0Var;
        Object obj;
        w50.g gVar = x70.b.f95216b;
        if (continuation instanceof x0) {
            x0Var = (x0) continuation;
            int i5 = x0Var.f94070w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x0Var.f94070w = i5 - Integer.MIN_VALUE;
            } else {
                x0Var = new x0(continuation);
            }
        }
        Object obj2 = x0Var.f94069v;
        Object obj3 = CoroutineSingletons.f71806a;
        int i11 = x0Var.f94070w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj2);
            objectRefL.f71863a = gVar;
            v0 v0Var2 = new v0(0, function2, objectRefL);
            try {
                x0Var.f94067t = objectRefL;
                x0Var.f94068u = v0Var2;
                x0Var.f94070w = 1;
                if (mVar.collect(v0Var2, x0Var) == obj3) {
                    return obj3;
                }
                objectRef = objectRefL;
            } catch (AbortFlowException e11) {
                objectRef = objectRefL;
                e3 = e11;
                v0Var = v0Var2;
                if (e3.f72062a == v0Var) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            v0Var = x0Var.f94068u;
            objectRef = x0Var.f94067t;
            try {
                ResultKt.b(obj2);
            } catch (AbortFlowException e12) {
                e3 = e12;
                if (e3.f72062a == v0Var) {
                    throw e3;
                }
                t70.m0.k(x0Var.getContext());
                obj = objectRef.f71863a;
                if (obj == gVar) {
                }
            }
        }
        obj = objectRef.f71863a;
        if (obj == gVar) {
            return obj;
        }
        throw new NoSuchElementException("Expected at least one element matching the predicate");
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object q(m mVar, ContinuationImpl continuationImpl) {
        z0 z0Var;
        Ref.ObjectRef objectRef;
        AbortFlowException e3;
        t0 t0Var;
        if (continuationImpl instanceof z0) {
            z0Var = (z0) continuationImpl;
            int i5 = z0Var.f94094w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z0Var.f94094w = i5 - Integer.MIN_VALUE;
            } else {
                z0Var = new z0(continuationImpl);
            }
        }
        Object obj = z0Var.f94093v;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = z0Var.f94094w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            t0 t0Var2 = new t0(objectRefL, 1);
            try {
                z0Var.f94091t = objectRefL;
                z0Var.f94092u = t0Var2;
                z0Var.f94094w = 1;
                if (mVar.collect(t0Var2, z0Var) == obj2) {
                    return obj2;
                }
                objectRef = objectRefL;
            } catch (AbortFlowException e11) {
                objectRef = objectRefL;
                e3 = e11;
                t0Var = t0Var2;
                if (e3.f72062a == t0Var) {
                    throw e3;
                }
                t70.m0.k(z0Var.getContext());
                return objectRef.f71863a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            t0Var = z0Var.f94092u;
            objectRef = z0Var.f94091t;
            try {
                ResultKt.b(obj);
            } catch (AbortFlowException e12) {
                e3 = e12;
                if (e3.f72062a == t0Var) {
                }
            }
        }
        return objectRef.f71863a;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object r(m mVar, Function2 function2, ContinuationImpl continuationImpl) {
        a1 a1Var;
        Ref.ObjectRef objectRef;
        AbortFlowException e3;
        as.p pVar;
        if (continuationImpl instanceof a1) {
            a1Var = (a1) continuationImpl;
            int i5 = a1Var.f93848w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a1Var.f93848w = i5 - Integer.MIN_VALUE;
            } else {
                a1Var = new a1(continuationImpl);
            }
        }
        Object obj = a1Var.f93847v;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = a1Var.f93848w;
        if (i11 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            as.p pVar2 = new as.p(17, function2, objectRefL);
            try {
                a1Var.f93845t = objectRefL;
                a1Var.f93846u = pVar2;
                a1Var.f93848w = 1;
                if (mVar.collect(pVar2, a1Var) == obj2) {
                    return obj2;
                }
                objectRef = objectRefL;
            } catch (AbortFlowException e11) {
                objectRef = objectRefL;
                e3 = e11;
                pVar = pVar2;
                if (e3.f72062a == pVar) {
                    throw e3;
                }
                t70.m0.k(a1Var.getContext());
                return objectRef.f71863a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            pVar = a1Var.f93846u;
            objectRef = a1Var.f93845t;
            try {
                ResultKt.b(obj);
            } catch (AbortFlowException e12) {
                e3 = e12;
                if (e3.f72062a == pVar) {
                }
            }
        }
        return objectRef.f71863a;
    }

    public static final m s(m mVar, CoroutineContext coroutineContext) {
        if (coroutineContext.get(t70.q1.f88853a) == null) {
            return coroutineContext.equals(EmptyCoroutineContext.f71803a) ? mVar : mVar instanceof x70.s ? x70.b.b((x70.s) mVar, coroutineContext, 0, null, 6) : new x70.h(mVar, coroutineContext, 0, null, 12);
        }
        throw new IllegalArgumentException(("Flow context cannot contain job in it. Had " + coroutineContext).toString());
    }

    public static final m t(q1 q1Var, CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return ((i5 == 0 || i5 == -3) && aVar == v70.a.f92141a) ? q1Var : new x70.h(i5, coroutineContext, aVar, q1Var);
    }

    public static final t70.g2 u(m mVar, t70.j0 j0Var) {
        return t70.m0.t(j0Var, null, null, new a60.d(mVar, null, 28), 3);
    }

    public static final x70.l v(Function2 function2, m mVar) {
        int i5 = s0.f94008a;
        return A(mVar, new c50.b(function2, null, 7));
    }

    public static final g w(v70.z zVar) {
        return new g(zVar, false);
    }

    public static final n1 x(m mVar, t70.j0 j0Var, z1 z1Var, int i5) {
        x1 x1VarA = e1.a(mVar, i5);
        t1 t1VarA = a(i5, x1VarA.f94072b, x1VarA.f94073c);
        t70.m0.s(j0Var, x1VarA.f94074d, z1Var.equals(y1.f94086a) ? t70.l0.f88813a : t70.l0.f88816d, new b00.q(z1Var, x1VarA.f94071a, t1VarA, f94041a, (Continuation) null));
        return new n1(t1VarA);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object y(m mVar, t70.j0 j0Var, ContinuationImpl continuationImpl) {
        d1 d1Var;
        if (continuationImpl instanceof d1) {
            d1Var = (d1) continuationImpl;
            int i5 = d1Var.f93880u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d1Var.f93880u = i5 - Integer.MIN_VALUE;
            } else {
                d1Var = new d1(continuationImpl);
            }
        }
        Object objY = d1Var.f93879t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d1Var.f93880u;
        if (i11 == 0) {
            ResultKt.b(objY);
            x1 x1VarA = e1.a(mVar, 1);
            t70.s sVar = new t70.s((t70.r1) j0Var.getCoroutineContext().get(t70.q1.f88853a));
            t70.m0.t(j0Var, x1VarA.f94074d, null, new c1(x1VarA.f94071a, sVar, null), 2);
            d1Var.f93880u = 1;
            objY = sVar.y(d1Var);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        Object obj = ((Result) objY).f71688a;
        ResultKt.b(obj);
        return obj;
    }

    public static final o1 z(m mVar, t70.j0 j0Var, z1 z1Var, Object obj) {
        x1 x1VarA = e1.a(mVar, 1);
        i2 i2VarC = c(obj);
        t70.m0.s(j0Var, x1VarA.f94074d, z1Var.equals(y1.f94086a) ? t70.l0.f88813a : t70.l0.f88816d, new b00.q(z1Var, x1VarA.f94071a, i2VarC, obj, (Continuation) null));
        return new o1(i2VarC);
    }
}
