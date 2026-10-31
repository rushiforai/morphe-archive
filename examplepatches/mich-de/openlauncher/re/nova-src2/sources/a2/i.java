package a2;

import java.util.List;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import p1.t;
import q1.k0;

/* loaded from: classes2.dex */
public final class i implements f, k0, CoroutineContext.Element {

    /* renamed from: b, reason: collision with root package name */
    public static final h f111b = new h();

    /* renamed from: a, reason: collision with root package name */
    public final t f112a;

    public i(t tVar) {
        this.f112a = tVar;
    }

    public final boolean a(Object obj, Throwable th2) {
        return e.b(th2, new g(0, this, obj));
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    public final CoroutineContext.Key getKey() {
        return f111b;
    }

    @Override // q1.k0
    public final List i(Integer num) {
        return this.f112a.I();
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }
}
