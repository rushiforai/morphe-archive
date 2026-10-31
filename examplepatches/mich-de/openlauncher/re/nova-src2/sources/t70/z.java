package t70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class z {
    public static final CoroutineContext a(CoroutineContext coroutineContext, CoroutineContext coroutineContext2, boolean z11) {
        Boolean bool = Boolean.FALSE;
        boolean zBooleanValue = ((Boolean) coroutineContext.fold(bool, new m3.a0(12))).booleanValue();
        boolean zBooleanValue2 = ((Boolean) coroutineContext2.fold(bool, new m3.a0(12))).booleanValue();
        if (!zBooleanValue && !zBooleanValue2) {
            return coroutineContext.plus(coroutineContext2);
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = coroutineContext2;
        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
        CoroutineContext coroutineContext3 = (CoroutineContext) coroutineContext.fold(emptyCoroutineContext, new t0.s(objectRef, z11));
        if (zBooleanValue2) {
            objectRef.f71863a = ((CoroutineContext) objectRef.f71863a).fold(emptyCoroutineContext, new m3.a0(13));
        }
        return coroutineContext3.plus((CoroutineContext) objectRef.f71863a);
    }

    public static final CoroutineContext b(j0 j0Var, CoroutineContext coroutineContext) {
        CoroutineContext coroutineContextA = a(j0Var.getCoroutineContext(), coroutineContext, true);
        a80.e eVar = y0.f88884a;
        return (coroutineContextA == eVar || coroutineContextA.get(ContinuationInterceptor.f71801cp) != null) ? coroutineContextA : coroutineContextA.plus(eVar);
    }

    public static final r2 c(Continuation continuation, CoroutineContext coroutineContext, Object obj) {
        r2 r2Var = null;
        if ((continuation instanceof CoroutineStackFrame) && coroutineContext.get(s2.f88859a) != null) {
            CoroutineStackFrame callerFrame = (CoroutineStackFrame) continuation;
            while (true) {
                if ((callerFrame instanceof u0) || (callerFrame = callerFrame.getCallerFrame()) == null) {
                    break;
                }
                if (callerFrame instanceof r2) {
                    r2Var = (r2) callerFrame;
                    break;
                }
            }
            if (r2Var != null) {
                r2Var.p0(coroutineContext, obj);
            }
        }
        return r2Var;
    }
}
