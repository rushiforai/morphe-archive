package t70;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public abstract class p2 {
    public static final Object a(n2 n2Var, Function2 function2) {
        m0.p(n2Var, new b1(t0.d(n2Var.f96824d.getContext()).a(n2Var.f88842e, n2Var, n2Var.f88769c), 0));
        return w20.e.r(n2Var, false, n2Var, function2);
    }

    public static final Object b(long j11, Function2 function2, Continuation continuation) {
        if (j11 <= 0) {
            throw new TimeoutCancellationException("Timed out immediately", null);
        }
        Object objA = a(new n2(j11, continuation), function2);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objA;
    }

    public static final Object c(long j11, Function2 function2, ContinuationImpl continuationImpl) {
        return b(t0.e(j11), function2, continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(long j11, Function2 function2, Continuation continuation) {
        o2 o2Var;
        Ref.ObjectRef objectRef;
        if (continuation instanceof o2) {
            o2Var = (o2) continuation;
            int i5 = o2Var.f88849v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o2Var.f88849v = i5 - Integer.MIN_VALUE;
            } else {
                o2Var = new o2(continuation);
            }
        }
        Object obj = o2Var.f88848u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o2Var.f88849v;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (j11 <= 0) {
                return null;
            }
            Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
            try {
                o2Var.f88847t = objectRef2;
                o2Var.f88849v = 1;
                n2 n2Var = new n2(j11, o2Var);
                objectRef2.f71863a = n2Var;
                Object objA = a(n2Var, function2);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            } catch (TimeoutCancellationException e3) {
                e = e3;
                objectRef = objectRef2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = o2Var.f88847t;
            try {
                ResultKt.b(obj);
                return obj;
            } catch (TimeoutCancellationException e11) {
                e = e11;
            }
        }
        if (e.f72061a == objectRef.f71863a) {
            return null;
        }
        throw e;
    }

    public static final Object e(long j11, Function2 function2, ContinuationImpl continuationImpl) {
        return d(t0.e(j11), function2, continuationImpl);
    }
}
