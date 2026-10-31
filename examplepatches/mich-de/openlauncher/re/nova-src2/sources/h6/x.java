package h6;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class x implements y, t70.j0 {

    /* renamed from: a, reason: collision with root package name */
    public final u f59467a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f59468b;

    public x(u uVar, CoroutineContext coroutineContext) {
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f59467a = uVar;
        this.f59468b = coroutineContext;
        if (uVar.b() == t.f59440a) {
            t70.m0.g(coroutineContext, null);
        }
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        u uVar = this.f59467a;
        if (uVar.b().compareTo(t.f59440a) <= 0) {
            uVar.c(this);
            t70.m0.g(this.f59468b, null);
        }
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f59468b;
    }
}
