package m6;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import t70.m0;

/* loaded from: classes2.dex */
public final class a implements AutoCloseable, j0 {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f76013a;

    public a(CoroutineContext coroutineContext) {
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f76013a = coroutineContext;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        m0.g(this.f76013a, null);
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f76013a;
    }
}
