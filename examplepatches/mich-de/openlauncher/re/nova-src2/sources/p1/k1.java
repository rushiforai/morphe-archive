package p1;

import java.util.ArrayList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class k1 implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final a1 f81463a;

    /* renamed from: b, reason: collision with root package name */
    public final androidx.room.h f81464b = new androidx.room.h();

    public k1(a1 a1Var) {
        this.f81463a = a1Var;
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

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // p1.a1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object s(Function1 function1, Continuation continuation) {
        j1 j1Var;
        boolean z11;
        Object objS;
        if (continuation instanceof j1) {
            j1Var = (j1) continuation;
            int i5 = j1Var.f81462w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j1Var.f81462w = i5 - Integer.MIN_VALUE;
            } else {
                j1Var = new j1(this, continuation);
            }
        }
        Object obj = j1Var.f81460u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j1Var.f81462w;
        if (i11 == 0) {
            ResultKt.b(obj);
            androidx.room.h hVar = this.f81464b;
            j1Var.f81459t = function1;
            j1Var.f81462w = 1;
            synchronized (hVar.f15219b) {
                z11 = hVar.f15218a;
            }
            if (z11) {
                objS = Unit.f71706a;
            } else {
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(j1Var));
                mVar.t();
                synchronized (hVar.f15219b) {
                    ((ArrayList) hVar.f15220c).add(mVar);
                }
                mVar.v(new c9.h(5, hVar, mVar));
                objS = mVar.s();
                if (objS != coroutineSingletons) {
                    objS = Unit.f71706a;
                }
            }
            if (objS != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        function1 = j1Var.f81459t;
        ResultKt.b(obj);
        a1 a1Var = this.f81463a;
        j1Var.f81459t = null;
        j1Var.f81462w = 2;
        Object objS2 = a1Var.s(function1, j1Var);
        return objS2 == coroutineSingletons ? coroutineSingletons : objS2;
    }
}
