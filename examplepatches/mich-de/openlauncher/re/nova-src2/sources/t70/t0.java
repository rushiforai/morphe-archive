package t70;

import kotlin.KotlinNothingValueException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes.dex */
public abstract class t0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(ContinuationImpl continuationImpl) {
        s0 s0Var;
        if (continuationImpl instanceof s0) {
            s0Var = (s0) continuationImpl;
            int i5 = s0Var.f88857u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s0Var.f88857u = i5 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(continuationImpl);
            }
        }
        Object obj = s0Var.f88856t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s0Var.f88857u;
        if (i11 == 0) {
            ResultKt.b(obj);
            s0Var.f88857u = 1;
            m mVar = new m(1, IntrinsicsKt.b(s0Var));
            mVar.t();
            if (mVar.s() == coroutineSingletons) {
                return;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        throw new KotlinNothingValueException();
    }

    public static final Object b(long j11, Continuation continuation) {
        if (j11 <= 0) {
            return Unit.f71706a;
        }
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        if (j11 < Long.MAX_VALUE) {
            d(mVar.f88824e).V(j11, mVar);
        }
        Object objS = mVar.s();
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    public static final Object c(long j11, Continuation continuation) {
        Object objB = b(e(j11), continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    public static final r0 d(CoroutineContext coroutineContext) {
        CoroutineContext.Element element = coroutineContext.get(ContinuationInterceptor.f71801cp);
        r0 r0Var = element instanceof r0 ? (r0) element : null;
        return r0Var == null ? o0.f88845a : r0Var;
    }

    public static final long e(long j11) {
        Duration.Companion companion = Duration.f72038b;
        boolean z11 = j11 > 0;
        if (z11) {
            return Duration.h(Duration.m(j11, DurationKt.h(999999L, DurationUnit.f72043b)));
        }
        if (z11) {
            throw new NoWhenBranchMatchedException();
        }
        return 0L;
    }
}
