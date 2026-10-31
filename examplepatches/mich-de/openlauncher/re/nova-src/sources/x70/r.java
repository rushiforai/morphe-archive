package x70;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class r implements CoroutineContext {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ CoroutineContext f95263a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f95264b;

    public r(CoroutineContext coroutineContext, Throwable th2) {
        this.f95263a = coroutineContext;
        this.f95264b = th2;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return this.f95263a.fold(obj, function2);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return this.f95263a.get(key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return this.f95263a.minusKey(key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return this.f95263a.plus(coroutineContext);
    }
}
