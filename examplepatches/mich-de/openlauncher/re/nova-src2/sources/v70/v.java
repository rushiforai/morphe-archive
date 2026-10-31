package v70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import t70.q1;

/* loaded from: classes.dex */
public abstract class v {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(x xVar, Function0 function0, Continuation continuation) {
        u uVar;
        if (continuation instanceof u) {
            uVar = (u) continuation;
            int i5 = uVar.f92200v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uVar.f92200v = i5 - Integer.MIN_VALUE;
            } else {
                uVar = new u(continuation);
            }
        }
        Object obj = uVar.f92199u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uVar.f92200v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (uVar.getContext().get(q1.f88853a) != xVar) {
                    throw new IllegalStateException("awaitClose() can only be invoked from the producer context");
                }
                uVar.f92198t = function0;
                uVar.f92200v = 1;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(uVar));
                mVar.t();
                ((w) xVar).m0(new f20.h(mVar, 5));
                if (mVar.s() == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                function0 = uVar.f92198t;
                ResultKt.b(obj);
            }
            function0.invoke();
            return Unit.f71706a;
        } catch (Throwable th2) {
            function0.invoke();
            throw th2;
        }
    }
}
