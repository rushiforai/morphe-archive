package qx;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class v0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f84623t;

    /* renamed from: u, reason: collision with root package name */
    public int f84624u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ int f84625v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ w0 f84626w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v0(int i5, w0 w0Var, Continuation continuation, int i11) {
        super(2, continuation);
        this.f84623t = i11;
        this.f84625v = i5;
        this.f84626w = w0Var;
    }

    private final Object e(Object obj) {
        Object obj2;
        w0 w0Var;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f84624u;
        try {
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    int i11 = this.f84625v;
                    l lVar = this.f84626w.f84635b;
                    pu.e eVar = new pu.e(26);
                    this.f84624u = 1;
                    obj = g0.f84495a.a(i11, lVar, eVar, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                Iterator it = ((List) obj).iterator();
                while (it.hasNext()) {
                    w0.b(this.f84626w, (r) it.next());
                }
                w0Var = this.f84626w;
                obj2 = w0Var.f84637d;
            } catch (CancellationException e3) {
                throw e3;
            } catch (Exception unused) {
                w0 w0Var2 = this.f84626w;
                obj2 = w0Var2.f84637d;
                synchronized (obj2) {
                    w0Var2.f84641h = false;
                    Unit unit = Unit.f71706a;
                }
            }
            synchronized (obj2) {
                w0Var.f84641h = false;
                Unit unit2 = Unit.f71706a;
                return Unit.f71706a;
            }
        } catch (Throwable th2) {
            w0 w0Var3 = this.f84626w;
            synchronized (w0Var3.f84637d) {
                w0Var3.f84641h = false;
                Unit unit3 = Unit.f71706a;
                throw th2;
            }
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f84623t) {
            case 0:
                return new v0(this.f84625v, this.f84626w, continuation, 0);
            default:
                return new v0(this.f84625v, this.f84626w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f84623t) {
        }
        return ((v0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object obj2;
        w0 w0Var;
        switch (this.f84623t) {
            case 0:
                return e(obj);
            default:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f84624u;
                try {
                    try {
                        if (i5 == 0) {
                            ResultKt.b(obj);
                            int i11 = this.f84625v;
                            l lVar = this.f84626w.f84635b;
                            pu.e eVar = new pu.e(27);
                            this.f84624u = 1;
                            obj = g0.f84495a.a(i11, lVar, eVar, this);
                            if (obj == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        } else {
                            if (i5 != 1) {
                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                            }
                            ResultKt.b(obj);
                        }
                        List list = (List) obj;
                        w0 w0Var2 = this.f84626w;
                        synchronized (w0Var2.f84637d) {
                            try {
                                Iterator it = list.iterator();
                                while (it.hasNext()) {
                                    w0Var2.k((r) it.next());
                                }
                                Unit unit = Unit.f71706a;
                            } finally {
                            }
                        }
                        if (!list.isEmpty()) {
                            this.f84626w.h();
                        }
                        w0Var = this.f84626w;
                        obj2 = w0Var.f84637d;
                    } catch (Throwable th2) {
                        w0 w0Var3 = this.f84626w;
                        synchronized (w0Var3.f84637d) {
                            w0Var3.f84641h = false;
                            Unit unit2 = Unit.f71706a;
                            throw th2;
                        }
                    }
                } catch (CancellationException e3) {
                    throw e3;
                } catch (Exception unused) {
                    w0 w0Var4 = this.f84626w;
                    obj2 = w0Var4.f84637d;
                    synchronized (obj2) {
                        w0Var4.f84641h = false;
                        Unit unit3 = Unit.f71706a;
                    }
                }
                synchronized (obj2) {
                    w0Var.f84641h = false;
                    return Unit.f71706a;
                }
        }
    }
}
