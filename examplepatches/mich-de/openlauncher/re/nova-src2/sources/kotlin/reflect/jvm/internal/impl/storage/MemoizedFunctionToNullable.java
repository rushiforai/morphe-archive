package kotlin.reflect.jvm.internal.impl.storage;

import kotlin.jvm.functions.Function1;

/* loaded from: classes5.dex */
public interface MemoizedFunctionToNullable<P, R> extends Function1<P, R> {
    @Override // kotlin.jvm.functions.Function1
    /* synthetic */ Object invoke(Object obj);

    boolean isComputed(P p11);
}
