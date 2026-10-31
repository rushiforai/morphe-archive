package c3;

import android.view.Choreographer;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i1 implements p1.a1 {

    /* renamed from: a, reason: collision with root package name */
    public final Choreographer f19322a;

    /* renamed from: b, reason: collision with root package name */
    public final g1 f19323b;

    public i1(Choreographer choreographer, g1 g1Var) {
        this.f19322a = choreographer;
        this.f19323b = g1Var;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }

    @Override // p1.a1
    public final Object s(Function1 function1, Continuation continuation) {
        g1 g1Var = this.f19323b;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        h1 h1Var = new h1(mVar, this, function1);
        if (Intrinsics.b(g1Var.f19288c, this.f19322a)) {
            synchronized (g1Var.f19290e) {
                try {
                    g1Var.f19292g.add(h1Var);
                    if (!g1Var.f19295j) {
                        g1Var.f19295j = true;
                        g1Var.f19288c.postFrameCallback(g1Var.f19296k);
                    }
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            mVar.v(new b4.d(5, g1Var, h1Var));
        } else {
            this.f19322a.postFrameCallback(h1Var);
            mVar.v(new b0.e(4, this, h1Var));
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }
}
