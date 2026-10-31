package t70;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;

/* loaded from: classes5.dex */
public abstract class d0 {
    public static Object a(p1.x0 x0Var, Object obj, Function2 function2) {
        return function2.invoke(obj, x0Var);
    }

    public static CoroutineContext.Element b(p1.x0 x0Var, CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(x0Var, key);
    }

    public static CoroutineContext c(p1.x0 x0Var, CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(x0Var, key);
    }

    public static CoroutineContext d(p1.x0 x0Var, CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(x0Var, coroutineContext);
    }
}
