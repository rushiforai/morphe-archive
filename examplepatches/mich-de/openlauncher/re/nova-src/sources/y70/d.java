package y70;

import kotlin.coroutines.CoroutineContext;
import t70.j0;

/* loaded from: classes.dex */
public final class d implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f96790a;

    public d(CoroutineContext coroutineContext) {
        this.f96790a = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f96790a;
    }

    public final String toString() {
        return "CoroutineScope(coroutineContext=" + this.f96790a + ')';
    }
}
