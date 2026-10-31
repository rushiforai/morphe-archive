package y70;

import kotlin.coroutines.CoroutineContext;
import t70.a1;
import t70.c0;
import t70.o0;
import t70.r0;

/* loaded from: classes5.dex */
public final class p extends c0 implements r0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ r0 f96820c;

    /* renamed from: d, reason: collision with root package name */
    public final c0 f96821d;

    /* renamed from: e, reason: collision with root package name */
    public final String f96822e;

    /* JADX WARN: Multi-variable type inference failed */
    public p(c0 c0Var, String str) {
        r0 r0Var = c0Var instanceof r0 ? (r0) c0Var : null;
        this.f96820c = r0Var == null ? o0.f88845a : r0Var;
        this.f96821d = c0Var;
        this.f96822e = str;
    }

    @Override // t70.r0
    public final void V(long j11, t70.m mVar) {
        this.f96820c.V(j11, mVar);
    }

    @Override // t70.r0
    public final a1 a(long j11, Runnable runnable, CoroutineContext coroutineContext) {
        return this.f96820c.a(j11, runnable, coroutineContext);
    }

    @Override // t70.c0
    public final void c0(CoroutineContext coroutineContext, Runnable runnable) {
        this.f96821d.c0(coroutineContext, runnable);
    }

    @Override // t70.c0
    public final void d0(CoroutineContext coroutineContext, Runnable runnable) {
        this.f96821d.d0(coroutineContext, runnable);
    }

    @Override // t70.c0
    public final boolean e0(CoroutineContext coroutineContext) {
        return this.f96821d.e0(coroutineContext);
    }

    @Override // t70.c0
    public final String toString() {
        return this.f96822e;
    }
}
