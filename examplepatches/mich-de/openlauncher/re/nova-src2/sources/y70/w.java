package y70;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.j2;

/* loaded from: classes.dex */
public abstract class w {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f96829a = new w50.g("NO_THREAD_ELEMENTS", 1);

    /* renamed from: b, reason: collision with root package name */
    public static final m3.a0 f96830b = new m3.a0(17);

    /* renamed from: c, reason: collision with root package name */
    public static final m3.a0 f96831c = new m3.a0(18);

    /* renamed from: d, reason: collision with root package name */
    public static final m3.a0 f96832d = new m3.a0(19);

    public static final void a(CoroutineContext coroutineContext, Object obj) {
        if (obj == f96829a) {
            return;
        }
        if (!(obj instanceof a0)) {
            Object objFold = coroutineContext.fold(null, f96831c);
            Intrinsics.e(objFold, "null cannot be cast to non-null type kotlinx.coroutines.ThreadContextElement<kotlin.Any?>");
            ((j2) objFold).restoreThreadContext(coroutineContext, obj);
            return;
        }
        a0 a0Var = (a0) obj;
        j2[] j2VarArr = a0Var.f96785c;
        int length = j2VarArr.length - 1;
        if (length < 0) {
            return;
        }
        while (true) {
            int i5 = length - 1;
            j2 j2Var = j2VarArr[length];
            Intrinsics.d(j2Var);
            j2Var.restoreThreadContext(coroutineContext, a0Var.f96784b[length]);
            if (i5 < 0) {
                return;
            } else {
                length = i5;
            }
        }
    }

    public static final Object b(CoroutineContext coroutineContext) {
        Object objFold = coroutineContext.fold(0, f96830b);
        Intrinsics.d(objFold);
        return objFold;
    }

    public static final Object c(CoroutineContext coroutineContext, Object obj) {
        if (obj == null) {
            obj = b(coroutineContext);
        }
        return obj == 0 ? f96829a : obj instanceof Integer ? coroutineContext.fold(new a0(((Number) obj).intValue(), coroutineContext), f96832d) : ((j2) obj).updateThreadContext(coroutineContext);
    }
}
