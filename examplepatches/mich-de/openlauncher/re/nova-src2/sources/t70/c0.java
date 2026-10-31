package t70;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.AbstractCoroutineContextKey;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class c0 extends AbstractCoroutineContextElement implements ContinuationInterceptor {

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f88778b = new b0(ContinuationInterceptor.f71801cp, new a0(0));

    public c0() {
        super(ContinuationInterceptor.f71801cp);
    }

    @Override // kotlin.coroutines.ContinuationInterceptor
    public final y70.f A(ContinuationImpl continuationImpl) {
        return new y70.f(this, continuationImpl);
    }

    public abstract void c0(CoroutineContext coroutineContext, Runnable runnable);

    @Override // kotlin.coroutines.ContinuationInterceptor
    public final void d(Continuation continuation) {
        Intrinsics.e(continuation, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<*>");
        y70.f fVar = (y70.f) continuation;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.f.f96792h;
        while (atomicReferenceFieldUpdater.get(fVar) == y70.g.f96798b) {
        }
        Object obj = atomicReferenceFieldUpdater.get(fVar);
        m mVar = obj instanceof m ? (m) obj : null;
        if (mVar != null) {
            mVar.p();
        }
    }

    public void d0(CoroutineContext coroutineContext, Runnable runnable) {
        y70.g.e(this, coroutineContext, runnable);
    }

    public boolean e0(CoroutineContext coroutineContext) {
        return !(this instanceof q2);
    }

    public c0 f0(int i5, String str) {
        y70.g.a(i5);
        return new y70.h(this, i5, str);
    }

    @Override // kotlin.coroutines.AbstractCoroutineContextElement, kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        Intrinsics.g(key, "key");
        if (key instanceof AbstractCoroutineContextKey) {
            AbstractCoroutineContextKey abstractCoroutineContextKey = (AbstractCoroutineContextKey) key;
            CoroutineContext.Key key2 = getKey();
            Intrinsics.g(key2, "key");
            if (key2 != abstractCoroutineContextKey && abstractCoroutineContextKey.f71798b != key2) {
                return null;
            }
            CoroutineContext.Element element = (CoroutineContext.Element) abstractCoroutineContextKey.f71797a.invoke(this);
            if (element instanceof CoroutineContext.Element) {
                return element;
            }
        } else if (ContinuationInterceptor.f71801cp == key) {
            return this;
        }
        return null;
    }

    @Override // kotlin.coroutines.AbstractCoroutineContextElement, kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        Intrinsics.g(key, "key");
        if (key instanceof AbstractCoroutineContextKey) {
            AbstractCoroutineContextKey abstractCoroutineContextKey = (AbstractCoroutineContextKey) key;
            CoroutineContext.Key key2 = getKey();
            Intrinsics.g(key2, "key");
            if ((key2 == abstractCoroutineContextKey || abstractCoroutineContextKey.f71798b == key2) && ((CoroutineContext.Element) abstractCoroutineContextKey.f71797a.invoke(this)) != null) {
                return EmptyCoroutineContext.f71803a;
            }
        } else if (ContinuationInterceptor.f71801cp == key) {
            return EmptyCoroutineContext.f71803a;
        }
        return this;
    }

    public String toString() {
        return getClass().getSimpleName() + '@' + m0.m(this);
    }
}
