package c0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public abstract class h0 {
    public static final Object a(Function1 function1, ContinuationImpl continuationImpl) {
        c3.l2 l2Var = (c3.l2) continuationImpl.getContext().get(c3.k2.f19373a);
        if (l2Var == null) {
            return p1.b1.a(continuationImpl.getContext()).s(function1, continuationImpl);
        }
        new g0(function1, null, 0);
        return l2Var.S();
    }
}
