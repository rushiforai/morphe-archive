package y70;

import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;
import t70.j2;

/* loaded from: classes5.dex */
public final class x implements j2 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f96833a;

    /* renamed from: b, reason: collision with root package name */
    public final ThreadLocal f96834b;

    /* renamed from: c, reason: collision with root package name */
    public final y f96835c;

    public x(Integer num, ThreadLocal threadLocal) {
        this.f96833a = num;
        this.f96834b = threadLocal;
        this.f96835c = new y(threadLocal);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        if (this.f96835c.equals(key)) {
            return this;
        }
        return null;
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    public final CoroutineContext.Key getKey() {
        return this.f96835c;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return this.f96835c.equals(key) ? EmptyCoroutineContext.f71803a : this;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }

    @Override // t70.j2
    public final void restoreThreadContext(CoroutineContext coroutineContext, Object obj) {
        this.f96834b.set(obj);
    }

    public final String toString() {
        return "ThreadLocal(value=" + this.f96833a + ", threadLocal = " + this.f96834b + ')';
    }

    @Override // t70.j2
    public final Object updateThreadContext(CoroutineContext coroutineContext) {
        ThreadLocal threadLocal = this.f96834b;
        Object obj = threadLocal.get();
        threadLocal.set(this.f96833a);
        return obj;
    }
}
