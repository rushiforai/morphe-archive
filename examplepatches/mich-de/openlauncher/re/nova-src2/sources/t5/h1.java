package t5;

import java.util.concurrent.atomic.AtomicInteger;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import w70.p1;

/* loaded from: classes2.dex */
public final class h1 implements p0 {

    /* renamed from: a, reason: collision with root package name */
    public final c80.d f88600a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    public final q.c f88601b = new q.c(29);

    /* renamed from: c, reason: collision with root package name */
    public final p1 f88602c = new p1(new p10.p1(2, null, 4));

    public h1(String str) {
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // t5.p0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Function2 function2, ContinuationImpl continuationImpl) throws Throwable {
        g1 g1Var;
        c80.d dVar;
        Throwable th2;
        boolean z11;
        if (continuationImpl instanceof g1) {
            g1Var = (g1) continuationImpl;
            int i5 = g1Var.f88594x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g1Var.f88594x = i5 - Integer.MIN_VALUE;
            } else {
                g1Var = new g1(this, continuationImpl);
            }
        }
        Object obj = g1Var.f88592v;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = g1Var.f88594x;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = g1Var.f88591u;
            dVar = g1Var.f88590t;
            try {
                ResultKt.b(obj);
                if (z11) {
                    dVar.g(null);
                }
                return obj;
            } catch (Throwable th3) {
                th2 = th3;
                if (z11) {
                }
                throw th2;
            }
        }
        ResultKt.b(obj);
        c80.d dVar2 = this.f88600a;
        boolean zF = dVar2.f();
        try {
            Object objValueOf = Boolean.valueOf(zF);
            g1Var.f88590t = dVar2;
            g1Var.f88591u = zF;
            g1Var.f88594x = 1;
            Object objInvoke = function2.invoke(objValueOf, g1Var);
            if (objInvoke == obj2) {
                return obj2;
            }
            dVar = dVar2;
            obj = objInvoke;
            z11 = zF;
            if (z11) {
            }
            return obj;
        } catch (Throwable th4) {
            dVar = dVar2;
            th2 = th4;
            z11 = zF;
            if (z11) {
                dVar.g(null);
            }
            throw th2;
        }
    }

    @Override // t5.p0
    public final w70.m b() {
        return this.f88602c;
    }

    @Override // t5.p0
    public final Object c(b0 b0Var) {
        return new Integer(((AtomicInteger) this.f88601b.f83189b).incrementAndGet());
    }

    @Override // t5.p0
    public final Object d(ContinuationImpl continuationImpl) {
        return new Integer(((AtomicInteger) this.f88601b.f83189b).get());
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // t5.p0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object e(Function1 function1, ContinuationImpl continuationImpl) throws Throwable {
        f1 f1Var;
        c80.d dVar;
        Throwable th2;
        c80.a aVar;
        if (continuationImpl instanceof f1) {
            f1Var = (f1) continuationImpl;
            int i5 = f1Var.f88588x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f1Var.f88588x = i5 - Integer.MIN_VALUE;
            } else {
                f1Var = new f1(this, continuationImpl);
            }
        }
        Object obj = f1Var.f88586v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f1Var.f88588x;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                f1Var.f88584t = function1;
                dVar = this.f88600a;
                f1Var.f88585u = dVar;
                f1Var.f88588x = 1;
                if (dVar.e(f1Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = (c80.a) f1Var.f88584t;
                try {
                    ResultKt.b(obj);
                    ((c80.d) aVar).g(null);
                    return obj;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((c80.d) aVar).g(null);
                    throw th2;
                }
            }
            c80.d dVar2 = f1Var.f88585u;
            Function1 function12 = (Function1) f1Var.f88584t;
            ResultKt.b(obj);
            dVar = dVar2;
            function1 = function12;
            f1Var.f88584t = dVar;
            f1Var.f88585u = null;
            f1Var.f88588x = 2;
            Object objInvoke = function1.invoke(f1Var);
            if (objInvoke != coroutineSingletons) {
                c80.d dVar3 = dVar;
                obj = objInvoke;
                aVar = dVar3;
                ((c80.d) aVar).g(null);
                return obj;
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            c80.d dVar4 = dVar;
            th2 = th4;
            aVar = dVar4;
            ((c80.d) aVar).g(null);
            throw th2;
        }
    }
}
