package y70;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class y implements CoroutineContext.Key {

    /* renamed from: a, reason: collision with root package name */
    public final ThreadLocal f96836a;

    public y(ThreadLocal threadLocal) {
        this.f96836a = threadLocal;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y) && Intrinsics.b(this.f96836a, ((y) obj).f96836a);
    }

    public final int hashCode() {
        return this.f96836a.hashCode();
    }

    public final String toString() {
        return "ThreadLocalKey(threadLocal=" + this.f96836a + ')';
    }
}
